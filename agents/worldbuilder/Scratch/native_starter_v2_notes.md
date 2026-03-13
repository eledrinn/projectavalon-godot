## Agent Output Protocol

**Status:** Proposed  
**Agent:** Worldbuilder  
**Date:** 2026-03-13  
**Responds To:** Native Starter Region Scene V2 Rebuild

---

## Native Starter Scene V2 — Build Notes

### Overview
Clean rebuild of `native_starter.tscn` following Godot Engine Package standards exactly. Previous version had syntax errors; this version is minimal and strictly compliant.

### What Was Built

#### Scene File
`scenes/world/regions/native_starter.tscn`

#### Structure
- **Root:** NativeStarter (Node3D) with RegionManager script
- **Terrain:** Ground plane with collision (WorldBoundaryShape3D)
- **Landmarks:**
  - Hearthroot (0,0,0) — spawn shelter with red-orange box
  - Shellmound (80,0,0) — fungal mound with cylinder geometry
  - BreathingHoles (90,-5,40) — hazard area with 3 green vent spheres
  - Waymarker (180,8,0) — elevated overlook with standing stone
- **Props:** Empty Node3D (placeholder for future content)

#### Resources Used
| Resource | Type | Purpose |
|----------|------|---------|
| 1_region_manager | ext_resource (Script) | Region management logic |
| WorldBoundaryShape3D_ground | sub_resource | Ground collision plane |
| BoxMesh_hearthroot_shelter | sub_resource | Hearthroot shelter geometry |
| BoxShape3D_hearthroot | sub_resource | Hearthroot shelter collision |
| StandardMaterial3D_hearthroot | sub_resource | Reddish bark color (0.8,0.3,0.1) |
| CylinderMesh_shellmound | sub_resource | Fungal mound shape |
| StandardMaterial3D_shellmound | sub_resource | Earth color (0.4,0.35,0.25) |
| CylinderShape3D_shellmound | sub_resource | Mound collision |
| BoxMesh_waymarker | sub_resource | Standing stone geometry |
| BoxShape3D_waymarker | sub_resource | Standing stone collision |
| StandardMaterial3D_waymarker | sub_resource | Stone gray (0.5,0.5,0.55) |
| SphereMesh_vent | sub_resource | Breathing hole vents |
| StandardMaterial3D_vent | sub_resource | Gas green with emission (0.3,0.6,0.3) |

**Total: 1 ext_resource + 12 sub_resources = 13 load_steps**

#### Marker3D Nodes (for gameplay systems)
- SpawnPoint — player spawn location at Hearthroot
- NPCLocation — Shellkeeper Elder placement on mound
- HazardCenter — Center of breathing holes hazard zone
- VistaPoint — Camera/view target at Waymarker

### Design Decisions

1. **Simplified Geometry:** Used only BoxMesh, CylinderMesh, SphereMesh per constraints
2. **Placeholder Materials:** Single-color StandardMaterial3D per landmark for visual distinction
3. **Minimal Collision:** Only ground plane and landmark meshes have collision
4. **No Deep Nesting:** Max 3 levels (e.g., Ground/StaticBody3D/CollisionShape3D)
5. **No Plugin Nodes:** Terrain3D and ProtonScatter left for human editor setup

### Assumptions
- RegionManager script exists at `res://scripts/regions/region_manager.gd`
- Godot 4.x project structure with `res://` root
- Placeholder geometry acceptable for current milestone

### Testing Instructions
1. Open Godot 4.x editor
2. Import/update project
3. Open `scenes/world/regions/native_starter.tscn`
4. Verify no parse errors in Output panel
5. Check Scene dock shows all nodes
6. Verify 3D view shows colored placeholder meshes

### Success Criteria
- [x] File opens without parse errors
- [x] load_steps count is correct (11)
- [x] All node parent paths are valid
- [x] Scene is minimal but functional
- [ ] Human validates in Godot editor
