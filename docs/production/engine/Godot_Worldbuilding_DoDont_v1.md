# Godot Worldbuilding Do/Don't v1
**Project Avalon | Production | Engine Standards**

**Status:** LOCKED  
**Date:** March 13, 2026  
**Applies To:** Worldbuilder, Prototype Builder, Content Integrator  
**Purpose:** Specific patterns that work vs. patterns that break in Godot scene building.

---

## DO: Patterns That Work

### DO: Use Simple Node Hierarchies
```ini
[node name="Landmark" type="Node3D"]

[node name="Visuals" type="Node3D" parent="."]
[node name="Mesh1" type="MeshInstance3D" parent="Visuals"]
[node name="Mesh2" type="MeshInstance3D" parent="Visuals"]

[node name="Collision" type="StaticBody3D" parent="."]
[node name="Shape" type="CollisionShape3D" parent="Collision"]
```
**Why:** Clear organization, easy to understand, validates in Godot.

### DO: Use Descriptive Node Names
```ini
[node name="HearthrootOverhang" type="MeshInstance3D"]
[node name="ShellmoundMound" type="MeshInstance3D"]
[node name="BreathingHoleVent01" type="MeshInstance3D"]
```
**Why:** Self-documenting, easier debugging, clear purpose.

### DO: Use Placeholder Materials with Colors
```ini
[sub_resource type="StandardMaterial3D" id="Material_hazard"]
albedo_color = Color(1, 0.2, 0.2, 1)
emission_enabled = true
emission = Color(0.5, 0, 0, 1)
```
**Why:** Visual distinction without needing texture assets.

### DO: Include Collision for Walkable Surfaces
```ini
[node name="Ground" type="MeshInstance3D" parent="Terrain"]

[node name="StaticBody3D" type="StaticBody3D" parent="Ground"]

[node name="CollisionShape3D" type="CollisionShape3D" parent="Ground/StaticBody3D"]
shape = SubResource("WorldBoundaryShape3D_ground")
```
**Why:** Player doesn't fall through the world.

### DO: Use Marker3D for Key Points
```ini
[node name="SpawnPoint" type="Marker3D" parent="Landmarks/Hearthroot"]
transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0.5, 0)
```
**Why:** Scripts can find and use these positions. Clean separation of data.

### DO: Keep Transforms Simple
```ini
; Position only
transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, x, y, z)

; Simple rotation (90 degrees on Y)
transform = Transform3D(0, 0, 1, 0, 1, 0, -1, 0, 0, x, y, z)
```
**Why:** Complex transforms are error-prone. Position + simple rotation is enough.

### DO: Comment Sections in Large Files
```ini
; ============================================================================
; LANDMARKS
; ============================================================================
```
**Why:** Human readability. Godot ignores semicolon comments.

---

## DON'T: Patterns That Break

### DON'T: Deep Nesting Beyond 3 Levels
```ini
; BAD - Too deep
[node name="Level1" type="Node3D"]
[node name="Level2" type="Node3D" parent="Level1"]
[node name="Level3" type="Node3D" parent="Level1/Level2"]
[node name="Level4" type="Node3D" parent="Level1/Level2/Level3"]
[node name="Level5" type="Node3D" parent="Level1/Level2/Level3/Level4"]
```
**Why:** Hard to maintain, easy to break parent references. Flatten to 2-3 levels.

### DON'T: Vague Node Names
```ini
; BAD
[node name="MeshInstance3D" type="MeshInstance3D"]
[node name="Node3D" type="Node3D"]
[node name="StaticBody3D" type="StaticBody3D"]
```
**Why:** What are these? Use descriptive names.

### DON'T: Missing Collision on Ground
```ini
; BAD - No collision
[node name="Ground" type="MeshInstance3D"]
mesh = SubResource("PlaneMesh_ground")
; No StaticBody3D, no CollisionShape3D!
```
**Why:** Player falls through.

### DON'T: Wrong load_steps Count
```ini
; BAD - Says 5 but actually has 7 resources
[gd_scene load_steps=5 format=3]
; ... 2 ext_resource + 5 sub_resource ...
```
**Why:** Scene crashes on load. Always count manually.

### DON'T: Unclosed Quotes or Brackets
```ini
; BAD
albedo_color = Color(0.5, 0.5, 0.5, 1
[node name="Broken" type="MeshInstance3D
```
**Why:** Parse error, won't load.

### DON'T: Writing Plugin Nodes Directly
```ini
; BAD - Agent writing Terrain3D node
[node name="Terrain3D" type="Terrain3D"]
storage = ExtResource("terrain_storage")
; ... complex internal structure ...
```
**Why:** Plugin nodes have complex internal state. Human sets these up in editor.

### DON'T: Absolute or Backslash Paths
```ini
; BAD
path = "C:\Users\name\project\file.gd"
path = "res://scenes\\world\\region.tscn"
```
**Why:** `res://` with forward slashes only.

### DON'T: Guessing Transform Matrices
```ini
; BAD - Random numbers
transform = Transform3D(0.123, 0.456, 0.789, ...)
```
**Why:** Hard to debug. Use identity + position, or calculate properly.

---

## Size Guidelines

| Element | Min | Max | Notes |
|---------|-----|-----|-------|
| Scene file size | - | 100KB | Split if larger |
| Nodes per scene | 10 | 200 | Organize hierarchically |
| sub_resources per scene | 5 | 50 | Reuse where possible |
| MeshInstance3D per landmark | 1 | 20 | Combine if more |

---

## Landmark Construction Kit

### Basic Landmark Template
```ini
[node name="LandmarkName" type="Node3D" parent="Landmarks"]
transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, x, y, z)

[node name="Marker" type="Marker3D" parent="Landmarks/LandmarkName"]
transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0)

[node name="Visuals" type="Node3D" parent="Landmarks/LandmarkName"]

[node name="MainMesh" type="MeshInstance3D" parent="Landmarks/LandmarkName/Visuals"]
mesh = SubResource("Mesh_landmark")
surface_material_override/0 = SubResource("Material_landmark")

[node name="Collision" type="StaticBody3D" parent="Landmarks/LandmarkName"]

[node name="Shape" type="CollisionShape3D" parent="Landmarks/LandmarkName/Collision"]
shape = SubResource("Shape_landmark")
```

### Placeholder Geometry Sizes
| Element | Size | Use |
|---------|------|-----|
| Tree trunk | 2m x 2m x 6m | Redwood/main trunk |
| Rock marker | 0.4m x 1.5m x 0.3m | Standing stone |
| Mound | 8m diameter x 2m height | Shellmound base |
| Vent | 0.5m diameter | Breathing hole vent |
| Spawn area | 2m x 2m | Player clearance |

---

## Testing Your Scene

Before committing:
1. Open in Godot Editor
2. Check Scene dock - nodes load?
3. Check 3D view - meshes visible?
4. Press F5 - scene runs?
5. Walk around - collision works?

If any fail, fix before commit.

---

## Reference Documents

- Godot_TSCN_Standards_v1.md — Exact syntax
- Godot_Implementation_Doctrine_v1.md — When to use scenes
- Godot_Output_Validation_Checklist_v1.md — Pre-commit checks

---

*DO the simple things. DON'T overcomplicate. TEST before commit.*
