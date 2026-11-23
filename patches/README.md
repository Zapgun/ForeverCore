# Source patches (ForeverCore)

Code changes kept as `git apply`-able diffs so they can be re-applied when a new
ForeverCore version lands. Apply in filename order from the ForeverCore repo
root:

    cd F:/_dev/ForeverCore
    git apply ../Karrz-playerbots-wow-forever/patches/0001_*.patch

or `git am < file` if you want them as commits. `sql-changes/` holds the
database-side equivalents.

| File | Change |
|------|--------|
| 0001_spell_tracker_stacking.patch | Forever tracker stacking: creature trackers (aura 44 + Track Hidden 151) stay one-at-a-time; resource finders (aura 45: Find Herbs/Minerals/Fish) get their own exclusive group; Find Treasure (aura 45, misc 6 — dwarf racial) stacks on top of both. Result: 1 Track + 1 Find + Find Treasure can be active at once. |
| 0002_bot_rpg_names.patch | Race/sex-appropriate bot names + surnames: BotNamePool gains a curated per-race name tier (playerbots_race_names, consumed like playerbots_names) ahead of the generic pool, plus a surname generator (whole surnames + compound parts, race-keyed, never consumed). BotComposition::Pick carries surname; BotCharacterFactory writes it into characters.surname inside the create transaction (mirrors HandleCharCreateOpcode); all Roll→Create call sites pass it through. Config: Playerbot.Names.Surnames=1, Playerbot.Names.SurnameCompoundChance=0.5. New `.playerbot selftest botnames <race> <sex> [n]` samples the pools; `selftest namegen` now validates race/sex (invalid sex used to hang the world thread). Needs sql-changes/0073 + 0074 applied to the shared playerbot db. |
