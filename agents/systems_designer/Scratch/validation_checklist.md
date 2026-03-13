# Validation Checklist - Breathing Hole Hazard V2

**Agent:** Systems Designer  
**Date:** 2026-03-13  
**Files:**
- `scripts/hazards/breathing_hole.gd`
- `scenes/hazards/breathing_hole.tscn`

---

## GDScript Validation

- [x] File uses `class_name BreathingHole` at top
- [x] Extends appropriate base class (`Area3D`)
- [x] All functions have type hints for parameters and return values
- [x] Uses `@export` for configurable values (damage_per_tick, durations)
- [x] Signals defined for important events (`state_changed`, `player_damaged`, `visual_color_changed`)
- [x] No obvious syntax errors (brackets match, colons present)
- [x] File path follows convention: `scripts/hazards/breathing_hole.gd`

## TSCN Validation

- [x] `load_steps` count verified: **3** (1 ext_resource + 2 sub_resources)
- [x] All ext_resource IDs are unique and sequential (`1_breathing_hole`)
- [x] All sub_resource IDs are unique (`BoxShape_hazard_zone`, `BoxMesh_visual`)
- [x] All resource references match defined IDs exactly
- [x] Transform values have exactly 12 numbers
- [x] Color values use Color(r, g, b, a) format with 0.0-1.0 values (in GDScript)
- [x] Node parent paths are correct ("." for root)
- [x] File path follows convention: `scenes/hazards/breathing_hole.tscn`

### Manual Count Verification

```bash
# ext_resource count: 1
grep -c "^\[ext_resource" scenes/hazards/breathing_hole.tscn  # Result: 1

# sub_resource count: 2
grep -c "^\[sub_resource" scenes/hazards/breathing_hole.tscn   # Result: 2

# load_steps in header: 3 (1 + 2 = 3) ✓
head -1 scenes/hazards/breathing_hole.tscn  # Shows: load_steps=3
```

## State Machine Verification

- [x] Enum defined: `State {DORMANT, WARNING, ACTIVE, DISSIPATE}`
- [x] Initial state: `State.DORMANT`
- [x] State transitions: DORMANT → WARNING → ACTIVE → DISSIPATE → DORMANT
- [x] Durations configured: 4s, 1s, 3s, 2s
- [x] Damage only during ACTIVE state
- [x] Timer-based transitions (one-shot, auto-chain)

## Code Quality Checks

- [x] Clean signal connections (using `connect()` method)
- [x] Proper cleanup in `_exit_tree()` (timers stopped)
- [x] Type-safe arrays: `Array[Node3D]`
- [x] Dictionary with explicit types for colors
- [x] Typed match statements

## Player Integration

- [x] Player controller already has `take_damage(amount: int)` method
- [x] Player controller has `heal(amount: int)` method
- [x] Player controller has health/max_health variables
- [x] Hazard detects player by group "player" or name "Player"

## Spec Compliance (Native_Starter_Blockout_Spec_v1.md §5.1)

| Spec Requirement | Implementation | Status |
|------------------|----------------|--------|
| 4s DORMANT | `dormant_duration = 4.0` | ✓ |
| 1s WARNING | `warning_duration = 1.0` | ✓ |
| 3s ACTIVE | `active_duration = 3.0` | ✓ |
| 2s DISSIPATE | `dissipate_duration = 2.0` | ✓ |
| 5 HP damage | `damage_per_tick = 5` | ✓ |
| 12m x 8m zone | BoxShape3D size = Vector3(12, 2, 8) | ✓ |
| State loop | DORMANT → WARNING → ACTIVE → DISSIPATE → DORMANT | ✓ |

## Notes

- **Simplified from V1:** Removed safe path detection, multiple vent meshes, debug visualization
- **Rationale:** Following Doctrine - "SIMPLE is better than complex"
- **Visual feedback:** Signal-based (visual_color_changed) for decoupling
- **Testing:** Use `force_state(State.ACTIVE)` to test damage system

## Sign-off

**Status:** ✅ VALIDATED  
**Ready for:** Human testing in Godot  
**Load Steps:** 3 (verified)  
**Syntax:** No obvious errors
