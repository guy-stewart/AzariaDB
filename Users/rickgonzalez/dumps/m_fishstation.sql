
delete from transitions where [name]='M_FISHSTATION';

insert into transitions ([name], [state], [new_state], [opcode], [param_1], [param_2], [code]) values
('M_FISHSTATION','0','2','C_ACCEPT','0','IDC_POLE', 
    'SHOW();'),
('M_FISHSTATION','2','2','DRAG','0','IDD_BUCKE', 'HANDOFF(0,IDD_BUCKF);'),
('M_FISHSTATION','2','3','DROP','0','0', ''),
('M_FISHSTATION','3','6','IS_A','WOBJECT','ISA_BAITEDPOLE',
'    SHOW(0,IDS_POLE1LCL);
    RAND(ADD_CATCH_TIME,MIN_CATCH_TIME);'),
('M_FISHSTATION','3','4','Z_EPSILON','0','0',
'   SHOW(0,IDS_POLE1LCU);
    MOV(WPARM,WOBJECT);
    C_ACCEPT(0,ISA_BAIT);'),

('M_FISHSTATION','4','0','GRAB','0','0', ''),
('M_FISHSTATION','4','3','DROP','0','0',
'   MIX(WPARM,WOBJECT);
    SHOW(0,IDS_POLE1B);'),

('M_FISHSTATION','6','0','GRAB','0','0', ''),
('M_FISHSTATION','6','7','SYNCPOINT','WRAND','SYNC_FISH1',
'   PLAYWAVE(0,SOUND_HURT);
    MOV(WPARM,WOBJECT);
    RAND(9,IDD_FISH1); 
    MOV(WOBJECT,WRAND);
    SHOW(0,IDS_POLE1LCT);'),

('M_FISHSTATION','7','3','GRAB','0','0',
'    MOV(WOBJECT,WPARM);
    XIM(WOBJECT,WPARM);
    SHOW(WOBJECT);');
