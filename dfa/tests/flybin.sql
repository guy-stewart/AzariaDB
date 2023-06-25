
delete from machines where name like 'S30_PATH2%';

insert into machines values (0x3001,'S30_PATH2a',4391,'IDV_PATH1',140,120,300,280,0,'M_FLYBINa','IDS_EYESPELL', 'IDD_EYESPELL','60','SOUND_LEVER' );
insert into machines values (0x3002,'S30_PATH2b',4391,'IDV_PATH1',0,120,139,280,0,'M_FLYBINb','IDS_EYESPELL', 'IDD_EYESPELL','60','SOUND_LEVER' );

delete from transitions where [automaton] like 'M_FLYBIN%';

insert into transitions 
    ([automaton],[state],[new_state],[opcode],[param_1],[param_2],[code],[guard])
    values
        ('M_FLYBINa',0,1,'Z_EPSILON','','',
        'MOV(WSPRITE,WIP1);
         ASHOW(WSPRITE, V_LOOP);',''),
        ('M_FLYBINa',1,2,'GRAB','WIP2','','PLAYWAVE(WIP4);',''),
        ('M_FLYBINa',2,3,'Z_EPSILON','','','WRITE(''this is some text to write.'');',''),
        ('M_FLYBINa',3,1,'Z_EPSILON','','','WRITE(''WIP2:'', WIP2);',''),

        ('M_FLYBINb',0,'BAIT_0','Z_EPSILON','','',
        'MOV(WSPRITE,WIP1);
         ASHOW(WSPRITE, V_LOOP);',''),
        ('M_FLYBINb','BAIT_0','BAIT_1','GRAB','WIP2','','PLAYWAVE(WIP4);WOBJECT=IDD_BAIT0;ASHOW(WOBJECT);',''),
        ('M_FLYBINb','BAIT_1','BAIT_2','GRAB','WOBJECT','','PLAYWAVE(WIP4);WOBJECT=IDD_BAIT1;ASHOW(WOBJECT);',''),
        ('M_FLYBINb','BAIT_2','4','GRAB','WOBJECT','','PLAYWAVE(WIP4);WOBJECT=IDD_BAIT2;ASHOW(WOBJECT);',''),
        ('M_FLYBINb','4','5','GRAB','WOBJECT','','PLAYWAVE(WIP4);WOBJECT=IDD_BAIT3;ASHOW(WOBJECT);',''),
        ('M_FLYBINb','5','6','CLICK','','','WPARM=1;',''),
        ('M_FLYBINb','6','7','CLICK','','','WPARM=WPARM+1*3;',''),
        ('M_FLYBINb','7','6','CLICK','','','','WPARM<5'),
        ('M_FLYBINb','7','8','CLICK','','','WPARM=(WOBJECT+1000);',''),
        ('M_FLYBINb','8','FINAL','CLICK','','','','(WPARM==WOBJECT+1000) && (WPARM-1000 == WOBJECT)'),
        ('M_FLYBINb','FINAL','BAIT_0','CLICK','','','','');


create table if not exists states (
    [automaton] text,
    [state]      text,
    [entry]     text,
    [exit]      text,
    PRIMARY KEY ([automaton],[state]) ON CONFLICT REPLACE);

insert into states ([automaton],[state],[entry],[exit]) values 
('M_FLYBINb','FINAL','WRITE(''>>>>>> Entered FINAL state'');','WRITE(''>>>>>> Left FINAL state'');');

delete from views where view_name = 'IDV_S10_THAOR_PAN';
insert into views values (0x264c,'IDV_S10_THAOR_PAN',1,1,1,5,'wdepanel.vct','PARCHPAN');

