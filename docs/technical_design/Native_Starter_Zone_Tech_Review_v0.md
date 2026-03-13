**Status:** Proposed  
**Agent:** Technical Architect  
**Date:** 2026-03-11  
**Responds To:** /Concept/Maps/native-starter-zone-v0.md  
**Next Agent:** Prototype Builder (Foundation Layer)

---

## 1. Streaming & World-Partition Notes (1.2 km × 1.5 km Cradle + Seamless Redwood/Foothill Ties)

- **Partition footprint:** The cradle spans ~1.8 km². Under UE5 World Partition, a 128 m tile size (with 2x2 tiles per streaming cell) keeps any given view to ~16 active cells (~256 MB landscape data with current material targets). This keeps the core cradle plus 200 m of buffer loaded at all times.
- **Redwood eastbound tie:** The Drowning Road’s sideways glimpse into the Redwood band needs a dedicated “look-ahead strip” of tiles flagged as always-loaded proxies (HLOD2) so the drowned trunks and pollen FX don’t pop. Recommend a 150 m x 400 m panoramic wedge east of the cradle set to “always loaded - low detail” until the player fully crosses the wet-basin seam.
- **Foothill Rise westbound tie:** The Stair-Terraces should sit on the same world partition grid as Terrace Foot to avoid cross-grid snapping. Push the first Foothill tiles into the cradle’s streaming map, but gate high-detail assets (Foothill settlements) behind distance-based data layers so we only carry terrain + hero silhouettes during level 1–5 play.
- **North/south soft caps:** Because north (reed forest fog) and south (fungal shelf) are future expansion, keep them as atmospheric tiles only—landscape + fog volumes, no navmesh—so nav out-of-bounds remains cheap while camera horizons stay alive.
- **Streaming directionality:** Player retention inside the cradle means we can bias streaming priorities to east/west. Configure Streaming Source Priors on the three exit vectors so Redwood and Foothill assets start loading when the player is ~120 m away, preventing “empty” vistas.
- **Memory guardrails:** With Lumen + Nanite on Series X/PS5 targets, budget ~3.5 GB for world data. Cradle + two seam bands consumes ~2.1 GB if we cap concurrent skeletal AI to 35 and keep particle-heavy gas vents pooled. This leaves headroom for Redwood/Foothill glimpses without streaming stalls.

## 2. Traversal Mechanic Validation & UE5 Feasibility

| Mechanic | UE5 Implementation Notes | Risks / Mitigations |
|----------|-------------------------|---------------------|
| **Root updrafts** (soft elevators in Ashroot Thicket) | Reuse existing Wind Volume + Niagara ribbon combo; add spline-based force volumes to impart vertical velocity, similar to glide-column prototypes. | Need deterministic entry/exit so players don’t ragdoll. Require fall-back ladder spline in case physics tick diverges on low-end PCs. |
| **Temporary anchors** (Forceshaper rappel points) | Extend climbing component with placeable Anchor actors that spawn spline rope + climbing slot. Anchors can be instanced Nanite meshes with simple collision. | Multiplayer authority: ensure anchor spawning is server-owned to prevent desync. Also need decay timers to avoid anchor spam clogging nav. |
| **Hazard vents / Breathing Holes** | Use Niagara to drive plume visuals; damage handled via overlapping trigger with sinusoidal on/off. Tie cadence to shared data asset so narrative scripts and puzzles read the same timing. | Performance hit if dozens of vents tick individually. Batch vents per sub-area and drive material + gameplay from one manager to reduce blueprint overhead. |
| **Escort gating at Stillwater palisade** | Use smart-object traversal that checks task flags before opening gate spline for first-time exit. Escort NPC pathing can ride nav-hints baked into palisade walkway. | Risk of escort soft-lock if NPC path obstructed by players during peak concurrency. Need fail-safe teleport or gate fallback after timeout. |

Overall feasibility: All mechanics sit inside existing traversal tech stack (mantle, climb, wind, hazard triggers). Only new code path is anchor placement + vent manager, both moderate in scope. Ensure accessibility (visual + audio cues) for gas cadence before greenlighting art polish.

## 3. Dependencies, Next Steps, and Blockers for Prototype Builder

**Immediate Dependencies**
1. **World Partition Layout:** Need a signed-off grid plan (tile size, always-loaded wedges, streaming source priorities) before terrain sculpt begins. Coordinate with Terrain TD to bake Redwood/Foothill preview tiles into the same map.
2. **Traversal Systems Hooks:** Engineering to expose hook points for: (a) root updraft spline volumes, (b) temporary anchor spawn/decay, (c) vent timing manager broadcasting cadence events.
3. **Hazard FX Budget:** Niagara team to deliver low-cost plume preset that supports color swaps (fungal vs sulfur) and LOD transitions without popping.
4. **NPC Escort Framework:** Quest scripting needs a reusable escort template with nav fail-safes so Stillwater gate ritual doesn’t become bespoke logic.

**Next Steps for Prototype Builder (Foundation Layer Milestone)**
- Block out cradle landscape + three exit corridors with simplified materials while applying the agreed streaming grid.
- Stand up a “mechanics lane” inside Ashroot Thicket containing one updraft, one anchor chain, and one vent cluster to validate perf and feel before decorating the entire zone.
- Integrate escort gating into the tutorial critical path early so UX testing can flag frustration before voice scripts lock.
- Capture streaming metrics (cell activation time, memory spikes) when walking from Hearthroot to Stair-Terraces to ensure Redwood/Foothill previews don’t thrash I/O.

**Blockers Requiring Design Churn**
1. **Gas Pocket Cadence vs Quest Beats:** Current design wants puzzle rotation + combat buffs + escort timing all reading the same vent cycle. Need Systems to simplify (choose two use cases) or we risk scripting conflicts.
2. **Temporary Anchor Spam Rules:** Design must define cooldowns/limits (per player vs shared) so engineering can build the correct authority model.
3. **Escort vs Seamless Philosophy:** Forcing first-time escort conflicts with “world is open” promise. Need narrative justification or alternate gating (e.g., spiritual ward) so players don’t feel artificially boxed in.
4. **Population Streaming:** 40–60 visible villagers exceeds our current NPC streaming budget for a single cell. Design to prioritize hero NPCs vs ambience or accept impostor crowds to stay within budget.
