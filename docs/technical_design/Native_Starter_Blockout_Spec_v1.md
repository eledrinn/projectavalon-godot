# Native Starter Blockout Spec v1
## Project Avalon | Region 1-5 Wetland Slice | First Playable Cradle

**Document Owner:** Worldbuilder/Cartographer  
**Status:** Draft v1  
**Scope:** Minimum viable footprint for 5-7 minute first-playable experience

---

## 1. DESIGN INTENT

This slice establishes the **cultural and mechanical foundation** of the Native 1-5 experience: verticality through climbable terrain, environmental hazard literacy (gas/breathing holes), and the narrative promise of the "Departure Rite"—the threshold moment when young hunters leave the cradle for the outer world.

The mood is **intimate, slightly claustrophobic, but aspirational**. The wetland is a womb. The distant vista is the call.

---

## 2. IN SCOPE (Explicitly IN)

### Core Geography
- **One traversable wetland basin** (~200m x 150m playable footprint)
- **Village edge zone** (non-enterable backdrop + interactive departure site)
- **Single climbable elevation chain** (3-tier vertical sequence)
- **One active breathing hole hazard pocket** (gas venting mechanic introduction)
- **Two major landmarks** (Hearthroot, Shellmound)
- **One transitional landmark** (Woven Arch)
- **One departure rite site** (Woven Arch clearing)
- **One distant vista point** (Waymarker ledge)

### Gameplay Elements
- Spawn point → tutorial path → questgiver loop
- One NPC (Shellkeeper Elder) with dialogue + quest handoff
- One enemy pocket (3-5 Strider-class fauna, low aggression)
- One resource node (Reed bundles, tutorial crafting intro)
- Basic traversal: wading (slow), climbing (fast), gas avoidance (survival)

### Narrative Beats
- Village ambience (soundscape, smoke, distant activity)
- Departure Rite ritual site (empty but significant)
- "Promise of the world" vista toward Region 4 (Foothill/Redwood)

---

## 3. OUT OF SCOPE (Explicitly OUT)

- Village interior spaces (buildings are backdrop only)
- Other Native regions (6-10, 11-15, etc.)
- Full faction questlines
- Crafting beyond "gather reed → craft torch" tutorial
- Swimming/deep water traversal
- Weather state changes (static time of day for slice)
- Companion characters
- Mount/summon mechanics
- Combat beyond basic avoidance + single light attack

---

## 4. REQUIRED LANDMARKS

### 4.1 Hearthroot (Spawn Anchor)
**Location:** Western edge, partially submerged
**Visual:** Massive cypress root system forming natural shelter
**Function:**
- Player spawn point
- Implicit "safe space" introduction
- Visual tutorial: roots = climbable
**Blockout Requirements:**
- Root geometry: 3-4m diameter main trunk, 0.5m thick exposed roots
- Overhang creating dry pocket (3m x 2m sheltered area)
- Distinctive red-orange bark material (visual anchor)

### 4.2 Shellmound (Quest Hub)
**Location:** Central-north, elevated above waterline
**Visual:** Ancient midden heap now overgrown, ring of ancestor markers
**Function:**
- Shellkeeper Elder NPC placement
- Dialogue trigger for Departure Rite quest
- Lore environmental storytelling (discarded shells, old tools)
**Blockout Requirements:**
- Mound: 8m diameter, 2m elevation above wetland floor
- 5-7 standing stone/marker posts (1.5m height)
- Flattened top for NPC placement (2m x 2m clear space)
- Path connection to Woven Arch (visible from mound)

### 4.3 Woven Arch (Departure Threshold)
**Location:** Northeast, edge of playable basin
**Visual:** Living willow/archway structure marking village boundary
**Function:**
- Departure Rite ritual site
- Invisible wall narrative justification
- Transition point to future expansion
**Blockout Requirements:**
- Archway: 4m wide, 5m tall at peak
- Organic woven texture (interlaced branches)
- Small clearing before arch (6m diameter)
- Ritual marker stones (3 stones, waist height)

### 4.4 Breathing Holes (Hazard Pocket)
**Location:** Southeast quadrant, low-lying depression
**Visual:** Bubbling water, occasional gas venting, dead vegetation ring
**Function:**
- Environmental hazard introduction
- Timing-based traversal puzzle
- Optional: hidden pickup behind/active vent
**Blockout Requirements:**
- Depression: 12m x 8m, 1m below surrounding grade
- 3-5 active vent points (1m diameter bubbling surface)
- Gas vent timing: 4 seconds safe / 3 seconds active (visual/audio cue)
- Safe path through: 2m wide route with clear timing window

### 4.5 Waymarker Vista (Promise Point)
**Location:** Eastern edge, highest elevation in slice
**Visual:** Weathered stone marker + panoramic view
**Function:**
- Distant landmark reveal
- "Future world" tease
- Optional: fast-travel unlock point
**Blockout Requirements:**
- Elevated ledge: 8m above wetland floor (requires full climb sequence)
- Stone marker: 2m height, carved directional glyphs
- Clear sightline to distant Foothill/Redwood massif
- Framed view (natural rock window or tree gap)

---

## 5. HAZARDS & TRAVERSAL BEATS

### 5.1 Gas Vent Cadence (Breathing Holes)
| Phase | Duration | Visual | Audio |
|-------|----------|--------|-------|
| Dormant | 4s | Gentle bubbling | Low gurgle |
| Warning | 1s | Increased bubbling, surface shimmer | Rising tone |
| Active | 3s | Gas eruption, visible cloud | Hiss + whoosh |
| Dissipate | 2s | Cloud fades | Fading wind |

**Player Consequence:** Minor DoT while in gas (10% HP/s), knockback on direct vent hit

### 5.2 Climb Sequence
Three-tier vertical progression from wetland floor to Waymarker Vista:

**Tier 1 → Tier 2:**
- Entry: Hearthroot root system OR Breathing Holes safe path exit
- Climb: 3m vertical root/rock face
- Rest: Small ledge (2m x 1m)

**Tier 2 → Tier 3:**
- Entry: Shellmound rear approach
- Climb: 4m scramble up compacted earth/roots
- Rest: Wide terrace (6m x 3m), enemy pocket located here

**Tier 3 → Vista:**
- Entry: Woven Arch alternative path (requires backtrack)
- Climb: 2m final scramble
- Arrival: Waymarker Vista platform

### 5.3 Departure Rite Site
- Flat ritual circle: 5m diameter
- 3 marker stones at cardinal points
- NPC walks here during quest completion sequence
- Invisible boundary at Woven Arch (narrative: "You must complete the rite before passing")

---

## 6. VILLAGE EDGE REQUIREMENTS

### 6.1 Spawn Placement (Hearthroot)
- Exact: Inside root overhang, facing east
- Initial camera: Slight tilt up to reveal climbable roots
- Immediate affordance: Dry ground vs. wet wetland (movement speed contrast)
- First 10 seconds: No threats, exploration encouraged

### 6.2 Departure Rite Site Placement
- Location: Woven Arch clearing (northeast corner)
- Relationship to village: Visible village smoke/flicker through arch
- Distance from spawn: ~120m via main path
- Distance via climbing route: ~80m (reward for vertical exploration)

### 6.3 Village Backdrop (Non-Enterable)
- Visual: 5-6 structures on stilts, 30-50m beyond Woven Arch
- Audio: Ambient village sounds (distant voices, crafting, children)
- Smoke: 2-3 persistent sources, atmospheric only
- Purpose: Establish scale without building interior spaces

---

## 7. DISTANT LANDMARK PROMISE

### 7.1 Foothill/Redwood Tease
From Waymarker Vista, players see:

**Immediate Foreground:**
- Canopy of current wetland zone (establishes vertical scale)
- Mist layer at 10m elevation (separates zones visually)

**Midground Promise:**
- First ridgeline of foothills (3km distant, slightly desaturated)
- Single massive redwood crown visible above ridgeline
- Subtle light difference (warmer tones = promise of different biome)

**Background Tease:**
- Snow-capped peak hint (far beyond, barely visible)
- Sky transition: Wetland overcast → distant clear patch

### 7.2 Narrative Function
This vista answers: **"Why leave the cradle?"**

The redwood is the called shot—the destination players will reach in mid-game. Seeing it now establishes:
- Scale of the world
- Long-term player goal
- Emotional resonance of "the world beyond"

---

## 8. BLOCKOUT METRICS

### Spatial Summary
| Element | Dimensions | Elevation |
|---------|------------|-----------|
| Total playable basin | 200m x 150m | 0m (baseline) |
| Hearthroot | 8m x 6m | 0-2m |
| Shellmound | 8m diameter | +2m |
| Breathing Holes | 12m x 8m | -1m |
| Woven Arch | 4m wide | 0-5m |
| Tier 2 Ledge | Various | +4m |
| Waymarker Vista | 6m x 4m | +8m |

### Path Distances
- Spawn → Shellmound (main path): 60m
- Shellmound → Woven Arch: 40m
- Spawn → Waymarker (climbing): 80m total
- Full loop (spawn → vista → shellmound → spawn): 180m

### Time Budgets (Target)
- First traversal (exploring): 7 minutes
- Return trip (knowing path): 3 minutes
- Shellmound dialogue + quest: 2 minutes

---

## 9. DEPENDENCIES & NEXT STEPS

### Required Before Implementation
- [ ] UE5 landscape sculpt pass (macro form)
- [ ] Water plane placement (elevation -0.5m)
- [ ] Player controller movement values (wading speed modifier)
- [ ] Gas hazard VFX prototype

### Can Parallelize
- [ ] Shellkeeper Elder dialogue script
- [ ] Strider fauna AI behavior
- [ ] Audio ambience (wetland loop + village distance)
- [ ] Hearthroot/Shellmound concept art finalization

### Blockout Success Criteria
1. Player can complete loop spawn → vista → shellmound → spawn without guidance
2. Gas hazard timing feels fair (3+ attempts to learn pattern)
3. Vista moment creates emotional response (awe/curiosity)
4. Total playtime 5-7 minutes for first-time explorer

---

**End of Document**
