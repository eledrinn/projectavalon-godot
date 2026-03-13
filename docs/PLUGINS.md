# Project Avalon — Godot Plugin Stack
**Last Updated:** March 12, 2026

---

## Active Plugins

All plugins listed here are installed and available for agents to use.

| Plugin | Version | Purpose | Agent Usage |
|--------|---------|---------|-------------|
| **Terrain3D** | latest | Heightmap-based terrain system | Worldbuilder, Technical Architect |
| **ProtonScatter** | latest | Vegetation/instance scattering | Worldbuilder, Environment Pipeline |
| **Dialogic** | latest | Dialogue system for NPCs | Systems Designer, Quest Designer |
| **LimboAI** | latest | AI/Behavior trees, HTN planning | Systems Designer, Technical Architect |
| **DebugDraw** | latest | Debug visualization (collision, paths) | All agents for debugging |

---

## Plugin Reference for Agents

### Terrain3D
**Use for:** Region terrain, heightmaps, biomes

**Key Classes:**
- `Terrain3D` — Main terrain node
- `Terrain3DStorage` — Heightmap data storage
- `Terrain3DMaterial` — Terrain materials

**Scene Integration:**
```ini
[node name="Terrain3D" type="Terrain3D" parent="."]
storage = ExtResource("terrain_storage")
material = ExtResource("terrain_material")
```

**Data Format:**
- Heightmaps: PNG or EXR images
- Multiple texture layers for biomes
- Collision automatically generated

**Agent Notes:**
- Worldbuilder specifies heightmaps and biome layers
- Technical Architect configures storage and materials
- Height range: document min/max elevation per region

---

### ProtonScatter
**Use for:** Vegetation scattering, prop placement, ambient details

**Key Classes:**
- `ProtonScatter` — Main scatter node
- `ProtonScatterItem` — Item to scatter
- `ProtonScatterModifier` — Placement rules

**Scene Integration:**
```ini
[node name="Vegetation" type="ProtonScatter" parent="."]
items = [ExtResource("scatter_tree")]
modifiers = [ExtResource("mod_random")]
```

**Agent Notes:**
- Worldbuilder defines scatter rules (density, biome-based)
- Use for: redwood trees, fungal growths, rocks, ground cover
- Performance: scatter generates instances, not individual nodes

---

### Dialogic
**Use for:** NPC dialogue, quest conversations, lore delivery

**Key Classes:**
- `Dialogic` — Singleton
- `DialogicTimeline` — Conversation script
- `DialogicCharacter` — Character definition

**GDScript Usage:**
```gdscript
# Start dialogue
Dialogic.start("res://resources/dialogue/shellkeeper_greeting.dtl")

# Check dialogue events
Dialogic.signal_event.connect(_on_dialogue_event)
```

**File Formats:**
- `.dtl` — Timeline files (text-based, agent-editable)
- `.dch` — Character files

**Agent Notes:**
- Systems Designer writes dialogue structures
- Quest Designer creates conversation flows
- Files are text-based — agents can generate/modify directly
- Use for: Shellkeeper quest dialogue, Elder guidance, lore stones

---

### LimboAI
**Use for:** NPC AI, behavior trees, HTN planning

**Key Classes:**
- `BehaviorTree` — Behavior tree node
- `BTPlayer` — Tree executor
- `HTNPlanner` — HTN planning

**GDScript Usage:**
```gdscript
extends NPCController
@onready var bt_player: BTPlayer = $BTPlayer

func _ready():
    bt_player.behavior_tree = preload("res://resources/ai/wildlife_bt.tres")
```

**Agent Notes:**
- Systems Designer designs AI behaviors
- Use for: wildlife behavior, NPC routines, combat AI
- Behavior trees are resource files (.tres) — text editable
- Start simple: patrol → idle → flee behaviors

---

### DebugDraw
**Use for:** Debug visualization during development

**GDScript Usage:**
```gdscript
# Draw sphere at position
DebugDraw.draw_sphere(global_position, 1.0, Color.RED)

# Draw line
DebugDraw.draw_line(start, end, Color.GREEN)

# Draw text
DebugDraw.set_text("Player pos", global_position)
```

**Agent Notes:**
- All agents can use for debugging
- Use for: visualizing hazards, quest zones, streaming chunks
- Remove or disable in production builds
- Helpful for: Breathing Hole hitboxes, landmark positions

---

## Plugin Integration Patterns

### Region Scene Structure with Plugins
```ini
[node name="NativeStarter" type="Node3D"]

[node name="Terrain3D" type="Terrain3D" parent="."]
# Heightmap terrain

[node name="Vegetation" type="ProtonScatter" parent="."]
# Scattered trees, plants

[node name="NPCs" type="Node3D" parent="."]

[node name="Shellkeeper" parent="NPCs" instance=ExtResource("npc_shellkeeper")]
# Has Dialogic and LimboAI components

[node name="Systems" type="Node3D" parent="."]
# Hazards, quests

[node name="Debug" type="Node3D" parent="."]
# DebugDraw visualization (editor-only)
```

---

## Future Plugin Considerations

| Plugin | Purpose | Timeline |
|--------|---------|----------|
| GodotSteam | Steam integration | Post-vertical slice |
| ENetMultiplayer | Enhanced networking | Multiplayer phase |
| Qodot | TrenchBroom level editing | If needed for dungeons |

---

## Agent Directives

**When building scenes:**
1. Check this file for available plugins
2. Use plugin nodes where appropriate
3. Document plugin dependencies in your output
4. Test that scenes load without errors
5. Commit plugin resource files (.tres) to git

**When writing GDScript:**
- Use `@onready` for plugin node references
- Check for plugin singletons (Dialogic, DebugDraw)
- Handle missing plugins gracefully (if-else checks)

---

*Plugin stack locked. Build with these tools.*
