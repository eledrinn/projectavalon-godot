# Terrain Specification: Native Starter Region
**Project Avalon | Environment Pipeline | Terrain3D Workflow**

**Status:** COMPLETE  
**Date:** March 13, 2026  
**Agent:** Environment Pipeline  
**Version:** 1.0

---

## 1. OVERVIEW

This document specifies the terrain generation parameters for the Native Starter region (Region 1-5 Wetland Slice). The terrain supports the first playable experience: an intimate wetland cradle that establishes Native cultural identity and core traversal mechanics.

**Lore Context:** The Native peoples are wetland-basin people whose ancestral homeland carries volcanic, humid, ancient characteristics. The terrain must reflect root-embedded, earth-hugging architecture and fungal/mineral richness.

---

## 2. REGION DIMENSIONS

| Property | Value |
|----------|-------|
| **World Size** | 200m x 150m |
| **Heightmap Resolution** | 513 x 385 pixels (higher detail) |
| **Alternative Resolution** | 201 x 151 pixels (1:1 meter mapping) |
| **Height Range** | -5m (Breathing Holes) to +8m (Waymarker) |
| **World Origin (0,0,0)** | Hearthroot spawn point |

### Coordinate System
- **X-axis:** West (-100m) to East (+100m) — 200m total
- **Z-axis:** South (-75m) to North (+75m) — 150m total
- **Y-axis:** Elevation relative to wetland baseline (0m = water level)

---

## 3. KEY ELEVATION POINTS

| Landmark | World Position | Elevation | Description |
|----------|---------------|-----------|-------------|
| **Hearthroot** | (0, 0, 0) | 0m | Spawn anchor, partially submerged cypress root system |
| **Shellmound** | (80, 0, 0) | +2m | Ancient midden heap, quest hub location |
| **Breathing Holes** | (90, -5, 40) | -5m | Depression with gas venting hazard |
| **Woven Arch** | (60, 0, 60) | 0-5m | Departure rite threshold, living archway |
| **Tier 2 Ledge** | (40, +4, 20) | +4m | Mid-climb rest point |
| **Waymarker Vista** | (180, +8, 0) | +8m | Panoramic overlook, promise point |

### Slope Characteristics

| Zone | Slope Type | Gradient | Notes |
|------|------------|----------|-------|
| **Wetland Basin** | Flat | 0-2% | Soggy ground, wading movement |
| **Shellmound Approach** | Gentle rise | 5-10% | Earthen mound with compacted soil |
| **Breathing Holes** | Depression | -15% (bowl) | Hazard pocket, bowl-shaped depression |
| **Tier 1-2 Climb** | Moderate | 25-35% | Root/rock scramble, climbable |
| **Tier 2-3 Climb** | Moderate | 30-40% | Earth/root scramble with ledges |
| **Vista Approach** | Steep | 40-50% | Cliff face, dramatic overlook |

---

## 4. TERRAIN FEATURES

### 4.1 Hearthroot Zone (West)
- **Elevation:** 0m to +2m
- **Features:** Massive cypress root system, overhang creating dry pocket
- **Traversal:** Root climbing tutorial, safe spawn area
- **Biome:** Wetland transition to grass cover

### 4.2 Central Wetland
- **Elevation:** 0m to +1m
- **Features:** Soggy basin, reed beds, shallow water
- **Traversal:** Wading (slow), clear sightlines to landmarks
- **Biome:** Wetland (mud) dominant

### 4.3 Shellmound (Center-North)
- **Elevation:** +2m (8m diameter mound)
- **Features:** Elevated midden heap, standing stone markers
- **Traversal:** Earthen path, flattened top for NPC
- **Biome:** Grass dominant with fungal growth ring

### 4.4 Breathing Holes (Southeast)
- **Elevation:** -1m to -5m (depression)
- **Features:** 12m x 8m bowl, 3-5 gas vent points
- **Traversal:** Timing-based hazard, 2m wide safe path
- **Biome:** Wetland with dead vegetation ring

### 4.5 Woven Arch (Northeast)
- **Elevation:** 0m to +5m (archway peak)
- **Features:** Living willow structure, ritual clearing
- **Traversal:** Village threshold, departure rite site
- **Biome:** Grass with fungal accents

### 4.6 Waymarker Vista (East)
- **Elevation:** +8m (highest point)
- **Features:** Stone marker, panoramic overlook
- **Traversal:** Full 3-tier climb sequence required
- **Biome:** Rock dominant with grass patches

---

## 5. GENERATED FILES

| File | Path | Format | Purpose |
|------|------|--------|---------|
| Heightmap | `resources/terrain/native_starter_height.png` | 16-bit PNG | Elevation data |
| Splatmap | `resources/terrain/native_starter_splat.png` | RGBA PNG | Biome distribution |
| Biome Config | `resources/terrain/native_starter_terrain.json` | JSON | Terrain3D material setup |

---

## 6. HUMAN IMPLEMENTATION NOTES

### Terrain3D Setup Steps
1. Install Terrain3D plugin from Godot Asset Library
2. Add Terrain3D node to Native Starter scene
3. Import `native_starter_height.png` as heightmap
4. Set world scale: 200m x 150m (or 1:1 if using 201x151)
5. Configure material layers per JSON specification
6. Import `native_starter_splat.png` as biome distribution
7. Bake collision mesh at 0.5 LOD for physics

### Water Plane Placement
- **Elevation:** -0.5m (0.5m below wetland baseline)
- **Coverage:** Entire basin area except elevated zones
- **Visual:** Murky wetland water, reed reflections

### Collision Considerations
- Breathing Holes depression needs accurate collision for gas hazard
- Climbable surfaces (roots, rocks) need ledge collision markers
- Vista overlook needs boundary collision to prevent falling

---

## 7. LORE ALIGNMENT CHECKLIST

- [x] **Wetland-basin foundation:** Flat, soggy terrain with water coverage
- [x] **Volcanic/mineral character:** Rock formations at elevation
- [x] **Fungal richness:** Shellmound fungal growth ring
- [x] **Root-embedded architecture:** Hearthroot integrated into terrain
- [x] **Ancient/mysterious:** Breathing Holes as unnatural hazard
- [x] **Organic materials:** Reed beds, woven arch environment

---

*Generated by Environment Pipeline Agent | Project Avalon*
