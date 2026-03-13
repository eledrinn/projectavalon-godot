# Multiplayer Authority Model v1

**Status:** LOCKED  
**Agent:** Technical Architect / Director collaboration  
**Date:** 2026-03-11  
**Responds To:** Open_Questions.md networking stack question  
**Next Agent:** Systems Designer (for combat tuning), Prototype Builder (for implementation tasks)

---

## Executive Summary

Authoritative server with client-side prediction for movement only. Classic WoW-style spell batching (200-400ms window) to create rhythmic, deliberate combat feel. Slower combat style allows simpler networking without twitch-reflex demands.

---

## Authority Model (LOCKED)

### Server Authority
The server is authoritative for:
- All combat actions (attacks, abilities, damage calculation)
- Death/respawn state transitions
- Inventory and gear state
- Quest progression
- NPC/monster AI and positioning

### Client Prediction
Clients predict:
- Player movement only
- Ability cast animations (visual feedback only, not effect resolution)

### Client Authority
Clients handle:
- Camera control
- UI rendering
- Local visual effects (particles, sounds)
- Input buffering

---

## Spell Batching (LOCKED)

### Principle
Combat actions are processed in discrete batches rather than instantaneously. This creates the rhythmic, deliberate feel of classic MMOs.

### Implementation
- **Batch window:** 200-400ms (tunable, start at 200ms)
- **Processing:** Server collects all inputs within window, resolves simultaneously
- **Effect:** Simultaneous attacks can trade kills; no "I shot first" twitch advantage
- **Benefit:** Allows for strategic decision-making over reflexes

### Examples
- Player A and Monster B both attack within same batch window → both attacks resolve, both may die
- Heal and damage in same batch → heal applies, damage applies simultaneously

---

## Movement Replication

### Client-Side Prediction
- Client moves immediately on input
- Server validates position periodically
- Server correction applied if client mispredicted (rubber-banding)

### Server Reconciliation
- Position updates sent 10-20Hz
- Interpolation for other players' movement
- Extrapolation for high-latency scenarios

---

## Combat Networking

### Ability Casting
1. Client sends "begin cast" request
2. Server validates (range, LoS, resources, cooldowns)
3. Server confirms cast start (or denies with error)
4. Client plays cast animation
5. At cast completion, server resolves effect in next batch
6. Server broadcasts result to all clients in range

### Damage Resolution
- Server calculates damage based on stats, gear, buffs
- No client-side damage calculation
- Damage numbers are cosmetic only, server result is truth

### Hit Detection
- For soft-target abilities: Server uses validated target ID
- For ballistic projectiles: Server simulates trajectory, validates hit
- For AoE: Server calculates all valid targets in effect radius

---

## Death and Respawn Networking

### Death Sequence
1. Server detects fatal damage in batch
2. Server sets player state to "dying"
3. Broadcast death to nearby clients
4. Client plays death animation
5. Server transitions player to "spirit form" at bound shrine

### Corpse Run
- Corpse position stored server-side
- Gear state stored with corpse (not lost on disconnect)
- Spirit form movement has no combat collision
- Recovery interaction validates proximity to corpse

### Hardcore Mode
- "Oathbound" buff tracked server-side
- First death triggers buff removal
- Buff state affects drop tables server-side

---

## Latency Tolerance

### Target Feel
- **Total combat latency:** 200-400ms acceptable (spell batching window)
- **Movement latency:** <100ms perceived (client prediction)
- **Global play:** Target support for 100-300ms base latency

### Compensation
- Spell batching naturally absorbs latency variance
- No "skill shot" mechanics requiring <100ms precision
- Telegraphed attacks give players time to react before cast completion

---

## Security Considerations

### Server-Side Validation
- All position updates validated (speed hacking detection)
- Cooldowns enforced server-side (no client trust)
- Resource costs validated (mana, health, consumables)
- Range checks for all abilities (no client distance manipulation)

### Anti-Cheat Basics
- Position speed limits enforced
- Invalid state transitions rejected (casting while dead, etc.)
- Rate limiting on ability requests

---

## UE5 Implementation Notes

### Replication Strategy
- Use UE5's built-in replication for:
  - Player movement (CharacterMovementComponent)
  - Actor states (replicated properties)
  - RPCs for ability casts (Server → Client reliable)
- Custom replication for:
  - Spell batching window management
  - Combat state machine
  - Corpse run spirit form

### World Partition Considerations
- Replication distance culling for seamless world
- Server authority per World Partition cell
- Smooth handoff of authority at cell boundaries

---

## Open Questions

| Question | Priority | Notes |
|----------|----------|-------|
| Exact spell batching window | Medium | Start at 200ms, tune based on feel |
| Server tick rate | Medium | Target 30Hz for combat, 10Hz for ambient |
| Max players per server | Low | Deferred until scaling phase |
| Instance vs seamless authority | Low | Instanced content uses separate server processes |

---

## Dependencies

- **Coordinate system spec:** Needed for World Partition cell authority boundaries
- **Streaming implementation:** Needed for replication culling distances
- **Ability system design:** Systems Designer to define cast times and batch interactions

---

*Model locked per Director decision: "WoW-style authoritative server with spell batching"*
