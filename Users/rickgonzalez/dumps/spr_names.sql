drop table if exists spr_names;
create table spr_names
(
    [name]      text unique primary key not null,
    [value]     text,
    [id]        int
);

insert into spr_names values ('IDS_AFISH1','fish1a',0x1140);
insert into spr_names values ('IDS_AFISH10','fish10a',0x1149);
insert into spr_names values ('IDS_AFISH2','fish2a',0x1141);
insert into spr_names values ('IDS_AFISH3','fish3a',0x1142);
insert into spr_names values ('IDS_AFISH4','fish4a',0x1143);
insert into spr_names values ('IDS_AFISH5','fish5a',0x1144);
insert into spr_names values ('IDS_AFISH6','fish6a',0x1145);
insert into spr_names values ('IDS_AFISH7','fish7a',0x1146);
insert into spr_names values ('IDS_AFISH8','fish8a',0x1147);
insert into spr_names values ('IDS_AFISH9','fish9a',0x1148);
insert into spr_names values ('IDS_ALARM','Spelx06',0x7796);
insert into spr_names values ('IDS_AMULET','AMULET1',0x2148);
insert into spr_names values ('IDS_AMULETBIN','AMULET2',0x2149);
insert into spr_names values ('IDS_AURA1','aa_00',0x1da);
insert into spr_names values ('IDS_AURA1+1','aa_01',0x1db);
insert into spr_names values ('IDS_AURA1+10','aa_10',0x1e4);
insert into spr_names values ('IDS_AURA1+11','aa_11',0x1e5);
insert into spr_names values ('IDS_AURA1+12','aa_12',0x1e6);
insert into spr_names values ('IDS_AURA1+13','aa_13',0x1e7);
insert into spr_names values ('IDS_AURA1+14','aa_14',0x1e8);
insert into spr_names values ('IDS_AURA1+15','aa_15',0x1e9);
insert into spr_names values ('IDS_AURA1+16','aa_16',0x1ea);
insert into spr_names values ('IDS_AURA1+17','aa_17',0x1eb);
insert into spr_names values ('IDS_AURA1+18','aa_18',0x1ec);
insert into spr_names values ('IDS_AURA1+19','aa_19',0x1ed);
insert into spr_names values ('IDS_AURA1+2','aa_02',0x1dc);
insert into spr_names values ('IDS_AURA1+20','aa_20',0x1ee);
insert into spr_names values ('IDS_AURA1+21','aa_21',0x1ef);
insert into spr_names values ('IDS_AURA1+22','aa_22',0x1f0);
insert into spr_names values ('IDS_AURA1+23','aa_23',0x1f1);
insert into spr_names values ('IDS_AURA1+3','aa_03',0x1dd);
insert into spr_names values ('IDS_AURA1+4','aa_04',0x1de);
insert into spr_names values ('IDS_AURA1+5','aa_05',0x1df);
insert into spr_names values ('IDS_AURA1+6','aa_06',0x1e0);
insert into spr_names values ('IDS_AURA1+7','aa_07',0x1e1);
insert into spr_names values ('IDS_AURA1+8','aa_08',0x1e2);
insert into spr_names values ('IDS_AURA1+9','aa_09',0x1e3);
insert into spr_names values ('IDS_BAIT0','grubanm',0x1130);
insert into spr_names values ('IDS_BAIT1','BUGINV',0x1131);
insert into spr_names values ('IDS_BAIT2','flop',0x1132);
insert into spr_names values ('IDS_BAIT3','WORMWIGL',0x1133);
insert into spr_names values ('IDS_BAIT4','luur1',0x1134);
insert into spr_names values ('IDS_BAIT5','luur2',0x1135);
insert into spr_names values ('IDS_BAIT6','luur3',0x1136);
insert into spr_names values ('IDS_BAIT7','luur4',0x1137);
insert into spr_names values ('IDS_BAIT8','grubanm',0x1138);
insert into spr_names values ('IDS_BAIT9','grubanm',0x1139);
insert into spr_names values ('IDS_BANISHMENT','skull',0x77a0);
insert into spr_names values ('IDS_BBISHOP','Gbishop',0x600d);
insert into spr_names values ('IDS_BEAMER','beemer',0x800);
insert into spr_names values ('IDS_BFISH1','fish1a',0x1150);
insert into spr_names values ('IDS_BFISH10','fish10a',0x1159);
insert into spr_names values ('IDS_BFISH2','fish2a',0x1151);
insert into spr_names values ('IDS_BFISH3','fish3a',0x1152);
insert into spr_names values ('IDS_BFISH4','fish4a',0x1153);
insert into spr_names values ('IDS_BFISH5','fish5a',0x1154);
insert into spr_names values ('IDS_BFISH6','fish6a',0x1155);
insert into spr_names values ('IDS_BFISH7','fish7a',0x1156);
insert into spr_names values ('IDS_BFISH8','fish8a',0x1157);
insert into spr_names values ('IDS_BFISH9','fish9a',0x1158);
insert into spr_names values ('IDS_BIGEYE1','bigeye1',0x2404);
insert into spr_names values ('IDS_BKING','Gking',0x6008);
insert into spr_names values ('IDS_BKINGME','Bkingme',0x600e);
insert into spr_names values ('IDS_BKNIGHT','Gknight',0x600c);
insert into spr_names values ('IDS_BLINDNESS','blind',0x7793);
insert into spr_names values ('IDS_BLUEBERRY','bluberry',0x2125);
insert into spr_names values ('IDS_BLU_SLIDE','bluslide',0x204);
insert into spr_names values ('IDS_BOMB1','BOMB1',0x1176);
insert into spr_names values ('IDS_BOMB2','BOMB2',0x1177);
insert into spr_names values ('IDS_BPAWN','Gpawn',0x600a);
insert into spr_names values ('IDS_BQUEEN','Gqueen',0x6009);
insert into spr_names values ('IDS_BROOK','Grook',0x600b);
insert into spr_names values ('IDS_BTN_AUDIO','audvid',0x22);
insert into spr_names values ('IDS_BTN_CANCEL','btnCanc',0x31);
insert into spr_names values ('IDS_BTN_CANCEL_HI','btnCancH',0x32);
insert into spr_names values ('IDS_BTN_CITCULT','bCitClt',0x62);
insert into spr_names values ('IDS_BTN_CITCULT_HI','bCitCltH',0x63);
insert into spr_names values ('IDS_BTN_CREDITS','credits',0x21);
insert into spr_names values ('IDS_BTN_DELETE','btnDel',0x2b);
insert into spr_names values ('IDS_BTN_DELETE_HI','btnDelH',0x2c);
insert into spr_names values ('IDS_BTN_DOWN','btnDown',0x56);
insert into spr_names values ('IDS_BTN_DOWN_HI','btnDownH',0x57);
insert into spr_names values ('IDS_BTN_FEMALE','bfem',0x64);
insert into spr_names values ('IDS_BTN_FEMALE_HI','bfemh',0x65);
insert into spr_names values ('IDS_BTN_GAME','game',0x24);
insert into spr_names values ('IDS_BTN_HELP','help',0x26);
insert into spr_names values ('IDS_BTN_LEFT','btnLeft',0x50);
insert into spr_names values ('IDS_BTN_LEFT_HI','btnLeftH',0x51);
insert into spr_names values ('IDS_BTN_LOAD','btnLoad',0x2f);
insert into spr_names values ('IDS_BTN_LOAD_HI','btnLoadH',0x30);
insert into spr_names values ('IDS_BTN_MALE','bmale',0x66);
insert into spr_names values ('IDS_BTN_MALE_HI','bmaleh',0x67);
insert into spr_names values ('IDS_BTN_MAP','mapbtn',0x1ff);
insert into spr_names values ('IDS_BTN_NETWORK','network',0x25);
insert into spr_names values ('IDS_BTN_NEW','btnNew',0x27);
insert into spr_names values ('IDS_BTN_NEW_HI','btnNewH',0x28);
insert into spr_names values ('IDS_BTN_OK','btnOk',0x29);
insert into spr_names values ('IDS_BTN_OK_HI','btnOkH',0x2a);
insert into spr_names values ('IDS_BTN_PLAYER','player',0x23);
insert into spr_names values ('IDS_BTN_QUIT','quit',0x20);
insert into spr_names values ('IDS_BTN_RIGHT','btnRght',0x52);
insert into spr_names values ('IDS_BTN_RIGHT_HI','btnRghtH',0x53);
insert into spr_names values ('IDS_BTN_SAVE','btnSave',0x2d);
insert into spr_names values ('IDS_BTN_SAVE_HI','btnSaveH',0x2e);
insert into spr_names values ('IDS_BTN_THUMB','cThumb',0x58);
insert into spr_names values ('IDS_BTN_UP','btnUp',0x54);
insert into spr_names values ('IDS_BTN_UP_HI','btnUpH',0x55);
insert into spr_names values ('IDS_BTN_VILCULT','bVilClt',0x60);
insert into spr_names values ('IDS_BTN_VILCULT_HI','bVilCltH',0x61);
insert into spr_names values ('IDS_BUCKE','BUCKE',0x1173);
insert into spr_names values ('IDS_BUCKF','BUCKF',0x1174);
insert into spr_names values ('IDS_BUGTREE','bug2tree',0x116e);
insert into spr_names values ('IDS_BURNWOOD','BurnWood',0x1189);
insert into spr_names values ('IDS_CAN1','Can1',0x1211);
insert into spr_names values ('IDS_CAN2','Can2',0x1212);
insert into spr_names values ('IDS_CAN3','Can3',0x1213);
insert into spr_names values ('IDS_CAN4','Can4',0x1214);
insert into spr_names values ('IDS_CANNY1','Canny1',0x1215);
insert into spr_names values ('IDS_CANNY2','Canny2',0x1216);
insert into spr_names values ('IDS_CANNY3','Canny3',0x1217);
insert into spr_names values ('IDS_CANNY4','Canny4',0x1218);
insert into spr_names values ('IDS_CHEMBUBL','buble',0x522);
insert into spr_names values ('IDS_CHEMFILL','chemfill',0x521);
insert into spr_names values ('IDS_CHEMS','chems',0x520);
insert into spr_names values ('IDS_CHEMV01','chemv01',0x500);
insert into spr_names values ('IDS_CHEMV02','chemv02',0x501);
insert into spr_names values ('IDS_CHEMV03','chemv03',0x502);
insert into spr_names values ('IDS_CHEMV04','chemv04',0x503);
insert into spr_names values ('IDS_CHEMV05','chemv05',0x504);
insert into spr_names values ('IDS_CHEMV06','chemv06',0x505);
insert into spr_names values ('IDS_CHEMV07','chemv07',0x506);
insert into spr_names values ('IDS_CHEMV08','chemv08',0x507);
insert into spr_names values ('IDS_CHEMV09','chemv09',0x508);
insert into spr_names values ('IDS_CHEMV10','chemv10',0x509);
insert into spr_names values ('IDS_CHEMV11','chemv11',0x50a);
insert into spr_names values ('IDS_CHEMV12','chemv12',0x50b);
insert into spr_names values ('IDS_CHEMV13','chemv13',0x50c);
insert into spr_names values ('IDS_CHEMV14','chemv14',0x50d);
insert into spr_names values ('IDS_CHEMV15','chemv15',0x50e);
insert into spr_names values ('IDS_CHEMV16','chemv16',0x50f);
insert into spr_names values ('IDS_CHEMV17','chemv17',0x510);
insert into spr_names values ('IDS_CHEMV18','chemv18',0x511);
insert into spr_names values ('IDS_CHEMV19','chemv19',0x512);
insert into spr_names values ('IDS_CHEMV20','chemv20',0x513);
insert into spr_names values ('IDS_CITKEY','CITKEY',0x1701);
insert into spr_names values ('IDS_CITLOCK','CITLOCK',0x1700);
insert into spr_names values ('IDS_CITYNUM','citynum',0x202);
insert into spr_names values ('IDS_CITY_KEY','citykey1',0x200);
insert into spr_names values ('IDS_CLOCKBIN','CLOCKBIN',0x1709);
insert into spr_names values ('IDS_CROWBAR','Crowbar',0x2510);
insert into spr_names values ('IDS_DEATH','skull',0x779d);
insert into spr_names values ('IDS_DOORANIM','DOORANIM',0x2a95);
insert into spr_names values ('IDS_EMERALD','EMERALD',0x214a);
insert into spr_names values ('IDS_ENCHANT','enchant',0x7791);
insert into spr_names values ('IDS_ENCSTONE','encstone',0x214e);
insert into spr_names values ('IDS_EXPLODE1','EXPLODE1',0x1707);
insert into spr_names values ('IDS_EXPLOSION','Spelx09',0x7799);
insert into spr_names values ('IDS_EYEFUSE','eyefuse',0x2400);
insert into spr_names values ('IDS_EYENGLSH','eyenglsh',0x2402);
insert into spr_names values ('IDS_EYEPLATE','eyeplate',0x2401);
insert into spr_names values ('IDS_EYESPELL','eyespell',0x77a5);
insert into spr_names values ('IDS_EYEWAND','eyewand',0x2403);
insert into spr_names values ('IDS_F0HAPPY','f0hap',0x100);
insert into spr_names values ('IDS_F0HURT','f0hur',0x101);
insert into spr_names values ('IDS_F0KISS','f0kis',0x102);
insert into spr_names values ('IDS_F0MAD','f0mad',0x103);
insert into spr_names values ('IDS_F0SAD','f0sad',0x104);
insert into spr_names values ('IDS_F0STRESS','f0str',0x106);
insert into spr_names values ('IDS_F0SUPRISED','f0sup',0x105);
insert into spr_names values ('IDS_F0WAVE','f0wav',0x107);
insert into spr_names values ('IDS_F1HAPPY','f1hap',0x110);
insert into spr_names values ('IDS_F1HURT','f1hur',0x111);
insert into spr_names values ('IDS_F1KISS','f1kis',0x112);
insert into spr_names values ('IDS_F1MAD','f1mad',0x113);
insert into spr_names values ('IDS_F1SAD','f1sad',0x114);
insert into spr_names values ('IDS_F1STRESS','f1str',0x116);
insert into spr_names values ('IDS_F1SUPRISED','f1sup',0x115);
insert into spr_names values ('IDS_F1WAVE','f1wav',0x117);
insert into spr_names values ('IDS_F2HAPPY','f2hap',0x120);
insert into spr_names values ('IDS_F2HURT','f2hur',0x121);
insert into spr_names values ('IDS_F2KISS','f2kis',0x122);
insert into spr_names values ('IDS_F2MAD','f2mad',0x123);
insert into spr_names values ('IDS_F2SAD','f2sad',0x124);
insert into spr_names values ('IDS_F2STRESS','f2str',0x126);
insert into spr_names values ('IDS_F2SUPRISED','f2sup',0x125);
insert into spr_names values ('IDS_F2WAVE','f2wav',0x127);
insert into spr_names values ('IDS_F3HAPPY','f3hap',0x130);
insert into spr_names values ('IDS_F3HURT','f3hur',0x131);
insert into spr_names values ('IDS_F3KISS','f3kis',0x132);
insert into spr_names values ('IDS_F3MAD','f3mad',0x133);
insert into spr_names values ('IDS_F3SAD','f3sad',0x134);
insert into spr_names values ('IDS_F3STRESS','f3str',0x136);
insert into spr_names values ('IDS_F3SUPRISED','f3sup',0x135);
insert into spr_names values ('IDS_F3WAVE','f3wav',0x137);
insert into spr_names values ('IDS_F4HAPPY','f4hap',0x140);
insert into spr_names values ('IDS_F4HURT','f4hur',0x141);
insert into spr_names values ('IDS_F4KISS','f4kis',0x142);
insert into spr_names values ('IDS_F4MAD','f4mad',0x143);
insert into spr_names values ('IDS_F4SAD','f4sad',0x144);
insert into spr_names values ('IDS_F4STRESS','f4str',0x146);
insert into spr_names values ('IDS_F4SUPRISED','f4sup',0x145);
insert into spr_names values ('IDS_F4WAVE','f4wav',0x147);
insert into spr_names values ('IDS_F5HAPPY','f5hap',0x150);
insert into spr_names values ('IDS_F5HURT','f5hur',0x151);
insert into spr_names values ('IDS_F5KISS','f5kis',0x152);
insert into spr_names values ('IDS_F5MAD','f5mad',0x153);
insert into spr_names values ('IDS_F5SAD','f5sad',0x154);
insert into spr_names values ('IDS_F5STRESS','f5str',0x156);
insert into spr_names values ('IDS_F5SUPRISED','f5sup',0x155);
insert into spr_names values ('IDS_F5WAVE','f5wav',0x157);
insert into spr_names values ('IDS_FERN','fern',0x2131);
insert into spr_names values ('IDS_FERNLEAF','fernleaf',0x2120);
insert into spr_names values ('IDS_FISHASH','FishAsh',0x1190);
insert into spr_names values ('IDS_FISHASH1','fpouch1',0x1160);
insert into spr_names values ('IDS_FISHASH10','fpouch10',0x1169);
insert into spr_names values ('IDS_FISHASH2','fpouch2',0x1161);
insert into spr_names values ('IDS_FISHASH3','fpouch3',0x1162);
insert into spr_names values ('IDS_FISHASH4','fpouch4',0x1163);
insert into spr_names values ('IDS_FISHASH5','fpouch5',0x1164);
insert into spr_names values ('IDS_FISHASH6','fpouch6',0x1165);
insert into spr_names values ('IDS_FISHASH7','fpouch7',0x1166);
insert into spr_names values ('IDS_FISHASH8','fpouch8',0x1167);
insert into spr_names values ('IDS_FISHASH9','fpouch9',0x1168);
insert into spr_names values ('IDS_FISHSCRL','FISHSCRL',0x2223);
insert into spr_names values ('IDS_FISHWOOD','FishWood',0x1188);
insert into spr_names values ('IDS_FISHXX','FishX2',0x1206);
insert into spr_names values ('IDS_FLOPN1','FLOPN1',0x270);
insert into spr_names values ('IDS_FONTCITY','fntcits',0xa3);
insert into spr_names values ('IDS_FONTCITY_BIG','fntcitb',0xa7);
insert into spr_names values ('IDS_FONTENG','fntengs',0xa0);
insert into spr_names values ('IDS_FONTENG_BIG','fntengb',0xa4);
insert into spr_names values ('IDS_FONTPAR','fntpars',0xa1);
insert into spr_names values ('IDS_FONTPAR_BIG','fntparb',0xa5);
insert into spr_names values ('IDS_FONTTNB12','fntTNB12',0xac);
insert into spr_names values ('IDS_FONTTNB14','fntTNB14',0xad);
insert into spr_names values ('IDS_FONTTNB16','fntTNB16',0xae);
insert into spr_names values ('IDS_FONTTNB18','fnttnb18',0xaf);
insert into spr_names values ('IDS_FONTTNR12','fntTNR12',0xa8);
insert into spr_names values ('IDS_FONTTNR14','fntTNR14',0xa9);
insert into spr_names values ('IDS_FONTTNR16','fntTNR16',0xaa);
insert into spr_names values ('IDS_FONTTNR18','fntTNR18',0xab);
insert into spr_names values ('IDS_FONTVILL','fntvils',0xa2);
insert into spr_names values ('IDS_FONTVILL_BIG','fntvilb',0xa6);
insert into spr_names values ('IDS_FORCEFLD','FORCEFLD',0x1705);
insert into spr_names values ('IDS_FREQUENCY','Beemer',0x7002);
insert into spr_names values ('IDS_GLEAFSPT','gleafspt',0x2121);
insert into spr_names values ('IDS_GOBIN_B','GoBinB',0x6016);
insert into spr_names values ('IDS_GOBIN_D','GoBinD',0x6017);
insert into spr_names values ('IDS_GOBTRFLY','GoBtrfly',0x6012);
insert into spr_names values ('IDS_GODRAGON','GoDragon',0x6013);
insert into spr_names values ('IDS_GRNPLANT','grnplant',0x2132);
insert into spr_names values ('IDS_GRN_SLIDE','grnslide',0x205);
insert into spr_names values ('IDS_H2OMASK','H2OMASK',0x1178);
insert into spr_names values ('IDS_HALO00','HALA',0xf0);
insert into spr_names values ('IDS_HALO01','HALB',0xf1);
insert into spr_names values ('IDS_HALO02','HALC',0xf2);
insert into spr_names values ('IDS_HALO03','HALD',0xf3);
insert into spr_names values ('IDS_HALO04','HALE',0xf4);
insert into spr_names values ('IDS_HALO05','HALF',0xf5);
insert into spr_names values ('IDS_HALO06','halo06',0xf6);
insert into spr_names values ('IDS_HALO07','halo07',0xf7);
insert into spr_names values ('IDS_HALUCINATE','redeye',0x77a2);
insert into spr_names values ('IDS_HANDALT','handfwd',0xd);
insert into spr_names values ('IDS_HANDBACK','handback',0x6);
insert into spr_names values ('IDS_HANDCLICK','handmach',0xf);
insert into spr_names values ('IDS_HANDDNLT','handdnlt',0xb);
insert into spr_names values ('IDS_HANDDNRT','handdnrt',0xc);
insert into spr_names values ('IDS_HANDDOWN','handdown',0x8);
insert into spr_names values ('IDS_HANDFWD','handfwd',0x5);
insert into spr_names values ('IDS_HANDIDLE','handidle',0x1);
insert into spr_names values ('IDS_HANDLEFT','handleft',0x3);
insert into spr_names values ('IDS_HANDMACH','handmach',0x2);
insert into spr_names values ('IDS_HANDRIGHT','handrght',0x4);
insert into spr_names values ('IDS_HANDTRIG','handfwd',0xe);
insert into spr_names values ('IDS_HANDUP','handup',0x7);
insert into spr_names values ('IDS_HANDUPLT','handuplt',0x9);
insert into spr_names values ('IDS_HANDUPRT','handuprt',0xa);
insert into spr_names values ('IDS_HOLDING','holding',0x7794);
insert into spr_names values ('IDS_HR1SA','hr1sa',0x2513);
insert into spr_names values ('IDS_HR1SB','hr1sb',0x2514);
insert into spr_names values ('IDS_HR1SC','hr1sc',0x2515);
insert into spr_names values ('IDS_HR1SD','hr1sd',0x2516);
insert into spr_names values ('IDS_HR1SE','hr1se',0x2517);
insert into spr_names values ('IDS_HR1TA','hr1ta',0x2518);
insert into spr_names values ('IDS_HR1TB','hr1tb',0x2519);
insert into spr_names values ('IDS_HR1TC','hr1tc',0x251a);
insert into spr_names values ('IDS_HR2SA','hr2sa',0x251b);
insert into spr_names values ('IDS_HR2SB','hr2sb',0x251c);
insert into spr_names values ('IDS_HR2SC','hr2sc',0x251d);
insert into spr_names values ('IDS_HR2TA','hr2ta',0x251e);
insert into spr_names values ('IDS_HR2TB','hr2tb',0x251f);
insert into spr_names values ('IDS_HR2TC','hr2tc',0x2520);
insert into spr_names values ('IDS_HR2TD','hr2td',0x2521);
insert into spr_names values ('IDS_INVISIBLE','Spelx04',0x779e);
insert into spr_names values ('IDS_KEY_CFGWKEY','keycfkey',0x206);
insert into spr_names values ('IDS_KEY_IN_BIN','keyinbin',0x207);
insert into spr_names values ('IDS_LGHTANIM','LGHTANIM',0x2a94);
insert into spr_names values ('IDS_LINKHAND','linkhand',0x11);
insert into spr_names values ('IDS_LOCK','Spelx10',0x779a);
insert into spr_names values ('IDS_LOCKWKEY','lockwkey',0x201);
insert into spr_names values ('IDS_LOG','smalllog',0x1170);
insert into spr_names values ('IDS_M0HAPPY','f0hap',0x160);
insert into spr_names values ('IDS_M0HURT','f0hur',0x161);
insert into spr_names values ('IDS_M0KISS','f0kis',0x162);
insert into spr_names values ('IDS_M0MAD','f0mad',0x163);
insert into spr_names values ('IDS_M0SAD','f0sad',0x164);
insert into spr_names values ('IDS_M0STRESS','f0str',0x166);
insert into spr_names values ('IDS_M0SUPRISED','f0sup',0x165);
insert into spr_names values ('IDS_M0WAVE','f0wav',0x167);
insert into spr_names values ('IDS_M1HAPPY','f1hap',0x170);
insert into spr_names values ('IDS_M1HURT','f1hur',0x171);
insert into spr_names values ('IDS_M1KISS','f1kis',0x172);
insert into spr_names values ('IDS_M1MAD','f1mad',0x173);
insert into spr_names values ('IDS_M1SAD','f1sad',0x174);
insert into spr_names values ('IDS_M1STRESS','f1str',0x176);
insert into spr_names values ('IDS_M1SUPRISED','f1sup',0x175);
insert into spr_names values ('IDS_M1WAVE','f1wav',0x177);
insert into spr_names values ('IDS_M2HAPPY','f2hap',0x180);
insert into spr_names values ('IDS_M2HURT','f2hur',0x181);
insert into spr_names values ('IDS_M2KISS','f2kis',0x182);
insert into spr_names values ('IDS_M2MAD','f2mad',0x183);
insert into spr_names values ('IDS_M2SAD','f2sad',0x184);
insert into spr_names values ('IDS_M2STRESS','f2str',0x186);
insert into spr_names values ('IDS_M2SUPRISED','f2sup',0x185);
insert into spr_names values ('IDS_M2WAVE','f2wav',0x187);
insert into spr_names values ('IDS_M3HAPPY','f3hap',0x190);
insert into spr_names values ('IDS_M3HURT','f3hur',0x191);
insert into spr_names values ('IDS_M3KISS','f3kis',0x192);
insert into spr_names values ('IDS_M3MAD','f3mad',0x193);
insert into spr_names values ('IDS_M3SAD','f3sad',0x194);
insert into spr_names values ('IDS_M3STRESS','f3str',0x196);
insert into spr_names values ('IDS_M3SUPRISED','f3sup',0x195);
insert into spr_names values ('IDS_M3WAVE','f3wav',0x197);
insert into spr_names values ('IDS_M4HAPPY','f4hap',0x1a0);
insert into spr_names values ('IDS_M4HURT','f4hur',0x1a1);
insert into spr_names values ('IDS_M4KISS','f4kis',0x1a2);
insert into spr_names values ('IDS_M4MAD','f4mad',0x1a3);
insert into spr_names values ('IDS_M4SAD','f4sad',0x1a4);
insert into spr_names values ('IDS_M4STRESS','f4str',0x1a6);
insert into spr_names values ('IDS_M4SUPRISED','f4sup',0x1a5);
insert into spr_names values ('IDS_M4WAVE','f4wav',0x1a7);
insert into spr_names values ('IDS_M5HAPPY','f5hap',0x1b0);
insert into spr_names values ('IDS_M5HURT','f5hur',0x1b1);
insert into spr_names values ('IDS_M5KISS','f5kis',0x1b2);
insert into spr_names values ('IDS_M5MAD','f5mad',0x1b3);
insert into spr_names values ('IDS_M5SAD','f5sad',0x1b4);
insert into spr_names values ('IDS_M5STRESS','f5str',0x1b6);
insert into spr_names values ('IDS_M5SUPRISED','f5sup',0x1b5);
insert into spr_names values ('IDS_M5WAVE','f5wav',0x1b7);
insert into spr_names values ('IDS_MATCH','torch',0x1171);
insert into spr_names values ('IDS_MINDREAD','mind',0x77a1);
insert into spr_names values ('IDS_MINEBLOW','MINEBLOW',0x1706);
insert into spr_names values ('IDS_NAMEPLATE','namefill',0x46);
insert into spr_names values ('IDS_NEWSHOVL','shovel',0x1175);
insert into spr_names values ('IDS_NYBREATH','Spelx09',0x77a3);
insert into spr_names values ('IDS_NYPLANT','nyplant',0x214d);
insert into spr_names values ('IDS_NYPLANTBIN','nyplantbin',0x214c);
insert into spr_names values ('IDS_NYSMASK','NYSMASK',0x1179);
insert into spr_names values ('IDS_NYSVIAL','nysvial',0xe0);
insert into spr_names values ('IDS_OMUSH','omush',0x2133);
insert into spr_names values ('IDS_OMUSHSPT','omushspt',0x2122);
insert into spr_names values ('IDS_OPN1','OPN1',0x2506);
insert into spr_names values ('IDS_OPN2','OPN2',0x2507);
insert into spr_names values ('IDS_OTHERHAND','otherhand',0x10);
insert into spr_names values ('IDS_PED1','1',0x1c0);
insert into spr_names values ('IDS_PED10','10',0x1c9);
insert into spr_names values ('IDS_PED2','2',0x1c1);
insert into spr_names values ('IDS_PED3','3',0x1c2);
insert into spr_names values ('IDS_PED4','4',0x1c3);
insert into spr_names values ('IDS_PED5','5',0x1c4);
insert into spr_names values ('IDS_PED6','6',0x1c5);
insert into spr_names values ('IDS_PED7','7',0x1c6);
insert into spr_names values ('IDS_PED8','8',0x1c7);
insert into spr_names values ('IDS_PED9','9',0x1c8);
insert into spr_names values ('IDS_PEZPOP','pezpop',0x600);
insert into spr_names values ('IDS_PFLOWER','pflower',0x2134);
insert into spr_names values ('IDS_PFLWRSPT','pflwrspt',0x2123);
insert into spr_names values ('IDS_PICK','PICK',0x116f);
insert into spr_names values ('IDS_PIT00','pit00',0x280);
insert into spr_names values ('IDS_PIT01','pit01',0x281);
insert into spr_names values ('IDS_PIT02','pit02',0x282);
insert into spr_names values ('IDS_PIT03','pit03',0x283);
insert into spr_names values ('IDS_PIT04','pit04',0x284);
insert into spr_names values ('IDS_PIT05','pit05',0x285);
insert into spr_names values ('IDS_PIT06','pit06',0x286);
insert into spr_names values ('IDS_PIT07','pit07',0x287);
insert into spr_names values ('IDS_PIT08','pit08',0x288);
insert into spr_names values ('IDS_PIT09','pit09',0x289);
insert into spr_names values ('IDS_PITFUL','pitful',0x291);
insert into spr_names values ('IDS_PLANTXX','PlantX2',0x1205);
insert into spr_names values ('IDS_PLEAFSPT','pleafspt',0x2124);
insert into spr_names values ('IDS_PLNTSCRL','PLNTSCRL',0x2222);
insert into spr_names values ('IDS_PNKPLANT','pnkplant',0x2130);
insert into spr_names values ('IDS_POLE1','pole1cur',0x1101);
insert into spr_names values ('IDS_POLE1LCB','pole1lcb',0x1110);
insert into spr_names values ('IDS_POLE1LCL','pole1lcl',0x1111);
insert into spr_names values ('IDS_POLE1LCT','pole1lct',0x1112);
insert into spr_names values ('IDS_POLE1LCU','pole1lcu',0x1113);
insert into spr_names values ('IDS_POLE1LOB','pole1lob',0x1114);
insert into spr_names values ('IDS_POLE1LOL','pole1lol',0x1115);
insert into spr_names values ('IDS_POLE1LOT','pole1lot',0x1116);
insert into spr_names values ('IDS_POLE1LOU','pole1lou',0x1117);
insert into spr_names values ('IDS_POLE1RCB','pole1RCB',0x1120);
insert into spr_names values ('IDS_POLE1RCL','pole1RCL',0x1121);
insert into spr_names values ('IDS_POLE1RCT','pole1RCT',0x1122);
insert into spr_names values ('IDS_POLE1RCU','pole1RCU',0x1123);
insert into spr_names values ('IDS_POLE1ROB','pole1ROB',0x1124);
insert into spr_names values ('IDS_POLE1ROL','pole1ROL',0x1125);
insert into spr_names values ('IDS_POLE1ROT','pole1ROT',0x1126);
insert into spr_names values ('IDS_POLE1ROU','pole1ROU',0x1127);
insert into spr_names values ('IDS_POLE2','pole2cur',0x1102);
insert into spr_names values ('IDS_PROTECT','Spelx02',0x779c);
insert into spr_names values ('IDS_RECORDER','Spelx07',0x7797);
insert into spr_names values ('IDS_REDBERRY','redberry',0x2126);
insert into spr_names values ('IDS_REDDOT','reddot',0xd8);
insert into spr_names values ('IDS_REDEAR','redear',0xd9);
insert into spr_names values ('IDS_RED_SLIDE','redslide',0x203);
insert into spr_names values ('IDS_REVBIN_A','RevBinA',0x6014);
insert into spr_names values ('IDS_REVBIN_B','RevBinB',0x6015);
insert into spr_names values ('IDS_REVERSIA','ReversiA',0x6010);
insert into spr_names values ('IDS_REVERSIB','ReversiB',0x6011);
insert into spr_names values ('IDS_ROCK','ROCK',0x1704);
insert into spr_names values ('IDS_ROLL','ROLL',0x2502);
insert into spr_names values ('IDS_ROOTBLUE','ROOTBLUE',0x2138);
insert into spr_names values ('IDS_ROOTORANGE','ROOTORANGE',0x213a);
insert into spr_names values ('IDS_ROOTPLANT','ROOTPLANT',0x2137);
insert into spr_names values ('IDS_ROOTWHITE','ROOTWHITE',0x2139);
insert into spr_names values ('IDS_RUBY','RUBY',0x214b);
insert into spr_names values ('IDS_RUMBLE','RUMBLE',0x2501);
insert into spr_names values ('IDS_SANDDIRT','sanddirt',0x213e);
insert into spr_names values ('IDS_SANDDIRT2','sanddirt2',0x213f);
insert into spr_names values ('IDS_SANDDIRT3','sanddirt3',0x2140);
insert into spr_names values ('IDS_SANDDIRTGRS','sanddirtgrs',0x2142);
insert into spr_names values ('IDS_SANDDIRTMOON','sanddirtmoon',0x2141);
insert into spr_names values ('IDS_SCATTER','SCATTER',0x2503);
insert into spr_names values ('IDS_SCOOPE','scoopE',0xe2);
insert into spr_names values ('IDS_SCOOPF','scoopF',0xe1);
insert into spr_names values ('IDS_SCR001','SCR001',0x2201);
insert into spr_names values ('IDS_SCR002','SCR002',0x2202);
insert into spr_names values ('IDS_SCR003','SCR003',0x2203);
insert into spr_names values ('IDS_SCR004','SCR004',0x2204);
insert into spr_names values ('IDS_SCR005','SCR005',0x2205);
insert into spr_names values ('IDS_SCR006','SCR006',0x2206);
insert into spr_names values ('IDS_SCR007','SCR007',0x2207);
insert into spr_names values ('IDS_SCR008','SCR008',0x2208);
insert into spr_names values ('IDS_SCR009','SCR009',0x2209);
insert into spr_names values ('IDS_SCR010','SCR010',0x2210);
insert into spr_names values ('IDS_SCR011','SCR011',0x2211);
insert into spr_names values ('IDS_SCR012','SCR012',0x2212);
insert into spr_names values ('IDS_SCR013','SCR013',0x2213);
insert into spr_names values ('IDS_SCR014','SCR014',0x2214);
insert into spr_names values ('IDS_SCR015','SCR015',0x2215);
insert into spr_names values ('IDS_SCR016','SCR016',0x2216);
insert into spr_names values ('IDS_SCR017','SCR017',0x2217);
insert into spr_names values ('IDS_SCR018','SCR018',0x2218);
insert into spr_names values ('IDS_SCR019','SCR019',0x2219);
insert into spr_names values ('IDS_SCR020','SCR020',0x2220);
insert into spr_names values ('IDS_SCRHUNG','ScllHung',0x1219);
insert into spr_names values ('IDS_SHLDSCRL','SHLDSCRL',0x2221);
insert into spr_names values ('IDS_SMBURST','SMBURST',0x77a6);
insert into spr_names values ('IDS_SPEAKER','SPEAKER',0xc8);
insert into spr_names values ('IDS_SPEFFECT','Exploa',0x1230);
insert into spr_names values ('IDS_SPELL01','Spell01',0x7777);
insert into spr_names values ('IDS_SPELL02','Spell02',0x7778);
insert into spr_names values ('IDS_SPELL03','Spell03',0x7779);
insert into spr_names values ('IDS_SPELL04','Spell04',0x777a);
insert into spr_names values ('IDS_SPELL05','Spell05',0x777b);
insert into spr_names values ('IDS_SPELL06','Spell06',0x777c);
insert into spr_names values ('IDS_SPELL07','Spell07',0x777d);
insert into spr_names values ('IDS_SPELL08','Spell08',0x777e);
insert into spr_names values ('IDS_SPELL09','Spell09',0x777f);
insert into spr_names values ('IDS_SPELL10','Spell10',0x7780);
insert into spr_names values ('IDS_SPELx01','Spelx01',0x7787);
insert into spr_names values ('IDS_SPELx02','Spelx02',0x7788);
insert into spr_names values ('IDS_SPELx03','Spelx03',0x7789);
insert into spr_names values ('IDS_SPELx04','Spelx04',0x778a);
insert into spr_names values ('IDS_SPELx05','Spelx05',0x778b);
insert into spr_names values ('IDS_SPELx06','Spelx06',0x778c);
insert into spr_names values ('IDS_SPELx07','Spelx07',0x778d);
insert into spr_names values ('IDS_SPELx08','Spelx08',0x778e);
insert into spr_names values ('IDS_SPELx09','Spelx09',0x778f);
insert into spr_names values ('IDS_SPELx10','Spelx10',0x7790);
insert into spr_names values ('IDS_SPINNER','h2oSp01',0x7001);
insert into spr_names values ('IDS_SPINSPELL','spinspel',0x7000);
insert into spr_names values ('IDS_SPIRIT0','Spirit1',0x7770);
insert into spr_names values ('IDS_SPIRIT1','Spirit1',0x7771);
insert into spr_names values ('IDS_SPIRIT2','Spirit1',0x7772);
insert into spr_names values ('IDS_SPIRIT3','Spirit1',0x7773);
insert into spr_names values ('IDS_SPRINGS','SpRings',0x7774);
insert into spr_names values ('IDS_STALKER','stalk',0x7792);
insert into spr_names values ('IDS_STD_EDITBOXL','cEditBxL',0x45);
insert into spr_names values ('IDS_STD_EDITBOXM','cEditBxM',0x44);
insert into spr_names values ('IDS_STD_EDITBOXS','cEditBxS',0x43);
insert into spr_names values ('IDS_STD_LISTBOXL','cListBxL',0x42);
insert into spr_names values ('IDS_STD_LISTBOXM','cListBxM',0x41);
insert into spr_names values ('IDS_STD_LISTBOXS','cListBxS',0x40);
insert into spr_names values ('IDS_STRAT_LB','strat_lb',0x900);
insert into spr_names values ('IDS_STRENGTH','Spelx05',0x779f);
insert into spr_names values ('IDS_TELEKINESIS','tele',0x7798);
insert into spr_names values ('IDS_TEMPLATE01','t01',0x601);
insert into spr_names values ('IDS_TEMPLATE01+1','t02',0x602);
insert into spr_names values ('IDS_TEMPLATE01+10','t11',0x60b);
insert into spr_names values ('IDS_TEMPLATE01+11','t12',0x60c);
insert into spr_names values ('IDS_TEMPLATE01+12','t13',0x60d);
insert into spr_names values ('IDS_TEMPLATE01+13','t14',0x60e);
insert into spr_names values ('IDS_TEMPLATE01+14','t15',0x60f);
insert into spr_names values ('IDS_TEMPLATE01+15','t16',0x610);
insert into spr_names values ('IDS_TEMPLATE01+16','t17',0x611);
insert into spr_names values ('IDS_TEMPLATE01+17','t18',0x612);
insert into spr_names values ('IDS_TEMPLATE01+18','t19',0x613);
insert into spr_names values ('IDS_TEMPLATE01+19','t20',0x614);
insert into spr_names values ('IDS_TEMPLATE01+2','t03',0x603);
insert into spr_names values ('IDS_TEMPLATE01+20','t21',0x615);
insert into spr_names values ('IDS_TEMPLATE01+21','t22',0x616);
insert into spr_names values ('IDS_TEMPLATE01+22','t23',0x617);
insert into spr_names values ('IDS_TEMPLATE01+23','t24',0x618);
insert into spr_names values ('IDS_TEMPLATE01+24','t25',0x619);
insert into spr_names values ('IDS_TEMPLATE01+25','t26',0x61a);
insert into spr_names values ('IDS_TEMPLATE01+26','t27',0x61b);
insert into spr_names values ('IDS_TEMPLATE01+27','t28',0x61c);
insert into spr_names values ('IDS_TEMPLATE01+28','t29',0x61d);
insert into spr_names values ('IDS_TEMPLATE01+29','t30',0x61e);
insert into spr_names values ('IDS_TEMPLATE01+3','t04',0x604);
insert into spr_names values ('IDS_TEMPLATE01+30','t31',0x61f);
insert into spr_names values ('IDS_TEMPLATE01+31','t32',0x620);
insert into spr_names values ('IDS_TEMPLATE01+32','t33',0x621);
insert into spr_names values ('IDS_TEMPLATE01+33','t34',0x622);
insert into spr_names values ('IDS_TEMPLATE01+34','t35',0x623);
insert into spr_names values ('IDS_TEMPLATE01+4','t05',0x605);
insert into spr_names values ('IDS_TEMPLATE01+5','t06',0x606);
insert into spr_names values ('IDS_TEMPLATE01+6','t07',0x607);
insert into spr_names values ('IDS_TEMPLATE01+7','t08',0x608);
insert into spr_names values ('IDS_TEMPLATE01+8','t09',0x609);
insert into spr_names values ('IDS_TEMPLATE01+9','t10',0x60a);
insert into spr_names values ('IDS_TMORPH','TMORPH',0x661);
insert into spr_names values ('IDS_TRANSFER','transfer',0x7795);
insert into spr_names values ('IDS_TXT_MUSIC','txtMusic',0x70);
insert into spr_names values ('IDS_TXT_SFX','txtSFX',0x71);
insert into spr_names values ('IDS_UNLOCK','Spelx01',0x779b);
insert into spr_names values ('IDS_VESTBNYS','VESTBNYS',0x1202);
insert into spr_names values ('IDS_VESTCAN','VESTCAN',0x1201);
insert into spr_names values ('IDS_VESTH2O','VESTH2O',0x1203);
insert into spr_names values ('IDS_VIALCNT','VIALCNT',0x660);
insert into spr_names values ('IDS_VIALSCRL','VIALSCRL',0x2224);
insert into spr_names values ('IDS_VILKEY','VILKEY',0x1703);
insert into spr_names values ('IDS_VILLOCK','VILLOCK',0x1702);
insert into spr_names values ('IDS_VLOCKBIN','VLOCKBIN',0x1708);
insert into spr_names values ('IDS_WALL1CUE','WALL1CUE',0x2504);
insert into spr_names values ('IDS_WALL2CUE','WALL2CUE',0x2505);
insert into spr_names values ('IDS_WATER','water',0x1172);
insert into spr_names values ('IDS_WBISHOP','Sbishop',0x6005);
insert into spr_names values ('IDS_WETBREATH','Spelx10',0x77a4);
insert into spr_names values ('IDS_WFLOWER','wflower',0x2135);
insert into spr_names values ('IDS_WFLWRSPT','wflwrspt',0x2127);
insert into spr_names values ('IDS_WKING','Sking',0x6000);
insert into spr_names values ('IDS_WKINGME','Pkingme',0x6006);
insert into spr_names values ('IDS_WKNIGHT','Sknight',0x6004);
insert into spr_names values ('IDS_WORDSCRL','WORDSCRL',0x2225);
insert into spr_names values ('IDS_WPAWN','fnttnb18',0x6002);
insert into spr_names values ('IDS_WQUEEN','Squeen',0x6001);
insert into spr_names values ('IDS_WROOK','Srook',0x6003);
insert into spr_names values ('IDS_YFLOWER','yflower',0x2136);
insert into spr_names values ('IDS_YFLWRSPT','yflwrspt',0x2128);
insert into spr_names values ('IDS_YMUSH','ymush',0x2137);
insert into spr_names values ('IDS_YMUSHSPT','ymushspt',0x2129);
