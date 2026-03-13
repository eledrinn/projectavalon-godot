# Native Cradle: First Playable Min-Loop v1

**Goal:** Smallest loop proving Native Cradle core verb (Gather → Traverse → Turn In) in one vertical slice.

---

## The Loop (90-Second Target)

| Step | Element | Classification | Dependencies |
|------|---------|----------------|--------------|
| 1 | **Spawn** at Cradle Hollow entrance | **RFP** | `BP_Native_SpawnPoint`, `LVL_Cradle_Native_Proto` |
| 2 | **Interact** with Elder NPC (dialog) | **RFP** | `BP_NPC_Elder`, `DT_Dialog_NativeIntro` |
| 3 | **Receive** quest: "Gather 3 Glowcaps" | **RFP** | `Quest_Gather_Glowcap_Intro`, `UMG_QuestTracker` |
| 4 | **Traverse** to mushroom grove (cross fallen log) | **RFP** | `BP_Hazard_FallenLog`, `Spline_Movement_Component` |
| 5 | **Gather** 3 Glowcaps (interaction + animation) | **RFP** | `BP_Resource_Glowcap`, `ANM_Gather_Seed`, `InventoryComponent` |
| 6 | **Return** to Elder (reverse traverse) | **RFP** | Step 4 systems reused |
| 7 | **Turn In** (dialog + reward) | **RFP** | `BP_NPC_Elder` completion branch, `Reward_XP_Small` |
| 8 | **Loop exits** to free roam | **RFP** | `GameState_Cradle_OpenWorld` |

---

## Foundation-Active (FA) - Keep Light

| Element | Note |
|---------|------|
| Ambient SFX | Bird loops, wind — use placeholders |
| Basic VFX | Glowcap ember particles — simple sprite OK |
| Elder Idle Animation | 2-frame breathe loop acceptable |
| Ground Material | Base dirt, no blending required |
| Log Geometry | Basic box collision, bark texture optional |

---

## Deferred (Not in First Playable)

- Combat / enemies
- Day/night cycle
- Full inventory UI (track count only)
- Crafting
- Multiple biomes
- Voiceover / full dialog tree

---

## Evidence Expectations (Required Steps)

| Step | Prove With |
|------|------------|
| 1 | Player spawns at correct coords, camera facing Elder |
| 2 | Dialog advances on interact, quest auto-grants |
| 3 | Quest widget shows "0/3 Glowcaps", updates live |
| 4 | Player crosses log without falling (collision working) |
| 5 | Press [E] → gather anim plays → item count +1 → Glowcap despawns |
| 6 | Return path functional (no blockers) |
| 7 | Turn-in dialog fires, XP number appears, quest clears from tracker |
| 8 | Input unlocks, player can continue exploring |

---

## Quick Ref: Files to Touch

```
/Content/Native/Cradle/
  Maps/LVL_Cradle_Native_Proto
  Blueprints/Player/BP_Native_SpawnPoint
  Blueprints/NPC/BP_NPC_Elder
  Blueprints/Resources/BP_Resource_Glowcap
  Blueprints/Hazards/BP_Hazard_FallenLog
  Data/Quests/Quest_Gather_Glowcap_Intro
  UI/UMG_QuestTracker
```

---

**Success Criteria:** Player can complete loop start-to-finish without debug commands or known blockers. If any RFP step fails, loop is incomplete.
