# Streaming and Seamlessness v0

## Status
Core principle is locked. Implementation is open.

## Hard Rule
The overworld is seamless.

There are no loading screens between:
- outdoor regions
- travel routes
- starter areas
- the broader overworld

Only instanced content such as:
- dungeons
- raids
- special contained scenarios

may load separately.

## What This Means
Zones are:
- design regions
- content bands
- identity spaces

They are not:
- separate hard-loaded maps
- isolated scenes with visible transitions

## Seamlessness Philosophy
The player should feel like the world is continuous.

This means:
- travel reveals new spaces naturally
- mountains, forests, cities, and coastlines connect physically
- transitions are hidden through geography, distance, and streaming
- no artificial “zone portals” in the overworld

## Planetary Compatibility
The seamless overworld must still fit a future planetary model.

This means:
- regions should be treated as local patches with global placement
- no flat-world assumptions should permanently lock out future globe support
- the world can be conceptually spherical even if early gameplay spaces are locally flat

## Streaming Principles
1. stream in background, not in obvious chunks
2. use geography to hide transitions
3. preserve landmarks across streaming boundaries
4. do not overpopulate distant spaces with full simulation
5. keep the first milestone simple, but architecturally honest

## Ocean and Future Circumnavigation
Ocean is an advantage, not a burden.

Large water spaces help:
- hide streaming
- simplify distant world logic
- separate major content areas naturally
- support future circumnavigation and large-world travel

This should remain part of long-term planning.

## Region Design Implication
Because the world is seamless:
- Native and Arrival starts are physically separated by terrain and routes, not loads
- the city is physically reachable by ascent
- the Ash Frontier lies physically beyond the first city
- future regions should remain spatially implied from day one

## Technical Risks
Key risks to watch:
- overcommitting to giant monolithic terrain too early
- treating local flat terrain as if it is the entire world
- making horizon/sky assumptions that break later globe logic
- hardcoding scene assumptions into region logic
- trying to fully solve global seamless circumnavigation before proving one region

## Maintainability Rule
The seamless-world solution must remain understandable and manageable by a small AI-assisted team.

Prefer:
- clean abstractions
- modular region/chunk systems
- documented assumptions
- simple local-first implementation

Avoid:
- overcomplicated bespoke magic early
- solving every future problem before the first playable slice

## First Practical Milestone
The first practical seamless-world milestone is:
- a single local frontier slice
- continuous movement through it
- no visible outdoor loading
- one working streaming-friendly design philosophy
- one good region, not a fake giant world

## Open Questions
- exact streaming implementation
- chunk sizing
- content loading priorities
- NPC streaming vs persistence
- visual horizon strategy
- long-distance landmark rendering strategy
- future continent-scale travel mechanics

