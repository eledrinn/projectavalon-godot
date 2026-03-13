# Breathing Hole Hazard V2 - Design Notes

**Agent:** Systems Designer  
**Date:** 2026-03-13  
**Status:** Complete  
**Responds To:** Native Starter Blockout Spec v1 §5.1

---

## Design Philosophy

This V2 rebuild follows the **Godot Implementation Doctrine v1** strictly:
- **SIMPLE is better than complex**
- **Working is better than feature-rich**
- Minimal node hierarchy, clear state machine

## Changes from V1

| Aspect | V1 | V2 |
|--------|----|----|
| Node count | 6+ nodes | 3 nodes (Area3D + Collision + Mesh) |
| Safe path | Complex detection | Removed (simplify) |
| Vent meshes | Multiple children | Single visual indicator |
| Debug features | Safe path marker | Removed |
| Code lines | ~400 | ~160 |

## State Machine

```
DORMANT (4s) → WARNING (1s) → ACTIVE (3s) → DISSIPATE (2s) → [loop]
   Green           Yellow         Red            Gray
   Safe            Telegraph      Damage         Fading
```

## Damage Spec

- **Per tick:** 5 HP
- **Tick rate:** 1 second
- **Only during:** ACTIVE state
- **Player detection:** body_entered/body_exited signals

## Visual Feedback

The `visual_color_changed(color)` signal allows the scene's MeshInstance3D to update its material based on state. This keeps visual logic decoupled from the hazard logic.

## TSCN Structure

```
Area3D (BreathingHole) [script attached]
├── CollisionShape3D (HazardZone) - BoxShape3D 12x2x8
└── MeshInstance3D (VisualIndicator) - BoxMesh 12x0.5x8
```

## Validation

See `validation_checklist.md` for completed checklist.

## Integration Notes

1. Place in `scenes/hazards/breathing_hole.tscn`
2. Position at BreathingHoles landmark (spec: 12m x 8m depression)
3. Player must be in "player" group or named "Player" for detection
4. Player controller requires `take_damage(amount: int)` method

## Known Limitations

- No safe path detection (simplified for V2)
- Single visual mesh instead of multiple vents
- No audio cues (can be added by connecting to state_changed signal)
