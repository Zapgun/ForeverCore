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

1. ~~Hunter AP→spell damage end-to-end~~ **RESOLVED 2026-11-26 — definitive negative.**
   Full coefficient sweep of every spell in `classic_pet_tame_spell` (57 distinct) plus demon
   abilities, decoded from SpellEffect.db2 and field-validated against player spells
   (Fireball/Frostbolt/Corruption coefficients land exactly where expected):
   - Lightning Breath all ranks (25008-25012), Scorpid Poison: `BonusCoef=0`, `CoefFromAP=0` —
     deliberately zeroed. Wind serpent test confirmed: eff 2 moves with gear (23.38 / 13.12)
     but hits cannot move.
   - Bite/Claw/beast abilities (17253+, 16827+, 3009/3010): `BonusCoef=1.0` on their damage
     effects BUT they are physical school, and eff 2's school mask is 126 (all magic schools,
     no physical bit); `CoefFromAP=0` everywhere. Dead from both directions.
   - Net: hunter pet ability damage is static in this client. No pet family choice changes it
     (dragonkin are not even in the tame table). Hunter scaling value arrives through the
     melee pipeline: verified 10% AP slot driving white swings + crit/hit/haste/armor/HP.
   - **Demon abilities ARE live consumers**: imp Firebolt (3110) `BonusCoef=0.164`, succubus
     Lash of Pain (7814) `0.429` — both magic schools the demon aura feeds. Blizzard zeroed
     the hunter abilities but shipped live demon coefficients, strongly suggesting official
     intended demon scaling to function and hunter ability scaling not to.
   - **Verified in-game same day**: Bixby's imp Firebolt hits 11-16 geared vs 7-10 ungeared.
     ~5 dmg/hit delta ÷ 0.164 ⇒ ~30 pet spell damage from gear ⇒ ~200 owner spell power at
     the legacy 15% conversion — consistent with the level-60 BiS set. Demon pipeline
     confirmed end-to-end: gear → owner spellpower → aura recalc → pet damage stat →
     ability coefficient → bigger hits.
   - Remaining design question (moved to item 7): whether to homebrew hunter ability
     coefficients server-side (hotfixes spell_effect overrides) or accept the client cap.
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

---

# Appendix: original analysis and history (pre-implementation)

## A. The issue with the current core

ForeverCore currently runs **vanilla 1.12 pet stats**: a pet is a fixed stat block per
level and gets nothing from the owner's gear.

Commit `440d365e79` (Advocaite, "Classic 1.60: vanilla audit", 2026-10-11) deleted
working owner-inheritance that upstream TrinityCore master carried, replacing each
block with a vanilla comment:

| Location (StatSystem.cpp) | Deleted upstream behavior | Current state |
|---|---|---|
| `Guardian::UpdateStats` ~1456 | +30% owner stam all pets; +30% owner int warlock/mage pets | `// pets get no share of owner's stamina or intellect` (commented out) |
| `Guardian::UpdateResistances` ~1504 | +40% owner resistances | `// pets do not inherit their owner's resistances` |
| `Guardian::UpdateArmor` ~1520 | +70% owner armor hunter pets; +100% warlock pets | `// pets do not inherit their owner's armor` |
| `Guardian::UpdateAttackPowerAndDamage` ~1588 | +22% owner RAP → pet AP, +12.87% → pet dmg | empty `if (IsHunterPet()) {}` |
| same, ~1602 | demons: +15% max(fire,shadow) → dmg, +57% → AP | empty `else if (IsPet()) {}` |

The WotLK-era aura scripts in `spell_pet.cpp` (34902-34904, 61017, 34947, 34956-58,
61013…) are dead code: only `spell_gen_pet_calculate` is registered
(`AddSC_pet_spell_scripts`, line 1630) and `spell_script_names` has **zero** rows for
any of them, so even a granted aura would never compute an owner-derived amount.

Result: a naked level-60 hunter's cat and a full-T3 hunter's cat are identical —
3052 hp, 136 str, 3814 armor (`pet_levelstats` entry 1), same damage. On official
Forever they are visibly different; the inheritance is even displayed in the client
character sheet's Pet panel.


## B. The hidden scaling auras — decoded from client data (verified)

The "hidden scaling aura" the community references is real. Extracted from the
Forever client's `SpellEffect.db2` / `SpellMisc.db2` / `SkillLineAbility.db2`
(schema `WOWSTATIC_1_60_1_70399`, decoder: `F:\_dev\tmp\db2scan*.py`):

**Spell 415429 "Hunter Pet Scaling"** — Attr0 `PASSIVE|NO_DISPLAY|NO_LOG`,
Attr4 **`OWNER_POWER_SCALING`** (`0x02000000`, enum exists at `SharedDefines.h:611`
but has no engine support — metadata only) `|ALLOW_ENTERING_ARENA`.
19 `SPELL_EFFECT_APPLY_AURA` (effect 6) slots, all BasePoints=0 → server computes:

| # | Aura type | miscValue | Meaning |
|---|---|---|---|
| 0 | 230 `MOD_MAX_HEALTH` | — | +2 HP per owner stam |
| 1 | 99 `MOD_ATTACK_POWER` | — | 10% max(melee,ranged) AP |
| 2 | 13 `MOD_DAMAGE_DONE` | mask 126 (all) | pet dmg from owner — coeff. unpublished |
| 3-7 | 22 `MOD_RESISTANCE` | 4/16/8/32/64 | Fire/Frost/Nature/Shadow/Arcane — coeff. unpublished |
| 8 | 674 → `MOD_RESISTANCE` | mask 1 | **armor** — 30% (aura 674 maps to MOD_RESISTANCE, `SpellAuraDefines.h:756`) |
| 9 | 54 `MOD_HIT_CHANCE` | — | melee+ranged hit pass-through |
| 10 | 55 `MOD_SPELL_HIT_CHANCE` | — | spell hit pass-through |
| 11 | 319 `MOD_MELEE_HASTE_3` | — | owner haste → pet attack speed |
| 12 | 65 `MOD_CASTING_SPEED_NOT_STACK` | — | owner haste → pet cast speed |
| 13 | 52 `MOD_WEAPON_CRIT_PERCENT` | — | 100% max(melee,ranged) crit |
| 14 | 57 `MOD_SPELL_CRIT_CHANCE` | — | spell crit pass-through |
| 15 | 418 `MOD_MAX_POWER` | power 2 (Focus) | **BasePts=50** — the only nonzero value: flat +50 focus |
| 16-17 | 593 (`SPELL_AURA_593`, unmapped) | 4 / 2 | "Mod Combat Result" — likely dodge/parry reducers = expertise carriers |
| 18 | 49 `MOD_DODGE_PERCENT` | — | owner dodge → pet dodge |

**Spell 416189 "Warlock Pet Scaling"** — same 19-slot layout except the tail:
slot 15 = `29 MOD_STAT` misc 3 (**Intellect**), 16 = `85 MOD_POWER_REGEN` (mana),
17-18 = aura 593 misc 4/2, 19 = `135 MOD_HEALING_DONE` misc 126 (all schools).

**Spell 415431 "Avoidance"** — hidden passive, one effect:
`310 MOD_CREATURE_AOE_DAMAGE_AVOIDANCE`, **BasePts = -50** → −50% AoE damage.
Confirms the "-50% vs non-player AoE" community figure.

**Bonus find — spell 1293586 "Hunter Guardian Hawk Pet Scaling 01"**:
3 effects (`342 MOD_MELEE_RANGED_HASTE_2`, `79 MOD_DAMAGE_PERCENT_DONE` mask 127,
`290 MOD_CRIT_PCT` BonusCoef=1.0), Attr4 `AURA_NEVER_BOUNCES` only — fixed guardian
scaling, not owner-scaled. Out of scope.

**Grant path (verified negative):** `SkillLineAbility.db2` has 27 rows granting
415429/416189 to pet-family skill lines (hunter: 203-218, 236, 251, 653-656, 2897,
3015-16 ≈ 20 families; demons: 188-189, 204-207, 2887 = 7), but every row has
`AcquireMethod = 0 (Learned)` — `LoadPetFamilySpellsStore` requires
`AutomaticCharLevel (2)` (`SpellMgr.cpp:6519`), so pets do **not** get these via
family passives. Official must apply them server-side on summon. We do the same:
explicit `AddAura` on pet creation by pet type. 415431 has **no** SkillLineAbility
rows at all — granted by another mechanism (or bundled with the scaling aura on
official); we apply it alongside.


## C. Data checks bundled into the change

1. `pet_levelstats` (world DB): is entry-1 hunter data vanilla or Forever-calibrated?
   **RESOLVED (Nov 26): vanilla.** The October migrations (2026_10_11_15 /
   2026_10_27_41) state in their own comments that the table is a straight
   VMaNGOS vanilla import. Official Forever buffs base health +15% over vanilla
   for all player pets: hunter pets "have 115% of their normal health"
   (Nov 10/11 hotfix, down from an erroneous 150% at launch — wowfdb hunter pets),
   and "Imp, Voidwalker, Incubus and Succubus have about 15% more base health"
   (Nov 11 — wowfdb warlock changes). Same +15% both sides; felhunter
   deliberately excluded. Armor/mana/stats untouched on official.
   **Decision (user, Nov 26): ships as its own PR, separate from the aura work**,
   so Karrz can adopt either independently. Migration prepared at
   `F:\_dev\tmp\pet_base_health_calibration.sql` (entries 1/416/1860/1863 plus
   incubus 184600/185317, hp as fixed DELETE+INSERT values — idempotent, full
   references embedded in the file header).
   Level-60 reference points: cat 3052→3510, imp 769→884, VW 3459→4024,
   succubus 1709→1965.
   **Voidwalker +40: CONFIRMED — and it is flat, not per-level.** Blizzard's own
   rolling hotfix archive (primary source,
   https://news.blizzard.com/en-us/article/24315281/wow-forever-hotfixes-november-25-2026):
   Nov 6 "Voidwalker base health increased by about 40 **at all levels**",
   Nov 10 "Voidwalker base Health increased by ~15%" — so VW = (vanilla+40)×1.15.
   Independent confirmations: warcrafttavern.com/forever/news/voidwalker-health-increased-wow-forever-hotfixes-for-november-6/,
   wowforeverguides.com/news/wowforever-hotfixes-raise-voidwalker-health-and-lower-tanning-rack.
   (wowfdb's curated warlock log simply omits the Nov 6 line — absence there was
   not evidence of absence.)
   **Incubus folded in (user, Nov 26):** the Forever succubus-counterpart demon
   (PET_INCUBUS=184600 in `TemporarySummon.h`, NPC_CWD_INCUBUS=185317 in
   `classic_talents_warlock_druid.cpp`, mapped to `DemonKind::Succubus`) has NO
   pet_levelstats rows at all — falls back to generated placeholder stats.
   Official includes incubus in the +15%, and the migration now mirrors the
   succubus curve ×1.15 for both entries. Neither has ever been summoned on
   this server (character_pet empty) — pure upside, zero regression risk.
   Which entry the summon spell actually spawns is unresolved (client DB2 scan
   inconclusive — Forever spells may live in hotfix DB2s); if it is a third
   entry it is no worse off than before.
2. Demon `pet_levelstats` rows: folded into item 1 — the +15% demon delta is the
   same calibration.
3. Family modifiers (Cat +10% dmg etc., 60.tools table): verify ForeverCore applies
   them today (probably via family passive spells/`PetFamilySpellsStore` — confirm,
   add if missing; this is independent of scaling but part of "pet stats correct").
4. `spell_script_names`: leave the dead 2012-era scaling spells unbound (or clean
   them up separately — they carry WotLK coefficients that contradict Forever's).


## D. Implementation status (2026-11-26)

Branch `pets/gear-scaling` @ `c6b252ed91` in `F:\_dev\ForeverCore-petscaling` —
11 files, all four feature areas implemented + the fixes below. Instrumentation
is NOT in the commit; it lives only in the main tree's working copy.

**Bugs found during in-game verification (all fixed unless noted):**

1. **Loader registration** — `AddSC_pet_spell_scripts` was never invoked by
   `spell_script_loader.cpp`; `spell_pet.cpp` compiled but registered nothing, so
   `spell_script_names` rows bound to a nonexistent loader and were silently
   skipped. This is also why the dead upstream Kandera scripts never ran. Fixed
   by registering it alongside the other spell script files (both trees).
2. **415431 not passive** — `addSpell` only auto-casts `SPELL_ATTR0_PASSIVE`
   spells; 415431 is hidden+no-log without the passive bit, so it was filed on
   the action bar and never applied. Fixed: `CastSpell` directly, and the grant
   moved to the shared branch so demons get it too (hunter-only was an oversight).
3. **Fresh-summon aura wipe** — `SavePetToDB(PET_SAVE_AS_CURRENT)` on an
   unslotted demon left mode=-3, which fell into the `RemoveAllAuras()` branch,
   stripping every aura (passives included) right after `InitPetCreateSpells` —
   a brand-new demon's first summon showed literally 0 auras. Fixed: strip only
   for stable/not-in-slot saves; `PET_SAVE_AS_CURRENT` keeps live auras.
4. **Intermittent resummon aura-loss — OPEN.** A pet that returns via the
   `LoadPetFromDB` async path (teleport temp-unsummon/resummon, some relogs)
   *occasionally* spawns with zero auras — `LearnPetPassives` never ran, meaning
   the AfterComplete callback bailed early (`session->GetPlayer() != owner ||
   GetPet() != this` or `m_removed`; likely `IsInWorld()` being false when the
   DB reply lands). Not reproduced since instrumentation went in; candidate fix
   is moving `LearnPetPassives` synchronous (it needs no DB data) instead of
   widening the bail window. Debug layer deployed: `pet_scaling` TC_LOG lines
   plus in-game `PETBUG:` notifications on every load outcome — if one pops,
   grep Server.log for the matching `pet load` line.

**Cross-server validation against official Forever (user, Nov 26):**
same-level hunter pet with standard non-raid gear — official Forever 841 hp,
ForeverCore 849 hp at level 20 (delta ~1%, fully explained by minor gear
variance: 8hp = 4 stamina at 2hp/point). Composition confirmed end-to-end:
calibrated base table + owner-stat auras reproduce official pet stats.
"That was the whole point of the exercise — we matched it quite nicely."

**Verified in-game:**

- Hunter (bear): health +2/stam, 30% armor, 10% max-AP, crit/dodge/hit
  pass-throughs, +50 focus, −50 avoidance; zeros on conf-gated slots are
  deliberate. **Live recalc works** — stam 65→57 on gear removal tracked
  130→114 in real time.
- Warlock (imp + voidwalker, incl. fresh warlock char): 416189 applies,
  +2/stam HP live (35→70, 60→120 after BiS gear), demons get 415431 now,
  demons persist across relog/teleport.
- Buff-block: stat buffs rejected on pets ("target is not a player"), as designed.

**Remaining:**

- ~~`pet_levelstats` 115% calibration check (§5.1)~~ — done: table confirmed
  vanilla, +15% migration prepared (`F:\_dev\tmp\pet_base_health_calibration.sql`),
  shipped as **its own PR: https://github.com/Karrz1/ForeverCore/pull/418**
  (branch `pets/base-health-calibration` off upstream/forever, independent of the
  aura work). Applied to the live DB Nov 26 and verified: boot loaded 2514 rows.
- Strip debug instrumentation + clean rebuild before PR; PR only after
  human-confirmed testing (user's rule).
- Kandera-era dead classes in spell_pet.cpp: remove in a separate cleanup commit.

## E. References

Official/community sources for the numbers:

0. **Blizzard rolling hotfix archive (primary source)** —
   https://news.blizzard.com/en-us/article/24315281/wow-forever-hotfixes-november-25-2026
   Notable: Nov 6 VW +40 flat; Nov 10 demon +15% / hunter 150%→115% fix /
   Firebolt r1-4 base damage up; **Nov 25: "Fixed an issue where pets had 0%
   critical strike chance on melee basic attacks"** (confirms pets are meant to
   crit with white swings — the aura's owner-crit pass-through is the carrier)
   **and "Succubus and Incubus had 5% higher critical strike chance than
   intended"** (implies demons carry a small baseline crit on official).
1. Wowhead BM Hunter guide (Docoda, 2026-11-19) — full hunter stat list incl. avoidance:
   https://www.wowhead.com/forever/guide/classes/hunter/beast-mastery/overview-pve-dps
2. Wowhead Demonology guide (Zephan, 2026-11-14) — "pets scale with the player's
   stats; exact scaling in your character pane":
   https://www.wowhead.com/forever/guide/classes/warlock/demonology/overview-pve-dps
3. Mobalytics leveling guide (Kargoz beta testing, 2026-10-22) — same 4 ratios:
   https://mobalytics.gg/wow-forever/classes/1-60-beast-mastery-hunter-leveling-guide
4. AzerothCompass hunter pets (2026-11-07) — reference model + "hidden scaling aura"
   caveat + expertise-unspecified note:
   https://azerothcompass.com/en/wow-forever/hunter-pets/
5. wowfdb hunter pets / hunter changes — hit inheritance, 115% (Nov 11), crit=higher
   of melee/ranged (Oct 15), no player buffs (tested), refresh bug, family modifiers:
   https://wowfdb.com/classes/hunter/pets/ , https://wowfdb.com/classes/hunter/changes/
6. wowfdb warlock/Demonology — demons 2hp/stam, spell-power→damage, no stat buffs
   but shields+heals land (tested):
   https://wowfdb.com/classes/warlock/ , https://wowfdb.com/classes/warlock/demonology/
7. 60.tools hunter pets — Oct 15 expertise + crit change, Nov 10 150%→115% health,
   family modifier table, attack-speed passives:
   https://www.60.tools/guides/hunter-pets
8. epiccarry Nov 10 pet changes — warlock base-health +15%, demon 7.5→2 hp/stam
   (Nov 2), VW +40/lvl (Nov 6), Orc Command fix:
   https://epiccarry.com/blogs/wow-forever-pet-changes/
9. Half-Baked Warcraft warlock guide — Nov 2 demon stam 7.5→2:
   https://halfbakedwarcraft.com/wow-forever-warlock/
10. wowforeverguides.com — cites Blizzard Nov 2 beta notes (Kaivax post) for 2hp/stam:
    https://wowforeverguides.com/leveling/warlock

Code evidence (this tree):

- `src/server/game/Entities/Unit/StatSystem.cpp` — disabled inheritance blocks
  (~1440-1614), propagation points (:120-125, :328, :575, :588-592)
- `src/server/game/Entities/Unit/Unit.cpp` — `GetUnitCriticalChanceDone` (:3100),
  `MeleeSpellMissChance` (:13245)
- `src/server/game/Entities/Pet/Pet.cpp` — `InitStatsForLevel` (:1344), hunter-pet
  level-formula damage (:1450), `LearnPetPassives` (:2241)
- `src/server/scripts/Spells/spell_pet.cpp` — dead WotLK scaling scripts; only
  `spell_gen_pet_calculate` registered (:1630)
- Client data (decoded, `F:\_dev\tmp\db2scan*.py`):
  `SpellEffect.db2` — spells 415429/416189/415431/1293586 full effect tables;
  `SpellMisc.db2` — Attr0 0x1C0 / Attr4 `OWNER_POWER_SCALING`;
  `SkillLineAbility.db2` — 27 grants to family skill lines, all
  `AcquireMethod=Learned` (not auto-learned);
  `CreatureFamily.db2` / `SkillLine.db2` — family↔skillline map
- `git show 440d365e79 -- src/server/game/Entities/Unit/StatSystem.cpp` — the removed
  upstream inheritance (author: Advocaite, 2026-10-11)
- `spell_pet.cpp` git history — original WIP commits by Kandera, June 2012
  (`69ea6b5d32`, `38424024e6`, `5b8d3f8109`, `76a2d13239`)

