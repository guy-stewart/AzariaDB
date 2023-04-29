


delete from machines where name = 'S30_ACTIONBIN';

insert into machines values (0x3003,'S30_ACTIONBIN',4391,'IDV_PATH1',440,120,300,280,0,'M_ACTIONBIN','IDS_LEVANI', 0, 'IDD_ROCK', 0x0, '60', 0x0, 'SOUND_LEVER', 0x0 );

delete from transitions where name = 'M_ACTIONBIN';
insert into transitions 
    ([name],[state],[new_state],[opcode],[param_1],[param_2])
    values
        ('M_ACTIONBIN','0','1','Z_EPSILON','',
'MOV(WSPRITE,WIP1),
ASHOW(WSPRITE,V_LOOP)'),
        ('M_ACTIONBIN','1','1','GRAB','WIP2',           -- Grab(Object)
                'PLAYWAVE(WIP4)')        -- Playwave(Sound)
;


/*

MOV(WSPRITE,WIP1)
ASHOW(WSPRITE,V_LOOP)

:=

START,1, MOV, WSPRITE, WIP1
1,FINAL  ASHOW WSPRITE VLOOP

ACTION :-
*/