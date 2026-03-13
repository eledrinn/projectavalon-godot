# UE5 → Godot Migration Guide

## What Changed

| UE5 Concept | Godot Equivalent | Notes |
|-------------|------------------|-------|
| World Partition | `StreamingManager` | Custom GDScript implementation in `scripts/streaming/` |
| Blueprint | GDScript | Full text-based scripting (.gd files) |
| .umap | .tscn | Text-editable scene files |
| Data Tables | JSON + custom loader | `resources/data/` folder |
| Actor | Node3D | Base class for world objects |
| Character | CharacterBody3D | Player/NPC base class |
| GameMode | GameManager | Custom singleton in `scripts/core/` |
| Level | Scene | .tscn files loaded as needed |

## Project Structure Changes

### UE5 Path → Godot Path

```
/Content/World/Regions/Native_Starter/ → /scenes/world/regions/native_starter.tscn
/Content/Blueprints/Player/          → /scripts/player/player_controller.gd
/Content/Data/Quests/                → /resources/data/quests.json
/Source/Avalon/                      → /scripts/core/
```

## Streaming Architecture

### UE5 World Partition → Godot StreamingManager

**UE5 approach:**
- Grid-based cells (128m)
- Automatic loading based on streaming volumes
- Built-in HLOD

**Godot approach:**
- `StreamingManager` singleton
- Chunk-based loading (configurable size)
- Manual LOD management (future)

**Key differences:**
1. Godot loads entire scenes, not individual actors
2. No built-in HLOD — need custom implementation
3. No automatic cell subdivision — regions are monolithic scenes

## Agent Workflow Changes

### What Agents Can Do Now

| Task | UE5 | Godot |
|------|-----|-------|
| Create scenes | ❌ Binary .umap | ✅ Text .tscn |
| Write scripts | ❌ C++ compile required | ✅ GDScript interpreted |
| Modify properties | ❌ Editor required | ✅ Edit .tscn directly |
| Add nodes | ❌ Manual placement | ✅ Script instantiation |
| Data tables | ❌ Blueprint structs | ✅ JSON + dictionaries |

### Example: Creating a New Hazard

**UE5 approach:**
1. Open Editor
2. Create Blueprint
3. Add components visually
4. Compile
5. Save .uasset

**Godot approach:**
```gdscript
# scripts/hazards/breathing_hole.gd
class_name BreathingHole
extends Area3D

@export var damage_per_tick: float = 5.0
@export var active_duration: float = 3.0
@export var warning_duration: float = 1.0

func _ready():
	# Setup collision, visuals, timers via code
	pass
```

Agent writes this file directly → works immediately.

## Known Limitations

### Not Yet Implemented (Future Work)

1. **True seamless streaming** — Currently loads whole regions
2. **HLOD / LOD streaming** — Manual distance checks needed
3. **Multiplayer replication** — Requires custom network layer
4. **Procedural terrain** — Heightmaps or mesh generation needed
5. **Large world coordinates** — Floating origin needed for globe scale

### Acceptable Trade-offs

- **Visual fidelity:** Godot Forward+ is capable but not UE5 Nanite/Lumen
- **Asset pipeline:** No built-in Quixel/MetaHuman integration
- **Marketplace:** Smaller asset ecosystem

## Next Steps

1. ✅ Foundation structure complete
2. 🔄 Implement breathing hole hazard (G3 equivalent)
3. 🔄 Implement quest system (G4 equivalent)
4. 🔄 Add basic multiplayer foundation
5. 🔄 Create native starter zone content

## File Format Reference

### .tscn (Scene)
```ini
[gd_scene load_steps=2 format=3]
[ext_resource path="res://script.gd" id="1"]
[node name="NodeName" type="NodeType"]
transform = Transform3D(...)
```

### .gd (GDScript)
```gdscript
extends Node3D
@export var my_variable: int = 5
func _ready():
    pass
```

### .tres (Resource)
```ini
[gd_resource type="Material" format=3]
[resource]
albedo_color = Color(1, 0, 0, 1)
```

---

*Migration Status: Foundation Complete | Phase: Native Starter Implementation*
