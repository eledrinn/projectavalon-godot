# Canon Keeper Foundation Review v1

**Status:** Locked  
**Agent:** Director / Canon Keeper  
**Date:** 2026-03-10  
**Responds To:** Foundation docs review request  
**Next Agent:** Systems Designer, Technical Architect, Worldbuilder (for respective sections)

---

## Executive Summary

The Avalon project foundation is **coherent, emotionally aligned, and production-ready** at the conceptual level. No contradictions exist between world lore, class design, and technical architecture. However, significant gaps remain in mechanical definitions, terminology standardization, and canon-to-implementation bridges.

This review identifies what is truly locked, what is only implied, and what needs immediate attention before agent work proceeds.

---

## 1. Five Strongest Locked Pillars

### 1.1 The Three-Peoples Framework
The Natives (wetland-rooted, highland-adapted, anti-hubris), Arrivals (sacred-classical, ordered, expeditionary), and Severed (survival-engineered, pressure-based, bitter) form a **narratively complete triangle**. Each has distinct visual identity, emotional resonance, and mythic positioning. The Severed as "living internal scandal" for the Arrivals is particularly strong.

**Source:** Peoples_Natives.md, Peoples_Arrivals.md, Peoples_Severed.md  
**Strength:** High emotional clarity, clear visual differentiation, no morality shorthand

### 1.2 Hard Pillars as Non-Negotiable Constraints
The 10 Hard Pillars (Production_Rules.md) are genuinely hard: seamless overworld, globe-compatible architecture, 1–10 vertical slice first, canon-in-docs discipline. These constraints will prevent scope drift and keep the project achievable.

**Source:** Production_Rules.md  
**Strength:** Clear boundaries enable creative focus

### 1.3 The 8-Region Geography Chain
The east-to-west biome flow (coast → redwood → basin → foothills → spur range → city → ash frontier → main range) is **geologically logical, creates natural progression, and preserves expansion space**. The "city spur" concept—dramatic placement without exhausting the main range—is elegant design.

**Source:** Starter_Continent_Slice.md  
**Strength:** Creates natural player journey, preserves mystery for future content

### 1.4 Class Identity Through Signature Mechanics
Each of the six classes has a **strong core fantasy, signature mechanic, and progression flavor** (Constellations, Tongues, Aspects, Chants, Etchings, Strings). These give long-term identity hooks that resist gear-score homogenization.

**Source:** Classes_Overview.md, Progression_Philosophy_v0.md  
**Strength:** Mechanically evocative, world-integrated, sidegrade-friendly

### 1.5 The "One Force, Different Relationships" Rule
The world has one underlying sacred reality, but Arrivals (shaping, order, formalization) and Natives (attunement, restraint, lived relationship) relate to it differently. This prevents simplistic "different magic systems" drift while preserving cultural distinction.

**Source:** World_Overview.md  
**Strength:** Unifies world cosmology, enables player cultural choice without mechanical silos

---

## 2. Five Biggest Canon Gaps or Ambiguities

### 2.1 Progression Flavors Are Named but Mechanically Undefined
Constellations, Tongues, Aspects, Chants, Etchings, and Strings are evocative **but lack systematic definition**. What does "discovering a Constellation" mean as a player action? Is it a quest? A craft? A location-based unlock? Without framework, each agent will interpret differently.

**Risk:** Inconsistent implementation across classes  
**Gap Level:** High — blocks Systems Designer work

### 2.2 The Convergence City Exists in Geography but Not in Canon
The city is mapped (Region 6, level 8–10 hub) and functionally defined (shared space, old/new ways tension), but **has no cultural name, history, or visual identity in the World Bible**. It appears only in the continent slice doc.

**Risk:** City design will lack cultural foundation  
**Gap Level:** Medium — blocks Worldbuilder city design

### 2.3 "Openings" Mechanic Is Referenced but Undefined
The Armsman signature mechanic is "Openings" — creating and exploiting enemy weaknesses. No further explanation exists. This is the only class signature without at least some mechanical hint.

**Risk:** Armsman may become generic fighter  
**Gap Level:** Medium — affects class parity

### 2.4 The Native Starter Village Has No Name
The "protected ancestral village in a stable wetland cradle area" is the first space players experience, but **has no name, no defining landmark, and no specific cultural identity** beyond generic Native traits.

**Risk:** Weak first impression, missed emotional anchor opportunity  
**Gap Level:** Medium — blocks Native 1–5 zone design

### 2.5 "Relic Wildlife" Is Referenced but Undocumented
The Bonder bonds with "ancient surviving lineages" and "relic wildlife." Native hair ornament uses "relic-beast bone or feather." These creatures are **central to Bonder class identity and Native material culture, but no bestiary or creature design exists**.

**Risk:** Bonder and Native visual identity will be underdeveloped  
**Gap Level:** Medium — affects two major pillars

---

## 3. Terminology That May Cause Confusion

| Term | Current Usage | Risk | Recommendation |
|------|---------------|------|----------------|
| **Fall** vs **Landing** | "Fall" = catastrophic first Arrival transit; "Landing" = deliberate modern Arrival transit | Both are used as proper nouns for transit events; could blur distinction | Add explicit "The Fall" vs "The Landing" contrast to GLOSSARY.md |
| **Ash** | Used for Age of Ash (historical), Ash Frontier (region), ash-mineral bloom (Native skin), Tephrate ash/fire damage | Overloaded term may confuse | Acceptable if contextually clear; flag if new "ash" terms proposed |
| **Pressure** | Tephrate mechanic (Pressure/Vent/Faults), Severed technology (pressure-based), Apogist gravity/pressure | Three different pressures: magical, mechanical, physical | Document in GLOSSARY.md with disambiguation |
| **Force** | "One underlying deeper force" (sacred reality), Forceshaper (class), "sacred force" (Native taboo) | Metaphysical vs elemental vs physical | Acceptable; context distinguishes. Flag if "force" used for new systems |
| **Aspect** | Bonder progression flavor, Bonder "aspect visions" | May conflict with general English "aspect" usage | Locked to Bonder; no other "aspect" systems without Canon Keeper review |
| **Class naming inconsistency** | Apogist/Tephrate/Forceshaper (compound/neologism) vs Armsman/Ranger (traditional noun) | Inconsistent naming pattern may suggest unfinished design | **Decision needed:** Intentional flavor differentiation or needs standardization? |

---

## 4. Contradictions Between World, Class, and Technical Assumptions

### 4.1 No Contradictions Detected
After cross-referencing all source docs, **no direct contradictions exist** between:
- World lore and class fantasy
- Class mechanics and technical architecture
- Technical constraints and world geography
- Visual identity rules and gameplay needs

### 4.2 Tensions Requiring Monitoring (Not Contradictions)

| Tension | Docs Involved | Nature | Monitoring Strategy |
|---------|---------------|--------|---------------------|
| **Severed technology vs "no electricity"** | Peoples_Severed.md | Severed use steam, pressure, cable, geothermal, alchemical fuel. If electricity-like effects appear (lightning, arcs), this pillar breaks | QA/Scope Police to flag any "electric" Severed proposals |
| **Apogist dual role (damage/healing)** | Classes_Overview.md | Apogist has both "ordered" (healing) and "primordial" (damage) paths. Risk of "do everything" class | Systems Designer must ensure path commitment, not hybrid builds within one character |
| **Hybrid combat readability** | Combat_Philosophy_v0.md | Selective ballistic simulation + group readability + terrain awareness = complex balance | Technical Architect and Systems Designer must prototype early |
| **Sidegrades vs vertical power** | Progression_Philosophy_v0.md | "Sidegrades" emphasis risks player feeling no growth | Progression must still feel rewarding; needs careful XP pacing |

---

## 5. Classification of Major Topics

### LOCKED (Canon — requires human approval to change)

| Topic | Source Doc | Notes |
|-------|------------|-------|
| Three peoples identity (Natives, Arrivals, Severed) | Peoples_*.md | Core premise of world |
| Hard Pillars (10 rules) | Production_Rules.md | Project constraints |
| 8-region geography chain | Starter_Continent_Slice.md | East-to-west flow |
| Class roster (6 classes) | Classes_Overview.md | Apogist, Tephrate, Bonder, Forceshaper, Armsman, Ranger |
| Progression flavor names | Classes_Overview.md | Constellations, Tongues, Aspects, Chants, Etchings, Strings |
| "One force, different relationships" | World_Overview.md | Cosmological foundation |
| Seamless overworld principle | Streaming_and_Seamlessness.md | No outdoor loading screens |
| Globe-compatible architecture | Technical_Architecture_v0.md | Planetary foundation |
| Hybrid combat direction | Combat_Philosophy_v0.md | Not tab-target, not pure action |
| Sidegrade progression emphasis | Progression_Philosophy_v0.md | Identity over stat inflation |

### TENTATIVE (Direction set, details may evolve)

| Topic | Source Doc | Open Details |
|-------|------------|--------------|
| Combat targeting model | Combat_Philosophy_v0.md, Open_Questions.md | Tab vs soft-target vs action specifics |
| Movement feel | Combat_Philosophy_v0.md | Responsiveness, dodge/roll/stamina |
| Progression flavor mechanics | Classes_Overview.md | What "unlocking" means for each flavor |
| Gear vs class progression priority | Progression_Philosophy_v0.md | Which drives power more |
| Class role strictness | Combat_Philosophy_v0.md | Holy trinity vs soft blending |
| Terrain streaming implementation | Technical_Architecture_v0.md | Chunk size, granularity |
| UE5 as engine | Technical_Architecture_v0.md | LOCKED — World Partition direction committed |

### PROPOSED (Suggestion for discussion)

| Topic | Source Doc | Notes |
|-------|------------|-------|
| Economy framework | Economy_Philosophy_v0.md | Placeholder with questions only; no locked decisions |
| Class naming pattern | Classes_Overview.md | Inconsistency noted; needs decision |
| "Openings" mechanic definition | Classes_Overview.md | Referenced but undefined |

### OPEN QUESTION (Unresolved)

See Open_Questions.md for full list. Critical open questions:

| Question | Category | Impact |
|----------|----------|--------|
| Exact targeting model | Combat | Blocks ability design |
| Level 1–10 XP curve | Progression | Blocks content pacing |
| Auction house yes/no | Economy | Blocks trade system design |
| Party size expectations | Social | Blocks encounter design |
| Mount timing | World Systems | Affects zone size assumptions |
| Multiplayer networking stack | Technical | Blocks architecture decisions |
| Death/respawn penalty | World Systems | Affects risk/reward tuning |

---

## 6. Recommended Next Canon-Sensitive Milestone

### Milestone: "First Convergence" — Native 1–5 Zone Design Brief

**Objective:** Complete a comprehensive design brief for the Native starter zone that establishes:
1. Named starter village with cultural identity
2. 3–5 distinct sub-areas within levels 1–5
3. Key landmarks visible from multiple points
4. Quest arc that teaches Native worldview
5. Clear transition to convergence city path

**Why this milestone:**
- It tests the Native cultural identity in concrete space
- It forces naming decisions (village, landmarks)
- It validates the 8-region geography chain at human scale
- It provides foundation for Systems Designer to design Bonder/Forceshaper/Ranger early abilities
- It surfaces any canon gaps before work on Arrival zone or city begins

**Canon-sensitive elements:**
- Village name and identity (requires human approval)
- Landmark names (requires human approval if added to GLOSSARY)
- Any new Native cultural details (must align with Peoples_Natives.md)

**Deliverable location:** `/Concept/Maps/native-starter-zone-v1.md`

**Assigned to:** Worldbuilder / Systems Designer (collaborative)

---

## 7. Immediate Doc Updates Needed

### 7.1 High Priority (Blocks Agent Work)

| Doc | Update Needed | Owner |
|-----|---------------|-------|
| GLOSSARY.md | Add "The Fall" vs "The Landing" explicit contrast; add "Pressure" disambiguation | Canon Keeper |
| Classes_Overview.md | Add "Openings" mechanic definition; add Armsman role clarification | Systems Designer |
| Progression_Philosophy_v0.md | Add progression flavor framework (what "unlocking" means systemically) | Systems Designer |

### 7.2 Medium Priority (Enables Future Work)

| Doc | Update Needed | Owner |
|-----|---------------|-------|
| World_Overview.md OR new doc | Add convergence city cultural identity (name, history, visual summary) | Worldbuilder / Canon Keeper |
| New doc: `/Docs/WorldBible/Relic_Wildlife.md` | Document ancient lineages (at least 3: horned mountain survivor, aerial relic predator, giant-sloth-like) | Worldbuilder |
| Combat_Philosophy_v0.md | Lock targeting model (one of: tab-target with action elements, soft-target hybrid, or action with tab assist) | Systems Designer |
| Economy_Philosophy_v0.md | Lock AH yes/no and crafting in 1–10 yes/no | Director / Systems Designer |

### 7.3 Lower Priority (Polish)

| Doc | Update Needed | Owner |
|-----|---------------|-------|
| Classes_Overview.md | Resolve class naming pattern (standardize or confirm intentional asymmetry) | Director |
| PROJECT_STATUS.md | Update after above changes | Canon Keeper |

---

## 8. Emotional Coherence Assessment

The docs are **strongly emotionally aligned**. Core emotional throughlines:

- **Age and weight:** World feels old, catastrophe-scarred, layered with memory
- **Restraint vs. ambition:** Natives (anti-hubris) vs Arrivals (sacred order) vs Severed (pragmatic survival)
- **Beauty in hardship:** Wetland memory preserved in mountain adaptation; frontier-rustic Arrival camps; Severed engineered survival
- **Politically messy:** No simple good/evil; curiosity, suspicion, reverence, resentment all coexist
- **Place as identity:** Geography, material language, and adaptation to environment define cultures

**No emotional drift detected.** All docs reinforce the same tone.

---

## 9. Summary for Project Director

**The foundation is solid.** You have:
- A coherent three-peoples world with clear visual identities
- A sensible geography that creates natural player flow
- Six classes with evocative signatures
- Hard constraints that will prevent scope creep
- No contradictions between lore and technical architecture

**Your attention is needed on:**
1. Class naming (standardize or confirm asymmetry is intentional)
2. Economy framework (AH yes/no, crafting in 1–10 yes/no)
3. Targeting model preference (if you have one)
4. Native starter village name (if you want to name it personally)

**Agents can proceed safely with:**
- Native starter zone design (using existing Peoples_Natives.md identity)
- Systems Designer work on class mechanics (using existing signatures)
- Technical Architect work on streaming architecture (using existing seamless principles)

---

## Canon Impact

No canon changes proposed. All observations are classifications of existing state or flags of missing content.

## Recommended Doc Updates

1. Add Fall/Landing contrast and Pressure disambiguation to GLOSSARY.md
2. Systems Designer to add "Openings" definition to Classes_Overview.md
3. Systems Designer to add progression flavor framework to Progression_Philosophy_v0.md
4. Worldbuilder to propose convergence city identity and relic wildlife bestiary

## Escalation Needed? **No**

No contradictions detected. No canon conflicts. Project is coherent and ready for agent work.

---

*Review conducted per Agent Output Protocol. This document supersedes any informal chat summaries of foundation status.*
