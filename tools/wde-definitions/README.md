# WoW Database Editor (WDE) definitions for WoW Forever Bots

WDE 2024.1.1 has no TrinityCore master editor for quest tables. These files add them,
generated from the live `world` schema (every column checked against the database).

| File | Table(s) |
|---|---|
| quest_template_master.json | quest_template + quest_template_addon (all 140 columns) |
| quest_objectives_master.json | quest_objectives (one row per objective, keyed by QuestID) |
| quest_offer_reward_master.json | quest_offer_reward |
| quest_request_items_master.json | quest_request_items |

## Install
Copy the four JSON files into WDE's `DbDefinitions` folder (next to `WoWDatabaseEditorCore.Avalonia.exe`),
then start WDE and pick core version **TrinityCore master** with the world database on port 3307.

## Safe workflow
Use WDE to generate SQL (Generate query / Copy), save it as the next numbered file in
`sql-changes`, review it, then apply it. Avoid "Save to database" until the editors have been
tested on a copy of the world database.

If the server schema changes, regenerate these files from `information_schema`.
