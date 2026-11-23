# namegen — bot name seed drafts

Per-race/sex name data for the V2 bot name generator (code side:
`patches/0002_bot_rpg_names.patch`). Drafts are small, individually runnable
`INSERT IGNORE` files so they're easy to review and hand-edit; `merge.py`
concatenates them into `../0074_playerbot_rpg_names_data.sql`.

Apply order on the shared playerbot DB (`Playerbot.SharedDatabase`):

    0073_playerbot_rpg_names.sql       # tables
    0074_playerbot_rpg_names_data.sql  # this merged seed data

## Files

| Pattern        | Target table                  | Contents |
|----------------|-------------------------------|----------|
| `fn_<race>_m.sql` / `fn_<race>_f.sql` | `playerbots_race_names` | first names for that race+sex (`race` = ChrRaces id, `gender` 0/1) |
| `sn_<race>.sql`     | `playerbots_surnames`, `playerbots_surname_parts` | whole surnames + compound halves (`half` 0=prefix, 1=suffix) |

Race ids: 1 Human, 2 Orc, 3 Dwarf, 4 Night Elf, 5 Undead, 6 Tauren,
7 Gnome, 8 Troll, 95 Skyborne-A (High Order), 96 Skyborne-H (Windshaper).

## Conventions

- First names: max 12 chars (the `name` column and `MAX_PLAYER_NAME` cap).
  Consumed uniquely like `playerbots_names` — a name serves exactly one bot.
  Keep them race-flavoured; avoid famous NPC names (Wrynn, Hellscream, ...).
- Surnames: prefix parts capitalised, suffix parts lowercase ("Iron"+"vein"
  -> "Ironvein"). Never consumed — reuse freely.
- `gender=2` = unisex row. `race=0` = any race (used sparingly).

Re-generate after edits:

    python merge.py
