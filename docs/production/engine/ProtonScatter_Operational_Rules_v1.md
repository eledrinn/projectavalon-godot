# ProtonScatter Operational Rules v1
**Project Avalon | Production | Engine Standards**

**Status:** LOCKED  
**Date:** March 13, 2026  
**Applies To:** Worldbuilder, Environment Pipeline  
**Purpose:** Exact workflow for ProtonScatter plugin integration.

---

## What ProtonScatter Does

ProtonScatter is a Godot 4 plugin for scattering instances (vegetation, rocks, props) across surfaces. It provides:
- GPU-instanced rendering (thousands of objects, low overhead)
- Multiple scatter items per node
- Modifier-based placement rules
- Real-time preview

---

## Agent vs Human Responsibilities

| Task | Who | Output Format |
|------|-----|---------------|
| Scatter rules definition | Agent | JSON specification |
| Item list (what to scatter) | Agent | JSON array |
| Placement rules | Agent | Modifier descriptions |
| ProtonScatter node setup | **HUMAN** | In Godot Editor |
| Item mesh configuration | **HUMAN** | In Godot Editor |
| Modifier tuning | **HUMAN** | In Godot Editor |

**Agents do NOT write ProtonScatter nodes in .tscn files.** The plugin's modifier stack is editor-dependent.

---

## Scatter Specification Format

Agents write JSON files defining what to scatter and where:

```json
{
  "scatter_name": "native_starter_vegetation",
  "region": "native_starter",
  "target_surface": "Terrain3D",
  "scatter_groups": [
    {
      "name": "redwood_trees",
      "items": [
        {
          "mesh": "res://assets/models/vegetation/redwood_01.obj",
          "weight": 0.5
        },
        {
          "mesh": "res://assets/models/vegetation/redwood_02.obj",
          "weight": 0.5
        }
      ],
      "density": 0.01,
      "scale_range": [0.8, 1.2],
      "rotation_range": [-15, 15],
      "biome_mask": "grass",
      "avoid_radius": 5.0
    },
    {
      "name": "fungal_growths",
      "items": [
        {
          "mesh": "res://assets/models/vegetation/fungal_cluster_01.obj",
          "weight": 0.6
        },
        {
          "mesh": "res://assets/models/vegetation/fungal_cluster_02.obj",
          "weight": 0.4
        }
      ],
      "density": 0.05,
      "scale_range": [0.5, 1.0],
      "biome_mask": "fungal",
      "avoid_landmarks": true
    },
    {
      "name": "ground_cover",
      "items": [
        {
          "mesh": "res://assets/models/vegetation/reeds.obj",
          "weight": 0.7
        },
        {
          "mesh": "res://assets/models/vegetation/ferns.obj",
          "weight": 0.3
        }
      ],
      "density": 0.2,
      "scale_range": [0.3, 0.8],
      "biome_mask": "wetland"
    }
  ],
  "modifiers": [
    {
      "type": "avoid",
      "target": "landmarks",
      "radius": 3.0
    },
    {
      "type": "slope",
      "min": 0,
      "max": 45
    }
  ]
}
```

---

## Scatter Groups Explained

### Density
- 0.001 = Very sparse (1 per 1000m²)
- 0.01 = Sparse (1 per 100m²)
- 0.1 = Dense (1 per 10m²)
- 1.0 = Very dense (1 per 1m²)

### Biome Mask
References the Terrain3D splatmap channels:
- `"wetland"` = red channel
- `"grass"` = green channel
- `"fungal"` = blue channel
- `"rock"` = alpha channel

### Avoid Radius
Minimum distance from other objects or landmarks. Prevents overlapping/clipping.

---

## Performance Limits

| Resource | Max | Reason |
|----------|-----|--------|
| Instances per scatter node | 10,000 | GPU memory |
| Scatter nodes per region | 5 | Organization |
| Unique meshes per scatter | 10 | Draw calls |
| Total instances per region | 50,000 | Performance |

---

## Agent Deliverables

### 1. Scatter Specification JSON
Defines groups, densities, placement rules.

### 2. Asset List
Required mesh files for each scatter item:
```markdown
## Assets Required: Native Starter Vegetation

### Redwood Trees
- redwood_01.obj (placeholder: primitive cylinder)
- redwood_02.obj (placeholder: scaled cylinder)

### Fungal Growths
- fungal_cluster_01.obj (placeholder: small spheres)
- fungal_cluster_02.obj (placeholder: scaled spheres)

### Ground Cover
- reeds.obj (placeholder: thin cylinders)
- ferns.obj (placeholder: flat planes)
```

### 3. Placement Diagram (Optional)
Text description or ASCII art showing scatter distribution:
```
[Grass areas]          → Redwood trees (sparse)
[Fungal areas]         → Fungal clusters (medium)
[Wetland areas]        → Reeds/ferns (dense)
[Within 3m of landmark] → No vegetation (clearance)
```

---

## Human Implementation Steps

1. **Install ProtonScatter Plugin**
   - Download from Godot Asset Library
   - Enable in Project Settings

2. **Create Scatter Node**
   - Add ProtonScatter node to region scene
   - Name it per spec (e.g., "Vegetation")

3. **Add Scatter Items**
   - Create ScatterItem for each mesh
   - Set meshes per JSON spec
   - Configure weights

4. **Add Modifiers**
   - Random distribution
   - Avoidance (landmarks, other objects)
   - Slope limits
   - Biome mask (if Terrain3D integrated)

5. **Bake and Verify**
   - Check instance count (stay under limits)
   - Verify no clipping with landmarks
   - Test performance

---

## Placeholder Meshes

Until final art is ready, use primitives:

| Item | Placeholder | Color |
|------|-------------|-------|
| Redwood tree | CylinderMesh (tall, thin) | Brown |
| Fungal cluster | SphereMesh cluster | Purple/Orange |
| Reeds | Thin cylinders | Green |
| Ferns | Flat planes | Green |
| Rocks | BoxMesh or sphere | Gray |

---

## Integration with Terrain3D

ProtonScatter works best with Terrain3D:
1. Terrain3D provides the surface
2. ProtonScatter uses Terrain3D height for placement
3. Biome masks read from Terrain3D splatmap

**Order of operations:**
1. Human sets up Terrain3D
2. Human adds ProtonScatter as child of Terrain3D
3. Configure scatter to use Terrain3D surface

---

## Common Mistakes

| Mistake | Why Bad | Correct |
|---------|---------|---------|
| Agent writes ProtonScatter node in .tscn | Modifier stack is complex | Agent writes JSON spec |
| Too many instances | Performance death | Stay under 50k per region |
| No avoidance | Objects clip through landmarks | Always add avoid modifier |
| Wrong density | Looks barren or overcrowded | Follow density guidelines |

---

## Reference Documents

- Godot_Implementation_Doctrine_v1.md — When to use scattering
- Terrain3D_Operational_Rules_v1.md — Terrain integration
- Godot_Output_Validation_Checklist_v1.md — Validation requirements

---

*Agents write scatter specs. Humans build in editor with those specs.*
