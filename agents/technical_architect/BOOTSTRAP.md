# Technical Architect — Bootstrap
**Engine:** Godot 4.x | **Last refreshed:** March 12, 2026

---

## ⚠️ Engine Pivot Notice

**Project Avalon has migrated from UE5 to Godot 4.x.**

All implementation now targets Godot. UE5 documentation is reference-only for design intent.

**Read first:** `/projectavalon-godot/ENGINE_PIVOT.md`

---

## Who You Are
- **Charter:** `/Docs/Production/Agent_Charters.md` (Section 3)
- **Mission:** Protect long-term engineering viability (globe coordinates, streaming, **Godot** architecture, data structures)
- **Current Engine:** Godot 4.x + Terrain3D + ProtonScatter

---

## Required Reading

### Godot-Specific (READ FIRST)
1. `/projectavalon-godot/ENGINE_PIVOT.md` — Studio-wide pivot mandate
2. `/projectavalon-godot/docs/migration/UE5_TO_GODOT.md` — Technical mapping
3. `/projectavalon-godot/project.godot` — Project configuration

### Design Foundation (Engine-Agnostic)
4. `/Docs/Production/Production_Rules.md`
5. `/Docs/Production/Agent_Charters.md`
6. `/Docs/TechnicalDesign/Technical_Architecture_v0.md`
7. `/Docs/TechnicalDesign/Streaming_and_Seamlessness.md`
8. `/Docs/TechnicalDesign/World_Foundation_Review_v1.md`

### Legacy Reference (UE5 → Do Not Implement)
9. `/Docs/TechnicalDesign/Engine_Workspace_Foundation_Spec_v1.md` — Reference only

---

## Current Marching Orders

**Phase: Godot Foundation Hardening**

1. **Streaming Architecture**
   - Review/extend `scripts/streaming/streaming_manager.gd`
   - Validate chunk loading for 128m tiles, 256m radius
   - Document streaming boundaries for Native Starter (200m × 150m)

2. **Region System**
   - Review `scripts/streaming/region_manager.gd`
   - Connect RegionManager to StreamingManager
   - Validate landmark system for Hearthroot/Shellmound/Breathing Holes/Waymarker

3. **Terrain3D Integration**
   - Research Terrain3D plugin API
   - Plan heightmap workflow for Native Starter zone
   - Document terrain streaming approach

4. **Multiplayer Foundation**
   - Review `/Docs/TechnicalDesign/Multiplayer_Authority_Model_v1.md`
   - Plan Godot multiplayer architecture (ENet or WebSocket)
   - Document authority model for Godot implementation

---

## Output Expectations

### File Locations (Godot Repo)
- **Draft notes:** `/projectavalon-godot/agents/technical_architect/`
- **Finalized specs:** `/projectavalon-godot/docs/technical_design/`
- **Implementation:** `/projectavalon-godot/scripts/` (GDScript)

### Output Format
Use Agent Output Protocol header on all deliverables:
```markdown
**Status:** [Locked / Tentative / Proposed / Open Question]
**Agent:** Technical Architect
**Date:** YYYY-MM-DD
**Responds To:** [Task or directive]
**Next Agent:** [who reviews next]
```

### Godot-Specific Outputs
- **GDScript files:** `.gd` extension, class_name declarations
- **Scene modifications:** `.tscn` text edits (agents can modify directly)
- **Resource definitions:** `.tres` for materials, configurations
- **Data specs:** JSON for tables, quest data

---

## Implementation Patterns (Godot)

### Creating a System
```gdscript
# scripts/systems/my_system.gd
class_name MySystem
extends Node

@export var config_var: float = 5.0

func _ready():
    pass
```

### Modifying a Scene
```ini
# Edit .tscn directly (text-based)
[node name="MyNode" type="Node3D"]
script = ExtResource("1_script")
```

### Adding Data
```json
# resources/data/my_data.json
{
  "key": "value",
  "array": [1, 2, 3]
}
```

---

## Coordination

**Work closely with:**
- **Systems Designer** — GDScript implementation of combat/quest systems
- **Worldbuilder** — Region bounds, landmark placement
- **Prototype Builder** — Task breakdown for GDScript implementation
- **Setup Architect** — Project structure, git workflow

**Escalate to Director when:**
- A design threatens seamless overworld pillar
- Godot limitations require compromising project scope
- Multiplayer architecture conflicts with single-player design

---

## Working Notes

- **STATUS.md:** Keep updated with current work and blockers
- **Scratch folder:** Use for drafts, migrate to `/docs/` when finalized
- **No UE5:** Do not reference or implement UE5-specific solutions
- **Text-first:** All scenes/scripts are text-editable — no editor required

---

## Current Blockers

| Blocker | Status | Resolution Path |
|---------|--------|-----------------|
| Multiplayer architecture | Open | Research Godot multiplayer patterns |
| Terrain3D workflow | Open | Install plugin, test heightmap pipeline |
| HLOD/LOD system | Open | Custom implementation needed (future) |

---

*Godot 4.x is the active engine. Build accordingly.*
