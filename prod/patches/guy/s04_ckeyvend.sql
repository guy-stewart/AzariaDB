
delete from games;

insert into machines ([id],[name],[view_name],[left],[top],[right],[bottom],[local_visible],[dfa_name], [wip1_name],[wip2_name],[wip3_name],[wip4_name]) values
(0x402,'S04_KEYCLAMP_1','IDV_ckeycf01',222,91,342,178,0,'M04_KEYCLAMP','S04_REDSLIDER_1','S04_GRNSLIDER_1','S04_BLUSLIDER_1',''),
(0x403,'S04_REDSLIDER_1','IDV_ckeycf01',78,103,100,188,0,'M04_SLIDER','IDS_RED_SLIDE','S04_KEYCLAMP_1','16',''),
(0x404,'S04_GRNSLIDER_1','IDV_ckeycf01',105,103,127,188,0,'M04_SLIDER','IDS_GRN_SLIDE','S04_KEYCLAMP_1','4',''),
(0x405,'S04_BLUSLIDER_1','IDV_ckeycf01',129,103,151,188,0,'M04_SLIDER','IDS_BLU_SLIDE','S04_KEYCLAMP_1','1',''),
(0x406,'S04_KEYCLAMP_2','IDV_ckeycf02',222,91,342,178,0,'M04_KEYCLAMP','S04_REDSLIDER_2','S04_GRNSLIDER_2','S04_BLUSLIDER_2',''),
(0x407,'S04_REDSLIDER_2','IDV_ckeycf02',78,103,100,188,0,'M04_SLIDER','IDS_RED_SLIDE','S04_KEYCLAMP_2','16',''),
(0x408,'S04_GRNSLIDER_2','IDV_ckeycf02',105,103,127,188,0,'M04_SLIDER','IDS_GRN_SLIDE','S04_KEYCLAMP_2','4',''),
(0x409,'S04_BLUSLIDER_2','IDV_ckeycf02',129,103,151,188,0,'M04_SLIDER','IDS_BLU_SLIDE','S04_KEYCLAMP_2','1',''),
(0x40a,'S04_KEYCLAMP_3','IDV_ckeycf03',222,91,342,178,0,'M04_KEYCLAMP','S04_REDSLIDER_3','S04_GRNSLIDER_3','S04_BLUSLIDER_3',''),
(0x40b,'S04_REDSLIDER_3','IDV_ckeycf03',78,103,100,188,0,'M04_SLIDER','IDS_RED_SLIDE','S04_KEYCLAMP_3','16',''),
(0x40c,'S04_GRNSLIDER_3','IDV_ckeycf03',105,103,127,188,0,'M04_SLIDER','IDS_GRN_SLIDE','S04_KEYCLAMP_3','4',''),
(0x40d,'S04_BLUSLIDER_3','IDV_ckeycf03',129,103,151,188,0,'M04_SLIDER','IDS_BLU_SLIDE','S04_KEYCLAMP_3','1',''),
(0x400,'S04_VIAL','IDV_ckeyvend',130,130,200,200,0,'M04_VIAL','','','',''),
(0x401,'S04_BIN','IDV_ckeyvend',116,205,223,285,0,'M04_BIN','','','','');

delete from transitions where [automaton] like 'M04_%';
insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code]) values ('0x0030','0','1','WAIT','0','0', ''),

-- 2 scoops for a key.
-- [0] wait for 1st scoop:
('M04_VIAL','0','1','DRAG','0','IDD_SCOOPF', '
    PLAYWAVE(SOUND_SLURP);
    HANDOFF(0,IDD_SCOOPE);'),
-- [1] wait for 2nd scoop:
('M04_VIAL','1','0','DRAG','0','IDD_SCOOPF', '
    PLAYWAVE(SOUND_SLURP);
    HANDOFF(0,IDD_SCOOPE);
    SIGNALi(0,S04_BIN);'),

-- [0] wait for a signal from the vial that 2 scoops were delivered.
('M04_BIN','0','1','WAIT','','', '
    ASSIGN(WOBJECT,IDD_CITY_KEY1);
    SHOW(0,IDS_KEY_IN_BIN);'),
-- [1] wait for someone to take the key from the bin.
('M04_BIN','1','0','GRAB','','', 'SHOW(0,0);'),

-- [0] start state, init the class acceptor
('M04_KEYCLAMP','0','1','C_ACCEPT','0','IDC_KEY', ''),
-- [1] wait for a dropped key then configure the sliders
('M04_KEYCLAMP','1','2','DROP','0','0', '
WPARM = WOBJECT - IDD_CITY_KEY1;
SIGNAL(WIP1, SIG_SHOW);
SIGNAL(WIP2, SIG_SHOW);
SIGNAL(WIP3, SIG_SHOW);
SHOW(0,IDS_KEY_CFGWKEY);
WOBJECT=0;'),
-- [2] when key is grabbed then configure per sliders
('M04_KEYCLAMP','2','1','GRAB','','0','
    REF_MACHINE(WIP1);
    MOV(WOBJECT,R_BFRAME);
    MULI(WOBJECT,4);
    REF_MACHINE(WIP2);
    ADD(WOBJECT,R_BFRAME);
    MULI(WOBJECT,4);
    REF_MACHINE(WIP3);
    ADD(WOBJECT,R_BFRAME);
    ADDI(WOBJECT,IDD_CITY_KEY1);
    HANDOFF(WOBJECT);
    SHOW();
    SIGNAL(WIP1, SIG_HIDE);
    SIGNAL(WIP2, SIG_HIDE);
    SIGNAL(WIP3, SIG_HIDE);
    '),

-- [0] init the sprite for the slider
('M04_SLIDER','0','1','MOV','WSPRITE','WIP1', ''),
('M04_SLIDER','1','idle','SHOW','WSPRITE','', ''),
('M04_SLIDER','idle','1','CLICK','','', '
BFRAME = BFRAME + 1;
if (BFRAME > 3) BFRAME=0;'),
('M04_SLIDER','idle','1','WAIT','','SIG_SHOW', '
REF_MACHINE(WIP2);
BFRAME= (R_WPARM / WIP3);
MOD(BFRAME,4);'), -- bframe has been modified by the keyclamp.
('M04_SLIDER','idle','1','WAIT','','SIG_HIDE', 'BFRAME=0;');


delete from objects where [object] like 'IDD_CITY_KEY%';
insert into objects values
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
('IDD_CITY_KEY_0x23f',0x23f,'IDC_KEY','citykey1','citykey1','citykey1');