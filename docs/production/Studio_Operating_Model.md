AGENT OUTPUT PROTOCOL
Title: Project Avalon – Studio Operating Model v0
Author: Director / Canon Keeper Subagent
Date: 2026-03-11
Inputs: Docs/Production/Production_Rules.md; Docs/Production/Agent_Charters.md
Recipients: Director / Canon Keeper, Systems Designer, Technical Architect, Worldbuilder, Prototype Builder, QA / Scope Police

## 1. Agent Workflow (Brief → Promotion → Approval → Escalation)
1. **Source-of-truth first**
   - No briefs without an approved canon page covering the topic (“Production Rules #2–3”).
   - When canon is missing, Director commissions or drafts a scratch note flagged **Open Question**.
2. **Brief creation**
   - Author identifies scope, links prior canon, sets Status label (Proposed/Tentative).
   - QA validates scope fit before work moves to Active.
3. **Drafting & collaboration**
   - Agents annotate contradictions immediately and request Director guidance if canon tension appears.
   - Use inline status tags for sections when certainty differs.
4. **Doc promotion**
   - When draft is internally aligned, author promotes from scratch folder to `/Docs/<line>/` and updates status to **Tentative**.
   - Director reviews for canon fit; Technical Architect/System Designer sign if their domains are touched.
5. **Approval & locking**
   - Once Director signs off, document is marked **Locked** in header and commit message; QA records any pending verification tasks.
6. **Escalation path**
   - Lore/gameplay conflicts, multi-agent disagreements, pillar impacts, or scope drift trigger Director escalation (per Agent Charter index).
   - Escalations recorded in Director decision log with owner + deadline.

## 2. Milestone Workflow (Backlog → Active → Done)
1. **Backlog intake**
   - Items require: link to canon page, success criteria, status label (Proposed/Tentative).
   - QA ensures item maps to frontier slice or long-term foundation.
2. **Activation criteria**
   - Director confirms priority + dependencies satisfied.
   - Responsible agent posts brief with Agent Output Protocol header and status **Tentative**.
3. **Active execution**
   - Weekly checkpoint: responsible agent posts summary; QA verifies scope; Director checks canon implications.
   - Mandatory review gates: (a) Design Complete, (b) Prototype-ready, (c) Canon update merged.
4. **Done definition**
   - Deliverable merged to repo under `/Docs/...` with status **Locked** (or **Tentative** if awaiting playtest).
   - QA logs verification notes; Director updates milestone tracker and moves cards/files to Done archive.
5. **Regression handling**
   - Any change request against a Locked milestone reopens item to **Active** with new version suffix and change log entry.

## 3. Approval Flow & Lock Status Assignment
| Doc Type | Required Sign-off | Lock Trigger |
| --- | --- | --- |
| Canon / Lore / Naming | Director primary, QA concurrence | Director marks Locked after contradiction check |
| Systems Design Briefs | Systems Designer + Director (canon touch) + QA scope review | After tradeoffs logged, dependencies satisfied |
| Technical Architecture | Technical Architect + Director for pillar impacts + QA if scope risk | After risk + maintainability sections complete |
| World / Cartography | Worldbuilder + Director + Systems when gameplay hooks exist | After geographic logic + biome coherence verified |
| Prototype Task Plans | Prototype Builder + originating designer + QA | After acceptance criteria + file targets validated |

- Lock status inherits upstream dependency: no downstream doc can be Locked while its parent is Tentative.
- Each sign-off recorded in header (`Status: Locked by <role>, date`).
- Conflicting approvals default back to Tentative until Director arbitration.

## 4. Output Protocol Rules
1. **Header**: Every deliverable starts with “AGENT OUTPUT PROTOCOL” header block (Title, Author, Date, Inputs, Recipients, Status optional).
2. **Status labels**: Use **Locked**, **Tentative**, **Proposed**, **Open Question** inline and/or at top. Changes must describe what shifted status.
3. **File locations**:
   - Scratch/working: `/projectavalon/Scratch/<agent>/...`
   - Canon-in-progress: `/projectavalon/Docs/<discipline>/...`
   - Decision logs: `/projectavalon/Docs/Production/` (Director maintains).
4. **Versioning**: Append `_v#` or dated suffix. Increment on every lock change or major revision.
5. **Commit hygiene**: One logical document per commit; message includes status shift (e.g., “Lock Native Starter Zone brief v1”).

## 5. Review Rules (Role Responsibilities)
- **Director / Canon Keeper**: Final canon authority, ensures pillars + naming consistency, records escalations, locks docs.
- **QA / Scope Police**: Flags contradictions/overscope, enforces milestone criteria, must sign every milestone exit before Done.
- **Requester / Originator**: Supplies context + success criteria, acknowledges tradeoffs, cannot override canon alone.
- **Systems / Technical / World / Prototype Agents**: Within lane, ensure drafts cite canon, provide tradeoffs, and notify Director when assumptions change.
- **Review cadence**: Major docs need two reviewers minimum (domain owner + QA) before Director lock; minor updates (typo, formatting) can be fast-tracked with Director notice.

## 6. Doc Promotion Rules (Scratch → Canon)
1. **Scratch stage**
   - Freeform exploration allowed; label every section **Proposed** or **Open Question**.
   - Store under personal or WIP folders; no lock claims.
2. **Promotion checklist**
   - Canon references linked, contradictions resolved, scope validated.
   - Header completed with Inputs + Recipients; file moved into `/Docs/` tree.
3. **Tentative stage**
   - Version suffix assigned (`_v0`, `_v1`).
   - Reviewer list populated; QA adds verification tasks if needed.
4. **Canon lock**
   - Director (and involved leads) add sign-off note; status set to **Locked**.
   - Git commit tags or lightweight release notes capture lock state.
5. **Changes to Locked docs**
   - Open new branch/file copy with incremented version.
   - Highlight deltas + rationale; previous version archived, never deleted.
6. **Git expectations**
   - No force-push on canon branches.
   - Pull requests reference originating brief/milestone ID; reviewers include Director + QA when status upgrade occurs.
