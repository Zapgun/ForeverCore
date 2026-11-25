-- WoW Classic: emote-format creature_text rows ("%s becomes enraged!", "%s goes into a frenzy!", ...) were
-- ported from VMaNGOS with Type 12 (CHAT_MSG_MONSTER_SAY). In this schema Type is a raw ChatMsg value, so the
-- client shows them as "MobName says: %s becomes enraged!" with the placeholder literal -- for say/yell/whisper
-- the %s is the *target* name (and stays raw when no target is set); only emote types substitute the speaker's
-- own name. classic_broadcast_text_type confirms all of these were ChatType 2 (text emote) in VMaNGOS.
-- Fixed to 16 = CHAT_MSG_MONSTER_EMOTE. The boss-warning rows under 42 (CHAT_MSG_RAID_BOSS_WHISPER, %s = the
-- whispered player) go to 41 = CHAT_MSG_RAID_BOSS_EMOTE to keep boss styling.
-- Seen live as a Shadowhide/Blackrock orc "saying" '%s becomes enraged!'. Safe to run again.
UPDATE `creature_text` SET `Type` = 16
WHERE `Type` IN (12, 14, 15) AND (`Text` LIKE '\%s %' OR `Text` LIKE '\%s''%');

UPDATE `creature_text` SET `Type` = 41
WHERE `Type` = 42 AND `Text` LIKE '%\%s %';
