
delete from games;

delete from spr_names where name = 'IDS_PLAQCHEM';
INSERT INTO "main"."spr_names" ("name", "value", "id") VALUES 
('IDS_PLAQCHEM','PLAQCHEM','');

delete from objects where object like 'IDD_TEMPLATE%';
delete from objects where object like 'IDD_CHEMV%';

insert into objects ([object],[object_id],[class],[icon],[cursor],[actor]) values
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
('IDD_CHEMV20',0x513,'IDC_CHEM','chemv20','chemv20','chemv20');

delete from map where [op] = 'CHEMCOST';
delete from map where [op] = 'TEMPLATE_OBJECTS';
delete from map where [op] = 'TEMPLATE_COST';
delete from map where [op] = 'TEMPLATE_CHEM1';
delete from map where [op] = 'TEMPLATE_CHEM2';
delete from map where [op] = 'CHEM_INDEX';
insert into map ([op],[key],[value]) values 
('CHEMCOST','0','1'),
('CHEMCOST','1','2'),
('CHEMCOST','2','3'),
('CHEMCOST','3','3'),
('CHEMCOST','4','4'),
('CHEMCOST','5','4'),
('CHEMCOST','6','4'),
('CHEMCOST','7','5'),
('CHEMCOST','8','5'),
('CHEMCOST','9','5'),
('CHEMCOST','10','5'),
('CHEMCOST','11','7'),
('CHEMCOST','12','7'),
('CHEMCOST','13','7'),
('CHEMCOST','14','8'),
('CHEMCOST','15','8'),
('CHEMCOST','16','8'),
('CHEMCOST','17','14'),
('CHEMCOST','18','21'),
('CHEMCOST','19','28'),
('CHEM_INDEX','IDD_CHEMV01','0'),
('CHEM_INDEX','IDD_CHEMV02','1'),
('CHEM_INDEX','IDD_CHEMV03','2'),
('CHEM_INDEX','IDD_CHEMV04','3'),
('CHEM_INDEX','IDD_CHEMV05','4'),
('CHEM_INDEX','IDD_CHEMV06','5'),
('CHEM_INDEX','IDD_CHEMV07','6'),
('CHEM_INDEX','IDD_CHEMV08','7'),
('CHEM_INDEX','IDD_CHEMV09','8'),
('CHEM_INDEX','IDD_CHEMV10','9'),
('CHEM_INDEX','IDD_CHEMV11','10'),
('CHEM_INDEX','IDD_CHEMV12','11'),
('CHEM_INDEX','IDD_CHEMV13','12'),
('CHEM_INDEX','IDD_CHEMV14','13'),
('CHEM_INDEX','IDD_CHEMV15','14'),
('CHEM_INDEX','IDD_CHEMV16','15'),
('CHEM_INDEX','IDD_CHEMV17','16'),
('CHEM_INDEX','IDD_CHEMV18','17'),
('CHEM_INDEX','IDD_CHEMV19','18'),
('CHEM_INDEX','IDD_CHEMV20','19'),
('CARD_OBJECTS','IDD_CARD00','IDD_SPELL01'),
('CARD_OBJECTS','IDD_CARD01','IDD_SPELL02'),
('CARD_OBJECTS','IDD_CARD02','IDD_SPELL03'),
('CARD_OBJECTS','IDD_CARD03','IDD_SPELL04'),
('CARD_OBJECTS','IDD_CARD04','IDD_SPELL05'),
('CARD_OBJECTS','IDD_CARD05','IDD_SPELL06'),
('CARD_OBJECTS','IDD_CARD06','IDD_SPELL07'),
('CARD_OBJECTS','IDD_CARD07','IDD_SPELL08'),
('CARD_OBJECTS','IDD_CARD08','IDD_SPELL09'),
('CARD_OBJECTS','IDD_CARD09','IDD_SPELL10'),
('CARD_OBJECTS','IDD_CARD10','IDD_NEWSHOVL'),
('CARD_OBJECTS','IDD_CARD11','IDD_BOMB1'),
('CARD_OBJECTS','IDD_CARD12','IDD_BOMB2'),
('CARD_OBJECTS','IDD_CARD13','IDD_SPELL01'),
('CARD_OBJECTS','IDD_CARD14','IDD_SPELL02'),
('CARD_OBJECTS','IDD_CARD15','IDD_SPELL03'),
('CARD_OBJECTS','IDD_CARD16','IDD_H2OMASK'),
('CARD_OBJECTS','IDD_CARD17','IDD_NYSMASK'),
('CARD_OBJECTS','IDD_CARD18','IDD_SPELL04'),
('CARD_OBJECTS','IDD_CARD19','IDD_SPELL05'),
('CARD_OBJECTS','IDD_CARD20','IDD_SPELL06'),
('CARD_OBJECTS','IDD_CARD21','IDD_SPELL07'),
('CARD_OBJECTS','IDD_CARD22','IDD_MATCH'),
('CARD_OBJECTS','IDD_CARD23','IDD_SPELL08'),
('CARD_OBJECTS','IDD_CARD24','IDD_SPELL09'),
('CARD_OBJECTS','IDD_CARD25','IDD_SPELL10'),
('CARD_OBJECTS','IDD_CARD26','IDD_POLE2'),
('CARD_OBJECTS','IDD_CARD27','IDD_SPELL01'),
('CARD_OBJECTS','IDD_CARD28','IDD_SPELL01'),
('CARD_OBJECTS','IDD_CARD29','IDD_BUCKE'),
('CARD_OBJECTS','IDD_CARD30','IDD_SPELL01'),
('CARD_COST','IDD_CARD00','0'),
('CARD_COST','IDD_CARD01','0'),
('CARD_COST','IDD_CARD02','1'),
('CARD_COST','IDD_CARD03','4'),
('CARD_COST','IDD_CARD04','4'),
('CARD_COST','IDD_CARD05','6'),
('CARD_COST','IDD_CARD06','8'),
('CARD_COST','IDD_CARD07','9'),
('CARD_COST','IDD_CARD08','9'),
('CARD_COST','IDD_CARD09','9'),
('CARD_COST','IDD_CARD10','2'),
('CARD_COST','IDD_CARD11','0'),
('CARD_COST','IDD_CARD12','5'),
('CARD_COST','IDD_CARD13','7'),
('CARD_COST','IDD_CARD14','4'),
('CARD_COST','IDD_CARD15','0'),
('CARD_COST','IDD_CARD16','8'),
('CARD_COST','IDD_CARD17','10'),
('CARD_COST','IDD_CARD18','6'),
('CARD_COST','IDD_CARD19','1'),
('CARD_COST','IDD_CARD20','7'),
('CARD_COST','IDD_CARD21','11'),
('CARD_COST','IDD_CARD22','1'),
('CARD_COST','IDD_CARD23','3'),
('CARD_COST','IDD_CARD24','9'),
('CARD_COST','IDD_CARD25','11'),
('CARD_COST','IDD_CARD26','0'),
('CARD_COST','IDD_CARD27','0'),
('CARD_COST','IDD_CARD28','10'),
('CARD_COST','IDD_CARD29','2'),
('CARD_COST','IDD_CARD30','4'),
('CARD_CHEM1','IDD_CARD00','IDD_CHEMV00'),
('CARD_CHEM1','IDD_CARD01','IDD_CHEMV00'),
('CARD_CHEM1','IDD_CARD02','IDD_CHEMV01'),
('CARD_CHEM1','IDD_CARD03','IDD_CHEMV07'),
('CARD_CHEM1','IDD_CARD04','IDD_CHEMV08'),
('CARD_CHEM1','IDD_CARD05','IDD_CHEMV09'),
('CARD_CHEM1','IDD_CARD06','IDD_CHEMV13'),
('CARD_CHEM1','IDD_CARD07','IDD_CHEMV15'),
('CARD_CHEM1','IDD_CARD08','IDD_CHEMV16'),
('CARD_CHEM1','IDD_CARD09','IDD_CHEMV19'),
('CARD_CHEM1','IDD_CARD10','IDD_CHEMV04'),
('CARD_CHEM1','IDD_CARD11','IDD_CHEMV03'),
('CARD_CHEM1','IDD_CARD12','IDD_CHEMV04'),
('CARD_CHEM1','IDD_CARD13','IDD_CHEMV18'),
('CARD_CHEM1','IDD_CARD14','IDD_CHEMV03'),
('CARD_CHEM1','IDD_CARD15','IDD_CHEMV02'),
('CARD_CHEM1','IDD_CARD16','IDD_CHEMV19'),
('CARD_CHEM1','IDD_CARD17','IDD_CHEMV19'),
('CARD_CHEM1','IDD_CARD18','IDD_CHEMV04'),
('CARD_CHEM1','IDD_CARD19','IDD_CHEMV01'),
('CARD_CHEM1','IDD_CARD20','IDD_CHEMV14'),
('CARD_CHEM1','IDD_CARD21','IDD_CHEMV16'),
('CARD_CHEM1','IDD_CARD22','IDD_CHEMV01'),
('CARD_CHEM1','IDD_CARD23','IDD_CHEMV05'),
('CARD_CHEM1','IDD_CARD24','IDD_CHEMV17'),
('CARD_CHEM1','IDD_CARD25','IDD_CHEMV12'),
('CARD_CHEM1','IDD_CARD26','IDD_CHEMV01'),
('CARD_CHEM1','IDD_CARD27','IDD_CHEMV03'),
('CARD_CHEM1','IDD_CARD28','IDD_CHEMV06'),
('CARD_CHEM1','IDD_CARD29','IDD_CHEMV05'),
('CARD_CHEM1','IDD_CARD30','IDD_CHEMV09'),
('CARD_CHEM2','IDD_CARD00','IDD_CHEMV02'),
('CARD_CHEM2','IDD_CARD01','IDD_CHEMV19'),
('CARD_CHEM2','IDD_CARD02','IDD_CHEMV19'),
('CARD_CHEM2','IDD_CARD03','IDD_CHEMV04'),
('CARD_CHEM2','IDD_CARD04','IDD_CHEMV01'),
('CARD_CHEM2','IDD_CARD05','IDD_CHEMV14'),
('CARD_CHEM2','IDD_CARD06','IDD_CHEMV16'),
('CARD_CHEM2','IDD_CARD07','IDD_CHEMV01'),
('CARD_CHEM2','IDD_CARD08','IDD_CHEMV05'),
('CARD_CHEM2','IDD_CARD09','IDD_CHEMV17'),
('CARD_CHEM2','IDD_CARD10','IDD_CHEMV12'),
('CARD_CHEM2','IDD_CARD11','IDD_CHEMV01'),
('CARD_CHEM2','IDD_CARD12','IDD_CHEMV03'),
('CARD_CHEM2','IDD_CARD13','IDD_CHEMV06'),
('CARD_CHEM2','IDD_CARD14','IDD_CHEMV05'),
('CARD_CHEM2','IDD_CARD15','IDD_CHEMV09'),
('CARD_CHEM2','IDD_CARD16','IDD_CHEMV07'),
('CARD_CHEM2','IDD_CARD17','IDD_CHEMV11'),
('CARD_CHEM2','IDD_CARD18','IDD_CHEMV11'),
('CARD_CHEM2','IDD_CARD19','IDD_CHEMV14'),
('CARD_CHEM2','IDD_CARD20','IDD_CHEMV00'),
('CARD_CHEM2','IDD_CARD21','IDD_CHEMV00'),
('CARD_CHEM2','IDD_CARD22','IDD_CHEMV01'),
('CARD_CHEM2','IDD_CARD23','IDD_CHEMV07'),
('CARD_CHEM2','IDD_CARD24','IDD_CHEMV08'),
('CARD_CHEM2','IDD_CARD25','IDD_CHEMV09'),
('CARD_CHEM2','IDD_CARD26','IDD_CHEMV13'),
('CARD_CHEM2','IDD_CARD27','IDD_CHEMV15'),
('CARD_CHEM2','IDD_CARD28','IDD_CHEMV16'),
('CARD_CHEM2','IDD_CARD29','IDD_CHEMV19'),
('CARD_CHEM2','IDD_CARD30','IDD_CHEMV04');

delete from transitions where name like 'M08_%';
insert into transitions ([name], [state], [new_state], [opcode], [param_1], [param_2], [code]) values
('M08_BEEM','0','1','CLICK','0','0', ''),
('M08_BEEM','0','1','WAIT','0','0', ''),
('M08_BEEM','1','0','VIDEO','0','IDS_BEAMER', ''),

-- bin is where the manufactured item finally appears:
-- M08_BIN(WIP1=S08_CARDHOLD_x, WIP2=S08_HOPPER_x,WIP3=S08_CHEM1_x,WIP4=S08_CHEM2_x'),

('M08_BIN','0','100','WAIT','','',''),
('M08_BIN','0','100','CLICK','','',''),
-- store the card in WPARM
('M08_BIN','100','101','REF_MACHINE','WIP1','','
    MOV (WPARM,R_WOBJECT);
'),
-- no card inserted then bail
('M08_BIN','101','0','EQUALi','WPARM','0', ''),
-- else check for chem1:
/*
// a few facts (predicates):
card_objects(idd_card01,idd_spell01).
card_objects(idd_card02,idd_spell02).
card_objects(idd_card03,idd_spell03).
card_objects(idd_card04,idd_spell04).
card_objects(idd_card05,idd_spell05).
card_objects(idd_card06,idd_spell06).
card_objects(idd_card07,idd_spell07).

:- initialization(main).
main :- card_objects(idd_card04,SPELL),
        write('SPELL' = SPELL).

*/
('M08_BIN','101','102','Z_EPSILON','','','
    MOV(WTEMP1,WPARM);
    MAPi(WTEMP1,CARD_CHEM1);
    REF_MACHINE(WIP2);
'),
-- chem1 does not match inserted card
('M08_BIN','102','0','NEQUAL','WTEMP1','R_WOBJECT', ''),
-- chem1 matches, now check for chem2:
('M08_BIN','102','103','Z_EPSILON','','','
    MOV(WTEMP1,WPARM);
    MAPi(WTEMP1,CARD_CHEM2);
    REF_MACHINE(WIP3);
'),
-- chem2 does not match inserted card
('M08_BIN','103','0','NEQUAL','WTEMP1','R_WOBJECT', ''),
-- chem2 match so now check nystrom balance in hopper:
('M08_BIN','103','104','Z_EPSILON','','','
    MOV(WTEMP1,WPARM);
    MAPi(WTEMP1,CARD_COST);
    REF_MACHINE(WIP4);
'),
('M08_BIN','104','0','LT','R_BPARM','WTEMP1',''),
('M08_BIN','104','200','Z_EPSILON','','','
    SIGNAL(WIP2, SIG_CLEAR);
    SIGNAL(WIP3, SIG_CLEAR);
    SIGNAL(WIP4, SIG_CLEAR);
'),
-- create the object:
('M08_BIN','200','201','Z_EPSILON','','','
    MOV(WOBJECT,WPARM);
    MAPi(WOBJECT,CARD_OBJECTS);
    ASHOW(WOBJECT);'),
('M08_BIN','201','0','GRAB','0','0', 'SHOW();'),

-- CARDHOLD(WIP1=S08_HOPPERxx):
('M08_CARDHOLD','0','10','C_ACCEPT','0','IDC_CARD',''),
('M08_CARDHOLD','10','20','DROP','0','0','
    SHOW(0,IDS_CARDANI);
    ANIMATE(0,V_REVERSE);
    PLAYWAVE(0,SOUND_CARDEJECT);
    MOV(WPARM,WOBJECT);
    SUBI(WPARM,IDD_TEMPLATE01);
    SIGNAL(WIP1);
    SIGNAL(WIP2);
    SIGNAL(WIP3);
    '),
('M08_CARDHOLD','20','30','CLICK','','','
    SHOW(0,IDS_CARDANI);
    ANIMATE();
    PLAYWAVE(0,SOUND_CARDEJECT);'),
('M08_CARDHOLD','30','10','GRAB','0','0','
    CLEAR(WOBJECT);
    CLEAR(WPARM);
    SHOW();
    SIGNAL(WIP2);
    SIGNAL(WIP3);
'),

-- CHEMHOLD(WIP1=CARDHOLD)
('M08_CHEMHOLD1','0','10','C_ACCEPT','0','IDC_CHEM',''),
('M08_CHEMHOLD1','10','20','DROP','','','
    SHOW(WOBJECT);'),
('M08_CHEMHOLD1','20','30','GRAB','','',''),
('M08_CHEMHOLD1','20','30','WAIT','','SIG_CLEAR',''),
('M08_CHEMHOLD1','30','10','Z_EPSILON','','','
    CLEAR(WOBJECT);
    SHOW();'),

-- M08_CHEMIND1(WIP1=CARDHOLD, WIP2=map op)
('M08_CHEMIND1','0','10','Z_EPSILON','','',''),
('M08_CHEMIND1','10','10','WAIT','','','
    REF_MACHINE(WIP1);
    MOV(BFRAME,R_WOBJECT);
    MAP(BFRAME,WIP2);
    MAPi(BFRAME,CHEM_INDEX);
    SHOW(0, IDS_PLAQCHEM);
'),

-- 0: accept nystrom, wait for any object?
('M08_HOPPER','0','5','DRAG','0','IDD_SCOOPF', ''),
('M08_HOPPER','0','1','DROP','0','0', ''),
('M08_HOPPER','1','2','MOV','WPARM','WOBJECT', ''),
('M08_HOPPER','2','20','CLEAR','WOBJECT','', ''),
('M08_HOPPER','5','6','HANDOFF','0','IDD_SCOOPE', ''),
('M08_HOPPER','6','0','ADDI','BPARM','1', ''),
('M08_HOPPER','20','21','SHOW','WPARM','', ''),
-- 21: accept nystrom, wait for any added object? allow grab of existing object
('M08_HOPPER','21','31','DRAG','0','IDD_SCOOPF', ''),
('M08_HOPPER','21','100','DROP','0','0', ''),
('M08_HOPPER','21','22','GRAB','WPARM','', ''),
('M08_HOPPER','22','0','SHOW','0','0', ''),
('M08_HOPPER','31','32','HANDOFF','0','IDD_SCOOPE', ''),
('M08_HOPPER','32','20','ADDI','BPARM','1', ''),
('M08_HOPPER','50','51','SHOW','WOBJECT','', ''),
-- 51: accept nystrom, allow grab, wait for signal (from template holder?)
('M08_HOPPER','51','61','DRAG','0','IDD_SCOOPF', ''),
('M08_HOPPER','51','20','GRAB','0','0', ''),
('M08_HOPPER','51','100','WAIT','0','0', ''),
('M08_HOPPER','61','62','HANDOFF','0','IDD_SCOOPE', ''),
('M08_HOPPER','62','100','ADDI','BPARM','1', ''),
('M08_HOPPER','100','50','NOTSTATE','HAS_TEMPLATE','WIP1', ''),
('M08_HOPPER','100','110','REF_MACHINE','WIP1','', ''),
('M08_HOPPER','110','111','MOV','WTEMP1','R_WPARM', ''),
('M08_HOPPER','111','112','MAPi','WTEMP1','TEMPLATE_CHEM1', ''),
('M08_HOPPER','112','113','ADDI','WTEMP1','IDD_CHEMV01', ''),
('M08_HOPPER','113','121','MOV','WTEMP1','R_WPARM', ''),
('M08_HOPPER','113','50','NEQUAL','WTEMP1','WPARM', ''),
('M08_HOPPER','121','122','MAPi','WTEMP1','TEMPLATE_CHEM2', ''),
('M08_HOPPER','122','123','ADDI','WTEMP1','IDD_CHEMV01', ''),
('M08_HOPPER','123','131','MOV','WTEMP1','R_WPARM', ''),
('M08_HOPPER','123','50','NEQUAL','WTEMP1','WOBJECT', ''),
('M08_HOPPER','131','132','MAPi','WTEMP1','TEMPLATE_COST', ''),
('M08_HOPPER','132','50','GT','WTEMP1','BPARM', ''),
('M08_HOPPER','132','141','SUB','BPARM','WTEMP1', ''),
('M08_HOPPER','141','142','CLEAR','WOBJECT','', ''),
('M08_HOPPER','142','143','CLEAR','WPARM','', ''),
('M08_HOPPER','143','150','SHOW','0','0', ''),
('M08_HOPPER','150','151','MOV','WTEMP1','R_WPARM', ''),
('M08_HOPPER','151','152','MAPi','WTEMP1','TEMPLATE_OBJECTS', ''),
('M08_HOPPER','152','153','SIGNAL','WIP2','', ''),
('M08_HOPPER','153','0','SIGNAL','WIP3','', '');


delete from machines where name like 'S08_%';
insert into machines ([id],[name],[view_id],[view_name],[left],[top],[right],[bottom],[local_visible],[dfa_name], [wip1_name],[wip2_name],[wip3_name],[wip4_name]) values
(0x800,'S08_CARDHOLD_0',0x801,'IDV_MANREP1',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_0','S08_CHEMIND1_0','S08_CHEMIND2_0',''),
(0x801,'S08_HOPPER_0',0x801,'IDV_MANREP1',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_0','S08_BIN_0','S08_BEEM_0',''),
(0x802,'S08_BEEM_0',0x801,'IDV_MANREP1',155,23,160,28,0,'M08_BEEM','','','',''),
(0x803,'S08_BIN_0',0x801,'IDV_MANREP1',180,80,236,136,0,'M08_BIN', 'S08_CARDHOLD_0','S08_CHEM1_0','S08_CHEM2_0','S08_HOPPER_0'),
(0x804,'S08_CHEM1_0',0x801,'IDV_MANREP1',104,247,160,300,0,'M08_CHEMHOLD1','','','',''),
(0x805,'S08_CHEM2_0',0x801,'IDV_MANREP1',260,247,320,300,0,'M08_CHEMHOLD1','','','',''),
(0x806,'S08_CHEMIND1_0',0x801,'IDV_MANREP1',104,200,160,200,0,'M08_CHEMIND1','S08_CARDHOLD_0','CARD_CHEM1','',''),
(0x807,'S08_CHEMIND2_0',0x801,'IDV_MANREP1',260,200,320,200,0,'M08_CHEMIND1','S08_CARDHOLD_0','CARD_CHEM2','',''),

(0x810,'S08_CARDHOLD_1',0x802,'IDV_MANREP2',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_1','','',''),
(0x811,'S08_HOPPER_1',0x802,'IDV_MANREP2',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_1','S08_BIN_1','S08_BEEM_1',''),
(0x812,'S08_BEEM_1',0x802,'IDV_MANREP2',155,23,160,28,0,'M08_BEEM','','','',''),
(0x813,'S08_BIN_1',0x802,'IDV_MANREP2',180,80,236,136,0,'M08_BIN','','','',''),

(0x820,'S08_CARDHOLD_2',0x803,'IDV_MANREP3',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_2','','',''),
(0x821,'S08_HOPPER_2',0x803,'IDV_MANREP3',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_2','S08_BIN_2','S08_BEEM_2',''),
(0x822,'S08_BEEM_2',0x803,'IDV_MANREP3',155,23,160,28,0,'M08_BEEM','','','',''),
(0x823,'S08_BIN_2',0x803,'IDV_MANREP3',180,80,236,136,0,'M08_BIN','','','',''),

(0x830,'S08_CARDHOLD_3',0x804,'IDV_MANREP4',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_3','','',''),
(0x831,'S08_HOPPER_3',0x804,'IDV_MANREP4',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_3','S08_BIN_3','S08_BEEM_3',''),
(0x832,'S08_BEEM_3',0x804,'IDV_MANREP4',155,23,160,28,0,'M08_BEEM','','','',''),
(0x833,'S08_BIN_3',0x804,'IDV_MANREP4',180,80,236,136,0,'M08_BIN','','','',''),
(0x840,'S08_CARDHOLD_4',0x805,'IDV_MANREP5',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_4','','',''),
(0x841,'S08_HOPPER_4',0x805,'IDV_MANREP5',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_4','S08_BIN_4','S08_BEEM_4',''),
(0x842,'S08_BEEM_4',0x805,'IDV_MANREP5',155,23,160,28,0,'M08_BEEM','','','',''),
(0x843,'S08_BIN_4',0x805,'IDV_MANREP5',180,80,236,136,0,'M08_BIN','','','',''),
(0x850,'S08_CARDHOLD_5',0x806,'IDV_MANREP6',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_5','','',''),
(0x851,'S08_HOPPER_5',0x806,'IDV_MANREP6',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_5','S08_BIN_5','S08_BEEM_5',''),
(0x852,'S08_BEEM_5',0x806,'IDV_MANREP6',155,23,160,28,0,'M08_BEEM','','','',''),
(0x853,'S08_BIN_5',0x806,'IDV_MANREP6',180,80,236,136,0,'M08_BIN','','','',''),
(0x860,'S08_CARDHOLD_6',0x807,'IDV_MANREP7',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_6','','',''),
(0x861,'S08_HOPPER_6',0x807,'IDV_MANREP7',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_6','S08_BIN_6','S08_BEEM_6',''),
(0x862,'S08_BEEM_6',0x807,'IDV_MANREP7',155,23,160,28,0,'M08_BEEM','','','',''),
(0x863,'S08_BIN_6',0x807,'IDV_MANREP7',180,80,236,136,0,'M08_BIN','','','',''),
(0x870,'S08_CARDHOLD_7',0x808,'IDV_MANREP8',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_7','','',''),
(0x871,'S08_HOPPER_7',0x808,'IDV_MANREP8',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_7','S08_BIN_7','S08_BEEM_7',''),
(0x872,'S08_BEEM_7',0x808,'IDV_MANREP8',155,23,160,28,0,'M08_BEEM','','','',''),
(0x873,'S08_BIN_7',0x808,'IDV_MANREP8',180,80,236,136,0,'M08_BIN','','','',''),
(0x880,'S08_CARDHOLD_8',0x809,'IDV_MANREP9',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_8','','',''),
(0x881,'S08_HOPPER_8',0x809,'IDV_MANREP9',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_8','S08_BIN_8','S08_BEEM_8',''),
(0x882,'S08_BEEM_8',0x809,'IDV_MANREP9',155,23,160,28,0,'M08_BEEM','','','',''),
(0x883,'S08_BIN_8',0x809,'IDV_MANREP9',180,80,236,136,0,'M08_BIN','','','',''),
(0x890,'S08_CARDHOLD_9',0x810,'IDV_MANREP10',188,174,230,215,0,'M08_CARDHOLD','S08_HOPPER_9','','',''),
(0x891,'S08_HOPPER_9',0x810,'IDV_MANREP10',167,247,255,300,0,'M08_HOPPER','S08_CARDHOLD_9','S08_BIN_9','S08_BEEM_9',''),
(0x892,'S08_BEEM_9',0x810,'IDV_MANREP10',155,23,160,28,0,'M08_BEEM','','','',''),
(0x893,'S08_BIN_9',0x810,'IDV_MANREP10',180,80,236,136,0,'M08_BIN','','','','');
