
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

insert into transitions values 
('M10_DRYPIT','0','10','Z_EPSILON','','','
    ASSIGN(BFRAME,9);
    MUL(BFRAME,BPARM);
    ASSIGN(WPARM,MAX_DRYPIT);
    DIV(BFRAME,WPARM);
    ASSIGN(WSPRITE,IDS_PITFUL);
    SHOW(WSPRITE);'),
('M10_DRYPIT','10','21','DRAG','0','IDD_SCOOPE', ''),
('M10_DRYPIT','10','31','DRAG','0','IDD_SCOOPF', ''),

-- Process a full scoop drag:
('M10_DRYPIT','21','25','GTEi','BPARM','1','
    PLAYWAVE(SOUND_SLURP);
    SUBI(BPARM,1);
    HANDOFF(0,IDD_SCOOPF);'),
('M10_DRYPIT','21','10','Z_EPSILON','0','', ''),
('M10_DRYPIT','25','0','EQUALi','BPARM','MAX_DRYPIT-1', 'SIGNALi(0,S10_FLOWER);'),
('M10_DRYPIT','25','0','Z_EPSILON','','', ''),

-- process an empty scoop drag:
('M10_DRYPIT','31','35','LTEi','BPARM','MAX_DRYPIT-1', '
    PLAYWAVE(SOUND_SPIT);
    ADDI(BPARM,1);
    HANDOFF(0,IDD_SCOOPE);'),
('M10_DRYPIT','31','10','Z_EPSILON','','', ''),

('M10_DRYPIT','35','0','EQUALi','BPARM','MAX_DRYPIT','SIGNALi(0,S10_FLOWER);'),
('M10_DRYPIT','35','0','Z_EPSILON','','', '');

-- BLOSSOM --
insert into transitions values 
('M10_FLOWER','0','1','SHOW','0','IDS_FLOPN1',''),
-- Wait on open signal from drypit:
('M10_FLOWER','1','30','WAIT','','', '
    PLAYWAVE(SOUND_BUZZFUZZ);
    SHOW(0,IDS_FLOPN1);
    ANIMATE();'),
-- Wait on close signal from drypit:
('M10_FLOWER','30','0','WAIT','','', '
    PLAYWAVE(SOUND_BUZZFUZZ);
    SHOW(0,IDS_FLOPN1);
    ANIMATE(0,V_REVERSE);'),
('M10_FLOWER','30','30','GRAB','','IDD_NYBREATH','');

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

