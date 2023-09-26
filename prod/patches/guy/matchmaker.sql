
delete from machines where [name] like 'S12_MATCHMAKER_%';

insert into machines ([name],[view_name],[left],[top],[right],[bottom],[local_visible],[dfa_name], [wip1_name],[wip2_name],[wip3_name],[wip4_name]) values
('S12_MATCHMAKER_1','IDV_TM1PAN',542,14,542+64,14+48,2,'M_MATCHMAKER','','','',''),
('S12_MATCHMAKER_2','IDV_TM1PAN',903,14,903+64,14+48,2,'M_MATCHMAKER','','','',''),
('S12_MATCHMAKER_3','IDV_TM1PAN',2196,14,2196+64,14+48,2,'M_MATCHMAKER','','','',''),
('S12_MATCHMAKER_4','IDV_TM1PAN',2549,14,2549+64,14+48,2,'M_MATCHMAKER','','','','');

delete from transitions where [automaton] like 'M_MATCHMAKER';

insert into transitions 
    ([automaton],[state],[new_state],[opcode],[param_1],[param_2],[code],[guard])
    values
        ('M_MATCHMAKER',0,'BURNING','ASHOW','IDS_CANNY1','V_LOOP',
        'ACCEPT(IDD_LOG);',''),
        ('M_MATCHMAKER','BURNING','BURNING','DRAG','IDD_LOG','',
'PLAYWAVE(SOUND_FIRE);
HANDOFF(IDD_MATCH);','');

