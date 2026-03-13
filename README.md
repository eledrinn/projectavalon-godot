# Project Avalon — Godot 4.x Edition

**MMORPG with seamless world, stylized alien aesthetic, classic MMO soul**

**⚠️ ACTIVE REPOSITORY — March 12, 2026**

This is the **active** Godot 4.x implementation of Project Avalon. The UE5 repository is now legacy/frozen.

Text-based scene files (.tscn) and GDScript (.gd) enable AI agent automation.

**Engine Pivot:** See `ENGINE_PIVOT.md` for the complete migration rationale and studio-wide mandate.

---

## Why Godot?

| Feature | Benefit for Agents |
|---------|-------------------|
| **.tscn scenes** | Text-based → agents can read/write/modify directly |
| **.gd scripts** | Python-like syntax → agents write full gameplay systems |
| **.tres resources** | Text-based materials, animations, configs |
| **Small footprint** | Faster iteration, easier version control |

---

## Quick Start

### Prerequisites
- Godot 4.3+ (Standard or .NET version)
- Git

### Run the Project
1. Clone this repo
2. Open Godot Engine → Import Project → select `project.godot`
3. Press F5 or click Play

---

## Project Structure

```
projectavalon-godot/
├── project.godot              # Main project config
├── docs/                      # Documentation (migrated from UE5 docs)
│   ├── world_bible/
│   ├── game_design/
│   ├── technical_design/
│   └── production/
├── agents/                    # Agent workspace
│   ├── director/
│   ├── systems_designer/
│   ├── technical_architect/
│   ├── worldbuilder/
│   ├── prototype_builder/
│   └── qa_scope/
├── scenes/                    # Game scenes (.tscn - text-based!)
│   ├── world/                 # World scenes
│   │   ├── world_persistent.tscn
│   │   └── regions/
│   ├── characters/            # Player, NPCs
│   ├── ui/                    # HUD, menus
│   └── systems/               # Hazards, quests, etc.
├── scripts/                   # GDScript files
│   ├── core/                  # GameManager, networking
│   ├── player/
│   ├── npc/
│   ├── quests/
│   ├── hazards/
│   └── streaming/             # World streaming system
├── resources/                 # .tres files
│   ├── materials/
│   ├── meshes/
│   ├── textures/
│   └── data/                  # Data tables (JSON)
├── assets/                    # Raw assets
│   ├── models/
│   ├── textures/
│   ├── audio/
│   └── animations/
└── tests/                     # Unit/integration tests
```

---

## Agent Workflow

1. **Spawn subagent** via Director
2. **Read docs** → `docs/`
3. **Write code** → `scripts/` (.gd files)
4. **Build scenes** → `scenes/` (.tscn files)
5. **Create resources** → `resources/` (.tres files)
6. **Commit & push**

---

## Key Differences from UE5 Version

| UE5 | Godot Equivalent | Notes |
|-----|------------------|-------|
| World Partition | Custom streaming system | `scripts/streaming/` - needs custom implementation |
| Blueprint | GDScript | Full text-based scripting |
| .umap | .tscn | Text-editable scenes |
| Data Tables | JSON + custom loader | `resources/data/` |
| Nanite/Lumen | Standard 3D rendering | No virtualized geometry |

---

## Current Phase

**Foundation Setup** — Establishing project structure, streaming architecture, and first playable zone (Native Starter 1-5).

---

## Documentation

See `docs/` folder for complete design documentation migrated from UE5 project.

---

*Project Avalon — Forged in code, shaped by agents.*
