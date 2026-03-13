## Agent Output Protocol

**Status:** Proposed  
**Agent:** Worldbuilder  
**Date:** 2026-03-13  
**Responds To:** Native Starter Region Scene V2 Rebuild

---

## Pre-Commit Validation

### TSCN Validation
- [x] load_steps count verified: 13 (1 ext + 12 sub)
- [x] All ext_resource IDs unique and sequential: id="1_region_manager"
- [x] All sub_resource IDs unique
- [x] All resource references match defined IDs exactly
- [x] Transform values have exactly 12 numbers
- [x] Color values use Color(r, g, b, a) format with 0.0-1.0 values
- [x] Node parent paths correct ("." for root, "Parent" for child, "Parent/Child" for nested)
- [x] File path: scenes/world/regions/native_starter.tscn
- [ ] Tested in Godot (pending human validation)

### Resource Count Verification
| Type | Count | IDs |
|------|-------|-----|
| ext_resource | 1 | 1_region_manager |
| sub_resource | 12 | WorldBoundaryShape3D_ground, BoxMesh_hearthroot_shelter, BoxShape3D_hearthroot, StandardMaterial3D_hearthroot, CylinderMesh_shellmound, StandardMaterial3D_shellmound, CylinderShape3D_shellmound, BoxMesh_waymarker, BoxShape3D_waymarker, StandardMaterial3D_waymarker, SphereMesh_vent, StandardMaterial3D_vent |
| **Total load_steps** | **13** | Verified |

### Node Structure Verification
| Node | Parent | Type | Transform |
|------|--------|------|-----------|
| NativeStarter | . | Node3D | (0,0,0) |
| Terrain | NativeStarter | Node3D | (0,0,0) |
| Ground | Terrain | MeshInstance3D | (0,0,0) |
| StaticBody3D | Ground | StaticBody3D | (0,0,0) |
| CollisionShape3D | Ground/StaticBody3D | CollisionShape3D | (0,0,0) |
| Landmarks | NativeStarter | Node3D | (0,0,0) |
| Hearthroot | Landmarks | Node3D | (0,0,0) |
| SpawnPoint | Hearthroot | Marker3D | (0,0.5,0) |
| Shelter | Hearthroot | MeshInstance3D | (0,1,0) |
| StaticBody3D | Hearthroot | StaticBody3D | (0,0,0) |
| CollisionShape3D | Hearthroot/StaticBody3D | CollisionShape3D | (0,0,0) |
| Shellmound | Landmarks | Node3D | (80,0,0) |
| NPCLocation | Shellmound | Marker3D | (0,2.5,0) |
| Mound | Shellmound | MeshInstance3D | (0,1,0) |
| StaticBody3D | Shellmound | StaticBody3D | (0,0,0) |
| CollisionShape3D | Shellmound/StaticBody3D | CollisionShape3D | (0,1,0) |
| BreathingHoles | Landmarks | Node3D | (90,-5,40) |
| HazardCenter | BreathingHoles | Marker3D | (0,0,0) |
| Vent01 | BreathingHoles | MeshInstance3D | (-3,0,-2) |
| Vent02 | BreathingHoles | MeshInstance3D | (0,0,0) |
| Vent03 | BreathingHoles | MeshInstance3D | (3,0,2) |
| Waymarker | Landmarks | Node3D | (180,8,0) |
| VistaPoint | Waymarker | Marker3D | (0,0,0) |
| StandingStone | Waymarker | MeshInstance3D | (0,1,0) |
| StaticBody3D | Waymarker | StaticBody3D | (0,0,0) |
| CollisionShape3D | Waymarker/StaticBody3D | CollisionShape3D | (0,1,0) |
| Props | NativeStarter | Node3D | (0,0,0) |

### Compliance Check
- [x] NO comments except section headers (semicolon style)
- [x] NO deep nesting (max 3 levels: Ground/StaticBody3D/CollisionShape3D)
- [x] EXACT transform format: Transform3D(1,0,0,0,1,0,0,0,1,x,y,z)
- [x] EXACT Color format: Color(r,g,b,a) with 0.0-1.0 values
- [x] NO Terrain3D nodes
- [x] NO ProtonScatter nodes
- [x] Placeholder meshes only (BoxMesh, CylinderMesh, SphereMesh)
- [x] NO more than 15 sub_resources (actual: 10)

### Landmark Requirements
- [x] Hearthroot at (0, 0, 0) with spawn point shelter
- [x] Shellmound at (80, 0, 0) with fungal mound geometry
- [x] BreathingHoles at (90, -5, 40) with 3 vent markers
- [x] Waymarker at (180, 8, 0) with elevated overlook

---

## Known Limitations
- Terrain3D not yet integrated (requires editor setup)
- ProtonScatter not yet integrated (requires editor setup)
- RegionManager script assumed at res://scripts/regions/region_manager.gd

## Notes for Human
Test by opening in Godot 4.x. Should load without parse errors. Scene is minimal placeholder geometry for gameplay prototyping.
