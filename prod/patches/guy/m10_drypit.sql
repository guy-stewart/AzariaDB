
delete from games;

delete from spr_names where name = 'IDS_FLOPN1';
delete from spr_names where name = 'IDS_PITFUL';

insert into spr_names values ('IDS_FLOPN1','FLOPN1',0x270);
insert into spr_names values ('IDS_PITFUL','pitful',0x291);

delete from machines where name = 'S10_DRYPIT';
delete from machines where name = 'S10_FLOWER';
delete from transitions where name = 'M10_DRYPIT';
delete from transitions where name = 'M10_FLOWER';

insert into machines values (0x1000,'S10_DRYPIT',0x1002,'IDV_SCN10PIT',30,205,379,300,0,'M10_DRYPIT','', 0x0, '', 0x0, '', 0x0, '', 0x0 );
insert into machines values (0x1001,'S10_FLOWER',0x1002,'IDV_SCN10PIT',90,0,273,127,0,'M10_FLOWER','', 0x0, '', 0x0, '', 0x0, '', 0x0 );

/*
#define COMPUTE_SPRITE(M_XX, S, END, VAL, MAX_VAL, SPRITE_COUNT, BASE_SPRITE)    \
    {TNAME(M_XX),    S,   S+1,    OPCODE(ASSIGN),        PARAM(WSPRITE),    PARAM(SPRITE_COUNT)},        \
    {TNAME(M_XX),    S+1, S+2,    OPCODE(MUL),        PARAM(WSPRITE),    PARAM(VAL)},                \
    {TNAME(M_XX),    S+2, S+3,    OPCODE(ASSIGN),        PARAM(WPARM),        PARAM(MAX_VAL)},            \
    {TNAME(M_XX),    S+3, S+4,    OPCODE(DIV),        PARAM(WSPRITE),    PARAM(WPARM)},                \
    {TNAME(M_XX),    S+4, S+5,    OPCODE(ASSIGN),        PARAM(WPARM),        PARAM(BASE_SPRITE)},        \
    {TNAME(M_XX),    S+5, S+6,    OPCODE(ADD),        PARAM(WSPRITE),    PARAM(WPARM)},                \
    {TNAME(M_XX),    S+6, END,    OPCODE(SHOW),        PARAM(WSPRITE),    PARAM(0)}

-- COMPUTE_SPRITE(M10_DRYPIT, 0, 10, BPARM, MAX_DRYPIT, 9, IDS_PIT00)
*/

insert into transitions values ('M10_DRYPIT',0,1,'ASSIGN','BFRAME','9');
insert into transitions values ('M10_DRYPIT',1,2,'MUL','BFRAME','BPARM');
insert into transitions values ('M10_DRYPIT',2,3,'ASSIGN','WPARM','MAX_DRYPIT');
insert into transitions values ('M10_DRYPIT',3,4,'DIV','BFRAME','WPARM');
insert into transitions values ('M10_DRYPIT',4,5,'ASSIGN','WSPRITE','IDS_PITFUL');
insert into transitions values ('M10_DRYPIT',5,10,'SHOW','WSPRITE','');
insert into transitions values ('M10_DRYPIT',10,21,'DRAG','0','IDD_SCOOPE');
insert into transitions values ('M10_DRYPIT',10,31,'DRAG','0','IDD_SCOOPF');
insert into transitions values ('M10_DRYPIT',21,22,'GTEi','BPARM','1');
insert into transitions values ('M10_DRYPIT',21,10,'Z_EPSILON','0','');
insert into transitions values ('M10_DRYPIT',22,23,'PLAYWAVE','0','SOUND_SLURP');
insert into transitions values ('M10_DRYPIT',23,24,'SUBI','BPARM','1');
insert into transitions values ('M10_DRYPIT',24,25,'HANDOFF','0','IDD_SCOOPF');
insert into transitions values ('M10_DRYPIT',25,27,'EQUALi','BPARM','MAX_DRYPIT-1');
insert into transitions values ('M10_DRYPIT',25,0,'Z_EPSILON','','');
insert into transitions values ('M10_DRYPIT',27,0,'SIGNALi','0','S10_FLOWER');
insert into transitions values ('M10_DRYPIT',31,32,'LTEi','BPARM','MAX_DRYPIT-1');
insert into transitions values ('M10_DRYPIT',31,10,'Z_EPSILON','','');
insert into transitions values ('M10_DRYPIT',32,33,'PLAYWAVE','','SOUND_SPIT');
insert into transitions values ('M10_DRYPIT',33,34,'ADDI','BPARM','1');
insert into transitions values ('M10_DRYPIT',34,35,'HANDOFF','','IDD_SCOOPE');
insert into transitions values ('M10_DRYPIT',35,36,'EQUALi','BPARM','MAX_DRYPIT');
insert into transitions values ('M10_DRYPIT',35,0,'Z_EPSILON','','');
insert into transitions values ('M10_DRYPIT',36,37,'Z_EPSILON','','');
insert into transitions values ('M10_DRYPIT',37,0,'SIGNALi','0','S10_FLOWER');

/*
insert into transitions values ('M10_DRYPIT',0,1,'ASSIGN','WSPRITE','9');
insert into transitions values ('M10_DRYPIT',1,2,'MUL','WSPRITE','BPARM');
insert into transitions values ('M10_DRYPIT',2,3,'ASSIGN','WPARM','MAX_DRYPIT');
insert into transitions values ('M10_DRYPIT',3,4,'DIV','WSPRITE','WPARM');
insert into transitions values ('M10_DRYPIT',4,5,'ASSIGN','WPARM','IDS_PIT00');
insert into transitions values ('M10_DRYPIT',5,6,'ADD','WSPRITE','WPARM');
insert into transitions values ('M10_DRYPIT',6,10,'SHOW','WSPRITE','');
insert into transitions values ('M10_DRYPIT',10,21,'DRAG','0','IDD_SCOOPE');
insert into transitions values ('M10_DRYPIT',10,31,'DRAG','0','IDD_SCOOPF');
insert into transitions values ('M10_DRYPIT',21,22,'GTEi','BPARM','1');
insert into transitions values ('M10_DRYPIT',21,10,'Z_EPSILON','0','');
insert into transitions values ('M10_DRYPIT',22,23,'PLAYWAVE','0','SOUND_SLURP');
insert into transitions values ('M10_DRYPIT',23,24,'SUBI','BPARM','1');
insert into transitions values ('M10_DRYPIT',24,25,'HANDOFF','0','IDD_SCOOPF');
insert into transitions values ('M10_DRYPIT',25,26,'EQUALi','BPARM','MAX_DRYPIT-1');
insert into transitions values ('M10_DRYPIT',25,0,'Z_EPSILON','','');
insert into transitions values ('M10_DRYPIT',26,27,'Z_EPSILON','','');
insert into transitions values ('M10_DRYPIT',27,0,'SIGNALi','0','S10_FLOWER');
insert into transitions values ('M10_DRYPIT',31,32,'LTEi','BPARM','MAX_DRYPIT-1');
insert into transitions values ('M10_DRYPIT',31,10,'Z_EPSILON','','');
insert into transitions values ('M10_DRYPIT',32,33,'PLAYWAVE','','SOUND_SPIT');
insert into transitions values ('M10_DRYPIT',33,34,'ADDI','BPARM','1');
insert into transitions values ('M10_DRYPIT',34,35,'HANDOFF','','IDD_SCOOPE');
insert into transitions values ('M10_DRYPIT',35,36,'EQUALi','BPARM','MAX_DRYPIT');
insert into transitions values ('M10_DRYPIT',35,0,'Z_EPSILON','','');
insert into transitions values ('M10_DRYPIT',36,37,'Z_EPSILON','','');
insert into transitions values ('M10_DRYPIT',37,0,'SIGNALi','0','S10_FLOWER');
*/

-- BLOSSOM --
insert into transitions values ('M10_FLOWER',0,1,'SHOW','0','IDS_FLOWER0');
-- wait on OPEN signal from drypit:
insert into transitions values ('M10_FLOWER',1,2,'WAIT','','');
insert into transitions values ('M10_FLOWER',2,3,'PLAYWAVE','0','SOUND_BUZZFUZZ');
insert into transitions values ('M10_FLOWER',3,4,'SHOW','','IDS_FLOPN1');
insert into transitions values ('M10_FLOWER',4,30,'ANIMATE','','');
-- WAIT on close signal from drypit:
insert into transitions values ('M10_FLOWER',30,31,'WAIT','0','0');
insert into transitions values ('M10_FLOWER',31,32,'PLAYWAVE','0','SOUND_FUZZBUZZ');
-- play sprite sequence in reverse
insert into transitions values ('M10_FLOWER',32,33,'SHOW','','IDS_FLOPN1');
insert into transitions values ('M10_FLOWER',33,1,'ANIMATE','','V_REVERSE');

-- clean up some broken entries ...
delete from spr_names where name = 'IDS_FLOWER0';
delete from spr_names where name = 'IDS_FLOWER0+1';
delete from spr_names where name = 'IDS_FLOWER0+2';
delete from spr_names where name = 'IDS_FLOWER0+3';
delete from spr_names where name = 'IDS_FLOWER0+4';
delete from spr_names where name = 'IDS_FLOWER0+5';
delete from spr_names where name = 'IDS_FLOWER0+6';
delete from spr_names where name = 'IDS_FLOWER0+7';
delete from spr_names where name = 'IDS_FLOWER0+8';
delete from spr_names where name = 'IDS_FLOWER9';

-- delete the new entries for replacement
delete from spr_names where name = 'IDS_FLOWER0';
delete from spr_names where name = 'IDS_FLOWER1';
delete from spr_names where name = 'IDS_FLOWER2';
delete from spr_names where name = 'IDS_FLOWER3';
delete from spr_names where name = 'IDS_FLOWER4';
delete from spr_names where name = 'IDS_FLOWER5';
delete from spr_names where name = 'IDS_FLOWER6';
delete from spr_names where name = 'IDS_FLOWER7';
delete from spr_names where name = 'IDS_FLOWER8';
delete from spr_names where name = 'IDS_FLOWER9';

delete from spr_names where name = 'IDS_PIT00';
delete from spr_names where name = 'IDS_PIT01';
delete from spr_names where name = 'IDS_PIT02';
delete from spr_names where name = 'IDS_PIT03';
delete from spr_names where name = 'IDS_PIT04';
delete from spr_names where name = 'IDS_PIT05';
delete from spr_names where name = 'IDS_PIT06';
delete from spr_names where name = 'IDS_PIT07';
delete from spr_names where name = 'IDS_PIT08';
delete from spr_names where name = 'IDS_PIT09';

insert into spr_names values ('IDS_PIT00','pit00',0x280);
insert into spr_names values ('IDS_PIT01','pit01',0x281);
insert into spr_names values ('IDS_PIT02','pit02',0x282);
insert into spr_names values ('IDS_PIT03','pit03',0x283);
insert into spr_names values ('IDS_PIT04','pit04',0x284);
insert into spr_names values ('IDS_PIT05','pit05',0x285);
insert into spr_names values ('IDS_PIT06','pit06',0x286);
insert into spr_names values ('IDS_PIT07','pit07',0x287);
insert into spr_names values ('IDS_PIT08','pit08',0x288);
insert into spr_names values ('IDS_PIT09','pit09',0x289);

