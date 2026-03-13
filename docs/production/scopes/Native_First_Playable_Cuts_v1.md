# Native First Playable Scope Cuts v1
**Agent:** QA / Scope Police  
**Date:** 2026-03-12  
**Status:** LOCKED — Mandatory for Tonight's Playable  
**Responds To:** Repo Reality Inventory + Systems Min Loop Definition  

---

## Core Loop Definition (Required for RFP)

Tonight's playable must prove: **spawn → interaction → hazard → completion**

| Stage | Location | Mechanic | Mandatory? |
|-------|----------|----------|------------|
| Spawn | Hearthroot | Movement tutorial, first vista | **RFP** |
| Interaction | Shellmound | NPC dialogue, quest acceptance, gathering | **RFP** |
| Hazard | Breathing Holes | Gas vent timing, traversal | **RFP** |
| Completion | Shellmound | Return, reward, loop closure | **RFP** |

**Anything outside this loop is CUT or DEFERRED.**

---

## Feature Cut Table

| Feature | Was In | Status | Rationale |
|---------|--------|--------|-----------|
| Woven Arch climbing sequence | Blockout Spec 1.3 | **CUT** | Outside min loop; adds 3+ min to critical path. Demoted to vista-only landmark. |
| Tier 2 Ledge enemy encounter | Blockout Spec 1.3, Impl 2.5 | **CUT** | Combat not required for core loop. No AI budget for tonight. |
| Strider fauna AI | Impl 2.5 | **CUT** | AI system not proven; defer to Phase 2 post-playable. |
| Waymarker Vista climbing path | Blockout Spec 5.2 | **DEFERRED** | Keep as visual only; traversal deferred. |
| Full 4-objective quest arc | Quest Loop v1 | **CUT to 2 obj** | Keep: "Find Elder" + "Gather Pearls" + "Return". Cut: Woven Arch delivery step. |
| Breathpearl shrine offering | Quest Loop Step 3 | **CUT** | Requires Woven Arch climb; not in min loop. |
| Glow-lily return breadcrumbs | Quest Loop Step 4 | **CUT** | Nice-to-have; compass marker sufficient for RFP. |
| All 6 classes playable | Systems Review | **CUT to 1** | One class only (Armsman recommended — lowest implementation risk). |
| Progression flavor unlocks | Systems 7.2 | **DEFERRED** | Sidegrade systems post-date first playable. |
| Gear/crafting systems | Systems 9.3 | **CUT** | No crafting in RFP; rewards are XP + unlocks only. |
| Death/respawn penalty | Systems 5.2 | **CUT** | Death = respawn at Hearthroot, no penalty for RFP. |
| Fast travel unlock | Blockout Spec 4.5 | **CUT** | Not required for 200m slice. |
| Weather state changes | Blockout Spec 3 | **CUT** | Static lighting only for RFP. |
| VO implementation | Quest Loop, Impl 2.6 | **CUT** | Subtitles only; audio deferred to Phase 3. |
| Marshstrider Boots reward | Quest Loop Rewards | **DEFERRED** | XP-only rewards for RFP; gear system not proven. |
| Multiplayer/networking | Systems Review | **CUT** | Local/single-player only for RFP. |
| Full vendor economy | Systems 9.3 | **CUT** | No vendors, no trade, no AH in RFP. |
| Codex/lore unlocks | Quest Loop Rewards | **CUT** | Lore delivery via NPC dialogue only. |
| Weak handhold crumbling | Impl 2.4 | **CUT** | Climbing cut entirely; mechanic deferred. |
| Fall damage system | Quest Loop Fail-Safes | **CUT** | No climbing = no fall damage needed. |
| Full Phase 0-3 timeline | Impl Breakdown | **CUT to Phase 1+** | Phase 0 (tooling) assumed done; ship Phase 1 blockout + minimal hooks only. |
| CI/build automation | Impl Phase 0.3 | **DEFERRED** | Manual build verification for RFP. |
| Naming convention validation | Impl Phase 0.3 | **DEFERRED** | Code review only for RFP. |
| Navigation mesh | Impl 1.2 | **CUT** | No AI = no navmesh needed for RFP. |
| Niagara VFX | Impl 3.3 | **CUT** | Placeholder particles only; no Niagara for RFP. |

---

## What Stays (RFP Summary)

| Category | In Scope |
|----------|----------|
| **Zone** | 200m × 150m wetland basin, Hearthroot spawn, Shellmound, Breathing Holes |
| **Traversal** | Walk, run, wading (slowed movement in water) |
| **NPC** | 1 (Shellkeeper Elder) — dialogue, quest giver, completion trigger |
| **Quest** | 2-step: "Find Elder" → "Gather 3 Breathpearls" → "Return to Elder" |
| **Gathering** | Breathpearls at Breathing Holes (5 spawns, need 3, 1.5s channel) |
| **Hazard** | Gas vents: 4s safe / 1s warn / 3s active / 2s fade, 5 HP/tick |
| **UI** | Compass marker, quest tracker, subtitles, interaction prompt |
| **Rewards** | 250 XP, level-up to 2 |
| **Visual** | Graybox + one wetland material pass, static lighting |
| **Audio** | Ambient loop only (no VO, no positional audio) |

---

## Post-Playable Recovery List (FA Priority)

Features cut tonight that return immediately after:

1. Woven Arch climbing + full quest arc
2. Strider fauna AI + Tier 2 Ledge combat
3. Marshstrider Boots + basic gear system
4. VO + subtitle integration
5. Niagara VFX for gas vents
6. Weak handhold climbing mechanic
7. Multiplayer authority basics

---

## One-Sheet Constraint

> **If it doesn't serve spawn→interaction→hazard→completion, it's not in tonight's build.**

Total scope: 1 NPC, 1 quest, 1 hazard, 1 reward. Nothing else ships.

---
*Document: Native_First_Playable_Cuts_v1.md*  
*Next Agent: Prototype Builder (execution), Director (sign-off)*
