---
**Status:** TENTATIVE  
**Agent:** Prototype Builder  
**Date:** 2026-03-11  
**Responds To:** /Docs/TechnicalDesign/Native_Starter_Blockout_Spec_v1.md, /Concept/Maps/Native_Starter_Micro_Map_v1.md  
**Next Agent:** Director (Review) → EnvironmentPipeline (Phase 1 execution)
---

# Native Starter Implementation Breakdown v1
## Project Avalon | First Playable Cradle | Production Roadmap

**Scope:** 200m × 150m wetland slice | 5-7 minute first-playable experience  
**Target:** Vertical slice proving core loops (traversal, hazard, quest, combat)  
**Success Criteria:** Player can complete full loop without guidance; emotional vista moment achieved

---

## Git Branch Strategy

| Branch | Purpose | Merge Policy |
|--------|---------|--------------|
| `main` | Stable, documented milestones only | PR + Director approval only |
| `dev/blockout-native-starter` | Active blockout work | PR review, CI build passes |
| `dev/gameplay-native-starter` | Quest + hazard implementation | Feature-complete before merge |
| `dev/polish-native-starter` | First playable polish gates | Bugfixes only, no new features |
| `prototype/*` | Experimental spikes | Never merge; delete after promotion |

**Build Note Updates:** Create `/Docs/TechnicalDesign/BuildNotes/Native_Starter_Phase{0-3}_v1.md` at each phase gate.

---

## Phase 0: Tooling & Verifications
**Goal:** UE5 project operational; team can iterate without blockers  
**Duration Estimate:** 2-3 days  
**Branch:** `dev/blockout-native-starter` (cut from `main`)

### Phase 0 Inputs
| Input | Source | Status |
|-------|--------|--------|
| UE5 Engine Workspace Foundation spec | Technical Architect | ✅ Complete |
| Folder/naming conventions | Technical Architect | ✅ Complete |
| World Partition philosophy | Technical Architect | ✅ Complete |
| UE 5.4.x engine version | Technical Architect | ✅ Locked |

### Phase 0 Owners
| Role | Responsibility |
|------|----------------|
| Technical Architect | UE5 project initialization, CI setup, naming enforcement |
| Prototype Builder | Verify tooling chain, create phase gates |
| QA/Scope | Validate build pipeline, establish test harness |

### Phase 0 Tasks

#### 0.1 — Project Skeleton (Day 1)
- [ ] Create `Avalon.uproject` with `Avalon` + `AvalonEditor` modules
- [ ] Configure `DefaultEngine.ini` with World Partition settings (128m tiles, 2x2 per cell)
- [ ] Set up `.gitignore` (DerivedDataCache, Saved/Logs, Intermediate, Binaries)
- [ ] Create folder structure per UE5 Engine Workspace Foundation spec
- [ ] Add naming validation to `DefaultGame.ini`

#### 0.2 — World Partition Shell (Day 1-2)
- [ ] Create `MAP_World_Persistent` with empty streaming shell
- [ ] Configure streaming grid for Native Starter region (200m × 150m + 50m buffer)
- [ ] Set up baseline data layers: `Traversal`, `Settlements`, `PointsOfInterest`, `FX`, `Debug`
- [ ] Lock `WorldPartitionStreamingPolicy` in config (requires doc justification to override)
- [ ] Create `MAP_SeamTest_NativeStarter` under `Content/Tests/`

#### 0.3 — CI & Automation (Day 2)
- [ ] CI step: Validate folder + naming conventions
- [ ] CI step: Confirm prototype assets excluded from cook
- [ ] CI step: Build verification (editor + game targets compile)

#### 0.4 — Character Controller Baseline (Day 2-3)
- [ ] Import or create basic third-person character controller
- [ ] Configure movement values (walk speed, wading speed modifier)
- [ ] Test spawn in `MAP_NativeStarter_Blockout` (placeholder map)
- [ ] Verify streaming shell loads/unloads grids correctly

### Phase 0 Dependencies
- UE 5.4.x installed and accessible
- Git LFS configured for `.uasset`, `.umap`, large textures
- Build machine access for CI

### Phase 0 Acceptance Criteria
- [ ] `Avalon.uproject` opens without errors
- [ ] CI passes on `dev/blockout-native-starter` branch
- [ ] Character can spawn and move in empty `MAP_NativeStarter_Blockout`
- [ ] World Partition grid visible and functional
- [ ] Build note created: `/Docs/TechnicalDesign/BuildNotes/Native_Starter_Phase0_v1.md`

---

## Phase 1: Blockout Order
**Goal:** Traversable graybox geography; landmark placement validated  
**Duration Estimate:** 5-7 days  
**Branch:** `dev/blockout-native-starter`

### Phase 1 Inputs
| Input | Source | Status |
|-------|--------|--------|
| Native Starter Micro Map v1 | Worldbuilder | ✅ Complete |
| Native Starter Blockout Spec v1 | Worldbuilder | ✅ Complete |
| Native Starter Zone Tech Review v0 | Technical Architect | ✅ Complete |
| Quest Loop v1 (structure) | Quest Designer | ✅ Complete |

### Phase 1 Owners
| Role | Responsibility |
|------|----------------|
| EnvironmentPipeline | Landscape sculpt, water placement, collision passes |
| Prototype Builder | Landmark blockouts, traversal validation, metrics verification |
| Worldbuilder | Layout sign-off, landmark placement approval |
| QA/Scope | Spatial metrics validation, traversal timing tests |

### Phase 1 Tasks

#### 1.1 — Macro Landscape (Day 1-2)
- [ ] Sculpt wetland basin footprint (200m × 150m)
- [ ] Establish elevation baseline: 0m = wetland floor
- [ ] Place water plane at -0.5m (wadeable, not swimmable)
- [ ] Sculpt Hearthroot area: root overhang, dry pocket
- [ ] Sculpt Shellmound: 8m diameter, +2m elevation
- [ ] Sculpt Breathing Holes depression: 12m × 8m, -1m
- [ ] Sculpt Tier 2 Ledge: +4m elevation
- [ ] Sculpt Waymarker Vista: +8m elevation, eastern edge

#### 1.2 — Path Network & Collision (Day 2-3)
- [ ] Block main path: Hearthroot → Breathing Holes → Shellmound → Woven Arch (~120m)
- [ ] Block climb path: Hearthroot → Tier 2 Ledge → Waymarker Vista (~80m)
- [ ] Place blocking volumes for village backdrop (non-enterable)
- [ ] Verify path distances match spec (see table below)
- [ ] First-pass navmesh generation (wadeable surfaces marked)

#### 1.3 — Landmark Blockouts (Day 3-5)

**Hearthroot (Spawn)**
- [ ] Root geometry placeholder: 3-4m main trunk, 0.5m exposed roots
- [ ] Overhang creating dry pocket (3m × 2m sheltered)
- [ ] Spawn point placement: facing east, under overhang
- [ ] Climbable root tutorial surface

**Shellmound (Quest Hub)**
- [ ] Mound geometry: 8m diameter, +2m elevation
- [ ] Flattened summit (2m × 2m) for NPC placement
- [ ] 5-7 standing stone placeholders (1.5m height)
- [ ] Path connection visible to Woven Arch

**Woven Arch (Departure Threshold)**
- [ ] Archway placeholder: 4m wide, 5m tall peak
- [ ] Clearing before arch: 6m diameter
- [ ] 3 ritual marker stone placeholders
- [ ] Invisible boundary at village edge (narrative gate)

**Breathing Holes (Hazard Pocket)**
- [ ] Depression geometry: 12m × 8m, -1m depth
- [ ] 5 vent point placeholders (1m diameter each)
- [ ] Safe path route: 2m wide timing-based traversal
- [ ] Visual distinction: dead vegetation ring

**Waymarker Vista (Promise Point)**
- [ ] Elevated platform: +8m, 6m × 4m
- [ ] Stone marker placeholder: 2m height
- [ ] Clear sightline to distant Foothill/Redwood massif
- [ ] Framed view through natural gap

#### 1.4 — Metrics Validation (Day 5-6)
- [ ] Measure all path distances (target: see table below)
- [ ] Time traversal with base movement speed (target: 90s main path, 60s climb)
- [ ] Verify climb sequence: Tier 1→2 (3m), Tier 2→3 (4m), Tier 3→Vista (2m)
- [ ] Document any deviations in Build Notes

| From | To | Target Distance | Tolerance |
|------|-----|-----------------|-----------|
| Hearthroot | Breathing Holes | 40m | ±5m |
| Breathing Holes | Shellmound | 50m | ±5m |
| Shellmound | Woven Arch | 40m | ±5m |
| Hearthroot | Tier 2 Ledge | 60m | ±5m |
| Tier 2 Ledge | Waymarker Vista | 30m | ±3m |
| Waymarker Vista | Shellmound | 50m | ±5m |

#### 1.5 — Seam & Streaming Validation (Day 6-7)
- [ ] Validate streaming grid loads correctly during full loop traversal
- [ ] Verify no pop-in at vista point (distant landmarks visible)
- [ ] Test `MAP_SeamTest_NativeStarter` with automated walkthrough
- [ ] Memory check: <2.1 GB for full cradle + seam bands

### Phase 1 Dependencies
- Phase 0 completion (tooling operational)
- Graybox materials (M_Graybox_01, M_Water_Proxy)
- Basic collision primitives library

### Phase 1 Acceptance Criteria
- [ ] Player can complete full loop (spawn → vista → shellmound → spawn) without guidance
- [ ] All path distances within tolerance
- [ ] All 7 landmarks placed and traversable
- [ ] Climb sequences functional (no fall-through)
- [ ] Water plane wades correctly (movement slowed)
- [ ] Village backdrop blocks entry (invisible collision)
- [ ] Vista point shows framed view to distant landmarks
- [ ] Build note created: `/Docs/TechnicalDesign/BuildNotes/Native_Starter_Phase1_v1.md`

---

## Phase 2: Gameplay Hooks
**Goal:** Core mechanics functional (quest, hazard, climb, combat)  
**Duration Estimate:** 7-10 days  
**Branch:** `dev/gameplay-native-starter` (merge Phase 1 first)

### Phase 2 Inputs
| Input | Source | Status |
|-------|--------|--------|
| Native Starter Quest Loop v1 | Quest Designer | ✅ Complete |
| Quest Arc v0 (context) | Quest Designer | ✅ Complete |
| Hazard vent cadence spec | Systems Designer | ⚠️ Needs Phase 2 task |
| Climbing mechanic requirements | Systems Designer | ⚠️ Needs Phase 2 task |
| Strider fauna AI brief | Systems Designer | ⚠️ Needs Phase 2 task |

### Phase 2 Owners
| Role | Responsibility |
|------|----------------|
| Prototype Builder | Blueprint implementation, mechanic integration |
| Systems Designer | Hazard timing, climb parameters, combat tuning |
| Quest Designer | Quest script, dialogue hooks, VO placement |
| ContentIntegrator | NPC placement, gatherable placement, audio hooks |

### Phase 2 Tasks

#### 2.1 — Quest Framework Setup (Day 1-2)
- [ ] Create quest data asset: `DA_Quest_Native_Starter_001`
- [ ] Quest states: INACTIVE → ACTIVE → GATHERING → DELIVERING → COMPLETE
- [ ] Compass marker system: sequential updates per objective
- [ ] Quest tracker UI wiring (distance display)

#### 2.2 — Departure Quest Implementation (Day 2-4)

**Objective 1: Find Shellkeeper Elder at Shellmound**
- [ ] Spawn trigger at Hearthroot sets quest ACTIVE
- [ ] Compass marker points to Shellmound (80m)
- [ ] Optional: villager VO trigger at Hearthroot

**Objective 2: Collect 3 Breathpearls from Breathing Holes**
- [ ] Place 5 Breathpearl gatherables at Breathing Holes
- [ ] Implement 1.5s channel interaction (interruptible)
- [ ] Breathpearls emit faint blue bioluminescence
- [ ] Quest counter tracks collection (3/3)

**Objective 3: Deliver to Offering Shrine atop Woven Arch**
- [ ] Shrine interaction point at Woven Arch clearing
- [ ] Quest state updates on shrine interaction
- [ ] Glow-lily breadcrumbs spawn on return path

**Objective 4: Return to Shellkeeper Elder**
- [ ] Return compass marker updates
- [ ] Completion trigger at Elder
- [ ] Reward: 250 XP + Marshstrider Boots auto-equip

#### 2.3 — Hazard: Breathing Holes (Day 3-5)
- [ ] Create `BP_Hazard_VentManager` (per-sub-area manager)
- [ ] Vent timing cadence: 4s dormant → 1s warning → 3s active → 2s dissipate
- [ ] Visual states: gentle bubbling → shimmer → gas eruption → fade
- [ ] Audio cues: gurgle → rising tone → hiss/whoosh → fade
- [ ] Damage: 5 HP/tick (non-lethal for 100 HP level 1)
- [ ] Safe path: 2m wide, clear timing window
- [ ] 3+ attempts required to learn pattern (validation test)

#### 2.4 — Climbing System (Day 4-6)
- [ ] Mark 6 climbable surfaces on Woven Arch (braided root visual)
- [ ] Implement climb hold (Space) + drop-down (Ctrl)
- [ ] 2 weak handholds: crumble after 3s hang time
- [ ] Fall damage disabled for first 3m (tutorial safety)
- [ ] Edge highlighting for drop-down points
- [ ] Integration with root path climb (Hearthroot → Tier 2)

#### 2.5 — Combat: Strider Ledge (Day 5-7)
- [ ] Place 3-5 Strider-class fauna at Tier 2 Ledge
- [ ] AI behavior: territorial (low aggression, no pursuit beyond 10m)
- [ ] Combat validation: melee-favorable (limited space)
- [ ] Alternative: sneak path (water approach muffles sound)
- [ ] Alternative: bypass via root climb

#### 2.6 — NPC & Dialogue (Day 6-8)
- [ ] Place Shellkeeper Elder at Shellmound summit
- [ ] Quest available indicator (glow above head)
- [ ] Dialogue triggers: accept quest, completion, optional post-quest
- [ ] Subtitle integration (enabled by default)
- [ ] VO placeholder integration (4 lines)

#### 2.7 — Integration & Tuning (Day 8-10)
- [ ] Full quest loop playtest: 8-12 minute target
- [ ] Hazard timing feel test (fair but learnable)
- [ ] Climb flow validation (no stuck states)
- [ ] Combat difficulty check (challenging but not punishing)
- [ ] Fail-safe validation: gas not lethal, extra Breathpearls available

### Phase 2 Dependencies
- Phase 1 complete (blockout traversable)
- Base character controller with interaction system
- Basic AI controller for Strider fauna
- Dialogue system framework
- VO audio files (or placeholders)

### Phase 2 Acceptance Criteria
- [ ] Quest loop completable: spawn → gather → deliver → return
- [ ] Compass markers update sequentially without confusion
- [ ] Breathing Holes hazard: timing learnable in 3+ attempts
- [ ] Climbing: no fall-through, weak handholds crumble correctly
- [ ] Combat: Striders territorial, player has tactical options
- [ ] NPC: Elder interactable, quest indicators clear
- [ ] Total playtime: 8-12 minutes for first-time player
- [ ] Build note created: `/Docs/TechnicalDesign/BuildNotes/Native_Starter_Phase2_v1.md`

---

## Phase 3: Polish Gates for First Playable
**Goal:** Emotional resonance, stability, build-readiness  
**Duration Estimate:** 5-7 days  
**Branch:** `dev/polish-native-starter` (merge Phase 2 first)

### Phase 3 Inputs
| Input | Source | Status |
|-------|--------|--------|
| Phase 2 complete build | Prototype Builder | ⏳ Pending |
| Audio ambience spec | ContentIntegrator | ⚠️ Needs Phase 3 task |
| VFX polish pass brief | ConceptArt/EnvironmentPipeline | ⚠️ Needs Phase 3 task |
| Lighting pass spec | EnvironmentPipeline | ⚠️ Needs Phase 3 task |

### Phase 3 Owners
| Role | Responsibility |
|------|----------------|
| Prototype Builder | Bug fixes, stability, performance validation |
| EnvironmentPipeline | Lighting pass, material polish, atmosphere |
| ContentIntegrator | Audio integration, VFX placement, ambience |
| QA/Scope | Full playtest pass, performance profiling, sign-off |

### Phase 3 Tasks

#### 3.1 — Visual Polish (Day 1-3)
- [ ] Lighting pass: time of day locked, mood established
- [ ] Hearthroot: root overhang shelter reads clearly
- [ ] Water: wetland material (not placeholder), wadeable clarity
- [ ] Shellmound: midden heap reads as overgrown ancient site
- [ ] Woven Arch: woven willow texture, boundary clarity
- [ ] Breathing Holes: dead vegetation ring, vent bubbling VFX
- [ ] Waymarker Vista: framed view to distant landmarks

#### 3.2 — Audio Integration (Day 2-4)
- [ ] Wetland ambience loop (background)
- [ ] Village distance audio (through Woven Arch)
- [ ] Hearthroot: sheltered audio contrast
- [ ] Breathing Holes: hazard audio cadence
- [ ] Shellmound: distinct audio zone
- [ ] VO implementation (4 lines with subtitles)

#### 3.3 — VFX Polish (Day 3-5)
- [ ] Breathpearl: blue bioluminescence pickup VFX
- [ ] Shrine interaction: soft chime + bioluminescent pulse
- [ ] Quest complete: fanfare + UI notification VFX
- [ ] Gas vents: Niagara plume with LOD transitions
- [ ] Glow-lilies: return path breadcrumb VFX

#### 3.4 — Performance & Stability (Day 4-6)
- [ ] Memory profiling: <2.1 GB sustained
- [ ] Streaming validation: no hitches during traversal
- [ ] Load time: <10 seconds to spawn in
- [ ] Frame time: stable 33ms target on min-spec
- [ ] No crash bugs in 10 consecutive playthroughs

#### 3.5 — First Playable Validation (Day 5-7)
- [ ] **Emotional Response Test:** Vista moment creates awe/curiosity
- [ ] **Guidance Test:** Player can complete loop without external help
- [ ] **Hazard Fairness Test:** 3+ attempts to learn gas pattern
- [ ] **Time Budget Test:** 5-7 minutes exploration, 3 minutes return
- [ ] **Loop Completeness Test:** All 4 quest objectives clear
- [ ] **Bug-free Test:** No blocking bugs, soft-locks, or crashes

### Phase 3 Dependencies
- Phase 2 complete (all mechanics functional)
- Polish-quality audio assets
- VFX assets (Niagara plumes, pickup effects)
- Lighting scenario locked

### Phase 3 Acceptance Criteria (First Playable Gates)
- [ ] **SPATIAL:** Player can complete spawn → vista → shellmound → spawn without guidance
- [ ] **HAZARD:** Gas timing feels fair (3+ attempts to learn pattern)
- [ ] **EMOTIONAL:** Vista moment creates emotional response (awe/curiosity)
- [ ] **TIME:** Total playtime 5-7 minutes for first-time explorer
- [ ] **STABILITY:** No crashes, no soft-locks, no blocking bugs
- [ ] **PERFORMANCE:** Memory <2.1 GB, frame time stable, no streaming hitches
- [ ] **POLISH:** Lighting, audio, VFX at "first playable" quality (not final)
- [ ] **DOCUMENTATION:** Build note created: `/Docs/TechnicalDesign/BuildNotes/Native_Starter_Phase3_v1.md`
- [ ] **MERGE:** PR approved, merged to `main`, tagged `milestone/first-playable-v1`

---

## Summary Timeline

| Phase | Duration | Cumulative | Branch | Key Deliverable |
|-------|----------|------------|--------|-----------------|
| Phase 0 | 2-3 days | Day 3 | `dev/blockout-native-starter` | Tooling operational |
| Phase 1 | 5-7 days | Day 10 | `dev/blockout-native-starter` | Graybox traversable |
| Phase 2 | 7-10 days | Day 20 | `dev/gameplay-native-starter` | Mechanics functional |
| Phase 3 | 5-7 days | Day 27 | `dev/polish-native-starter` | First playable |

**Total Estimated Duration:** 3-4 weeks (single developer velocity)  
**Team Velocity:** Parallel work in Phases 1-3 can reduce to 2 weeks with 2-3 developers

---

## Risk Register

| Risk | Impact | Mitigation |
|------|--------|------------|
| UE5 World Partition instability | High | Validate streaming early (Phase 0), keep backup of working grid config |
| Hazard timing feels unfair | Medium | Iterate cadence in Phase 2, user test before Phase 3 |
| Climb mechanic edge cases | Medium | Extensive fall-through testing, safety teleport on stuck detection |
| Scope creep beyond slice | High | Strict reference to "Out of Scope" list in Blockout Spec v1 |
| Performance budget exceeded | Medium | Profile early (Phase 1), HLOD strategy from Tech Review v0 |
| VO/audio delays | Low | Use placeholder audio, prioritize gameplay validation |

---

## Out of Scope Reminders

Per Blockout Spec v1, the following remain **explicitly excluded** from all phases:
- Village interior spaces (buildings are backdrop only)
- Other Native regions (6-10, 11-15, etc.)
- Full faction questlines
- Crafting beyond "gather reed → craft torch" tutorial
- Swimming/deep water traversal
- Weather state changes
- Companion characters
- Mount/summon mechanics
- Combat beyond basic avoidance + single light attack

---

**End of Document**
