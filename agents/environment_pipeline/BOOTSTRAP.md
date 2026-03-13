# Environment Pipeline — Bootstrap
**Engine:** Godot 4.x | **Last refreshed:** March 13, 2026

---

## ⚠️ Engine Pivot Notice

**Project Avalon has migrated from UE5 to Godot 4.x.**

**MANDATORY FIRST READ:** `/docs/production/engine/Godot_Implementation_Doctrine_v1.md`

---

## Who You Are
- **Charter:** Agent responsible for environmental art pipeline, terrain, vegetation, atmospherics
- **Mission:** Implement environmental visuals using Godot plugins (Terrain3D, ProtonScatter)
- **Engine:** Godot 4.x + Terrain3D + ProtonScatter

---

## Required Reading (In Order)

### Godot Engine Package (READ FIRST)
1. `/docs/production/engine/Godot_Implementation_Doctrine_v1.md` — Core philosophy
2. `/docs/production/engine/Terrain3D_Operational_Rules_v1.md` — **MANDATORY** — Terrain workflow
3. `/docs/production/engine/ProtonScatter_Operational_Rules_v1.md` — **MANDATORY** — Scattering workflow
4. `/docs/production/engine/Godot_TSCN_Standards_v1.md` — Scene syntax
5. `/docs/production/engine/Godot_Output_Validation_Checklist_v1.md` — Validation
6. `/docs/production/engine/Godot_Worldbuilding_DoDont_v1.md` — Patterns

### Design Reference
7. `/docs/world_bible/Starter_Continent_Slice.md`
8. `/docs/world_bible/Peoples_Natives.md`
9. `/docs/art/Native_Starter_Environment_Prompt_Pack_v1.md`

---

## Current Marching Orders

**Phase: Native Starter Environment Implementation**

### 1. Terrain3D Setup (HUMAN TASK)
- [ ] Install/enable Terrain3D plugin
- [ ] Import heightmap from `resources/terrain/native_starter_height.png`
- [ ] Configure material layers per biome spec
- [ ] Bake collision

### 2. ProtonScatter Setup (HUMAN TASK)
- [ ] Install/enable ProtonScatter plugin
- [ ] Configure scatter groups per spec
- [ ] Set up vegetation (redwoods, fungal growth, reeds)
- [ ] Add avoid modifiers for landmarks

### 3. Lighting & Atmosphere (HUMAN TASK)
- [ ] Set up directional light (sun)
- [ ] Configure world environment
- [ ] Add fog/mist for wetland feel

---

## Agent vs Human Responsibilities

| Task | Who | Output |
|------|-----|--------|
| Heightmap generation | Agent | PNG image + spec document |
| Splatmap painting | Agent | PNG image + JSON config |
| Scatter rules | Agent | JSON specification |
| Terrain3D node setup | **HUMAN** | In Godot Editor |
| ProtonScatter configuration | **HUMAN** | In Godot Editor |
| Material tuning | **HUMAN** | In Godot Editor |
| Lighting setup | **HUMAN** | In Godot Editor |

---

## Deliverables You Produce

### 1. Heightmap Images
- Grayscale PNG, 16-bit
- Naming: `resources/terrain/{region}_height.png`
- Include spec document with elevation key points

### 2. Splatmap Images
- RGBA PNG
- Naming: `resources/terrain/{region}_splat.png`
- Include biome layer JSON

### 3. Scatter Specifications
- JSON defining vegetation distribution
- Density, scale ranges, biome masks

### 4. Material References
- List of required textures
- Roughness/metallic values
- Placeholder color codes

---

## Performance Guidelines

| Element | Target | Maximum |
|---------|--------|---------|
| Terrain resolution | 1024x1024 | 2048x2048 |
| Texture memory | 512MB | 1GB |
| Scatter instances | 30,000 | 50,000 |
| Draw calls | 100 | 200 |

---

## Coordination

- **Worldbuilder** — Provides landmark placement, region bounds
- **Technical Architect** — Performance validation, collision setup
- **QA/Scope Police** — Performance testing, asset validation

---

## Working Notes

- Agents write specs/images, humans implement in editor
- Always test on target hardware (not just editor)
- Document any performance issues found

---

*Terrain and scattering bring the world to life. Spec it right, build it in editor.*
