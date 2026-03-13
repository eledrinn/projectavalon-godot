# Native Starter Scene Build - Session Notes
**Agent:** Worldbuilder  
**Date:** 2026-03-13  
**File:** `scenes/world/regions/native_starter.tscn`

---

## Agent Output Protocol

**MISSION:** Build Native Starter Region Scene — Project Avalon Godot

**Deliverables Completed:**
1. ✅ Updated native_starter.tscn with all 4 landmarks + Woven Arch
2. ✅ Placeholder geometry (cubes, cylinders) for all landmarks
3. ✅ Proper node organization (Terrain, Landmarks, Props, Systems)
4. ✅ Distinct colors for different landmark types via StandardMaterial3D
5. ✅ Collision shapes for walkable surfaces

---

## Landmark Implementation

### Hearthroot (0, 0, 0) - Spawn Area
- **MainTrunk:** CylinderMesh, 4-5m diameter, red-orange bark material
- **Overhang:** BoxMesh angled to create shelter (safe zone introduction)
- **RootEast:** Angled cylinder for climbable affordance
- **SpawnPoint Marker3D:** Player start position
- **Collision:** CylinderShape3D for trunk

### Shellmound (80, 0, 0) - Quest Hub
- **MoundBase:** Tapered cylinder, 8m diameter x 2m elevation
- **MoundTop:** Flattened platform for NPC placement (2m x 2m clear)
- **5 Marker Stones:** BoxMesh arranged in ring around mound
- **NPC_Spawn Marker3D:** Shellkeeper Elder position
- **Collision:** CylinderShape3D for mound body

### Breathing Holes (90, -5, 40) - Hazard Lane
- **Depression:** BoxMesh sunk 1m below grade, 12m x 8m
- **5 Gas Vents:** Small cylinders with green emission material
- **4 Safe Path Markers:** Green glowing posts marking safe route N-S
- **SafePathNorth/South Marker3D:** Path entry/exit points
- **Collision:** BoxShape3D for depression floor

### Waymarker Vista (180, 8, 0) - Promise Point
- **Ledge:** BoxMesh platform, 6m x 4m at +8m elevation
- **StoneMarker:** 2m carved pillar with directional glyphs
- **MarkerTop:** Glowing gold accent cylinder
- **3 Step Stones:** Climbable cylinders leading up from east
- **VistaPoint Marker3D:** Camera target for vista moment
- **Collision:** BoxShape3D for ledge

### Woven Arch (130, 2, -30) - Departure Threshold
- **PillarLeft/Right:** 5m tall tapered cylinders (living archway)
- **Crossbeam:** BoxMesh connecting pillars at 5m height
- **3 Ritual Stones:** Marking cardinal points in clearing
- **RitualCenter Marker3D:** Quest completion sequence position
- **Collision:** CylinderShape3D for both pillars

---

## Material Color Coding

| Landmark | Color | Hex | Purpose |
|----------|-------|-----|---------|
| Bark | Red-orange | #99401A | Hearthroot roots/trunk |
| Mound | Earth brown | #594C33 | Shellmound structure |
| Stone | Gray | #80808C | Ancestor markers, ritual stones |
| Hazard | Dark mud | #33261A | Breathing Holes depression |
| Vent | Dark green | #1A661A | Gas vents (subtle emission) |
| Safe | Bright green | #339933 | Safe path markers |
| Rock | Stone gray | #666159 | Waymarker ledge, steps |
| Waymarker | Light stone | #8C8073 | Carved pillar |
| Accent | Gold | #CCB34D | Marker top (emission) |
| Arch | Willow green | #596633 | Living archway |
| Reed | Yellow-green | #668026 | Prop vegetation |

---

## Walkability Notes

**Player Path Options:**
1. **Ground Route:** Hearthroot → Shellmound (80m east) → Woven Arch (50m NE)
2. **Climb Route:** Hearthroot root climb → Shellmound rear → Waymarker stepping stones
3. **Hazard Route:** Hearthroot → Breathing Holes safe path (N-S traverse) → east to vista

**Key Distances:**
- Spawn to Shellmound: 80m
- Shellmound to Woven Arch: ~50m
- Waymarker elevation: +8m above wetland floor
- Total region bounds: 200m x 150m

---

## Next Steps for Prototype Builder

1. **Player Controller:** Spawn at Systems/PlayerSpawn marker
2. **NPC Placement:** Spawn Shellkeeper Elder at Shellmound/NPC_Spawn
3. **Quest Trigger:** Place interaction zone at WovenArch/RitualCenter
4. **Hazard System:** Gas vents at BreathingHoles/Vent* positions (4s safe / 3s active cycle)
5. **Camera Vista:** Trigger scenic view at Waymarker/VistaPoint

---

## Technical Notes

- All geometry is placeholder (primitive meshes)
- Materials use albedo_color only (no textures yet)
- Collision shapes match visual meshes for walkability
- Marker3D nodes positioned for gameplay systems integration
- Scene organized: Terrain → Landmarks → Props → Systems

**Terrain3D Integration:**
- Currently using PlaneMesh for ground (200m x 150m)
- When Terrain3D plugin is configured, replace Terrain/Ground with Terrain3D node
- Heightmap should match current landmark elevations (Hearthroot 0m, Waymarker +8m)
