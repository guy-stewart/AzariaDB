
delete from games;

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

insert into spr_names values ('IDS_FLOWER0','flower0',0x270);
insert into spr_names values ('IDS_FLOWER1','flower1',0x271);
insert into spr_names values ('IDS_FLOWER2','flower2',0x272);
insert into spr_names values ('IDS_FLOWER3','flower3',0x273);
insert into spr_names values ('IDS_FLOWER4','flower4',0x274);
insert into spr_names values ('IDS_FLOWER5','flower5',0x275);
insert into spr_names values ('IDS_FLOWER6','flower6',0x276);
insert into spr_names values ('IDS_FLOWER7','flower7',0x277);
insert into spr_names values ('IDS_FLOWER8','flower8',0x278);
insert into spr_names values ('IDS_FLOWER9','flower9',0x279);


delete from machines where name = 'S10_DRYPIT';
delete from machines where name = 'S10_FLOWER';
delete from transitions where name = 'M10_DRYPIT';
delete from transitions where name = 'M10_FLOWER';

insert into machines values (0x1000,'S10_DRYPIT',0x1002,'IDV_SCN10PIT',30,205,379,300,0,'M10_DRYPIT','', 0x0, '', 0x0, '', 0x0, '', 0x0 );
insert into machines values (0x1001,'S10_FLOWER',0x1002,'IDV_SCN10PIT',139,31,273,127,0,'M10_FLOWER','', 0x0, '', 0x0, '', 0x0, '', 0x0 );

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

-- BLOSSOM --
insert into transitions values ('M10_FLOWER',0,1,'SHOW','0','IDS_FLOWER0');
insert into transitions values ('M10_FLOWER',1,2,'WAIT','','');
insert into transitions values ('M10_FLOWER',2,3,'PLAYWAVE','0','SOUND_BUZZFUZZ');
/*
#define ANIMATE_SPRITES(M_XX, S, END, BASE_SPRITE, COUNT, FPS)    \
    {TNAME(M_XX),    S,   S+1,    OPCODE(ASSIGN),        PARAM(WSPRITE),    PARAM(BASE_SPRITE)},    \
    {TNAME(M_XX),    S+1, S+2,    OPCODE(ASSIGN),        PARAM(WPARM),        PARAM(COUNT)},            \
    {TNAME(M_XX),    S+2, END,    OPCODE(LTEi),        PARAM(WPARM),        PARAM(0)},                \
    {TNAME(M_XX),    S+2, S+3,    OPCODE(SHOW),        PARAM(WSPRITE), PARAM(0)},                \
    {TNAME(M_XX),    S+3, S+4,    OPCODE(EMTIME),        PARAM(0),        PARAM(1000/FPS)},            \
    {TNAME(M_XX),    S+4, S+5,    OPCODE(ADDI),        PARAM(WSPRITE),PARAM(1)},                    \
    {TNAME(M_XX),    S+5, S+2,    OPCODE(SUBI),        PARAM(WPARM),PARAM(1)}

    ANIMATE_SPRITES(M10_FLOWER, 3, 20, IDS_FLOWER0, 10, 1),
*/
insert into transitions values ('M10_FLOWER',3,4,'ASSIGN','WSPRITE','IDS_FLOWER0');
insert into transitions values ('M10_FLOWER',4,5,'ASSIGN','WPARM','10');
insert into transitions values ('M10_FLOWER',5,20,'LTEi','WPARM','0');
insert into transitions values ('M10_FLOWER',5,15,'Z_EPSILON','','');
insert into transitions values ('M10_FLOWER',15,16,'SHOW','WSPRITE','0');
insert into transitions values ('M10_FLOWER',16,17,'EMTIME','0','1000');
insert into transitions values ('M10_FLOWER',17,18,'ADDI','WSPRITE','1');
insert into transitions values ('M10_FLOWER',18,5,'SUBI','WPARM','1');
insert into transitions values ('M10_FLOWER',20,30,'SHOW','0','IDS_FLOWER9');
insert into transitions values ('M10_FLOWER',30,31,'WAIT','0','0');
insert into transitions values ('M10_FLOWER',31,32,'PLAYWAVE','0','SOUND_FUZZBUZZ');
/*
// play sprite sequence backwards
#define rANIMATE_SPRITES(M_XX, S, END, BASE_SPRITE, COUNT, FPS)    \
    {TNAME(M_XX),    S,   S+1,    OPCODE(ASSIGN),        PARAM(WSPRITE),    PARAM(BASE_SPRITE)},    \
    {TNAME(M_XX),    S+1, S+2,    OPCODE(ASSIGN),        PARAM(WPARM),        PARAM(COUNT)},            \
    {TNAME(M_XX),    S+2, END,    OPCODE(LTEi),        PARAM(WPARM),        PARAM(0)},                \
    {TNAME(M_XX),    S+2, S+3,    OPCODE(SHOW),        PARAM(WSPRITE), PARAM(0)},                \
    {TNAME(M_XX),    S+3, S+4,    OPCODE(EMTIME),        PARAM(0),        PARAM(1000/FPS)},            \
    {TNAME(M_XX),    S+4, S+5,    OPCODE(SUBI),        PARAM(WSPRITE),PARAM(1)},                    \
    {TNAME(M_XX),    S+5, S+2,    OPCODE(SUBI),        PARAM(WPARM),PARAM(1)}

    rANIMATE_SPRITES(M10_FLOWER,    32, 40, IDS_FLOWER9, 10, 1),
*/

insert into transitions values ('M10_FLOWER',32,33,'ASSIGN','WSPRITE','IDS_FLOWER9');
insert into transitions values ('M10_FLOWER',33,34,'ASSIGN','WPARM','10');
insert into transitions values ('M10_FLOWER',34,50,'LTEi','WPARM','0');
insert into transitions values ('M10_FLOWER',34,44,'Z_EPSILON','','');
insert into transitions values ('M10_FLOWER',44,45,'SHOW','WSPRITE','');
insert into transitions values ('M10_FLOWER',45,46,'EMTIME','0','1000');
insert into transitions values ('M10_FLOWER',46,47,'SUBI','WSPRITE','1');
insert into transitions values ('M10_FLOWER',47,34,'SUBI','WPARM','1');
insert into transitions values ('M10_FLOWER',50,0,'SHOW','0','IDS_FLOWER0');


