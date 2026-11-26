# WoW Forever — Owner-Stat Pet Scaling: state of play

Last updated 2026-11-26 (pushed for machine handoff). Branch `pets/gear-scaling`.

## Architecture

The 1.60.1 client ships two hidden auras, `SPELL_ATTR4_OWNER_POWER_SCALING`:

- **415429** "Hunter Pet Scaling" — 19 effects (eff 15 is the client's flat +50 max focus)
- **416189** "Warlock Pet Scaling" — 20 effects (adds intellect / mana regen / healing tail slots)
- **415431** "Avoidance" — flat −50% AoE damage, carried by the spell itself, no coefficient

`spell_forever_pet_scaling` (src/server/scripts/Spells/spell_pet.cpp) computes every amount
server-side from owner stats. Auras are applied in `Pet::LearnPetPassives`; amounts recompute on
every owner stat change via `Pet::RecalculateOwnerScalingAuras` (hooked into the owner's Update*
stat functions) and on owner mana-regen FSR flips (`Player::RegenerateAll`).

**Atomic load (Shape 2)**: pets no longer `AddToMap` until the async DB load has fully dressed
them — auras, spells, passives. A mid-load cancel leaves only a never-visible object the callback
itself disposes. `Classic.PetGearScaling.DebugLoadDelayMs` injects `SELECT SLEEP(?)` into the pet
load batch to widen the race window for testing; re-read per load, `.reload config` toggles it.
In-game `PETBUG` notifications fire on cancelled loads or a dressed pet missing the scaling aura.

## Effect map and coefficient status (warlock 416189)

| eff | Aura type | Stat | Coeff | Status |
|-----|-----------|------|-------|--------|
| 0 | MOD_MAX_HEALTH | +2 health per owner stamina | 2.0 | Forever-verified |
| 1 | MOD_ATTACK_POWER | demon: max(fire,shadow) SP | 0.57 | warlock minion table |
|   |                | hunter: max(melee,ranged) AP | 0.10 | Forever-verified |
| 2 | MOD_DAMAGE_DONE | demon: max(fire,shadow) SP | 0.15 | warlock minion table |
|   |                | hunter: max(melee,ranged) AP | 0.125 | TBC/WotLK lineage |
| 3–7 | MOD_RESISTANCE ×5 | per school, school from effect misc mask | 0.40 | cross-era consensus, verified live |
| 8 | MOD_RESISTANCE (phys) | owner armor | 0.30 | SoD hotfix-verified |
| 9 | MOD_HIT_CHANCE | max(melee,ranged) hit + hit auras | 1.0 | Forever-verified |
| 10 | MOD_SPELL_HIT_CHANCE | owner spell hit | 1.0 | Forever-verified |
| 11 | MOD_MELEE_HASTE_3 | owner melee haste | 1.0 | guess |
| 12 | MOD_CASTING_SPEED | owner cast-speed | 1.0 | guess |
| 13 | MOD_WEAPON_CRIT_PCT | max(melee,ranged) crit | 1.0 | Forever-verified |
| 14 | MOD_SPELL_CRIT_CHANCE | owner spell crit | 1.0 | Forever-verified |
| 15 | MOD_STAT intellect | owner intellect → demon mana | 0.30 | warlock minion table, verified live |
| 16 | MOD_POWER_REGEN | owner mana regen (LIVE rate, FSR dips included) | 1.0 | pass-through guess, verified live |
| 17, 18 | AURA_593 | unknown client slots — pinned to 0 | — | hardwired |
| 19 | MOD_HEALING_DONE | owner healing power | 0.0 | no evidence slot is used in any era |

Hunter 415429 shares eff 0–14; eff 15 is untouched client focus; eff 16–17 pinned zero;
eff 18 MOD_DODGE_PERCENT = owner dodge × 1.0 (guess).

## Research notes and references

**Resistances 40%** — the single most consistent figure across eras:
- Warlock minion table: https://warcraft.wiki.gg/wiki/Warlock_minion — "Resistances 40%"
- Petopia BC: https://www.wow-petopia.com/classic_bc/stats_scaling.php — "~40% of resistances"
- Petopia LK: https://www.wow-petopia.com/classic_lk/stats_scaling.php — same figure, WotLK era
- TBC Classic beta player test: https://us.forums.blizzard.com/en/wow/t/hunter-pet-stat-scaling/948582
  (ballpark-verified the Petopia numbers on beta)

**Demon intellect 30%, spellpower→AP 57%, spellpower→damage 15%** — same minion table
(warcraft.wiki.gg link above). These were the pre-research "WotLK-era defaults"; now confirmed.

**Hunter AP→spell damage 12.5%** — Petopia BC and LK pages above: "~12.5% of the hunter's ranged
attack power added to their spell damage". We feed it max(melee, ranged) AP to match the AP slot;
ranged virtually always wins anyway.

**Armor 30%** — SoD hotfix, Dec 12 2023: https://us.forums.blizzard.com/en/wow/t/season-of-discovery-hotfixes-updated-12-january/481746
— "Pets now gain 30% of the hunter's armor (was 45%) and 20% of the hunter's stamina (was 45%)".
Caveat: TBC/LK Petopia say 35%, and the warlock minion table says 35% for demons — our single
shared `ArmorPct` can't express a per-class difference. Candidate follow-up: split the
coefficient per aura (demon 35% vs hunter 30%) if fidelity matters.

**Stamina** — minion table says demons inherit 75% of owner stamina *as stamina* (with
demon-specific health-per-stamina curves); Petopia says 30% (BC) / 45% (LK) as stamina for
hunter pets; SoD nerfed to 20%. Ours instead converts owner stamina directly to pet health at
2.0/point — the value measured on Forever official, and the client's aura slot is literally
MOD_MAX_HEALTH, so this is believed to be Forever's own design rather than an era borrowing.

**Hit/crit 100%** — Forever official changes (pet inherits owner hit/crit; hit merged
melee+ranged on Forever). Expertise rides the melee hit roll for demons (minion table:
hit-capped owner ⇒ capped pet for hit/expertise/spell-hit).

**"Hunter pets no longer gain any spell damage"** — same Dec 12 SoD hotfix. Deliberately NOT
followed: that was SoD bracket tuning (they replaced it with focus-cost-normalized AP bonus per
pet ability). Forever uses the TBC/WotLK AP→spell-damage lineage instead. If Forever wants the
SoD model, that's per-ability coefficient work, not an aura change — and note the client pet
ability spell data may carry zero bonus coefficients, which would make eff 2 invisible in
practice (see open items).

**Demon mana regen** — SoD-era docs confirm demons inherit owner mana regen but nobody publishes
the share. Defaulted to 1.0 pass-through per "rather guess than underpower". Implementation
mirrors the owner's *live* rate (GetPowerRegen), so the pet bonus dips during the owner's
five-second rule — owner's choice, and recalc-on-FSR-flip makes it actually live.

**Demon healing** — appears in no inheritance table for any era; almost certainly vestigial in
the client aura. Zero is deliberate, not a gap.

## Verified in-game (Bixby, level-60 warlock, Felheart+BiS, aura 416189)

- Health 466 (233 owner stam), AP 121.41 & spell dmg 31.95 (both imply ~213 SP — ratio checks),
  armor 212.4 (708 owner), melee crit 4.65 / spell crit 6.86, spell hit 1.00
- Resistances live: eff3 = 17.60, eff6 = 9.60 ⇒ owner has 44 and 24 in two schools
  (misc-mask school routing confirmed working)
- Int 75.60 (252 owner int), mana regen 25.30 at rest / 0 inside FSR (pre-mirror build —
  now live-mirrored, needs the dip/restore re-test)

## Open items

1. Hunter AP→spell damage end-to-end: tame wind serpent, check eff 2 of 415429 nonzero, then
   whether Lightning Breath damage actually moves with owner AP. If not, client ability data
   has zero bonus coefficients and per-ability design work is needed.
2. FSR mirror re-test on eff 16 (deploy with regen-mirror build).
3. Name the two lit resistance schools off the character sheet (expect 44/24 → eff3/eff6).
4. `DebugLoadDelayMs` race hammer: teleport chains, portals, boats, Call-Pet racing resummon.
   Expect dressed pets always; `PETBUG: load cancelled` notifications are the healthy case.
5. Unverified-but-enabled guesses to revisit: haste/cast-speed/dodge/expertise 1.0.
6. Possible per-class armor split (demon 35% vs hunter 30%) per minion-table research above.
7. Pet ability damage vs owner AP (the SoD focus-cost mechanic) — a feature gap, not a
   coefficient; decide whether Forever wants it at all.

## Operational notes

- Test gear was mailed in-game: Bixby (guid 4554) has the warlock-60 BiS set + full Felheart T1;
  Tagrin (guid 1491) has hunter level-20 BiS. wclbox.com /en/wupin/<id> pages carry item IDs
  directly; `hotfixes.item_sparse` name column is `Display` but only holds ~8.4k overrides —
  vanilla items live in db2 only.
- mysql on 127.0.0.1:3307; creds in worldserver.conf WorldDatabaseInfo.
- repack console-send.ps1 (ExecutionPolicy Bypass, dot-source) → Send-WorldserverCommand drives
  the live server console incl. `send items`; Stop-WorldserverSaved is the clean shutdown.
