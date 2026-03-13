# Engine Pivot — Godot 4.x Active
**Date:** March 12, 2026  
**Status:** LOCKED — Studio-Wide Mandate

---

## Pivot Summary

Project Avalon has migrated from **Unreal Engine 5.7** to **Godot 4.x** as the active implementation engine.

### Why
UE5's binary asset format (.umap, .uasset, Blueprint) prevented agent automation. Godot's text-based formats (.tscn, .gd, .tres) enable AI agents to directly read, write, and modify all game content.

### Active Stack (LOCKED)
| Component | Tool | Purpose |
|-----------|------|---------|
| Engine | Godot 4.3+ | Core runtime |
| Terrain | Terrain3D | Heightmap-based terrain |
| Scattering | ProtonScatter | Vegetation/placement scattering |
| Scripting | GDScript | Gameplay systems |
| Scenes | .tscn | Text-editable scene files |
| Resources | .tres | Text-editable materials, configs |
| Data | JSON | Tables, quest data, configurations |

---

## What's Deprecated (Do Not Use)

| UE5 Concept | Status | Replacement |
|-------------|--------|-------------|
| .umap files | ❌ DEPRECATED | .tscn scenes |
| Blueprint | ❌ DEPRECATED | GDScript (.gd) |
| World Partition | ❌ DEPRECATED | StreamingManager (custom GDScript) |
| Data Tables | ❌ DEPRECATED | JSON + Dictionary |
| C++ | ❌ DEPRECATED | GDScript |
| UE Editor workflow | ❌ DEPRECATED | Direct file manipulation |
| UE5 Foundation Specs | ❌ DEPRECATED | Godot specs (to be written) |
| G1-G4 Gap Report | ❌ DEPRECATED | Godot implementation path |

**Legacy Location:** `/projectavalon/UE5Project/` — frozen, reference-only

---

## What's Still Valid (Engine-Agnostic)

| Category | Docs | Status |
|----------|------|--------|
| World Bible | Peoples, Geography, Lore | ✅ VALID |
| Game Design | Classes, Combat Philosophy, Progression | ✅ VALID |
| Quest Specs | Native Starter Quest Loop | ✅ VALID (implementation changes) |
| Agent Charters | Roles, Boundaries | ✅ VALID (context update needed) |
| Production Rules | Output protocol, Status labels | ✅ VALID |
| Project Pillars | Seamless world, Planetary, 1-5 slice | ✅ VALID |
| NCFP Scope | Hearthroot, Shellmound, Breathing Holes, Waymarker | ✅ VALID |

---

## New Implementation Patterns

### Creating a Scene
```ini
# scenes/my_scene.tscn — TEXT EDITABLE
[gd_scene load_steps=2 format=3]
[ext_resource type="Script" path="res://scripts/my_script.gd" id="1"]
[node name="MyNode" type="Node3D"]
script = ExtResource("1")
```

### Writing a Script
```gdscript
# scripts/my_script.gd — AGENTS WRITE THIS DIRECTLY
extends Node3D
@export var my_var: float = 5.0
func _ready():
    pass
```

### Defining Data
```json
// resources/data/quests.json — TEXT EDITABLE
{
  "quest_id": "native_starter_001",
  "title": "The Breath of Home",
  "objectives": [...]
}
```

---

## Migration Status

| Phase | Status | Notes |
|-------|--------|-------|
| Foundation | ✅ COMPLETE | Project structure, streaming, player controller |
| Docs Migration | ✅ COMPLETE | Core design docs copied |
| Agent Bootstraps | 🔄 IN PROGRESS | Technical Architect first |
| Native Starter Zone | 🔄 NEXT | G3/G4 equivalent implementation |
| Multiplayer | ⏳ PENDING | Custom network layer (future) |
| HLOD/LOD | ⏳ PENDING | Custom implementation (future) |

---

## Repo Location

**Active Implementation:**
https://github.com/eledrinn/projectavalon-godot

**Local Path:**
`/home/cada/.openclaw/workspace/projectavalon-godot/`

**Legacy UE5:**
`/home/cada/.openclaw/workspace/projectavalon/` — DO NOT MODIFY

---

## Next Actions

1. ✅ Create ENGINE_PIVOT.md (this file)
2. 🔄 Update Technical Architect BOOTSTRAP.md
3. ⏳ Update remaining agent bootstraps (setup-architect, prototype-builder, etc.)
4. ⏳ Implement G3 equivalent: Breathing Hole hazard
5. ⏳ Implement G4 equivalent: Quest system

---

## Agent Directive

**All agents:**
- Read this file first on any new session
- Target Godot 4.x for all implementation
- Reference UE5 docs for design intent only
- Write GDScript, not Blueprint
- Create .tscn, not .umap
- Use JSON for data, not Data Tables

**Questions?** Escalate to Director (canon-keeper).

---

*Engine pivot locked. Godot is the path forward.*
