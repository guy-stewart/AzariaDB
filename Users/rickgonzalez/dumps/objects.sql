drop table if exists objects;
create table objects
(
    [object]    text unique primary key not null,
    [class]     text,
    [icon]      text,
    [cursor]    text,
    [actor]     text
);

insert into objects ([object],[class],[icon],[cursor],[actor]) values
('IDD_CARD00','IDC_CARD','CARD00','CARD00','CARD00'),
('IDD_CARD01','IDC_CARD','CARD01','CARD01','CARD01'),
('IDD_CARD02','IDC_CARD','CARD02','CARD02','CARD02'),
('IDD_CARD03','IDC_CARD','CARD03','CARD03','CARD03'),
('IDD_CARD04','IDC_CARD','CARD04','CARD04','CARD04'),
('IDD_CARD05','IDC_CARD','CARD05','CARD05','CARD05'),
('IDD_CARD06','IDC_CARD','CARD06','CARD06','CARD06'),
('IDD_CARD07','IDC_CARD','CARD07','CARD07','CARD07'),
('IDD_CARD08','IDC_CARD','CARD08','CARD08','CARD08'),
('IDD_CARD09','IDC_CARD','CARD09','CARD09','CARD09'),
('IDD_CARD10','IDC_CARD','CARD10','CARD10','CARD10'),
('IDD_CARD11','IDC_CARD','CARD11','CARD11','CARD11'),
('IDD_CARD12','IDC_CARD','CARD12','CARD12','CARD12'),
('IDD_CARD13','IDC_CARD','CARD13','CARD13','CARD13'),
('IDD_CARD14','IDC_CARD','CARD14','CARD14','CARD14'),
('IDD_CARD15','IDC_CARD','CARD15','CARD15','CARD15'),
('IDD_CARD16','IDC_CARD','CARD16','CARD16','CARD16'),
('IDD_CARD17','IDC_CARD','CARD17','CARD17','CARD17'),
('IDD_CARD18','IDC_CARD','CARD18','CARD18','CARD18'),
('IDD_CARD19','IDC_CARD','CARD19','CARD19','CARD19'),
('IDD_CARD20','IDC_CARD','CARD20','CARD20','CARD20'),
('IDD_CARD21','IDC_CARD','CARD21','CARD21','CARD21'),
('IDD_CARD22','IDC_CARD','CARD22','CARD22','CARD22'),
('IDD_CARD23','IDC_CARD','CARD23','CARD23','CARD23'),
('IDD_CARD24','IDC_CARD','CARD24','CARD24','CARD24'),
('IDD_CARD25','IDC_CARD','CARD25','CARD25','CARD25'),
('IDD_CARD26','IDC_CARD','CARD26','CARD26','CARD26'),
('IDD_CARD27','IDC_CARD','CARD27','CARD27','CARD27'),
('IDD_CARD28','IDC_CARD','CARD28','CARD28','CARD28'),
('IDD_CARD29','IDC_CARD','CARD29','CARD29','CARD29'),
('IDD_CARD30','IDC_CARD','CARD30','CARD30','CARD30'),
('IDD_HAMMER','IDC_NULL','HAMMER','HAMMER','HAMMER'),
('IDD_VIAL2','IDC_NULL','VIAL2','VIAL2','VIAL2'),
('IDD_CLOCK','IDC_NULL','CLOCK','CLOCK','CLOCK'),
('IDD_LAVA','IDC_NULL','LAVA','LAVA','LAVA'),
('IDD_LAMP','IDC_NULL','LAMP','LAMP','LAMP'),
('IDD_VASE','IDC_NULL','VASE1','VASE1','VASE1'),
('IDD_STATUE','IDC_STATUE','STATUE','STATUE','STATUE'),
('IDD_PORTRAIT','IDC_NULL','PORT','PORT','PORT'),
('IDD_FAN','IDC_NULL','FAN','FAN','FAN'),
('IDD_GASMASK','IDC_NULL','H20MASK','H20MASK','H20MASK'),
('IDD_VIAL3','IDC_NULL','VIAL3','VIAL3','VIAL3'),
('IDD_VIAL1','IDC_NULL','VIAL1','VIAL1','VIAL1'),
('IDD_NYSVIAL','IDC_NULL','nysvial','nysvial','nysvial'),
('IDD_SCOOPE','IDC_NULL','scoopE','scoopE','scoopE'),
('IDD_SCOOPF','IDC_NULL','scoopF','scoopF','scoopF'),
('IDD_SPEAKER','IDC_TOKEN','SPEAKER','SPEAKER','SPEAKER'),
('IDD_H2OMASK','IDC_NULL','H2OMASK','H2OMASK','H2OMASK'),
('IDD_CHEMV01','IDC_CHEM','chemv01','chemv01','chemv01'),
('IDD_CHEMV02','IDC_CHEM','chemv02','chemv02','chemv02'),
('IDD_CHEMV03','IDC_CHEM','chemv03','chemv03','chemv03'),
('IDD_CHEMV04','IDC_CHEM','chemv04','chemv04','chemv04'),
('IDD_CHEMV05','IDC_CHEM','chemv05','chemv05','chemv05'),
('IDD_CHEMV06','IDC_CHEM','chemv06','chemv06','chemv06'),
('IDD_CHEMV07','IDC_CHEM','chemv07','chemv07','chemv07'),
('IDD_CHEMV08','IDC_CHEM','chemv08','chemv08','chemv08'),
('IDD_CHEMV09','IDC_CHEM','chemv09','chemv09','chemv09'),
('IDD_CHEMV10','IDC_CHEM','chemv10','chemv10','chemv10'),
('IDD_CHEMV11','IDC_CHEM','chemv11','chemv11','chemv11'),
('IDD_CHEMV12','IDC_CHEM','chemv12','chemv12','chemv12'),
('IDD_CHEMV13','IDC_CHEM','chemv13','chemv13','chemv13'),
('IDD_CHEMV14','IDC_CHEM','chemv14','chemv14','chemv14'),
('IDD_CHEMV15','IDC_CHEM','chemv15','chemv15','chemv15'),
('IDD_CHEMV16','IDC_CHEM','chemv16','chemv16','chemv16'),
('IDD_CHEMV17','IDC_CHEM','chemv17','chemv17','chemv17'),
('IDD_CHEMV18','IDC_CHEM','chemv18','chemv18','chemv18'),
('IDD_CHEMV19','IDC_CHEM','chemv19','chemv19','chemv19'),
('IDD_CHEMV20','IDC_CHEM','chemv20','chemv20','chemv20'),
('IDD_TEMPLATE_01','IDC_TEMPLATE','t01','t01','t01'),
('IDD_TEMPLATE_02','IDC_TEMPLATE','t02','t02','t02'),
('IDD_TEMPLATE_03','IDC_TEMPLATE','t03','t03','t03'),
('IDD_TEMPLATE_04','IDC_TEMPLATE','t04','t04','t04'),
('IDD_TEMPLATE_05','IDC_TEMPLATE','t05','t05','t05'),
('IDD_TEMPLATE_06','IDC_TEMPLATE','t06','t06','t06'),
('IDD_TEMPLATE_07','IDC_TEMPLATE','t07','t07','t07'),
('IDD_TEMPLATE_08','IDC_TEMPLATE','t08','t08','t08'),
('IDD_TEMPLATE_09','IDC_TEMPLATE','t09','t09','t09'),
('IDD_TEMPLATE_10','IDC_TEMPLATE','t10','t10','t10'),
('IDD_TEMPLATE_11','IDC_TEMPLATE','t11','t11','t11'),
('IDD_TEMPLATE_12','IDC_TEMPLATE','t12','t12','t12'),
('IDD_TEMPLATE_13','IDC_TEMPLATE','t13','t13','t13'),
('IDD_TEMPLATE_14','IDC_TEMPLATE','t14','t14','t14'),
('IDD_TEMPLATE_15','IDC_TEMPLATE','t15','t15','t15'),
('IDD_TEMPLATE_16','IDC_TEMPLATE','t16','t16','t16'),
('IDD_TEMPLATE_17','IDC_TEMPLATE','t17','t17','t17'),
('IDD_TEMPLATE_18','IDC_TEMPLATE','t18','t18','t18'),
('IDD_TEMPLATE_19','IDC_TEMPLATE','t19','t19','t19'),
('IDD_TEMPLATE_20','IDC_TEMPLATE','t20','t20','t20'),
('IDD_TEMPLATE_21','IDC_TEMPLATE','t21','t21','t21'),
('IDD_TEMPLATE_22','IDC_TEMPLATE','t22','t22','t22'),
('IDD_TEMPLATE_23','IDC_TEMPLATE','t23','t23','t23'),
('IDD_TEMPLATE_24','IDC_TEMPLATE','t24','t24','t24'),
('IDD_TEMPLATE_25','IDC_TEMPLATE','t25','t25','t25'),
('IDD_TEMPLATE_26','IDC_TEMPLATE','t26','t26','t26'),
('IDD_TEMPLATE_27','IDC_TEMPLATE','t27','t27','t27'),
('IDD_TEMPLATE_28','IDC_TEMPLATE','t28','t28','t28'),
('IDD_TEMPLATE_29','IDC_TEMPLATE','t29','t29','t29'),
('IDD_TEMPLATE_30','IDC_TEMPLATE','t30','t30','t30'),
('IDD_TEMPLATE_31','IDC_TEMPLATE','t31','t31','t31'),
('IDD_TEMPLATE_32','IDC_TEMPLATE','t32','t32','t32'),
('IDD_TEMPLATE_33','IDC_TEMPLATE','t33','t33','t33'),
('IDD_TEMPLATE_34','IDC_TEMPLATE','t34','t34','t34'),
('IDD_TEMPLATE_35','IDC_TEMPLATE','t35','t35','t35'),
('IDD_TICKLELEAF','IDD_NULL','tickleleaf','tickleleaf','tickleleaf'),
('IDD_MEMSPELL','IDC_SPELL','MEMSPELL','MEMSPELL','MEMSPELL'),
('IDD_MEMFUSE','IDD_NULL','MEMFUSE','MEMFUSE','MEMFUSE'),
('IDD_POLE1','IDC_POLE','pole1cur','pole1cur','pole1lcu'),
('IDD_POLE2','IDC_POLE','pole2cur','pole2cur','pole1lcu'),
('IDD_POLE1B0','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B1','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B2','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B3','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B4','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B5','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B6','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B7','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B8','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE1B9','IDC_POLE','pole1cur','pole1cur','pole1lcb'),
('IDD_POLE2B0','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B1','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B2','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B3','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B4','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B5','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B6','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B7','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B8','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_POLE2B9','IDC_POLE','pole2cur','pole2cur','pole1lcb'),
('IDD_NYSMASK','IDC_NULL','NYSMASK','NYSMASK','NYSMASK'),
('IDD_BAIT0','IDC_BAIT','grubanm','grubanm','grubanm'),
('IDD_BAIT1','IDC_BAIT','buginv','buginv','buginv'),
('IDD_BAIT2','IDC_BAIT','wormwigl','wormwigl','wormwigl'),
('IDD_BAIT3','IDC_BAIT','flop','flop','flop'),
('IDD_BAIT4','IDC_BAIT','luur1','luur1','luur1'),
('IDD_BAIT5','IDC_BAIT','luur2','luur2','luur2'),
('IDD_BAIT6','IDC_BAIT','luur3','luur3','luur3'),
('IDD_BAIT7','IDC_BAIT','luur4','luur4','luur4'),
('IDD_BAIT8','IDC_BAIT','grubanm','grubanm','grubanm'),
('IDD_BAIT9','IDC_BAIT','grubanm','grubanm','grubanm'),
('IDD_FISH1','IDC_FISH','fish1a','fish1a','fish1a'),
('IDD_FISH2','IDC_FISH','fish2a','fish2a','fish2a'),
('IDD_FISH3','IDC_FISH','fish3a','fish3a','fish3a'),
('IDD_FISH4','IDC_FISH','fish4a','fish4a','fish4a'),
('IDD_FISH5','IDC_FISH','fish5a','fish5a','fish5a'),
('IDD_FISH6','IDC_FISH','fish6a','fish6a','fish6a'),
('IDD_FISH7','IDC_FISH','fish7a','fish7a','fish7a'),
('IDD_FISH8','IDC_FISH','fish8a','fish8a','fish8a'),
('IDD_FISH9','IDC_FISH','fish9a','fish9a','fish9a'),
('IDD_FISH10','IDC_FISH','fish10a','fish10a','fish10a'),
('IDD_FISHASH1','IDC_FISHASH','fpouch1','fpouch1','fpouch1'),
('IDD_FISHASH2','IDC_FISHASH','fpouch2','fpouch2','fpouch2'),
('IDD_FISHASH3','IDC_FISHASH','fpouch3','fpouch3','fpouch3'),
('IDD_FISHASH4','IDC_FISHASH','fpouch4','fpouch4','fpouch4'),
('IDD_FISHASH5','IDC_FISHASH','fpouch5','fpouch5','fpouch5'),
('IDD_FISHASH6','IDC_FISHASH','fpouch6','fpouch6','fpouch6'),
('IDD_FISHASH7','IDC_FISHASH','fpouch7','fpouch7','fpouch7'),
('IDD_FISHASH8','IDC_FISHASH','fpouch8','fpouch8','fpouch8'),
('IDD_FISHASH9','IDC_FISHASH','fpouch9','fpouch9','fpouch9'),
('IDD_FISHASH10','IDC_FISHASH','fpouch10','fpouch10','fpouch10'),
('IDD_PICK','ISA_TOOL_STRIKER','PICK','PICK','PICK'),
('IDD_LOG','','smalllog','smalllog','smalllog'),
('IDD_MATCH','','torch','torch','torch'),
('IDD_WATER','','water','water','water'),
('IDD_BUCKE','','BUCKE','BUCKE','BUCKE'),
('IDD_BUCKF','','BUCKF','BUCKF','BUCKF'),
('IDD_SHOVEL','ISA_TOOL_DIGGER','shovelb','shovelb','shovelb'),
('IDD_BOMB1','IDC_BOMB','BOMB1','BOMB1','BOMB1'),
('IDD_BOMB2','IDC_BOMB','BOMB2','BOMB2','BOMB2'),
('IDD_VESTCAN','','VESTCAN','VESTCAN','VESTCAN'),
('IDD_VESTH2O','','VESTH2O','VESTH2O','VESTH2O'),
('IDD_CITLOCK','IDC_LOCK','CITLOCK','CITLOCK','CITLOCK'),
('IDD_CITKEY','','CITKEY','CITKEY','CITKEY'),
('IDD_VILLOCK','IDC_LOCK','VILLOCK','VILLOCK','VILLOCK'),
('IDD_VILKEY','','VILKEY','VILKEY','VILKEY'),
('IDD_ROCK','','ROCK','ROCK','ROCK'),
('IDD_FERNLEAF','','fernleaf','fernleaf','fernleaf'),
('IDD_GLEAFSPT','','gleafspt','gleafspt','gleafspt'),
('IDD_OMUSHSPT','','omushspt','omushspt','omushspt'),
('IDD_PFLWRSPT','','pflwrspt','pflwrspt','pflwrspt'),
('IDD_PLEAFSPT','','pleafspt','pleafspt','pleafspt'),
('IDD_BLUEBERRY','','bluberry','bluberry','bluberry'),
('IDD_REDBERRY','','redberry','redberry','redberry'),
('IDD_WFLWRSPT','','wflwrspt','wflwrspt','wflwrspt'),
('IDD_YFLWRSPT','','yflwrspt','yflwrspt','yflwrspt'),
('IDD_YMUSHSPT','','ymushspt','ymushspt','ymushspt'),
('IDD_ROOTBLUE','IDC_NULL','ROOTBLUE','ROOTBLUE','ROOTBLUE'),
('IDD_ROOTWHITE','IDC_NULL','ROOTWHITE','ROOTWHITE','ROOTWHITE'),
('IDD_ROOTORANGE','IDC_NULL','ROOTORANGE','ROOTORANGE','ROOTORANGE'),
('IDD_AMULET','IDC_NULL','AMULET1','AMULET1','AMULET1'),
('IDD_EMERALD','IDC_NULL','EMERALD','EMERALD','EMERALD'),
('IDD_RUBY','IDC_NULL','RUBY','RUBY','RUBY'),
('IDD_NYPLANT','IDC_NULL','nyplant','nyplant','nyplant'),
('IDD_ENCSTONE','IDC_NULL','encstone','encstone','encstone'),
('IDD_MAPBTN','IDC_NULL','mapbtn','mapbtn','mapbtn'),
('IDD_SCR001','IDC_SCROLL','SCR001','SCR001','SCR001'),
('IDD_SCR002','IDC_SCROLL','SCR002','SCR002','SCR002'),
('IDD_SCR003','IDC_SCROLL','SCR003','SCR003','SCR003'),
('IDD_SCR004','IDC_SCROLL','SCR004','SCR004','SCR004'),
('IDD_SCR005','IDC_SCROLL','SCR005','SCR005','SCR005'),
('IDD_SCR006','IDC_SCROLL','SCR006','SCR006','SCR006'),
('IDD_SCR007','IDC_SCROLL','SCR007','SCR007','SCR007'),
('IDD_SCR008','IDC_SCROLL','SCR008','SCR008','SCR008'),
('IDD_SCR009','IDC_SCROLL','SCR009','SCR009','SCR009'),
('IDD_SCR010','IDC_SCROLL','SCR010','SCR010','SCR010'),
('IDD_SCR011','IDC_SCROLL','SCR011','SCR011','SCR011'),
('IDD_SCR012','IDC_SCROLL','SCR012','SCR012','SCR012'),
('IDD_SCR013','IDC_SCROLL','SCR013','SCR013','SCR013'),
('IDD_SCR014','IDC_SCROLL','SCR014','SCR014','SCR014'),
('IDD_SCR015','IDC_SCROLL','SCR015','SCR015','SCR015'),
('IDD_SCR016','IDC_SCROLL','SCR016','SCR016','SCR016'),
('IDD_SCR017','IDC_SCROLL','SCR017','SCR017','SCR017'),
('IDD_SCR018','IDC_SCROLL','SCR018','SCR018','SCR018'),
('IDD_SCR019','IDC_SCROLL','SCR019','SCR019','SCR019'),
('IDD_SCR020','IDC_SCROLL','SCR020','SCR020','SCR020'),
('IDD_SCR021','IDC_SCROLL','SCR021','SCR021','SCR021'),
('IDD_SCR022','IDC_SCROLL','SCR022','SCR022','SCR022'),
('IDD_EYEFUSE','IDC_NULL','eyefuse','eyefuse','eyefuse'),
('IDD_EYEWAND','IDC_NULL','eyewand','eyewand','eyewand'),
('IDD_CROWBAR','ISA_TOOL_PRYER','Crowbar','Crowbar','Crowbar'),
('IDD_GOPAB','IDC_NULL','GOPAB','GOPAB','GOPAB'),
('IDD_GOPAG','IDC_NULL','GOPAG','GOPAG','GOPAG'),
('IDD_GOPAR','IDC_NULL','GOPAR','GOPAR','GOPAR'),
('IDD_LUNCHCRUMBS','ISA_BAIT','LUNCHCRUMBS','LUNCHCRUMBS','LUNCHCRUMBS'),
('IDD_SEED','IDC_NULL','SEED','SEED','SEED'),
('IDD_LEAF','','LEAF','LEAF','LEAF'),
('IDD_FLOWERD','','FLOWERD','FLOWERD','FLOWERD'),
('IDD_FLOWERR','','FLOWERR','FLOWERR','FLOWERR'),
('IDD_WILDBERRY','','blueberry2','blueberry2','blueberry2'),
('IDD_ROOTDBL','','ROOTDBL','ROOTDBL','ROOTDBL'),
('IDD_SICKLE','IDC_NULL','sickle','sickle','sickle'),
('IDD_WKING','IDC_TOKEN','Sking','Sking','Sking'),
('IDD_WQUEEN','IDC_TOKEN','Squeen','Squeen','Squeen'),
('IDD_WPAWN','IDC_TOKEN','fnttnb18','fnttnb18','fnttnb18'),
('IDD_WROOK','IDC_TOKEN','Srook','Srook','Srook'),
('IDD_WKNIGHT','IDC_TOKEN','Sknight','Sknight','Sknight'),
('IDD_WBISHOP','IDC_TOKEN','Sbishop','Sbishop','Sbishop'),
('IDD_WKINGME','IDC_TOKEN','Pkingme','Pkingme','Pkingme'),
('IDD_BKING','IDC_TOKEN','Gking','Gking','Gking'),
('IDD_BQUEEN','IDC_TOKEN','Gqueen','Gqueen','Gqueen'),
('IDD_BPAWN','IDC_TOKEN','Gpawn','Gpawn','Gpawn'),
('IDD_BROOK','IDC_TOKEN','Grook','Grook','Grook'),
('IDD_BKNIGHT','IDC_TOKEN','Gknight','Gknight','Gknight'),
('IDD_BBISHOP','IDC_TOKEN','Gbishop','Gbishop','Gbishop'),
('IDD_BKINGME','IDC_TOKEN','Bkingme','Bkingme','Bkingme'),
('IDD_REVERSIA','IDC_TOKEN','ReversiA','ReversiA','ReversiA'),
('IDD_REVERSIB','IDC_TOKEN','ReversiB','ReversiB','ReversiB'),
('IDD_GOBTRFLY','IDC_TOKEN','GoBtrfly','GoBtrfly','GoBtrfly'),
('IDD_GODRAGON','IDC_TOKEN','GoDragon','GoDragon','GoDragon'),
('IDD_DICE','IDC_NULL','die','die','die'),
('IDD_SHAKE','IDC_NULL','diceshake','diceshake','diceshake'),
('IDD_BLOBBALL','IDC_NULL','blobball','blobball','blobball'),
('IDD_STAMP','IDC_NULL','STAMP','STAMP','STAMP'),
('IDD_POTTALIS1','IDC_NULL','pottalis1','pottalis1','pottalis1'),
('IDD_POTTALIS2','IDC_NULL','pottalis2','pottalis2','pottalis2'),
('IDD_POTTALIS3','IDC_NULL','pottalis3','pottalis3','pottalis3'),
('IDD_POTTALIS4','IDC_NULL','pottalis4','pottalis4','pottalis4'),
('IDD_POTTALIS5','IDC_NULL','pottalis5','pottalis5','pottalis5'),
('IDD_POTTALIS6','IDC_NULL','pottalis6','pottalis6','pottalis6'),
('IDD_EXPLOA','IDC_NULL','EXPLOA','EXPLOA','EXPLOA'),
('IDD_SPARKLE','IDC_NULL','SPARK','SPARK','SPARK'),
('IDD_SPRINGS','IDC_NULL','SpRings','SpRings','SpRings'),
('IDD_SPELL01','IDC_SPELL','Spell01','Spell01','Spell01'),
('IDD_SPELL02','IDC_SPELL','Spell02','Spell02','Spell02'),
('IDD_SPELL03','IDC_SPELL','Spell03','Spell03','Spell03'),
('IDD_SPELL04','IDC_SPELL','Spell04','Spell04','Spell04'),
('IDD_SPELL05','IDC_SPELL','Spell05','Spell05','Spell05'),
('IDD_SPELL06','IDC_SPELL','Spell06','Spell06','Spell06'),
('IDD_SPELL07','IDC_SPELL','Spell07','Spell07','Spell07'),
('IDD_SPELL08','IDC_SPELL','Spell08','Spell08','Spell08'),
('IDD_SPELL09','IDC_SPELL','Spell09','Spell09','Spell09'),
('IDD_SPELL10','IDC_SPELL','Spell10','Spell10','Spell10'),
('IDD_SPELx01','IDC_SPELL','Spelx01','Spelx01','Spelx01'),
('IDD_SPELx02','IDC_SPELL','Spelx02','Spelx02','Spelx02'),
('IDD_SPELx03','IDC_SPELL','Spelx03','Spelx03','Spelx03'),
('IDD_SPELx04','IDC_SPELL','Spelx04','Spelx04','Spelx04'),
('IDD_SPELx05','IDC_SPELL','Spelx05','Spelx05','Spelx05'),
('IDD_SPELx06','IDC_SPELL','Spelx06','Spelx06','Spelx06'),
('IDD_SPELx07','IDC_SPELL','Spelx07','Spelx07','Spelx07'),
('IDD_SPELx08','IDC_SPELL','Spelx08','Spelx08','Spelx08'),
('IDD_SPELx09','IDC_SPELL','Spelx09','Spelx09','Spelx09'),
('IDD_SPELx10','IDC_SPELL','Spelx10','Spelx10','Spelx10'),
('IDD_ENCHANT','IDC_SPELL','enchant','enchant','enchant'),
('IDD_STALKER','IDC_SPELL','stalk','stalk','stalk'),
('IDD_BLINDNESS','IDC_SPELL','blind','blind','blind'),
('IDD_HOLDING','IDC_SPELL','holding','holding','holding'),
('IDD_TRANSFER','IDC_SPELL','transfer','transfer','transfer'),
('IDD_ALARM','IDC_NULL','ALMOFF','ALMOFF','ALMOFF'),
('IDD_RECORDER','IDC_SPELL','Spelx07','Spelx07','Spelx07'),
('IDD_TELEKINESIS','IDC_SPELL','tele','tele','tele'),
('IDD_EXPLOSION','IDC_SPELL','starspl1','starspl1','starspl1'),
('IDD_LOCK','IDC_SPELL','radio','radio','radio'),
('IDD_UNLOCK','IDC_SPELL','Spelx01','Spelx01','Spelx01'),
('IDD_PROTECT','IDC_SPELL','protect','protect','protect'),
('IDD_DEATH','IDC_SPELL','skull','skull','skull'),
('IDD_INVISIBLE','IDC_SPELL','spinspel','spinspel','spinspel'),
('IDD_STRENGTH','IDC_SPELL','muscle','muscle','muscle'),
('IDD_BANISHMENT','IDC_SPELL','skull','skull','skull'),
('IDD_MINDREAD','IDC_SPELL','mind','mind','mind'),
('IDD_HALUCINATE','IDC_SPELL','redeye','redeye','redeye'),
('IDD_NYBREATH','IDC_SPELL','nys','nys','nys'),
('IDD_WETBREATH','IDC_SPELL','water','water','water'),
('IDD_EYESPELL','IDC_SPELL','eyespell','eyespell','eyespell'),
('IDD_SANDDIRT','IDC_NULL','sanddirt','sanddirt','sanddirt'),
('IDD_SANDDIRT2','IDC_NULL','sanddirt2','sanddirt2','sanddirt2'),
('IDD_SANDDIRT3','IDC_NULL','sanddirt3','sanddirt3','sanddirt3'),
('IDD_SANDDIRTGRS','IDC_NULL','sanddirtgrs','sanddirtgrs','sanddirtgrs'),
('IDD_SANDDIRTMOON','IDC_NULL','sanddirtMoon','sanddirtMoon','sanddirtMoon'),
('IDD_SANDDIRTGRSDK','IDC_NULL','sanddirtgrsdk','sanddirtgrsdk','sanddirtgrsdk'),
('IDD_SANDROCK1','IDC_NULL','sandrock1','sandrock1','sandrock1'),
('IDD_SANDROCK2','IDC_NULL','sandrock2','sandrock2','sandrock2'),
('IDD_SANDROCK3','IDC_NULL','sandrock3','sandrock3','sandrock3'),
('IDD_SANDDIRTBIG','IDC_NULL','sanddirtbig','sanddirtbig','sanddirtbig'),
('IDD_LIGHTER','IDC_NULL','lighter','lighter','lighter'),
('IDD_PLAYER_W','IDC_NULL','player_w','player_w','player_w'),
('IDD_PLAYER_B','IDC_NULL','player_b','player_b','player_b'),
('IDD_DIARY1','IDC_NULL','DIARY1','DIARY1','DIARY1'),
('IDD_DIARY2','IDC_NULL','DIARY2','DIARY2','DIARY2'),
('IDD_DIARY3','IDC_NULL','DIARY3','DIARY3','DIARY3'),
('IDD_DIARY4','IDC_NULL','DIARY4','DIARY4','DIARY4'),
('IDD_DIARY5','IDC_NULL','DIARY5','DIARY5','DIARY5'),
('IDD_DIARY6','IDC_NULL','DIARY4','DIARY4','DIARY4'),
('IDD_DIARY7','IDC_NULL','DIARY4','DIARY4','DIARY4'),
('IDD_ROSEBUSH','IDC_NULL','roseBush','roseBush','roseBush'),
('IDD_FLOWERPLANT','IDC_NULL','flowerplant','flowerplant','flowerplant'),
('IDD_CITY_KEY_0','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_1','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_2','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_3','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_4','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_5','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_6','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_7','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_8','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_9','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_10','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_11','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_12','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_13','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_14','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_15','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_16','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_17','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_18','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_19','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_20','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_21','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_22','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_23','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_24','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_25','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_26','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_27','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_28','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_29','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_30','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_31','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_32','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_33','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_34','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_35','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_36','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_37','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_38','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_39','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_40','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_41','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_42','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_43','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_44','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_45','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_46','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_47','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_48','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_49','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_50','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_51','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_52','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_53','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_54','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_55','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_56','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_57','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_58','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_59','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_60','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_61','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_62','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_63','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_GVIAL','IDC_SPELL','GVIAL','GVIAL','GVIAL');