-- sn_dwarf.sql — dwarf surnames (race 3): whole surnames + compound parts
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Alebelly',3,2),('Anvilsong',3,2),('Barrelbelly',3,2),('Bellowsmoke',3,2),('Bitterbrew',3,2),
('Boldbarrel',3,2),('Bronzebrow',3,2),('Caskhelm',3,2),('Cinderbrew',3,2),('Coalbeard',3,2),
('Copperpot',3,2),('Darkquarry',3,2),('Deepforge',3,2),('Deephammer',3,2),('Drumstout',3,2),
('Emberflint',3,2),('Flintfoot',3,2),('Forgehammer',3,2),('Frostbeard',3,2),('Goldgrubber',3,2),
('Gravelgut',3,2),('Grimaxe',3,2),('Hammerstone',3,2),('Ironbrew',3,2),('Ironhand',3,2),
('Ironjaw',3,2),('Kegbelly',3,2),('Krakbrew',3,2),('Leadfoot',3,2),('Longbeard',3,2),
('Malthorn',3,2),('Maulgrim',3,2),('Moltenshield',3,2),('Oakbarrel',3,2),('Orebender',3,2),
('Pewterpot',3,2),('Rockfist',3,2),('Rustnail',3,2),('Saltbeard',3,2),('Slaghammer',3,2),
('Stonegrip',3,2),('Thundertankard',3,2),('Underhill',3,2),('Whitebeard',3,2),('Winterforge',3,2),
('Whettingstone',3,2),('Yellowsmoke',3,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Ale',0,3),('Anvil',0,3),('Barrel',0,3),('Battle',0,3),('Bellow',0,3),
('Bitter',0,3),('Black',0,3),('Bold',0,3),('Brass',0,3),('Bronze',0,3),
('Cinder',0,3),('Coal',0,3),('Copper',0,3),('Crag',0,3),('Deep',0,3),
('Ember',0,3),('Flint',0,3),('Forge',0,3),('Frost',0,3),('Gold',0,3),
('Granite',0,3),('Gravel',0,3),('Grim',0,3),('Hammer',0,3),('Iron',0,3),
('Keg',0,3),('Lead',0,3),('Molten',0,3),('Oak',0,3),('Ore',0,3),
('Pewter',0,3),('Red',0,3),('Rock',0,3),('Rust',0,3),('Salt',0,3),
('Slag',0,3),('Steel',0,3),('Stone',0,3),('Stout',0,3),('Thunder',0,3),
('Under',0,3),('Winter',0,3),
('axe',1,3),('barrel',1,3),('beard',1,3),('belly',1,3),('bender',1,3),
('boot',1,3),('braid',1,3),('brew',1,3),('brow',1,3),('chin',1,3),
('cleaver',1,3),('crusher',1,3),('fist',1,3),('foot',1,3),('forge',1,3),
('frame',1,3),('grip',1,3),('gut',1,3),('hammer',1,3),('hand',1,3),
('helm',1,3),('hide',1,3),('hook',1,3),('jaw',1,3),('keg',1,3),
('knuckle',1,3),('marrow',1,3),('plate',1,3),('pot',1,3),('quarry',1,3),
('shield',1,3),('shoulder',1,3),('song',1,3),('spine',1,3),('stout',1,3),
('tankard',1,3),('vein',1,3),('wrench',1,3);
