delete from games;

------------------------------------RESOURCES


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
INSERT INTO "main"."spr_names" ("name", "value", "id") VALUES 
('IDS_SCR020', 'SCR020', '8736'),
('IDS_SCR021', 'SCR021', '8737'),
('IDS_SCR022', 'SCR022', '8738'),


--some new plants
('IDS_LEAF', 'LEAF', '8507'),
('IDS_FLOWERD', 'FLOWERD', '8508'),
('IDS_FLOWERR', 'FLOWERR', '8509'),
('IDS_WILDBERRY', 'blueberry2', '8527'),
('IDS_ROOTDBL', 'ROOTDBL', '8528');

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

delete from transitions where [name] like 'M22_%';

delete from transitions where [name] like 'M12_ING%';
delete from transitions where [name] like 'M12_x%';

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
('S12_ING_B', '2', '13'), --GOPA
('S12_ING_C', '2', '13'), 
('S12_ING_D', '2', '1'),
('S12_ING_DA', '2', 'IDD_FISHASH1'),
('S12_ING_NY', '2', '2'),
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
('S12_ING_B', '6', '3'),
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


INSERT INTO "main"."transitions" ("name", "state", "new_state", "opcode", "param_1", "param_2", "code") 
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
('8715', 'S12_SHELF_1_SCROLL', '4633', 'IDV_TMCU1', '132', '201', '250', '271', '1', 'M12_xSCROLL',1,'S12_SHELF_1_INGREDIENTS_MGR', 'S12_SHELF_1_CANDLELIGHT','S12_SHELF_1_NYSTROMADDED'),
('8716', 'S12_SHELF_1_ING1', '4633', 'IDV_TMCU1', '55', '80', '116', '141', '1', 'M12_xPLANT', 'S12_SHELF_1_SCROLL', 'S12_ING_A','IDS_PLANTXX', 'S12_NATURE_REP'),
('8717', 'S12_SHELF_1_ING2', '4633', 'IDV_TMCU1', '117', '80', '178', '141', '1', 'M12_xPLANT', 'S12_SHELF_1_SCROLL', 'S12_ING_B','IDS_PLANTXX', ''),
('8718', 'S12_SHELF_1_ING3', '4633', 'IDV_TMCU1', '179', '80', '240', '141', '1', 'M12_xPLANT', 'S12_SHELF_1_SCROLL', 'S12_ING_C','IDS_PLANTXX', ''),
('8719', 'S12_SHELF_1_ING4', '4633', 'IDV_TMCU1', '117', '130', '165', '180', '1', 'M12_xASHSHELF', 'S12_SHELF_1_SCROLL', 'S12_ING_DA','IDS_FISHXX', ''),
('8720', 'S12_SHELF_1_INGREDIENTS_MGR', '4633', 'IDV_TMCU1', '10', '10', '12', '14', '1', 'M12_xING_MGR', 'S12_SHELF_1_ING1', 'S12_SHELF_1_ING2', 'S12_SHELF_1_ING3', 'S12_SHELF_1_ING4'),

('8721', 'S12_SHELF_1_CANDLELIGHT', '4633', 'IDV_TMCU1', '272', '59', '299', '113','1', 'M12_xCANDLELIGHT', 'IDS_CANNY1', 'S12_SHELF_1_SPELLPORTAL', '', ''),
('8722', 'S12_SHELF_1_NYSTROMADDED', '4633', 'IDV_TMCU1', '242','79','320','160', '1', 'M12_xNYSTROMADDED', 'IDS_CANGRN1', '', '', ''),
('8723', 'S12_SHELF_1_SPELLPORTAL', '4633', 'IDV_TMCU1', '109', '84', '185', '150', '1', 'M12_xSPELLPORTAL', 'S12_SHELF_1_INGREDIENTS_MGR','S12_SHELF_1_SCROLL', 'S12_SHELF_1_ING2', '');



INSERT INTO "main"."transitions" ("name", "state", "new_state", "opcode", "param_1", "param_2", "code") 
VALUES 

('M12_xSCROLL',0,5,'C_ACCEPT','0','IDC_SCROLL', ''),
('M12_xSCROLL',5,10,'DROP','0','0',''),
('M12_xSCROLL', 10, 11, 'SHOW', '', 'IDS_SCRHUNG', 'MOV(WPARM,WOBJECT); MAPi(WPARM,S12_SCROLL);'),
('M12_xSCROLL', 11, 12, 'MOV', 'WTEMP1', 'WPARM', 'MAPi(WTEMP1,S12_ING_LOC);'), --Now WTEMP1 should be the spells acceptable loc
('M12_xSCROLL', 12, 15, 'NEQUALi', 'WTEMP1', 1, ''), --force them to take it back
('M12_xSCROLL', 15, 0, 'GRAB', '0', '','SHOW();'), -- change to play a bomp sound
--signal ingredients to look themselves up with this wparm
('M12_xSCROLL', 12, 20, 'Z_EPSILON', '', '', '
        SIGNAL(WIP2,SIG_SHOW);  
'),
('M12_xSCROLL', 20, 21, 'GRAB', '0', '','SHOW();'),
('M12_xSCROLL', 21, 0, 'SIGNAL', 'WIP2', 'SIG_HIDE','SIGNAL(WIP3,SIG_HIDE); SIGNAL(WIP4,SIG_HIDE);'), --remove the place holders and snuff the candle, drain nystrom
-------------------------------------------------------------------------------------
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
('M12_xING_MGR', 0,30, 'WAIT', '', 'SIG_CLOSE', '
        SIGNAL(WIP1,SIG_CLOSE);
        SIGNAL(WIP2,SIG_CLOSE);   
        SIGNAL(WIP3,SIG_CLOSE);
        SIGNAL(WIP4,SIG_CLOSE);
'),


('M12_xING_MGR',0,9,'WAIT','0','SIG_CHECK', ''),
--find out how many ingredients to expect filled
-- assess each again and add them to wparm if the wips are in state 10 (and > 0) - if wparm GEi bparm ritual is good
('M12_xING_MGR',9,10,'ASSIGN','BPARM',0, ''),
('M12_xING_MGR',10,11,'REF_MACHINE','WIP1','', 'ADD(BPARM,R_WPARM);'),
('M12_xING_MGR',11,12,'REF_MACHINE','WIP2','', 'ADD(BPARM,R_WPARM);'),
('M12_xING_MGR',12,13,'REF_MACHINE','WIP3','', 'ADD(BPARM,R_WPARM);'),
('M12_xING_MGR',13,19,'REF_MACHINE','WIP4','', 'ADD(BPARM,R_WPARM);'),
('M12_xING_MGR',19,20,'ASSIGN','WPARM',0, ''),
('M12_xING_MGR',20,21,'REF_MACHINE','WIP1','', ''),
('M12_xING_MGR',21,22,'IFSTATE','10','WIP1', 'ADD(WPARM,R_WPARM);'),
('M12_xING_MGR',21,22,'Z_EPSILON','','', ''),
('M12_xING_MGR',22,23,'REF_MACHINE','WIP2','', ''),
('M12_xING_MGR',23,24,'IFSTATE','10','WIP2', 'ADD(WPARM,R_WPARM);'),
('M12_xING_MGR',23,24,'Z_EPSILON','','', ''),
('M12_xING_MGR',24,25,'REF_MACHINE','WIP3','', ''),
('M12_xING_MGR',25,26,'IFSTATE','10','WIP3', 'ADD(WPARM,R_WPARM);'),
('M12_xING_MGR',25,26,'Z_EPSILON','','', ''),
('M12_xING_MGR',26,27,'REF_MACHINE','WIP4','', ''),
('M12_xING_MGR',27,0,'IFSTATE','10','WIP4', 'ADD(WPARM,R_WPARM);'),
('M12_xING_MGR',27,0,'Z_EPSILON','','', ''),

-------------------------------------------------------------------------------------
('M12_xPLANT',0,5,'WAIT','','SIG_SHOW','REF_MACHINE(WIP1);MOV(BFRAME,R_WPARM);MAP(BFRAME,WIP2);'), -- go find your frame from S12_ING_A in wip 2
('M12_xPLANT',5,6,'GT','BFRAME','0','ASSIGN(WPARM,1);'), --we expect something
('M12_xPLANT',5,0,'Z_EPSILON','','','ASSIGN(WPARM,0)'), 
('M12_xPLANT',6,7,'SHOW','WIP3','',''),-- Show the plant outline (BFRAME holds the ing number)
('M12_xPLANT',7,0,'Z_EPSILON','','','
        MOV(WOBJECT,BFRAME);
        MAPi(WOBJECT,S12_NATURE_REP);
        C_ACCEPT(WOBJECT);'), --WOBJECT SHOULD NOW BE A CLASS

('M12_xPLANT',0,9,'DROP','0','0',''),
('M12_xPLANT',9,10,'SHOW','WOBJECT','0',''),
('M12_xPLANT',10, 11, 'GRAB', '0', '0', ''),
('M12_xPLANT', 11, 12, 'CLEAR', 'BFRAME', '', ''),
('M12_xPLANT', 12, 13, 'CLEAR', 'WOBJECT', '', ''),
('M12_xPLANT', 13, 0, 'SHOW', '0', '0', ''),

('M12_xPLANT',0,20,'WAIT','','SIG_HIDE',''),-- this crashes if I put the SHOW() in the code here
('M12_xPLANT',20,21,'SHOW','0','0',''),
('M12_xPLANT',21,0,'Z_EPSILON','','',''), --

('M12_xPLANT',0,30,'WAIT','','SIG_CLOSE',''),--SWALLOW UP THE OBJECT
('M12_xPLANT', 30, 31, 'ASSIGN', 'WOBJECT', '0', 'CLEAR(WOBJECT);ASHOW();'),
('M12_xPLANT', 31, 0, 'Z_EPSILON', '', '', ''),



-------------------------------------------------------------------------------------
('M12_xASHSHELF',0,4,'WAIT','','SIG_SHOW','REF_MACHINE(WIP1);MOV(WOBJECT,R_WPARM);MAP(WOBJECT,WIP2);'), -- go find your fishash from S12_ING_DA in wip 2
('M12_xASHSHELF',4,5,'MOV','BFRAME','R_WPARM','
        MAP(BFRAME,S12_ING_D);
        O_ACCEPT(WOBJECT);
        SHOW(WIP3);'),
('M12_xASHSHELF',5,0,'GT','BFRAME','0','ASSIGN(WPARM,1);'), --we expect something
('M12_xASHSHELF',5,0,'Z_EPSILON','','','ASSIGN(WPARM,0);'),      

('M12_xASHSHELF',0,9,'DROP','0','0',''),
('M12_xASHSHELF',9,10,'SHOW','WOBJECT','0',''),
('M12_xASHSHELF',10, 11, 'GRAB', '0', '0', ''),
('M12_xASHSHELF', 11, 0, 'CLEAR', 'BFRAME', '', '
        CLEAR(WOBJECT);
        SHOW();'),
('M12_xASHSHELF',0,20,'WAIT','','SIG_HIDE',''),
('M12_xASHSHELF',20,21,'SHOW','0','0',''),
('M12_xASHSHELF',21,0,'Z_EPSILON','','',''),

('M12_xASHSHELF',0,30,'WAIT','','SIG_CLOSE',''),--SWALLOW UP THE OBJECT
('M12_xASHSHELF', 30, 31, 'ASSIGN', 'WOBJECT', '0', 'CLEAR(WOBJECT);ASHOW();'),
('M12_xASHSHELF', 31, 0, 'Z_EPSILON', '', '', ''),
-------------------------------------------------------------------------------------
-- CANGRN4 245,84,333,164
-- CANGRN3 244,85,325,170
-- CANGRN2 250,85,330,166
-- CANGRN1 241,82,320,160


('M12_xCANDLE', '0', '10', 'DRAG', '0', 'IDD_MATCH', ''),
('M12_xCANDLE', '0', '0', 'CLICK', '0', '0', 'SIGNAL(WIP1,SIG_HIDE);'),

('M12_xCANDLE', '0', '100', 'DRAG', '0', 'IDD_SCOOPF', ''),

-- magic candle can't light without enough nystrom!
('M12_xCANDLE', '10', '15', 'REF_MACHINE', 'WIP4', '0', 'MOV(BFRAME,R_WPARM);MAPi(BFRAME,S12_ING_NY);'),
('M12_xCANDLE', '15', '20', 'EQUAL', 'BPARM', 'BFRAME', ''),
('M12_xCANDLE', '15', '0', 'Z_EPSILON', '', '', ''),

-- magic candle only lights when the spell is ready
('M12_xCANDLE', '20', '21', 'SIGNAL', 'WIP3', 'SIG_CHECK', 'REF_MACHINE(WIP3);'), -- check the ingredients
('M12_xCANDLE', '21', '0', 'EQUAL', 'R_WPARM', 'R_BPARM', 'SIGNAL(WIP1,SIG_SHOW);'), 
('M12_xCANDLE', '21', '0', 'Z_EPSILON', '', '', ''),


--get the total amount required for the spell from the map
-- magic candle doesn't take more than is needed
('M12_xCANDLE', '100', '101', 'REF_MACHINE', 'WIP4', '0', 'MOV(BFRAME,R_WPARM);MAPi(BFRAME,S12_ING_NY);'),
('M12_xCANDLE', '101', '102', 'LT', 'BPARM', 'BFRAME', 'ADDI(BPARM,1);PLAYWAVE(SOUND_SLURP);SIGNAL(WIP2,SIG_SHOW);'),
('M12_xCANDLE', '101', '0', 'Z_EPSILON', '', '', ''),
('M12_xCANDLE', '102', '0', 'HANDOFF', '0', 'IDD_SCOOPE', ''),

-------------------------------------------------------------------------------------

('M12_xCANDLELIGHT', '0', '0', 'WAIT', '', 'SIG_SHOW', 'MOV(WSPRITE,WIP1);ASHOW(WIP1);SIGNAL(WIP2,SIG_SHOW);'),
('M12_xCANDLELIGHT', '0', '0', 'WAIT', '', 'SIG_HIDE', 'CLEAR(WSPRITE);ASHOW(0);'),

('M12_xNYSTROMADDED', '0', '0', 'WAIT', '', 'SIG_SHOW', 'MOV(WSPRITE,WIP1);SHOW(WIP1);'),
('M12_xNYSTROMADDED', '0', '0', 'WAIT', '', 'SIG_HIDE', 'CLEAR(WSPRITE);SHOW(0);'),

-------------------------------------------------------------------------------------
--remove ingredients
--play animation
--present spell
('M12_xSPELLPORTAL', '0', '1', 'WAIT', '', 'SIG_SHOW', ''),
('M12_xSPELLPORTAL', '1', '0', 'SIGNAL', 'SIG_CLOSE', 'WIP1', ''),
('M12_xSPELLPORTAL', '2', '3', 'REF_MACHINE', 'WIP2', '', '
        MOV(WPARM,R_WPARM);
        MAPi(WPARM,S12_SCROLLL_MK);
        MOV(WOBJECT,WPARM); 
'),
('M12_xSPELLPORTAL', '3', '0', 'ASHOW', 'WOBJECT', '', '');
