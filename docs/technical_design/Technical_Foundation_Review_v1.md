# Technical Foundation Review v1

**Status:** LOCKED — Review Complete, Recommendations Ready for Implementation  
**Role:** Technical Architect  
**Date:** 2026-03-10  
**Scope:** Evaluate technical foundation viability and recommend practical v1 architecture

---

## 1. Technical Problem

Evaluate whether the current source-of-truth documentation provides a viable technical foundation for:
- Seamless overworld implementation
- Globe-compatible architecture
- Long-term maintainability by a small AI-assisted team
- Practical terrain/world pipeline

---

## 2. Constraints

- Seamless overworld is a hard pillar (no outdoor loading screens)
- Globe-compatible architecture required from day one
- Future circumnavigation must remain possible
- One frontier vertical slice (levels 1–10) first
- Maintainable by small AI-assisted team
- No overengineering before the slice proves itself
- Platform decision: UE5 (decided post-doc creation, requires update)

---

## 3. Five Strongest Technical Foundation Decisions

### 3.1 "Build Flat Locally, Spherical Globally" Principle
**Location:** Technical_Architecture_v0.md

This architectural split is correct:
- **Local gameplay space:** Player movement, combat, NPCs, terrain interaction, quests
- **Global planetary metadata:** Region placement, future globe logic, climate, celestial modeling

This preserves the hard pillar of globe compatibility without requiring immediate planetary rendering. The separation allows the team to build a flat, seamless frontier slice while keeping the data model planetary.

**Strength:** Prevents flat-world assumptions from locking out future circumnavigation.

---

### 3.2 Seamless Overworld Philosophy with Clear Boundaries
**Location:** Streaming_and_Seamlessness.md

The hard rule is well-defined:
- **Seamless:** Outdoor regions, travel routes, starter areas, broader overworld
- **Instanced:** Dungeons, raids, special contained scenarios only

The principle that "regions are design regions, not hard-loaded map boundaries" gives the streaming system clear semantic boundaries.

**Strength:** Prevents accidental scene-based thinking from creeping into overworld design.

---

### 3.3 Layered Terrain Philosophy
**Location:** Technical_Architecture_v0.md

The six-layer approach is sound for a hybrid procedural/hand-authored pipeline:
1. 2D world skeleton and geography logic
2. Macro terrain generation
3. Manual correction
4. Gameplay blockout
5. Landmark-specific shaping
6. Final art polish later

**Strength:** Separates scale (procedural) from memorability (hand-authored) without requiring the team to sculpt the world manually.

---

### 3.4 Maintainability-First Mandate
**Location:** Technical_Architecture_v0.md

Explicit requirements:
- Modular
- Readable
- Easy to extend
- Understandable by small team
- Resilient to change

This guards against the natural tendency of AI-assisted teams to generate clever but unmaintainable solutions.

**Strength:** Creates a cultural constraint that will prevent technical debt accumulation.

---

### 3.5 Starter Continent Slice Provides Concrete Spatial Logic
**Location:** Starter_Continent_Slice.md

The 8-region chain from Arrival Coast to True Main Range provides:
- Clear biome transitions (ocean → redwood → fungal basin → foothills → city spur → convergence city → ash frontier → true range)
- Logical elevation progression (coast → basin → foothills → mountain spur)
- Natural streaming boundaries (geography-based, not artificial)

**Strength:** Gives the technical implementation a concrete spatial problem to solve rather than abstract generalities.

---

## 4. Five Biggest Technical Risks / Unknowns

### 4.1 Platform Decision Is Out of Date (HIGH RISK)
**Issue:** Technical_Architecture_v0.md references Unity as the platform, but UE5 has been selected.

**Impact:** Any agent reading only the docs will build against the wrong engine assumptions.

**Required Action:** Update Technical_Architecture_v0.md to reflect UE5, document World Partition strategy, and remove Unity references.

---

### 4.2 Multiplayer Networking Stack Undefined (HIGH RISK)
**Issue:** Open_Questions.md lists "exact multiplayer networking stack" as unresolved.

**Impact:** This blocks implementation of:
- Combat authority (server vs. client prediction)
- Movement replication
- Physics simulation boundaries
- Entity streaming in multiplayer context

**Required Action:** Define authoritative server vs. client-predicted vs. hybrid model. Document server authority boundaries.

---

### 4.3 Coordinate Representation Undefined (MEDIUM-HIGH RISK)
**Issue:** Technical_Architecture_v0.md lists "exactly how global metadata will be stored" and "exact coordinate representation" as open questions.

**Impact:** The seamless overworld requires a coordinate system that:
- Supports large distances without precision loss
- Maps local zones to global planetary positions
- Enables future circumnavigation

Without this, streaming boundaries cannot be defined.

**Required Action:** Document the coordinate system: local zone origins + global tile indices, tile size, and planetary projection strategy.

---

### 4.4 Streaming Implementation Is Hand-Waved (MEDIUM RISK)
**Issue:** Streaming_and_Seamlessness.md has strong principles but no actionable specification.

**Open questions:**
- Chunk size?
- Content streaming granularity?
- Entity streaming vs. persistence?
- Far-view landmark handling?

**Required Action:** Create concrete streaming specification with UE5 World Partition cell configuration, preload distances, LOD thresholds.

---

### 4.5 Terrain Pipeline Lacks Tooling Specification (MEDIUM RISK)
**Issue:** The layered terrain philosophy is correct, but the actual pipeline is undefined.

**Missing:**
- Which procedural tools (Gaea, World Machine, UE5 Landscape, custom)?
- Export/import formats
- Version control strategy for large terrain assets
- Manual correction workflow (in-engine vs. external)

**Required Action:** Define the terrain tool chain and workflow for the team.

---

## 5. Evaluation: Do Current Docs Support Hard Pillars?

| Pillar | Support Level | Notes |
|--------|--------------|-------|
| **Seamless overworld** | ⚠️ Partial | Philosophy locked, implementation open. Risk: gap between principle and execution. |
| **Future circumnavigation** | ✅ Strong | "Build flat locally, spherical globally" preserves this door. Planetary metadata layer is the right abstraction. |
| **Globe-compatible architecture** | ⚠️ Partial | Architecture direction is correct, but coordinate system undefined. Risk: implementation could hardcode flat assumptions. |
| **Maintainable by small AI-assisted team** | ✅ Strong | Explicit mandate in docs. Modular philosophy reduces risk of unmaintainable complexity. |

**Verdict:** The docs establish the right principles and constraints. The gap is in concrete technical specifications for implementation.

---

## 6. Recommended World Model Approach for v1

### 6.1 Local Gameplay Patches

**Structure:**
- Each region (Arrival Coast, Wet Basin, Foothill Rise, etc.) is a **local zone** with its own coordinate origin
- Player/camera always stays near (0,0,0) locally via origin rebasing
- Zone size: approximately 4–8km per region for v1
- Use UE5's large world coordinate support (double-precision) for local physics

**Implementation:**
- UE5 World Partition with one level per major region initially
- World Composition or level streaming for seamless handoffs
- Origin rebasing at zone boundaries (transparent to player)

### 6.2 Global Planetary Metadata

**Structure:**
- Integer-based tile system at fixed resolution (1km tiles)
- Cube-face projection mapping (6 faces × N×N tiles)
- Each local zone maps to a tile range on the appropriate cube face
- Metadata stored as JSON/CSV: tile index → region ID, biome, climate, elevation range

**Globe door kept open:**
- Cube-face coordinates can be projected to spherical coordinates later
- Navigation, climate, and celestial systems use global metadata
- Local gameplay is unaffected by planetary curvature

### 6.3 Streaming Philosophy

**Principles:**
- Predictive streaming based on player velocity and facing
- Geographic boundaries hide streaming (mountain passes, dense forest, fog)
- Landmarks remain visible across zone boundaries (distant LOD meshes)

**UE5 World Partition Configuration (Recommended):**
- Cell size: 256m × 256m for terrain
- Streaming distance: 1–2km visible, 3–4km preloaded
- HLOD generation for distant views
- Async loading on background thread

**Memory Budget (Conservative):**
- 4–6 cells in memory per player
- ~50MB terrain data resident

---

## 7. Recommended Terrain Pipeline Approach for v1

### Phase 1: 2D World Skeleton (Week 1–2)
**Tools:** Simple drawing tool or heightmap in Photoshop/GIMP
**Output:**
- Grayscale heightmap (2k × 2k per region)
- Splat map defining biome masks (coast, forest, basin, foothills, mountain)
- River/carving masks

**Purpose:** Establish geography logic before expensive 3D work

### Phase 2: Macro Terrain Generation (Week 3–4)
**Tools:** Gaea or World Machine (or UE5 Landscape tools if staying lightweight)
**Process:**
1. Import 2D skeleton
2. Generate erosion, terraces, realistic slopes
3. Export heightmap + layer masks
4. Iteration: 2–3 passes with manual adjustment

**Purpose:** Achieve macro-scale believability without hand-sculpting

### Phase 3: Manual Correction (Week 5)
**Tools:** UE5 Landscape Edit Layer or external sculpting
**Process:**
- Correct gameplay-critical areas (roads, city sites, dungeon entrances)
- Flatten settlement areas
- Ensure passable routes between regions

**Purpose:** Ensure playable flow in authored spaces

### Phase 4: Gameplay Blockout (Week 6–7)
**Tools:** UE5 grayboxing primitives
**Process:**
- Place major landmarks (cities, ruins, notable trees/rocks)
- Block quest paths and encounter spaces
- Verify traversal (can player actually walk from coast to city?)

**Purpose:** Validate design before art polish

### Phase 5: Landmark-Specific Shaping (Week 8–10)
**Tools:** UE5 Landscape, possibly ZBrush for hero assets
**Process:**
- Sculpt signature landmarks (the giant hollow tree, the spire, the crater)
- Add detailed terrain around points of interest
- Blend procedural base with hand-authored detail

### Phase 6: Final Art Polish (Deferred Post-Slice)
**Scope:** Material layers, foliage density, lighting, VFX
**Timeline:** After gameplay loop is proven

**Purpose:** Don't polish before the design is validated

---

## 8. Technical Ambitions to Explicitly Defer

Until the first playable slice (levels 1–10) is proven, **do not build**:

| Ambition | Why Deferred | When Revisited |
|----------|--------------|----------------|
| **True planetary curvature rendering** | Not needed for local flat gameplay; adds complexity | Post-slice, when globe travel is planned |
| **Server meshing / multi-server worlds** | Single authoritative server sufficient for frontier slice | Post-slice, when player count scales |
| **Dynamic terrain deformation** | Destructible/changeable world adds simulation complexity | Expansion phase, if design requires |
| **Real-time weather affecting terrain** | Visual weather sufficient; gameplay-affecting weather is extra systems | Post-slice |
| **Cross-shard instances** | Instanced content is local for now | Post-slice |
| **Full procedural world generation** | Hybrid approach (skeleton + manual) is right for v1 | Later continents |
| **Advanced crowd simulation** | NPC count will be limited in slice | Post-slice |
| **Economy simulation / market systems** | NPC vendors sufficient for v1 | Post-slice |

---

## 9. Missing Technical Docs (Recommendations)

### 9.1 High Priority (Blocks Implementation)

| Document | Purpose | Owner |
|----------|---------|-------|
| **Coordinate_System_Spec.md** | Local zone origins, global tile indices, cube-face mapping, UE5 integration | Technical Architect |
| **Streaming_Implementation_Spec.md** | World Partition cell config, LOD distances, memory budget, handoff strategy | Technical Architect |
| **Multiplayer_Authority_Model.md** | Server vs. client authority, prediction model, replication strategy | Technical Architect |
| **Terrain_Pipeline_Workflow.md** | Tool chain (Gaea/World Machine → UE5), export formats, version control | Technical Architect + Prototype Builder |

### 9.2 Medium Priority (Enables Production)

| Document | Purpose | Owner |
|----------|---------|-------|
| **UE5_Project_Structure.md** | Folder conventions, naming standards, module boundaries | Technical Architect |
| **Asset_Import_Pipeline.md** | How terrain, meshes, animations flow into project | Prototype Builder |
| **Performance_Budgets.md** | Draw calls, texture memory, physics bodies per zone | Technical Architect |

---

## 10. Recommended Next Technical Milestone

### Milestone: Foundation Hardening — Technical Specifications

**Goal:** Produce concrete technical specs that unblock implementation.

**Deliverables:**
1. **Coordinate_System_Spec.md** — LOCKED within 1 week
2. **Multiplayer_Authority_Model.md** — LOCKED within 1 week
3. **Streaming_Implementation_Spec.md** — LOCKED within 2 weeks
4. **Updated Technical_Architecture_v0.md** — Unity references removed, UE5 direction LOCKED

**Success Criteria:**
- A Prototype Builder agent could read the specs and create implementation tasks
- No open questions remain about coordinate representation or streaming
- World Partition configuration is specified with actual numbers

**Out of Scope (Do Not Do Yet):**
- Writing UE5 C++ code
- Building the full multiplayer stack
- Creating terrain assets
- Optimizing for 1000+ players

---

## 11. Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Coordinate system choice blocks future globe | Medium | High | Use cube-face mapping; review with fresh eyes before locking |
| AI-assisted team generates unmaintainable code | Medium | Medium | Enforce modularity rules; require doc-backed implementation |
| Overengineering before slice | High | High | Strict "Foundation Hardening" milestone; defer list is explicit |
| Platform confusion (Unity refs in docs) | High | Low | Update docs immediately; low effort |
| Multiplayer model delays all gameplay | Medium | High | Make authority decision quickly; iterate later |

---

## 12. Deferred Complexity

- Server meshing architecture
- True planetary rendering
- Dynamic terrain deformation
- Advanced weather simulation
- Full procedural world generation
- Economy simulation
- Cross-shard travel

---

## 13. What Should Be Built Now vs Later

**Now (Foundation Hardening):**
- Coordinate system specification
- Multiplayer authority model
- Streaming implementation spec
- Terrain pipeline workflow
- UE5 project initialization with World Partition

**Later (Post-Slice):**
- Additional continents
- Server meshing
- Globe rendering
- Advanced systems (weather, economy, etc.)

---

## 14. Maintainability Implications

The recommended architecture supports long-term maintenance:
- **Modular:** Local zones are independent; global metadata is separate concern
- **Readable:** Cube-face coordinates are understandable; no exotic math
- **Extensible:** New regions add new tiles; existing regions unchanged
- **AI-friendly:** Clear separation of concerns allows agents to work on isolated systems

---

## 15. Escalation Required

**None at this time.** All issues identified can be resolved within Technical Architect scope or through normal doc updates.

---

**Summary:** The technical foundation principles are sound. The gap is in concrete specifications. Priority is updating the platform decision (Unity→UE5) and producing the four high-priority technical specs (coordinate system, multiplayer authority, streaming implementation, terrain pipeline) to unblock implementation.
