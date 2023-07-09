delete from games;
-- ALTER TABLE states ADD COLUMN [doc] text;
create table if not exists automatons 
(   [name]    text,
    [start]   text,
    [doc]     text,
    PRIMARY KEY ([name]) ON CONFLICT REPLACE);
    
------------------------------------RESOURCES

-- introducing 'SIG_BURN' used to burn nystrom. I suggest we keep this as a universal signal for all machines ...
insert into constants ([name],[value]) values ('SIG_BURN', 0x1FEEDC0DEF00D);

--where the spells/scrolls currently live
-- ('4609', '0x1201', '4643', 'IDV_TMCUT', '30', '100', '60', '187', '2', 'M_OBJECTBIN', '0x2201', '', '', ''),
-- ('4610', '0x1202', '4643', 'IDV_TMCUT', '60', '100', '90', '187', '2', 'M_OBJECTBIN', '0x2202', '', '', ''),
-- ('4611', '0x1203', '4643', 'IDV_TMCUT', '90', '100', '120', '187', '2', 'M_OBJECTBIN', '0x2203', '', '', ''),
-- ('4612', '0x1204', '4643', 'IDV_TMCUT', '130', '100', '160', '187', '2', 'M_OBJECTBIN', '0x2204', '', '', ''),
-- ('4613', '0x1205', '4643', 'IDV_TMCUT', '160', '100', '190', '187', '2', 'M_OBJECTBIN', '0x2205', '', '', ''),
-- ('4614', '0x1206', '4643', 'IDV_TMCUT', '190', '100', '220', '187', '2', 'M_OBJECTBIN', '0x2206', '', '', ''),
-- ('4615', '0x1207', '4643', 'IDV_TMCUT', '260', '100', '290', '187', '2', 'M_OBJECTBIN', '0x2207', '', '', ''),
-- ('4616', '0x1208', '4643', 'IDV_TMCUT', '330', '100', '360', '187', '2', 'M_OBJECTBIN', '0x2208', '', '', ''),
-- ('4617', '0x1209', '4643', 'IDV_TMCUT', '366', '100', '396', '187', '2', 'M_OBJECTBIN', '0x2209', '', '', ''),
-- ('4618', '0x120a', '4643', 'IDV_TMCUT', '400', '100', '430', '187', '2', 'M_OBJECTBIN', '0x2210', '', '', ''),
-- ('4619', '0x120b', '4643', 'IDV_TMCUT', '435', '100', '465', '187', '2', 'M_OBJECTBIN', '0x2211', '', '', ''),
-- ('4620', '0x120c', '4643', 'IDV_TMCUT', '500', '100', '530', '187', '2', 'M_OBJECTBIN', '0x2212', '', '', ''),
-- ('4621', '0x120d', '4643', 'IDV_TMCUT', '570', '100', '600', '187', '2', 'M_OBJECTBIN', '0x2213', '', '', '');

delete from "main"."spr_names"  where [name] like 'IDS_SCR02%';
delete from "main"."spr_names"  where [name] like 'IDS_LEA%';
delete from "main"."spr_names"  where [name] like 'IDS_FLOWER%';
delete from "main"."spr_names"  where [name] like 'IDS_WILD%';
delete from "main"."spr_names"  where [name] like 'IDS_ROOTDB%';
delete from "main"."spr_names"  where [name] like 'IDS_RAIN%';
INSERT INTO "main"."spr_names" ("name", "value", "id") VALUES 
('IDS_SCR020', 'SCR020', '8736'),
('IDS_SCR021', 'SCR021', '8737'),
('IDS_SCR022', 'SCR022', '8738'),


--some new plants
('IDS_LEAF', 'LEAF', '8507'),
('IDS_FLOWERD', 'FLOWERD', '8508'),
('IDS_FLOWERR', 'FLOWERR', '8509'),
('IDS_WILDBERRY', 'blueberry2', '8527'),
('IDS_ROOTDBL', 'ROOTDBL', '8528'),
('IDS_RAIN', 'RAIN', '8529');

delete from "main"."spr_names"  where [name] like 'IDS_CAN%';
INSERT INTO "main"."spr_names" ("name", "value", "id") 
VALUES 
('IDS_CANGRN1', 'CANGRN1', '4625'),
('IDS_CANGRN2', 'CANGRN2', '4626'),
('IDS_CANGRN3', 'CANGRN3', '4627'),
('IDS_CANGRN4', 'CANGRN4', '4628'),
('IDS_CANNY1', 'CANFLAME', '4629');

delete from "main"."spr_names"  where [name] like 'IDS_PLANTX%';
INSERT INTO "main"."spr_names" ("name", "value", "id") VALUES 
('IDS_PLANTXX', 'PLANTX3', '4613');

delete from objects where [object] like 'IDD_SCR02%';
delete from objects where [object] like 'IDD_LEA%';
delete from objects where [object] like 'IDD_FLOWER%';
delete from objects where [object] like 'IDD_WILD%';
delete from objects where [object] like 'IDD_ROOTDB%';

INSERT INTO "main"."objects" ("object", "object_id", "class", "icon", "cursor", "actor") 
VALUES 
('IDD_SCR020', '8736', 'IDC_SCROLL', 'SCR020', 'SCR020', 'SCR020'),
('IDD_SCR021', '8737', 'IDC_SCROLL', 'SCR021', 'SCR021', 'SCR021'),
('IDD_SCR022', '8738', 'IDC_SCROLL', 'SCR022', 'SCR022', 'SCR022'),

('IDD_LEAF', '18507', '', 'LEAF', 'LEAF', 'LEAF'),
('IDD_FLOWERD', '18508', '', 'FLOWERD', 'FLOWERD', 'FLOWERD'),
('IDD_FLOWERR', '18509', '', 'FLOWERR', 'FLOWERR', 'FLOWERR'),
('IDD_WILDBERRY', '18527', '', 'blueberry2', 'blueberry2', 'blueberry2'),
('IDD_ROOTDBL', '18528', '', 'ROOTDBL', 'ROOTDBL', 'ROOTDBL');


delete from machines where [name] like 'S12_%';
delete from machines where [name] like 'S22_%';

delete from transitions where [automaton] like 'M22_%';

delete from transitions where [automaton] like 'M12_ING%';
delete from transitions where [automaton] like 'M12_x%';

delete from map where op like 'S12_ing_%';
delete from map where op like 'S12_NAT%';


INSERT INTO "main"."map" ("op", "key", "value")
VALUES 
--enchantment
('S12_ING_A', '1', '2'), --red
('S12_ING_B', '1', '1'),--fern
('S12_ING_C', '1', '2'),--red
('S12_ING_D', '1', '1'),
('S12_ING_DA', '1', 'IDD_FISHASH1'),
('S12_ING_NY', '1', '2'),
('S12_ING_LOC', '1', '0'),
('S12_ING_WRD', '1', '0'),
('S12_SCROLL', 'IDD_SCR001', '1'),
('S12_SCROLLL_MK', '1', 'IDD_ENCHANT'),


--stalking
('S12_ING_A', '2', '13'),
('S12_ING_B', '2', ''), --GOPA - change back to 3 gopa and 2 scoops
('S12_ING_C', '2', ''), 
('S12_ING_D', '2', '1'),
('S12_ING_DA', '2', 'IDD_FISHASH1'),
('S12_ING_NY', '2', '1'),
('S12_ING_LOC', '2', '1'),
('S12_ING_WRD', '2', '1'),
('S12_SCROLL', 'IDD_SCR002', '2'),
('S12_SCROLLL_MK', '2', 'IDD_STALKER'),


--Blindness
('S12_ING_A', '3', '6'), 
('S12_ING_B', '3', ''),
('S12_ING_C', '3', '6'), 
('S12_ING_D', '3', '2'),
('S12_ING_DA', '3', 'IDD_FISHASH2'),
('S12_ING_NY', '3', '1'),
('S12_ING_LOC', '3', '2'),
('S12_ING_WRD', '3', '2'),
('S12_SCROLL', 'IDD_SCR003', '3'),
('S12_SCROLLL_MK', '3', 'IDD_BLINDNESS'),

--holding
('S12_ING_A', '4', '13'), 
('S12_ING_B', '4', '0'),
('S12_ING_C', '4', '5'),
('S12_ING_D', '4', '3'),
('S12_ING_DA', '4', 'IDD_FISHASH3'),
('S12_ING_NY', '4', '1'),
('S12_ING_LOC', '4', '3'),
('S12_ING_WRD', '4', '3'),
('S12_SCROLL', 'IDD_SCR004', '4'),
('S12_SCROLLL_MK', '4', 'IDD_HOLDING'),

--transfer
('S12_ING_A', '5', '5'), 
('S12_ING_B', '5', '9'),
('S12_ING_C', '5', '5'),
('S12_ING_D', '5', '2'),
('S12_ING_DA', '5', 'IDD_FISHASH2'),
('S12_ING_NY','5', '2'),
('S12_ING_LOC','5', '0'),
('S12_ING_WRD', '5', '4'),
('S12_SCROLL', 'IDD_SCR005', '5'),
('S12_SCROLLL_MK', '5', 'IDD_TRANSFER'),

--Slarm
('S12_ING_A', '6', '5'), 
('S12_ING_B', '6', ''),
('S12_ING_C', '6', '7'), 
('S12_ING_D', '6', '5'),
('S12_ING_DA', '6', 'IDD_FISHASH5'),
('S12_ING_NY','6', '2'),
('S12_ING_LOC','6', '1'),
('S12_ING_WRD', '6', '5'),
('S12_SCROLL', 'IDD_SCR006', '6'),
('S12_SCROLLL_MK', '6', 'IDD_ALARM'),

--record
('S12_ING_A', '7', '8'), 
('S12_ING_B', '7', '0'),
('S12_ING_C', '7', '8'),
('S12_ING_D', '7', '6'),
('S12_ING_DA', '7', 'IDD_FISHASH6'),
('S12_ING_NY','7', '3'),
('S12_ING_LOC','7', '2'),
('S12_ING_WRD', '7', '6'),
('S12_SCROLL', 'IDD_SCR007', '7'),
('S12_SCROLLL_MK', '7', 'IDD_RECORDER'),

--telekinesis
('S12_ING_A', '8', '7'), 
('S12_ING_B', '8', ''),
('S12_ING_C', '8', '9'),
('S12_ING_D', '8', '7'),
('S12_ING_DA', '8', 'IDD_FISHASH7'),
('S12_ING_NY','8', '3'),
('S12_ING_LOC','8', '3'),
('S12_ING_WRD', '8', '7'),
('S12_SCROLL', 'IDD_SCR008', '8'),
('S12_SCROLLL_MK', '8', 'IDD_TELEKINESIS'),

--Explosion
('S12_ING_A', '9', '10'), 
('S12_ING_B', '9', '12'),
('S12_ING_C', '9', '10'),
('S12_ING_D', '9', '3'),
('S12_ING_DA', '9', 'IDD_FISHASH3'),
('S12_ING_NY','9', '3'),
('S12_ING_LOC','9', '0'),
('S12_ING_WRD', '9', '8'),
('S12_SCROLL', 'IDD_SCR009', '9'),
('S12_SCROLLL_MK', '9', 'IDD_EXPLOSION'),

--Lock
('S12_ING_A', '10', '9'), 
('S12_ING_B', '10', ''),
('S12_ING_C', '10', '1'),
('S12_ING_D', '10', '4'),
('S12_ING_DA', '10', 'IDD_FISHASH4'),
('S12_ING_NY','10', '4'),
('S12_ING_LOC','10', '1'),
('S12_ING_WRD', '10', '9'),
('S12_SCROLL', 'IDD_SCR010', '10'),
('S12_SCROLLL_MK', '10', 'IDD_LOCK'),

--Lock Pick
('S12_ING_A', '11', '6'), 
('S12_ING_B', '11', '5'),
('S12_ING_C', '11', '13'),
('S12_ING_D', '11', '3'),
('S12_ING_DA', '11', 'IDD_FISHASH3'),
('S12_ING_NY','11', '4'),
('S12_ING_LOC','11', '2'),
('S12_ING_WRD', '11', '10'),
('S12_SCROLL', 'IDD_SCR011', '11'),
('S12_SCROLLL_MK', '11', 'IDD_UNLOCK'),

--protection
('S12_ING_A', '12', '11'), 
('S12_ING_B', '12', ''),
('S12_ING_C', '12', '12'),
('S12_ING_D', '12', '4'),
('S12_ING_DA', '12', 'IDD_FISHASH4'),
('S12_ING_NY','12', '9'),
('S12_ING_LOC','12', '3'),
('S12_ING_WRD', '12', '11'),
('S12_SCROLL', 'IDD_SCR012', '12'),
('S12_SCROLLL_MK', '12', 'IDD_PROTECT'),

--Death
('S12_ING_A', '13', '2'), 
('S12_ING_B', '13', '14'),  
('S12_ING_C', '13', '13'),
('S12_ING_D', '13', '10'),
('S12_ING_DA', '13', 'IDD_FISHASH10'),
('S12_ING_NY','13', '5'),
('S12_ING_LOC','13', '0'),
('S12_ING_WRD', '13', '12'),
('S12_SCROLL', 'IDD_SCR013', '13'),
('S12_SCROLLL_MK', '13', 'IDD_DEATH'),


--invisibility
('S12_ING_A', '14', '5'), 
('S12_ING_B', '14', ''),  
('S12_ING_C', '14', '5'),
('S12_ING_D', '14', '4'),
('S12_ING_DA', '14', 'IDD_FISHASH4'),
('S12_ING_NY','14', '5'),
('S12_ING_LOC','14', '1'),
('S12_ING_WRD', '14', '13'),
('S12_SCROLL', 'IDD_SCR014', '14'),
('S12_SCROLLL_MK', '14', 'IDD_INVISIBLE'),

--Strength
('S12_ING_A', '15', ''), 
('S12_ING_B', '15', '4'),  
('S12_ING_C', '15', ''),
('S12_ING_D', '15', '5'),
('S12_ING_DA', '15', 'IDD_FISHASH5'),
('S12_ING_NY','15', '5'),
('S12_ING_LOC','15', '2'),
('S12_ING_WRD', '15', '14'),
('S12_SCROLL', 'IDD_SCR015', '15'),
('S12_SCROLLL_MK', '15', 'IDD_STRENGTH'),


--banishment
('S12_ING_A', '16', '7'), 
('S12_ING_B', '16', ''),  
('S12_ING_C', '16', '6'),
('S12_ING_D', '16', '6'),
('S12_ING_DA', '16', 'IDD_FISHASH6'),
('S12_ING_NY','16', '6'),
('S12_ING_LOC','16', '3'),
('S12_ING_WRD', '16', '15'),
('S12_SCROLL', 'IDD_SCR016', '16'),
('S12_SCROLLL_MK', '16', 'IDD_BANISHMENT'),

--Perception
('S12_ING_A', '17', ''), 
('S12_ING_B', '17', '6'),  
('S12_ING_C', '17', ''),
('S12_ING_D', '17', '0'),
('S12_ING_DA', '9', ''),
('S12_ING_NY','17', '6'),
('S12_ING_LOC','17', '0'),
('S12_ING_WRD', '17', '16'),
('S12_SCROLL', 'IDD_SCR017', '17'),
('S12_SCROLLL_MK', '17', 'IDD_MINDREAD'),

--halucination
('S12_ING_A', '18', '9'), 
('S12_ING_B', '18', '10'),  
('S12_ING_C', '18', '8'),
('S12_ING_D', '18', '8'),
('S12_ING_DA', '18', 'IDD_FISHASH8'),
('S12_ING_NY','18', '6'),
('S12_ING_LOC','18', '1'),
('S12_ING_WRD', '18', '17'),
('S12_SCROLL', 'IDD_SCR018', '18'),
('S12_SCROLLL_MK', '18', 'IDD_HALUCINATE'),

--Breath
('S12_ING_A', '19', ''), 
('S12_ING_B', '19', '13'),  
('S12_ING_C', '19', ''),
('S12_ING_D', '19', ''),
('S12_ING_DA', '19', ''),
('S12_ING_NY','19', '7'),
('S12_ING_LOC','19', '2'),
('S12_ING_WRD', '19', '18'),
('S12_SCROLL', 'IDD_SCR019', '19'),
('S12_SCROLLL_MK', '19', 'IDD_NYBREATH'),

--submerge
('S12_ING_A', '20', '7'), 
('S12_ING_B', '20', '7'),  
('S12_ING_C', '20', '7'),
('S12_ING_D', '20', '7'),
('S12_ING_DA', '20', 'IDD_FISHASH7'),
('S12_ING_NY','20', '8'),
('S12_ING_LOC','20', '1'),
('S12_ING_WRD', '20', '19'),
('S12_SCROLL', 'IDD_SCR020', '20'),
('S12_SCROLLL_MK', '20', 'IDD_SPELL01'),

--Eyespell 
('S12_ING_A', '21', '13'), 
('S12_ING_B', '21', '12'),  
('S12_ING_C', '21', '2'),
('S12_ING_D', '21', '9'),
('S12_ING_DA', '21', 'IDD_FISHASH9'),
('S12_ING_NY','21', '7'),
('S12_ING_LOC','21', '1'),
('S12_ING_WRD', '21', '20'),
('S12_SCROLL', 'IDD_SCR021', '21'),
('S12_SCROLLL_MK', '21', 'IDD_EYESPELL'),

--Memspell (time)
('S12_ING_A', '22', '13'), --CHANGE TO NYSTRAM WALL PLANT
('S12_ING_B', '22', '13'),  
('S12_ING_C', '22', '4'),
('S12_ING_D', '22', '10'),
('S12_ING_DA', '22', 'IDD_FISHASH10'),
('S12_ING_NY','22', '7'),
('S12_ING_LOC','22', '3'),
('S12_ING_WRD', '22', '21'),
('S12_SCROLL', 'IDD_SCR022', '22'),
('S12_SCROLLL_MK', '22', 'IDD_MEMSPELL');

--- CLASS ENTRY FOR THE SPELL ITEMS
-- just cuz
delete from isa where [class] like 'ISA_PLNT%';
INSERT INTO "main"."isa" ("class", "member")
VALUES 
('ISA_PLNT_FENAPRIAL_FERN', 'IDD_FERNLEAF'),
('ISA_PLNT_CASIPEM_BERRYS', 'IDD_REDBERRY'),
('ISA_PLNT_CASIPEM_BERRYS', 'IDD_BLUEBERRY'),
('ISA_PLNT_TREONIC_LEAF', 'IDD_LEAF'),
('ISA_PLNT_PEDOFIC_LEAF', 'IDD_GLEAFSPT'),
('ISA_PLNT_PEDOFIC_LEAF', 'IDD_PLEAFSPT'),
('ISA_PLNT_THINIUS_SPORE', 'IDD_OMUSHSPT'),
('ISA_PLNT_GORDIUS_SPORE', 'IDD_YMUSHSPT'),
('ISA_PLNT_BRUSHERBIUS_FLOWER', 'IDD_FLOWERD'),
('ISA_PLNT_CARTONIST_FLOWER', 'IDD_FLOWERD'),
('ISA_PLNT_CARTONIST_FLOWER', 'IDD_WFLWRSPT'),
('ISA_PLNT_CARTONIST_FLOWER', 'IDD_YFLWRSPT'),
('ISA_PLNT_CARTONIST_FLOWER', 'IDD_PFLWRSPT'),
('ISA_PLNT_SHYANTHIUS_FLOWER', 'IDD_FLOWERR'),
('ISA_PLNT_ITSIUS_BERRY', 'IDD_WILDBERRY'),
('ISA_PLNT_PAKSIUM_ROOT', 'IDD_ROOTDBL'),
('ISA_PLNT_SPECROOT', 'IDD_ROOTBLUE'),
('ISA_PLNT_RIPE_GOPA', 'IDD_GOPAR'),
('ISA_PLNT_RIPE_GOPA', 'IDD_GOPAB');


INSERT INTO "main"."map" ("op", "key", "value")
VALUES 
('S12_NATURE_REP',1,'ISA_PLNT_FENAPRIAL_FERN' ), 
('S12_NATURE_REP',2, 'ISA_PLNT_CASIPEM_BERRYS'), 
('S12_NATURE_REP',3, 'ISA_PLNT_TREONIC_LEAF'), 
('S12_NATURE_REP',4, 'ISA_PLNT_PEDOFIC_LEAF'), 
('S12_NATURE_REP',5, 'ISA_PLNT_THINIUS_SPORE'), 
('S12_NATURE_REP',6, 'ISA_PLNT_GORDIUS_SPORE'), 
('S12_NATURE_REP',7, 'ISA_PLNT_BRUSHERBIUS_FLOWER'), 
('S12_NATURE_REP',8, 'ISA_PLNT_CARTONIST_FLOWER'), 
('S12_NATURE_REP',9, 'ISA_PLNT_SHYANTHIUS_FLOWER'), 
('S12_NATURE_REP',10, 'ISA_PLNT_ITSIUS_BERRY'), 
('S12_NATURE_REP',11, 'ISA_PLNT_PAKSIUM_ROOT'),     
('S12_NATURE_REP',12, 'ISA_PLNT_SPECROOT'),  
('S12_NATURE_REP',13, 'ISA_PLNT_RIPE_GOPA');


--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

--IDS_PLNTSCRL
--IDS_FISHSCRL
--IDS_SHLDSCRL
--SCROLL_NYSTROM
--IDS_VIALSCRL
--IDS_WORDSCRL
--Machines for the spell viewer

INSERT INTO "main"."machines" ("id", "name", "view_id", "view_name", "left", "top", "right", "bottom", "local_visible", "dfa_name", "wip1_name", "wip2_name", "wip3_name", "wip4_name") VALUES 

--('8704', 'S22_SCROLLMAN', '8705', 'IDV_SPELLPAN', '0', '0', '0', '0', '2', 'M22_SCROLLMAN', '', '', '', ''),

('8705', 'S12_SHIELD', '8705', 'IDV_SPELLPAN', '49', '24', '118', '113', '2', 'M12_ING_STD', 'SMP_EYEINFO', 'S12_ING_LOC', 'IDS_SHLDSCRL', ''),
('8706', 'S12_WORD', '8705', 'IDV_SPELLPAN', '133', '62', '354', '89', '2', 'M12_ING_STD', 'SMP_EYEINFO', 'S12_ING_WRD', 'IDS_WORDSCRL', ''),
('8707', 'S12_ING1', '8705', 'IDV_SPELLPAN', '213', '105', '274', '165', '2', 'M12_ING_NATA', 'SMP_EYEINFO', 'S12_ING_A', '', 'IDS_PLNTSCRL'),
('8708', 'S12_ING2', '8705', 'IDV_SPELLPAN', '287', '105', '348', '165', '2', 'M12_ING_NATB', 'SMP_EYEINFO', 'S12_ING_B', '', 'IDS_PLNTSCRL'),
('8709', 'S12_ING3', '8705', 'IDV_SPELLPAN', '367', '105', '423', '165', '2', 'M12_ING_NATC', 'SMP_EYEINFO', 'S12_ING_C', '', 'IDS_PLNTSCRL'),
('8711', 'S12_ING4', '8705', 'IDV_SPELLPAN', '273', '185', '376', '226', '2', 'M12_ING_FSH', 'SMP_EYEINFO', 'S12_ING_D', 'IDS_FISHSCRL', ''),
('8713', 'S12_NYST', '8705', 'IDV_SPELLPAN', '302', '231', '259', '280', '2', 'M12_ING_NY', 'SMP_EYEINFO', 'S12_ING_NY', 'IDS_VIALSCRL', '');

--ref SMP_EYEINFO - THEN, R_WTEMP1 HAS THE SCROL DROPPED


INSERT INTO "main"."transitions" ("automaton", "state", "new_state", "opcode", "param_1", "param_2", "code") 
VALUES 
('M12_ING_STD','0', '1','WAIT', '0', 'SIG_SHOW', ''),
('M12_ING_STD', '1', '0', 'REF_MACHINE', 'WIP1', '0', 'MOV(WPARM,R_WPARM);MOV(BFRAME,WPARM);MAP(BFRAME,WIP2);SHOW(WIP3);'),
('M12_ING_NATA','0', '1','WAIT', '0', 'SIG_SHOW', ''),
('M12_ING_NATA', '1', '0', 'REF_MACHINE', 'WIP1', '0', 'CLEAR(BFRAME);MOV(WPARM,R_WPARM);MOV(BFRAME,WPARM);MAPi(BFRAME,S12_ING_A);SHOW(WIP4);'),
('M12_ING_NATB','0', '1','WAIT', '0', 'SIG_SHOW', ''),
('M12_ING_NATB', '1', '0', 'REF_MACHINE', 'WIP1', '0', 'CLEAR(BFRAME);MOV(WPARM,R_WPARM);MOV(BFRAME,WPARM);MAPi(BFRAME,S12_ING_B);SHOW(WIP4);'),
('M12_ING_NATC','0', '1','WAIT', '0', 'SIG_SHOW', ''),
('M12_ING_NATC', '1', '0', 'REF_MACHINE', 'WIP1', '0', 'CLEAR(BFRAME);MOV(WPARM,R_WPARM);MOV(BFRAME,WPARM);MAPi(BFRAME,S12_ING_C);SHOW(WIP4);'),
('M12_ING_FSH','0', '1','WAIT', '0', 'SIG_SHOW', ''),
('M12_ING_FSH', '1', '0', 'REF_MACHINE', 'WIP1', '0', 'MOV(BFRAME,R_WPARM);MAPi(BFRAME,S12_ING_D);SUBI(BFRAME,1);SHOW(WIP3);'),

('M12_ING_NY','0', '1','WAIT', '0', 'SIG_SHOW', ''),
('M12_ING_NY', '1', '0', 'REF_MACHINE', 'WIP1', '0', 'MOV(BFRAME,R_WPARM);MAPi(BFRAME,S12_ING_NY);SHOW(WIP3);');

---------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
--0 sword tmcu2, 1 tree tmcu1, 2 fire tmcu4, 3 star tmcu3

INSERT INTO "main"."machines" ("id", "name", "view_id", "view_name", "left", "top", "right", "bottom", "local_visible", "dfa_name", "wip1_name", "wip2_name", "wip3_name", "wip4_name") VALUES 

('8714', 'S12_SHELF_1_CANDLE', '4633', 'IDV_TMCU1', '272', '59', '299', '113', '1', 'M12_xCANDLE', 'S12_SHELF_1_CANDLELIGHT', 'S12_SHELF_1_NYSTROMADDED', 'S12_SHELF_1_INGREDIENTS_MGR','S12_SHELF_1_SCROLL'),
('8715', 'S12_SHELF_1_SCROLL', '4633', 'IDV_TMCU1', '132', '200', '250', '230', '1', 'M12_xSCROLL','1','S12_SHELF_1_INGREDIENTS_MGR', 'S12_SHELF_1_CANDLELIGHT','S12_SHELF_1_NYSTROMADDED'),
('8716', 'S12_SHELF_1_ING1', '4633', 'IDV_TMCU1', '55', '80', '116', '141', '1', 'M12_xPLANT', 'S12_SHELF_1_SCROLL', 'S12_ING_A','IDS_PLANTXX', 'S12_SHELF_1_INGREDIENTS_MGR'),
('8717', 'S12_SHELF_1_ING2', '4633', 'IDV_TMCU1', '117', '80', '178', '141', '1', 'M12_xPLANT', 'S12_SHELF_1_SCROLL', 'S12_ING_B','IDS_PLANTXX', 'S12_SHELF_1_INGREDIENTS_MGR'),
('8718', 'S12_SHELF_1_ING3', '4633', 'IDV_TMCU1', '179', '80', '240', '141', '1', 'M12_xPLANT', 'S12_SHELF_1_SCROLL', 'S12_ING_C','IDS_PLANTXX', 'S12_SHELF_1_INGREDIENTS_MGR'),
('8719', 'S12_SHELF_1_ING4', '4633', 'IDV_TMCU1', '117', '130', '165', '180', '1', 'M12_xPLANT', 'S12_SHELF_1_SCROLL', 'S12_ING_DA','IDS_FISHXX', 'S12_SHELF_1_INGREDIENTS_MGR'),
('8720', 'S12_SHELF_1_INGREDIENTS_MGR', '4633', 'IDV_TMCU1', '10', '10', '12', '14', '1', 'M12_xING_MGR', 'S12_SHELF_1_ING1', 'S12_SHELF_1_ING2', 'S12_SHELF_1_ING3', 'S12_SHELF_1_ING4'),

('8721', 'S12_SHELF_1_CANDLELIGHT', '4633', 'IDV_TMCU1', '272', '59', '299', '113','1', 'M12_xCANDLELIGHT', 'IDS_CANNY1', 'S12_SHELF_1_SPELLPORTAL', 'S12_SHELF_1_CANDLE', 'S12_SHELF_1_MAGIC'),
('8722', 'S12_SHELF_1_NYSTROMADDED', '4633', 'IDV_TMCU1', '242','79','320','160', '1', 'M12_xNYSTROMADDED', 'IDS_CANGRN1', '', '', 'S12_SHELF_1_SCROLL'),
('8723', 'S12_SHELF_1_SPELLPORTAL', '4633', 'IDV_TMCU1', '107', '25', '167', '85', '1', 'M12_xSPELLPORTAL', 'S12_SHELF_1_INGREDIENTS_MGR','S12_SHELF_1_SCROLL', 'S12_SHELF_1_CANDLELIGHT', 'S12_SHELF_1_NYSTROMADDED'),
('8724', 'S12_SHELF_1_MAGIC', '4633', 'IDV_TMCU1', '0', '5', '35', '45', '1', 'M12_xMAGIC', '','','','');


delete from transitions where automaton = "M12_xSCROLL";

INSERT INTO "main"."transitions" ("automaton", "state", "new_state", "opcode", "param_1", "param_2", "code", "guard") 
VALUES 

('M12_xSCROLL',0,'vacant','REF_MACHINE', 'WIP2', '0', 'C_ACCEPT(0,IDC_SCROLL);',''), 

('M12_xSCROLL','vacant','occupied','DROP','0','0',
'SHOW(0,IDS_SCRHUNG);
SIGNAL(WIP2,SIG_SHOW);',''),

('M12_xSCROLL', 'occupied', 'vacant', 'GRAB', '0', '',
'SHOW();
// remove the place holders and snuff the candle, drain nystrom
SIGNAL(WIP2,SIG_HIDE);
SIGNAL(WIP3,SIG_HIDE);
SIGNAL(WIP4,SIG_HIDE);',
'');
-------------------------------------------------------------------------------------
insert into automatons values ('M12_xING_MGR', '0',
'used in the temple to hold ingredients for spell making.
WIP1: The scroll holder
WIP2: The scroll map
SIG_SHOW: A scroll was dropped
SIG_HIDE: The scroll was grabbed
SIG_CLOSE: The spell is cast
SIG_CHECK: Check spell ingredients');
INSERT INTO "main"."transitions" ("automaton", "state", "new_state", "opcode", "param_1", "param_2", "code") 
VALUES 

('M12_xING_MGR',0,0,'WAIT','0','SIG_SHOW', '
        SIGNAL(WIP1,SIG_SHOW);
        SIGNAL(WIP2,SIG_SHOW);   
        SIGNAL(WIP3,SIG_SHOW);
        SIGNAL(WIP4,SIG_SHOW);
'),
 ('M12_xING_MGR',0,0,'WAIT','0','SIG_HIDE', '
        SIGNAL(WIP1,SIG_HIDE);
        SIGNAL(WIP2,SIG_HIDE);   
        SIGNAL(WIP3,SIG_HIDE);
        SIGNAL(WIP4,SIG_HIDE);
'),  
('M12_xING_MGR', 0,0, 'WAIT', '', 'SIG_CLOSE', '
        SIGNAL(WIP1,SIG_CLOSE);
        SIGNAL(WIP2,SIG_CLOSE);   
        SIGNAL(WIP3,SIG_CLOSE);
        SIGNAL(WIP4,SIG_CLOSE);
        ASSIGN(BPARM,0);
        ASSIGN(WPARM,0);
'),


--find out how many ingredients to expect filled
-- assess each again and add them to wparm if the wips are in  - if wparm==bparm ritual is good
('M12_xING_MGR',0,0,'WAIT','0','SIG_CHECK',
'BPARM=0;
// check all the machines for ready or idle ...
if (  (IFSTATE(''ready'', WIP1) || IFSTATE(''0'', WIP1))
   && (IFSTATE(''ready'', WIP2) || IFSTATE(''0'', WIP2))
   && (IFSTATE(''ready'', WIP3) || IFSTATE(''0'', WIP3))
   && (IFSTATE(''ready'', WIP4) || IFSTATE(''0'', WIP4))) {
        WRITE(''winner winner chicken dinner'');
        BPARM=1;
        WPARM=1;
}');

-------------------------------------------------------------------------------------

insert into automatons values ('M12_xPLANT', '0',
'used in the temple to hold ingredients for spell making.
WIP1: The scroll holder
WIP2: The scroll map
SIG_SHOW: A scroll was dropped
SIG_HIDE: The scroll was grabbed
SIG_CLOSE: The spell is cast');
delete from states where [automaton] = 'M12_xPLANT';
delete from states where [automaton] = 'M12_xASHSHELF';
insert into states ([automaton],[state],[entry],[exit],[doc]) values

('M12_xPLANT','0','','',
'IDLE
Wait here when no scroll
or ingredient not required 
for the current scroll spell'),

('M12_xPLANT','show_hint',
-- onEnter:
'// find the ingredient
// from S12_ING_x in wip2
// and store in it bframe
REF_MACHINE(WIP1);
BFRAME=R_WOBJECT;
MAPi(BFRAME,S12_SCROLL);
MAP(BFRAME,WIP2);
WACCEPT = BFRAME;
if (WACCEPT > 0) {
        SHOW(WIP3); // show hint
        MAPi(WACCEPT,S12_NATURE_REP);
        C_ACCEPT(WACCEPT);
}',
-- onExit:
'SHOW();',
'1. There is a scroll attached
2. If this ingredient is required
   then a hint is displayed'),

('M12_xPLANT','ready','', '',
'1. There is a scroll attached
2. An ingredient is present'),
------
('M12_xPLANT','no_scroll','', '',
'1. There is no scroll attached
2. An ingredient is present'),

('M12_xPLANT','hold_if_invalid',
-- onEnter:
'// find the ingredient
// from S12_ING_x in wip2
// and store in it bframe
REF_MACHINE(WIP1);
BFRAME=R_WOBJECT;
MAPi(BFRAME,S12_SCROLL);
MAP(BFRAME,WIP2);
WACCEPT = BFRAME;
if (WACCEPT > 0) {
        MAPi(WACCEPT,S12_NATURE_REP);
        C_ACCEPT(WACCEPT);
}','',
'Wait here if the object
is invalid for the spell');


INSERT INTO transitions (automaton,[state],new_state,opcode,param_1,param_2,code,guard,doc) VALUES 
('M12_xPLANT',0,'show_hint','WAIT','','SIG_SHOW','','',''),
--('M12_xPLANT',0,'no_scroll','DROP','','','SHOW(WOBJECT);',''),

('M12_xPLANT','show_hint','ready','DROP','0','0','SHOW(WOBJECT);','',''),
('M12_xPLANT','show_hint',0,'WAIT','','SIG_HIDE','','',''),
('M12_xPLANT','show_hint',0,'Z_EPSILON','','','','(WACCEPT==0)',''),

('M12_xPLANT','ready', 'show_hint', 'GRAB', '0', '0', 'WOBJECT=0;','',''),

('M12_xPLANT','ready', 'no_scroll', 'WAIT', '0', 'SIG_HIDE', '','',''),

('M12_xPLANT','ready',0,'WAIT','','SIG_CLOSE','
WOBJECT=0;
ASHOW();','','consume the object'),

('M12_xPLANT','no_scroll', 'hold_if_invalid', 'WAIT', '0', 'SIG_SHOW', '','',''),
('M12_xPLANT','no_scroll', '0', 'GRAB', '0', '0',
'WOBJECT=0;
SHOW();','','');

INSERT INTO transitions (automaton,[state],new_state,opcode,param_1,param_2,code,guard,doc) VALUES 

-- ('M12_xPLANT','hold_if_invalid', 'test', 'Z_EPSILON', '0','','','',''),
('M12_xPLANT','hold_if_invalid', 'ready', 'IS_A', 'WOBJECT','WACCEPT','','',''),
-- ('M12_xPLANT','test', 'invalid', 'Z_EPSILON', '','','','',''),

('M12_xPLANT','hold_if_invalid', 'show_hint', 'GRAB', '','','','',''),
('M12_xPLANT','hold_if_invalid', 'no_scroll', 'WAIT', '','SIG_HIDE','','','');


-------------------------------------------------------------------------------------
insert into automatons values ('M12_xCANDLE', '0',
' The candle casts the spell.
WIP1: CANDLELIGHT
WIP2: NYSTROMADDED
WIP3: INGREDIENTS_MGR
WIP4: SCROLL holder
SIG_EMPTY: From candlelight when candle burns out
');
insert into states ([automaton],[state],[entry],[exit],[doc]) values
('M12_xCANDLE','0','',
'REF_MACHINE(WIP4);    // ... the scroll holder
BFRAME=R_WOBJECT;       // ... the scroll 
MAPi(BFRAME,S12_SCROLL); // ... the spell id
MAPi(BFRAME,S12_ING_NY);   // ... the spell cost
','');

INSERT INTO transitions (automaton,[state],new_state,opcode,param_1,param_2,code) VALUES 

('M12_xCANDLE', '0', '0', 'DRAG', '0', 'IDD_MATCH', '

// magic candle can''t light without enough nystrom!
if (BPARM == BFRAME) {
    // check to see if the spell is ready
    SIGNAL(WIP3, SIG_CHECK);
    REF_MACHINE(WIP3);
    if ((R_WPARM > 0) && (R_WPARM == R_BPARM)) {
                SIGNAL(WIP1, SIG_SHOW); // WIP1 is the candle light
                BPARM = 0; // --BPARM GOES TO ZERO AS THE NYSTROM CATCHES FIRE
        }
    }
}
'),
('M12_xCANDLE', '0', '0', 'DRAG', '0', 'IDD_SCOOPF', '
/*   BFRAME is how much for the spell
     BPARM is how much stored in the candle
*/
if (BPARM < BFRAME) {    // BPARM is how much stored in the candle
    ADDI(BPARM,1);
    PLAYWAVE(SOUND_SLURP);
    SIGNAL(WIP2, SIG_SHOW); // WIP2 is the nystrom meter (M12_xNYSTROMADDED)
    HANDOFF(0,IDD_SCOOPE);
}'), 
('M12_xCANDLE', '0', '0', 'WAIT', '', 'SIG_EMPTY', '
ASSIGN(BPARM,0);SIGNAL(WIP2,SIG_HIDE);'),
('M12_xCANDLE', '0', '0', 'CLICK', '0', '0', 'SIGNAL(WIP1,SIG_HIDE);'),


-------------------------------------------------------------------------------------

('M12_xCANDLELIGHT', '0', '0', 'WAIT', '', 'SIG_SHOW', '
MOV(WSPRITE,WIP1);
ASHOW(WIP1);
PLAYWAVE(SOUND_FIRE);
SIGNAL(WIP4, SIG_SHOW); // play magic and light wick
SIGNAL(WIP2, SIG_SHOW);'),
('M12_xCANDLELIGHT', '0', '0', 'WAIT', '', 'SIG_HIDE', '
CLEAR(WSPRITE);
ASHOW(0);
SIGNAL(WIP3,SIG_EMPTY);'),

-- WIP4 is the scroll
('M12_xNYSTROMADDED', '0', '0', 'WAIT', '', 'SIG_HIDE', 'SHOW();'),
('M12_xNYSTROMADDED', '0', '0', 'WAIT', '', 'SIG_SHOW', 'SHOW(IDS_CANGRN1);'),

--get the total amount required for the spell from the map
-- magic candle doesn't take more than is needed
-- ('M12_xCANDLE', '100', '101', 'REF_MACHINE', 'WIP4', '0', 'MOV(BFRAME,R_WPARM);MAPi(BFRAME,S12_ING_NY);'),--BFRAME is how much for the spell
/*
('M12_xNYSTROMADDED', '101', '0', 'LT', 'BPARM', 'BFRAME', '
ADDI(BPARM,1);
PLAYWAVE(SOUND_SLURP);
SHOW(IDS_CANGRN1);
HANDOFF(0,IDD_SCOOPE);'),
('M12_xNYSTROMADDED', '101', '0', 'Z_EPSILON', '', '', ''),
*/

-------------------------------------------------------------------------------------
('M12_xMAGIC', 0, 10, 'WAIT', '', 'SIG_SHOW', ''),
('M12_xMAGIC', 10, 11, 'VIDEO', '', 'IDS_RAIN', ''),
('M12_xMAGIC', 11, 0, 'Z_EPSILON', '', '', ''),

-------------------------------------------------------------------------------------
('M12_xSPELLPORTAL', '0', 'ready', 'WAIT', '', 'SIG_SHOW', '
SIGNAL(WIP1, SIG_CLOSE);
REF_MACHINE(WIP2);
WOBJECT=R_WOBJECT;
MAPi(WOBJECT,S12_SCROLL);
MAPi(WOBJECT,S12_SCROLLL_MK);
ASHOW(WOBJECT);
'),

('M12_xSPELLPORTAL','ready','0','GRAB','','',
'WOBJECT=0;
SHOW();
SIGNAL(WIP3,SIG_HIDE);
SIGNAL(WIP4,SIG_HIDE);
SIGNAL(WIP1,SIG_SHOW);');

