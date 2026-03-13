# World Foundation Review v1

**Agent:** Worldbuilder / Cartographer  
**Status:** [LOCKED] Review — Foundation Assessment  
**Date:** 2026-03-10  
**Deliverable Type:** Foundation Review / Gate Document  
**Next Gate:** Environment concept art, terrain generation, Native 1–5 starter zone work  

---

## Executive Summary

The world foundation is **structurally sound** and ready to proceed with production, **provided** five critical geography decisions are locked and three biome transition specifications are hardened. The 8-region starter slice shows strong logical flow, but underspecified transitions between four adjacent biomes present risk for concept art misalignment.

**Verdict:** Proceed to next milestone after locking Section 5 decisions.

---

## 1. Five Strongest World/Geography Decisions Already Present

### 1.1 The City Spur Separation **[LOCKED]**
Placing the first major city on an eastern offshoot of the true main range is architecturally excellent. It preserves the deeper mountains for later exploration while providing dramatic highland placement now. This is a disciplined production decision that respects the "world should feel large before it becomes large" rule.

*Source: Starter_Continent_Slice.md — Region 6*

### 1.2 The Wetland-to-Highland Native Arc **[LOCKED]**
The decision that Natives are originally wetland-rooted and later highland-adapted creates a culturally rich foundation. It gives the starter basin emotional weight as ancestral homeland rather than generic swamp, and justifies the visual/material language split between old and new architecture.

*Source: Peoples_Natives.md — Core Identity, Cultural Split*

### 1.3 The Three-Drainage Basin Convergence **[LOCKED]**
The convergence city sitting where three drainage basins meet provides geographic justification for settlement, strategic control, and visual drama. It creates natural route convergence for player paths and justifies the city's political importance without requiring lore hand-waving.

*Source: Starter_Continent_Slice.md — Region 6*

### 1.4 The Ash Frontier as Preview Buffer **[LOCKED]**
Positioning the Ash Frontier as level 10+ preview content beyond the city creates natural progression tension. It showcases Severed presence and volcanic danger without committing to full implementation, and the locked Ash Gate provides clear "what comes next" signaling.

*Source: Starter_Continent_Slice.md — Region 7*

### 1.5 Globe-Compatible Continental Architecture **[LOCKED]**
The two-landmass western continent divided by a volcanic channel provides macro geographic logic that supports future expansion without overbuilding now. The northerly latitude placement explains redwood-like forests while leaving room for southern tropical/arid variants later.

*Source: World_Overview.md — Starter Region World Structure*

---

## 2. Five Biggest Missing Worldbuilding Decisions Needed Next

### 2.1 Precise Drainage Basin Boundaries **[OPEN]**
The three basins converging at the city are referenced but not mapped. Which basin drains to the sea? Which drains inland? Where exactly do the boundaries lie? This matters for:
- River placement for terrain generation
- Native settlement patterns (which communities are in which basin)
- Route logic between regions

**Recommendation:** Lock a simple 3-basin diagram before terrain generation.

### 2.2 Redwood-to-Basin Transition Width **[TENTATIVE]**
The Redwood Transition Belt is described as a "major visual/ecological band" but its width is unspecified. Is it:
- A narrow 200-meter band (abrupt transition)
- A wide 2-kilometer gradual shift (drowning forest)
- Variable based on drainage channels

This affects gameplay pacing and asset batching.

**Recommendation:** Lock at "gradual 1–2km drowning forest transition with variable width based on elevation and drainage."

### 2.3 The Ash Frontier Extent **[OPEN]**
How deep is the Ash Frontier before the true main range? Is it:
- A thin volcanic buffer zone (few hours' travel)
- A substantial region equal to the starter slice (many hours)
- Undefined until needed

This affects scale promises to players and terrain generation scope.

**Recommendation:** Lock as "substantial region, approximately 60% the playable area of the starter slice, ending at the true main range foothills."

### 2.4 Coastal Inlet Configuration **[TENTATIVE]**
The Arrival Coast has a "curved bay or inlet" but its shape and scale are open. A small cove creates different gameplay than a deep fjord-like inlet. This affects:
- Arrival starting settlement placement
- Sightlines to the interior mountains
- Redundancy of sea-to-interior routes

**Recommendation:** Lock as "broad east-facing bay, approximately 5km wide at mouth, with a smaller protected cove at the northern edge for the Arrival starter enclave."

### 2.5 The Channel Southern Vista **[OPEN]**
Players at the convergence city can glimpse "south toward the inner channel and volcanic islands." How visible? How detailed? Is this:
- A clear view of distinct islands (implies closer channel than previously suggested)
- A hazy distant silhouette
- Visible only from specific high points

This affects the globe-scale sense of world size.

**Recommendation:** Lock as "visible only from the city's highest terrace on clear days — distant silhouettes suggesting large world scale, not neighboring islands."

---

## 3. Starter Continent Slice Evaluation

### 3.1 Geographic Coherence: **STRONG**

The east-to-west flow (ocean → coast → redwoods → basin → foothills → spur → city → frontier → main range) follows believable orographic logic. The rain-shadow positioning (wet east, drier interior implied) is geologically sound. The volcanic channel placement provides future tectonic rationale without complicating the starter slice.

**Confidence:** High

### 3.2 Biome Transitions: **MODERATE — NEEDS HARDENING**

The eight-region chain is logical at macro scale, but four specific transitions need specification:

| Transition | Current State | Risk Level |
|------------|---------------|------------|
| Coast → Redwood Belt | Described but width unspecified | Medium |
| Redwood Belt → Wet Basin | "Sulfur-tainted runoff" mentioned but mechanism unclear | Medium |
| Wet Basin → Foothills | "Ridged foothills" abrupt or gradual? | Medium |
| Foothills → City Spur | Switchback roads implied but not locked | Low |
| City Spur → Ash Frontier | Clear gate structure (Ash Gate) | Low |

**Recommendation:** Harden the three medium-risk transitions before concept art begins.

### 3.3 Scale Promise: **STRONG**

The document consistently signals "this is only the beginning":
- The true main range is reserved
- The Ash Frontier is preview, not final
- The channel and southern landmass are visible but unreachable
- Offshore expansion is architecturally supported

This creates the "world feels large before it becomes large" sensation successfully.

**Confidence:** High

### 3.4 Expansion Room: **EXCELLENT**

The foundation provides clear expansion vectors in all cardinal directions:
- **North:** Cooler latitude variants, extended coast
- **West:** The true main range, rain-shadow interior, deeper Severed territory
- **South:** Channel routes, volcanic islands, southern landmass
- **Offshore:** Eventual second continent

The globe-compatible architecture means these expansions don't break technical assumptions.

**Confidence:** Very High

---

## 4. Weak or Underspecified Transitions

### 4.1 Coast → Redwood Belt

**Current:** "Alien redwood forest directly inland"  
**Gap:** Where does the beach end and forest begin? Are there dunes, cliffs, immediate tree line?

**Recommendation [PROPOSED]:**
- Black sand or volcanic gravel beaches
- 50–100 meter transition zone of stunted salt-tolerant redwood variants
- Sudden canopy rise marking the true forest boundary
- Sea cliffs at the bay's edges, sloping beaches at the center

### 4.2 Redwood Belt → Wet Basin

**Current:** "Sulfur-tainted runoff mentioned" + "damp root systems"  
**Gap:** Is this a hard boundary or gradual drowning? What causes the shift from drainage to saturation?

**Recommendation [PROPOSED]:**
- Gradual 1–2km "drowning forest" transition
- Standing water increases, root systems become stilted
- Fungal forms first overtake undergrowth, then canopy gaps
- Ancient stream channels create natural pathways through the shift
- The basin sits at a slight topographic low, collecting drainage from multiple foothill streams

### 4.3 Wet Basin → Foothills

**Current:** "Ridged foothills" with "stream cuts"  
**Gap:** Abrupt elevation change or rolling transition? How do players leave the basin?

**Recommendation [PROPOSED]:**
- Rolling transition with increasing stone ridge frequency
- Basin ends at a clear "terrace edge" — an ancient geological shelf
- The Stair (major landmark) is carved into this shelf
- Multiple minor paths exist but The Stair is the main chokepoint for gameplay
- Behind the player: basin views. Ahead: first mountain glimpses.

### 4.4 Foothills → City Spur

**Current:** Switchback ascent, hanging bridges implied  
**Gap:** How many route options? Is this a single chokepoint or distributed?

**Recommendation [PROPOSED]:**
- The Stair is the primary chokepoint for narrative pacing
- Two alternate rough paths exist for explorers (one longer, one requiring climbing)
- The spur has multiple terraces, not just the city shelf
- Players should feel elevation gain over 10–15 minutes of travel
- First clear view of the city appears at the third switchback

### 4.5 City Spur → Ash Frontier

**Current:** Clear Ash Gate structure  
**Gap:** How abrupt is the volcanic transition?

**Assessment:** This transition is actually well-structured. The Ash Gate provides clear gating. The shift from highland to volcanic can be abrupt (geologically plausible for a caldera edge or fumarole field). **No action needed.**

---

## 5. What Must Be Locked Before Production Gates

### 5.1 Before Environment Concept Art

| Decision | Status | Priority |
|----------|--------|----------|
| Precise 3-basin boundary map | OPEN | P0 |
| Redwood belt width specification | TENTATIVE | P0 |
| Coast inlet shape and scale | TENTATIVE | P0 |
| Drowning forest transition logic | UNSPECIFIED | P0 |
| Foothill-to-spur elevation profile | UNSPECIFIED | P1 |
| Channel visibility rules | OPEN | P1 |
| Ash frontier depth | OPEN | P1 |

**Minimum for concept art:** Resolve all P0 items.

### 5.2 Before Terrain Generation

| Decision | Status | Priority |
|----------|--------|----------|
| All P0 items above | — | P0 |
| Exact city spur elevation and shelf width | UNSPECIFIED | P0 |
| River placement (which streams drain where) | UNSPECIFIED | P0 |
| Continental scale reference | UNSPECIFIED | P0 |

**Critical for terrain:** A rough kilometer-scale map showing:
- Coastline shape
- Basin boundaries
- City spur location and extent
- Ash frontier boundary
- Approximate distances between key points

### 5.3 Before Native 1–5 Starter Zone Map Work

| Decision | Status | Priority |
|----------|--------|----------|
| All terrain decisions above | — | P0 |
| Native ancestral village exact placement | UNSPECIFIED | P0 |
| Arrival landing enclave exact placement | UNSPECIFIED | P0 |
| Wet basin traversability profile | UNSPECIFIED | P1 |
| Redwood navigation logic (canopy paths vs ground) | UNSPECIFIED | P1 |

**Recommendation:** Create a 1–5 zone mini-doc specifying:
- Village location relative to basin center
- Distance to first redwood edge
- Distance to Arrival landing
- Key traversal challenges

---

## 6. Recommended Next Worldbuilding Milestone

### Milestone: Geography Lock for Starter Slice

**Objective:** Resolve all P0 decisions from Section 5 and produce a single source-of-truth geography document.

**Deliverable:** `Starter_Slice_Geography_LOCKED.md`

**Contents:**
1. Kilometer-scale overview map (ASCII or simple diagram)
2. 3-basin drainage specification with river placement
3. Coast inlet shape and dimensions
4. All 8-region boundary definitions
5. Transition zone specifications (Sections 4.1–4.4)
6. Scale reference (walking times between key points)
7. Sightline specifications (what's visible from where)

**Acceptance Criteria:**
- [ ] Technical Architect can derive coordinate bounds from the doc
- [ ] Worldbuilder can derive biome transition assets from the doc
- [ ] Systems Designer can place encounter zones from the doc
- [ ] No remaining [OPEN] geography questions for the starter slice

**Owner:** Worldbuilder / Cartographer  
**Dependencies:** None (review complete, ready to proceed)  
**Blocked by:** Human approval on P0 decisions in Section 5

---

## 7. Missing World Docs and Sub-Docs

### 7.1 Required New Documents

| Document | Purpose | Priority |
|----------|---------|----------|
| `Starter_Slice_Geography_LOCKED.md` | Single source of truth for terrain generation | P0 |
| `Native_Starter_Zone_1-5.md` | Detailed 1–5 playable area specification | P0 |
| `Arrival_Starter_Zone_1-5.md` | Detailed 1–5 playable area specification | P0 |
| `Convergence_City_Geography.md` | City layout, districts, verticality | P1 |
| `Biome_Visual_Specs.md` | Color palette, mood, key assets per biome | P1 |

### 7.2 Recommended Sub-Docs for WorldBible

| Document | Purpose | Priority |
|----------|---------|----------|
| `World_Scale_Reference.md` | Continental dimensions, walking speeds, distances | P1 |
| `Landmark_Registry.md` | Named landmarks with coordinates, sightlines, lore | P2 |
| `Weather_and_Atmosphere.md` | Seasonal patterns, mood lighting, environmental effects | P2 |
| `Flora_Fauna_Framework.md` | Ecological logic, creature biomes, resource distribution | P2 |

### 7.3 Existing Docs to Update

| Document | Update Needed |
|----------|---------------|
| `Starter_Continent_Slice.md` | Promote transition specifications to LOCKED after decisions made |
| `GLOSSARY.md` | Add geography terms (basin names, ridge names, etc.) only after locked |

---

## Appendix A: Risk Assessment Summary

| Risk | Severity | Mitigation |
|------|----------|------------|
| Terrain generated from underspecified geography | High | Lock Section 5 decisions before terrain work |
| Concept art produces incompatible biome visions | Medium | Hard transition specs before art begins |
| Native 1–5 zone feels disconnected from world | Medium | Create dedicated starter zone sub-doc |
| City spur scale mismatches vertical slice scope | Low | Validate against walking time estimates |
| Expansion routes contradict globe architecture | Low | Review against World_Overview.md constraints |

---

## Appendix B: Open Questions for Worldbuilding

From `Open_Questions.md` with Worldbuilder relevance:

1. **Weather impact** — How much should rain/fog affect visibility in the redwood belt? (Affects landmark sightlines)
2. **Death/respawn penalty** — Should respawn points follow the geography logically or be distributed by gameplay needs? (Affects settlement placement validation)
3. **Mount timing** — When do players get mounts? This affects perceived world scale. (Recommend: after city unlock, ~level 10)
4. **Gathering/professions** — Which biomes produce which resources? (Affects biome distinctiveness)

---

## Status Labels Used in This Review

- **[LOCKED]** — Confirmed canon, cited to source docs
- **[TENTATIVE]** — Direction set, needs specification
- **[PROPOSED]** — Worldbuilder recommendation, pending approval
- **[OPEN]** — Unresolved, blocks production

---

**Review completed by:** Worldbuilder / Cartographer  
**Next action required:** Human review and decision on Section 5 P0 items  
**Review cycle:** Upon resolution of P0 items, produce `Starter_Slice_Geography_LOCKED.md`
