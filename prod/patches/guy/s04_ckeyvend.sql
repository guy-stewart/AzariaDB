
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
    SIGNAL(S04_BIN,SIG_VEND);'),

-- [0] wait for a signal from the vial that 2 scoops were delivered.
('M04_BIN','0','1','WAIT','SIG_VEND','', '
    ASSIGN(WOBJECT,IDD_CITY_KEY_0);
    SHOW(IDS_KEY_IN_BIN);'),
-- [1] wait for someone to take the key from the bin.
('M04_BIN','1','0','GRAB','','', 'SHOW(0,0);'),

-- [0] start state, init the class acceptor
('M04_KEYCLAMP','0','VACANT','C_ACCEPT','0','IDC_KEY', ''),
-- [1] wait for a dropped key then configure the sliders
('M04_KEYCLAMP','VACANT','OCCUPIED','DROP','0','0', '
WPARM = WOBJECT;
MAP(WPARM, KEY);
SIGNAL(WIP1, SIG_SHOW);
SIGNAL(WIP2, SIG_SHOW);
SIGNAL(WIP3, SIG_SHOW);
SHOW(0,IDS_KEY_CFGWKEY);'),
-- [2] when a slider changes then configure the key
('M04_KEYCLAMP','OCCUPIED','OCCUPIED','WAIT','','','
    REF_MACHINE(WIP1);
    WOBJECT=R_BFRAME*4;
    REF_MACHINE(WIP2);
    WOBJECT=(WOBJECT+R_BFRAME)*4;
    REF_MACHINE(WIP3);
    WOBJECT = WOBJECT + R_BFRAME;
    WOBJECT = "IDD_CITY_KEY_"+WOBJECT;'),
-- [2] when the key is removed then clear the sliders:
('M04_KEYCLAMP','OCCUPIED','VACANT','GRAB','','0','
    SHOW();
    SIGNAL(WIP1, SIG_HIDE);
    SIGNAL(WIP2, SIG_HIDE);
    SIGNAL(WIP3, SIG_HIDE);'),

-- [0] init the sprite for the slider
('M04_SLIDER','0','1','MOV','WSPRITE','WIP1', ''),
('M04_SLIDER','1','idle','SHOW','WSPRITE','', ''),
('M04_SLIDER','idle','1','CLICK','','', '
BFRAME = BFRAME + 1;
if (BFRAME > 3) BFRAME=0;
SIGNAL(WIP2);'),
('M04_SLIDER','idle','1','WAIT','','SIG_SHOW', '
REF_MACHINE(WIP2);
BFRAME= (R_WPARM / WIP3);
MOD(BFRAME,4);'), -- bframe has been modified by the keyclamp.
('M04_SLIDER','idle','1','WAIT','','SIG_HIDE', 'BFRAME=0;');


delete from objects where [object] like 'IDD_CITY_KEY%';
insert into objects values
('IDD_CITY_KEY_0','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_1','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_2','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_3','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_4','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_5','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_6','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_7','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_8','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_9','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_10','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_11','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_12','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_13','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_14','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_15','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_16','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_17','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_18','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_19','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_20','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_21','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_22','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_23','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_24','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_25','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_26','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_27','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_28','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_29','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_30','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_31','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_32','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_33','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_34','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_35','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_36','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_37','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_38','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_39','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_40','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_41','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_42','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_43','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_44','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_45','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_46','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_47','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_48','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_49','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_50','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_51','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_52','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_53','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_54','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_55','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_56','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_57','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_58','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_59','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_60','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_61','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_62','','IDC_KEY','citykey1','citykey1','citykey1'),
('IDD_CITY_KEY_63','','IDC_KEY','citykey1','citykey1','citykey1');

delete from map where op = 'KEY';
insert into map ([op],[key],[value]) values
('KEY','IDD_CITY_KEY_0','0'),
('KEY','IDD_CITY_KEY_1','1'),
('KEY','IDD_CITY_KEY_2','2'),
('KEY','IDD_CITY_KEY_3','3'),
('KEY','IDD_CITY_KEY_4','4'),
('KEY','IDD_CITY_KEY_5','5'),
('KEY','IDD_CITY_KEY_6','6'),
('KEY','IDD_CITY_KEY_7','7'),
('KEY','IDD_CITY_KEY_8','8'),
('KEY','IDD_CITY_KEY_9','9'),
('KEY','IDD_CITY_KEY_10','10'),
('KEY','IDD_CITY_KEY_11','11'),
('KEY','IDD_CITY_KEY_12','12'),
('KEY','IDD_CITY_KEY_13','13'),
('KEY','IDD_CITY_KEY_14','14'),
('KEY','IDD_CITY_KEY_15','15'),
('KEY','IDD_CITY_KEY_16','16'),
('KEY','IDD_CITY_KEY_17','17'),
('KEY','IDD_CITY_KEY_18','18'),
('KEY','IDD_CITY_KEY_19','19'),
('KEY','IDD_CITY_KEY_20','20'),
('KEY','IDD_CITY_KEY_21','21'),
('KEY','IDD_CITY_KEY_22','22'),
('KEY','IDD_CITY_KEY_23','23'),
('KEY','IDD_CITY_KEY_24','24'),
('KEY','IDD_CITY_KEY_25','25'),
('KEY','IDD_CITY_KEY_26','26'),
('KEY','IDD_CITY_KEY_27','27'),
('KEY','IDD_CITY_KEY_28','28'),
('KEY','IDD_CITY_KEY_29','29'),
('KEY','IDD_CITY_KEY_30','30'),
('KEY','IDD_CITY_KEY_31','31'),
('KEY','IDD_CITY_KEY_32','32'),
('KEY','IDD_CITY_KEY_33','33'),
('KEY','IDD_CITY_KEY_34','34'),
('KEY','IDD_CITY_KEY_35','35'),
('KEY','IDD_CITY_KEY_36','36'),
('KEY','IDD_CITY_KEY_37','37'),
('KEY','IDD_CITY_KEY_38','38'),
('KEY','IDD_CITY_KEY_39','39'),
('KEY','IDD_CITY_KEY_40','40'),
('KEY','IDD_CITY_KEY_41','41'),
('KEY','IDD_CITY_KEY_42','42'),
('KEY','IDD_CITY_KEY_43','43'),
('KEY','IDD_CITY_KEY_44','44'),
('KEY','IDD_CITY_KEY_45','45'),
('KEY','IDD_CITY_KEY_46','46'),
('KEY','IDD_CITY_KEY_47','47'),
('KEY','IDD_CITY_KEY_48','48'),
('KEY','IDD_CITY_KEY_49','49'),
('KEY','IDD_CITY_KEY_50','50'),
('KEY','IDD_CITY_KEY_51','51'),
('KEY','IDD_CITY_KEY_52','52'),
('KEY','IDD_CITY_KEY_53','53'),
('KEY','IDD_CITY_KEY_54','54'),
('KEY','IDD_CITY_KEY_55','55'),
('KEY','IDD_CITY_KEY_56','56'),
('KEY','IDD_CITY_KEY_57','57'),
('KEY','IDD_CITY_KEY_58','58'),
('KEY','IDD_CITY_KEY_59','59'),
('KEY','IDD_CITY_KEY_60','60'),
('KEY','IDD_CITY_KEY_61','61'),
('KEY','IDD_CITY_KEY_62','62'),
('KEY','IDD_CITY_KEY_63','63'),
('KEY','IDD_CITY_KEY_64','64');