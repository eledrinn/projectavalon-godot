# Open Questions v0

These are unresolved questions that should be tracked explicitly instead of hand-waved.

**Last Updated:** 2026-03-11

---

## Recently Resolved (Locked)

| Question | Resolution | Doc |
|----------|------------|-----|
| Targeting model | Soft-target hybrid with tab-target auto-attacks | Combat_Philosophy_v0.md |
| Combat pacing | Classic MMO swing-timer feel, not action-combat | Combat_Philosophy_v0.md |
| Death/respawn penalty | Hardcore default → Normal mode with corpse run | Combat_Philosophy_v0.md |
| Multiplayer authority | Authoritative server with spell batching (200-400ms) | Multiplayer_Authority_Model_v1.md |
| Progression system | Hybrid: Cards (major choices) + Talent Trees (classic branching) | Progression_Philosophy_v0.md |
| Gear vs class priority | Equal weight | Progression_Philosophy_v0.md |
| Auction house | YES — full implementation | Economy_Philosophy_v1.md |
| Party size | 4 players | Economy_Philosophy_v1.md |
| Mount timing | Late unlock (post-10 or very late) | Travel_and_Mounts_v1.md |
| Early travel alternative | Glider questline (high terrain traversal) | Travel_and_Mounts_v1.md |
| Level 1–10 pacing | ~4–6 hours experienced, 6–8+ new players | Economy_Philosophy_v1.md |
| Fast travel | Restricted — class-specific only (1–2 classes) | Fast_Travel_and_Transport_v1.md |
| Public transport | Boats, airships — rare, scheduled, seamless | Fast_Travel_and_Transport_v1.md |
| Crafting 1–10 | Mining, Herblore (+psychoactives), Clothier | Crafting_and_Gathering_v1.md |
| PvP | Exists long-term; one battleground in 1–10 | PvP_Philosophy_v1.md |

---

## Still Open

### Combat
- Exact movement feel (responsiveness vs deliberate)
- Dodge / iframe / stamina philosophy (classic MMO suggests minimal)
- Hit-scan vs projectile balance for specific abilities
- Camera distance/style
- PvP assumptions, if any, in the long term
- Party role strictness (holy trinity vs soft blending)
- Animation priority and cancel philosophy

### Progression
- Level pacing from 1–10 | **LOCKED: ~4–6 hours experienced, 6–8+ new players**
- XP curve specifics (points per level)
- Class unlock cadence (what level you get what)
- Legendary item design principles

### Gear and Itemization
- Crafting integration with gear
- How much randomness is desirable (drops, stats, procs)
- Bind-on-equip vs bind-on-pickup philosophy

### Economy / Trade
- Role of player trade (AH confirmed, details TBD)
- Auction house fees/tax structure
- Role of vendors vs player economy
- Regional resource identity
- Relation between exploration and gathering
- Whether crafted items should matter early
- What parts of the economy should be deferred beyond the vertical slice

### Social Systems
- Grouping expectations
- Party size | **LOCKED: 4 players**
- Reputation systems
- Faction alignment mechanics
- Trading scope
- Guild/clan support timing

### World Systems
- Weather impact
- Travel systems | **LOCKED: Fast travel restricted, public transport rare, gliders early, mounts late**
- Gathering/professions | **LOCKED: Mining, Herblore, Clothier for 1–10**
- How much region-specific danger should matter mechanically

### Technical
- World streaming granularity (chunk/cell size)
- Planetary metadata schema
- Terrain generation pipeline specifics
- Performance strategy for seamless overworld
- How far to optimize for future circumnavigation now

### Production
- What the first real build milestone should be after foundation hardening
- How much concept art should be generated before blockout

---

## Deferred Beyond Vertical Slice

- Server meshing / multi-server worlds
- True planetary curvature rendering
- Cross-shard travel
- Advanced economy simulation
- Guild housing
- Full weather affecting terrain
- Advanced crowd simulation
- 1000+ player scaling

