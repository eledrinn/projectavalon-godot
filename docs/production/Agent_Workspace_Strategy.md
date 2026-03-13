AGENT OUTPUT PROTOCOL
Title: Project Avalon — Agent Workspace Strategy v0
Author: Technical Architect
Date: 2026-03-11
Inputs: Docs/Production/Agent_Charters.md; Agents/README.md; Docs/Production/Studio_Operating_Model.md
Recipients: Director, Technical Architect, All Agents
Status: Tentative

---

# Agent Workspace Strategy v0

This document defines the workspace topology for Project Avalon agents: where they live, how they hydrate after restart, what canon travels with them, and how future roles integrate.

---

## 1. Agent Bays: Dedicated vs Shared

### 1.1 Dedicated Agent Bays (`Agents/<Role>/`)

The following chartered roles receive **dedicated bays** under `Agents/`:

| Role | Bay Path | Rationale |
|------|----------|-----------|
| Director / Canon Keeper | `Agents/Director/` | Canon authority requires isolated decision logs and escalation tracking |
| Systems Designer | `Agents/SystemsDesigner/` | Needs persistent design scratch space for mechanic iterations |
| Technical Architect | `Agents/TechnicalArchitect/` | Architecture notes, risk registers, and deferred complexity logs |
| Worldbuilder / Cartographer | `Agents/Worldbuilder/` | Map iterations, biome logic drafts, geographic contradiction tracking |
| Prototype Builder | `Agents/PrototypeBuilder/` | Task breakdown drafts, implementation planning, acceptance criteria |
| QA / Scope Police | `Agents/QA_Scope/` | Contradiction logs, scope assessments, verification checklists |

**Each bay contains:**
- `BOOTSTRAP.md` — Identity, required reading, current marching orders
- `STATUS.md` — Last touch, current blockers, next handoff
- `Scratch/` — Disposable working space; must be promoted to canon folders per Agent Output Protocol

### 1.2 Shared Workspace Folders

The following are **shared collaborative spaces**, not agent-specific:

| Folder | Purpose | Access Rules |
|--------|---------|--------------|
| `Docs/WorldBible/` | Canon lore, geography, peoples | All agents read; Director/Worldbuilder write |
| `Docs/GameDesign/` | Systems, combat, progression | All agents read; Systems Designer write with Director sign-off |
| `Docs/TechnicalDesign/` | Architecture, streaming, networking | All agents read; Technical Architect write |
| `Docs/Production/` | Rules, charters, status, questions | All agents read; Director/QA write |
| `Concept/` | Visual concepts, maps, mood | Worldbuilder primary; others contribute via Scratch promotion |
| `Tasks/Active/` | Active work items | Prototype Builder manages; originating agents create |
| `Reference/` | Visual reference, inspiration boards | Shared read/write; no canon status |
| `Pipelines/` | CI/build automation | Technical Architect + Prototype Builder |
| `Economy/` | Economy framework, auction house design | Future Economy agent primary |

### 1.3 Future Agent Bay Assignment Rules

New agents receive dedicated bays **only if** they meet these criteria:

| Criterion | Bay Required? |
|-----------|---------------|
| Produces significant ephemeral scratch work | Yes |
| Requires persistent local decision logs | Yes |
| Primarily consumes canon vs produces it | No (use shared folders) |
| Supports multiple parallel workstreams | Yes |
| Scoped to single task or short-term | No (use `Tasks/Active/` scratch) |

---

## 2. Canon Doc Sync: Auto-Injected Into Every Workspace

### 2.1 Universal Canon (All Agents)

These documents are **automatically linked or summarized** in every `BOOTSTRAP.md`:

| Document | Location | Purpose |
|----------|----------|---------|
| Production_Rules.md | `Docs/Production/` | Hard pillars, scope rules, status labels |
| Agent_Charters.md | `Docs/Production/` | Role boundaries, escalation triggers |
| Studio_Operating_Model.md | `Docs/Production/` | Workflow: Brief → Promotion → Approval → Escalation |
| PROJECT_STATUS.md | Root | Current phase, doc statuses, immediate gaps |

### 2.2 Role-Specific Required Reading

Each `BOOTSTRAP.md` links to domain-relevant locked docs:

**Director/Canon Keeper:**
- All WorldBible docs (source of lore truth)
- All GameDesign docs (source of systems truth)
- All TechnicalDesign docs (feasibility awareness)

**Systems Designer:**
- `Docs/GameDesign/Combat_Philosophy_v0.md`
- `Docs/GameDesign/Progression_Philosophy_v0.md`
- `Docs/GameDesign/Classes_Overview.md`
- `Docs/GameDesign/Travel_and_Mounts_v1.md`
- `Docs/GameDesign/Crafting_and_Gathering_v1.md`

**Technical Architect:**
- `Docs/TechnicalDesign/Technical_Architecture_v0.md`
- `Docs/TechnicalDesign/Streaming_and_Seamlessness.md`
- `Docs/TechnicalDesign/Engine_Workspace_Foundation_Spec_v1.md`
- `Docs/TechnicalDesign/Multiplayer_Authority_Model_v1.md`

**Worldbuilder:**
- `Docs/WorldBible/World_Overview.md`
- `Docs/WorldBible/Peoples_Natives.md`
- `Docs/WorldBible/Peoples_Arrivals.md`
- `Docs/WorldBible/Peoples_Severed.md`
- `Docs/WorldBible/Starter_Continent_Slice.md`

**Prototype Builder:**
- `Docs/TechnicalDesign/Engine_Workspace_Foundation_Spec_v1.md`
- Active tasks in `Tasks/Active/`
- `PROJECT_STATUS.md` (current priorities)

**QA / Scope Police:**
- All locked docs (contradiction detection requires full context)
- `Docs/Production/Open_Questions.md`

### 2.3 Auto-Sync Implementation

**Human operator responsibility:** When a doc is promoted to LOCKED status, update all affected `BOOTSTRAP.md` files to link the new required reading.

**Subagent responsibility:** On activation, read `BOOTSTRAP.md` first, then all linked required reading before producing output.

---

## 3. Storage & Versioning for Prompts/Bootstraps

### 3.1 Prompt Storage Hierarchy

```
Prompts/
  Agents/
    <Role>/
      bootstrap-v0.md      # Canonical charter-based prompt
      bootstrap-v1.md      # Increment on major workflow changes
      supplements/         # Optional: task-specific addenda
  Tasks/
    <task-type>/
      design-brief-v0.md
      tech-review-v0.md
      scope-audit-v0.md
```

### 3.2 Bootstrap Versioning Rules

| Trigger | Action |
|---------|--------|
| Agent charter updated | Increment bootstrap version, update all bays |
| New required reading added | Increment bootstrap version |
| Workflow changes (e.g., new escalation path) | Increment bootstrap version |
| Minor marching orders update | Edit in-place, no version bump |

### 3.3 Backup & Rollback

- All prompts stored in Git alongside project docs
- Previous versions preserved in Git history
- Emergency rollback: `git checkout <commit> -- Prompts/Agents/<Role>/`

### 3.4 BOOTSTRAP.md vs Prompts/ Relationship

| File | Purpose | Edit Frequency |
|------|---------|----------------|
| `Agents/<Role>/BOOTSTRAP.md` | Instance-specific state (marching orders, current blockers) | Per-session |
| `Prompts/Agents/<Role>/bootstrap-v#.md` | Template/generator for BOOTSTRAP.md structure | Rarely |

**Workflow:** Update `Prompts/Agents/` template → Propagate to `Agents/<Role>/BOOTSTRAP.md` instances during agent refresh.

---

## 4. Rehydration Procedure After Restart

### 4.1 File Read Order (Mandatory)

When an agent (re)spawns, read in this exact order:

1. **`Agents/<Role>/BOOTSTRAP.md`** — Who am I, what are my marching orders
2. **`Agents/<Role>/STATUS.md`** — What was I last doing, what's blocked
3. **Universal Canon** (per Section 2.1) — Project-wide rules and status
4. **Role-Specific Required Reading** (per Section 2.2) — Domain context
5. **Task-specific inputs** linked in BOOTSTRAP.md marching orders

### 4.2 Memory Policy

| What | Where | Survives Restart? |
|------|-------|-------------------|
| Daily work logs | `Agents/<Role>/Scratch/YYYY-MM-DD.md` | Yes (filesystem) |
| Current STATUS | `Agents/<Role>/STATUS.md` | Yes |
| Long-term curated memory | `MEMORY.md` (if exists) | Yes |
| Chat/session history | — | **NO** |
| Mental notes | — | **NO** |

**Rule:** If you want to remember something, write it to a file. Chat is ephemeral.

### 4.3 Rehydration Checklist (Agent-Self-Diagnostic)

Before producing output, verify:

- [ ] Read BOOTSTRAP.md — Do I know my role and current orders?
- [ ] Read STATUS.md — Do I know what I was last working on?
- [ ] Read universal canon — Am I aware of hard pillars and current phase?
- [ ] Read role-specific docs — Do I have domain context?
- [ ] Check `Tasks/Active/` — Are there assigned tasks for my role?

If any check fails: Update STATUS.md with blocker, request Director guidance.

### 4.4 Post-Restart STATUS Update

After rehydration, append to `STATUS.md`:

```markdown
**Session Start: YYYY-MM-DD HH:MM**
- Rehydrated from: [list key docs read]
- Current focus: [what you're picking up]
- Blockers: [none / list]
```

---

## 5. Discord Channel ↔ Workspace Responsibility Mapping

### 5.1 Channel Taxonomy

| Discord Channel | Workspace Responsibility | Primary Agent | Output Location |
|-----------------|-------------------------|---------------|-----------------|
| `#canon-keeper` | Canon decisions, escalations, contradictions | Director | `Docs/Production/Decision_Logs/` |
| `#systems-design` | Combat, progression, class design discussions | Systems Designer | `Docs/GameDesign/` |
| `#worldbuilding` | Geography, biomes, peoples, cultures | Worldbuilder | `Docs/WorldBible/`, `Concept/Maps/` |
| `#tech-architecture` | Streaming, networking, UE5, data structures | Technical Architect | `Docs/TechnicalDesign/` |
| `#prototype-tasks` | Implementation planning, task breakdown | Prototype Builder | `Tasks/Active/` |
| `#scope-qa` | Contradiction flagging, scope audits | QA / Scope Police | `Docs/Production/Scope_Assessments/` |
| `#general` | Cross-cutting discussion, human coordination | Any (ephemeral) | None — summarize to STATUS.md if needed |

### 5.2 Channel-to-Workspace Workflow

1. **Discussion happens in Discord** (fast, ephemeral)
2. **Decisions/outcomes written to workspace** (permanent, canonical)
3. **Discord posts link to workspace files** — Never rely on scrollback
4. **Agent Output Protocol headers** make workspace docs self-contained

### 5.3 Agent Presence Rules

| Context | Channel Participation |
|---------|----------------------|
| Agent working solo on assigned task | Silent; update STATUS.md only |
| Agent has question/blocker | Post in role channel + tag relevant agent |
| Agent has output to share | Post summary + file path in role channel |
| Contradiction detected | Post in `#scope-qa` with links to conflicting docs |
| Canon escalation needed | Post in `#canon-keeper` with context |

---

## 6. Access Rules for Future Agents

### 6.1 Future Role Definitions

The following roles are **planned but not yet chartered**. This section defines their workspace access:

| Future Role | Type | Bay? | Primary Folders | Notes |
|-------------|------|------|-----------------|-------|
| **Quest Designer** | Content | Yes | `Agents/QuestDesigner/`, `Docs/Quests/`, `Docs/WorldBible/` | Narrative arc design, quest scripting logic |
| **Economy Designer** | Systems | Yes | `Agents/Economy/`, `Docs/Economy/`, `Docs/GameDesign/` | AH design, currency sinks/faucets, trade |
| **Environment Artist (Technical)** | Art/Tech | No | `Concept/`, `Reference/`, `Pipelines/` | World art direction, material pipelines |
| **Content Integrator** | Operations | Yes | `Agents/ContentIntegrator/`, `Tasks/`, `Pipelines/` | Merges agent outputs, validates file structure |
| **Reference Curator** | Support | No | `Reference/` | Organizes visual reference, mood boards |

### 6.2 Charter-Before-Bay Rule

No future agent receives a dedicated bay until:

1. **Charter document** exists in `Docs/Production/Agent_Charters.md` (or new v#)
2. **Role boundaries** defined (responsible / not responsible)
3. **Escalation triggers** documented
4. **Output format** specified
5. **Director approval** (human sign-off)

### 6.3 Future Agent Workspace Assignment Logic

```
IF (produces ephemeral scratch AND persistent local logs AND parallel workstreams):
    CREATE Agents/<Role>/ bay
    INCLUDE BOOTSTRAP.md + STATUS.md + Scratch/
ELSE IF (primarily consumes canon OR single-task scoped):
    USE shared folders (Docs/<line>/ or Tasks/Active/)
    NO dedicated bay
ELSE IF (art/reference role without code output):
    USE Concept/ + Reference/
    NO dedicated bay
```

### 6.4 Economy Agent Pre-Assignment

The `Economy/` folder already exists at project root with `Economy_Philosophy_v1.md`. When chartered:

- **Bay:** `Agents/Economy/` (subject to charter meeting criteria)
- **Primary output:** `Docs/Economy/`
- **Required reading:** `Docs/GameDesign/Crafting_and_Gathering_v1.md`, `Docs/GameDesign/Progression_Philosophy_v0.md`
- **Discord channel:** `#systems-design` (or new `#economy-design` if created)

### 6.5 Quest Agent Pre-Assignment

When chartered:

- **Bay:** `Agents/QuestDesigner/` (high scratch volume expected)
- **Primary output:** `Docs/Quests/` (to be created)
- **Required reading:** All WorldBible docs, `Classes_Overview.md`, `Combat_Philosophy_v0.md`
- **Discord channel:** `#worldbuilding` (quest lore) + `#systems-design` (quest mechanics)

### 6.6 Content Integrator Role Definition

A specialized future role for operational integrity:

**Mission:** Ensure agent outputs are properly formatted, linked, and promoted.

**Responsibilities:**
- Validate Agent Output Protocol headers on all docs
- Ensure Scratch/ → Docs/ promotion occurs
- Maintain cross-linking between related docs
- Flag orphaned docs (no incoming links)
- Maintain folder structure hygiene

**Not Responsible For:**
- Canon decisions (Director)
- Design changes (Systems/World)
- Technical implementation (Prototype Builder)

**Workspace:**
- **Bay:** `Agents/ContentIntegrator/` (persistent task queues)
- **Primary output:** `Docs/Production/Integration_Logs/`, structure fixes across repo
- **Discord channel:** `#scope-qa` (coordination with QA)

---

## 7. Implementation Checklist

To bring this strategy into effect:

- [ ] Create `Agents/Economy/` bay when Economy agent chartered
- [ ] Create `Agents/QuestDesigner/` bay when Quest agent chartered
- [ ] Create `Agents/ContentIntegrator/` bay when operational load requires
- [ ] Populate `Prompts/Agents/<Role>/` templates for all current roles
- [ ] Verify all `BOOTSTRAP.md` files link to Section 2.1 universal canon
- [ ] Create Discord channel `#prototype-tasks` if not exists
- [ ] Document rehydration procedure in each `BOOTSTRAP.md` (summary)
- [ ] Add "Charter-Before-Bay Rule" to `Agent_Charters.md` as amendment

---

## Status Log

| Version | Date | Change | Author |
|---------|------|--------|--------|
| v0 | 2026-03-11 | Initial strategy draft | Technical Architect |

---

**Next Review:** When first future agent (Quest/Economy) is chartered, validate bay assignment rules.
