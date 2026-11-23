-- sn_human.sql — human surnames (race 1): whole surnames + compound parts
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Ashford',1,2),('Blackwood',1,2),('Brackwell',1,2),('Brightwood',1,2),('Carver',1,2),
('Coldwell',1,2),('Cromley',1,2),('Crowe',1,2),('Dalton',1,2),('Decker',1,2),
('Dunmore',1,2),('Fairbrook',1,2),('Fairwind',1,2),('Farmer',1,2),('Fletcher',1,2),
('Goodwin',1,2),('Greystone',1,2),('Harlow',1,2),('Hartley',1,2),('Hawthorne',1,2),
('Hayward',1,2),('Highvale',1,2),('Hollis',1,2),('Kettleman',1,2),('Langston',1,2),
('Lightfoot',1,2),('Lockwood',1,2),('Longstreet',1,2),('Marshfield',1,2),('Miller',1,2),
('Mirewood',1,2),('Northwall',1,2),('Oakley',1,2),('Redfield',1,2),('Salisbury',1,2),
('Sheldon',1,2),('Stonewall',1,2),('Talbot',1,2),('Thatcher',1,2),('Wainwright',1,2),
('Westbrook',1,2),('Whitfield',1,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Ash',0,1),('Black',0,1),('Bright',0,1),('Brook',0,1),('Cold',0,1),
('Crow',0,1),('East',0,1),('Fair',0,1),('Field',0,1),('Fox',0,1),
('Gray',0,1),('Green',0,1),('Grim',0,1),('Hart',0,1),('Hawk',0,1),
('Hearth',0,1),('High',0,1),('Holly',0,1),('Kettle',0,1),('Lang',0,1),
('Light',0,1),('Lock',0,1),('Long',0,1),('Marsh',0,1),('Mill',0,1),
('North',0,1),('Oak',0,1),('Red',0,1),('Stone',0,1),('Thatch',0,1),
('Wain',0,1),('West',0,1),('Whit',0,1),('Win',0,1),
('brook',1,1),('bury',1,1),('comb',1,1),('croft',1,1),('dale',1,1),
('down',1,1),('field',1,1),('ford',1,1),('gate',1,1),('ham',1,1),
('hill',1,1),('holt',1,1),('land',1,1),('ley',1,1),('man',1,1),
('mill',1,1),('more',1,1),('stead',1,1),('stone',1,1),('stow',1,1),
('ton',1,1),('vale',1,1),('wall',1,1),('ward',1,1),('well',1,1),
('wick',1,1),('wood',1,1),('worth',1,1);
