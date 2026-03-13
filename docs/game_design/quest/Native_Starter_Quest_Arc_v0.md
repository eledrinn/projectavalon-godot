# Native Starter Quest Arc (Levels 1–5) — v0

**Status:** Proposed  
**Agent:** Quest Designer + Systems Designer Support  
**Date:** 2026-03-11  
**Responds To:** Task 001 — Phase 3 (Quest Arc)  
**Previous:** `native-starter-zone-v0.md` (Phase 2 Landmarks)  
**Next Agent:** Systems Designer (encounter scripting), Technical Architect (seamless terrain validation)

---

## Executive Summary

This document defines the level-by-level quest arc for the Native 1–5 starter experience in **Ashroot Cradle**. Each level band focuses on humble, everyday tasks—chores, channel tending, escort duties—that teach the Native worldview through participation rather than heroics. The arc culminates in the **Waymarker Transition**—the player's first departure from the cradle toward Verdant Spire.

**Core Design Principles:**
- Early quests are humble and grounded (chores, tending, escort) with minimal heroics
- Class-specific power unlocks deferred until Level 5; Bonder lore foreshadowed but binding questline starts post-level 5
- Waymarker funnels all players to Verdant Spire; Ash Frontier is teased but not yet selectable
- Severed presence is minimal in 1–5 (rumors + single encounter only)
- Old ways vs. new ways choices feel subtle, not dramatic
- Every quest reinforces the Native worldview (relationship over domination, place-memory, anti-hubris)

**Note on Future Pacing:** Severed presence remains light through the level 10 zone (sightings, rumors, minor skirmishes). Heavy Severed infiltration and true threat escalation are reserved for late-game content.

---

## Level 1: Root and Place

### Zone Focus: Stillwater Village (Hearthroot Hub)

**Narrative Purpose:** Introduce the player to Native identity through humble communal participation. Establish the foundational principle: *you are from a place that remembers.*

### Quest Beats

#### 1.1 — Welcome to the Cradle
- **Giver:** Elder Rootwalker (at Hearthroot)
- **Type:** Tutorial / Social
- **Landmark Tie:** Hearthroot gathering space
- **Beat:** Elder welcomes the player as a "new-grown root" returning to the village after time away. Introduces the Hearthroot as the village's living heart.
- **Mechanics:** Basic movement, interaction, UI familiarity
- **Old/New Tension:** Elder speaks of "remembering your place" while a Young Trapsetter NPC in background complains about "all this sitting and waiting"
- **Status:** `PROPOSED` | **Dependency:** None (entry point)

#### 1.2 — Tending the Channels
- **Giver:** Hearthroot Keeper
- **Type:** Chore / Ritual
- **Landmark Tie:** Hearthroot smoke channels
- **Beat:** The communal fire needs tending—player adjusts smoke vent bindings (timing mini-loop) to keep fire breathing evenly. Teaches patience and communal service through humble labor.
- **Mechanics:** Timing-based interaction; no failure state, only efficiency ratings
- **Reward:** Hearthroot Warmth buff (+10% health regen in village)
- **Status:** `PROPOSED` | **Dependency:** Basic interaction system

#### 1.3 — Gathering Reeds for the Weaver
- **Giver:** Village Weaver
- **Type:** Chore / Gathering
- **Landmark Tie:** Village outskirts (reed beds)
- **Beat:** Collect reeds for the weaver to repair communal wind-flaps. Simple, humble work that connects player to place.
- **Mechanics:** Resource gathering with quality ratings (damaged vs. pristine reeds)
- **Old/New Tension:** Weaver notes how "the young ones" prefer imported canvas now, but reeds remember the wind better
- **Status:** `PROPOSED` | **Dependency:** Gathering system

#### 1.4 — Messages for the Channel-Tenders
- **Giver:** Hearthroot Keeper
- **Type:** Errand / Escort
- **Landmark Tie:** Village to Miregarden edge
- **Beat:** Deliver warm broth and messages to the channel-tenders working at the village edge. No combat—just walking, observing, participating.
- **Mechanics:** NPC escort/follow behavior; dialogue triggers at waypoints
- **First Glimpse:** Brief environmental glimpse of distant gas drift—channel-tenders mention "strange markers in the deep" (Severed foreshadowing, subtle)
- **Status:** `PROPOSED` | **Dependency:** NPC follow system

#### 1.5 — The Hearthroot Rite
- **Giver:** Elder Rootwalker
- **Type:** Milestone / Social
- **Landmark Tie:** Hearthroot gathering space
- **Beat:** Participate in communal evening rite. Player chooses dialogue response during shared story—options emphasize old ways reverence, new ways curiosity, or balanced perspective.
- **Consequence:** Subtle faction lean tracking begins (affects future dialogue options, not mechanical lockouts)
- **Transition:** Elder declares the player "rooted enough to walk the channels"—unlocks Miregarden access
- **Status:** `PROPOSED` | **Dependency:** Dialogue system with consequence tracking

### Level 1 Summary
| Quest | Type | Landmark | Class Hook | Status |
|-------|------|----------|------------|--------|
| Welcome to the Cradle | Tutorial | Hearthroot | None | PROPOSED |
| Tending the Channels | Chore | Hearthroot | None | PROPOSED |
| Gathering Reeds for the Weaver | Gathering | Village edge | None | PROPOSED |
| Messages for the Channel-Tenders | Errand/Escort | Village to Miregarden | None | PROPOSED |
| The Hearthroot Rite | Milestone | Hearthroot | Choice-based | PROPOSED |


---

## Level 2: First Crossing

### Zone Focus: Miregarden (Transition to Wild)

**Narrative Purpose:** First travel beyond village safety. Introduce environmental storytelling and the concept that the wild is not evil—just *other*.

### Quest Beats

#### 2.1 — The Channel Walk
- **Giver:** Shellmound Watcher (met at village edge)
- **Type:** Escort / Exploration
- **Landmark Tie:** Miregarden entry channels
- **Beat:** Accompany the Watcher to Shellmound Ridge for a seasonal offering. Journey introduces knee-deep water movement penalties and fungal pad hopping.
- **Mechanics:** Water depth slows movement; optional dry routes via root ridges
- **First Wild Encounter:** Territorial reedback beetles (non-lethal, teach soft aggro)
- **Status:** `PROPOSED` | **Dependency:** Terrain-state movement modifiers

#### 2.2 — Shellmound Tending
- **Giver:** Shellmound Watcher
- **Type:** Chore / Choice
- **Landmark Tie:** Shellmound Ridge (summit)
- **Beat:** Tend the ancestral offerings—player chooses approach:
  - **Old Ways Path:** Gather specific flowers by moon phase, perform full ritual (longer, more immersive)
  - **New Ways Path:** Clear debris efficiently, use "practical" shortcuts (faster, less reverent dialogue)
- **Consequence:** Watcher remembers choice; subtle shift in future greetings
- **Status:** `PROPOSED` | **Dependency:** Time-of-day system (for moon phase), choice persistence

#### 2.3 — Clearing the Channel-Crossing
- **Giver:** Shellmound Watcher
- **Type:** Chore / Traversal
- **Landmark Tie:** Miregarden channels
- **Beat:** Clear debris from a clogged channel crossing—mundane labor that serves the community. Teaches environmental interaction.
- **Mechanics:** Movable objects (fallen branches, silt piles), temporary path creation
- **Forceshaper Hook:** Can reinforce crossing with temporary reed pylons (preview of shaping, but no combat utility yet)
- **Status:** `PROPOSED` | **Dependency:** Physics objects, temporary pathing

#### 2.4 — A Basket for the Returnee
- **Giver:** Young Trapsetter
- **Type:** Social / Errand
- **Landmark Tie:** Miregarden crossing point
- **Beat:** Deliver supplies to a Trapsetter returnee who has been to the basin edges. Brings news of changes—more gas pockets, strange chatter in the deep channels.
- **Ranger Hook:** Returnee mentions tracking opportunities if player shows interest
- **Old/New Tension:** Returnee excited by "progress" at the edges; Watcher concerned by "disturbance"
- **Status:** `PROPOSED` | **Dependency:** Mail/message system, NPC scheduling

#### 2.5 — The Ridge at Dusk
- **Giver:** Shellmound Watcher
- **Type:** Milestone / Vision
- **Landmark Tie:** Shellmound Ridge
- **Beat:** Witness solar alignment from mound summit. Triggers "ancestral resonance"—brief vision of pre-Ash landscape (educational worldbuilding).
- **Mechanics:** Time-of-day requirement (dawn or dusk); waiting at location triggers event
- **Reward:** Ancestral Sight buff (+perception for 1 hour), unlocks Level 4 dawn vigil quest
- **Transition:** Watcher declares the player "seen by the ancestors"—unlocks Ashroot Thicket access
- **Status:** `PROPOSED` | **Dependency:** Time-of-day event triggers, vision sequence tech

### Level 2 Summary
| Quest | Type | Landmark | Class Hook | Status |
|-------|------|----------|------------|--------|
| The Channel Walk | Escort | Miregarden | None | PROPOSED |
| Shellmound Tending | Chore | Shellmound Ridge | Choice-based | PROPOSED |
| Clearing the Channel-Crossing | Chore | Miregarden | Forceshaper optional | PROPOSED |
| A Basket for the Returnee | Errand | Miregarden | Ranger optional | PROPOSED |
| The Ridge at Dusk | Milestone | Shellmound Ridge | Time-based | PROPOSED |


---

## Level 3: Ancient Bonds

### Zone Focus: Ashroot Thicket (Vertical Mysteries)

**Narrative Purpose:** Introduce vertical exploration and the depth of old relationships. First subtle hint of Severed influence.

### Quest Beats

#### 3.1 — Passage Through the Arch
- **Giver:** Ashroot Speaker (at Woven Arch)
- **Type:** Threshold / Ritual
- **Landmark Tie:** The Woven Arch
- **Beat:** First passage through the sacred gateway. Speaker guides player in threshold ritual—brief "vision of the first binder" who wrapped the roots centuries ago.
- **Mechanics:** 
  - Unskippable immersive sequence (establishes cultural weight)
  - First vertical climb tutorial on root-terraces beyond Arch
- **Bonder Lore:** Vision hints at ancient binding traditions without granting any abilities
- **Key Moment:** Player formally commits to leaving cradle's full protection
- **Status:** `PROPOSED` | **Dependency:** Cinematic sequence tech, vertical traversal validation

#### 3.2 — Tending the Fiber Offerings
- **Giver:** Ashroot Speaker
- **Type:** Chore / Vertical
- **Landmark Tie:** Ashroot Thicket terraces
- **Beat:** Climb to upper terraces to refresh hanging fiber offerings—mundane maintenance that teaches vertical navigation.
- **Mechanics:** Climb/mantle tutorial, optional pathfinding
- **Forceshaper Hook:** Can create temporary root anchors for easier descent, but offerings still require personal placement
- **Status:** `PROPOSED` | **Dependency:** Vertical traversal, climb points

#### 3.3 — The Speaker's Lesson
- **Giver:** Ashroot Speaker
- **Type:** Social / Lore
- **Landmark Tie:** Ashroot Thicket (upper glade)
- **Beat:** The Speaker shares stories of the "old binders" who first formed relationships with relic beasts. Pure lore—no mechanical unlocks.
- **Bonder Lore:** Deep foreshadowing of binding traditions, consent philosophy, and the beast lineages
- **Key Lesson:** Relationship takes time; power without understanding is hubris
- **Status:** `PROPOSED` | **Dependency:** Dialogue system

#### 3.4 — Gathering Ashroot Sap
- **Giver:** Ashroot Speaker
- **Type:** Chore / Collection
- **Landmark Tie:** Ashroot Thicket upper glade
- **Beat:** Collect sap from ancient Ashroots for the village's lantern-keepers. Humble labor in a sacred space.
- **Ranger Hook:** Track rare amber-sap nodes via environmental clues (subtle residue patterns)
- **Status:** `PROPOSED` | **Dependency:** Collection nodes, environmental storytelling

#### 3.5 — The Speaker's Teaching
- **Giver:** Ashroot Speaker
- **Type:** Milestone / Social
- **Landmark Tie:** Woven Arch (return)
- **Beat:** Return to Speaker for teaching on "the roots remember what the trunk forgets." Unlocks chanting emotes tied to specific root nodes (grants temporary buffs when used at correct locations).
- **Old/New Tension:** Speaker notes "some now climb with ropes and iron" (new ways) but "the roots respond to voice, not pull"
- **Transition:** Speaker blesses passage to Gaspocket Flats—"the land's breath is sharp there; walk carefully"
- **Status:** `PROPOSED` | **Dependency:** Emote system with location-based effects

### Level 3 Summary
| Quest | Type | Landmark | Class Hook | Status |
|-------|------|----------|------------|--------|
| Passage Through the Arch | Threshold | Woven Arch | None | PROPOSED |
| Tending the Fiber Offerings | Chore | Ashroot Thicket | Forceshaper optional | PROPOSED |
| The Speaker's Lesson | Social/Lore | Ashroot Thicket | Bonder lore only | PROPOSED |
| Gathering Ashroot Sap | Collection | Ashroot Thicket | Ranger optional | PROPOSED |
| The Speaker's Teaching | Milestone | Woven Arch | Emote unlock | PROPOSED |


---

## Level 4: Hazard's Edge

### Zone Focus: Gaspocket Flats (Environmental Mastery)

**Narrative Purpose:** Teach environmental hazard awareness. Patience and observation before action. First (and only) explicit Severed encounter in 1–5.

### Quest Beats

#### 4.1 — The Breathing Holes
- **Giver:** Shellmound Watcher (via message, urgent)
- **Type:** Traversal / Hazard
- **Landmark Tie:** Gaspocket Flats entry
- **Beat:** Navigate the gas pocket fields to check on the Watcher, who is monitoring "strange disturbances." Requires timing movement around periodic gas vents.
- **Mechanics:** 
  - Environmental hazard: toxic plumes inflict stacking disorientation
  - Visual/audio telegraphs (gas shimmer, vent rumble, windbell cues if crafted)
  - Safe zones between vents; patience rewards safe passage
- **Teaching:** The land has its own rhythms; forceful rushing is punished
- **Status:** `PROPOSED` | **Dependency:** Environmental hazard system, accessible telegraphs

#### 4.2 — The Stranger in the Flats _(SINGLE SEVERED ENCOUNTER)_
- **Giver:** Environmental (discovered at Shellmound)
- **Type:** Investigation / Skirmish
- **Landmark Tie:** Shellmound Ridge (base)
- **Beat:** Discover signs of a Severed scout—disturbed ground, strange markers, a single corrupted creature. This is the **only direct Severed presence in 1–5**.
- **Dialogue Hook:** "They don't just take... they unmake the remembering." (mysterious, not explanatory)
- **Resolution:** Drive off the corrupted creature (minor combat), investigate the markers (puzzle), or report back without engagement (stealth/avoidance)
- **Consequence:** Information is fragmented, mysterious—the Severed remain largely unknown
- **Status:** `PROPOSED` | **Dependency:** Investigation mechanics, single corrupted encounter

#### 4.3 — Chitterwing Clearing
- **Giver:** Shellmound Watcher
- **Type:** Chore / Combat
- **Landmark Tie:** Gaspocket Flats (vent cluster)
- **Beat:** Clear aggressive chitterwings that have nested too close to the channel paths—routine maintenance, not heroic battle.
- **Mechanics:** Standard combat; chitterwings buff themselves in gas plumes but are manageable foes
- **Ranger Hook:** Bonus resources if using wind vanes to disperse plumes
- **Forceshaper Hook:** Can shape temporary barriers to control chitterwing movement
- **Status:** `PROPOSED` | **Dependency:** Combat system, deployable items

#### 4.4 — Watcher's Request
- **Giver:** Shellmound Watcher
- **Type:** Errand
- **Landmark Tie:** Gaspocket Flats to Terrace Foot
- **Beat:** Deliver a warning message to the Terrace Scout about "strange markers in the deep." Simple courier duty carrying ominous news.
- **Status:** `PROPOSED` | **Dependency:** Message delivery system

#### 4.5 — The Dawn Vigil _(OPTIONAL/SHELLMOUND PATH)_
- **Giver:** Shellmound Watcher
- **Type:** Milestone / Vision
- **Landmark Tie:** Shellmound Ridge
- **Beat:** If player chose Old Ways path in Level 2, unlocks dawn vigil at Shellmound. Triggers extended ancestral vision showing faint shadows moving in the deep channels (Severed foreshadowing, mysterious).
- **Mechanics:** Time-of-day requirement (dawn); waiting triggers sequence
- **Reward:** Extended Ancestral Sight (reveals hidden environmental details), Old Ways reputation boost
- **Transition:** Watcher warns: "Carry word to the Spire. The elders must know."
- **Status:** `PROPOSED` | **Dependency:** Conditional quest availability, extended vision tech

### Level 4 Summary
| Quest | Type | Landmark | Class Hook | Status |
|-------|------|----------|------------|--------|
| The Breathing Holes | Traversal | Gaspocket Flats | Hazard mastery | PROPOSED |
| The Stranger in the Flats | Investigation | Shellmound Ridge | **SINGLE SEVERED ENCOUNTER** | PROPOSED |
| Chitterwing Clearing | Chore/Combat | Gaspocket Flats | Ranger/Forceshaper optional | PROPOSED |
| Watcher's Request | Errand | Gaspocket Flats to Terrace Foot | None | PROPOSED |
| The Dawn Vigil | Milestone | Shellmound Ridge | Conditional (Old Ways) | PROPOSED |


---

## Level 5: The Waymarker

### Zone Focus: Terrace Foot (Cultural Crossroads)

**Narrative Purpose:** Capstone readiness check. Blend cultural crossroads social play with preparation for 6–10. Class power unlocks occur here, not earlier.

### Quest Beats

#### 5.1 — Terrace Approach
- **Giver:** Environmental (journey)
- **Type:** Traversal / Atmosphere
- **Landmark Tie:** Terrace Foot entry
- **Beat:** Ascend from Gaspocket Flats to Terrace Foot. First encounter with mixed architecture—old wetland motifs on newer stone construction. First distant view of mountain terraces (Verdant Spire direction).
- **Mechanics:** 
  - Longer travel loops between checkpoints (increased friction signals leaving cradle)
  - First view of "new ways" influence: Terrace Scouts, engineered stonework
- **Status:** `PROPOSED` | **Dependency:** LOD handling for distant vistas, seamless terrain streaming

#### 5.2 — The Waymarker Parley
- **Giver:** Terrace Scout (neutral faction)
- **Type:** Social / Choice
- **Landmark Tie:** The Waymarker
- **Beat:** Diplomatic encounter at the Waymarker. Terrace Scout represents convergence city interests—discusses how to frame the warning about "strange markers" for Verdant Spire:
  - **Military Alert:** Emphasize threat (new ways approach)
  - **Diplomatic Warning:** Emphasize investigation (balanced approach)
  - **Ritual Warning:** Emphasize spiritual disturbance (old ways approach)
- **Consequence:** Affects reception at Verdant Spire in 6–10; different entry quest paths
- **Old/New Tension:** Explicit choice between response modes, but all are reasonable
- **Status:** `PROPOSED` | **Dependency:** Branching narrative persistence, cross-zone consequence system

#### 5.3 — Terrace Duties
- **Giver:** Terrace Scout
- **Type:** Chore / Collection
- **Landmark Tie:** Terrace Foot
- **Beat:** Help prepare supplies for the journey to Verdant Spire—gathering, organizing, mundane tasks that signal readiness to leave.
- **Status:** `PROPOSED` | **Dependency:** Collection system

#### 5.4 — Class Power Unlocks _(LEVEL 5 FINALE)_
- **Giver:** Class-specific NPCs at Terrace Foot
- **Type:** Milestone / Power Unlock
- **Landmark Tie:** Terrace Foot (rite platform)
- **Beat:** Final quest grants class-specific abilities unlocked through the journey:

**Bonder:** "The Promise of Binding" — The Ashroot Speaker formally invites the player to undertake binding training post-level 5. No companion yet—just the invitation and first glimpse of the binding UI. The actual binding questline begins in Verdant Spire (6–10).
- **Reward:** "Bonder-in-Training" title, unlocks binding questline at level 6
- **Status:** `PROPOSED` | **Dependency:** Title system, quest flagging

**Ranger:** "The Tracker's Eye" — The Trapsetter Returnee recognizes the player's potential, grants first tracking ability.
- **Reward:** Basic tracking vision, "Pathfinder" title
- **Status:** `PROPOSED` | **Dependency:** Tracking system

**Forceshaper:** "The First Shaping" — The Terrace Scout's engineer colleague offers introduction to shaping mechanics.
- **Reward:** First temporary structure blueprint, "Shaper-Adept" title
- **Status:** `PROPOSED` | **Dependency:** Shaping system

#### 5.5 — The Waymarker Departure _(TRANSITION MOMENT)_
- **Giver:** Self (environmental trigger at Waymarker)
- **Type:** Milestone / Transition
- **Landmark Tie:** The Waymarker
- **Beat:** Player activates the Waymarker, formally departing the cradle. Cinematic sequence shows:
  - **Back to Stillwater** (temporary return option)
  - **On to Verdant Spire** (primary 6–10 route — **THIS IS THE PATH**)
  - **Toward the Ash Frontier** (teased but grayed out — "The way is dangerous. Return when you have walked longer paths.")
- **Mechanics:** 
  - Verdant Spire selection unlocks 6–10 starting zone
  - Ash Frontier visible but locked (becomes available later in character progression)
  - Grants title: "Cradle-Rooted" (or variant based on old/new choices)
- **Narrative:** Player carries the warning to Verdant Spire; the wider world awaits
- **Status:** `PROPOSED` | **Dependency:** Multi-zone transition system, title/unlock persistence

### Level 5 Summary
| Quest | Type | Landmark | Class Hook | Status |
|-------|------|----------|------------|--------|
| Terrace Approach | Traversal | Terrace Foot | Atmosphere | PROPOSED |
| The Waymarker Parley | Social | The Waymarker | Choice-based | PROPOSED |
| Terrace Duties | Chore | Terrace Foot | None | PROPOSED |
| Class Power Unlocks | Milestone | Terrace Foot | **ALL CLASSES** | PROPOSED |
| The Waymarker Departure | Transition | The Waymarker | **ALL CLASSES** | PROPOSED |


---

## Class Hook Summary

### Bonder (Mandatory Lore, Deferred Power)

**Philosophy:** Bonder represents the Native relational worldview—power through understanding and consent rather than domination. The 1–5 arc establishes this philosophy through lore and foreshadowing; actual binding mechanics unlock at level 5 with the full questline starting in 6–10.

| Level | Quest | Hook Type | Integration |
|-------|-------|-----------|-------------|
| 1 | Tending the Channels | Philosophy preview | Ritual, patience, relationship |
| 3 | Passage Through the Arch | Lore foreshadowing | "Vision of the first binder" hints at tradition |
| 3 | The Speaker's Lesson | Deep lore | Binding philosophy, consent concepts, beast lineages introduced |
| 5 | Class Power Unlocks | Invitation only | Formal invitation to binding training; questline unlocks at level 6 |

**Systems Dependencies:**
- Dialogue/lore delivery system
- Title system
- Quest flagging for 6–10 content

### Ranger (Optional Depth)

**Philosophy:** Ranger represents practical adaptation—tracking, trapping, efficient pathfinding. The "new ways" applied to old lands.

| Level | Quest | Hook Type | Mechanical Integration |
|-------|-------|-----------|------------------------|
| 2 | A Basket for the Returnee | Introduction | Mention of tracking opportunities |
| 3 | Gathering Ashroot Sap | Optional | Environmental tracking clues |
| 4 | Chitterwing Clearing | Optional | Wind vane deployment preview |
| 5 | Class Power Unlocks | Power grant | Basic tracking vision unlocked |

**Systems Dependencies:**
- Tracking system
- Deployable class items (wind vanes)

### Forceshaper (Optional Depth)

**Philosophy:** Forceshaper represents shaping the world without dominating it—temporary, respectful modification that leaves minimal trace.

| Level | Quest | Hook Type | Mechanical Integration |
|-------|-------|-----------|------------------------|
| 2 | Clearing the Channel-Crossing | Optional | Temporary reed pylons preview |
| 3 | Tending the Fiber Offerings | Optional | Root anchors for descent |
| 4 | Chitterwing Clearing | Optional | Temporary barriers preview |
| 5 | Class Power Unlocks | Power grant | First temporary structure blueprint |

**Systems Dependencies:**
- Shaping ghost preview system
- Deployable temporary structures

---

## Transition to 6–10: The Waymarker Moment

### Narrative Setup

The 1–5 arc ends not with a boss fight but with a **choice of how to carry forward what you've learned**. The player has:
- Learned the Native worldview through humble participation (chores, tending, escort)
- Experienced the old ways vs. new ways tension subtly
- Encountered the Severed once, mysteriously—enough to know there's danger, not enough to understand it
- Been invited (Bonder) or trained (Ranger/Forceshaper) in their class path

The warning about "strange markers" creates narrative momentum: *the cradle is no longer fully safe, and the player must carry word to the wider world.*

### Single Path Forward: Verdant Spire

| Path | Destination | Status | Notes |
|------|-------------|--------|-------|
| **Verdant Spire** | Convergence city | **SELECTABLE** | Primary 6–10 route; political, social complexity |
| **Ash Frontier** | Severed front lines | **TEASED ONLY** | Visible at Waymarker but locked; "Return when you have walked longer paths" |
| **Return to Cradle** | Stillwater Village | Temporary | Optional return for completionists |

**Ash Frontier Tease:** The Waymarker shows the Ash Frontier direction with ominous visual cues (distant smoke, warning markers). Interacting with it produces: "The way to the Ash Frontier is treacherous. Those who walk there should know the world beyond the cradle. Return when you have proven your steps." This creates anticipation without offering immediate access.

### Severed Future Pacing Note

**Levels 1–5:** Single encounter (Level 4), mysterious, fragmented information
**Level 6–10 Zone:** Light sightings—distant figures, corrupted wildlife, more markers
**Level 10 Zone:** First real skirmishes, scout parties, minor incursions
**Late Game:** Heavy Severed presence, infiltration missions, full threat escalation

This pacing ensures the Severed remain an emerging mystery through the early game rather than an immediate known threat.

### Tees Up 6–10 Content

**Verdant Spire Route (All Players):**
- Introduces political complexity (multiple Native factions with different old/new ways balances)
- Establishes the convergence city as a place of both opportunity and cultural tension
- Carries forward the warning—player is received differently based on Waymarker Parley choice
- Bonder players begin the "First Binding" questline (actual companion acquisition)
- Ranger players expand tracking into urban/wilderness hybrid environments
- Forceshaper players gain access to more complex temporary structures

**Persistent Elements:**
- All 1–5 choices persist (Shellmound tending method, Waymarker message framing)
- Reputation with Elder Rootwalker / Young Trapsetter affects 6–10 faction access
- Old/New leaning subtly colors dialogue options in Verdant Spire

---

## Status Labels & Dependencies

### Quest Status Key

| Status | Meaning |
|--------|---------|
| `LOCKED` | Canon-critical; must ship with this implementation |
| `PROPOSED` | Design intent; subject to iteration based on playtest |
| `TENTATIVE` | Concept only; needs validation before implementation |
| `CUT` | Removed from scope; documented for future reference |

### Systems/Tech Dependencies

#### Critical Path (Must Have for MVP)

| System | Quests Dependent | Validation Needed |
|--------|------------------|-------------------|
| Environmental hazard system | 4.1 | Tech validation (gas plume timing) |
| Time-of-day event triggers | 2.5, 4.5 | Performance impact on streaming |
| Multi-zone consequence persistence | 5.2, 5.5 | Save system architecture |
| Vertical traversal (mantle/climb) | 3.1, 3.2 | Animation/integration budget |
| Class unlock flagging | 5.4 | Quest progression system |

#### High Priority (Should Have for Launch)

| System | Quests Dependent | Validation Needed |
|--------|------------------|-------------------|
| Dialogue consequence tracking | 1.5, 2.2 | Branch complexity management |
| Choice persistence (Old/New paths) | 2.2, 4.5 | Save bloat assessment |
| Deployable class items | 2.3, 4.3 | Physics/performance validation |
| Investigation mechanics | 4.2 | UI design iteration |
| Cinematic sequence tech | 3.1, 5.5 | Pipeline throughput |

#### Nice to Have (Could Ship Without)

| System | Quests Dependent | Validation Needed |
|--------|------------------|-------------------|
| Emote location-based effects | 3.5 | Scripting overhead |
| Vision sequence tech | 2.5, 4.5 | Cinematic team capacity |
| Mail/message system | 2.4, 4.1 | Backend integration |

### Open Questions for Systems/Tech

1. **Choice Persistence Scope:** How many binary/ternary choices can we persist cross-zone without save bloat? Current count: ~6 major choices in 1–5.

2. **Vertical Traversal:** Mantle + climb handoff—what's the performance budget for this in a seamless streaming zone?

3. **Time-of-Day Criticality:** How many quests can realistically require specific times before player friction becomes unacceptable?

---

## Old Ways vs. New Ways Integration

### Choice Points Throughout Arc

| Level | Choice Context | Old Ways Option | New Ways Option | Mechanical Difference |
|-------|---------------|-----------------|-----------------|----------------------|
| 1.5 | Hearthroot Rite dialogue | Reverence, patience | Curiosity, efficiency | Subtle dialogue shift |
| 2.2 | Shellmound tending | Full ritual | Practical shortcut | NPC greeting variations |
| 4.2 | Stranger encounter | Investigate/understand | Drive off/destroy | Information vs. safety |
| 5.2 | Waymarker message | Ritual warning | Military alert | 6–10 entry reception |

### Framing Principle

**Neither is framed as purely right or wrong.** Both have wisdom and cost:

- **Old Ways** create deeper relationships and unlock hidden content but require more time and patience
- **New Ways** offer efficiency and practical solutions but may miss nuance or strain relationships
- **Mixed approaches** are viable and often optimal

The tension is meant to be **lived, not resolved**. Players will continue navigating this through 6–10 and beyond.

**Choices feel subtle**—no loud morality meters, just NPCs who remember and respond organically.

---

## Cross-Reference Summary

### Documents Referenced
- `/projectavalon/Concept/Maps/native-starter-zone-v0.md` — Phase 2 landmarks, NPC archetypes, zone geography
- `/Docs/WorldBible/Peoples_Natives.md` — Cultural canon, worldview principles  
- `/Docs/WorldBible/Classes_Overview.md` — Bonder, Ranger, Forceshaper class definitions

### Glossary Terms (Proposed)
| Term | Definition | Proposed Status |
|------|------------|-----------------|
| Ashroot Cradle | Native 1–5 starter zone; protected ancestral wetland village | PENDING |
| Waymarker Transition | Level 5 departure moment to Verdant Spire | PENDING |
| Old Ways | Traditional Native philosophy (relationship, patience, place-memory) | PENDING |
| New Ways | Adapted approaches (efficiency, practical solutions, convergence city influence) | PENDING |

### Severed-Themed Dungeon Boss Note

**Later in the Content Slice:** A Severed-themed dungeon boss exists in the level 10–15 range (post-starter content). This boss represents the first major Severed confrontation but maintains the mystery—players fight a corrupted manifestation or servant, not a Severed infiltrator directly. The true nature of Severed infiltration (their methods, hierarchy, ultimate goals) remains mysterious until late-game content.

This preserves the "emerging threat" pacing while delivering satisfying combat progression.

### Output Checklist
- [x] Level-by-level quest beats (1–5) tied to landmarks—focused on humble chores, tending, escort
- [x] Class hooks revised: Bonder lore foreshadowed, power unlocks deferred to Level 5
- [x] Waymarker transition funnels to Verdant Spire; Ash Frontier teased only
- [x] Severed presence minimized (single Level 4 encounter + rumors)
- [x] Future Severed pacing documented (light in 6–10, heavier late-game)
- [x] Old vs new ways tension kept subtle
- [x] Severed dungeon boss noted for later slice
- [x] Status labels + dependencies updated

---

*End of Native Starter Quest Arc v0*