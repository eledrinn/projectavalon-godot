# Agent Output Protocol — Classic WoW Design Digest
**Source:** `/Docs/Reference/Classic_WoW_Lessons_for_This_Project.md`
**Owner:** Systems Design • Status: [DRAFT]
**Scope:** Capture the most transferable Classic WoW lessons for Project Avalon, keeping them actionable (<3 pages) and assignment-aware.

---

## Lessons at a Glance
Each lesson is tagged with its category, priority (Must/Later), and primary owning discipline(s).

1. **Worldbuilding — Scale Before Size** *(Must • Systems + World)*
   - **Classic Insight:** Blizzard doubled continent crossing time so the world *felt* massive before it truly was; natural barriers masked streaming seams.
   - **Avalon Application:**
     - Use mountains, ash fronts, and basins to hide streaming transitions while signaling biome shifts.
     - Define minimum 15–20 minute cross-biome travel loops before considering any fast travel unlocks.

2. **Worldbuilding — Mood First, Details Later** *(Must • World)*
   - **Classic Insight:** Bill Petras' color/mood passes aligned teams long before prop dressing; procedural dungeons were rejected because they erased a sense of place.
   - **Avalon Application:**
     - Require mood/color studies for every slice zone before quest scripting or encounter placement.
     - Cap shared terrain materials per zone (≤4) to preserve immediate visual identity.

3. **Questing — Friction Fuels Community** *(Must • Quest + Systems)*
   - **Classic Insight:** Long travel, sparse quest hubs, and waiting on respawns forced players to group, trade stories, and plan routes.
   - **Avalon Application:**
     - Structure quest chains so at least one leg per story arc requires cross-zone travel or coordination trigger (escort, elite choke point, etc.).
     - Bake "travel conversations" into pacing by ensuring safe-but-slow transit segments (e.g., ridge climbs, fungus ferries) between intense beats.

4. **Social — Role Interdependence Over Self-Sufficiency** *(Must • Systems)*
   - **Classic Insight:** No class could do everything; holy trinity balance made every player valuable.
   - **Avalon Application:**
     - Lock in group role intentions per class (tank/control/support/etc.) in `Classes_Overview.md` before expanding kit lists.
     - Enforce at least one group-critical utility per class that others cannot trivially replicate.

5. **Social — Controlled Convenience for Group Formation** *(Later • Systems + Quest)*
   - **Classic Insight:** Dungeon finder-style instant grouping hollowed community; vanilla's ad-hoc formation built bonds despite friction.
   - **Avalon Application:**
     - Prototype "campfire" or settlement bulletin interactions that help form groups locally instead of global matchmaking.
     - Allow convenience only after demonstrating it does not skip social touchpoints (e.g., caravan sign-ups vs. auto-teleport).

6. **Progression — The Journey Is Content** *(Must • Systems)*
   - **Classic Insight:** 1–60 leveling took months; waiting for rewards (mail, harvest, skill training) built anticipation.
   - **Avalon Application:**
     - Treat 1–10 slice as a full journey: multiple sidegrades, narrative crescendos, and meaningful unlock timing (constellations, tongues, aspects).
     - Introduce delayed gratification loops (ritual cooldowns, crafting orders) that create future-looking goals without pure idle timers.

7. **Progression — Feature Reuse Filter** *(Must • Systems + Tech)*
   - **Classic Insight:** Blizzard greenlit only systems that could support multiple game loops; dead-end "cool ideas" were cut.
   - **Avalon Application:**
     - Apply the five-question feature test (reusability, daily use, multi-purpose, accessibility, depth) to every proposed mechanic milestone.
     - Document the pass/fail outcome per feature in `Production/Feature_Log.md` before engineering time is allocated.

8. **Economy — Regional Scarcity Drives Play** *(Must • Economy + World)*
   - **Classic Insight:** WoW's auction house plus unique regional resources created trade routes and GDP-scale economies.
   - **Avalon Application:**
     - Lock distinct resource tables per biome (wet basin fungus strains, ridge minerals, ash reagents) and ensure recipes force cross-region exchange.
     - Decide early whether the first marketplace is regional AHs or structured caravans; either way, launch with tools for price signaling.

9. **Economy — Server Authority Protects Value** *(Must • Tech + Systems)*
   - **Classic Insight:** "Nothing valuable lives on the client" prevented dupes and exploits, safeguarding the economy.
   - **Avalon Application:**
     - Define server ownership for currency, loot tables, and positional checks in `Technical_Architecture_v0.md`; no placeholder client-side shortcuts even during prototype.
     - Simulate selective ballistic combat server-side or add reconciliation proofs before exposing it to players.

10. **Worldbuilding — Iterate, Erase, Improve** *(Later • World + Systems)*
    - **Classic Insight:** Blizzard routinely scrapped and rebuilt zones; iteration was the rule, not the exception.
    - **Avalon Application:**
      - Schedule graybox → feedback → rebuild loops in milestone plans so erasing/redoing spaces is budgeted, not emergency churn.
      - Favor modular asset kits so throwaway work is minimized when terrain is re-sculpted.

---

## Responsibility Call-Outs
- **Systems Design:** Own lessons 1, 3–9. Immediate focus: codify class roles, combat authority split, progression pacing, and feature filter enforcement.
- **Quest Design:** Co-own lessons 3 and 5. Ensure quest structures reinforce travel friction, social prompts, and regional identity rather than bypassing them.
- **Economy Design:** Co-own lessons 8 and 9. Lock regional resource schemas, trade surfaces, and safeguards with Tech before content production ramps.

---

## Next Steps
1. Update `Classes_Overview.md` with explicit role matrices (Systems).
2. Draft travel-time targets and zone mood boards for vertical slice biomes (World/Quest).
3. Produce `Economy_Philosophy_v0.md` outlining regional resource loops plus AH/caravan decision criteria (Economy).
4. Expand `Technical_Architecture_v0.md` with authority diagrams for currency, loot, and selective ballistic combat (Systems + Tech).

*Compiled for Project Avalon — Systems Design Desk, 2026-03-11.*