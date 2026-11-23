# GM commands: quick reference

These are for WoW Forever Bots. Account 138 (Tagrin) has GM level 3, so every command below works.
Type them in game chat. In the worldserver console window you can type them without the leading dot.

`<...>` means required and `[...]` means optional. Most commands act on your current target. If nothing is targeted, they act on you.

## GM mode

| Command | What it does |
|---|---|
| `.gm on` / `.gm off` | GM mode on or off. Mobs ignore you and you get the GM tag. It stays on after you log out. |
| `.gm` | Shows whether GM mode is on |
| `.gm visible off` / `.gm visible on` | Invisible to players and bots, or visible again |
| `.gm fly on` / `.gm fly off` | Lets you fly |
| `.gm chat on` / `off` | GM badge in chat |
| `.gm ingame` | Lists GMs who are online |
| `.help <command>` | Help for one command, for example `.help go` |
| `.commands` | Lists every command you can use |

## Teleporting

| Command | What it does |
|---|---|
| `.go creature <spawnId>` | Takes you to one creature spawn (the GUID from `.npc info`) |
| `.go creature id <entry>` | Takes you to the first spawn of a creature type |
| `.go gameobject <spawnId>` / `.go gameobject id <entry>` | The same for objects |
| `.go xyz <x> <y> [z] [map]` | Takes you to world coordinates. Map 0 is Eastern Kingdoms, 1 is Kalimdor. |
| `.go zonexy <x> <y> [zoneId]` | Takes you to map percentages, for example `.go zonexy 42 48` for the spot you're in now |
| `.go quest <questId>` | Takes you to a quest's objective area |
| `.go graveyard <id>` / `.go taxinode <id>` | Takes you to a graveyard or flight point |
| `.go offset <forward> [sideways] [up]` | Moves you a few yards from where you stand |
| `.tele <name>` | Takes you to a saved location, for example `.tele ironforge` |
| `.lookup tele <part of name>` | Finds saved location names |
| `.tele add <name>` / `.tele del <name>` | Saves or deletes a location at your position |
| `.appear <player>` | Takes you to a player or bot |
| `.summon <player>` | Brings a player or bot to you |
| `.recall` | Takes you back to where you were before your last teleport |
| `.gps` | Shows your coordinates, map, zone and area. Send me this to point out a spot. |

## Inspecting spawns

| Command | What it does |
|---|---|
| `.npc info` | Spawn ID (GUID), entry, level, faction and so on for the targeted mob. Send me the GUID. |
| `.npc near [yards]` | Lists creature spawns near you, with GUIDs |
| `.gobject near [yards]` | Lists object spawns near you, such as Fallen Logs |
| `.gobject info [entry]` | Details for an object |
| `.list creature <entry> [max]` | Every spawn of a creature type, with coordinates |
| `.list object <entry> [max]` | The same for objects |
| `.list respawns [yards]` | Pending respawn timers near you |
| `.distance` | Distance to your target |
| `.npc showloot` | Loot on a dead targeted mob |
| `.respawn` | Respawns the targeted mob, or everything near you if nothing is targeted |
| `.npc evade` | Resets a stuck mob |

### Spawn edits that save straight to the world database

These skip the `sql-changes` folder. A database rebuild or a move to another machine loses them unless I write them into an SQL file.

| Command | What it does |
|---|---|
| `.npc delete` | Deletes the targeted creature's spawn permanently |
| `.npc move` | Moves the targeted creature's spawn to where you stand |
| `.npc set spawntime <seconds>` | Changes respawn time |
| `.npc set wanderdistance <yards>` | Changes how far it wanders. 0 means it stands still. |
| `.npc add <entry>` | Adds a new spawn where you stand (`.npc add temp <entry>` adds one that isn't saved) |
| `.gobject delete <spawnId>` / `.gobject move <spawnId>` / `.gobject add <entry>` | The same for objects |

The safer way is to send me the GUIDs with what you want changed. I'll add a numbered file to `sql-changes` so it can be applied again later.

## Looking things up

`.lookup creature <name>`, `.lookup item <name>`, `.lookup object <name>`, `.lookup quest <name>`, `.lookup spell <name>`, `.lookup area <name>`, `.lookup map <name>`, `.lookup tele <name>`, `.lookup player <name>`

Each one returns IDs you can use in the other commands. For example, `.lookup item Fallen Log` gives the item ID for `.additem`.

## Your character

| Command | What it does |
|---|---|
| `.levelup [levels]` | Gives levels to you or your target, for example `.levelup 10` |
| `.character level <name> <level>` | Sets a character's exact level |
| `.additem <itemId> [count]` | Gives an item |
| `.additem set <itemSetId>` | Gives a whole item set |
| `.modify money <copper>` | Gives money: 10000 copper is 1 gold. A minus sign takes money away. |
| `.modify speed all <1-50>` | Speed multiplier. `.modify speed all 1` sets it back to normal. |
| `.modify scale <value>` | Model size |
| `.modify mount <displayId> <speed>` | Puts you on any mount |
| `.learn <spellId>` / `.unlearn <spellId>` | Learns or forgets a spell |
| `.learn all mylevel` | Every class spell up to your level |
| `.learn all recipes <profession>` / `.learn all crafts` | Profession recipes |
| `.setskill <skillId> <value> [max]` | Sets a skill level |
| `.reset talents` / `.reset spells` / `.reset stats` | Resets your character |
| `.cooldown` | Clears spell cooldowns |
| `.cheat god on` / `off` | You can't die |
| `.cheat casttime on`, `.cheat cooldown on`, `.cheat power on` | Instant casts, no cooldowns, no mana cost |
| `.cheat waterwalk on`, `.cheat taxi on`, `.cheat explore 1` | Water walking, every flight path, the whole map revealed |
| `.die` / `.revive` | Kills or revives your target or you |
| `.unstuck` | Moves you out of a spot you're stuck in |
| `.save` | Saves your character now |

## Quests

| Command | What it does |
|---|---|
| `.quest add <questId>` | Adds a quest to your log |
| `.quest complete <questId>` | Completes its objectives |
| `.quest reward <questId>` | Turns it in and gives the reward |
| `.quest remove <questId>` | Drops it from your log, or resets it if it's already done |

## Server

| Command | What it does |
|---|---|
| `.server info` | Uptime, players online and server version |
| `.server motd` | Shows the message of the day |
| `.server restart <seconds>` | Restarts with a countdown, for example `.server restart 30`. Your launcher's auto-restart brings it back up. |
| `.server shutdown <seconds>` | Shuts down |
| `.server restart cancel` / `.server shutdown cancel` | Stops the countdown |
| `.saveall` | Saves every character |
| `.kick <player>` | Disconnects a player |

Spawn changes in `sql-changes` only show up after a restart.

## Bots

Commands any player can use:

| Command | What it does |
|---|---|
| `.bot add <class> [tank\|healer\|dps] [race] [male\|female]` | Adds a bot to your group, for example `.bot add priest healer` |
| `.bot list` | Your bots |
| `.bot summon all\|saved\|<name>` | Brings your bots to you |
| `.bot goto <name>` | Takes you to one of your bots |
| `.bot dismiss <name\|all>` | Sends bots away |
| `.bot save <name>` / `.bot unsave <name>` | Keeps a bot for later, or stops keeping it |
| `.bot gear` / `.bot regear` | Shows bot gear, or re-picks it |
| `.bot lfg [tank\|healer\|dps]` | Dungeon finder with bots. The role is your own. |
| `.bot dungeon <name\|any> [role]` | Starts a dungeon run with bots. `.bot dungeon list`, `leave` and `cancel` also work. |
| `.bot lead [on\|pause\|off]` | Hands the dungeon lead to your tank bot, or takes it back |
| `.bot language auto\|en\|ru` | Bot chat language |
| `.w <name> <text>` / `.tell <name> <text>` | Whispers someone. This client's own `/w` doesn't work. |
| `.playerbot summon <AltName>` | Logs in one of your own alts as a bot |

GM-only commands:

| Command | What it does |
|---|---|
| `.bot population off\|low\|medium\|high` | World bot population until the next restart. The launcher's Bots setting decides it at each start. |
| `.playerbot status` / `.playerbot count` | Bot fleet overview |
| `.playerbot list [page]` | Every bot |
| `.playerbot inspect <name>` / `.playerbot diag <name>` | Details on one bot |
| `.playerbot login <name>` / `.playerbot logout <name>` | Logs one bot in or out |
| `.playerbot level <name> <level>` | Sets a bot's level. The bot has to be logged in. |
| `.playerbot delete <name>` | Deletes a bot character. Log it out first. |
