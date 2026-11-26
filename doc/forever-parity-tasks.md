# ForeverCore parity tasks

Audit of `F:\_dev\ForeverCore` against the official WoW Forever feature list in
`forever-parity.md` (researched 2026-11-25, client 1.60.1.70888, hotfixes through Nov 23).

Status legend: **[done]** code present, looks right · **[check]** code/data present but
needs in-game or sniff verification · **[gap]** missing or known-divergent ·
**[data]** decided by DB content, not code.

ForeverCore already carries a lot of sniffed parity work — comments cite official hotfix
dates, e.g. `DungeonCarryLevelGap = 12` (Nov 13), `Rate.XP.DungeonKill = 0.6` (Nov 8),
`Classic.OfficialFeatureFlags` flag block (sniffs 70205/70235).

---

## Confirmed gaps (small, fixable)

| # | Task | Evidence |
|---|------|----------|
| 1 | `AccountInstancesPerHour` default 10 → **5**. Official hotfixed 10→5 on Nov 20. **Conf-set on live** (`zz-9-local.conf`, 2026-11-25); code/dist default still needs changing. | `worldserver.conf.dist:1676`, `Map.cpp:2017` comment still says 10 |
| 2 | Pet happiness decay default: conf documents `0.5 = WoW Forever tuning`; dist ships `1.0` (vanilla), deployed `worldserver.conf` ships `0.5`. On live, happiness effectively doesn't decay (possible Blizzard bug, unresolved). **Live conf already `0`** (`zz-9-local.conf` — matches observed live). Remaining: pick the intended default in code. Bots already pinned to max happiness (`Pet.cpp:735-736`). | `worldserver.conf.dist:2059-2067`, `Pet.h:100-101`, `Pet.cpp:732-744` |
| 3 | Mak'gora: `/makgora` command + Mak'gora Arena queue entry — **no matches in src**. Missing. | grep `mak.?gora` = 0 |
| 4 | Quest Time Link (leader accepts/turns in for Time Linked party): no implementation found. `quest_share` in PlayerbotV2 is the bot quest-share feature, unrelated. | grep `TimeLink` = 0 |
| 5 | Preferred Online Language matching (account flag, 24h cooldown, same-language matching): no matches. Low priority — social grouping nicety. | grep language = 0 |
| 6 | PvP-ruleset faction lock (one faction per player + SoD-style creation limits): not found. ForeverCore runs one ruleset per realm via `Cfg_SuperDistrict`, so a PvP-ruleset realm needs this enforced at character creation. | `UpdateFields.cpp:46` shows the super-district mapping exists |
| 7 | STV Fishing Extravaganza multi-winner per ruleset: no matches. Official still tuning it; low priority. | grep extravaganza/tastyfish = 0 |
| 8 | Darkspear Islands 15v15 BG (levels 30–60): no server-side presence. Big content task; map data presumably client-side only for now. | grep Darkspear = 0 in game code |

## Implemented — verify behaviour matches live

| # | Feature | Status / what to check |
|---|---------|------------------------|
| 9 | Pet happiness/loyalty model | [check] Loyalty ticks ±loyalty by happiness every 12s (`Pet.cpp:747-765`), −1 happiness level on non-BG death (`Pet.cpp:655-660`), `HasHappiness` gates hunter pets only. Confirm against live: does loyalty still tick up without feeding? (Live = effectively yes because no decay.) |
| 10 | Pet training points / family abilities | [check] `PetFamilySpellsStore` grants family spell sets (`Pet.cpp:2251`, `SpellMgr.cpp:6495`). Verify TP costs/ranks vs live pet UI. |
| 11 | Traps in combat | [done] Confirmed working in-game (user, 2026-11-25). |
| 12 | Pet gear scaling | **GAP — confirmed NOT implemented for hunter pets/warlock demons; deliberately coded to vanilla.** `StatSystem.cpp:1456` "pets get no share of owner's stamina/intellect" (commented out), `:1504` no owner resistances, `:1520` no owner armor, `:1588` hunter pet gets nothing from owner AP (empty if-block), `:1602` demon gets nothing from fire/shadow. Hunter pet dmg = level formula (`Pet.cpp:1450-1452`) + fixed `pet_levelstats` entry 1 (lvl60: 3052hp/136str/256sta/3814ar). WotLK scaling auras exist in `spell_pet.cpp` (34902-34904/61017 hunter, 34947/34956-58/61013 warlock — 22% RAP→AP, 12.87% RAP→dmg, ~45% stam, 35% armor, 40% res) but are dead code: only `spell_gen_pet_calculate` registered (`:1630`), DB `spell_script_names` has ZERO rows for all of them, `pet_spell` shows 0 pets knowing them (649 pets). Owner→pet recalc plumbing exists (`StatSystem.cpp:120-125` STA/INT/STR, `:575` ranged AP). Fix = either re-enable stat-share in Guardian::UpdateStats/UpdateArmor/UpdateResistances/UpdateAP, or register+bind+grant the scaling auras. Official Forever coefficients unpublished — TBC values in the dead scripts are the natural baseline. Guardians DO inherit (ghoul/spirit wolf/elementals/treant/gargoyle/shadowfiend). |
| 13 | Judgements = ranged attacks; JoC = melee | [check] Judgement scripts exist (`spell_paladin.cpp:1062`). Verify proc flags: ranged-hit table for judgements, melee procs for Judgement of Command. |
| 14 | Seals not consumed by Judgement | [check] Verify judgement cast leaves seal aura up. |
| 15 | Weapon imbue + weapon totem simultaneously | [check] Nov 10 fix; verify no exclusivity check between imbue aura and totem aura in `Spell::CheckCast`/aura stacking. |
| 16 | World buffs drop on raid entry, persist across zone change | [check] Hidden-copy world buff spells implemented (`SpellMgr.cpp:4248-4278`, `ClassicLegacyPerks.h`). Did not find explicit raid-entry aura strip — verify. |
| 17 | Might of Stormwind / Warchief's Blessing cancel on death, never on NPCs | [check] Nov 17 hotfix. Buff spells are in the codebase; verify death-cancellation and NPC exclusion. |
| 18 | Self-found mode enforcement | [check] `CHARACTER_FLAG_4_SELF_FOUND` + error strings exist (`SharedDefines.h:1213,8740-8743`). Verify it actually blocks trade/AH/mail/guild bank. |
| 19 | Dual spec (Secondary Talents) | [check] Talent-group machinery + spec-swap paths present (`Player.cpp:2968`, `Item.cpp` spec appearance slots). Verify the client UI unlock and swap round-trip (Nov 13 action-bar bug was client-side). |
| 20 | Transmog opt-out visibility | [check] Appearance collection + transmog modifiers present (huge surface). Verify: opted-out players see real gear; Poor/Common loot grants appearance w/o binding; BoP uncommon/rare dungeon drops grant to all eligible looters; epics only to bound player; <60 level-gating on appearances. |
| 21 | Quests 48+ pay gold; no XP→gold at 60 | [data] `quest_classic_money` table + `RewardMoney` paths exist (`ObjectMgr.cpp:5835`, `Player.cpp:16621-16635`). Verify world DB carries the Nov 10 gold rows and that lvl-60 quests don't pay the old XP-conversion money. |
| 22 | Raid sizes 10/20/40 + raid difficulties | [check] Barrow Deeps/Hyjal not live until Dec 9 — but check `MapDifficulty`/spawn modes support 10/20-man Forever raids (not just 40/25 retail splits). |
| 23 | Guild Finder | [check] `Classic.GuildFinder` conf exists, marked WIP (`CharacterHandler.cpp:1948`). |
| 24 | Group Finder | [check] LFD/queue machinery + `LfdEnabled=true` in official flag block. Verify the Classic group-finder window lists/forms groups end-to-end (Nov 20 UI bug was official-side too). |
| 25 | Barbershop (HD/SD model swap) | [check] 138 hits for barber — verify appearance-change packet path works with Forever client. |
| 26 | Preferred ruleset realm semantics | [check] `Classic.Hardcore` realm flag + death rules exist (`Player.cpp:4790-4804`). Verify the realm's content-set/super-district exposes the intended ruleset to the client (`ContentSetID`, `UpdateFields.cpp:46`). |
| 27 | In-game shop | [check] `Classic.Shop.Enabled` + shop2 catalog (`CharacterHandler.cpp:1934`). Server-owner optional. |
| 28 | Tanning Rack gates advanced LW recipes (req 125) | [check] Nov 6 hotfix lowered 140→125. Verify the skill gate value in DB/conditions. |

## Implemented — looks correct (spot-check only)

- **+4 backpack slots for all**: `Classic.SecuredBagSlotsForAll` default true (`World.cpp:729`), else authenticator check (`CharacterHandler.cpp:1904-1918`).
- **Official feature flags**: full sniffed flag block incl. `PetHappinessEnabled=false`, `LfdEnabled=true`, `ItemRestorationButtonEnabled=false` (`CharacterHandler.cpp:2002-2068`, `Classic.OfficialFeatureFlags` toggle).
- **Merged hit/crit ratings**: `ITEM_MOD_HIT_RATING`→CR_HIT_MELEE/RANGED/SPELL; `ITEM_MOD_CRIT_RATING`→all three; `ITEM_MOD_EXPERTISE_RATING`→CR_EXPERTISE (`Player.cpp:8808-8837`).
- **Classic item mods**: weapon-skill item mods incl. Thrown (`Player.cpp:8990-8997`), per-school penetration mods (`Player.cpp:9024-9028`), AP/damage vs creature-type mods, spell piercing engine (`Unit.cpp:1990-2044`).
- **Caster weapon implicit spell power** (`Player.cpp:8971-8975`, `GetClassicCasterPower`).
- **Dungeon XP**: `Rate.XP.DungeonKill=0.6` (Nov 8 parity), `DungeonCarryLevelGap=12` (Nov 13 parity), elites 2.5x in 5-mans / 2x elsewhere (`Formulas.h:180-228`).
- **Waylaid Crates + Craftsman's Writs** spell handling (`SpellEffects.cpp:4779-4813`, `classic_crate_bundle`).
- **Comprehension** skill 3012 + decipher skill-ups (`Player.cpp:6011`, `SpellEffects.cpp:4798-4799`).
- **Quest POI markers**: `quest_poi` table + `QuestPOIUpdateResponse` (`ObjectMgr.cpp:8839`, `Player.cpp:18305`) — the sql-changes turnin_poi migrations are this feature's data.
- **Mount indoors rules**: `Classic.MountIndoorsRules` + WMO-group logic in BGs (`Player.cpp:7124-7132`, `Battleground.cpp:600-619`).
- **World buff dummy→hidden-copy pattern** (`SpellMgr.cpp:4248+`).
- **Legacy perks**: Gourmand/Permanence/Conquering Hero/Reagent Economy/Better Living Through Chemistry/Talented wired (`Object.cpp:1795-1834`, `Player.cpp:28060`, `classic_spell_scripts.cpp:1016`).
- **Death Recap**: full record/announce/replay, `Recap.Enable` + `Classic.Hardcore`-gated (`DeathRecap.cpp:557-558`).
- **Hardcore ruleset**: permanent death, `.revive` only (`Player.cpp:4790-4804`).
- **Surnames**, **dual-spec infra**, **transmog infra**, **LFG infra**, **guild bank**, **achievements**: large existing surfaces (counts: 421/54/2767/2147/870/1752 hits).
- **Class-mount grants riding** (Felsteed, Nov 9 hotfix — check riding-skill grant exists in the mount spell chain).
- **Adventure Guide** switch `Classic.AdventureGuide`, in-game shop `Classic.Shop.Enabled`, `Respawn.DynamicOpenWorld`, `Classic.Respawn.*` faster low-level respawns, `Forever.DayCycle.Speed` — all documented in README switches.

## Not evaluated yet (needs a second pass)

- Per-class talent/spell deltas (149 new talents etc.) — DB-driven; spot-check against 60.tools `/changes/<class>` per class rather than one mega-task.
- Per-race racial sets (2 active + 2 passive each) — data check against `/races/<race>`.
- Camping object mechanics (3-object limit, 1h shared cooldown, 1-min rest → buff, non-stacking with class buffs, blueprint drops from bosses) — `CampBenefitSpells` list exists; object-spawn/cooldown mechanics unverified.
- Legacy challenges/points/spend-cap economy — perks are wired; challenge tracking and the 16-pt cap unverified.
- Quest gold data coverage (see #21).
- Ruleset-scoped ecosystems — ForeverCore emulates one-ruleset-per-realm; cross-ruleset mixing (BGs only) doesn't map cleanly. Design decision, not a bug.
