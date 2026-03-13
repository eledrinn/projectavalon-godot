# Godot Implementation Doctrine v1
**Project Avalon | Production | Engine Standards**

**Status:** LOCKED  
**Date:** March 13, 2026  
**Applies To:** All engine-facing agents  
**Authority:** Technical Architect, Director

---

## Purpose

Define the core philosophy and workflow patterns for Godot 4.x implementation in Project Avalon. This document governs WHEN and HOW to use each Godot capability — not just technical syntax, but strategic approach.

**Read this first** before any engine-facing work.

---

## The Three-Tier System

Godot provides three ways to implement features. This doctrine defines when to use each:

| Tier | Format | Use For | Agent Ownership |
|------|--------|---------|-----------------|
| **Tier 1: GDScript** | `.gd` files | Gameplay systems, logic, state machines | Systems Designer, Technical Architect |
| **Tier 2: Data** | `.json`, `.tres` | Configuration, tables, content | Systems Designer, Content Integrator |
| **Tier 3: Scenes** | `.tscn` | Composition, spatial relationships, visuals | Worldbuilder, Prototype Builder |

### Decision Matrix

| Task | Right Approach | Wrong Approach |
|------|---------------|----------------|
| Quest state machine | GDScript class with state enum | Scene nodes for each state |
| Item database | JSON file + loader | Hardcoded in GDScript or scene |
| NPC dialogue | Dialogic timeline (.dtl) | Custom scene nodes per line |
| Level geometry | `.tscn` with MeshInstance3D | Procedural mesh generation in GDScript |
| Player health | GDScript variable + signals | Scene node tree for HP tracking |
| Enemy AI behavior | GDScript + LimboAI behavior tree | Nested scene nodes for each behavior |

---

## The Text-First Principle

**Core Truth:** Agents can only reliably produce text. Godot scenes are text, but they're validated at runtime.

### What Agents CAN Do Reliably
- Write GDScript (parsed at load time, errors are clear)
- Write JSON data (no validation until used)
- Write `.tscn` files that follow strict patterns (see Godot_TSCN_Standards_v1.md)

### What Requires Human Validation
- Complex scene hierarchies with many nested nodes
- Visual positioning that "looks right"
- Plugin-specific node configurations (Terrain3D, ProtonScatter)

### Workflow Rule
1. Agent writes text file
2. Human loads in Godot, validates
3. If error, fix and document in Do/Dont
4. Commit only working scenes

---

## The Validation Gate

**No scene file commits without passing Godot_Output_Validation_Checklist_v1.md**

Every agent must:
1. Write the file
2. Run mental validation against TSCN Standards
3. Check against the Validation Checklist
4. Document any assumptions

---

## Engine-Specific Patterns

### GDScript Patterns (Tier 1)
```gdscript
# ALWAYS use class_name
class_name MySystem
extends Node

# ALWAYS use @export for configurable values
@export var config_value: float = 5.0

# ALWAYS type hints
func process_damage(amount: int, target: Node) -> void:
    pass

# ALWAYS use signals for decoupling
signal health_changed(new_health: int)
```

### Data Patterns (Tier 2)
```json
{
  "id": "quest_001",
  "title": "The Breath of Home",
  "prerequisites": [],
  "objectives": [
    {"type": "gather", "item": "breathpearl", "count": 3}
  ]
}
```

### Scene Patterns (Tier 3)
See Godot_TSCN_Standards_v1.md for exact syntax.

---

## Anti-Patterns (DO NOT)

| Anti-Pattern | Why Broken | Correct Approach |
|--------------|-----------|------------------|
| Complex node trees in GDScript | Unreadable, unmaintainable | Build in scene, reference in script |
| Hardcoded content in GDScript | Can't modify without code change | JSON data files |
| Scene logic that should be GDScript | Scene files become fragile | Node + attached script |
| Agents writing visual polish | They can't see the result | Agents write structure, humans refine visuals |
| Skipping validation checklist | Commits broken scenes | Mandatory checklist completion |

---

## Plugin Integration Rules

### Terrain3D
- Agent writes: Heightmap images, layer configuration JSON
- Human builds: Terrain3D node in editor, applies heightmap
- See: Terrain3D_Operational_Rules_v1.md

### ProtonScatter
- Agent writes: Scatter rules JSON, item definitions
- Human builds: ProtonScatter node, configures in editor
- See: ProtonScatter_Operational_Rules_v1.md

### Dialogic
- Agent writes: Timeline text (.dtl), character definitions
- Human places: Dialogic nodes in scene
- Dialogic files are text — agents CAN write these

---

## Escalation Path

**When an agent hits ambiguity:**
1. Check Godot_TSCN_Standards_v1.md for syntax
2. Check Godot_Worldbuilding_DoDont_v1.md for patterns
3. If still unclear, escalate to Technical Architect
4. If design-vs-engineering conflict, escalate to Director

**Never guess.** Documented patterns exist for a reason.

---

## Document References

| Doc | What It Covers |
|-----|----------------|
| Godot_TSCN_Standards_v1.md | Exact `.tscn` syntax, validation rules |
| Godot_Output_Validation_Checklist_v1.md | Mandatory pre-commit checks |
| Terrain3D_Operational_Rules_v1.md | Terrain plugin workflows |
| ProtonScatter_Operational_Rules_v1.md | Scattering plugin workflows |
| Godot_Worldbuilding_DoDont_v1.md | Specific patterns that work vs break |

---

*This is the foundation. Read the standards before writing scenes.*
