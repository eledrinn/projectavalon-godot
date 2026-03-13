# Terrain3D Operational Rules v1
**Project Avalon | Production | Engine Standards**

**Status:** LOCKED  
**Date:** March 13, 2026  
**Applies To:** Worldbuilder, Environment Pipeline, Technical Architect  
**Purpose:** Exact workflow for Terrain3D plugin integration.

---

## What Terrain3D Does

Terrain3D is a Godot 4 plugin for heightmap-based terrain. It provides:
- GPU-accelerated terrain rendering
- Multiple texture layers (biomes)
- Automatic LOD
- Collision generation
- Sculpting tools (editor-only)

---

## Agent vs Human Responsibilities

| Task | Who | Output Format |
|------|-----|---------------|
| Heightmap generation | Agent | PNG/EXR image files + specifications |
| Splatmap (biome painting) | Agent | PNG images + biome rules JSON |
| Terrain3D node setup | **HUMAN** | In Godot Editor |
| Material configuration | **HUMAN** | In Godot Editor |
| Collision baking | **HUMAN** | In Godot Editor |

**Agents do NOT write Terrain3D nodes in .tscn files.** The plugin's node structure is complex and editor-dependent.

---

## Heightmap Specifications

### Image Format
```
Format: PNG (16-bit recommended) or EXR (32-bit float)
Size: Power of 2 + 1 (e.g., 1025x1025, 2049x2049)
Color: Grayscale (R=G=B=height)
Height range: 0.0 (black) = lowest, 1.0 (white) = highest
World scale: Configurable in Terrain3D (typically 1 pixel = 1 meter)
```

### Heightmap Naming Convention
```
resources/terrain/{region_name}_height.png
resources/terrain/{region_name}_height.exr
```

### Example: Native Starter (200m x 150m)
```
Size: 201 x 151 pixels (or 513 x 385 for higher detail)
Height range: -5m to +15m (wetland to overlook)
Export: 16-bit PNG
Path: resources/terrain/native_starter_height.png
```

---

## Splatmap (Biome Painting) Specifications

### What is a Splatmap?
A color image where each channel (R, G, B, A) represents a biome layer:
- R = Layer 0 (e.g., wetland mud)
- G = Layer 1 (e.g., grass)
- B = Layer 2 (e.g., fungal growth)
- A = Layer 3 (e.g., rock/cliff)

### Image Format
```
Format: PNG (8-bit per channel)
Size: Same as heightmap
Channels: RGBA
```

### Splatmap Naming
```
resources/terrain/{region_name}_splat.png
```

### Biome Definition JSON
Agents write this file to define what each layer means:

```json
{
  "region": "native_starter",
  "splatmap": "res://resources/terrain/native_starter_splat.png",
  "layers": [
    {
      "channel": "r",
      "name": "wetland_mud",
      "albedo_texture": "res://assets/textures/terrain/mud_albedo.png",
      "normal_texture": "res://assets/textures/terrain/mud_normal.png",
      "roughness": 0.9
    },
    {
      "channel": "g",
      "name": "grass",
      "albedo_texture": "res://assets/textures/terrain/grass_albedo.png",
      "normal_texture": "res://assets/textures/terrain/grass_normal.png",
      "roughness": 0.8
    },
    {
      "channel": "b",
      "name": "fungal",
      "albedo_texture": "res://assets/textures/terrain/fungal_albedo.png",
      "normal_texture": "res://assets/textures/terrain/fungal_normal.png",
      "roughness": 0.7
    },
    {
      "channel": "a",
      "name": "rock",
      "albedo_texture": "res://assets/textures/terrain/rock_albedo.png",
      "normal_texture": "res://assets/textures/terrain/rock_normal.png",
      "roughness": 0.6
    }
  ]
}
```

---

## Agent Deliverables

### 1. Terrain Specification Document
```markdown
## Terrain Spec: Native Starter

### Dimensions
- Size: 200m x 150m
- Height range: -5m to +15m
- Pixels: 201 x 151 (or higher)

### Key Elevations
- Hearthroot: 0m
- Shellmound: +2m (mounded area)
- Breathing Holes: -5m (depression)
- Waymarker: +8m (elevated overlook)

### Biome Distribution
- Wetland (mud): 40% of area
- Grass: 30% of area
- Fungal: 20% of area
- Rock: 10% of area (cliff faces)

### Generated Files
- native_starter_height.png
- native_starter_splat.png
- native_starter_terrain.json
```

### 2. Heightmap Image
Generated via Python, GIMP, or other tool. Grayscale PNG.

### 3. Splatmap Image
Painted/generated showing biome distribution.

### 4. Biome Configuration JSON
Defines textures and properties per layer.

---

## Human Implementation Steps

1. **Install Terrain3D Plugin**
   - Download from Godot Asset Library
   - Enable in Project Settings

2. **Create Terrain3D Node**
   - Add Terrain3D node to region scene
   - Configure storage path

3. **Import Heightmap**
   - Set heightmap texture to agent-generated PNG
   - Adjust scale to match spec (200m x 150m)

4. **Configure Material**
   - Add texture layers per JSON spec
   - Assign albedo/normal maps
   - Set roughness values

5. **Import Splatmap**
   - Set biome distribution texture

6. **Bake Collision**
   - Generate collision mesh
   - Test player walking

---

## Performance Guidelines

| Setting | Recommended | Why |
|---------|-------------|-----|
| Heightmap size | 1025x1025 max per region | Memory constraints |
| Texture resolution | 1024x1024 per layer | Balance quality/performance |
| LOD levels | 8-10 | Smooth distance rendering |
| Collision LOD | 0.5 (half res) | Physics performance |

---

## Common Mistakes

| Mistake | Why Bad | Correct |
|---------|---------|---------|
| Agent writes Terrain3D node in .tscn | Node structure is plugin-internal | Agent writes spec + images, human sets up node |
| Heightmap too small | Blocky terrain, visible pixels | Use sufficient resolution (512x512 minimum) |
| Heightmap too large | Memory issues, slow loading | Stay under 2049x2049 |
| No splatmap | Uniform boring terrain | Always provide biome distribution |

---

## Reference Documents

- Godot_Implementation_Doctrine_v1.md — When to use Terrain3D
- Godot_Output_Validation_Checklist_v1.md — Validation requirements

---

*Agents write specs and images. Humans integrate in editor.*
