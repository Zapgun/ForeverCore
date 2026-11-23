-- World DB. Fixes the Deeprun Tram (map 369): four of the six tram car spawns were assigned the wrong
-- gameobject entries, so they ran their TransportAnimation paths off the end of the map.
-- The animation data (TransportAnimation.db2) splits the cars into two direction groups:
--   -Y movers: 176080, 176081, 176085 -> belong to the consist parked at the far end (track x=-45.4, y=2473-2512)
--   +Y movers: 176082, 176083, 176084 -> belong to the consist parked at the near end (track x=4.5, y=-11..+28)
-- The baseline spawn table placed them in id order per track, so on each track only the lead car moved
-- correctly while the other two drove past the map edge (y~4976/4994 and y~-2474/-2493), dwelled ~13 s in
-- the void, and rolled back. After the swap each consist keeps its ~20 y formation at both stations.
-- Car placement (initial-move delay order: lead t=0, mid +433 ms, rear +867 ms):
--   track x=-45.4: 176080 @2472.9 (lead, kept), 176081 @2492.8 (mid), 176085 @2512.1 (rear)
--   track x=+4.5:  176083 @-11.3 (rear), 176082 @8.4 (mid), 176084 @28.2 (lead, kept)
-- No linked rows (spawn_group, gameobject_addon, game_event_gameobject) exist for these guids.
-- Safe to run again.
-- Rows changed (id swap, positions unchanged):
--   guid 30018803 (4.5,8.4):      176081 -> 176082
--   guid 30018804 (-45.4,2492.8): 176082 -> 176081
--   guid 30018805 (-45.4,2512.1): 176083 -> 176085
--   guid 30018807 (4.5,-11.3):    176085 -> 176083
CREATE TABLE IF NOT EXISTS bak_0008_gameobject AS SELECT * FROM gameobject WHERE guid IN (30018803,30018804,30018805,30018807);
START TRANSACTION;
UPDATE gameobject SET id=176082 WHERE guid=30018803;
UPDATE gameobject SET id=176083 WHERE guid=30018807;
UPDATE gameobject SET id=176081 WHERE guid=30018804;
UPDATE gameobject SET id=176085 WHERE guid=30018805;
COMMIT;
-- Undo: UPDATE gameobject g JOIN bak_0008_gameobject b ON g.guid=b.guid SET g.id=b.id;
