

delete from machines where name = 'S30_PATH2';

insert into machines values (0x3001,'S30_PATH2',4391,'IDV_PATH1',140,120,300,280,0,'M_FLYBIN','IDS_EYESPELL', 0, 'IDD_EYESPELL', 0x0, '60', 0x0, 'SOUND_LEVER', 0x0 );

delete from transitions where name = 'M_FLYBIN';
insert into transitions 
    ([name],[state],[new_state],[opcode],[param_1],[param_2], [code])
    values
        ('M_FLYBIN',0,1,'Z_EPSILON','','','WSPRITE = WIP1;ASHOW(WSPRITE, V_LOOP);'),
        ('M_FLYBIN',2,2,'GRAB','WIP2','','PLAYWAVE(WIP4);')
;
