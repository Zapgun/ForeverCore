-- undo_0076_world_note_riddle_poi.sql — restores the baseline POI state
-- before 0076_world_note_riddle_poi.sql (WORLD db).
--
-- Removes our 70124-tagged rows and puts back the original (wrong-camp)
-- 79008 pin exactly as it was.

DELETE FROM quest_poi WHERE QuestID IN (79007, 79008) AND VerifiedBuild = 70124;
DELETE FROM quest_poi_points WHERE QuestID IN (79007, 79008) AND VerifiedBuild = 70124;

INSERT INTO quest_poi (QuestID, BlobIndex, Idx1, ObjectiveIndex, QuestObjectiveID, QuestObjectID, MapID, UiMapID, Priority, Flags, WorldEffectID, PlayerConditionID, NavigationPlayerConditionID, SpawnTrackingID, AlwaysAllowMergingBlobs, VerifiedBuild) VALUES
(79008, 0, 0, -1, 0, 0, 0, 1436, 0, 0, 0, 0, 0, 0, 0, 0),
(79008, 0, 1, 32, 0, 0, 0, 1436, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, Z, VerifiedBuild) VALUES
(79008, 0, 0, -10581, 1708, 41, 0),
(79008, 1, 0, -10581, 1708, 41, 0);
