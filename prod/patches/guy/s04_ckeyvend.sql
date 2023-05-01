
delete from games;

delete from transitions where [name] like 'M04_%';

insert into transitions ([name], [state], [new_state], [opcode], [param_1], [param_2], [code]) values ('0x0030','0','1','WAIT','0','0', ''),

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
    SUBI(WOBJECT,IDD_CITY_KEY1);
    REF_MACHINE(WIP3);
    MOV(R_BFRAME,WOBJECT);
    MODI(R_BFRAME,4);
    DIVI(WOBJECT,4);
    REF_MACHINE(WIP2);
    MOV(R_BFRAME,WOBJECT);
    MODI(R_BFRAME,4);
    DIVI(WOBJECT,4);
    REF_MACHINE(WIP1);
    MOV(R_BFRAME,WOBJECT);
    SHOW(0,IDS_KEY_CFGWKEY);
    CLEAR(WOBJECT);'),
-- [2] when key is grabbed then configure per sliders
('M04_KEYCLAMP','2','1','GRAB','','0','
    REF_MACHINE(WIP1);
    MOV(WOBJECT,R_BFRAME);
    CLEAR(R_BFRAME);
    MULI(WOBJECT,4);
    REF_MACHINE(WIP2);
    ADD(WOBJECT,R_BFRAME);
    CLEAR(R_BFRAME);
    MULI(WOBJECT,4);
    REF_MACHINE(WIP3);
    ADD(WOBJECT,R_BFRAME);
    CLEAR(R_BFRAME);
    ADDI(WOBJECT,IDD_CITY_KEY1);
    HANDOFF(WOBJECT);
    SHOW();'),

-- [0] init the sprite for the slider
('M04_SLIDER','0','1','MOV','WSPRITE','WIP1', ''),
('M04_SLIDER','1','5','SHOW','WSPRITE','', ''),
('M04_SLIDER','5','10','CLICK','','', ''),
--('M04_SLIDER','5','1','WAIT','','', ''), -- bframe has been modified by the keyclamp.
('M04_SLIDER','10','20','ADDI','BFRAME','1', ''),
('M04_SLIDER','20','1','LTEi','BFRAME','3', ''),
('M04_SLIDER','20','1','Z_EPSILON','','','ASSIGN(BFRAME,0);');

delete from objects where [object] like 'IDD_CITY_KEY%';
insert into objects values
('IDD_CITY_KEY_0x200',0x200,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x201',0x201,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x202',0x202,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x203',0x203,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x204',0x204,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x205',0x205,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x206',0x206,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x207',0x207,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x208',0x208,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x209',0x209,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20a',0x20a,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20b',0x20b,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20c',0x20c,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20d',0x20d,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20e',0x20e,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x20f',0x20f,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x210',0x210,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x211',0x211,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x212',0x212,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x213',0x213,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x214',0x214,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x215',0x215,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x216',0x216,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x217',0x217,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x218',0x218,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x219',0x219,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21a',0x21a,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21b',0x21b,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21c',0x21c,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21d',0x21d,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21e',0x21e,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x21f',0x21f,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x220',0x220,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x221',0x221,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x222',0x222,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x223',0x223,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x224',0x224,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x225',0x225,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x226',0x226,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x227',0x227,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x228',0x228,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x229',0x229,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22a',0x22a,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22b',0x22b,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22c',0x22c,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22d',0x22d,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22e',0x22e,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x22f',0x22f,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x230',0x230,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x231',0x231,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x232',0x232,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x233',0x233,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x234',0x234,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x235',0x235,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x236',0x236,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x237',0x237,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x238',0x238,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x239',0x239,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23a',0x23a,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23b',0x23b,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23c',0x23c,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23d',0x23d,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23e',0x23e,'IDC_KEY',5,'citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_0x23f',0x23f,'IDC_KEY',5,'citykey1','citykey1','citykey1');

