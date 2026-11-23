-- sn_undead.sql — undead surnames (race 5): whole surnames + compound parts
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Ashdown',5,2),('Ashenfell',5,2),('Blackvein',5,2),('Bleakmore',5,2),('Coffinshaw',5,2),
('Coldgrave',5,2),('Crowsbane',5,2),('Dampmere',5,2),('Darkhallow',5,2),('Direwind',5,2),
('Dreadmore',5,2),('Dustshroud',5,2),('Evenfall',5,2),('Fellbrook',5,2),('Frostvein',5,2),
('Ghastwell',5,2),('Gloomrest',5,2),('Gravemore',5,2),('Gravewind',5,2),('Hollowfell',5,2),
('Morrowsong',5,2),('Mournvale',5,2),('Nightshade',5,2),('Palewind',5,2),('Ratcatcher',5,2),
('Rotwell',5,2),('Shadebourne',5,2),('Shadowend',5,2),('Sorrowfield',5,2),('Stillsong',5,2),
('Stillwater',5,2),('Thorngrave',5,2),('Tombwalker',5,2),('Undercroft',5,2),('Vexhart',5,2),
('Withermere',5,2),('Wormwood',5,2),('Ashenbourne',5,2),('Bleakhollow',5,2),('Coldmere',5,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Ash',0,5),('Bleak',0,5),('Carrion',0,5),('Cold',0,5),('Crow',0,5),
('Dark',0,5),('Dire',0,5),('Dusk',0,5),('Dust',0,5),('Even',0,5),
('Fell',0,5),('Frost',0,5),('Ghast',0,5),('Gloom',0,5),('Grave',0,5),
('Grey',0,5),('Hollow',0,5),('Mourn',0,5),('Night',0,5),('Pale',0,5),
('Rat',0,5),('Rot',0,5),('Shade',0,5),('Sorrow',0,5),('Still',0,5),
('Thorn',0,5),('Tomb',0,5),('Under',0,5),('Wither',0,5),('Worm',0,5),
('bane',1,5),('bourne',1,5),('breeze',1,5),('crest',1,5),('croft',1,5),
('down',1,5),('fall',1,5),('fell',1,5),('field',1,5),('grave',1,5),
('hallow',1,5),('hollow',1,5),('mere',1,5),('more',1,5),('rest',1,5),
('shade',1,5),('shaw',1,5),('shroud',1,5),('song',1,5),('vale',1,5),
('vein',1,5),('walker',1,5),('well',1,5),('wind',1,5),('wood',1,5),
('wright',1,5);
