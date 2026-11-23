-- sn_troll.sql — troll surnames (race 8): whole surnames + compound parts
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Bloodhex',8,2),('Darkfetish',8,2),('Doomfetish',8,2),('Gravesnake',8,2),('Hexbinder',8,2),
('Hexweaver',8,2),('Jujudoctor',8,2),('Mambozen',8,2),('Mojo''kan',8,2),('Rattlesnake',8,2),
('Shadowjuje',8,2),('Spirithex',8,2),('Voodoomask',8,2),('Zan''mojo',8,2),('Zul''tembe',8,2),
('Bloodmojo',8,2),('Doomsnake',8,2),('Fetishweaver',8,2),('Hexmojo',8,2),('Junglefang',8,2),
('Mojohex',8,2),('Shadowfang',8,2),('Snakebinder',8,2),('Spiritmojo',8,2),('Voodoohex',8,2),
('Zul''fetish',8,2),('Darkmojo',8,2),('Gravemojo',8,2),('Hexsnake',8,2),('Jujufang',8,2),
('Mojoweaver',8,2),('Shadowmojo',8,2),('Snakehex',8,2),('Spiritfang',8,2),('Voodoosnake',8,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Blood',0,8),('Dark',0,8),('Doom',0,8),('Fetish',0,8),('Grave',0,8),
('Hex',0,8),('Jinx',0,8),('Juju',0,8),('Jungle',0,8),('Mamba',0,8),
('Mojo',0,8),('Rattle',0,8),('Shadow',0,8),('Snake',0,8),('Spirit',0,8),
('Voodoo',0,8),('Zan',0,8),('Zul',0,8),
('binder',1,8),('bok',1,8),('doctor',1,8),('fang',1,8),('fetish',1,8),
('hex',1,8),('jin',1,8),('kan',1,8),('mask',1,8),('mojo',1,8),
('snake',1,8),('tek',1,8),('tembe',1,8),('weave',1,8),('weaver',1,8),
('zen',1,8),('zin',1,8),('zul',1,8);
