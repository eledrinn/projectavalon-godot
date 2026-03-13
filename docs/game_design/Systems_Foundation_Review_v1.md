# Systems Foundation Review v1

**Agent:** Systems Designer  
**Date:** 2026-03-11  
**Status:** PROPOSED — Framework recommendations pending human review  
**Scope:** Combat direction, progression structure, class viability, early gameplay priorities, economy implications  

---

## 1. Executive Summary

The project has a strong conceptual foundation with six distinct classes, a clear hybrid combat philosophy, and an identity-first progression direction. The primary gaps are: (1) targeting/control model undefined, (2) progression flavors lack mechanical translation, and (3) gear/class relationship unresolved. This review recommends locking the targeting model as the immediate priority, followed by framework definitions for progression flavors.

---

## 2. The 5 Strongest Gameplay/System Pillars Already Present

| Rank | Pillar | Source Document | Why It Works |
|------|--------|-----------------|--------------|
| 1 | **Class Signature Mechanics** | Classes_Overview.md [LOCKED] | Each class has a distinct core loop: Apogist (constellation finisher), Tephrate (pressure/vent/faults), Bonder (instinct/call-and-answer), Forceshaper (confluence sequencing), Armsman (openings), Ranger (read the line). These are concrete enough to prototype, distinct enough to prevent homogenization. |
| 2 | **Hybrid Combat Direction** | Combat_Philosophy_v0.md [TENTATIVE] | The "not fully tab-target, not fully action" boundary is well-defined. Selective ballistic simulation allowed. Terrain/elevation matter. Group readability prioritized. This prevents the common drift toward either twitch-heavy action or passive spreadsheet combat. |
| 3 | **Identity-First Progression** | Progression_Philosophy_v0.md [TENTATIVE] | Explicit rejection of gear-treadmill primacy. Sidegrades, discovery, and class/world integration over raw stat inflation. Clear 1–10 slice philosophy: "meaningful growth, learning the world, entering the convergence city with a real sense of journey completed." |
| 4 | **Dual-Path Class Fantasy** | Classes_Overview.md [LOCKED] | Apogist (Ordered vs Primordial), Tephrate (tank vs damage), Bonder (three aspect lineages), Forceshaper (wind/water/storm), Armsman (tank/heavy/light), Ranger (implied specialization). Creates build diversity without requiring additional classes. |
| 5 | **World-Integrated Class Identity** | Classes_Overview.md [LOCKED] | Classes are not generic MMO archetypes pasted onto the world. Bonder aspects come from "relic wildlife lineages" discovered through ritual and tracking. Tephrate Tongues are "forbidden languages of power tied to old feared truths." This creates natural quest/content hooks. |

---

## 3. The 5 Most Important Unresolved Gameplay Questions

| Priority | Question | Risk if Unresolved | Current Status |
|----------|----------|-------------------|----------------|
| 1 | **Targeting & Control Model** | Gates all ability design, encounter design, and combat prototyping. Cannot answer "what does an Opening look like?" without knowing if the player has active positioning tools, lock-on, or free aim. | Combat_Philosophy_v0.md: "exact targeting model," "lock-on, soft target, or tab support," "dodge/roll/stamina philosophy" — all open |
| 2 | **Gear vs Class Progression Relationship** | Risk of (a) gear eclipsing class identity, violating progression philosophy, or (b) gear feeling meaningless, violating MMO expectations. Affects all reward structures for 1–10 slice. | Economy_Philosophy_v0.md [PROPOSED]: "How should gear feel compared to class progression systems?" — open |
| 3 | **Progression Flavor Mechanical Definition** | Constellations/Tongues/Aspects/Chants/Etchings/Strings are evocative but undefined. Risk of inconsistent implementation across classes and agents interpreting them differently. | Progression_Philosophy_v0.md lists flavors but provides no mechanical framework |
| 4 | **Death / Respawn / Penalty Philosophy** | Gates encounter risk tuning, difficulty curves, and world feel. Missing from all design docs. | Not explicitly tracked in Open_Questions.md |
| 5 | **Party Size & Role Strictness** | Gates AoE ability design, group content pacing, and holy trinity vs soft-role decisions. Affects encounter design for 1–10 slice group content. | Combat_Philosophy_v0.md: "party role strictness" — open; Open_Questions.md: "grouping expectations," "party size" — open |

---

## 4. Class Roster Systems Evaluation

### 4.1 Overall Assessment: VIABLE

The six-class roster is implementable within the 1–10 vertical slice. Each class has:
- A clear fantasy anchor
- A single signature mechanic (not a scattered toolkit)
- A progression flavor hook
- Dual-path build potential

### 4.2 Per-Class Systems Analysis

| Class | Signature Viability | Implementation Risk | Notes |
|-------|---------------------|---------------------|-------|
| **Apogist** | High | Low | "Constellation finisher / stars vs gravity-collapse split" is concrete. Build resource → execute window → pattern completion. Ordered/Primordial split creates natural build diversity. |
| **Tephrate** | High | Medium | "Pressure / Vent / Faults" is mechanically clear. Tank vs damage role split well-defined. Risk: "Faults" as persistent ground effects or debuffs requires technical implementation decisions. |
| **Bonder** | Medium-High | Medium | "Instinct / Call-and-Answer / Aspect Visions" is flavorful but complex. "Brief vision or manifestation of the bonded being" requires UI/VFX treatment. Three aspect lineages (tank/damage/heal) create clear build paths. Risk: Aspect visions could become expensive if over-produced. |
| **Forceshaper** | High | Low | "Confluence" (elemental sequencing) is mechanically straightforward. Wind/water/storm role split is clear. Sequencing mechanics are proven in other games (FFXIV RDM, GW2 elementalist). |
| **Armsman** | High | Low | "Openings" (exploit weaknesses through timing/positioning) is concrete. Etchings as "recipe-like progression" is a strong flavor hook. Tank/heavy/light role split is classic and implementable. |
| **Ranger** | High | Low | "Read the Line" (identify/predict/capitalize on clean attack lines) is mechanically clear. Strings as "shot philosophy" avoids ammo micromanagement bloat. |

### 4.3 Cross-Cutting Risk: Cultural Expression vs Gameplay Clarity

The requirement that classes "should not feel culturally locked" but must have "world gives them different expressions" creates a tension. Recommendation: Separate gameplay chassis ( Locked) from cultural flavor (flexible per player background). Example: A Native Apogist discovers constellations through oral tradition and sky-watching; an Arrival Apogist learns them through star-charts and celestial navigation. Same mechanical Constellation system, different acquisition fiction.

---

## 5. Prerequisites for Prototyping

### 5.1 Before Prototyping Combat

| Required Decision | Recommendation | Why |
|-------------------|----------------|-----|
| Targeting model | Soft-target hybrid (see Section 6) | Unlocks ability range, shape, and aiming assumptions |
| Movement philosophy | Responsive but not action-MMO dodge-spam | Unlocks animation priorities and ability mobility |
| Hit resolution | Mix: most abilities use soft-target + ability shapes; select abilities use ballistic projectiles | Unforces implementation approach for physical simulation |

### 5.2 Before Designing Native 1–5 Zone

| Required Decision | Recommendation | Why |
|-------------------|----------------|-----|
| Death/respawn philosophy | Light penalty: return to last shrine/binding point, minor durability cost or time delay | Affects risk tuning for beginner encounters |
| Level 1 kit | Each class starts with 1 basic attack + 1 signature mechanic starter | Affects tutorial complexity and early combat feel |
| Progression flavor acquisition | One progression flavor unlock by level 5, tied to class quest | Affects quest structure and reward pacing |
| Gear involvement | Gear provides secondary stats + situational effects; class progression provides core abilities | Affects reward structures for early quests |

### 5.3 Before Building Progression Systems

| Required Decision | Recommendation | Why |
|-------------------|----------------|-----|
| XP curve 1–10 | ~4–6 hours for experienced MMO players; ~8–10 hours for new players | Affects content volume requirements |
| Stat model | Minimal: Power (damage/healing), Endurance (health), Resilience (defense), plus class-specific secondary | Affects gear stat budget and scaling |
| Sidegrade philosophy | Unlocks provide options, not just +10% power | Affects reward design for exploration and quests |

---

## 6. Combat Targeting Recommendation

### 6.1 Recommended Direction: Soft-Target Hybrid

**Definition:**
- Player has a soft target (nearest enemy in reticle, manually switchable with tab)
- Most abilities use this soft target as anchor for ability shapes (cones, AoEs, lines)
- Some abilities (notably Ranger shots, Apogist gravity projectiles) use ballistic projectile physics
- Movement is responsive but not action-game dodge-heavy
- No animation-lock on most abilities; short cast times or instant with cooldowns

### 6.2 Tradeoffs

| Approach | Pros | Cons | Fit for Project? |
|----------|------|------|------------------|
| **Tab-target leaning** (FFXIV, WoW) | Readable in groups, easy to balance, proven MMO feel | Can feel passive, less terrain/positioning expression | Weak fit — contradicts "terrain should matter" and "selective ballistic simulation" pillars |
| **Soft-target hybrid** (Recommended) | Retains MMO readability, allows physical simulation where appropriate, terrain matters via ability shapes and positioning | Requires careful tuning of auto-target vs player aim boundaries | Strong fit — honors hybrid combat philosophy |
| **Action leaning** (Tera, New World melee) | High immediacy, strong physicality | Harder to scale to groups, higher twitch dependency, animation lock risks | Weak fit — contradicts "group readability" and "not fully action" pillars |

### 6.3 Why This Fits the Project Pillars

| Pillar | How Soft-Target Hybrid Honors It |
|--------|----------------------------------|
| Classic MMO soul | Soft-target preserves the RPG feel of ability-driven combat |
| Not fully tab-target | Ballistic projectiles and ability shapes allow terrain and positioning expression |
| Not fully action | No dodge-spam, no animation-lock brawler feel |
| Group readability | Soft-target + ability shapes scale to multiplayer without chaos |
| Terrain matters | Cones, lines, and ground-targeted effects make elevation and cover meaningful |

### 6.4 Status

**PROPOSED** — Pending Technical Architect review for streaming/entity targeting implications, and Director approval for combat feel direction.

---

## 7. Progression Flavor Framework Recommendation

### 7.1 Core Framework: Collections with Build Impact

Each progression flavor should function as a **collection system with mechanical weight**, not just cosmetic unlocks or lore entries.

### 7.2 Framework Definition

| Flavor | Collection Type | Mechanical Expression | Acquisition Method |
|--------|-----------------|----------------------|-------------------|
| **Constellations** (Apogist) | Star patterns | Each constellation modifies a finisher or unlocks a new finisher pattern; mix-and-match for build diversity | Sky-watching at night, celestial events, class quests, high-altitude discovery |
| **Tongues** (Tephrate) | Forbidden words/phrases | Each Tongue is a stance or vent modifier; equipping different Tongues changes Fault behavior | Taboo sites, volcanic vents, Severed encounters, class quests, ritual risk |
| **Aspects** (Bonder) | Wildlife bonds | Each Aspect is a form/shift with ability loadout; only one active at a time, but swap in sanctuary | Tracking quests, ritual worthiness trials, relic creature encounters |
| **Chants** (Forceshaper) | Formal techniques | Chants modify Confluence sequencing (add steps, change effects, reduce penalties) | Arrival academies, native adaptation teachers, elemental sites, class quests |
| **Etchings** (Armsman) | Combat philosophies | Etchings are passive modifiers or stance changes that alter Opening generation and exploitation | Weapon masters, veteran armsmen, battlefield monuments, class quests |
| **Strings** (Ranger) | Shot disciplines | Strings modify projectile behavior, Line-reading conditions, and range/damage tradeoffs | Master hunters, line-of-sight challenges, wind-reading sites, class quests |

### 7.3 Key Principles

1. **Collectible but not completionist-mandatory:** Players can collect many, but only equip/use a limited set at a time
2. **Sidegrade emphasis early:** Early unlocks provide options, not pure power increases
3. **World-tied acquisition:** Every flavor item should require visiting a place, meeting a being, or experiencing an event
4. **Build expression:** The "deck" of equipped flavors defines character build as much as gear

### 7.4 Status

**PROPOSED** — Framework level only. Specific Constellation/Tongue/Aspect/etc. lists remain for future design phases.

---

## 8. Class Fantasy Risk Flags

### 8.1 High Implementation Cost Risks

| Class | Risk Area | Concern | Mitigation |
|-------|-----------|---------|------------|
| **Bonder** | Aspect Visions | "Brief vision or manifestation" requires UI/VFX/audio treatment for every Aspect. If 20+ Aspects planned, this is expensive. | Limit starter Aspects to 3 (one per role). Visions should be brief (2–3 seconds), reusable assets with variation, not bespoke cinematics. |
| **Apogist** | Constellation Patterns | Pattern-completion gameplay requires clear UI feedback, star-position tracking, and timing windows. | Patterns should be simple shapes (triangle, square, line) not complex connect-the-dots. UI should highlight valid next stars. |
| **Forceshaper** | Confluence Sequencing | Sequencing mechanics require clear UI for current sequence, valid next elements, and empowered state. | Max sequence length of 3–4 elements. Clear audio/visual feedback for successful sequences. |

### 8.2 Vague/Underdefined Risks

| Class | Risk Area | Concern | Mitigation |
|-------|-----------|---------|------------|
| **Tephrate** | Faults | "Creates Faults" is undefined — persistent ground effects? Debuffs on enemies? Terrain modification? | Define early: Faults are persistent ground zones (visual: cracked earth, ember glow) that modify abilities used within them. |
| **Ranger** | Read the Line | "Identifies, predicts, or prepares a clean line of attack" needs mechanical translation. | Define early: "Lines" are high-ground sightlines or unobstructed paths. Ranger abilities gain bonuses when used from/through Lines. UI highlights valid Lines. |
| **Armsman** | Openings | "Creates and exploits enemy weaknesses" needs state definition. | Define early: Openings are a stacking debuff or timed vulnerability state triggered by specific ability sequences or enemy actions. |

---

## 9. Economy/Trade High-Level Implications

### 9.1 Current State

Economy_Philosophy_v0.md is [PROPOSED] with all questions open. No locked decisions.

### 9.2 Systems-Relevant Observations

| Observation | Implication |
|-------------|-------------|
| Progression philosophy rejects gear-treadmill primacy | Economy must provide meaningful non-gear sinks and rewards (flavor collection, housing, trade goods, reputation) |
| Sidegrade emphasis | Crafting should support sidegrade creation, not just "+1 sword" upgrades |
| Place matters / regional resources | Gathering and trade routes should encourage travel across the seamless overworld |
| Class integration | Economy systems should support progression flavor acquisition (rare materials for rituals, star-charting tools, etc.) |

### 9.3 Deferral Recommendation

Full economy implementation (auction house, advanced crafting, guild structures) is correctly deferred beyond 1–10. For the vertical slice, recommend:

- **Vendors:** Basic gear and consumables only
- **Gathering:** Single profession (Survival/Scavenging) for flavor-related materials
- **Crafting:** Light crafting for consumables and basic sidegrades only
- **Trade:** Player-to-player trade only; no auction house in 1–10 slice
- **Sinks:** Repair costs, fast travel costs, flavor acquisition costs

---

## 10. Next Systems Milestone Recommendation

### 10.1 Immediate Priority: Lock Targeting Model

**Deliverable:** Combat_Control_Model_Locked.md  
**Owner:** Systems Designer → Technical Architect → Director approval  
**Unblocks:** Ability specification, encounter design, Native 1–5 zone combat encounters

**Content:**
- Soft-target hybrid confirmed
- Movement responsiveness defined
- Hit resolution rules (soft-target vs ballistic)
- Animation priority philosophy

### 10.2 Secondary Priority: Progression Flavor Framework Lock

**Deliverable:** Progression_Flavors_Framework.md  
**Owner:** Systems Designer → Director approval  
**Unblocks:** Class quest design, exploration reward design, Native 1–5 progression pacing

**Content:**
- Collection system structure confirmed
- Acquisition method categories defined
- Build expression rules (how many equipped, swap restrictions)
- Examples for each flavor (1–2 per class, not full lists)

### 10.3 Tertiary Priority: 1–10 Slice Systems Brief

**Deliverable:** Native_1-5_Systems_Brief.md  
**Owner:** Systems Designer  
**Unblocks:** Zone design, quest design, encounter design, prototype tasks

**Content:**
- Level pacing curve (XP per level, expected time)
- Ability unlock cadence per class (what you get at 1, 3, 5)
- Flavor unlock cadence (first Constellation/Tongue/etc. by level 5)
- Gear involvement level
- Death/respawn rules
- Expected group size for content

---

## 11. Escalation Items

The following require cross-agent coordination or human decision:

| Item | Current Block | Escalation Path |
|------|---------------|-----------------|
| Targeting model technical feasibility | Requires Technical Architect review of entity targeting in seamless overworld | Systems Designer → Technical Architect |
| Death/respawn philosophy | Missing from all docs; affects world feel and encounter design | Systems Designer → Director |
| Progression flavor acquisition fiction overlap | Worldbuilder/Cartographer may have regional site preferences for flavor acquisition | Systems Designer → Worldbuilder → Director |
| Class fantasy vs. cultural expression boundary | Need clarity on where gameplay chassis ends and cultural flavor begins | Systems Designer → Director |

---

## 12. Status Summary

| Element | Status | Notes |
|---------|--------|-------|
| This Review Document | PROPOSED | Awaiting human review and approval |
| Soft-target hybrid recommendation | PROPOSED | Pending Technical Architect and Director approval |
| Progression flavor framework | PROPOSED | Pending Director approval |
| Targeting model lock | OPEN | Next milestone deliverable |
| Progression flavors framework lock | OPEN | Secondary milestone deliverable |
| 1–10 slice systems brief | OPEN | Tertiary milestone deliverable |

---

*Produced by: Systems Designer*  
*Next Step: Human review of recommendations, approval to proceed with Combat_Control_Model_Locked.md*
