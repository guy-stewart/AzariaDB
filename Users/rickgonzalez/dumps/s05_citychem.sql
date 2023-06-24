
delete from games;

delete from machines where [name] like 'S05_%';

insert into machines ([id],[name],[view_id],[view_name],[left],[top],[right],[bottom],[local_visible],[dfa_name], [wip1_name],[wip2_name],[wip3_name],[wip4_name]) values
(0x501,'S05_UP',0x501,'IDV_chempan',7,126,28,153,0,'M05_UP','S05_ICON','','',''),
(0x502,'S05_DOWN',0x501,'IDV_chempan',7,161,28,191,0,'M05_DOWN','S05_ICON','','',''),
(0x503,'S05_ICON',0x501,'IDV_chempan',75,125,125,175,0,'M05_ICON','S05_VIAL','S05_NUM1','S05_NUM10','CHEM_COUNT'),
(0x504,'S05_NUM1',0x501,'IDV_chempan',234,96,258,120,0,'M05_NUM1','S05_VIAL','','',''),
(0x505,'S05_NUM10',0x501,'IDV_chempan',206,99,228,123,0,'M05_NUM10','S05_VIAL','','',''),
(0x506,'S05_VIAL',0x501,'IDV_chempan',161,131,221,172,0,'M05_VIAL','S05_CHEM','S05_BUBBLE','S05_ICON',''),
(0x507,'S05_CHEM',0x501,'IDV_chempan',283,76,386,238,0,'M05_CHEM','S05_ICON','','',''),
(0x508,'S05_BUBBLE',0x501,'IDV_chempan',63,0,72,76,0,'M05_BUBBLE','','','','');

delete from transitions where [name] like 'M05_%';
insert into transitions ([name], [state], [new_state], [opcode], [param_1], [param_2], [code]) values
('M05_BUBBLE','0','1','WAIT','0','0', ''),
('M05_BUBBLE','1','0','VIDEO','0','IDS_CHEMBUBL', ''),
('M05_CHEM','0','1','WAIT','0','0', ''),
('M05_CHEM','1','2','SHOW','0','IDS_CHEMFILL', ''),
('M05_CHEM','2','3','ANIMATE','0','0', ''),
('M05_CHEM','3','4','REF_MACHINE','WIP1','', ''),
('M05_CHEM','4','5','MOV','WOBJECT','R_BFRAME', ''),
('M05_CHEM','5','20','ADDI','WOBJECT','IDD_CHEMV01', ''),
('M05_CHEM','20','21','GRAB','0','0', ''),
('M05_CHEM','21','22','CLEAR','WOBJECT','', ''),
('M05_CHEM','22','23','CLEAR','WSPRITE','', ''),
('M05_CHEM','23','0','SHOW','0','0', ''),

('M05_DOWN','0','1','CLICK','0','0', ''),
('M05_DOWN','1','2','PLAYWAVE','0','SOUND_CLICK', ''),
('M05_DOWN','2','0','SIGNAL','WIP1','SIG_DEC1', ''),

('M05_UP','0','1','CLICK','0','0', ''),
('M05_UP','1','2','PLAYWAVE','0','SOUND_CLICK', ''),
('M05_UP','2','0','SIGNAL','WIP1','SIG_INC1', ''),

('M05_ICON','0','2','WAIT','0','SIG_INC1', 'ADDI(BFRAME,1);'),
('M05_ICON','0','7','WAIT','0','SIG_DEC1', 'SUBI(BFRAME,1);'),
('M05_ICON','2','20','GTEi','BFRAME','WIP4', 'ASSIGN(BFRAME,0);'), -- if bframe >= WIP4 (CHEM_COUNT)
('M05_ICON','2','20','Z_EPSILON','','',''), -- else
('M05_ICON','7','20','LTi','BFRAME','0', '
    ASSIGN(BFRAME,WIP4);
    SUBI  (BFRAME,1);'),
('M05_ICON','7','20','Z_EPSILON','','',''),
('M05_ICON','20','0','Z_EPSILON','','','
    SHOW(0,IDS_CHEMS);
    SIGNAL(WIP1,);
    SIGNAL(WIP2,);
    SIGNAL(WIP3,);'),

('M05_NUM1','0','1','WAIT','0','0', ''),
('M05_NUM1','1','2','REF_MACHINE','WIP1','', ''),
('M05_NUM1','2','3','MOV','BFRAME','R_BPARM', ''),
('M05_NUM1','3','4','MODI','BFRAME','10', ''),
('M05_NUM1','4','0','SHOW','0','IDS_CITYNUM', ''),

('M05_NUM10','0','1','WAIT','0','0', ''),
('M05_NUM10','1','2','REF_MACHINE','WIP1','', ''),
('M05_NUM10','2','3','MOV','BFRAME','R_BPARM', ''),
('M05_NUM10','3','4','DIVI','BFRAME','10', ''),
('M05_NUM10','4','0','SHOW','0','IDS_CITYNUM', ''),

('M05_VIAL','0','7','CLICK','0','0', ''),
('M05_VIAL','0','1','DRAG','0','IDD_SCOOPF', ''),
('M05_VIAL','0','0','WAIT','0','0', '
    REF_MACHINE(WIP3);
    MOV(BPARM,R_BFRAME);
    MAPi(BPARM,CHEMCOST);'),
('M05_VIAL','1','7','LT','WPARM','BPARM', '
    ADDI(WPARM,1);
    HANDOFF(0,IDD_SCOOPE);
    PLAYWAVE(0,SOUND_SLURP);'),
('M05_VIAL','1','7','Z_EPSILON','','', ''),
('M05_VIAL','7','0','GTE','WPARM','BPARM', '
    SIGNAL(WIP1);
    SIGNAL(WIP2);
    SUB(WPARM,BPARM);'),
('M05_VIAL','7','0','Z_EPSILON','','', '');
