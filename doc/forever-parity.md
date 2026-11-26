# WoW: Forever — feature & QoL delta vs Classic Era

Research for ForeverCore parity work. WoW: Forever is Blizzard's official Classic+ game
(launched 4 Nov 2026, client 1.60.1, builds ~70888/70790/70862). This file lists what the
official game does differently from Classic Era (1.12-ish rules), so we can audit what
ForeverCore already implements and what's missing.

Sources are numbered at the bottom. Official = Blizzard article/forum/hotfix. Fan sites and
emulator-side changelogs are marked.

---

## Realm structure ("realmless")

- Rulesets replace realms: Normal, PvP, Roleplay, Roleplay-PvP (Hardcore post-launch). Each
  ruleset is one large ecosystem. Grouping/guilds/dungeons/raids same-ruleset only;
  battlegrounds may mix rulesets except Hardcore. New character required to switch. [1]
- PvP faction lock: one faction only per player on the PvP ruleset; SoD-style faction-balance
  limits on character creation. [1]
- Hardcore one-way flow: dead HC characters can transfer to another ruleset; collections/Legacy
  earned in HC flow out only. [1][2]
- Two-part names (surnames): first + second name, unique combination per region. [2][3]
- Preferred Online Language: account-wide, 24h change cooldown, matches you with same-language
  players. [1]

## New server-side systems

- Legacy System: account-wide Legacy Points from ~65 Legacy Challenges. Each character spends
  up to 16 points (launch cap) in Professions / Adventure / Resourcefulness trees. Perks:
  Well Rested (rested XP), Bountiful Harvest (gather yield), Reagent Economy (no reagent cost
  on class abilities), cheaper flights. Account total feeds cosmetic Reward Track. Cap can be
  reached on one character. [2][5]
- Camping: Cooking fire becomes a placeable Basic Campfire → campsite. Up to 3 players each
  add one crafted profession object (Cook campfires allow 5/10). Objects share a 1h cooldown;
  sit ~1 min → 1h buffs that are variants of, and don't stack with, matching class buffs
  (Sharpening Wheel=AP/Str, Faction Banner=Spirit, Incense Candle=Int). Objects learned at
  profession skill 20; advanced ones from Blueprint recipes off dungeon bosses. Objects incl.
  Alchemy Lab, Tanning Rack (gates advanced LW recipes, req lowered to 125), Fishing Rack,
  Cozy Sleeping Bag, Seed Hybridizer (has failure chance, disabled then rebalanced). [2][4][7]
- Secondary Talents (dual spec): swappable primary/secondary spec. [3]
- Group Finder UI. [7]
- Quest Time Link: leader accepts/turns in quests for the Time Linked party. [3]
- Mak'gora: /makgora duel-to-the-death + Mak'gora Arena in PvP queue. [3][7]
- Self-found mode: opt-in, locks trading channels incl. guild bank (guild banks exist). [3]
- Achievements/titles/collections; library book turn-in NPCs (Owen Thadd, Garion Wendell). [3][7]
- Transmog (opt-in): transmogrifier NPCs in cities; opt-out players see real gear (Classic
  preset auto-opts-out). Poor/Common items grant appearance on loot without binding; BoP
  Uncommon/Rare dungeon drops grant appearance to ALL eligible looters; Epic raid drops grant
  only to the bound player. Armor-type rules apply; below 60 no higher-level appearances;
  cosmetic items exempt. Appearances collected even for items that never bind. [2]
- Item Restoration self-service exists (disabled 11 Nov over a bug). [7]

## Combat & itemization mechanics

- Merged combat ratings: spell/melee/ranged hit → one hit stat; same for crit. Affects
  Taunt/Poisons/Traps reliability. [2]
- Weapon skills & piercing: weapon skill grants less per item; new Weapon Skills stat
  category; per-school spell piercing; crushing blows; attacker-level hit tables. [2][3]
- New stats/effects: items that reduce chance to be parried/dodged (expertise-like);
  spellcaster weapons grant spell damage+healing; +healing grants 1/3 spell damage;
  environment-typed trinket effects (Woodlands/Mountains/Deserts, anti-creature-type). [2]
- Judgements = ranged attacks (ranged hit, no melee procs) EXCEPT Judgement of Command =
  melee attack, procs on-hit effects. [7]
- Paladin seals not consumed by Judgement. [2]
- Shaman: weapon imbue + weapon totem simultaneously; WF totem only off abilities involving
  main hand; offhand-only strikes can't proc it. [7]
- Diminishing returns on stuns apply to and from creatures (was a launch bug, fixed). [7]
- Bear Form 115% threat (Blessing of Salvation removed); Defensive Stance 80% threat. [6]
- World buffs persist across zone changes but drop on raid instance entry. City buffs:
  Might of Stormwind / Warchief's Blessing — cancel on death, never on NPCs. [7]

## Hunter pets

- TBC-style pet training: 6 loyalty ranks + Training Points; pet families with family
  abilities; pets scale with gear; traps usable in combat; pet health = 115%. [4][7][8]
- Happiness: pet XP = 25% of player kill XP, no rested/quest XP, caps at player level;
  Happy/Content/Unhappy = 125/100/75% damage; −50 on Dismiss Pet, big hit on death; can't
  feed in combat. On live, happiness reportedly does NOT decay over time (feed once after
  tame, re-feed after death). Reported in beta; still unclear bug vs intent — a Sept 24 beta
  fix stopped decay at max loyalty, suggesting possible recurrence of same fault. [9][10][11]

## Class/talent structure

- Same tree layout; milestone talents at 11, 16, 21, 31 (new 16-pt tier). Divine Spirit,
  Blessing of Kings, Improved MotW are baseline. Overall: 149 new talents, 275 changed, 114
  removed; 219 spells changed. Per-class diffs: 60.tools /changes/<class>. [2][6]
- Headline additions: Rogue Shank + Death Mark + Mutilate talent; Paladin Holy Strike
  (lvl 6), Seal of Fury (Judgement taunts), baseline Consecration, Twist of Light
  (seal-twisting assist); Shaman Stormstrike/Maelstrom PPM rework; Warlock Wrack channel
  (DoT ticks 2x, skipped time persists after channel); Druid Wild Growth + instant via
  Nature's Swiftness; Mage Arcane Blast, Study/Comprehension scroll-deciphering stat;
  Priest Chastise; Hunter Summon Hawk, Volley. [5][6][7]
- New race/class combos: Undead Paladin, Dwarf Shaman, Gnome Priest, Human Hunter, Orc Mage,
  Troll Warlock — both factions can play all 9 classes. Skyborne: Horde Windshaper (Shaman),
  Alliance High Order (Mage); both also Druid/Hunter/Rogue/Warrior; unique druid forms. [2][12]

## Racial reworks (per race: 2 actives + 2 passives)

- Tauren: Plainsrunning (can't stack in BGs, cancelled on flag carry); Cultivation active
  herb-gathering cast. [7]
- Undead: WotF removes Charm/Fear/Sleep, NO immunity; Cannibalize restores Mana too;
  Touch of the Grave life-drain proc. [2]
- Dwarf: Stoneform removes bleed/poison/disease + %physical dmg reduction; Find Treasure
  coexists with other tracking; Mace Specialization = crit w/ mace; Big Game Hunter +dmg vs
  Beasts. [2]
- Orc: Blood Fury 2min CD (was 3); Command interaction w/ warlock pets nerfed. [5][7]
- Night Elf: Wisp Form death mechanic. Gnome: Confounding Flash (usable in Shadowform).
  Skyborne: 5 new racials. Per-race diffs: 60.tools /races/<race>. [7]

## Economy, loot & travel

- Quests lvl 48+ pay gold directly; NO XP→gold conversion at 60 (deliberate). [7]
- TBC-style mount costs: cost in riding-skill training; mount granted when skill learned.
  Class-mount quests (e.g. Felsteed) grant apprentice riding on first summon. Racial vendor
  mounts all BoP. [2][7]
- Vanilla mount rules: no mounting indoors; named areas can allow it; some instances block it.
  [7][14]
- Party-shared quest loot: many quest drops for all party members on the quest. [7]
- Pix Xizzix (Booty Bay): weekly dungeon quests cleared on reset; item-exchange vendor. [7]
- Waylaid Crates & Craftsman's Writs (SoD-style supply turn-ins) drop in world + dungeons. [7]
- Vendor buy prices cut for crafted BoP armor. [7]
- Tailored bags resized + costs up; everyone gets +4 backpack slots (authenticator slot
  granted free). [7][14]

## PvP

- Rank system returns (to GM/HWL) but seasonal with weekly Rank Point cap rising each season;
  Honor Points buy blue PvP set upgradable to epic via rank-tied seals. [3][4]
- Darkspear Islands: 15v15 BG, levels 30–60, AB-style. [4]
- AV unlock quests lvl 58; Plainsrunning BG rules; STV Fishing Extravaganza more winners per
  ruleset (perf work ongoing). [7]

## World/server behavior

- Faster open-world respawns (esp. low levels) + per-zone population/layer tuning —
  matches ForeverCore's Classic.Respawn.* / Respawn.DynamicOpenWorld. [7][13]
- Dungeon rules: 5 resets/hour (was 10); dungeon kill XP = 60% of Era (was 40%); zero XP if
  mob trivial to any party member; tuned trash respawns (Drowned City 2h). [7]
- 9 new 5-mans (13–60); raids from Dec 9: Barrow Deeps (10p), Hyjal Summit (20p), Onyxia (40p),
  weekly resets; raid difficulties exist; attunements retained. [4][15]
- Innkeeper gossip "Tell me about the dungeons I can explore". [7]
- Death Recap: level-10+ deaths broadcast server-wide with clickable replay (emulator-side
  confirmed; Blizzard HC not live yet). [14]

## Client-side conveniences (server needs packet-level support, not logic)

- Classic vs Enhanced presets; Enhanced = quest POI/objective areas, one-bag, transmog,
  strafe binds, HD models. HD/SD per character via Barbershop. Cooldown Manager + Damage
  Meter built in. Gamepad (beta). [4][5]
- Client features gated by server feature flags — sniff, don't hardcode. [14]

## Deliberate non-features

No flying, no level scaling, cap stays 60, no XP→gold at 60, no cross-faction or
cross-ruleset grouping, Hardcore delayed, raids gated to Dec 9. [1][4]

---

## Sources

1. Choose Your Ruleset — https://worldofwarcraft.blizzard.com/news/24302070
2. Deep Dive Panel Recap — https://worldofwarcraft.blizzard.com/en-us/news/24303313
3. 60.tools game systems index — https://www.60.tools/systems
4. What's Next Panel Recap — https://worldofwarcraft.blizzard.com/news/24303862
5. mgame.gg What Is WoW Forever — https://wow.mgame.gg/guides/what-is-wow-forever
6. 60.tools What changed (+ build-to-build diffs) — https://www.60.tools/changes
7. Official hotfix thread Nov 5–23 (rolling) —
   https://news.blizzard.com/en-us/article/24315281/wow-forever-hotfixes-november-20-2026
8. What's New and What Feels Familiar —
   https://news.blizzard.com/en-us/article/24315821/wow-foreverwhats-new-and-what-feels-familiar
9. Warcraft Tavern hunter pets — https://www.warcrafttavern.com/forever/guides/hunter-pets/
10. Forum: happiness doesn't decay — https://eu.forums.blizzard.com/en/wow/t/641660 ,
    https://us.forums.blizzard.com/en/wow/t/2407560
11. Half-Baked Warcraft pets — https://halfbakedwarcraft.com/news/wow-forever-hunter-pets-stay-happy-without-food/
12. Race/class matrix — https://worldofwarcraft.blizzard.com/news/24304075
13. Wowhead Forever section — https://www.wowhead.com/forever/guide/phase-one-overview-features-rewards
14. Everforge changelog (emulator-side parity notes) — https://wowforever.appverse.uk/changelog
15. worldofforever.com — https://worldofforever.com/patch-notes/ ;
    legacyofwarcraft — https://legacyofwarcraft.com/db/patches/forever-1-60-1.html

Best ongoing sources: the rolling hotfix article (7) and 60.tools /changes build diffs (6).
