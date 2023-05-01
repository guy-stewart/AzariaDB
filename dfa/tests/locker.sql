
delete from transitions where [name] like 'M02\_%' ESCAPE '\';

insert into transitions ([name], [state], [new_state], [opcode], [param_1], [param_2], [code]) values 
-- Open / Empty
('M02_BIN',0,4,'DROP','0','0','
    ASHOW(WOBJECT);
    MOV(WTEMP1,WOBJECT);
    SIGNAL(WIP_S02_EBIN);'),
('M02_BIN',0,8,'WAIT','0','SIG_CLOSE',''),
-- Open / Occupied
('M02_BIN',4,0,'GRAB','0','0','
    SHOW();
    ASSIGN(WTEMP1,0);
    SIGNAL(WIP_S02_EBIN);'),
('M02_BIN',4,9,'WAIT','0','SIG_CLOSE',''),
-- Closed / Empty
('M02_BIN',8,0,'WAIT','0','SIG_OPEN',''),
-- Closed / Occupied
('M02_BIN',9,4,'WAIT','0','SIG_OPEN',''),

('M02_DN1',0,1,'CLICK','0','0','PLAYWAVE(SOUND_CLICK);'),
('M02_DN1',1,0,'IFSTATE','M02_LOCKED','WIP_S02_LOCK',''),
('M02_DN1',1,0,'Z_EPSILON','','','SIGNAL(WIP_S02_VIAL, SIG_DEC1);'),

('M02_DN10',0,1,'CLICK','0','0','PLAYWAVE(SOUND_CLICK);'),
('M02_DN10',1,0,'IFSTATE','M02_LOCKED','WIP_S02_LOCK',''),
('M02_DN10',1,0,'Z_EPSILON','','','SIGNAL(WIP_S02_VIAL, SIG_DEC10);'),


('M02_LOCK',0,1,'C_ACCEPT','0','IDC_KEY',''),
-- 1: unlocked state:
('M02_LOCK',1,2,'DROP','0','0',''),
-- Keyed state (OnEntry)
('M02_LOCK',2,9,'Z_EPSILON','','','
    PLAYWAVE(SOUND_LEVER);
    MOV(WTEMP1,WTHIS);
    ADDI(WTEMP1,1);
    SIGNAL(WTEMP1,SIG_OPEN);
    O_ACCEPT(WOBJECT);
    SHOW(0,IDS_LOCKWKEY);'),
-- Keyed state:
('M02_LOCK',9,10,'GRAB','','','
    CLEAR(WOBJECT);
    SHOW();
    MOV(WTEMP1,WTHIS);
    ADDI(WTEMP1,1);'),
('M02_LOCK',10,0,'IFSTATE','M02_OPENEMPTY','WTEMP1',''),
('M02_LOCK',10,15,'Z_EPSILON','','','
    PLAYWAVE(SOUND_LEVER);
    SIGNAL(WTEMP1,SIG_CLOSE);'),
-- Locked state:
('M02_LOCK',15,2,'DROP','WPARM','0',''),

('M02_NUM1',0,0,'WAIT','','','
    REF_MACHINE(WIP_S02_VIAL);
    MOV(BFRAME,R_WPARM);
    SUB(BFRAME,R_BPARM);
    MODI(BFRAME,10);
    SHOW(0,IDS_CITYNUM);'),

('M02_NUM10',0,0,'WAIT','','','
    REF_MACHINE(WIP_S02_VIAL);
    MOV(BFRAME,R_WPARM);
    SUB(BFRAME,R_BPARM);
    DIVI(BFRAME,10);
    SHOW(0,IDS_CITYNUM);'),

('M02_UP1',0,1,'CLICK','0','0','PLAYWAVE(SOUND_CLICK);'),
('M02_UP1',1,0,'IFSTATE','M02_LOCKED','WIP_S02_LOCK',''),
('M02_UP1',1,0,'Z_EPSILON','','','SIGNAL(WIP_S02_VIAL,SIG_INC1);'),

('M02_UP10',0,1,'CLICK','0','0','PLAYWAVE(SOUND_CLICK);'),
('M02_UP10',1,0,'IFSTATE','M02_LOCKED','WIP_S02_LOCK',''),
('M02_UP10',1,0,'Z_EPSILON','','','SIGNAL(WIP_S02_VIAL,SIG_INC10);'),

-- BPARM is the amount of nystrom in the vial, WPARM is the asking price:
('M02_VIAL',0,10,'DRAG','0','IDD_SCOOPE',''),
('M02_VIAL',0,22,'DRAG','0','IDD_SCOOPF',''),
('M02_VIAL',0,5,'WAIT','0','SIG_INC1',  'ADDI(WPARM,1);'),
('M02_VIAL',0,5,'WAIT','0','SIG_DEC1',  'SUBI(WPARM,1);'),
('M02_VIAL',0,5,'WAIT','0','SIG_INC10','ADDI(WPARM,10);'),
('M02_VIAL',0,5,'WAIT','0','SIG_DEC10','SUBI(WPARM,10);'),
('M02_VIAL',5,8,'LTEi','WPARM','99',''),
('M02_VIAL',5,8,'Z_EPSILON','','','ASSIGN(WPARM,99);'),
('M02_VIAL',8,0,'Z_EPSILON','','','
    SIGNAL(WIP_DISP10,0);
    SIGNAL(WIP_DISP01,0);'),
('M02_VIAL',10,0,'NOTSTATE','M02_KEYED','WIP_S02_LOCK',''), -- locker is locked
('M02_VIAL',10,0,'EQUALi','BPARM','0',''), -- vial is empty
('M02_VIAL',10,0,'Z_EPSILON','','','
    SUBI(BPARM,1);
    PLAYWAVE(SOUND_SLURP);
    HANDOFF(0,IDD_SCOOPF);
    SIGNAL(WIP_DISP10,0);
    SIGNAL(WIP_DISP01,0);'),
('M02_VIAL',22,0,'NOTSTATE','M02_LOCKED','WIP_S02_LOCK',''),
('M02_VIAL',22,24,'GTE','BPARM','WPARM',''),
('M02_VIAL',22,24,'Z_EPSILON','','','
    ADDI(BPARM,1);
    PLAYWAVE(SOUND_SPIT);
    HANDOFF(0,IDD_SCOOPE);'),
('M02_VIAL',24,25,'SIGNAL','WIP_DISP10','0',''),
('M02_VIAL',25,26,'SIGNAL','WIP_DISP01','0',''),
('M02_VIAL',26,0,'LT','BPARM','WPARM',''),
('M02_VIAL',26,0,'Z_EPSILON','','','
    MOV(WTEMP1,WTHIS);
    ADDI(WTEMP1,2);
    SIGNAL(WTEMP1,SIG_OPEN);');

delete from machines where name like '%S02\_%' ESCAPE '\';

insert into machines ([id],[name],[view_id],[view_name],[left],[top],[right],[bottom],[local_visible],[dfa_name],[wip1_name],[wip2_name],[wip3_name],[wip4_name]) values

(0x21b,'S02_VIAL__00',0x204,'IDV_LOCKERCU00',214,92,318,124,0,'M02_VIAL','S02_NUM1__00','S02_LOCK__00','S02_NUM10_00',''),
(0x21c,'S02_LOCK__00',0x204,'IDV_LOCKERCU00',44,165,137,243,0,'M02_LOCK','','','',''),
(0x21d,'S02_BIN___00',0x204,'IDV_LOCKERCU00',20,20,200,140,0,'M02_BIN','S02_EBIN__00+0','0','0',''),
(0x21e,'S02_UP1___00',0x204,'IDV_LOCKERCU00',264,7,289,29,0,'M02_UP1','S02_VIAL__00','S02_LOCK__00','',''),
(0x21f,'S02_UP10__00',0x204,'IDV_LOCKERCU00',230,8,257,29,0,'M02_UP10','S02_VIAL__00','S02_LOCK__00','',''),
(0x220,'S02_DN1___00',0x204,'IDV_LOCKERCU00',262,71,285,89,0,'M02_DN1','S02_VIAL__00','S02_LOCK__00','',''),
(0x221,'S02_DN10__00',0x204,'IDV_LOCKERCU00',231,72,257,89,0,'M02_DN10','S02_VIAL__00','S02_LOCK__00','',''),
(0x222,'S02_NUM1__00',0x204,'IDV_LOCKERCU00',263,39,286,62,0,'M02_NUM1','S02_VIAL__00','S02_LOCK__00','',''),
(0x223,'S02_NUM10_00',0x204,'IDV_LOCKERCU00',232,40,255,63,0,'M02_NUM10','S02_VIAL__00','S02_LOCK__00','',''),

(0x224,'S02_VIAL__01',0x205,'IDV_LOCKERCU01',214,92,318,124,0,'M02_VIAL','S02_NUM1__01','S02_LOCK__01','S02_NUM10_01',''),
(0x225,'S02_LOCK__01',0x205,'IDV_LOCKERCU01',44,165,137,243,0,'M02_LOCK','','','',''),
(0x226,'S02_BIN___01',0x205,'IDV_LOCKERCU01',20,20,200,140,0,'M02_BIN','S02_EBIN__00+1','0','0',''),
(0x227,'S02_UP1___01',0x205,'IDV_LOCKERCU01',264,7,289,29,0,'M02_UP1','S02_VIAL__01','S02_LOCK__01','',''),
(0x228,'S02_UP10__01',0x205,'IDV_LOCKERCU01',230,8,257,29,0,'M02_UP10','S02_VIAL__01','S02_LOCK__01','',''),
(0x229,'S02_DN1___01',0x205,'IDV_LOCKERCU01',262,71,285,89,0,'M02_DN1','S02_VIAL__01','S02_LOCK__01','',''),
(0x22a,'S02_DN10__01',0x205,'IDV_LOCKERCU01',231,72,257,89,0,'M02_DN10','S02_VIAL__01','S02_LOCK__01','',''),
(0x22b,'S02_NUM1__01',0x205,'IDV_LOCKERCU01',263,39,286,62,0,'M02_NUM1','S02_VIAL__01','S02_LOCK__01','',''),
(0x22c,'S02_NUM10_01',0x205,'IDV_LOCKERCU01',232,40,255,63,0,'M02_NUM10','S02_VIAL__01','S02_LOCK__01','',''),
(0x22d,'S02_VIAL__02',0x206,'IDV_LOCKERCU02',214,92,318,124,0,'M02_VIAL','S02_NUM1__02','S02_LOCK__02','S02_NUM10_02',''),
(0x22e,'S02_LOCK__02',0x206,'IDV_LOCKERCU02',44,165,137,243,0,'M02_LOCK','','','',''),
(0x22f,'S02_BIN___02',0x206,'IDV_LOCKERCU02',20,20,200,140,0,'M02_BIN','S02_EBIN__00+2','0','0',''),
(0x230,'S02_UP1___02',0x206,'IDV_LOCKERCU02',264,7,289,29,0,'M02_UP1','S02_VIAL__02','S02_LOCK__02','',''),
(0x231,'S02_UP10__02',0x206,'IDV_LOCKERCU02',230,8,257,29,0,'M02_UP10','S02_VIAL__02','S02_LOCK__02','',''),
(0x232,'S02_DN1___02',0x206,'IDV_LOCKERCU02',262,71,285,89,0,'M02_DN1','S02_VIAL__02','S02_LOCK__02','',''),
(0x233,'S02_DN10__02',0x206,'IDV_LOCKERCU02',231,72,257,89,0,'M02_DN10','S02_VIAL__02','S02_LOCK__02','',''),
(0x234,'S02_NUM1__02',0x206,'IDV_LOCKERCU02',263,39,286,62,0,'M02_NUM1','S02_VIAL__02','S02_LOCK__02','',''),
(0x235,'S02_NUM10_02',0x206,'IDV_LOCKERCU02',232,40,255,63,0,'M02_NUM10','S02_VIAL__02','S02_LOCK__02','',''),
(0x236,'S02_VIAL__03',0x207,'IDV_LOCKERCU03',214,92,318,124,0,'M02_VIAL','S02_NUM1__03','S02_LOCK__03','S02_NUM10_03',''),
(0x237,'S02_LOCK__03',0x207,'IDV_LOCKERCU03',44,165,137,243,0,'M02_LOCK','','','',''),
(0x238,'S02_BIN___03',0x207,'IDV_LOCKERCU03',20,20,200,140,0,'M02_BIN','S02_EBIN__00+3','0','0',''),
(0x239,'S02_UP1___03',0x207,'IDV_LOCKERCU03',264,7,289,29,0,'M02_UP1','S02_VIAL__03','S02_LOCK__03','',''),
(0x23a,'S02_UP10__03',0x207,'IDV_LOCKERCU03',230,8,257,29,0,'M02_UP10','S02_VIAL__03','S02_LOCK__03','',''),
(0x23b,'S02_DN1___03',0x207,'IDV_LOCKERCU03',262,71,285,89,0,'M02_DN1','S02_VIAL__03','S02_LOCK__03','',''),
(0x23c,'S02_DN10__03',0x207,'IDV_LOCKERCU03',231,72,257,89,0,'M02_DN10','S02_VIAL__03','S02_LOCK__03','',''),
(0x23d,'S02_NUM1__03',0x207,'IDV_LOCKERCU03',263,39,286,62,0,'M02_NUM1','S02_VIAL__03','S02_LOCK__03','',''),
(0x23e,'S02_NUM10_03',0x207,'IDV_LOCKERCU03',232,40,255,63,0,'M02_NUM10','S02_VIAL__03','S02_LOCK__03','',''),
(0x23f,'S02_VIAL__04',0x208,'IDV_LOCKERCU04',214,92,318,124,0,'M02_VIAL','S02_NUM1__04','S02_LOCK__04','S02_NUM10_04',''),
(0x240,'S02_LOCK__04',0x208,'IDV_LOCKERCU04',44,165,137,243,0,'M02_LOCK','','','',''),
(0x241,'S02_BIN___04',0x208,'IDV_LOCKERCU04',20,20,200,140,0,'M02_BIN','S02_EBIN__00+4','0','0',''),
(0x242,'S02_UP1___04',0x208,'IDV_LOCKERCU04',264,7,289,29,0,'M02_UP1','S02_VIAL__04','S02_LOCK__04','',''),
(0x243,'S02_UP10__04',0x208,'IDV_LOCKERCU04',230,8,257,29,0,'M02_UP10','S02_VIAL__04','S02_LOCK__04','',''),
(0x244,'S02_DN1___04',0x208,'IDV_LOCKERCU04',262,71,285,89,0,'M02_DN1','S02_VIAL__04','S02_LOCK__04','',''),
(0x245,'S02_DN10__04',0x208,'IDV_LOCKERCU04',231,72,257,89,0,'M02_DN10','S02_VIAL__04','S02_LOCK__04','',''),
(0x246,'S02_NUM1__04',0x208,'IDV_LOCKERCU04',263,39,286,62,0,'M02_NUM1','S02_VIAL__04','S02_LOCK__04','',''),
(0x247,'S02_NUM10_04',0x208,'IDV_LOCKERCU04',232,40,255,63,0,'M02_NUM10','S02_VIAL__04','S02_LOCK__04','',''),
(0x248,'S02_VIAL__05',0x209,'IDV_LOCKERCU05',214,92,318,124,0,'M02_VIAL','S02_NUM1__05','S02_LOCK__05','S02_NUM10_05',''),
(0x249,'S02_LOCK__05',0x209,'IDV_LOCKERCU05',44,165,137,243,0,'M02_LOCK','','','',''),
(0x24a,'S02_BIN___05',0x209,'IDV_LOCKERCU05',20,20,200,140,0,'M02_BIN','S02_EBIN__00+5','0','0',''),
(0x24b,'S02_UP1___05',0x209,'IDV_LOCKERCU05',264,7,289,29,0,'M02_UP1','S02_VIAL__05','S02_LOCK__05','',''),
(0x24c,'S02_UP10__05',0x209,'IDV_LOCKERCU05',230,8,257,29,0,'M02_UP10','S02_VIAL__05','S02_LOCK__05','',''),
(0x24d,'S02_DN1___05',0x209,'IDV_LOCKERCU05',262,71,285,89,0,'M02_DN1','S02_VIAL__05','S02_LOCK__05','',''),
(0x24e,'S02_DN10__05',0x209,'IDV_LOCKERCU05',231,72,257,89,0,'M02_DN10','S02_VIAL__05','S02_LOCK__05','',''),
(0x24f,'S02_NUM1__05',0x209,'IDV_LOCKERCU05',263,39,286,62,0,'M02_NUM1','S02_VIAL__05','S02_LOCK__05','',''),
(0x250,'S02_NUM10_05',0x209,'IDV_LOCKERCU05',232,40,255,63,0,'M02_NUM10','S02_VIAL__05','S02_LOCK__05','',''),
(0x251,'S02_VIAL__06',0x20a,'IDV_LOCKERCU06',214,92,318,124,0,'M02_VIAL','S02_NUM1__06','S02_LOCK__06','S02_NUM10_06',''),
(0x252,'S02_LOCK__06',0x20a,'IDV_LOCKERCU06',44,165,137,243,0,'M02_LOCK','','','',''),
(0x253,'S02_BIN___06',0x20a,'IDV_LOCKERCU06',20,20,200,140,0,'M02_BIN','S02_EBIN__00+6','0','0',''),
(0x254,'S02_UP1___06',0x20a,'IDV_LOCKERCU06',264,7,289,29,0,'M02_UP1','S02_VIAL__06','S02_LOCK__06','',''),
(0x255,'S02_UP10__06',0x20a,'IDV_LOCKERCU06',230,8,257,29,0,'M02_UP10','S02_VIAL__06','S02_LOCK__06','',''),
(0x256,'S02_DN1___06',0x20a,'IDV_LOCKERCU06',262,71,285,89,0,'M02_DN1','S02_VIAL__06','S02_LOCK__06','',''),
(0x257,'S02_DN10__06',0x20a,'IDV_LOCKERCU06',231,72,257,89,0,'M02_DN10','S02_VIAL__06','S02_LOCK__06','',''),
(0x258,'S02_NUM1__06',0x20a,'IDV_LOCKERCU06',263,39,286,62,0,'M02_NUM1','S02_VIAL__06','S02_LOCK__06','',''),
(0x259,'S02_NUM10_06',0x20a,'IDV_LOCKERCU06',232,40,255,63,0,'M02_NUM10','S02_VIAL__06','S02_LOCK__06','',''),
(0x25a,'S02_VIAL__07',0x20b,'IDV_LOCKERCU07',214,92,318,124,0,'M02_VIAL','S02_NUM1__07','S02_LOCK__07','S02_NUM10_07',''),
(0x25b,'S02_LOCK__07',0x20b,'IDV_LOCKERCU07',44,165,137,243,0,'M02_LOCK','','','',''),
(0x25c,'S02_BIN___07',0x20b,'IDV_LOCKERCU07',20,20,200,140,0,'M02_BIN','S02_EBIN__00+7','0','0',''),
(0x25d,'S02_UP1___07',0x20b,'IDV_LOCKERCU07',264,7,289,29,0,'M02_UP1','S02_VIAL__07','S02_LOCK__07','',''),
(0x25e,'S02_UP10__07',0x20b,'IDV_LOCKERCU07',230,8,257,29,0,'M02_UP10','S02_VIAL__07','S02_LOCK__07','',''),
(0x25f,'S02_DN1___07',0x20b,'IDV_LOCKERCU07',262,71,285,89,0,'M02_DN1','S02_VIAL__07','S02_LOCK__07','',''),
(0x260,'S02_DN10__07',0x20b,'IDV_LOCKERCU07',231,72,257,89,0,'M02_DN10','S02_VIAL__07','S02_LOCK__07','',''),
(0x261,'S02_NUM1__07',0x20b,'IDV_LOCKERCU07',263,39,286,62,0,'M02_NUM1','S02_VIAL__07','S02_LOCK__07','',''),
(0x262,'S02_NUM10_07',0x20b,'IDV_LOCKERCU07',232,40,255,63,0,'M02_NUM10','S02_VIAL__07','S02_LOCK__07','',''),
(0x263,'S02_VIAL__08',0x20c,'IDV_LOCKERCU08',214,92,318,124,0,'M02_VIAL','S02_NUM1__08','S02_LOCK__08','S02_NUM10_08',''),
(0x264,'S02_LOCK__08',0x20c,'IDV_LOCKERCU08',44,165,137,243,0,'M02_LOCK','','','',''),
(0x265,'S02_BIN___08',0x20c,'IDV_LOCKERCU08',20,20,200,140,0,'M02_BIN','S02_EBIN__00+8','0','0',''),
(0x266,'S02_UP1___08',0x20c,'IDV_LOCKERCU08',264,7,289,29,0,'M02_UP1','S02_VIAL__08','S02_LOCK__08','',''),
(0x267,'S02_UP10__08',0x20c,'IDV_LOCKERCU08',230,8,257,29,0,'M02_UP10','S02_VIAL__08','S02_LOCK__08','',''),
(0x268,'S02_DN1___08',0x20c,'IDV_LOCKERCU08',262,71,285,89,0,'M02_DN1','S02_VIAL__08','S02_LOCK__08','',''),
(0x269,'S02_DN10__08',0x20c,'IDV_LOCKERCU08',231,72,257,89,0,'M02_DN10','S02_VIAL__08','S02_LOCK__08','',''),
(0x26a,'S02_NUM1__08',0x20c,'IDV_LOCKERCU08',263,39,286,62,0,'M02_NUM1','S02_VIAL__08','S02_LOCK__08','',''),
(0x26b,'S02_NUM10_08',0x20c,'IDV_LOCKERCU08',232,40,255,63,0,'M02_NUM10','S02_VIAL__08','S02_LOCK__08','',''),
(0x26c,'S02_VIAL__09',0x20d,'IDV_LOCKERCU09',214,92,318,124,0,'M02_VIAL','S02_NUM1__09','S02_LOCK__09','S02_NUM10_09',''),
(0x26d,'S02_LOCK__09',0x20d,'IDV_LOCKERCU09',44,165,137,243,0,'M02_LOCK','','','',''),
(0x26e,'S02_BIN___09',0x20d,'IDV_LOCKERCU09',20,20,200,140,0,'M02_BIN','S02_EBIN__00+9','0','0',''),
(0x26f,'S02_UP1___09',0x20d,'IDV_LOCKERCU09',264,7,289,29,0,'M02_UP1','S02_VIAL__09','S02_LOCK__09','',''),
(0x270,'S02_UP10__09',0x20d,'IDV_LOCKERCU09',230,8,257,29,0,'M02_UP10','S02_VIAL__09','S02_LOCK__09','',''),
(0x271,'S02_DN1___09',0x20d,'IDV_LOCKERCU09',262,71,285,89,0,'M02_DN1','S02_VIAL__09','S02_LOCK__09','',''),
(0x272,'S02_DN10__09',0x20d,'IDV_LOCKERCU09',231,72,257,89,0,'M02_DN10','S02_VIAL__09','S02_LOCK__09','',''),
(0x273,'S02_NUM1__09',0x20d,'IDV_LOCKERCU09',263,39,286,62,0,'M02_NUM1','S02_VIAL__09','S02_LOCK__09','',''),
(0x274,'S02_NUM10_09',0x20d,'IDV_LOCKERCU09',232,40,255,63,0,'M02_NUM10','S02_VIAL__09','S02_LOCK__09','',''),
(0x275,'S02_VIAL__10',0x20e,'IDV_LOCKERCU10',214,92,318,124,0,'M02_VIAL','S02_NUM1__10','S02_LOCK__10','S02_NUM10_10',''),
(0x276,'S02_LOCK__10',0x20e,'IDV_LOCKERCU10',44,165,137,243,0,'M02_LOCK','','','',''),
(0x277,'S02_BIN___10',0x20e,'IDV_LOCKERCU10',20,20,200,140,0,'M02_BIN','S02_EBIN__00+10','0','0',''),
(0x278,'S02_UP1___10',0x20e,'IDV_LOCKERCU10',264,7,289,29,0,'M02_UP1','S02_VIAL__10','S02_LOCK__10','',''),
(0x279,'S02_UP10__10',0x20e,'IDV_LOCKERCU10',230,8,257,29,0,'M02_UP10','S02_VIAL__10','S02_LOCK__10','',''),
(0x27a,'S02_DN1___10',0x20e,'IDV_LOCKERCU10',262,71,285,89,0,'M02_DN1','S02_VIAL__10','S02_LOCK__10','',''),
(0x27b,'S02_DN10__10',0x20e,'IDV_LOCKERCU10',231,72,257,89,0,'M02_DN10','S02_VIAL__10','S02_LOCK__10','',''),
(0x27c,'S02_NUM1__10',0x20e,'IDV_LOCKERCU10',263,39,286,62,0,'M02_NUM1','S02_VIAL__10','S02_LOCK__10','',''),
(0x27d,'S02_NUM10_10',0x20e,'IDV_LOCKERCU10',232,40,255,63,0,'M02_NUM10','S02_VIAL__10','S02_LOCK__10','',''),
(0x27e,'S02_VIAL__11',0x20f,'IDV_LOCKERCU11',214,92,318,124,0,'M02_VIAL','S02_NUM1__11','S02_LOCK__11','S02_NUM10_11',''),
(0x27f,'S02_LOCK__11',0x20f,'IDV_LOCKERCU11',44,165,137,243,0,'M02_LOCK','','','',''),
(0x280,'S02_BIN___11',0x20f,'IDV_LOCKERCU11',20,20,200,140,0,'M02_BIN','S02_EBIN__00+11','0','0',''),
(0x281,'S02_UP1___11',0x20f,'IDV_LOCKERCU11',264,7,289,29,0,'M02_UP1','S02_VIAL__11','S02_LOCK__11','',''),
(0x282,'S02_UP10__11',0x20f,'IDV_LOCKERCU11',230,8,257,29,0,'M02_UP10','S02_VIAL__11','S02_LOCK__11','',''),
(0x283,'S02_DN1___11',0x20f,'IDV_LOCKERCU11',262,71,285,89,0,'M02_DN1','S02_VIAL__11','S02_LOCK__11','',''),
(0x284,'S02_DN10__11',0x20f,'IDV_LOCKERCU11',231,72,257,89,0,'M02_DN10','S02_VIAL__11','S02_LOCK__11','',''),
(0x285,'S02_NUM1__11',0x20f,'IDV_LOCKERCU11',263,39,286,62,0,'M02_NUM1','S02_VIAL__11','S02_LOCK__11','',''),
(0x286,'S02_NUM10_11',0x20f,'IDV_LOCKERCU11',232,40,255,63,0,'M02_NUM10','S02_VIAL__11','S02_LOCK__11','',''),
(0x287,'S02_VIAL__12',0x210,'IDV_LOCKERCU12',214,92,318,124,0,'M02_VIAL','S02_NUM1__12','S02_LOCK__12','S02_NUM10_12',''),
(0x288,'S02_LOCK__12',0x210,'IDV_LOCKERCU12',44,165,137,243,0,'M02_LOCK','','','',''),
(0x289,'S02_BIN___12',0x210,'IDV_LOCKERCU12',20,20,200,140,0,'M02_BIN','S02_EBIN__00+12','0','0',''),
(0x28a,'S02_UP1___12',0x210,'IDV_LOCKERCU12',264,7,289,29,0,'M02_UP1','S02_VIAL__12','S02_LOCK__12','',''),
(0x28b,'S02_UP10__12',0x210,'IDV_LOCKERCU12',230,8,257,29,0,'M02_UP10','S02_VIAL__12','S02_LOCK__12','',''),
(0x28c,'S02_DN1___12',0x210,'IDV_LOCKERCU12',262,71,285,89,0,'M02_DN1','S02_VIAL__12','S02_LOCK__12','',''),
(0x28d,'S02_DN10__12',0x210,'IDV_LOCKERCU12',231,72,257,89,0,'M02_DN10','S02_VIAL__12','S02_LOCK__12','',''),
(0x28e,'S02_NUM1__12',0x210,'IDV_LOCKERCU12',263,39,286,62,0,'M02_NUM1','S02_VIAL__12','S02_LOCK__12','',''),
(0x28f,'S02_NUM10_12',0x210,'IDV_LOCKERCU12',232,40,255,63,0,'M02_NUM10','S02_VIAL__12','S02_LOCK__12','',''),
(0x290,'S02_VIAL__13',0x211,'IDV_LOCKERCU13',214,92,318,124,0,'M02_VIAL','S02_NUM1__13','S02_LOCK__13','S02_NUM10_13',''),
(0x291,'S02_LOCK__13',0x211,'IDV_LOCKERCU13',44,165,137,243,0,'M02_LOCK','','','',''),
(0x292,'S02_BIN___13',0x211,'IDV_LOCKERCU13',20,20,200,140,0,'M02_BIN','S02_EBIN__00+13','0','0',''),
(0x293,'S02_UP1___13',0x211,'IDV_LOCKERCU13',264,7,289,29,0,'M02_UP1','S02_VIAL__13','S02_LOCK__13','',''),
(0x294,'S02_UP10__13',0x211,'IDV_LOCKERCU13',230,8,257,29,0,'M02_UP10','S02_VIAL__13','S02_LOCK__13','',''),
(0x295,'S02_DN1___13',0x211,'IDV_LOCKERCU13',262,71,285,89,0,'M02_DN1','S02_VIAL__13','S02_LOCK__13','',''),
(0x296,'S02_DN10__13',0x211,'IDV_LOCKERCU13',231,72,257,89,0,'M02_DN10','S02_VIAL__13','S02_LOCK__13','',''),
(0x297,'S02_NUM1__13',0x211,'IDV_LOCKERCU13',263,39,286,62,0,'M02_NUM1','S02_VIAL__13','S02_LOCK__13','',''),
(0x298,'S02_NUM10_13',0x211,'IDV_LOCKERCU13',232,40,255,63,0,'M02_NUM10','S02_VIAL__13','S02_LOCK__13','',''),
(0x299,'S02_VIAL__14',0x212,'IDV_LOCKERCU14',214,92,318,124,0,'M02_VIAL','S02_NUM1__14','S02_LOCK__14','S02_NUM10_14',''),
(0x29a,'S02_LOCK__14',0x212,'IDV_LOCKERCU14',44,165,137,243,0,'M02_LOCK','','','',''),
(0x29b,'S02_BIN___14',0x212,'IDV_LOCKERCU14',20,20,200,140,0,'M02_BIN','S02_EBIN__00+14','0','0',''),
(0x29c,'S02_UP1___14',0x212,'IDV_LOCKERCU14',264,7,289,29,0,'M02_UP1','S02_VIAL__14','S02_LOCK__14','',''),
(0x29d,'S02_UP10__14',0x212,'IDV_LOCKERCU14',230,8,257,29,0,'M02_UP10','S02_VIAL__14','S02_LOCK__14','',''),
(0x29e,'S02_DN1___14',0x212,'IDV_LOCKERCU14',262,71,285,89,0,'M02_DN1','S02_VIAL__14','S02_LOCK__14','',''),
(0x29f,'S02_DN10__14',0x212,'IDV_LOCKERCU14',231,72,257,89,0,'M02_DN10','S02_VIAL__14','S02_LOCK__14','',''),
(0x2a0,'S02_NUM1__14',0x212,'IDV_LOCKERCU14',263,39,286,62,0,'M02_NUM1','S02_VIAL__14','S02_LOCK__14','',''),
(0x2a1,'S02_NUM10_14',0x212,'IDV_LOCKERCU14',232,40,255,63,0,'M02_NUM10','S02_VIAL__14','S02_LOCK__14','',''),
(0x2a2,'S02_VIAL__15',0x213,'IDV_LOCKERCU15',214,92,318,124,0,'M02_VIAL','S02_NUM1__15','S02_LOCK__15','S02_NUM10_15',''),
(0x2a3,'S02_LOCK__15',0x213,'IDV_LOCKERCU15',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2a4,'S02_BIN___15',0x213,'IDV_LOCKERCU15',20,20,200,140,0,'M02_BIN','S02_EBIN__00+15','0','0',''),
(0x2a5,'S02_UP1___15',0x213,'IDV_LOCKERCU15',264,7,289,29,0,'M02_UP1','S02_VIAL__15','S02_LOCK__15','',''),
(0x2a6,'S02_UP10__15',0x213,'IDV_LOCKERCU15',230,8,257,29,0,'M02_UP10','S02_VIAL__15','S02_LOCK__15','',''),
(0x2a7,'S02_DN1___15',0x213,'IDV_LOCKERCU15',262,71,285,89,0,'M02_DN1','S02_VIAL__15','S02_LOCK__15','',''),
(0x2a8,'S02_DN10__15',0x213,'IDV_LOCKERCU15',231,72,257,89,0,'M02_DN10','S02_VIAL__15','S02_LOCK__15','',''),
(0x2a9,'S02_NUM1__15',0x213,'IDV_LOCKERCU15',263,39,286,62,0,'M02_NUM1','S02_VIAL__15','S02_LOCK__15','',''),
(0x2aa,'S02_NUM10_15',0x213,'IDV_LOCKERCU15',232,40,255,63,0,'M02_NUM10','S02_VIAL__15','S02_LOCK__15','',''),
(0x2ab,'S02_VIAL__16',0x214,'IDV_LOCKERCU16',214,92,318,124,0,'M02_VIAL','S02_NUM1__16','S02_LOCK__16','S02_NUM10_16',''),
(0x2ac,'S02_LOCK__16',0x214,'IDV_LOCKERCU16',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2ad,'S02_BIN___16',0x214,'IDV_LOCKERCU16',20,20,200,140,0,'M02_BIN','S02_EBIN__00+16','0','0',''),
(0x2ae,'S02_UP1___16',0x214,'IDV_LOCKERCU16',264,7,289,29,0,'M02_UP1','S02_VIAL__16','S02_LOCK__16','',''),
(0x2af,'S02_UP10__16',0x214,'IDV_LOCKERCU16',230,8,257,29,0,'M02_UP10','S02_VIAL__16','S02_LOCK__16','',''),
(0x2b0,'S02_DN1___16',0x214,'IDV_LOCKERCU16',262,71,285,89,0,'M02_DN1','S02_VIAL__16','S02_LOCK__16','',''),
(0x2b1,'S02_DN10__16',0x214,'IDV_LOCKERCU16',231,72,257,89,0,'M02_DN10','S02_VIAL__16','S02_LOCK__16','',''),
(0x2b2,'S02_NUM1__16',0x214,'IDV_LOCKERCU16',263,39,286,62,0,'M02_NUM1','S02_VIAL__16','S02_LOCK__16','',''),
(0x2b3,'S02_NUM10_16',0x214,'IDV_LOCKERCU16',232,40,255,63,0,'M02_NUM10','S02_VIAL__16','S02_LOCK__16','',''),
(0x2b4,'S02_VIAL__17',0x215,'IDV_LOCKERCU17',214,92,318,124,0,'M02_VIAL','S02_NUM1__17','S02_LOCK__17','S02_NUM10_17',''),
(0x2b5,'S02_LOCK__17',0x215,'IDV_LOCKERCU17',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2b6,'S02_BIN___17',0x215,'IDV_LOCKERCU17',20,20,200,140,0,'M02_BIN','S02_EBIN__00+17','0','0',''),
(0x2b7,'S02_UP1___17',0x215,'IDV_LOCKERCU17',264,7,289,29,0,'M02_UP1','S02_VIAL__17','S02_LOCK__17','',''),
(0x2b8,'S02_UP10__17',0x215,'IDV_LOCKERCU17',230,8,257,29,0,'M02_UP10','S02_VIAL__17','S02_LOCK__17','',''),
(0x2b9,'S02_DN1___17',0x215,'IDV_LOCKERCU17',262,71,285,89,0,'M02_DN1','S02_VIAL__17','S02_LOCK__17','',''),
(0x2ba,'S02_DN10__17',0x215,'IDV_LOCKERCU17',231,72,257,89,0,'M02_DN10','S02_VIAL__17','S02_LOCK__17','',''),
(0x2bb,'S02_NUM1__17',0x215,'IDV_LOCKERCU17',263,39,286,62,0,'M02_NUM1','S02_VIAL__17','S02_LOCK__17','',''),
(0x2bc,'S02_NUM10_17',0x215,'IDV_LOCKERCU17',232,40,255,63,0,'M02_NUM10','S02_VIAL__17','S02_LOCK__17','',''),
(0x2bd,'S02_VIAL__18',0x216,'IDV_LOCKERCU18',214,92,318,124,0,'M02_VIAL','S02_NUM1__18','S02_LOCK__18','S02_NUM10_18',''),
(0x2be,'S02_LOCK__18',0x216,'IDV_LOCKERCU18',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2bf,'S02_BIN___18',0x216,'IDV_LOCKERCU18',20,20,200,140,0,'M02_BIN','S02_EBIN__00+18','0','0',''),
(0x2c0,'S02_UP1___18',0x216,'IDV_LOCKERCU18',264,7,289,29,0,'M02_UP1','S02_VIAL__18','S02_LOCK__18','',''),
(0x2c1,'S02_UP10__18',0x216,'IDV_LOCKERCU18',230,8,257,29,0,'M02_UP10','S02_VIAL__18','S02_LOCK__18','',''),
(0x2c2,'S02_DN1___18',0x216,'IDV_LOCKERCU18',262,71,285,89,0,'M02_DN1','S02_VIAL__18','S02_LOCK__18','',''),
(0x2c3,'S02_DN10__18',0x216,'IDV_LOCKERCU18',231,72,257,89,0,'M02_DN10','S02_VIAL__18','S02_LOCK__18','',''),
(0x2c4,'S02_NUM1__18',0x216,'IDV_LOCKERCU18',263,39,286,62,0,'M02_NUM1','S02_VIAL__18','S02_LOCK__18','',''),
(0x2c5,'S02_NUM10_18',0x216,'IDV_LOCKERCU18',232,40,255,63,0,'M02_NUM10','S02_VIAL__18','S02_LOCK__18','',''),
(0x2c6,'S02_VIAL__19',0x217,'IDV_LOCKERCU19',214,92,318,124,0,'M02_VIAL','S02_NUM1__19','S02_LOCK__19','S02_NUM10_19',''),
(0x2c7,'S02_LOCK__19',0x217,'IDV_LOCKERCU19',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2c8,'S02_BIN___19',0x217,'IDV_LOCKERCU19',20,20,200,140,0,'M02_BIN','S02_EBIN__00+19','0','0',''),
(0x2c9,'S02_UP1___19',0x217,'IDV_LOCKERCU19',264,7,289,29,0,'M02_UP1','S02_VIAL__19','S02_LOCK__19','',''),
(0x2ca,'S02_UP10__19',0x217,'IDV_LOCKERCU19',230,8,257,29,0,'M02_UP10','S02_VIAL__19','S02_LOCK__19','',''),
(0x2cb,'S02_DN1___19',0x217,'IDV_LOCKERCU19',262,71,285,89,0,'M02_DN1','S02_VIAL__19','S02_LOCK__19','',''),
(0x2cc,'S02_DN10__19',0x217,'IDV_LOCKERCU19',231,72,257,89,0,'M02_DN10','S02_VIAL__19','S02_LOCK__19','',''),
(0x2cd,'S02_NUM1__19',0x217,'IDV_LOCKERCU19',263,39,286,62,0,'M02_NUM1','S02_VIAL__19','S02_LOCK__19','',''),
(0x2ce,'S02_NUM10_19',0x217,'IDV_LOCKERCU19',232,40,255,63,0,'M02_NUM10','S02_VIAL__19','S02_LOCK__19','',''),
(0x2cf,'S02_VIAL__20',0x218,'IDV_LOCKERCU20',214,92,318,124,0,'M02_VIAL','S02_NUM1__20','S02_LOCK__20','S02_NUM10_20',''),
(0x2d0,'S02_LOCK__20',0x218,'IDV_LOCKERCU20',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2d1,'S02_BIN___20',0x218,'IDV_LOCKERCU20',20,20,200,140,0,'M02_BIN','S02_EBIN__00+20','0','0',''),
(0x2d2,'S02_UP1___20',0x218,'IDV_LOCKERCU20',264,7,289,29,0,'M02_UP1','S02_VIAL__20','S02_LOCK__20','',''),
(0x2d3,'S02_UP10__20',0x218,'IDV_LOCKERCU20',230,8,257,29,0,'M02_UP10','S02_VIAL__20','S02_LOCK__20','',''),
(0x2d4,'S02_DN1___20',0x218,'IDV_LOCKERCU20',262,71,285,89,0,'M02_DN1','S02_VIAL__20','S02_LOCK__20','',''),
(0x2d5,'S02_DN10__20',0x218,'IDV_LOCKERCU20',231,72,257,89,0,'M02_DN10','S02_VIAL__20','S02_LOCK__20','',''),
(0x2d6,'S02_NUM1__20',0x218,'IDV_LOCKERCU20',263,39,286,62,0,'M02_NUM1','S02_VIAL__20','S02_LOCK__20','',''),
(0x2d7,'S02_NUM10_20',0x218,'IDV_LOCKERCU20',232,40,255,63,0,'M02_NUM10','S02_VIAL__20','S02_LOCK__20','',''),
(0x2d8,'S02_VIAL__21',0x219,'IDV_LOCKERCU21',214,92,318,124,0,'M02_VIAL','S02_NUM1__21','S02_LOCK__21','S02_NUM10_21',''),
(0x2d9,'S02_LOCK__21',0x219,'IDV_LOCKERCU21',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2da,'S02_BIN___21',0x219,'IDV_LOCKERCU21',20,20,200,140,0,'M02_BIN','S02_EBIN__00+21','0','0',''),
(0x2db,'S02_UP1___21',0x219,'IDV_LOCKERCU21',264,7,289,29,0,'M02_UP1','S02_VIAL__21','S02_LOCK__21','',''),
(0x2dc,'S02_UP10__21',0x219,'IDV_LOCKERCU21',230,8,257,29,0,'M02_UP10','S02_VIAL__21','S02_LOCK__21','',''),
(0x2dd,'S02_DN1___21',0x219,'IDV_LOCKERCU21',262,71,285,89,0,'M02_DN1','S02_VIAL__21','S02_LOCK__21','',''),
(0x2de,'S02_DN10__21',0x219,'IDV_LOCKERCU21',231,72,257,89,0,'M02_DN10','S02_VIAL__21','S02_LOCK__21','',''),
(0x2df,'S02_NUM1__21',0x219,'IDV_LOCKERCU21',263,39,286,62,0,'M02_NUM1','S02_VIAL__21','S02_LOCK__21','',''),
(0x2e0,'S02_NUM10_21',0x219,'IDV_LOCKERCU21',232,40,255,63,0,'M02_NUM10','S02_VIAL__21','S02_LOCK__21','',''),
(0x2e1,'S02_VIAL__22',0x21a,'IDV_LOCKERCU22',214,92,318,124,0,'M02_VIAL','S02_NUM1__22','S02_LOCK__22','S02_NUM10_22',''),
(0x2e2,'S02_LOCK__22',0x21a,'IDV_LOCKERCU22',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2e3,'S02_BIN___22',0x21a,'IDV_LOCKERCU22',20,20,200,140,0,'M02_BIN','S02_EBIN__00+22','0','0',''),
(0x2e4,'S02_UP1___22',0x21a,'IDV_LOCKERCU22',264,7,289,29,0,'M02_UP1','S02_VIAL__22','S02_LOCK__22','',''),
(0x2e5,'S02_UP10__22',0x21a,'IDV_LOCKERCU22',230,8,257,29,0,'M02_UP10','S02_VIAL__22','S02_LOCK__22','',''),
(0x2e6,'S02_DN1___22',0x21a,'IDV_LOCKERCU22',262,71,285,89,0,'M02_DN1','S02_VIAL__22','S02_LOCK__22','',''),
(0x2e7,'S02_DN10__22',0x21a,'IDV_LOCKERCU22',231,72,257,89,0,'M02_DN10','S02_VIAL__22','S02_LOCK__22','',''),
(0x2e8,'S02_NUM1__22',0x21a,'IDV_LOCKERCU22',263,39,286,62,0,'M02_NUM1','S02_VIAL__22','S02_LOCK__22','',''),
(0x2e9,'S02_NUM10_22',0x21a,'IDV_LOCKERCU22',232,40,255,63,0,'M02_NUM10','S02_VIAL__22','S02_LOCK__22','',''),
(0x2ea,'S02_VIAL__23',0x21b,'IDV_LOCKERCU23',214,92,318,124,0,'M02_VIAL','S02_NUM1__23','S02_LOCK__23','S02_NUM10_23',''),
(0x2eb,'S02_LOCK__23',0x21b,'IDV_LOCKERCU23',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2ec,'S02_BIN___23',0x21b,'IDV_LOCKERCU23',20,20,200,140,0,'M02_BIN','S02_EBIN__00+23','0','0',''),
(0x2ed,'S02_UP1___23',0x21b,'IDV_LOCKERCU23',264,7,289,29,0,'M02_UP1','S02_VIAL__23','S02_LOCK__23','',''),
(0x2ee,'S02_UP10__23',0x21b,'IDV_LOCKERCU23',230,8,257,29,0,'M02_UP10','S02_VIAL__23','S02_LOCK__23','',''),
(0x2ef,'S02_DN1___23',0x21b,'IDV_LOCKERCU23',262,71,285,89,0,'M02_DN1','S02_VIAL__23','S02_LOCK__23','',''),
(0x2f0,'S02_DN10__23',0x21b,'IDV_LOCKERCU23',231,72,257,89,0,'M02_DN10','S02_VIAL__23','S02_LOCK__23','',''),
(0x2f1,'S02_NUM1__23',0x21b,'IDV_LOCKERCU23',263,39,286,62,0,'M02_NUM1','S02_VIAL__23','S02_LOCK__23','',''),
(0x2f2,'S02_NUM10_23',0x21b,'IDV_LOCKERCU23',232,40,255,63,0,'M02_NUM10','S02_VIAL__23','S02_LOCK__23','',''),
(0x2f3,'S02_VIAL__24',0x21c,'IDV_LOCKERCU24',214,92,318,124,0,'M02_VIAL','S02_NUM1__24','S02_LOCK__24','S02_NUM10_24',''),
(0x2f4,'S02_LOCK__24',0x21c,'IDV_LOCKERCU24',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2f5,'S02_BIN___24',0x21c,'IDV_LOCKERCU24',20,20,200,140,0,'M02_BIN','S02_EBIN__00+24','0','0',''),
(0x2f6,'S02_UP1___24',0x21c,'IDV_LOCKERCU24',264,7,289,29,0,'M02_UP1','S02_VIAL__24','S02_LOCK__24','',''),
(0x2f7,'S02_UP10__24',0x21c,'IDV_LOCKERCU24',230,8,257,29,0,'M02_UP10','S02_VIAL__24','S02_LOCK__24','',''),
(0x2f8,'S02_DN1___24',0x21c,'IDV_LOCKERCU24',262,71,285,89,0,'M02_DN1','S02_VIAL__24','S02_LOCK__24','',''),
(0x2f9,'S02_DN10__24',0x21c,'IDV_LOCKERCU24',231,72,257,89,0,'M02_DN10','S02_VIAL__24','S02_LOCK__24','',''),
(0x2fa,'S02_NUM1__24',0x21c,'IDV_LOCKERCU24',263,39,286,62,0,'M02_NUM1','S02_VIAL__24','S02_LOCK__24','',''),
(0x2fb,'S02_NUM10_24',0x21c,'IDV_LOCKERCU24',232,40,255,63,0,'M02_NUM10','S02_VIAL__24','S02_LOCK__24','',''),
(0x2fc,'S02_VIAL__25',0x21d,'IDV_LOCKERCU25',214,92,318,124,0,'M02_VIAL','S02_NUM1__25','S02_LOCK__25','S02_NUM10_25',''),
(0x2fd,'S02_LOCK__25',0x21d,'IDV_LOCKERCU25',44,165,137,243,0,'M02_LOCK','','','',''),
(0x2fe,'S02_BIN___25',0x21d,'IDV_LOCKERCU25',20,20,200,140,0,'M02_BIN','S02_EBIN__00+25','0','0',''),
(0x2ff,'S02_UP1___25',0x21d,'IDV_LOCKERCU25',264,7,289,29,0,'M02_UP1','S02_VIAL__25','S02_LOCK__25','',''),
(0x300,'S02_UP10__25',0x21d,'IDV_LOCKERCU25',230,8,257,29,0,'M02_UP10','S02_VIAL__25','S02_LOCK__25','',''),
(0x301,'S02_DN1___25',0x21d,'IDV_LOCKERCU25',262,71,285,89,0,'M02_DN1','S02_VIAL__25','S02_LOCK__25','',''),
(0x302,'S02_DN10__25',0x21d,'IDV_LOCKERCU25',231,72,257,89,0,'M02_DN10','S02_VIAL__25','S02_LOCK__25','',''),
(0x303,'S02_NUM1__25',0x21d,'IDV_LOCKERCU25',263,39,286,62,0,'M02_NUM1','S02_VIAL__25','S02_LOCK__25','',''),
(0x304,'S02_NUM10_25',0x21d,'IDV_LOCKERCU25',232,40,255,63,0,'M02_NUM10','S02_VIAL__25','S02_LOCK__25','',''),
(0x305,'S02_VIAL__26',0x21e,'IDV_LOCKERCU26',214,92,318,124,0,'M02_VIAL','S02_NUM1__26','S02_LOCK__26','S02_NUM10_26',''),
(0x306,'S02_LOCK__26',0x21e,'IDV_LOCKERCU26',44,165,137,243,0,'M02_LOCK','','','',''),
(0x307,'S02_BIN___26',0x21e,'IDV_LOCKERCU26',20,20,200,140,0,'M02_BIN','S02_EBIN__00+26','0','0',''),
(0x308,'S02_UP1___26',0x21e,'IDV_LOCKERCU26',264,7,289,29,0,'M02_UP1','S02_VIAL__26','S02_LOCK__26','',''),
(0x309,'S02_UP10__26',0x21e,'IDV_LOCKERCU26',230,8,257,29,0,'M02_UP10','S02_VIAL__26','S02_LOCK__26','',''),
(0x30a,'S02_DN1___26',0x21e,'IDV_LOCKERCU26',262,71,285,89,0,'M02_DN1','S02_VIAL__26','S02_LOCK__26','',''),
(0x30b,'S02_DN10__26',0x21e,'IDV_LOCKERCU26',231,72,257,89,0,'M02_DN10','S02_VIAL__26','S02_LOCK__26','',''),
(0x30c,'S02_NUM1__26',0x21e,'IDV_LOCKERCU26',263,39,286,62,0,'M02_NUM1','S02_VIAL__26','S02_LOCK__26','',''),
(0x30d,'S02_NUM10_26',0x21e,'IDV_LOCKERCU26',232,40,255,63,0,'M02_NUM10','S02_VIAL__26','S02_LOCK__26','','');
