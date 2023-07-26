


delete from transitions where [automaton]='M_FISHSTATION';

insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code]) values
('M_FISHSTATION','0','vacant','C_ACCEPT','0','IDC_POLE', 
'SHOW();'),

('M_FISHSTATION','vacant','vacant','DRAG','0','IDD_BUCKE', 'HANDOFF(0,IDD_BUCKF);'),
('M_FISHSTATION','vacant','branch','DROP','0','0', ''),

('M_FISHSTATION','branch','baited_pole','IS_A','WOBJECT','ISA_BAITEDPOLE',
'SHOW(IDS_POLE1LCL);
RAND(ADD_CATCH_TIME,MIN_CATCH_TIME);'),
('M_FISHSTATION','branch','pole','Z_EPSILON','','',
'SHOW(IDS_POLE1LCU);
MOV(WPARM,WOBJECT);
C_ACCEPT(0,ISA_BAIT);'),

('M_FISHSTATION','pole','0','GRAB','0','0', ''),
('M_FISHSTATION','pole','branch','DROP','0','0',
'MIX(WPARM,WOBJECT);
SHOW(IDS_POLE1B);'),

('M_FISHSTATION','baited_pole','0','GRAB','0','0', ''),
('M_FISHSTATION','baited_pole','fish_on','SYNCPOINT','WRAND','SYNC_FISH1',
'PLAYWAVE(0,SOUND_HURT);
MOV(WPARM,WOBJECT);
RAND(10,0); 
MOV(WOBJECT,WRAND);
MAP(WOBJECT,FISH_CAUGHT);
SHOW(IDS_POLE1LCT);'),

('M_FISHSTATION','fish_on','branch','GRAB','0','0',
'MOV(WOBJECT,IDD_POLE1);
SHOW(IDS_POLE1LCU);');

insert into map ([op],[key],[value]) values 
('FISH_CAUGHT', '1','IDD_FISH1'),
('FISH_CAUGHT', '2','IDD_FISH2'),
('FISH_CAUGHT', '3','IDD_FISH3'),
('FISH_CAUGHT', '4','IDD_FISH4'),
('FISH_CAUGHT', '5','IDD_FISH5'),
('FISH_CAUGHT', '6','IDD_FISH6'),
('FISH_CAUGHT', '7','IDD_FISH7'),
('FISH_CAUGHT', '8','IDD_FISH8'),
('FISH_CAUGHT', '9','IDD_FISH9'),
('FISH_CAUGHT','10','IDD_FISH10');

delete from map_obj where op = 'IDD_POLE2';

insert into map_obj ([op],[key],[value]) values 
('IDD_POLE1','IDD_LUNCHCRUMBS','IDD_POLE1B9'),
('IDD_POLE1','IDD_BAIT9','IDD_POLE1B9'),
('IDD_POLE1','IDD_BAIT8','IDD_POLE1B8'),
('IDD_POLE1','IDD_BAIT7','IDD_POLE1B7'),
('IDD_POLE1','IDD_BAIT6','IDD_POLE1B6'),
('IDD_POLE1','IDD_BAIT5','IDD_POLE1B5'),
('IDD_POLE1','IDD_BAIT4','IDD_POLE1B4'),
('IDD_POLE1','IDD_BAIT3','IDD_POLE1B3'),
('IDD_POLE1','IDD_BAIT2','IDD_POLE1B2'),
('IDD_POLE1','IDD_BAIT1','IDD_POLE1B1'),
('IDD_POLE1','IDD_BAIT0','IDD_POLE1B0');