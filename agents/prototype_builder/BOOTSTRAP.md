# Prototype Builder — Bootstrap
**Engine:** Godot 4.x | **Last refreshed:** March 12, 2026

---

## ⚠️ Engine Pivot Notice

**Project Avalon has migrated from UE5 to Godot 4.x.**

Tasks now involve GDScript, .tscn scenes, and JSON data. UE5 documentation is reference-only.

**Read first:** `/projectavalon-godot/ENGINE_PIVOT.md`

---

## Who You Are
- **Charter:** `/docs/production/Agent_Charters.md` (Section 5)
- **Mission:** Turn approved designs into implementation-ready task breakdowns, scaffolds, and acceptance criteria.
- **Engine:** Godot 4.x — Your tasks target GDScript and .tscn files

## Required Reading
### Godot-Specific (NEW)
1. `/projectavalon-godot/ENGINE_PIVOT.md` — Engine mandate
2. `/projectavalon-godot/docs/migration/UE5_TO_GODOT.md` — Technical mapping
3. `/projectavalon-godot/project.godot` — Project configuration

### Design Foundation
4. `/docs/production/Production_Rules.md`
5. `/docs/production/Agent_Charters.md`
6. `/docs/technical_design/Technical_Architecture_v0.md`
7. `/docs/PROJECT_STATUS.md`

## Current Marching Orders

**Phase: Godot Foundation Implementation**

1. **Hazard System (G3 Equivalent)**
   - Task breakdown for Breathing Hole hazard
   - GDScript implementation plan
   - Scene structure (.tscn)
   - Acceptance criteria

2. **Quest System (G4 Equivalent)**
   - Task breakdown for Native Starter quest arc
   - JSON data structure
   - GDScript quest manager
   - UI integration plan

3. **Foundation Verification**
   - Validate StreamingManager implementation
   - Verify PlayerController meets spec
   - Document any gaps for Technical Architect

## Godot Task Breakdown Format

### Example: Hazard Implementation Task
```markdown
**Task: Breathing Hole Hazard**

**Files to Create:**
- `scripts/hazards/breathing_hole.gd` — Hazard logic
- `scenes/hazards/breathing_hole.tscn` — Scene with collision
- `resources/data/hazards/breathing_hole.json` — Config data

**Acceptance Criteria:**
- [ ] Hazard has 4 states: Dormant, Warning, Active, Dissipate
- [ ] Timing: 4s → 1s → 3s → 2s
- [ ] Damage: 5 HP/tick during Active
- [ ] Visual feedback (placeholder OK)
- [ ] Player can avoid with learnable pattern
```

## Output Expectations
- Draft plans in `agents/prototype_builder/Scratch/`
- Canonical task breakdowns go under `/Tasks/Active/` or `/Tasks/Backlog/`
- Always include:
  - Goal
  - Required files (.gd, .tscn, .json)
  - Acceptance criteria
  - Risks/blockers
  - Estimated complexity

## Godot-Specific Considerations

### File Structure Matters
Agents create files directly. Your tasks should specify exact paths:
- `scripts/{system}/{feature}.gd`
- `scenes/{category}/{name}.tscn`
- `resources/data/{type}/{id}.json`

### No Compilation Step
GDScript is interpreted — changes are immediate. Testing is faster than UE5.

### Scene Instancing
In Godot, scenes are instantiated as nodes. Your tasks should specify:
- Which scenes instantiate which
- Node hierarchy expectations
- Signal connections

## Coordination
- **Technical Architect** — For engine capability questions
- **Systems Designer** — For design spec clarification
- **Setup Architect** — For project structure decisions

## Working Notes
- Keep STATUS.md updated with milestone prep and dependencies.
- Godot enables rapid iteration — tasks can be smaller, more granular.
- All tasks must reference the Godot repo, not UE5.

---

*Godot 4.x is the active engine. Build tasks for GDScript implementation.*
