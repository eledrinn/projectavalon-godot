# Classic WoW Lessons for Project Avalon

**Status:** [PROPOSED] — Design guidance derived from WoW Diary analysis  
**Related:** See `/Docs/Reference/Classic_WoW_Design_Digest.md` for source material  
**Location:** `/Docs/Reference/Classic_WoW_Lessons_for_This_Project.md`

---

## Purpose

This document translates lessons from *The WoW Diary* (John Staats, 2018) into concrete guidance for Project Avalon's design. It focuses on actionable principles, not historical documentation.

---

## 1. World Design: Scale & Seamlessness

### Lesson: The world must feel large before it is large

**WoW Application:** The cross-continental run was doubled from ~10 minutes to ~20 minutes because the world felt too small. Ocean and geographic barriers hid technical limitations while creating immersion.

**For Project Avalon:**
- ✅ **Preserve seamless overworld** — Our locked pillar aligns with WoW's success
- ✅ **Use geographic barriers naturally** — Mountains, basins, ash frontiers can hide streaming
- ✅ **Resist fast travel temptation** — Every convenience that shrinks the world shrinks the community
- ⚠️ **TBD: Cross-continent travel time** — What's our target? 15 minutes? 30?

**Open Question:** How do we balance modern player expectations with the "friction creates meaning" principle? [Reference: `/Docs/Production/Open_Questions.md`]

---

## 2. Zone Identity: Place Over Variety

### Lesson: Custom beats procedural; mood beats detail

**WoW Application:** WoW almost adopted Anarchy Online's procedural dungeons. Staats proved hand-built dungeons could be efficient (one week for The Hidden Shrine). The team rejected procedural when they realized "lack of place ruins fantasy immersion."

**For Project Avalon:**
- ✅ **Hand-build the vertical slice** — Every landmark should be memorable
- ✅ **Zone mood before zone content** — Bill Petras' color studies established identity first
- ⚠️ **Tool pipeline priority** — We need wowedit-equivalent before zone building begins
- ❌ **Avoid:** Randomly generated fungal basins or redwood forests

**Production Note:** Staats spent 600 hours per level early in his career. Our timeline must account for this reality. [See `Production_Rules.md`: graybox before polish]

---

## 3. Class Design: Interdependence Creates Community

### Lesson: The "holy trinity" (tank/healer/DPS) wasn't a limitation—it was a social glue

**WoW Application:** "No single class was overpowered. This balance ensured every player felt valuable and contributed to the group's success."

**For Project Avalon:**
- ✅ **Preserve class identity** — Our six classes have clear fantasies; don't homogenize
- ✅ **Design for group synergy** — Bonder aspects, Apogist constellations, Forceshaper chants should combine meaningfully
- ⚠️ **Define roles clearly** — Hybrid model yes, but what ARE the roles?
- ❌ **Avoid:** Every class being self-sufficient (kills interdependence)

**Concrete Task:** Add to `/Docs/GameDesign/Classes_Overview.md` — group role intentions for each class.

---

## 4. Combat: Hybrid Model Validation

### Lesson: "Not fully tab-target, not fully action" was the sweet spot

**WoW Application:** Selective ballistic simulation added flavor without requiring twitch skills. Terrain and elevation mattered. Cooldowns created rhythm.

**For Project Avalon:**
- ✅ **Our pillar aligns** — "Hybrid combat with selective physical simulation"
- ✅ **Terrain matters** — Wet basins, mountain spurs, ash frontiers should affect combat
- ⚠️ **Define the split** — Which abilities are tab-target? Which are skillshot?

**Specific Questions:**
- Does the Apogist's constellation finisher require aiming or just timing?
- Can Tephrate pressure vents be placed strategically using terrain?
- How does "reading the line" work for Rangers—projectile or target selection?

[Add answers to `/Docs/GameDesign/Combat_Philosophy_v0.md`]

---

## 5. Progression: The Journey Is the Game

### Lesson: "Quality of life" often destroys what makes the game memorable

**WoW Application:** The 1-60 journey took months. Later expansions trivialized this, and something was lost.

**For Project Avalon:**
- ✅ **1-10 vertical slice should feel substantial** — Not a tutorial, but a journey
- ✅ **Progression flavors matter** — Constellations, Tongues, Aspects should be more than cosmetic
- ⚠️ **Sidegrades vs. vertical power** — How much stat inflation?

**Staats Quote:** "The idea of waiting for a tree to bear fruit or a package to arrive in the mail infused our imaginations with what could be done."

**Application:** Our progression flavors should have anticipation built in—discovering a new constellation, learning a new tongue, bonding a new aspect shouldn't be instantaneous.

---

## 6. Economy: Player-Driven Systems

### Lesson: The auction house created a virtual economy comparable to small nations' GDP

**WoW Application:** John Staats (economy designer) created systems where crafting, gathering, and trade were viable paths. Regional resources had identity.

**For Project Avalon:**
- ✅ **Economy matters from day one** — Not a later addition
- ✅ **Regional resource identity** — Wet basin fungus, mountain minerals, ash frontier elements
- ⚠️ **Auction house yes/no?** — Currently open question [see `Open_Questions.md`]

**Concrete Guidance:**
If we have an auction house, it should be:
- Regional (not global) to preserve travel meaning
- Accessible early (not level-gated)
- Linked to crafting viability

If we skip AH, we need alternative trade systems that still create economic interdependence.

---

## 7. Technical Architecture: Client-Server First

### Lesson: "Nothing valuable can ever be on the client"

**WoW Application:** John Cash's ironclad rule prevented exploits. Pathing geometry only on servers. Money, items, player states—all server-authoritative.

**For Project Avalon:**
- ✅ **Aligns with our seamless overworld pillar** — Server-authoritative positioning
- ✅ **Aligns with globe-compatible architecture** — Global metadata, local gameplay
- ⚠️ **Combat authority split** — What's processed where?

**Open Technical Questions:**
- How much combat simulation can be client-side without opening exploits?
- How do we handle "selective ballistic simulation" with server authority?
- What's the server tick rate target?

[See `/Docs/TechnicalDesign/Technical_Architecture_v0.md` — needs expansion]

---

## 8. Production: Iteration Over Planning

### Lesson: "If it doesn't work, fix it" — nothing was written in stone

**WoW Application:** Landscapes were erased and restarted. Code was rewritten repeatedly. The team redid work until no room for improvement.

**For Project Avalon:**
- ✅ **Iterative approach validated** — Our production rules align
- ✅ **Graybox before polish** — Proven methodology
- ⚠️ **Our challenge:** Small AI-assisted team vs. 40+ person Blizzard team

**Risk:** Blizzard could absorb iteration costs with large team. We must be smarter about what we iterate on.

**Mitigation:**
1. Stronger pre-production documentation (what we're doing now)
2. Modular systems that can be rebuilt independently
3. Clearer acceptance criteria before building

---

## 9. Storytelling: Lore Serves Gameplay

### Lesson: "Stories are the most flexible part of the equation"

**WoW Application:** Chris Metzen provided hooks and vibes, not detailed prescriptions. Devs authored solutions. Lore bent to gameplay constraints.

**For Project Avalon:**
- ✅ **Our GLOSSARY approach aligns** — Define terms, but don't over-script
- ✅ **Empower agents to author** — Within constraints, trust implementation
- ✅ **Archetypes over subtlety** — Clear, readable narratives

**Production Rule:** When lore and gameplay conflict, gameplay wins. Document the change in GLOSSARY.

---

## 10. What Modern WoW Got Wrong (For Our Context)

### Convenience Creep

| Vanilla (Good) | Modern (Problem) |
|----------------|------------------|
| 10-20 min travel between zones | Instant teleportation everywhere |
| Waiting for groups created social bonds | Dungeon finder queues kill community |
| Leveling was the game | Leveling is a tutorial to skip |
| Death had meaning | Death is a minor inconvenience |
| Gear sidegrades mattered | Gear treadmill only |

**For Project Avalon:**
- Keep travel meaningful (but don't punish)
- Group finding should require effort (but not tedium)
- Death/respawn should sting (but not frustrate)
- Sidegrades should compete with vertical upgrades

---

## 11. Feature Evaluation Framework

From WoW's production philosophy:

**Before adding any feature, ask:**

1. **Reusability** — Can this feature branch into other gameplay?
2. **Daily use** — Will players want this every day?
3. **Multi-purpose** — Does it justify engineering time?
4. **Accessibility** — Can a new player understand it immediately?
5. **Depth** — Does it reward mastery over time?

**Reject if:**
- It's "cool" but a dead end (PvP bounty system, unique artifacts)
- It duplicates existing functionality
- It's engineering-heavy but player-light

**Staats Quote:** "We only implemented features that could be reused for other types of gameplay and avoided dead-end ideas."

---

## Immediate Action Items

### For Systems Designer
1. Define clear group roles for each class in `Classes_Overview.md`
2. Answer combat philosophy open questions (tab vs action split)
3. Draft economy philosophy section for `Economy/Economy_Philosophy_v0.md`

### For Technical Architect
1. Document client-server authority split for combat
2. Define streaming granularity for seamless overworld
3. Evaluate tool pipeline needs (wowedit equivalent)

### For Worldbuilder
1. Zone mood/color studies for starter slice (like Bill Petras)
2. Landmark planning that creates "place"
3. Travel time estimates between key locations

### For Director
1. Review this document against current canon
2. Decide which lessons elevate to [LOCKED] status
3. Update `Open_Questions.md` with new questions raised

---

## References

- Staats, John. *The WoW Diary: A Journal of Computer Game Development* (2018)
- `/Docs/Reference/Classic_WoW_Design_Digest.md` — Full lesson summary
- `/Docs/Production/Production_Rules.md` — Our production philosophy
- `/Docs/Production/Open_Questions.md` — Questions requiring resolution

---

*This document is living guidance. As we answer open questions and validate approaches, update status from [PROPOSED] to [TENTATIVE] to [LOCKED].*
