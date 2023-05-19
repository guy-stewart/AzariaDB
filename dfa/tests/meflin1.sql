

delete from games;

------------------------------------RESOURCES
delete from idv where name = 'IDV_MEFPAN';
delete from views where view_name = 'IDV_MEFPAN';
INSERT INTO "main"."idv" ("name", "id") VALUES ('IDV_MEFPAN', '9802');
INSERT INTO "main"."views" ("view_id", "view_name", "Z", "backgroundAudio", "locator_view", "behavior_id", "portal_filename", "surface_filename") VALUES ('9802', 'IDV_MEFPAN', '1', '0', '1', '1', 'wdepanel.vct', 'PARCHPAN');

-- the first one is neelp
--S33_Neelp NEELPQ1

delete from spr_names where name = 'IDS_M1SWAY';
delete from spr_names where name = 'IDS_M1SWAYB';
delete from spr_names where name = 'IDS_M1SWAYC';
delete from spr_names where name = 'IDS_M1A1ANIM';
delete from spr_names where name = 'IDS_M1I1ANIM';
delete from spr_names where name = 'IDS_M1J1ANIM';
delete from spr_names where name = 'IDS_M1P1ANIM';
delete from spr_names where name = 'IDS_M1S1ANIM';
delete from spr_names where name = 'IDS_M1S2ANIM';
delete from spr_names where name = 'IDS_M1T1ANIM';

--PERST
--Audio prefix MPM1A.
delete from spr_names where name = 'IDS_M2A10001';
delete from spr_names where name = 'IDS_M2FIDDLE';
delete from spr_names where name = 'IDS_M2H10000';
delete from spr_names where name = 'IDS_M2I10000';
delete from spr_names where name = 'IDS_M2P10000';
delete from spr_names where name = 'IDS_M2S10000';
delete from spr_names where name = 'IDS_M2S20000';
delete from spr_names where name = 'IDS_M2T10000';

--RATHE
--Audio prefix MSM1A
delete from spr_names where name = 'IDS_M6A10000';
delete from spr_names where name = 'IDS_M6H10000';
delete from spr_names where name = 'IDS_M6I10000';
delete from spr_names where name = 'IDS_M6P10000';
delete from spr_names where name = 'IDS_M6S10000';
delete from spr_names where name = 'IDS_M6S20000';
delete from spr_names where name = 'IDS_M6STIR';
delete from spr_names where name = 'IDS_M6T10000';

-- OLD GUY - IN RESERVE FOR NOW

delete from spr_names where name = 'IDS_MSA10001';
delete from spr_names where name = 'IDS_MSH10001';
delete from spr_names where name = 'IDS_MSI10001';
delete from spr_names where name = 'IDS_MSP10001';
delete from spr_names where name = 'IDS_MSS10001';
delete from spr_names where name = 'IDS_MSS20001';
delete from spr_names where name = 'IDS_MSSQUAT';
delete from spr_names where name = 'IDS_MST1001';
delete from spr_names where name = 'IDS_MST10001';


--THAOR Audio prefix MY(G and M)
--MYM1A
delete from spr_names where name = 'IDS_MYA10000';
delete from spr_names where name = 'IDS_MYH10000';
delete from spr_names where name = 'IDS_MYI10000';
delete from spr_names where name = 'IDS_MYJUGGLE';
delete from spr_names where name = 'IDS_MYP10000';
delete from spr_names where name = 'IDS_MYS10000';
delete from spr_names where name = 'IDS_MYS20000';
delete from spr_names where name = 'IDS_MYT10000';

INSERT INTO "main"."spr_names" ("name", "value", "id") 
VALUES 
('IDS_M1SWAY', 'M1SWAY', '15001'),
('IDS_M1A1ANIM', 'M1A1ANIM', '15002'),
('IDS_M1I1ANIM', 'M1I1ANIM', '15003'),
('IDS_M1J1ANIM', 'M1J1ANIM', '15004'),
('IDS_M1P1ANIM', 'M1P1ANIM', '15005'),
('IDS_M1S1ANIM', 'M1S1ANIM', '15006'),
('IDS_M1S2ANIM', 'M1S2ANIM', '15043'),
('IDS_M1SWAYB', 'M1SWAYB', '15007'),
('IDS_M1SWAYC', 'M1SWAYC', '15008'),
('IDS_M1T1ANIM', 'M1T1ANIM', '15009'),

('IDS_M2A10001', 'M2A10001', '15010'),
('IDS_M2FIDDLE', 'M2FIDDLE', '15011'),
('IDS_M2H10000', 'M2H10000', '15012'),
('IDS_M2I10000', 'M2I10000', '15013'),
('IDS_M2P10000', 'M2P10000', '15014'),
('IDS_M2S10000', 'M2S10000', '15015'),
('IDS_M2S20000', 'M2S20000', '15016'),
('IDS_M2T10000', 'M2T10000', '15017'),

('IDS_M6A10000', 'M6A10000', '15018'),
('IDS_M6H10000', 'M6H10000', '15019'),
('IDS_M6I10000', 'M6I10000', '15020'),
('IDS_M6P10000', 'M6P10000', '15021'),
('IDS_M6S10000', 'M6S10000', '15022'),
('IDS_M6S20000', 'M6S20000', '15023'),
('IDS_M6STIR', 'M6STIR', '15024'),
('IDS_M6T10000', 'M6T10000', '15025'),

('IDS_MSA10001', 'MSA10001', '15026'),
('IDS_MSH10001', 'MSH10001', '15027'),
('IDS_MSI10001', 'MSI10001', '15028'),
('IDS_MSP10001', 'MSP10001', '15029'),
('IDS_MSS10001', 'MSS10001', '15030'),
('IDS_MSS20001', 'MSS20001', '15031'),
('IDS_MSSQUAT', 'MSSQUAT', '15032'),
('IDS_MST1001', 'MST1001', '15033'),
('IDS_MST10001', 'MST10001', '15034'),

('IDS_MYA10000', 'MYA10000', '15035'),
('IDS_MYH10000', 'MYH10000', '15036'),
('IDS_MYI10000', 'MYI10000', '15037'),
('IDS_MYJUGGLE', 'MYJUGGLE', '15038'),
('IDS_MYP10000', 'MYP10000', '15039'),
('IDS_MYS10000', 'MYS10000', '15040'),
('IDS_MYS20000', 'MYS20000', '15041'),
('IDS_MYT10000', 'MYT10000', '15042');


delete from sounds where name = 'SOUND_NEELPQ1';
insert into sounds values ('SOUND_NEELPQ1','NEELPQ1',26); 
-------------------------------------------------------------------


delete from machines where name = 'S33_NEELP';
delete from machines where name = 'S33_NEELP_Q1';
INSERT INTO "main"."machines" ("id", "name", "view_id", "view_name", "left", "top", "right", "bottom", "local_visible", "dfa_name", "wip1_name", "wip1_value", "wip2_name", "wip2_value", "wip3_name", "wip3_value", "wip4_name", "wip4_value") 
VALUES 
-- ALSO MAKE A MACHINE CALLED A MEF_COORDINATOR WHICH HOLDS QUEST PROGRESS AS TRANSITIONS AND CAN MOVE THE MEFLIN TO NEW POSITIONS

('15500', 'S33_NEELP', '8101', 'IDV_N2B', '140', '100', '300', '300', '0','M_MEF_APPROACH','IDS_M1SWAY','15001','', '', '', '', '', ''),
('15501', 'S33_NEELP_Q1', '5', 'IDV_OTHERID', '0', '0', '80', '100', '1','M_MEF_TALK','IDS_MYS10000','15040','', '', 'SOUND_NEELPQ1', '26', '', '');

delete from transitions where name = 'M_MEF_APPROACH';
INSERT INTO "main"."transitions" ("name", "state", "new_state", "opcode", "param_1", "param_2", "code")
VALUES 
('M_MEF_APPROACH','0', '1', 'MOV', 'WSPRITE', 'WIP1', ''),
('M_MEF_APPROACH', '1', '2', 'ASHOW', 'WSPRITE', 'V_LOOP', ''),
('M_MEF_APPROACH', '2', '4', 'CLICK', '0', '0', ''),
('M_MEF_APPROACH', '3', '4', 'PLAYWAVE', '', 'SOUND_NEELPQ1', ''), -- plays ok here
('M_MEF_APPROACH', '4', '5', 'LOADVIEW', '0', 'IDV_MEFPAN', ''),
('M_MEF_APPROACH', '5', '2', 'SIGNALi', 'SIG_PLAY', 'S33_NEELP_Q1', ''); --signal talking machine with ref to 

delete from transitions where name = 'M_MEF_TALK';
INSERT INTO "main"."transitions" ("name", "state", "new_state", "opcode", "param_1", "param_2", "code")
VALUES 
('M_MEF_TALK','0','1','WAIT','','SIG_PLAY',''),
('M_MEF_TALK','1','2', 'MOV', 'WSPRITE', 'WIP1', ''),
('M_MEF_TALK','2','3', 'SHOW',  'WSPRITE', '',  ''),
('M_MEF_TALK','3','4', 'ANIMATE',  '0', 'V_LOOP|V_REWIND',  ''),
('M_MEF_TALK','4','6', 'PLAYWAVE', 'WIP3', '', ''),
('M_MEF_TALK','6','7', 'ESTIME', '', '10', ''),
('M_MEF_TALK','7','8', 'MOV', 'BFRAME', '0',''),
('M_MEF_TALK','8','0', 'SHOW', 'WSPRITE', '','');
