# Project Status Dashboard — Project Avalon

**Last Updated:** 2026-03-10 (Agent Output Protocol added)

## Current Phase
Foundation Hardening — All source-of-truth docs exist and are ready for subagent work

---

## Hard Pillars (LOCKED)
1. ✅ No overworld loading screens
2. ✅ Planetary world in lore and technical architecture  
3. ✅ Globe-compatible foundation
4. ✅ Global circumnavigation possible later
5. ✅ Starter vertical slice first (levels 1–10)
6. ✅ Procedural/semi-procedural macro terrain support
7. ✅ Hand-authored gameplay spaces and landmarks
8. ✅ Stylized readable art direction
9. ✅ Classic MMO soul, modern production
10. ✅ Agents assist; canon lives in docs, not chat memory

---

## Source-of-Truth Docs Status

| Document | Status | Location | Notes |
|----------|--------|----------|-------|
| Production_Rules.md | 🟢 LOCKED | /Docs/Production/ | Hard pillars, scope rules, status labels defined |
| Agent_Charters.md | 🟢 LOCKED | /Docs/Production/ | 6 agent roles chartered with clear boundaries |
| Open_Questions.md | 🟢 LOCKED | /Docs/Production/ | Tracked unknowns by category |
| World_Overview.md | 🟢 LOCKED | /Docs/WorldBible/ | Core premise, Age of Ash, three peoples defined |
| Peoples_Natives.md | 🟢 LOCKED | /Docs/WorldBible/ | Wetland-rooted, highland-adapted, visual language set |
| Peoples_Arrivals.md | 🟢 LOCKED | /Docs/WorldBible/ | Sacred-classical, expeditionary, formal |
| Peoples_Severed.md | 🟢 LOCKED | /Docs/WorldBible/ | Survival-engineered, pressure-based, fantasy-industrial |
| Starter_Continent_Slice.md | 🟢 LOCKED | /Docs/WorldBible/ | 8-region geography chain defined |
| Classes_Overview.md | 🟢 LOCKED | /Docs/GameDesign/ | 6 classes with signatures and progression flavors |
| Combat_Philosophy_v0.md | 🟢 LOCKED | /Docs/GameDesign/ | Targeting model, death penalty, pacing locked |
| Multiplayer_Authority_Model_v1.md | 🟢 LOCKED | /Docs/TechnicalDesign/ | Authoritative server with spell batching |
| Progression_Philosophy_v0.md | 🟢 LOCKED | /Docs/GameDesign/ | Cards + Trees, gear equal weight |
| Travel_and_Mounts_v1.md | 🟢 LOCKED | /Docs/GameDesign/ | Glider questline, mounts late |
| Fast_Travel_and_Transport_v1.md | 🟢 LOCKED | /Docs/GameDesign/ | Fast travel restricted, public transport rare |
| Crafting_and_Gathering_v1.md | 🟢 LOCKED | /Docs/GameDesign/ | Mining, Herblore, Clothier for 1–10 |
| PvP_Philosophy_v1.md | 🟢 LOCKED | /Docs/GameDesign/ | One BG in demo, long-term balance |
| Technical_Architecture_v0.md | 🟢 LOCKED | /Docs/TechnicalDesign/ | UE5 locked, World Partition direction set |
| Streaming_and_Seamlessness.md | 🟢 LOCKED | /Docs/TechnicalDesign/ | Seamless overworld principles locked |

---

## Legend
- 🟢 **LOCKED** — Canon, requires explicit human approval to change
- 🟡 **TENTATIVE** — Direction set, details may evolve
- ⚪ **PROPOSED** — Suggestion for discussion
- 🔴 **OPEN** — Unresolved question

---

## Folder Structure Status

| Folder | Status | Notes |
|--------|--------|-------|
| /Docs/WorldBible/ | ✅ Complete | All core lore docs present |
| /Docs/GameDesign/ | ✅ Complete | Core design docs present |
| /Docs/TechnicalDesign/ | ✅ Complete | Architecture docs present |
| /Docs/Production/ | ✅ Complete | Rules, charters, questions tracked |
| /Docs/Economy/ | 🟢 LOCKED | Economy_Philosophy_v1.md — AH yes, party size 4, pacing locked |
| /Tasks/Backlog/ | ⚠️ Empty | Only README present |
| /Tasks/Active/ | ✅ One task | 001-native-starter-zone-design.md created — ready for agent |
| /Tasks/Done/ | ⚠️ Empty | Only README present |
| /Concept/ | ⚠️ Minimal | Only README present |
| /Reference/ | 🔴 MISSING | Folder doesn't exist |
| /UE5Project/ | 🔴 MISSING | Folder doesn't exist |
| /Pipelines/ | 🔴 MISSING | Folder doesn't exist |
| /Prompts/ | 🔴 MISSING | Folder doesn't exist |

---

## Open Questions Summary (from canon doc)

### High Priority
- Exact targeting model (tab vs action vs hybrid)
- Multiplayer networking stack choice
- Terrain streaming implementation specifics
- Level pacing 1–10 XP curve
- Gear/stat model specifics

### Medium Priority
- Economy/trade role (AH? Vendors? Player-only?)
- Group/party size expectations
- Death/respawn penalty philosophy
- Mount timing
- PvP assumptions (long-term)

### Lower Priority
- Weather mechanical impact
- Professions/gathering depth for vertical slice
- Guild/clan support timing
- First real build milestone after foundation

---

## Agent Readiness

| Agent Role | Charter Status | Ready to Activate |
|------------|---------------|-------------------|
| Director / Canon Keeper | 🟢 Complete | ✅ Yes |
| Systems Designer | 🟢 Complete | ✅ Yes |
| Technical Architect | 🟢 Complete | ✅ Yes |
| Worldbuilder / Cartographer | 🟢 Complete | ✅ Yes |
| Prototype Builder | 🟢 Complete | ✅ Yes |
| QA / Scope Police | 🟢 Complete | ✅ Yes |

---

## Immediate Gaps to Address

1. **/Docs/Economy/** framework exists but needs decisions — resolve open questions in Economy_Philosophy_v0.md
2. **/Reference/** folders missing — create for visual reference organization
3. **/UE5Project/** missing — create when engine work begins
4. **/Pipelines/** missing — create for CI/build automation
5. **/Prompts/** missing — create for agent prompt library
6. **Agent outputs** — Systems Designer and Technical Architect need to produce their first specs

---

## Verified Contradictions / Issues

| Issue | Severity | Notes |
|-------|----------|-------|
| Class naming consistency | Low | Apogist/Tephrate/Forceshaper (compound) vs Armsman/Ranger (traditional) — intentional flavor or needs standardization? |
| Progression flavor definitions | Medium | Constellations/Tongues/Aspects/Chants/Etchings/Strings are evocative but mechanically undefined — risk of inconsistent interpretation |
| Economy doc placeholder exists | Low | Framework created, but decisions still needed — track in Open_Questions |
| README folder structure | Low | README.md lists folders that don't exist (Reference/, UE5Project/, Pipelines/, Prompts/) |

---

## Next Exact Step for Subagent Setup

**Activate the Foundation Hardening Sprint:**

1. **Create missing folders:** Economy/, Reference/ (with subfolders), Pipelines/, Prompts/ (with Agents/, Tasks/)
2. **Create economy placeholder:** Add /Docs/Economy/Economy_Philosophy_v0.md with framework questions from Open_Questions.md
3. **Create first Active Task:** Add /Tasks/Active/001-native-starter-zone-design.md using task template
4. **Create glossary:** Add /Docs/WorldBible/GLOSSARY.md defining key terms (The Fall, The Landing, Age of Ash, etc.)
5. **Subagent activation command:** "Activate as Systems Designer. Read your charter, then design the level 1–5 Native starter zone experience based on Starter_Continent_Slice.md and Peoples_Natives.md."

---

## Agent Output Protocol (NEW — ADDED 2026-03-10)

**Critical:** Chat messages are ephemeral. All agent work must be saved to the workspace filesystem.

### Quick Reference
| Agent Role | Output Location |
|------------|-----------------|
| Systems Designer | `/Docs/GameDesign/` |
| Technical Architect | `/Docs/TechnicalDesign/` |
| Worldbuilder | `/Docs/WorldBible/` or `/Concept/Maps/` |
| Canon Keeper | `/Docs/Production/` or `/Docs/WorldBible/` |
| Prototype Builder | `/Tasks/Active/` |
| QA / Scope Police | `/Docs/Production/` |

### Required Header
```markdown
**Status:** Locked / Tentative / Proposed / Open Question  
**Agent:** [Your Role]  
**Date:** YYYY-MM-DD  
**Responds To:** [Task file or triggering doc]  
**Next Agent:** [Who reviews next]
```

### Full Protocol
See `/Docs/Production/Agent_Charters.md` — Agent Output Protocol section at top of file.

---

*This status doc lives at PROJECT_STATUS.md and should be updated as the project evolves.*
