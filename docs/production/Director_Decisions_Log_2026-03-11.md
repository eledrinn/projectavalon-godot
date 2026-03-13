# Director Decisions Log - March 11, 2026

**Status:** LOCKED
**Agent:** Director / Canon Keeper
**Date:** 2026-03-11
**Responds To:** Foundation review decisions requested
**Next Agent:** Systems Designer, Technical Architect (to implement locked decisions)

---

## Summary

Five major design questions resolved. All decisions now locked in source-of-truth docs.

---

## Decision 1: Combat Targeting - LOCKED

**Decision:** Soft-target hybrid with tab-target auto-attacks, classic MMO swing-timer pacing, selective ballistic projectiles.

**Plain English:** Combat feels like classic WoW/FFXI/EverQuest. You tab-target for auto-attacks, but abilities can use shapes and some projectiles have real physics. Slow, deliberate, tactical - not twitchy action combat.

**Key Details:**
- Tab-target available for auto-attacks
- Active abilities learned through progression
- Swing-timer based auto-attacks (not spam-click)
- Some projectiles have realistic ballistic trajectories (Ranger, Apogist)
- Readable, group-friendly, not dodge-spam

**Doc:** `/Docs/GameDesign/Combat_Philosophy_v0.md`

---

## Decision 2: Death Penalty - LOCKED

**Decision:** Hardcore mode by default. First death converts to Normal mode with corpse run system. Shrines instead of graveyards.

**Plain English:** Every new character starts Hardcore (one life, better loot). When you die, you can keep playing in Normal mode, but you have to run back to your corpse to get your gear. No graveyards - you respawn at shrines and run back as a ghost.

**Key Details:**
- **Hardcore (default):** "Oathbound" buff, slightly better gear drops, one life
- **First death:** Buff removed, character continues in Normal mode
- **Normal mode death:** Respawn at bound shrine in spirit form, run to corpse to recover gear
- **Spirit form:** Fast movement, no combat, can't interact
- **Cultural flavor:** Natives (Basin Remembers), Arrivals (Beacon Recall), Severed (Pressure Lock)

**Doc:** `/Docs/GameDesign/Combat_Philosophy_v0.md`

---

## Decision 3: Gear vs Class Priority - LOCKED

**Decision:** Option C - Equal weight. Neither gear nor class progression eclipses the other.

**Plain English:** Your character power comes equally from your gear AND your class choices (cards + talents). You can't ignore gear, but you also can't just gear up and ignore your class progression. Both matter.

**Key Details:**
- Main stats: Stamina, Intelligence, Strength, Agility (names TBD)
- Secondary stats: Critical, Haste, Mastery equivalents
- Set bonuses: Gameplay-changing effects (not just stats)
- Gear quality tiers: Common → Uncommon → Rare → Epic → Legendary
- Legendaries: Unique effects that enable new builds

**Doc:** `/Docs/GameDesign/Progression_Philosophy_v0.md`

---

## Decision 4: Multiplayer Authority - LOCKED

**Decision:** Authoritative server with client-side prediction (movement only). Classic WoW-style spell batching (200-400ms window).

**Plain English:** The server is always right about combat. Your client guesses your movement to feel responsive, but the server corrects if you're wrong. Combat happens in 200-400ms "batches" so simultaneous attacks can trade kills - no "I clicked first" twitch wins.

**Key Details:**
- Server authority: All combat, damage, death, inventory, quests
- Client prediction: Player movement only
- Spell batching: 200-400ms window for combat resolution
- Effect: Simultaneous attacks can kill each other
- Benefit: Strategic combat over reflexes
- Latency tolerance: 200-400ms acceptable for combat

**Doc:** `/Docs/TechnicalDesign/Multiplayer_Authority_Model_v1.md`

---

## Decision 5: Progression System - LOCKED

**Decision:** Hybrid model. Cards (major build choices) + Talent Trees (classic branching).

**Plain English:** You have two ways to customize your character:
1. **Cards** (Constellations, Tongues, Aspects, etc.) - Big changes you find in the world, equip like a deck
2. **Talent Trees** - Classic WoW-style points spent per level for passive bonuses

**Key Details:**

### Cards (Progression Flavors)
- Collectible, found through exploration/quests/rituals
- Limited equippable slots (deck building)
- Changed at rest points/shrines
- Major gameplay changes

**Examples:**
- Apogist: "The Weaver" - finisher pattern becomes square
- Tephrate: "Tongue of the Sulphur Vent" - vents become cone AoE
- Bonder: "Aspect of the Crag Stalker" - bonus damage from elevation

### Talent Trees
- 3 trees per class (Offense/Defense/Utility)
- ~1 point per level
- Classic branching paths
- Respec available with cost
- Passive bonuses and small modifiers

**Examples:**
- "Increases fire damage by X%"
- "Reduces cast time of Y ability"
- "Adds Z effect to W skill"

**Doc:** `/Docs/GameDesign/Progression_Philosophy_v0.md`

---

## What This Unlocks

With these 5 decisions locked, the following work can proceed:

| Agent | Can Now Begin |
|-------|---------------|
| **Systems Designer** | Ability design (knowing targeting model), card design, talent tree structure |
| **Technical Architect** | Coordinate system spec (knowing multiplayer model), streaming spec |
| **Worldbuilder** | Shrine placement, zone design (knowing death/respawn flow) |
| **Prototype Builder** | Implementation tasks for all of the above |

---

## Still Need Decisions

| Question | Category | Impact |
|----------|----------|--------|
| Legendary item principles | Progression | Deferred - revisit post-demo |
| Which classes get teleport/summon | Class | Blocks fast travel class design |
| Battleground theme/game mode | PvP | Blocks 1-10 PvP implementation |
| Gear equalization in PvP | PvP | Long-term balance decision |

## Decision 6: Auction House - LOCKED

**Decision:** YES - Full auction house implementation.

**Plain English:** Players can sell items to each other through an auction house system. Not just direct trade - full AH with listings, bids, buyouts.

**Doc:** `/Docs/Economy/Economy_Philosophy_v1.md`

---

## Decision 7: Party Size - LOCKED

**Decision:** 4 players per party.

**Plain English:** Group content designed for 4 players. Small enough to coordinate, big enough for role variety (tank, healer, 2 DPS or flex).

**Doc:** `/Docs/Economy/Economy_Philosophy_v1.md`

---

## Decision 8: Mounts & Travel - LOCKED

**Decision:** Mounts unlock late (post-10 or very late). Early travel uses gliders earned through long questline.

**Plain English:** You walk/run through the 1-10 slice. When you finish, you get a questline that rewards a glider - lets you fly down from high places, not up. Mounts come way later, making them meaningful.

**Key Details:**
- **Glider quest:** "The First Flight" - multi-session questline
- **Glider function:** Controlled descent from elevation
- **Mount timing:** Post-level 10 or end of vertical slice
- **World feel:** Large on foot, gliders add verticality, mounts add speed later

**Doc:** `/Docs/GameDesign/Travel_and_Mounts_v1.md`

---

## Decision 9: Level 1-10 Pacing - LOCKED

**Decision:** ~4-6 hours for experienced MMO players; 6-8+ hours for new players.

**Plain English:** The 1-10 journey is substantial, not a rushed tutorial. New players take longer learning the systems. Experienced players can do it in an evening or two.

**Doc:** `/Docs/Economy/Economy_Philosophy_v1.md`

## Decision 10: Fast Travel — LOCKED

**Decision:** Fast travel restricted to 1–2 classes only. Public transport (boats, airships) rare and scheduled.

**Plain English:** You can't just teleport everywhere. Maybe 1–2 classes get teleport (like mage portals) or summon (like warlock rituals). Otherwise you walk, take a boat (rare, scheduled), or use your glider.

**Key Details:**
- **Fast travel:** Class-specific abilities only (not universal)
- **Public transport:** Boats, airships, other creative options — rare routes, scheduled departures
- **Travel time:** Real, immersive, seamless (not loading screens)
- **Philosophy:** The world should be traversed

**Doc:** `/Docs/GameDesign/Fast_Travel_and_Transport_v1.md`

---

## Decision 11: Crafting & Gathering — LOCKED

**Decision:** Basic crafting for 1–10: Mining, Herblore (with psychoactives), and Clothier (from enemy drops).

**Plain English:** Three gathering/crafting professions for the demo. Mining gets ore for blacksmithing. Herblore gets herbs and psychoactive compounds for potions. Enemies drop cloth/leather for clothier to make armor.

**Key Details:**
- **Mining:** Ore, stone, gems → Blacksmithing (weapons, armor)
- **Herblore:** Medicinal herbs, alkaloids, **psychoactive compounds** → Alchemy (potions, vision quests)
- **Clothier:** Cloth/leather/bone from enemies → Light/medium armor, bags
- **Psychoactives:** Unique to Avalon — ritual use, temporary perception changes, required for some Card unlocks

**Doc:** `/Docs/GameDesign/Crafting_and_Gathering_v1.md`

---

## Decision 12: PvP — LOCKED

**Decision:** PvP exists and should be balanced long-term. One battleground for 1–10 vertical slice.

**Plain English:** PvP is not an afterthought. For the demo, include one battleground (4v4 or 8v8) to test class balance. Full PvP systems come later.

**Key Details:**
- **1–10 scope:** One battleground (CTF or control points)
- **Long-term:** Multiple battlegrounds, possible arena, open-world objectives
- **Balance goal:** All 6 classes viable
- **Reward philosophy:** Optional but meaningful, skill over gear

**Doc:** `/Docs/GameDesign/PvP_Philosophy_v1.md`

---

## Summary: All Major Decisions Locked

| # | Decision | Category |
|---|----------|----------|
| 1 | Combat targeting: Soft hybrid, tab-target autos | Combat |
| 2 | Death penalty: Hardcore default → Normal with corpse run | World |
| 3 | Gear vs class: Equal weight | Progression |
| 4 | Multiplayer: Authoritative server, spell batching | Technical |
| 5 | Progression: Cards + Talent Trees | Progression |
| 6 | Auction house: YES | Economy |
| 7 | Party size: 4 players | Social |
| 8 | Travel: Gliders early, mounts late | World |
| 9 | 1–10 pacing: 4–6 hours | Progression |
| 10 | Fast travel: Restricted, public transport rare | World |
| 11 | Crafting: Mining, Herblore, Clothier | Economy |
| 12 | PvP: One BG in demo, balanced long-term | Combat |

---

## Docs Updated

1. `/Docs/GameDesign/Combat_Philosophy_v0.md` — Targeting, death penalty locked
2. `/Docs/GameDesign/Progression_Philosophy_v0.md` — Cards + Trees, equal weight gear
3. `/Docs/TechnicalDesign/Multiplayer_Authority_Model_v1.md` — New doc, authority model locked
4. `/Docs/Economy/Economy_Philosophy_v1.md` — New doc, AH, party size, pacing locked
5. `/Docs/GameDesign/Travel_and_Mounts_v1.md` — New doc, gliders/mounts locked
6. `/Docs/GameDesign/Fast_Travel_and_Transport_v1.md` — New doc, fast travel locked
7. `/Docs/GameDesign/Crafting_and_Gathering_v1.md` — New doc, professions locked
8. `/Docs/GameDesign/PvP_Philosophy_v1.md` — New doc, PvP framework locked
9. `/Docs/Production/Open_Questions.md` — Resolved questions moved to "Recently Resolved"
10. `/Docs/Production/PROJECT_STATUS.md` — Updated status table

---

*Decisions made by Director on March 11, 2026. All locked per Agent Charter status definitions.*
