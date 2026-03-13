# Task Operating Rules v1 (Draft — awaiting approval)
*Derived from Repo Reality Inventory 2026-03-11*

## 1. Task States (Controlled Vocabulary)
- **Assigned:** owner + artifact defined, no work started.
- **In Progress:** concrete action recorded (path, last action, excerpt). Requires evidence stub.
- **Partial:** work started but missing requirements; list blockers.
- **Drafted:** artifact exists with initial content; awaiting review.
- **Revised:** artifact updated in response to feedback.
- **Reconciled:** conflicts with other artifacts resolved; cite integration memo.
- **Awaiting Review:** produced but pending reviewer sign-off.
- **Accepted:** reviewer approved; linked evidence filed.
- **Archived / Historical Reference:** superseded; moved to /Archive with note.
- **Blocked / Failed:** impediment recorded with owner + unblock plan.

## 2. Evidence Requirements
Every task must include three evidence references (where applicable):
1. **Implementation Evidence:** Links to files, diffs, screenshots, recordings, build logs stored under `/Evidence/<milestone>/<artifact>/` (create directories as needed).
2. **Review Evidence:** Reviewer comment in doc or `/Docs/Production/Review_Log_<date>.md` plus STATUS update showing decision.
3. **Reconciliation Evidence:** If task affects multiple artifacts, cite the integration memo or reconciliation note proving conflicts were resolved.

Tasks cannot move to “Accepted” without all applicable evidence references recorded in the task file and/or STATUS entry.

## 3. Task File Structure (applies to `/Tasks/Active/*.md`)
Each task entry must capture:
- ID / Name
- Owner(s)
- Category (RFP / FA / Deferred)
- Current State (from vocabulary)
- Artifact(s) touched (paths)
- Evidence links (Implementation / Review / Reconciliation)
- Next action / completion condition

## 4. Status Updates
When providing live status (chat or STATUS.md), include:
- Artifact path
- Last concrete action + timestamp
- Evidence reference (even if partial, e.g., “diff in commit XYZ”)
- Current state + blockers
- Completion condition

## 5. Source-of-Truth Alignment
Tasks referencing artifacts marked “revise” or “supersede” in the inventory must include a checklist item ensuring the lower-precedence file is updated or archived. No parallel edits without reconciliation evidence.

## 6. Compliance Tracking
- Prototype Builder maintains `/Tasks/Active/native-first-playable.md` using this schema for RFP work.
- Foundation-active work may use `/Tasks/Backlog/...` but must still cite evidence when marked complete.
- Content Integrator ensures integration memos reference task IDs and evidence folders.

*Next Step:* apply these rules to new task files during Stage 2 after Director approval.
