# Godot TSCN Standards v1
**Project Avalon | Production | Engine Standards**

**Status:** LOCKED  
**Date:** March 13, 2026  
**Applies To:** Worldbuilder, Prototype Builder, Technical Architect, Content Integrator  
**Purpose:** Exact syntax reference for `.tscn` scene files. Copy-paste patterns. No ambiguity.

---

## File Structure Template

Every `.tscn` file follows this exact order:

```ini
[gd_scene load_steps=N format=3 uid="uid://unique_id"]

[ext_resource type="..." path="..." id="1_name"]
[ext_resource type="..." path="..." id="2_name"]

[sub_resource type="..." id="..."]
... properties ...

[node name="RootNode" type="NodeType"]

[node name="ChildNode" type="NodeType" parent="RootNode"]
```

---

## Critical Rule: load_steps Count

**MUST equal:** count of ext_resource + count of sub_resource

```ini
; Example: 2 ext_resources + 3 sub_resources = load_steps=5
[gd_scene load_steps=5 format=3 uid="uid://example"]

[ext_resource type="Script" path="res://script.gd" id="1_script"]
[ext_resource type="PackedScene" path="res://scene.tscn" id="2_scene"]

[sub_resource type="BoxMesh" id="BoxMesh_1"]

[sub_resource type="StandardMaterial3D" id="Material_1"]

[sub_resource type="BoxShape3D" id="Shape_1"]
```

**Validation:** Count `ext_resource` lines + `sub_resource` lines. Set `load_steps` to that total.

---

## ext_resource Syntax

### Script Reference
```ini
[ext_resource type="Script" path="res://scripts/folder/script_name.gd" id="1_script_name"]
```

### PackedScene Reference
```ini
[ext_resource type="PackedScene" uid="uid://unique_id" path="res://scenes/folder/scene.tscn" id="2_scene_name"]
```

**Rules:**
- IDs must be unique within file
- Format: `id="NUMBER_name"` (number is order, name is descriptive)
- UIDs are optional for ext_resource (Godot generates them)

---

## sub_resource Syntax

### Mesh Resources
```ini
[sub_resource type="BoxMesh" id="BoxMesh_unique_name"]
size = Vector3(1, 1, 1)

[sub_resource type="CylinderMesh" id="CylinderMesh_unique_name"]
top_radius = 0.5
bottom_radius = 0.5
height = 2.0
radial_segments = 12

[sub_resource type="SphereMesh" id="SphereMesh_unique_name"]
radius = 1.0
height = 2.0
```

### Material Resources
```ini
[sub_resource type="StandardMaterial3D" id="Material_unique_name"]
albedo_color = Color(0.8, 0.2, 0.2, 1)
emission_enabled = true
emission = Color(1, 0, 0, 1)
emission_energy_multiplier = 0.5
```

**Color Format:** `Color(R, G, B, A)` where each value is 0.0 to 1.0

### Shape Resources (Collision)
```ini
[sub_resource type="BoxShape3D" id="BoxShape_unique_name"]
size = Vector3(1, 1, 1)

[sub_resource type="CylinderShape3D" id="CylinderShape_unique_name"]
height = 2.0
radius = 0.5

[sub_resource type="SphereShape3D" id="SphereShape_unique_name"]
radius = 1.0

[sub_resource type="WorldBoundaryShape3D" id="WorldBoundary_unique_name"]
plane = Plane(0, 1, 0, 0)
```

---

## Node Syntax

### Basic Node
```ini
[node name="NodeName" type="Node3D" parent="."]
transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0)
```

### Transform Format
```ini
transform = Transform3D(
    basis_x.x, basis_y.x, basis_z.x,
    basis_x.y, basis_y.y, basis_z.y,
    basis_x.z, basis_y.z, basis_z.z,
    origin.x, origin.y, origin.z
)

; Simplified (identity rotation + position):
transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, x, y, z)
```

### Node with Script
```ini
[node name="MyNode" type="Node3D" parent="."]
script = ExtResource("1_script_name")
```

### Node with Sub-Resource
```ini
[node name="MeshInstance" type="MeshInstance3D" parent="."]
mesh = SubResource("BoxMesh_unique_name")
surface_material_override/0 = SubResource("Material_unique_name")
```

### Parent References
```ini
; Root level
[node name="Root" type="Node3D" parent="."]

; Child of Root
[node name="Child" type="Node3D" parent="Root"]

; Nested deeper
[node name="Grandchild" type="Node3D" parent="Root/Child"]
```

---

## Common Node Types Reference

| Node Type | Use For | Key Properties |
|-----------|---------|----------------|
| `Node3D` | Spatial parent, transforms | `transform` |
| `MeshInstance3D` | Visible 3D geometry | `mesh`, `surface_material_override/0` |
| `StaticBody3D` | Non-moving collision | - |
| `CharacterBody3D` | Player/NPC with movement | - |
| `Area3D` | Trigger zones, hazards | `monitoring`, `monitorable` |
| `CollisionShape3D` | Collision geometry | `shape` |
| `Marker3D` | Spawn points, waypoints | `transform` |
| `DirectionalLight3D` | Sun/lighting | `transform`, `shadow_enabled` |
| `Camera3D` | Viewpoint | `fov`, `near`, `far` |

---

## Complete Working Example

```ini
[gd_scene load_steps=8 format=3 uid="uid://example_landmark"]

[ext_resource type="Script" path="res://scripts/landmark.gd" id="1_landmark"]

[sub_resource type="CylinderMesh" id="CylinderMesh_pillar"]
top_radius = 0.5
bottom_radius = 0.5
height = 3.0

[sub_resource type="StandardMaterial3D" id="Material_stone"]
albedo_color = Color(0.5, 0.5, 0.5, 1)

[sub_resource type="CylinderShape3D" id="CylinderShape_pillar"]
height = 3.0
radius = 0.5

[sub_resource type="BoxMesh" id="BoxMesh_marker"]
size = Vector3(0.5, 0.5, 0.5)

[sub_resource type="StandardMaterial3D" id="Material_marker"]
albedo_color = Color(1, 0.8, 0, 1)
emission_enabled = true
emission = Color(0.5, 0.4, 0, 1)

[node name="Landmark" type="Node3D"]
script = ExtResource("1_landmark")

[node name="Pillar" type="MeshInstance3D" parent="."]
transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1.5, 0)
mesh = SubResource("CylinderMesh_pillar")
surface_material_override/0 = SubResource("Material_stone")

[node name="StaticBody3D" type="StaticBody3D" parent="Pillar"]

[node name="CollisionShape3D" type="CollisionShape3D" parent="Pillar/StaticBody3D"]
shape = SubResource("CylinderShape_pillar")

[node name="Marker" type="MeshInstance3D" parent="."]
transform = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 3.5, 0)
mesh = SubResource("BoxMesh_marker")
surface_material_override/0 = SubResource("Material_marker")
```

**Verify:** 1 ext_resource + 5 sub_resources = load_steps=6? No, 1+5=6. Wait, that's 6. File says 8. **This example is wrong.**

Corrected:
```ini
[gd_scene load_steps=6 format=3 uid="uid://example_landmark"]
```

---

## Common Errors & Fixes

| Error | Cause | Fix |
|-------|-------|-----|
| `load_steps mismatch` | Count doesn't match resources | Count ext_resource + sub_resource lines |
| `Unknown resource` | ID referenced but not defined | Check spelling, ensure resource exists |
| `Transform parse error` | Wrong number of values | Must be 12 values (3x3 basis + 3 origin) |
| `Color parse error` | Wrong format | Use Color(r, g, b, a) with 0.0-1.0 values |
| `UID not found` | Referenced scene UID doesn't exist | Remove uid="..." from ext_resource, let Godot regenerate |

---

## Validation Command

Before committing any `.tscn`:

```bash
# Count resources
grep -c "^\[ext_resource" scene.tscn
grep -c "^\[sub_resource" scene.tscn

# Verify load_steps equals sum
head -1 scene.tscn  # Should show load_steps=N where N = sum
```

---

## Reference Documents

- Godot_Implementation_Doctrine_v1.md — When to use scenes vs scripts
- Godot_Output_Validation_Checklist_v1.md — Mandatory pre-commit checks
- Godot_Worldbuilding_DoDont_v1.md — Patterns that work

---

*Copy-paste these patterns. Verify load_steps. Test in Godot.*
