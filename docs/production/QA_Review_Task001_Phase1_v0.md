AGENT OUTPUT PROTOCOL
Title: Project Avalon – Task 001 QA Scope Pass (Phase 1)
Author: QA / Scope Police Subagent
Date: 2026-03-11
Inputs: Concept/Maps/native-starter-zone-v0.md; Docs/TechnicalDesign/Native_Starter_Zone_Tech_Review_v0.md
Recipients: Worldbuilder, Systems Designer, Technical Architect, Prototype Builder

1. Red Flags & Contradictions (Scope / Canon / Technical Honesty)
- Seamless vs Escort Gate: Concept mandates “no hard boundaries,” but tutorial escort requirement + palisade lock (Tech Doc §2, §3) directly conflicts. Needs narrative or systemic alternative or the seamless promise breaks on minute one.
- Population Budget Mismatch: Concept expects 40–60 visible villagers plus class hooks; Tech doc flags current streaming budget cannot support that density. Either cut ambient bodies or fund impostor tech.
- Gas Pocket Overload: Single Breathing Holes mechanic is being asked to handle hazard timing, puzzles, buffs, escort beat, and class utilities. Tech doc already calls it untenable; design still pitches multi-use. Scope creep + scripting risk.
- Temporary Anchor Authority: Design leans on Forceshaper anchors as traversal baseline, but Tech doc labels system “new code path, needs spam rules.” Until limits are defined, this is vapor; do not treat as committed capability for 1–5 slice.
- Severed Presence Ambiguity: Concept calls for subtle markers only (no direct contact). Tech doc introduces “Severed scouting totems” combat in Terrace Foot sample beats. Need alignment: either we show Severed combat or we don’t.

2. Must / Nice / Later — Gameplay + Tech Adds
Must Have (critical to 1–5 promise)
- Stillwater Village onboarding loop (Hearthroot Rite, bond tutorial, crafting basics).
- Five sub-areas with seamless handoff; three exit vectors visually previewing 6–10 (but they can be art/terrain only).
- Core traversal kit already proven: mantling, basic climb, standard hazards (no new systems).
- Minimal Severed foreshadowing (environmental storytelling or one scripted warning, not full fights).

Nice To Have (adds flavor but cuttable if time/budget tight)
- Root updraft "soft elevators" and resonance climb puzzles (reuse existing wind volumes but still optional).
- Class-specific side hooks beyond the Bonder-required beats (Ranger trap minigame, Forceshaper reed pylons, etc.).
- Portable windbells, pheromone masking, glide-lines back to Stillwater (quality-of-life loops, not core progression).
- Look-ahead Redwood/Foothill hero silhouettes (keep cinematics but downgrade fidelity if perf tight).

Later (should move to post-Phase-1 backlog)
- Temporary anchor placement system (new code, multiplayer authority + spam rules unresolved).
- Breathing Holes multi-role interactions (limit to single hazard tutorial now; save buff/suppression puzzles for 6–10).
- Escort gating as mechanic (contradicts seamless ethos; revisit after open world travel UX pass).
- Large ambient population streaming (40–60 visible NPCs) unless impostor tech lands; start with 15–20 key actors.

3. Simplification Recommendations
- Collapse the escort gate into a ritual flag the player completes solo; unlocks palisade once done, no NPC pathing required.
- Treat Gas Pocket Flats as a single cadence hazard lesson: timed plumes + one puzzle. Move class-specific vent perks to optional later content.
- For Severed foreshadowing, pick one modality (either visual markers or a wounded ranger encounter). Avoid mixing stealth totems + combat until tech/perf budgets proven.
- Represent Redwood/Foothill previews via matte-backed vistas (HLOD proxies) instead of streaming partial settlements; keeps train consistent with memory targets.
- Cap village population to hero NPCs + looped background VFX crowds to avoid streaming spikes.

4. Risks If Ignored & Required Responders
- Escort + seamless conflict will sour the “open cradle” promise during first playtest. **Owner:** Narrative + Systems to reframe exit gating.
- Gas pocket overdesign will stall scripting and perf budgets, delaying Prototype Builder milestone. **Owner:** Systems + Technical Architect to enforce single use case.
- Anchor system uncertainty can block Forceshaper class deliverables; if not ready, designers must provide alternate traversal or mark Later. **Owner:** Class Design + Engineering.
- Inconsistent Severed presence risks canon drift and messaging confusion. **Owner:** Worldbuilding + Quest Design alignment pass.
- Population streaming overruns can crash performance on console targets. **Owner:** World Art + Tech Art to re-scope NPC counts or validate impostor solution.

End of memo.
