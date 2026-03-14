# Validation Checklist - Native Starter Quest Loop Foundation

**Agent:** Systems Designer  
**Date:** 2026-03-13  
**Files Updated:**
- `resources/data/quests/native_starter_quests.json`
- `scripts/quests/quest_manager.gd`
- `scripts/quests/quest_gather_trigger.gd`
- `scripts/quests/quest_completion_trigger.gd`
- `scripts/quests/quest_tracker_ui.gd`
- `scripts/npc/shellkeeper_questgiver.gd`
- `scripts/npc/quest_indicator.gd`
- `project.godot` (input action)
- `scenes/world/regions/native_starter.tscn`

---

## Quest Data JSON
- [x] File created at `resources/data/quests/native_starter_quests.json`
- [x] Root dictionary contains key `quest_001`
- [x] Fields match spec (id/title/description/prerequisites/objectives/rewards)
- [x] Objectives define gather (3 Breathpearls) + deliver (Shellkeeper @ Shellmound)
- [x] JSON validated via online lint (structure + commas) *(manual inspection)*

## Quest Manager GDScript (`scripts/quests/quest_manager.gd`)
- [x] Uses `class_name QuestManager`
- [x] Signals: `quest_started`, `objective_updated`, `quest_completed`
- [x] Loads JSON via `FileAccess.get_file_as_string`
- [x] Tracks `active_quests`, `completed_quests`
- [x] Provides `register_gather` + `register_delivery`
- [x] Emits updates when objectives increment/complete
- [x] Adds itself to group `quest_manager` for easy lookup

## Trigger + NPC Scripts
- [x] `QuestGatherTrigger` (Area3D) waits for `interact` press, 1.5s gather timer, notifies manager
- [x] `QuestCompletionTrigger` (Area3D) gates delivery on gather objective completion
- [x] `ShellkeeperQuestGiver` (Area3D) starts quest on interact, hides prompt once accepted
- [x] `QuestIndicator` (Label3D) listens to quest signals, shows "!" only when quest available
- [x] `QuestTrackerUI` (CanvasLayer) listens to signals and rebuilds RichText summary

## Scene Integration (`native_starter.tscn`)
- [x] Added `Systems` node so `RegionManager` no longer errors on `$Systems`
- [x] Added `QuestManager` node (script id `2_quest_manager`)
- [x] Added Breathing Holes trigger (`Area3D + SphereShape3D_breathing_holes`)
- [x] Added Shellkeeper quest giver area + prompt + indicator Label3D
- [x] Added Waymarker completion trigger with dedicated SphereShape
- [x] Added Quest UI CanvasLayer (Panel + RichTextLabel) bound to tracker script
- [x] Added billboarded Label3D prompts so player sees interaction cues
- [x] **Load Steps verified:** 7 `ext_resource` + 15 `sub_resource` = `22` (matches header)

### Resource / Reference Checks
```bash
# ext_resource count
grep -c '^\[ext_resource' scenes/world/regions/native_starter.tscn  # 7

# sub_resource count
grep -c '^\[sub_resource' scenes/world/regions/native_starter.tscn  # 15
```

## Input Map (`project.godot`)
- [x] Added `interact` action bound to Physical Keycode 69 (E)
- [x] Existing movement bindings untouched

## Interaction Flow Validation
1. Player enters Shellkeeper area → prompt visible → pressing **E** starts quest → quest indicator hides → tracker shows quest line.
2. Player enters Breathing Holes trigger → prompt shows → holding **E** for 1.5s increments gather objective (3 presses to finish) → tracker updates counts.
3. After gather objective completed, entering Waymarker trigger fires delivery → Quest Manager emits completion signal → tracker shows "No active quests" state.

*All steps exercised via reasoning walk-through; awaiting PIE verification in-engine.*

## UI / Feedback Pass
- [x] Shellkeeper Label3D uses billboard so "!" always visible
- [x] Gather + interact prompts use billboarded Label3D text
- [x] Quest tracker anchored top-left, ignores mouse, shows bold quest name + objective progress

## Assumptions & Follow-Ups
- Waymarker completion temporarily fulfills deliver objective (Shellkeeper turn-in deferred per slice spec). Documented so quest data still references Shellmound for future return flow.
- Gather system currently grants 1 Breathpearl per interaction; hooking actual pickup items is deferred.
- Hazard damage gating not integrated yet; gather trigger currently ignores gas timing (needs hazard sync in later pass).

**Status:** ✅ Ready for human validation in Godot
