drop table if exists objects;
create table objects
(
    [object]    text unique primary key not null,
    [object_id] int,
    [class]     text,
    [icon]      text,
    [cursor]    text,
    [actor]     text
);

insert into objects ([object],[object_id],[class],[icon],[cursor],[actor]) values
('IDD_NYSVIAL',0x50,'IDC_NULL','nysvial','nysvial','nysvial'),
('IDD_SCOOPE',0x51,'IDC_NULL','scoopE','scoopE','scoopE'),
('IDD_SCOOPF',0x52,'IDC_NULL','scoopF','scoopF','scoopF'),
('IDD_SPEAKER',0xc8,'IDC_TOKEN','SPEAKER','SPEAKER','SPEAKER'),
('IDD_CITY_KEY_0x200',0x200,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x201',0x201,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x202',0x202,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x203',0x203,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x204',0x204,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x205',0x205,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x206',0x206,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x207',0x207,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x208',0x208,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x209',0x209,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20a',0x20a,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20b',0x20b,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20c',0x20c,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20d',0x20d,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20e',0x20e,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20f',0x20f,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x210',0x210,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x211',0x211,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x212',0x212,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x213',0x213,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x214',0x214,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x215',0x215,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x216',0x216,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x217',0x217,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x218',0x218,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x219',0x219,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21a',0x21a,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21b',0x21b,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21c',0x21c,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21d',0x21d,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21e',0x21e,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21f',0x21f,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x220',0x220,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x221',0x221,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x222',0x222,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x223',0x223,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x224',0x224,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x225',0x225,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x226',0x226,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x227',0x227,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x228',0x228,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x229',0x229,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22a',0x22a,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22b',0x22b,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22c',0x22c,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22d',0x22d,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22e',0x22e,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22f',0x22f,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x230',0x230,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x231',0x231,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x232',0x232,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x233',0x233,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x234',0x234,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x235',0x235,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x236',0x236,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x237',0x237,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x238',0x238,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x239',0x239,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23a',0x23a,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23b',0x23b,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23c',0x23c,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23d',0x23d,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23e',0x23e,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23f',0x23f,'IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CARD00',0x400,'IDC_CARD','CARD00','CARD00','CARD00'),
('IDD_CARD01',0x401,'IDC_CARD','CARD01','CARD01','CARD01'),
('IDD_CARD02',0x402,'IDC_CARD','CARD02','CARD02','CARD02'),
('IDD_CARD03',0x403,'IDC_CARD','CARD03','CARD03','CARD03'),
('IDD_CARD04',0x404,'IDC_CARD','CARD04','CARD04','CARD04'),
('IDD_CARD05',0x405,'IDC_CARD','CARD05','CARD05','CARD05'),
('IDD_CARD06',0x406,'IDC_CARD','CARD06','CARD06','CARD06'),
('IDD_CARD07',0x407,'IDC_CARD','CARD07','CARD07','CARD07'),
('IDD_CARD08',0x408,'IDC_CARD','CARD08','CARD08','CARD08'),
('IDD_CARD09',0x409,'IDC_CARD','CARD09','CARD09','CARD09'),
('IDD_CARD10',0x40a,'IDC_CARD','CARD10','CARD10','CARD10'),
('IDD_CARD11',0x40b,'IDC_CARD','CARD11','CARD11','CARD11'),
('IDD_CARD12',0x40c,'IDC_CARD','CARD12','CARD12','CARD12'),
('IDD_CARD13',0x40d,'IDC_CARD','CARD13','CARD13','CARD13'),
('IDD_CARD14',0x40e,'IDC_CARD','CARD14','CARD14','CARD14'),
('IDD_CARD15',0x40f,'IDC_CARD','CARD15','CARD15','CARD15'),
('IDD_CARD16',0x410,'IDC_CARD','CARD16','CARD16','CARD16'),
('IDD_CARD17',0x411,'IDC_CARD','CARD17','CARD17','CARD17'),
('IDD_CARD18',0x412,'IDC_CARD','CARD18','CARD18','CARD18'),
('IDD_CARD19',0x413,'IDC_CARD','CARD19','CARD19','CARD19'),
('IDD_CARD20',0x414,'IDC_CARD','CARD20','CARD20','CARD20'),
('IDD_CARD21',0x415,'IDC_CARD','CARD21','CARD21','CARD21'),
('IDD_CARD22',0x416,'IDC_CARD','CARD22','CARD22','CARD22'),
('IDD_CARD23',0x417,'IDC_CARD','CARD23','CARD23','CARD23'),
('IDD_CARD24',0x418,'IDC_CARD','CARD24','CARD24','CARD24'),
('IDD_CARD25',0x419,'IDC_CARD','CARD25','CARD25','CARD25'),
('IDD_CARD26',0x41a,'IDC_CARD','CARD26','CARD26','CARD26'),
('IDD_CARD27',0x41b,'IDC_CARD','CARD27','CARD27','CARD27'),
('IDD_CARD28',0x41c,'IDC_CARD','CARD28','CARD28','CARD28'),
('IDD_CARD29',0x41d,'IDC_CARD','CARD29','CARD29','CARD29'),
('IDD_CARD30',0x41e,'IDC_CARD','CARD30','CARD30','CARD30'),
('IDD_HAMMER',0x431,'IDC_NULL','HAMMER','HAMMER','HAMMER'),
('IDD_VIAL2',0x432,'IDC_NULL','VIAL2','VIAL2','VIAL2'),
('IDD_CLOCK',0x433,'IDC_NULL','CLOCK','CLOCK','CLOCK'),
('IDD_LAVA',0x434,'IDC_NULL','LAVA','LAVA','LAVA'),
('IDD_LAMP',0x435,'IDC_NULL','LAMP','LAMP','LAMP'),
('IDD_VASE',0x436,'IDC_NULL','VASE1','VASE1','VASE1'),
('IDD_STATUE',0x437,'IDC_STATUE','STATUE','STATUE','STATUE'),
('IDD_PORTRAIT',0x438,'IDC_NULL','PORT','PORT','PORT'),
('IDD_FAN',0x439,'IDC_NULL','FAN','FAN','FAN'),
('IDD_GASMASK',0x440,'IDC_NULL','H20MASK','H20MASK','H20MASK'),
('IDD_VIAL3',0x441,'IDC_NULL','VIAL3','VIAL3','VIAL3'),
('IDD_VIAL1',0x442,'IDC_NULL','VIAL1','VIAL1','VIAL1'),
('IDD_CHEMV01',0x500,'IDC_CHEM','chemv01','chemv01','chemv01'),
('IDD_CHEMV02',0x501,'IDC_CHEM','chemv02','chemv02','chemv02'),
('IDD_CHEMV03',0x502,'IDC_CHEM','chemv03','chemv03','chemv03'),
('IDD_CHEMV04',0x503,'IDC_CHEM','chemv04','chemv04','chemv04'),
('IDD_CHEMV05',0x504,'IDC_CHEM','chemv05','chemv05','chemv05'),
('IDD_CHEMV06',0x505,'IDC_CHEM','chemv06','chemv06','chemv06'),
('IDD_CHEMV07',0x506,'IDC_CHEM','chemv07','chemv07','chemv07'),
('IDD_CHEMV08',0x507,'IDC_CHEM','chemv08','chemv08','chemv08'),
('IDD_CHEMV09',0x508,'IDC_CHEM','chemv09','chemv09','chemv09'),
('IDD_CHEMV10',0x509,'IDC_CHEM','chemv10','chemv10','chemv10'),
('IDD_CHEMV11',0x50a,'IDC_CHEM','chemv11','chemv11','chemv11'),
('IDD_CHEMV12',0x50b,'IDC_CHEM','chemv12','chemv12','chemv12'),
('IDD_CHEMV13',0x50c,'IDC_CHEM','chemv13','chemv13','chemv13'),
('IDD_CHEMV14',0x50d,'IDC_CHEM','chemv14','chemv14','chemv14'),
('IDD_CHEMV15',0x50e,'IDC_CHEM','chemv15','chemv15','chemv15'),
('IDD_CHEMV16',0x50f,'IDC_CHEM','chemv16','chemv16','chemv16'),
('IDD_CHEMV17',0x510,'IDC_CHEM','chemv17','chemv17','chemv17'),
('IDD_CHEMV18',0x511,'IDC_CHEM','chemv18','chemv18','chemv18'),
('IDD_CHEMV19',0x512,'IDC_CHEM','chemv19','chemv19','chemv19'),
('IDD_CHEMV20',0x513,'IDC_CHEM','chemv20','chemv20','chemv20'),
('IDD_TEMPLATE_01',0x601,'IDC_TEMPLATE','t01','t01','t01'),
('IDD_TEMPLATE_02',0x602,'IDC_TEMPLATE','t02','t02','t02'),
('IDD_TEMPLATE_03',0x603,'IDC_TEMPLATE','t03','t03','t03'),
('IDD_TEMPLATE_04',0x604,'IDC_TEMPLATE','t04','t04','t04'),
('IDD_TEMPLATE_05',0x605,'IDC_TEMPLATE','t05','t05','t05'),
('IDD_TEMPLATE_06',0x606,'IDC_TEMPLATE','t06','t06','t06'),
('IDD_TEMPLATE_07',0x607,'IDC_TEMPLATE','t07','t07','t07'),
('IDD_TEMPLATE_08',0x608,'IDC_TEMPLATE','t08','t08','t08'),
('IDD_TEMPLATE_09',0x609,'IDC_TEMPLATE','t09','t09','t09'),
('IDD_TEMPLATE_10',0x60a,'IDC_TEMPLATE','t10','t10','t10'),
('IDD_TEMPLATE_11',0x60b,'IDC_TEMPLATE','t11','t11','t11'),
('IDD_TEMPLATE_12',0x60c,'IDC_TEMPLATE','t12','t12','t12'),
('IDD_TEMPLATE_13',0x60d,'IDC_TEMPLATE','t13','t13','t13'),
('IDD_TEMPLATE_14',0x60e,'IDC_TEMPLATE','t14','t14','t14'),
('IDD_TEMPLATE_15',0x60f,'IDC_TEMPLATE','t15','t15','t15'),
('IDD_TEMPLATE_16',0x610,'IDC_TEMPLATE','t16','t16','t16'),
('IDD_TEMPLATE_17',0x611,'IDC_TEMPLATE','t17','t17','t17'),
('IDD_TEMPLATE_18',0x612,'IDC_TEMPLATE','t18','t18','t18'),
('IDD_TEMPLATE_19',0x613,'IDC_TEMPLATE','t19','t19','t19'),
('IDD_TEMPLATE_20',0x614,'IDC_TEMPLATE','t20','t20','t20'),
('IDD_TEMPLATE_21',0x615,'IDC_TEMPLATE','t21','t21','t21'),
('IDD_TEMPLATE_22',0x616,'IDC_TEMPLATE','t22','t22','t22'),
('IDD_TEMPLATE_23',0x617,'IDC_TEMPLATE','t23','t23','t23'),
('IDD_TEMPLATE_24',0x618,'IDC_TEMPLATE','t24','t24','t24'),
('IDD_TEMPLATE_25',0x619,'IDC_TEMPLATE','t25','t25','t25'),
('IDD_TEMPLATE_26',0x61a,'IDC_TEMPLATE','t26','t26','t26'),
('IDD_TEMPLATE_27',0x61b,'IDC_TEMPLATE','t27','t27','t27'),
('IDD_TEMPLATE_28',0x61c,'IDC_TEMPLATE','t28','t28','t28'),
('IDD_TEMPLATE_29',0x61d,'IDC_TEMPLATE','t29','t29','t29'),
('IDD_TEMPLATE_30',0x61e,'IDC_TEMPLATE','t30','t30','t30'),
('IDD_TEMPLATE_31',0x61f,'IDC_TEMPLATE','t31','t31','t31'),
('IDD_TEMPLATE_32',0x620,'IDC_TEMPLATE','t32','t32','t32'),
('IDD_TEMPLATE_33',0x621,'IDC_TEMPLATE','t33','t33','t33'),
('IDD_TEMPLATE_34',0x622,'IDC_TEMPLATE','t34','t34','t34'),
('IDD_TEMPLATE_35',0x623,'IDC_TEMPLATE','t35','t35','t35'),
('IDD_TICKLELEAF',0x64f,'IDD_NULL','tickleleaf','tickleleaf','tickleleaf'),
('IDD_MEMSPELL',0x65e,'IDC_SPELL','MEMSPELL','MEMSPELL','MEMSPELL'),
('IDD_MEMFUSE',0x65f,'IDD_NULL','MEMFUSE','MEMFUSE','MEMFUSE'),
('IDD_POLE1',0x1101,'IDC_POLE','pole1cur','pole1cur','pole1lcu'),
('IDD_POLE2',0x1102,'IDC_POLE','pole2cur','pole2cur','pole1lcu'),
('IDD_POLE1B0',0x1110,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B1',0x1111,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B2',0x1112,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B3',0x1113,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B4',0x1114,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B5',0x1115,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B6',0x1116,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B7',0x1117,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B8',0x1118,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B9',0x1119,'IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE2B0',0x1120,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B1',0x1121,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B2',0x1122,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B3',0x1123,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B4',0x1124,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B5',0x1125,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B6',0x1126,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B7',0x1127,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B8',0x1128,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B9',0x1129,'IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_BAIT0',0x1130,'IDC_BAIT','grubanm','grubanm','grubanm'),
('IDD_BAIT1',0x1131,'IDC_BAIT','buginv','buginv','buginv'),
('IDD_BAIT2',0x1132,'IDC_BAIT','wormwigl','wormwigl','wormwigl'),
('IDD_BAIT3',0x1133,'IDC_BAIT','flop','flop','flop'),
('IDD_BAIT4',0x1134,'IDC_BAIT','luur1','luur1','luur1'),
('IDD_BAIT5',0x1135,'IDC_BAIT','luur2','luur2','luur2'),
('IDD_BAIT6',0x1136,'IDC_BAIT','luur3','luur3','luur3'),
('IDD_BAIT7',0x1137,'IDC_BAIT','luur4','luur4','luur4'),
('IDD_BAIT8',0x1138,'IDC_BAIT','grubanm','grubanm','grubanm'),
('IDD_BAIT9',0x1139,'IDC_BAIT','grubanm','grubanm','grubanm'),
('IDD_FISH1',0x1140,'IDC_FISH','fish1a','fish1a','fish1a'),
('IDD_FISH2',0x1141,'IDC_FISH','fish2a','fish2a','fish2a'),
('IDD_FISH3',0x1142,'IDC_FISH','fish3a','fish3a','fish3a'),
('IDD_FISH4',0x1143,'IDC_FISH','fish4a','fish4a','fish4a'),
('IDD_FISH5',0x1144,'IDC_FISH','fish5a','fish5a','fish5a'),
('IDD_FISH6',0x1145,'IDC_FISH','fish6a','fish6a','fish6a'),
('IDD_FISH7',0x1146,'IDC_FISH','fish7a','fish7a','fish7a'),
('IDD_FISH8',0x1147,'IDC_FISH','fish8a','fish8a','fish8a'),
('IDD_FISH9',0x1148,'IDC_FISH','fish9a','fish9a','fish9a'),
('IDD_FISH10',0x1149,'IDC_FISH','fish10a','fish10a','fish10a'),
('IDD_FISHASH1',0x1160,'IDC_FISHASH','fpouch1','fpouch1','fpouch1'),
('IDD_FISHASH2',0x1161,'IDC_FISHASH','fpouch2','fpouch2','fpouch2'),
('IDD_FISHASH3',0x1162,'IDC_FISHASH','fpouch3','fpouch3','fpouch3'),
('IDD_FISHASH4',0x1163,'IDC_FISHASH','fpouch4','fpouch4','fpouch4'),
('IDD_FISHASH5',0x1164,'IDC_FISHASH','fpouch5','fpouch5','fpouch5'),
('IDD_FISHASH6',0x1165,'IDC_FISHASH','fpouch6','fpouch6','fpouch6'),
('IDD_FISHASH7',0x1166,'IDC_FISHASH','fpouch7','fpouch7','fpouch7'),
('IDD_FISHASH8',0x1167,'IDC_FISHASH','fpouch8','fpouch8','fpouch8'),
('IDD_FISHASH9',0x1168,'IDC_FISHASH','fpouch9','fpouch9','fpouch9'),
('IDD_FISHASH10',0x1169,'IDC_FISHASH','fpouch10','fpouch10','fpouch10'),
('IDD_PICK',0x116f,'IDC_NULL','PICK','PICK','PICK'),
('IDD_LOG',0x1170,'','smalllog','smalllog','smalllog'),
('IDD_MATCH',0x1171,'','torch','torch','torch'),
('IDD_WATER',0x1172,'','water','water','water'),
('IDD_BUCKE',0x1173,'','BUCKE','BUCKE','BUCKE'),
('IDD_BUCKF',0x1174,'','BUCKF','BUCKF','BUCKF'),
('IDD_SHOVEL',0x1175,'','shovelb','shovelb','shovelb'),
('IDD_BOMB1',0x1176,'IDC_BOMB','BOMB1','BOMB1','BOMB1'),
('IDD_BOMB2',0x1177,'IDC_BOMB','BOMB2','BOMB2','BOMB2'),
('IDD_H2OMASK',0x1178,'','H2OMASK','H2OMASK','H2OMASK'),
('IDD_NYSMASK',0x1179,'','NYSMASK','NYSMASK','NYSMASK'),
('IDD_VESTCAN',0x1201,'','VESTCAN','VESTCAN','VESTCAN'),
('IDD_VESTH2O',0x1202,'','VESTH2O','VESTH2O','VESTH2O'),
('IDD_CITLOCK',0x1700,'IDC_LOCK','CITLOCK','CITLOCK','CITLOCK'),
('IDD_CITKEY',0x1701,'','CITKEY','CITKEY','CITKEY'),
('IDD_VILLOCK',0x1702,'IDC_LOCK','VILLOCK','VILLOCK','VILLOCK'),
('IDD_VILKEY',0x1703,'','VILKEY','VILKEY','VILKEY'),
('IDD_ROCK',0x1704,'','ROCK','ROCK','ROCK'),
('IDD_FERNLEAF',0x2120,'','fernleaf','fernleaf','fernleaf'),
('IDD_GLEAFSPT',0x2121,'','gleafspt','gleafspt','gleafspt'),
('IDD_OMUSHSPT',0x2122,'','omushspt','omushspt','omushspt'),
('IDD_PFLWRSPT',0x2123,'','pflwrspt','pflwrspt','pflwrspt'),
('IDD_PLEAFSPT',0x2124,'','pleafspt','pleafspt','pleafspt'),
('IDD_BLUEBERRY',0x2125,'','bluberry','bluberry','bluberry'),
('IDD_REDBERRY',0x2126,'','redberry','redberry','redberry'),
('IDD_WFLWRSPT',0x2127,'','wflwrspt','wflwrspt','wflwrspt'),
('IDD_YFLWRSPT',0x2128,'','yflwrspt','yflwrspt','yflwrspt'),
('IDD_YMUSHSPT',0x2129,'','ymushspt','ymushspt','ymushspt'),
('IDD_ROOTBLUE',0x2138,'IDC_NULL','ROOTBLUE','ROOTBLUE','ROOTBLUE'),
('IDD_ROOTWHITE',0x2139,'IDC_NULL','ROOTWHITE','ROOTWHITE','ROOTWHITE'),
('IDD_ROOTORANGE',0x213a,'IDC_NULL','ROOTORANGE','ROOTORANGE','ROOTORANGE'),
('IDD_AMULET',0x2148,'IDC_NULL','AMULET1','AMULET1','AMULET1'),
('IDD_EMERALD',0x214a,'IDC_NULL','EMERALD','EMERALD','EMERALD'),
('IDD_RUBY',0x214b,'IDC_NULL','RUBY','RUBY','RUBY'),
('IDD_NYPLANT',0x214d,'IDC_NULL','nyplant','nyplant','nyplant'),
('IDD_ENCSTONE',0x214e,'IDC_NULL','encstone','encstone','encstone'),
('IDD_MAPBTN',0x217c,'IDC_NULL','mapbtn','mapbtn','mapbtn'),
('IDD_SCR001',0x2201,'IDC_SCROLL','SCR001','SCR001','SCR001'),
('IDD_SCR002',0x2202,'IDC_SCROLL','SCR002','SCR002','SCR002'),
('IDD_SCR003',0x2203,'IDC_SCROLL','SCR003','SCR003','SCR003'),
('IDD_SCR004',0x2204,'IDC_SCROLL','SCR004','SCR004','SCR004'),
('IDD_SCR005',0x2205,'IDC_SCROLL','SCR005','SCR005','SCR005'),
('IDD_SCR006',0x2206,'IDC_SCROLL','SCR006','SCR006','SCR006'),
('IDD_SCR007',0x2207,'IDC_SCROLL','SCR007','SCR007','SCR007'),
('IDD_SCR008',0x2208,'IDC_SCROLL','SCR008','SCR008','SCR008'),
('IDD_SCR009',0x2209,'IDC_SCROLL','SCR009','SCR009','SCR009'),
('IDD_SCR010',0x2210,'IDC_SCROLL','SCR010','SCR010','SCR010'),
('IDD_SCR011',0x2211,'IDC_SCROLL','SCR011','SCR011','SCR011'),
('IDD_SCR012',0x2212,'IDC_SCROLL','SCR012','SCR012','SCR012'),
('IDD_SCR013',0x2213,'IDC_SCROLL','SCR013','SCR013','SCR013'),
('IDD_SCR014',0x2214,'IDC_SCROLL','SCR014','SCR014','SCR014'),
('IDD_SCR015',0x2215,'IDC_SCROLL','SCR015','SCR015','SCR015'),
('IDD_SCR016',0x2216,'IDC_SCROLL','SCR016','SCR016','SCR016'),
('IDD_SCR017',0x2217,'IDC_SCROLL','SCR017','SCR017','SCR017'),
('IDD_SCR018',0x2218,'IDC_SCROLL','SCR018','SCR018','SCR018'),
('IDD_SCR019',0x2219,'IDC_SCROLL','SCR019','SCR019','SCR019'),
('IDD_SCR020',0x2220,'IDC_SCROLL','SCR020','SCR020','SCR020'),
('IDD_SCR021',0x2221,'IDC_SCROLL','SCR021','SCR021','SCR021'),
('IDD_SCR022',0x2222,'IDC_SCROLL','SCR022','SCR022','SCR022'),
('IDD_EYEFUSE',0x2400,'IDC_NULL','eyefuse','eyefuse','eyefuse'),
('IDD_EYEWAND',0x2403,'IDC_NULL','eyewand','eyewand','eyewand'),
('IDD_CROWBAR',0x2510,'IDC_NULL','Crowbar','Crowbar','Crowbar'),
('IDD_GOPAB',0x3e82,'IDC_NULL','GOPAB','GOPAB','GOPAB'),
('IDD_GOPAG',0x3e83,'IDC_NULL','GOPAG','GOPAG','GOPAG'),
('IDD_GOPAR',0x3e84,'IDC_NULL','GOPAR','GOPAR','GOPAR'),
('IDD_LUNCHCRUMBS',0x3e8a,'ISA_BAIT','LUNCHCRUMBS','LUNCHCRUMBS','LUNCHCRUMBS'),
('IDD_SEED',0x3e8c,'IDC_NULL','SEED','SEED','SEED'),
('IDD_LEAF',0x484b,'','LEAF','LEAF','LEAF'),
('IDD_FLOWERD',0x484c,'','FLOWERD','FLOWERD','FLOWERD'),
('IDD_FLOWERR',0x484d,'','FLOWERR','FLOWERR','FLOWERR'),
('IDD_WILDBERRY',0x485f,'','blueberry2','blueberry2','blueberry2'),
('IDD_ROOTDBL',0x4860,'','ROOTDBL','ROOTDBL','ROOTDBL'),
('IDD_SICKLE',0x490c,'IDC_NULL','sickle','sickle','sickle'),
('IDD_WKING',0x6000,'IDC_TOKEN','Sking','Sking','Sking'),
('IDD_WQUEEN',0x6001,'IDC_TOKEN','Squeen','Squeen','Squeen'),
('IDD_WPAWN',0x6002,'IDC_TOKEN','fnttnb18','fnttnb18','fnttnb18'),
('IDD_WROOK',0x6003,'IDC_TOKEN','Srook','Srook','Srook'),
('IDD_WKNIGHT',0x6004,'IDC_TOKEN','Sknight','Sknight','Sknight'),
('IDD_WBISHOP',0x6005,'IDC_TOKEN','Sbishop','Sbishop','Sbishop'),
('IDD_WKINGME',0x6006,'IDC_TOKEN','Pkingme','Pkingme','Pkingme'),
('IDD_BKING',0x6008,'IDC_TOKEN','Gking','Gking','Gking'),
('IDD_BQUEEN',0x6009,'IDC_TOKEN','Gqueen','Gqueen','Gqueen'),
('IDD_BPAWN',0x600a,'IDC_TOKEN','Gpawn','Gpawn','Gpawn'),
('IDD_BROOK',0x600b,'IDC_TOKEN','Grook','Grook','Grook'),
('IDD_BKNIGHT',0x600c,'IDC_TOKEN','Gknight','Gknight','Gknight'),
('IDD_BBISHOP',0x600d,'IDC_TOKEN','Gbishop','Gbishop','Gbishop'),
('IDD_BKINGME',0x600e,'IDC_TOKEN','Bkingme','Bkingme','Bkingme'),
('IDD_REVERSIA',0x6010,'IDC_TOKEN','ReversiA','ReversiA','ReversiA'),
('IDD_REVERSIB',0x6011,'IDC_TOKEN','ReversiB','ReversiB','ReversiB'),
('IDD_GOBTRFLY',0x6012,'IDC_TOKEN','GoBtrfly','GoBtrfly','GoBtrfly'),
('IDD_GODRAGON',0x6013,'IDC_TOKEN','GoDragon','GoDragon','GoDragon'),
('IDD_SPINSPELL',0x7000,'IDC_SPELL','spinspel','spinspel','spinspel'),
('IDD_SPINNER',0x7001,'IDC_SPELL','h2oSp01','h2oSp01','h2oSp01'),
('IDD_FREQUENCY',0x7002,'IDC_SPELL','Beemer','Beemer','Beemer'),
('IDD_SPIRIT0',0x7770,'IDC_SPELL','Spirit1','Spirit1','Spirit1'),
('IDD_SPIRIT1',0x7771,'IDC_SPELL','Spirit1','Spirit1','Spirit1'),
('IDD_SPIRIT2',0x7772,'IDC_SPELL','Spirit1','Spirit1','Spirit1'),
('IDD_SPIRIT3',0x7773,'IDC_SPELL','Spirit1','Spirit1','Spirit1'),
('IDD_SPRINGS',0x7774,'IDC_SPELL','SpRings','SpRings','SpRings'),
('IDD_SPELL01',0x7777,'IDC_SPELL','Spell01','Spell01','Spell01'),
('IDD_SPELL02',0x7778,'IDC_SPELL','Spell02','Spell02','Spell02'),
('IDD_SPELL03',0x7779,'IDC_SPELL','Spell03','Spell03','Spell03'),
('IDD_SPELL04',0x777a,'IDC_SPELL','Spell04','Spell04','Spell04'),
('IDD_SPELL05',0x777b,'IDC_SPELL','Spell05','Spell05','Spell05'),
('IDD_SPELL06',0x777c,'IDC_SPELL','Spell06','Spell06','Spell06'),
('IDD_SPELL07',0x777d,'IDC_SPELL','Spell07','Spell07','Spell07'),
('IDD_SPELL08',0x777e,'IDC_SPELL','Spell08','Spell08','Spell08'),
('IDD_SPELL09',0x777f,'IDC_SPELL','Spell09','Spell09','Spell09'),
('IDD_SPELL10',0x7780,'IDC_SPELL','Spell10','Spell10','Spell10'),
('IDD_SPELx01',0x7787,'IDC_SPELL','Spelx01','Spelx01','Spelx01'),
('IDD_SPELx02',0x7788,'IDC_SPELL','Spelx02','Spelx02','Spelx02'),
('IDD_SPELx03',0x7789,'IDC_SPELL','Spelx03','Spelx03','Spelx03'),
('IDD_SPELx04',0x778a,'IDC_SPELL','Spelx04','Spelx04','Spelx04'),
('IDD_SPELx05',0x778b,'IDC_SPELL','Spelx05','Spelx05','Spelx05'),
('IDD_SPELx06',0x778c,'IDC_SPELL','Spelx06','Spelx06','Spelx06'),
('IDD_SPELx07',0x778d,'IDC_SPELL','Spelx07','Spelx07','Spelx07'),
('IDD_SPELx08',0x778e,'IDC_SPELL','Spelx08','Spelx08','Spelx08'),
('IDD_SPELx09',0x778f,'IDC_SPELL','Spelx09','Spelx09','Spelx09'),
('IDD_SPELx10',0x7790,'IDC_SPELL','Spelx10','Spelx10','Spelx10'),
('IDD_ENCHANT',0x7791,'IDC_SPELL','enchant','enchant','enchant'),
('IDD_STALKER',0x7792,'IDC_SPELL','stalk','stalk','stalk'),
('IDD_BLINDNESS',0x7793,'IDC_SPELL','blind','blind','blind'),
('IDD_HOLDING',0x7794,'IDC_SPELL','holding','holding','holding'),
('IDD_TRANSFER',0x7795,'IDC_SPELL','transfer','transfer','transfer'),
('IDD_ALARM',0x7796,'IDC_SPELL','Spelx06','Spelx06','Spelx06'),
('IDD_RECORDER',0x7797,'IDC_SPELL','Spelx07','Spelx07','Spelx07'),
('IDD_TELEKINESIS',0x7798,'IDC_SPELL','tele','tele','tele'),
('IDD_EXPLOSION',0x7799,'IDC_SPELL','Spelx09','Spelx09','Spelx09'),
('IDD_LOCK',0x779a,'IDC_SPELL','Spelx10','Spelx10','Spelx10'),
('IDD_UNLOCK',0x779b,'IDC_SPELL','Spelx01','Spelx01','Spelx01'),
('IDD_PROTECT',0x779c,'IDC_SPELL','Spelx02','Spelx02','Spelx02'),
('IDD_DEATH',0x779d,'IDC_SPELL','skull','skull','skull'),
('IDD_INVISIBLE',0x779e,'IDC_SPELL','Spelx04','Spelx04','Spelx04'),
('IDD_STRENGTH',0x779f,'IDC_SPELL','Spelx05','Spelx05','Spelx05'),
('IDD_BANISHMENT',0x77a0,'IDC_SPELL','skull','skull','skull'),
('IDD_MINDREAD',0x77a1,'IDC_SPELL','mind','mind','mind'),
('IDD_HALUCINATE',0x77a2,'IDC_SPELL','redeye','redeye','redeye'),
('IDD_NYBREATH',0x77a3,'IDC_SPELL','Spelx09','Spelx09','Spelx09'),
('IDD_WETBREATH',0x77a4,'IDC_SPELL','Spelx10','Spelx10','Spelx10'),
('IDD_EYESPELL',0x77a5,'IDC_SPELL','eyespell','eyespell','eyespell');