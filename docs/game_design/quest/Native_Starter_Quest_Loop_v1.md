# Native Starter Quest Loop v1
## Project Avalon - First-Playable Wetland Slice

---

## Agent Output Protocol Header

| Field | Value |
|-------|-------|
| **Quest Title** | The Shellkeeper's Burden |
| **Level Band** | 1–2 (Tutorial) |
| **Quest Giver** | Shellkeeper Elder (NPC at Shellmound) |
| **Zone** | The Drowning Marshes (Wetland) |
| **Estimated Duration** | 4–6 minutes (minimal loop) |

---

## Systems Minimal Loop

**Tonight's Slice:** `SPAWN → INTERACT → GATHER → HAZARD → COMPLETION`

The quest flow below is annotated to align with this minimal loop, with labels indicating implementation priority for the current sprint.

---

## Quest Flow

### 1. SPAWN — Hearthroot Spawn Point
**[LABEL: Required]** — Core to minimal loop

**Objective:** Player spawns at Hearthroot settlement entry point

The player begins at Hearthroot, the small marsh-dweller settlement. Immediate compass marker points toward Shellmound (40m).

- **What the player learns:** Basic movement (WASD), camera control
- **Trigger:** Auto-starts on player spawn (`MAP_NCFP_Blockout` spawn point)
- **Evidence Expectation:** Spawn point configured in PIE map
  - *Links to:* `NCFP-01` — Stand up PIE test map
  - *Evidence:* `/Evidence/NCFP/Blockout/` screenshot showing spawn position
- **VO Beat:** *(Deferred for Foundation)* — Silent arrival; environmental audio only for slice

---

### 2. INTERACT — Shellkeeper Elder Dialogue
**[LABEL: Required]** — Core to minimal loop

**Objective:** Speak with Shellkeeper Elder at Shellmound to receive quest

The Shellkeeper Elder stands by the great spiral shell at Shellmound. She explains the village's struggle: the Breathing Holes emit restorative gas that sustains the marsh, but recent disturbances have scattered the precious Breathpearls that form around the vents.

- **What the player learns:** Dialogue interaction, quest acceptance UI
- **Required Mechanics:** Interact key (E) to initiate dialogue, click to advance
- **Trigger:** Proximity-based interact prompt on `BP_ShellkeeperInteract`
- **Evidence Expectation:** Quest log screenshot showing active objective
  - *Links to:* `NCFP-03` — Implement Shellkeeper interaction + gather trigger
  - *Impl Evidence:* Quest log screenshot with "Gather Breathpearls" objective visible
  - *Review Sign-off:* Quest Designer confirms dialogue text matches spec
- **VO Beat:** *"The holes breathe in cycles. Watch the wind. Listen. The safe path reveals itself to the patient."* — Shellkeeper Elder (text-only for slice; VO Foundation-Active)

---

### 3. GATHER — Collecting Breathpearls
**[LABEL: Required]** — Core to minimal loop

**Objective:** Collect 3 Breathpearls from the Breathing Holes area

The Elder directs the player to the nearby Breathing Holes—vents that periodically emit toxic deep-gas. Breathpearls form around these vents and can be gathered during safe intervals.

- **What the player learns:** Gathering mechanic, objective tracker updates
- **Required Mechanics:** Walk/run, interact to gather (1.5s channel, interruptible)
- **Gatherable Placement:** 5 Breathpearl spawn points (player needs 3; extras for cushion)
- **Visual:** Breathpearls emit faint blue bioluminescence
- **Trigger:** `BP_ShellkeeperInteract` enables gather objectives on quest accept
- **Evidence Expectation:** Gather log screenshot showing 1/3, 2/3, 3/3 progression
  - *Links to:* `NCFP-03` — Implement Shellkeeper interaction + gather trigger
  - *Impl Evidence:* Screenshot of inventory/quest log with partial gather count
  - *Review Sign-off:* Systems confirms gather increments correctly

---

### 4. HAZARD — Breathing Hole Gas Cycle
**[LABEL: Required]** — Core to minimal loop

**Objective:** Navigate the Breathing Hole area while avoiding toxic gas emissions

The Breathing Holes emit periodic gas clouds that force the player to time their gathering carefully. This is the slice's primary skill check.

- **What the player learns:** Environmental hazard awareness, timing-based traversal
- **Required Mechanics:** Observe visual/audio cues, time movements between safe windows
- **Hazard Spec:**
  - 8-second cycles (4s safe, 4s toxic)
  - Gas damage: 5 HP/tick, 1 tick/second (non-lethal for level 1 players with 100 HP)
  - Audio cue (deep exhale) plays 1 second before gas emission
  - Visual: yellow-green vapor + surface shimmer when toxic
- **Integration:** Gas cycles gate access to gatherable Breathpearls
- **Evidence Expectation:** Hazard timing log + video showing safe/toxic phases
  - *Links to:* `NCFP-02` — Implement hazard lane (single Breathing Hole gate)
  - *Impl Evidence:* Video/screenshot showing gas emission cycle (0s, 8s, 16s)
  - *Review Sign-off:* Scope Police confirms hazard timing matches spec

---

### 5. COMPLETION — Waymarker Ledge
**[LABEL: Required]** — Core to minimal loop

**Objective:** Reach the Waymarker ledge to complete the slice

Upon gathering the required Breathpearls, the player proceeds to the Waymarker—a raised ledge overlooking the marsh that marks the slice's endpoint. No return to Elder required for tonight's validation.

- **What the player learns:** Quest completion loop, trigger volume interaction
- **Required Mechanics:** Enter completion trigger volume at Waymarker ledge
- **Trigger:** `BP_WaymarkerComplete` fires on player overlap (requires 3/3 Breathpearls gathered)
- **Completion Event:** "Slice Complete" log entry + optional UI notification
- **Evidence Expectation:** Completion screenshot/video showing trigger activation
  - *Links to:* `NCFP-04` — Implement completion trigger at Waymarker ledge
  - *Impl Evidence:* Screenshot of completion trigger firing + log entry
  - *Review Sign-off:* Systems confirms completion state properly logged
- **VO Beat:** *(Deferred)* — Full quest return dialogue deferred to Foundation phase

---

## Full Loop Evidence Capture
**[LABEL: Required]** — Validation artifact

Once all systems are integrated, capture the full player journey through the minimal loop.

- **Evidence Expectation:** Full PIE video showing spawn → interact → gather → hazard navigation → completion
  - *Links to:* `NCFP-05` — Capture PIE video + log evidence
  - *Impl Evidence:* 1080p video file stored at `/Evidence/NCFP/NCFP_Full_Loop_v1.mp4`
  - *Review Sign-off:* Director validates loop timing and flow

---

## Foundation-Active Content (In Progress, Not Blocking Slice)

The following content is being worked in parallel but is **not required** for tonight's minimal loop validation:

### The Ascent — Woven Arch
**[LABEL: Foundation-Active]**

**Objective:** (Deferred from minimal loop) Deliver Breathpearls to offering shrine atop Woven Arch

The full quest requires climbing the ancient Woven Arch—a tangled mass of roots and woven reeds—to reach the offering shrine. This traversal section provides verticality and atmosphere but is cut from the minimal loop for scope.

- **What the player learns:** Climbing mechanic, verticality, drop-down/ledge hang
- **Required Mechanics:** Climb (hold Space on climbable surfaces), drop-down (Ctrl)
- **Hazard:** Weak handholds (visual cracks) crumble after 3s hang time
- **Evidence Expectation:** Climbing prototype video (separate from slice validation)
  - *Note:* Not linked to NCFP tasks; tracked separately under Foundation milestone
- **VO Beat:** *"The Arch was old when my grandmother's grandmother was young. Treat it with respect, and it will carry you."* — Shellkeeper Elder

### Return Journey — Homeward Bound
**[LABEL: Foundation-Active]**

**Objective:** (Deferred from minimal loop) Return to Shellkeeper Elder at Shellmound

The full quest loop includes descending from Woven Arch and returning to the Elder for rewards. For the minimal slice, the Waymarker completion trigger substitutes this step.

- **What the player learns:** Breadcrumb navigation, quest reward acquisition
- **Breadcrumbs:** Glow-lilies mark return path (spawn after shrine interaction)
- **Evidence Expectation:** Return path navigation test
  - *Note:* Deferred; return flow validated in Foundation phase

---

## Deferred Content (Post-Foundation)

### NPC & VO Implementation
**[LABEL: Deferred]**

- Shellkeeper Elder model (currently: placeholder geometry)
- VO audio files (4 lines: 2 Elder, 1 villager, 1 completion)
- Subtitle system integration
- "Quest available" indicator (glow above head)

### Reward System
**[LABEL: Deferred]**

| Reward | Status | Details |
|--------|--------|---------|
| **XP** | Deferred | 250 XP (enough for level 2) — pending progression system |
| **Item** | Deferred | *Marshstrider Boots* — +5% wetland movement speed — pending inventory system |
| **Lore Unlock** | Deferred | Codex entry "The Breathing Holes" — pending codex system |

### Expansion Hooks
**[LABEL: Deferred]**

- Post-quest Elder dialogue about "The Deep Marsh" (teases next zone)
- Offering shrine interaction mentioning deeper marsh regions

---

## Acceptance Criteria for Implementation

### Required (Blocking Slice Acceptance)

| Criteria | Status | Evidence Link |
|----------|--------|---------------|
| Spawn point configured at Hearthroot | ☐ | `NCFP-01` — Blockout screenshot |
| Compass marker points to Shellmound (40m) | ☐ | Visual confirmation in video |
| Shellkeeper interact prompt functional | ☐ | `NCFP-03` — Quest log screenshot |
| 5 Breathpearl spawn points placed | ☐ | `NCFP-03` — Gather log screenshot |
| 1.5s gather channel functional | ☐ | `NCFP-03` — Video showing channel bar |
| Breathing Hole gas cycle (8s: 4s safe/4s toxic) | ☐ | `NCFP-02` — Hazard timing log |
| Audio cue 1s before gas emission | ☐ | `NCFP-02` — Video with audio |
| Waymarker completion trigger | ☐ | `NCFP-04` — Completion screenshot |
| Full loop video captured | ☐ | `NCFP-05` — `/Evidence/NCFP/` video file |

### Foundation-Active (Non-Blocking)

| Criteria | Status | Notes |
|----------|--------|-------|
| Woven Arch climbable surfaces | ☐ | 6 surfaces, braided root texture |
| Weak handhold crumble mechanic | ☐ | 3s hang time limit |
| Return path glow-lilies | ☐ | Spawn on shrine interaction |
| Shellkeeper Elder model | ☐ | Giant snail-shell structure placeholder |
| Fall damage disabled (first 3m) | ☐ | Tutorial safety only |

---

## Design Notes

**Philosophy:** This minimal loop validates core systems integration. Each step teaches ONE mechanic in a low-stakes environment. The wetland setting justifies slow, deliberate movement—no sprinting through this slice.

**Scope Boundary:** The Woven Arch climb and return journey are intentionally deferred. They add atmosphere and narrative payoff but are not required to validate that spawn→interact→gather→hazard→completion flows end-to-end.

**Pacing:** ~1 minute per step in the minimal loop. The hazard timing adds the primary skill expression; everything else is traversal and UI.

**Fail-Safes:**
- Gas is annoying but not lethal
- Extra Breathpearls prevent soft-lock from missed gatherables
- Waymarker trigger has generous bounds

**Evidence Chain:** All required tasks link to `NCFP-02` through `NCFP-05`. Implementation evidence lives in `/Evidence/NCFP/`. Review sign-offs tracked in this document's status tables.

---

*Document Version: 1.1 (Annotated for Systems Loop)*
*Designer: Quest Designer Agent*
*Date: 2026-03-12*
