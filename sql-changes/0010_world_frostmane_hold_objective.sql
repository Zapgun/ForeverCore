-- World DB. Quest 287 "Frostmane Hold" was missing the display-only areatrigger objective that
-- every sibling exploration quest has (added for them by 2026_10_25_02_world_classic_quest_objectives_
-- exploration_triggers.sql): "Type 10 with ObjectID -1 credits whichever trigger completes it."
--
-- Effect without this row: the only AREATRIGGER objective (ID 385475, pinned to AreaTrigger 97) has
-- Description=NULL, so the quest log shows no "explore" line at all — the panel marks the quest
-- complete once the 5 headhunters die, yet Senir Whitebeard refuses turn-in because the flag
-- objective was never credited. Entering the *other* mapped trigger (AT 169, south end of the hold)
-- also counts for nothing, since the pinned objective skips it.
--
-- This adds the conventional -1 sibling at the same StorageIndex (1): entering either registered
-- trigger — AT 97 (-5660.3,755.3) or AT 169 (-5586.5,679.3), both inside Frostmane Hold — writes
-- slot 1, the panel shows "Fully explore Frostmane Hold 0/1", and the quest completes.
--
-- Same latent defect exists on other pinned-only quests (25, 437, 455, 503, 1699, 1719, 5156,
-- 6185, 6421, 9260-9265); left untouched pending review.
--
-- Safe to run again (INSERT guarded by NOT EXISTS on a -1 objective for quest 287).
CREATE TABLE IF NOT EXISTS bak_0010_quest_objectives AS SELECT * FROM quest_objectives WHERE ID=90002871;
START TRANSACTION;
INSERT INTO `quest_objectives`
  (`ID`,`QuestID`,`Type`,`Order`,`StorageIndex`,`ObjectID`,`Amount`,`ConditionalAmount`,`Flags`,`Flags2`,`ProgressBarWeight`,`ParentObjectiveID`,`Visible`,`Description`,`VerifiedBuild`)
SELECT 90002871, 287, 10, 1, 1, -1, 1, 0, 0, 0, 0, 0, 1, 'Fully explore Frostmane Hold', 0
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `quest_objectives` WHERE `QuestID`=287 AND `Type`=10 AND `ObjectID`=-1);
COMMIT;
-- Undo: DELETE FROM `quest_objectives` WHERE `ID`=90002871;
