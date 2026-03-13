# Environment Pipeline — Native Starter Zone

## Agent Output Protocol

**Agent:** Environment Pipeline  
**Version:** v0.1  
**Scope:** Native Cradle blockout-to-art pipeline, asset standards, and handoff protocols  
**Output Format:** Markdown, bullet-based (no tables)  
**Review Cadence:** Weekly sync with Worldbuilder + Tech Art  

---

## Blockout-to-Art Workflow: Native Cradle

### Phase 1: Terrain Sculpting
- **Input:** Worldbuilder greybox with zone bounds, spawn point, and key landmark placements
- **Process:**
  - Sculpt base terrain in engine terrain tool following concept paintover elevation guidelines
  - Carve riverbed and crater depression per blockout volumes
  - Establish macro terrain read: elevated east ridge, sunken crater floor, western marsh transition
- **Output:** Sculpted terrain mesh ready for material pass
- **Handoff To:** Spline pass agent

### Phase 2: Spline Pass
- **Input:** Sculpted terrain + greybox spline markers from Worldbuilder
- **Process:**
  - Lay root bridge splines connecting crater rim to central Hearthroot
  - Place terrace step splines along traversable paths (player-height validation)
  - Mark gas vent locations along crater floor fault lines
  - Set water plane for marsh edges and hot spring pools
- **Validation:** Walk every spline path in PIE, ensure no stuck spots
- **Output:** Spline network + marker proxy meshes
- **Handoff To:** Kit placement agent

### Phase 3: Kit Placement
- **Input:** Spline network + greybox proxy placement
- **Process:**
  - Populate root bridge splines with `Kit_RootBridge_*` variants (avoid repetition patterns)
  - Place terrace steps at spline endpoints and transition zones
  - Scatter gas vents along fault splines with `BP_GasVent` (audio hook exposed)
  - Build reed hut clusters in marsh transition using `Kit_ReedHut_*`
  - Construct Hearthroot interior with `Kit_HearthInterior_*` per concept layout
- **Validation:** Kit bounds check, no overlap with player collision
- **Output:** Dressed zone ready for lighting
- **Handoff To:** Lighting/audio agent

### Phase 4: Lighting/Audio Handoff
- **Lighting:**
  - Receive dressed zone, apply region lighting template (Native Cradle: warm bioluminescence + volcanic rim light)
  - Place local lights at gas vents, Hearthroot hearth, and key root intersections
  - Bake lighting, iterate with Worldbuilder on mood reads
- **Audio:**
  - Ambient bed: marsh insect loops, distant volcanic rumble
  - Point sources: gas vent hisses attached to `BP_GasVent` audio hooks
  - Hearthroot: interior fire crackle, low-frequency pulse
- **Output:** Final art zone ready for QA pass

---

## Modular Kit Requirements

### Storage Path Convention
```
Content/World/Regions/Native_Starter/Kits/
├── RootBridges/
├── TerraceSteps/
├── GasVents/
├── ReedHuts/
├── HearthInterior/
└── _Shared/
```

### Kit: Root Bridges (`Kit_RootBridge_*`)
- **Variants:**
  - `A` — Single thick root span (8m length)
  - `B` — Forked root junction (Y-shape, 6m arms)
  - `C` — Root cluster dense (overlapping for hub areas)
  - `D` — Root end cap (flush with terrain)
- **Naming:** `SM_RootBridge_A_01`, `SM_RootBridge_A_02` (variants per LOD)
- **Materials:** `M_RootBridge_Bark`, `M_RootBridge_Glow` (bioluminescent patches)

### Kit: Terrace Steps (`Kit_TerraceStep_*`)
- **Variants:**
  - `Short` — 2-step rise (1m total)
  - `Tall` — 4-step rise (2m total)
  - `Corner` — 90° turn integration
  - `Landing` — flat platform for root junctions
- **Naming:** `SM_TerraceStep_Short_01`
- **Collision:** Auto-convex, player-step friendly

### Kit: Gas Vents (`Kit_GasVent_*`)
- **Variants:**
  - `Small` — ground crack with faint steam
  - `Large` — vertical vent pipe with visible gas emission
  - `Broken` — collapsed vent, debris scatter
- **Naming:** `SM_GasVent_Small_01`
- **Blueprint:** `BP_GasVent` (exposes audio hook, particle toggle, damage volume)

### Kit: Reed Huts (`Kit_ReedHut_*`)
- **Variants:**
  - `Single` — 1-room shelter
  - `Double` — connected pair
  - `ClusterCenter` — communal fire pit with surrounding huts
- **Naming:** `SM_ReedHut_Single_01`
- **Materials:** `M_ReedThatch`, `M_ReedPoles`

### Kit: Hearthroot Interior (`Kit_HearthInterior_*`)
- **Variants:**
  - `Floor` — root-buttressed flooring sections
  - `Wall` — living wood wall panels with gaps for light
  - `Ceiling` — root canopy overhead
  - `Hearth` — central fire pit structure (interactive)
- **Naming:** `SM_HearthInterior_Floor_A_01`
- **Special:** Hearth variant has blueprint `BP_HearthInteractive` for gameplay hook

### Shared Kit (`_Shared/`)
- **Debris:** rock scatter, root stumps, fallen logs
- **Foliage:** grass clumps, fern patches, bioluminescent spores (particle)
- **Water:** hot spring pool edge pieces, marsh reeds

---

## Asset Ingest Rules

### Naming Convention
```
{AssetType}_{KitName}_{Variant}_{Version}
```
- AssetType: `SM_` (static mesh), `BP_` (blueprint), `M_` (material), `T_` (texture)
- KitName: matches kit folder (e.g., `RootBridge`, `GasVent`)
- Variant: `A`, `B`, `Short`, `Large`, etc.
- Version: `01`, `02`, etc.

**Example:** `SM_RootBridge_A_01`, `BP_GasVent`, `M_RootBridge_Bark`

### LOD/HLOD Expectations
- **LOD0:** Full detail, used within 10m of camera
- **LOD1:** 50% poly reduction, 20m distance
- **LOD2:** 80% reduction, 50m distance
- **LOD3 (HLOD):** billboard or ultra-low proxy, 100m+ distance
- **HLOD Cluster:** Each kit variant group should bake to shared HLOD for draw call optimization
- **Max Texture Size:** 2048x2048 for hero assets, 1024x1024 for shared

### Audio Hooks per Kit
- **Root Bridges:** creak/strain on player proximity (attached to `BP_RootBridge` if applicable)
- **Gas Vents:** hissing loop + occasional pressure release, attached to `BP_GasVent`
- **Reed Huts:** cloth flutter in wind zone (if exterior), interior muffled ambience
- **Hearthroot Interior:** fire crackle loop at `BP_HearthInteractive`, reverb volume for interior space

---

## Collaboration Touchpoints

### Worldbuilder
- **Provides:** Greybox layout, zone bounds, spawn point, spline markers, gameplay blockers
- **Receives:** Final dressed zone for gameplay validation
- **Sync Points:** Post-sculpting terrain review, post-kit placement bounds check
- **Communication:** Discord #env-native-cradle, weekly screenshot review

### Concept Art
- **Provides:** Paintover elevations, kit concept sheets, mood boards, material callouts
- **Receives:** In-engine screenshots for feedback loop
- **Sync Points:** Pre-sculpting paintover handoff, lighting mood approval
- **Communication:** ArtStation/Confluence links in #art-review

### Audio
- **Provides:** Ambient bed stems, one-shot SFX banks, Wwise event names
- **Receives:** Zone coordinate markers for audio placement
- **Sync Points:** Post-kit placement audio hook pass, final mix review
- **Communication:** Wwise project sync, Discord #audio-env

### Tech Art
- **Provides:** Master materials, kit blueprint templates, HLOD bake pipeline, shader effects (gas vent heat distortion)
- **Receives:** Asset validation reports, LOD budget sign-off
- **Sync Points:** Pre-production material setup, mid-production LOD review, final optimization pass
- **Communication:** Perforce syncs, #tech-art channel

---

## Version History

- **v0.1** — Initial pipeline definition, kit list, and collaboration protocols
