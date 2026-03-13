# Technical Architecture v0

## Status
High-level direction is locked. Implementation details remain open.

## Core Technical Rule
The project must be built in a way that:
- preserves seamless overworld
- preserves future globe compatibility
- stays maintainable for a small AI-assisted team
- does not overengineer the first milestone
- supports long-term MMO-style expansion

## Foundational Principle
Build flat locally, spherical globally.

Meaning:
- playable regions are authored as local gameplay spaces
- the world model still treats them as patches of a planetary world
- local gameplay does not need true visible curvature yet
- global metadata must preserve future planetary placement and logic

## Immediate Technical Priorities
1. clean project structure
2. local region logic
3. global planetary metadata model
4. streaming-friendly content assumptions
5. modular systems
6. easy iteration

## Local vs Global Space

### Local gameplay space
Used for:
- player movement
- combat
- NPCs
- terrain interaction
- quests
- level scripting
- props and landmarks

### Global planetary metadata
Used for:
- region placement on the world
- future globe logic
- climate and celestial modeling
- long-term continent relationships
- later travel/circumnavigation support

This split is critical.

## Overworld Philosophy
The overworld is one seamless world. Regions are design regions, not hard-loaded map boundaries.

This means:
- no outdoor zone load screens
- streaming is required
- region changes are experiential, not scene-based
- instancing is reserved for dungeons, raids, and certain special scenarios

## Terrain Philosophy
Do not hand-sculpt the whole world.

Use a layered approach:
1. 2D world skeleton and geography logic
2. macro terrain generation
3. manual correction
4. gameplay blockout
5. landmark-specific shaping
6. final art polish later

Procedural or semi-procedural terrain supports scale. Handmade spaces provide memorability.

## Maintainability Requirements
The base must be:
- modular
- readable
- easy to extend
- understandable by a small team
- resilient to change

This matters more than cleverness.

## System Architecture Direction
Prefer:
- data-driven design
- modular subsystems
- explicit content definitions
- doc-backed implementation
- limited coupling between unrelated systems

Avoid:
- giant monolithic scripts
- hidden dependencies
- hardcoding assumptions that block world growth
- premature complexity

## Globe Compatibility Rule
The project should assume:
- the world is a planet
- the current implementation is one frontier slice
- future continents and travel are possible
- future circumnavigation is possible

But: the game does not need true visible globe gameplay immediately.

## Streaming Direction
The player should experience one continuous overworld. Streaming and chunking should happen behind the scenes.

Open questions remain around:
- chunk size
- content streaming granularity
- entity streaming
- far-view landmark handling
- multiplayer world partitioning

## Engine Direction
**UE5 is LOCKED as the engine.**

Rationale:
- World Partition supports seamless large worlds out of the box
- Nanite and Lumen reduce art pipeline burden for small team
- Built-in multiplayer replication and server infrastructure
- Landscape and procedural tools align with terrain philosophy

Requirements:
- Use World Partition for seamless streaming
- Preserve modularity via Plugins and data-driven design
- Maintain local-vs-global world modeling (flat gameplay, spherical metadata)
- Document World Partition cell configuration and streaming distances

## First Build Target
The first build target is not a globe. The first build target is:
- one seamless local frontier slice
- Native 1–5 zone
- foundational movement/combat/quest loop
- scalable world assumptions underneath

## Open Questions
- exact multiplayer networking stack
- exact terrain streaming implementation
- exact coordinate representation
- exactly how global metadata will be stored
- exactly how far future globe rendering should be planned now
