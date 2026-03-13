# Breathing Hole Hazard System Design

## Agent Output Protocol Header

| Field | Value |
|-------|-------|
| **System** | Breathing Hole Hazard |
| **Status** | ✅ Implemented |
| **Spec Ref** | Native_Starter_Blockout_Spec_v1.md §5.1 |
| **Quest Ref** | Native_Starter_Quest_Loop_v1.md §4. HAZARD |
| **Files** | `scripts/hazards/breathing_hole.gd`, `scenes/hazards/breathing_hole.tscn` |

---

## Overview

The Breathing Hole hazard system introduces environmental hazard literacy in the Native Starter wetland slice. Located at the BreathingHoles landmark (90, -5, 40), this 12m x 8m depression contains 5 gas vents that periodically emit toxic gas clouds.

### Design Goals

1. **Learnable Pattern**: Player can observe timing and avoid damage
2. **Visual Cues**: Warning state gives time to react (1 second telegraph)
3. **Safe Path**: N-S path through hazard zone avoids damage when gas is active
4. **Fair**: Timing is consistent, damage is telegraphed

---

## State Machine

```
┌─────────┐    4s     ┌─────────┐   1s    ┌─────────┐   3s    ┌─────────┐   2s    ┌─────────┐
│ DORMANT │ ────────▶ │ WARNING │ ──────▶ │ ACTIVE  │ ──────▶ │DISSIPATE│ ──────▶ │ DORMANT │
└─────────┘           └─────────┘         └─────────┘         └─────────┘         └─────────┘
   (Safe)              (Telegraph)         (Danger)           (Cooldown)           (Safe)
   Green               Yellow/Orange       Red/Dark           Gray
```

| Phase | Duration | Visual | Audio | Player Risk |
|-------|----------|--------|-------|-------------|
| Dormant | 4s | Green glow, gentle bubbling | Low gurgle | None |
| Warning | 1s | Yellow/Orange, shimmer | Rising tone | None (1s to escape) |
| Active | 3s | Red/Dark, gas eruption | Hiss + whoosh | 5 HP/tick |
| Dissipate | 2s | Gray, fading | Fading wind | None |

**Total Cycle**: 10 seconds (4+1+3+2)

---

## Technical Implementation

### Class: `BreathingHole` extends `Area3D`

#### Configurable Exports

| Property | Default | Description |
|----------|---------|-------------|
| `dormant_duration` | 4.0s | Safe window duration |
| `warning_duration` | 1.0s | Telegraph duration |
| `active_duration` | 3.0s | Danger window duration |
| `dissipate_duration` | 2.0s | Cooldown duration |
| `damage_per_tick` | 5 | HP lost per tick during ACTIVE |
| `damage_tick_rate` | 1.0s | Seconds between damage ticks |
| `safe_path_width` | 2.0m | Width of safe N-S corridor |

#### Signals

```gdscript
signal state_changed(new_state: HazardState, old_state: HazardState)
signal player_entered_hazard(player: Node3D)
signal player_exited_hazard(player: Node3D)
signal player_damaged(player: Node3D, damage: int)
```

#### Public API

```gdscript
func get_current_state() -> HazardState
func get_current_state_name() -> String  # "DORMANT", "WARNING", "ACTIVE", "DISSIPATE"
func is_player_in_hazard(player: Node3D) -> bool
func is_player_on_safe_path(player: Node3D) -> bool
func force_state(new_state: HazardState)  # For testing
func reset_cycle()  # Reset to DORMANT
func get_cycle_count() -> int  # Number of completed cycles
func get_players_in_hazard() -> Array  # All players currently in zone
```

---

## Safe Path System

The safe path runs **North-South** through the center of the hazard zone:

```
        N
        │
    ┌───┼───┐
    │   │   │  ◄── Safe Path (2m wide, center X=0)
    │ ══╪══ │  ◄══ Hazard Zone (12m x 8m)
    │   │   │
    └───┼───┘
        │
        S
```

- Safe path is centered on X=0 axis
- Width: 2 meters (configurable via `safe_path_width`)
- Players on the safe path take **no damage** even during ACTIVE state
- Safe path markers (green cylinders) provide visual guidance

---

## Player Controller Integration

The `PlayerController` has been updated with health/damage methods:

```gdscript
func take_damage(amount: int) -> void
func heal(amount: int) -> void
func get_health() -> int
func get_max_health() -> int
func get_health_percent() -> float
```

The BreathingHole automatically calls `take_damage()` on any body entering the hazard that has this method.

---

## Scene Structure

```
BreathingHoles (Node3D) @ (90, -5, 40)
├── HazardCenter (Marker3D)
├── SafePathSouth (Marker3D)
├── SafePathNorth (Marker3D)
└── BreathingHoleHazard (BreathingHole) @ (0, 0, 0)
    ├── HazardZone (CollisionShape3D) - 12x2x8m trigger
    ├── VisualIndicator (MeshInstance3D) - Color feedback
    ├── VentMeshes (Node3D)
    │   ├── Vent1 @ (-3, 0.1, -2)
    │   ├── Vent2 @ (3, 0.1, -2)
    │   ├── Vent3 @ (0, 0.1, 0)  # Center vent
    │   ├── Vent4 @ (-3, 0.1, 2)
    │   └── Vent5 @ (3, 0.1, 2)
    ├── SafePathMarker (MeshInstance3D) - Debug visualization
    ├── StateTimer (Timer)
    └── DamageTimer (Timer)
```

---

## Quest Integration

From `Native_Starter_Quest_Loop_v1.md`:

> **Objective:** Navigate the Breathing Hole area while avoiding toxic gas emissions

The hazard gates access to Breathpearl gatherables. Players must:
1. Observe the gas cycle timing
2. Time their movements between safe windows
3. Use the safe N-S path for traversal
4. Gather Breathpearls during DORMANT phase

**Shellkeeper Elder Hint:**
> *"The holes breathe in cycles. Watch the wind. Listen. The safe path reveals itself to the patient."*

---

## Testing Notes

### Manual Test Checklist

- [ ] Hazard cycles through all 4 states correctly
- [ ] Visual color changes match current state
- [ ] Player takes damage only during ACTIVE state
- [ ] Player on safe path takes no damage
- [ ] `state_changed` signal fires correctly
- [ ] `player_entered_hazard` / `player_exited_hazard` signals fire
- [ ] `player_damaged` signal fires with correct damage amount
- [ ] Cycle timing matches spec (4→1→3→2 seconds)

### Debug Commands

```gdscript
# Force specific state (for testing)
$BreathingHoleHazard.force_state(BreathingHole.HazardState.ACTIVE)

# Reset cycle
$BreathingHoleHazard.reset_cycle()

# Check current state
print($BreathingHoleHazard.get_current_state_name())

# Enable safe path visualization
$BreathingHoleHazard.safe_path_debug = true
```

---

## Future Enhancements

### Foundation Phase
- [ ] Audio cues (warning tone, gas eruption, ambient gurgle)
- [ ] Particle effects for gas clouds
- [ ] Screen-space damage indicator (red vignette)

### Full Implementation
- [ ] Volumetric gas clouds
- [ ] Dynamic lighting on gas
- [ ] NPC avoidance behavior
- [ ] Gatherable Breathpearls that spawn during DORMANT

---

## Evidence

| Evidence Type | Location |
|--------------|----------|
| Implementation | `scripts/hazards/breathing_hole.gd` |
| Scene | `scenes/hazards/breathing_hole.tscn` |
| Integration | `scenes/world/regions/native_starter.tscn` |
| Player Health | `scripts/player/player_controller.gd` |
| Design Doc | `agents/systems_designer/Scratch/breathing_hole_design.md` (this file) |

---

*Document Version: 1.0*
*Systems Designer Agent*
*Date: 2026-03-13*
