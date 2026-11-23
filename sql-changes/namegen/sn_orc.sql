-- sn_orc.sql — orc surnames (race 2): whole surnames + compound parts
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Axegrinder',2,2),('Battlefang',2,2),('Blackhowl',2,2),('Bloodmaw',2,2),('Bloodrage',2,2),
('Bonecrusher',2,2),('Darkmaul',2,2),('Doomfist',2,2),('Dreadtusk',2,2),('Firemaul',2,2),
('Grimfist',2,2),('Grimskull',2,2),('Ironjaw',2,2),('Ironmaul',2,2),('Rageclaw',2,2),
('Rocksmash',2,2),('Scarshield',2,2),('Skullcleaver',2,2),('Spinesnap',2,2),('Stonefist',2,2),
('Stormfist',2,2),('Thunderfist',2,2),('Tuskbreaker',2,2),('Warbringer',2,2),('Warscar',2,2),
('Wolfbane',2,2),('Wolfslayer',2,2),('Axebite',2,2),('Bloodtusk',2,2),('Bonegrinder',2,2),
('Darkrage',2,2),('Doommaul',2,2),('Goremaul',2,2),('Grimtusk',2,2),('Hellfist',2,2),
('Irontusk',2,2),('Ragehowl',2,2),('Skullmaul',2,2),('Warrunner',2,2),('Wolfrunner',2,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Axe',0,2),('Battle',0,2),('Black',0,2),('Blood',0,2),('Bone',0,2),
('Dark',0,2),('Doom',0,2),('Dread',0,2),('Fire',0,2),('Gore',0,2),
('Grim',0,2),('Hell',0,2),('Iron',0,2),('Rage',0,2),('Rock',0,2),
('Scar',0,2),('Skull',0,2),('Spine',0,2),('Stone',0,2),('Storm',0,2),
('Thunder',0,2),('Tusk',0,2),('War',0,2),('Wolf',0,2),
('bane',1,2),('bite',1,2),('breaker',1,2),('cleaver',1,2),('crusher',1,2),
('fang',1,2),('fist',1,2),('fury',1,2),('grinder',1,2),('howl',1,2),
('jaw',1,2),('maw',1,2),('maul',1,2),('rage',1,2),('rend',1,2),
('ripper',1,2),('runner',1,2),('scar',1,2),('shield',1,2),('slayer',1,2),
('smash',1,2),('snap',1,2),('tusk',1,2);
