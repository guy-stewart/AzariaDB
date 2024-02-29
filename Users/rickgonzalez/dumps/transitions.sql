-- courtesy TblAutomatons::Dump()drop table if exists transitions;
create table transitions
(
    [automaton]   text,
    [state]       text,
    [new_state]   text,
    [opcode]      text,
    [param_1]     text,
    [param_2]     text,
    [code]        text,
    [guard]       text
    [doc]         text
);

insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code], [guard], [doc]) values
('M02_BIN','0','OPEN_EMPTY','Z_EPSILON','','','','',''),
('M02_BIN','LOCKED_EMPTY','OPEN_EMPTY','WAIT','','SIG_OPEN','','',''),
('M02_BIN','LOCKED_OCCUPIED','OPEN_OCCUPIED','WAIT','','SIG_OPEN','','',''),
('M02_BIN','OPEN_EMPTY','OPEN_OCCUPIED','DROP','','','
    ASHOW(WOBJECT);
    MOV(WTEMP1,WOBJECT);','',''),
('M02_BIN','OPEN_EMPTY','LOCKED_EMPTY','WAIT','','SIG_CLOSE','','',''),
('M02_BIN','OPEN_OCCUPIED','OPEN_EMPTY','GRAB','','','   SHOW();
    ASSIGN(WTEMP1,0);','',''),
('M02_BIN','OPEN_OCCUPIED','LOCKED_OCCUPIED','WAIT','','SIG_CLOSE','','',''),
('M02_DN1','0','0','CLICK','','','PLAYWAVE(SOUND_CLICK);
SIGNAL(WIP1, SIG_DEC1);','',''),
('M02_DN10','0','0','CLICK','','','PLAYWAVE(SOUND_CLICK);
SIGNAL(WIP1, SIG_DEC10);','',''),
('M02_LOCK','0','UNLOCKED','C_ACCEPT','','IDC_KEY','','',''),
('M02_LOCK','10','0','IFSTATE','OPEN_EMPTY','WIP1','','',''),
('M02_LOCK','10','M02_LOCKED','Z_EPSILON','','','
    PLAYWAVE(SOUND_LEVER);
    SIGNAL(WIP1,SIG_CLOSE);','',''),
('M02_LOCK','2','M02_KEYED','Z_EPSILON','','','
    PLAYWAVE(SOUND_LEVER);
    SIGNAL(WIP1,SIG_OPEN);
    O_ACCEPT(WOBJECT);
    SHOW(0,IDS_LOCKWKEY);','',''),
('M02_LOCK','M02_KEYED','10','GRAB','','','
    CLEAR(WOBJECT);
    SHOW();','',''),
('M02_LOCK','M02_LOCKED','2','DROP','WPARM','','','',''),
('M02_LOCK','UNLOCKED','2','DROP','','','','',''),
('M02_NUM1','0','0','WAIT','SIG_SHOW','','
    REF_MACHINE(WIP1);
    BFRAME = R_WPARM % 10;
    if (BFRAME < 0) {BFRAME=0;}
    if (BFRAME > 9) {BFRAME=9;}
    SHOW(0,IDS_CITYNUM);','',''),
('M02_NUM10','0','0','WAIT','SIG_SHOW','','
    REF_MACHINE(WIP1);
    BFRAME = R_WPARM / 10 ;
    if (BFRAME < 0) {BFRAME=0;}
    if (BFRAME > 9) {BFRAME=9;}
    SHOW(0,IDS_CITYNUM);','',''),
('M02_UP1','0','0','CLICK','','','PLAYWAVE(SOUND_CLICK);
SIGNAL(WIP1,SIG_INC1);','',''),
('M02_UP10','0','1','CLICK','','','PLAYWAVE(SOUND_CLICK);
SIGNAL(WIP1,SIG_INC10);','',''),
('M02_VIAL','0','WITHDRAW','DRAG','','IDD_SCOOPE','','',''),
('M02_VIAL','0','DEPOSIT','DRAG','','IDD_SCOOPF','','',''),
('M02_VIAL','0','SET_PRICE','WAIT','','SIG_INC1','if (NOTSTATE(M02_LOCKED,WIP2)) {
    ADDI(WPARM,1);
}','',''),
('M02_VIAL','0','SET_PRICE','WAIT','','SIG_DEC1','if (NOTSTATE(M02_LOCKED,WIP2)) {
    SUBI(WPARM,1);
}','',''),
('M02_VIAL','0','SET_PRICE','WAIT','','SIG_INC10','if (NOTSTATE(M02_LOCKED,WIP2)) {
    ADDI(WPARM,10);
}','',''),
('M02_VIAL','0','SET_PRICE','WAIT','','SIG_DEC10','if (NOTSTATE(M02_LOCKED,WIP2)) {
    SUBI(WPARM,10);
}','',''),
('M02_VIAL','DEPOSIT','0','Z_EPSILON','','','
if (IFSTATE(M02_LOCKED, WIP2)) {
    if (WPARM>0) {
        WPARM = WPARM - 1;
        BPARM = BPARM + 1;
        PLAYWAVE(SOUND_SPIT);
        HANDOFF(0,IDD_SCOOPE);
    }
    if (WPARM <= 0) {
        SIGNAL(WIP4, SIG_OPEN);
    }
    SIGNAL(WIP1, SIG_SHOW);
    SIGNAL(WIP3, SIG_SHOW);
}','',''),
('M02_VIAL','SET_PRICE','0','Z_EPSILON','','','
if (WPARM >99) WPARM = 99;
SIGNAL(WIP3,SIG_SHOW);
SIGNAL(WIP1,SIG_SHOW);','',''),
('M02_VIAL','WITHDRAW','0','Z_EPSILON','','','
if (IFSTATE(M02_KEYED, WIP2)) {
    if (BPARM > 0) {
        BPARM = BPARM - 1;
        PLAYWAVE(SOUND_SLURP);
        HANDOFF(0,IDD_SCOOPF);
    }
}','',''),
('M04_BIN','0','1','WAIT','SIG_VEND','','
    ASSIGN(WOBJECT,IDD_CITY_KEY_0);
    SHOW(IDS_KEY_IN_BIN);','',''),
('M04_BIN','1','0','GRAB','','','SHOW(0,0);','',''),
('M04_KEYCLAMP','0','VACANT','C_ACCEPT','0','IDC_KEY','','',''),
('M04_KEYCLAMP','OCCUPIED','VACANT','GRAB','','0','
    SHOW();
    SIGNAL(WIP1, SIG_HIDE);
    SIGNAL(WIP2, SIG_HIDE);
    SIGNAL(WIP3, SIG_HIDE);','',''),
('M04_KEYCLAMP','OCCUPIED','OCCUPIED','WAIT','','','
    REF_MACHINE(WIP1);
    WOBJECT=R_BFRAME*4;
    REF_MACHINE(WIP2);
    WOBJECT=(WOBJECT+R_BFRAME)*4;
    REF_MACHINE(WIP3);
    WOBJECT = WOBJECT + R_BFRAME;
    WOBJECT = "IDD_CITY_KEY_"+WOBJECT;','',''),
('M04_KEYCLAMP','VACANT','OCCUPIED','DROP','0','0','
WPARM = WOBJECT;
MAP(WPARM, KEY);
SIGNAL(WIP1, SIG_SHOW);
SIGNAL(WIP2, SIG_SHOW);
SIGNAL(WIP3, SIG_SHOW);
SHOW(0,IDS_KEY_CFGWKEY);','',''),
('M04_SLIDER','0','1','MOV','WSPRITE','WIP1','','',''),
('M04_SLIDER','1','idle','SHOW','WSPRITE','','','',''),
('M04_SLIDER','idle','1','CLICK','','','
BFRAME = BFRAME + 1;
if (BFRAME > 3) BFRAME=0;
SIGNAL(WIP2);','',''),
('M04_SLIDER','idle','1','WAIT','','SIG_SHOW','
REF_MACHINE(WIP2);
BFRAME= (R_WPARM / WIP3);
MOD(BFRAME,4);','',''),
('M04_SLIDER','idle','1','WAIT','','SIG_HIDE','BFRAME=0;','',''),
('M04_VIAL','0','1','DRAG','0','IDD_SCOOPF','
    PLAYWAVE(SOUND_SLURP);
    HANDOFF(0,IDD_SCOOPE);','',''),
('M04_VIAL','1','0','DRAG','0','IDD_SCOOPF','
    PLAYWAVE(SOUND_SLURP);
    HANDOFF(0,IDD_SCOOPE);
    SIGNAL(S04_BIN,SIG_VEND);','',''),
('M05_BUBBLE','0','0','WAIT','0','0','VIDEO(0,IDS_CHEMBUBL);','',''),
('M05_CHEM','0','20','WAIT','','','
    SHOW(0,IDS_CHEMFILL);
    ANIMATE(0,0);
    REF_MACHINE(WIP1);
    MOV(WOBJECT,R_BFRAME);
    MAP(WOBJECT,CHEM_IDDX);','',''),
('M05_CHEM','20','0','GRAB','','','
    CLEAR(WOBJECT);
    CLEAR(WSPRITE);
    SHOW(0,0);','',''),
('M05_DOWN','0','0','CLICK','','','
    PLAYWAVE(0,SOUND_CLICK);
    SIGNAL(WIP1,SIG_DEC1);','',''),
('M05_ICON','0','2','WAIT','0','SIG_INC1','ADDI(BFRAME,1);','',''),
('M05_ICON','0','7','WAIT','0','SIG_DEC1','SUBI(BFRAME,1);','',''),
('M05_ICON','2','20','GTEi','BFRAME','WIP4','ASSIGN(BFRAME,0);','',''),
('M05_ICON','2','20','Z_EPSILON','','','','',''),
('M05_ICON','20','0','Z_EPSILON','','','
    SHOW(0,IDS_CHEMS);
    SIGNAL(WIP1, SIG_UPDATE);
    SIGNAL(WIP2, SIG_UPDATE);
    SIGNAL(WIP3, SIG_UPDATE);','',''),
('M05_ICON','7','20','LTi','BFRAME','0','
    ASSIGN(BFRAME,WIP4);
    SUBI  (BFRAME,1);','',''),
('M05_ICON','7','20','Z_EPSILON','','','','',''),
('M05_NUM1','0','0','WAIT','SIG_UPDATE','','
    REF_MACHINE(WIP1);
    MOV(BFRAME,R_BPARM);
    MODI(BFRAME,10);
    SHOW(0,IDS_CITYNUM);','',''),
('M05_NUM10','0','0','WAIT','SIG_UPDATE','','
    REF_MACHINE(WIP1);
    MOV(BFRAME,R_BPARM);
    DIVI(BFRAME,10);
    SHOW(0,IDS_CITYNUM);','',''),
('M05_UP','0','0','CLICK','','','
    PLAYWAVE(0,SOUND_CLICK);
    SIGNAL(WIP1,SIG_INC1);','',''),
('M05_VIAL','0','7','CLICK','0','0','','',''),
('M05_VIAL','0','1','DRAG','0','IDD_SCOOPF','','',''),
('M05_VIAL','0','0','WAIT','SIG_UPDATE','','
    REF_MACHINE(WIP3);
    MOV(BPARM,R_BFRAME);
    MAPi(BPARM,CHEMCOST);','',''),
('M05_VIAL','1','7','LT','WPARM','BPARM','
    ADDI(WPARM,1);
    HANDOFF(0,IDD_SCOOPE);
    PLAYWAVE(0,SOUND_SLURP);','',''),
('M05_VIAL','1','7','Z_EPSILON','','','','',''),
('M05_VIAL','7','0','GTE','WPARM','BPARM','
    SIGNAL(WIP1);
    SIGNAL(WIP2);
    SUB(WPARM,BPARM);','',''),
('M05_VIAL','7','0','Z_EPSILON','','','','',''),
('M06_CYCLE_COMP1','0','10','WAIT','','SIG_INC1','','',''),
('M06_CYCLE_COMP1','0','10','WAIT','','SIG_DEC1','','',''),
('M06_CYCLE_COMP1','0','10','WAIT','','SIG_SHOW','','',''),
('M06_CYCLE_COMP1','10','0','Z_EPSILON','','','REF_MACHINE(WIP1);
predicate cardmach(id,chem1);
cardmach(R_WPARM,?BFRAME);
MAPi(BFRAME,S06_CHEMFILMSTRIP);
SHOW(0,IDS_CHEMS);','',''),
('M06_CYCLE_COMP2','0','10','WAIT','','SIG_INC1','','',''),
('M06_CYCLE_COMP2','0','10','WAIT','','SIG_DEC1','','',''),
('M06_CYCLE_COMP2','0','10','WAIT','','SIG_SHOW','','',''),
('M06_CYCLE_COMP2','10','0','Z_EPSILON','','','REF_MACHINE(WIP1);
predicate cardmach(id,chem2);
cardmach(R_WPARM,?BFRAME);
MAPi(BFRAME,S06_CHEMFILMSTRIP);
SHOW(0,IDS_CHEMS);','',''),
('M06_CYCLE_COMP3','0','10','WAIT','','SIG_INC1','','',''),
('M06_CYCLE_COMP3','0','10','WAIT','','SIG_DEC1','','',''),
('M06_CYCLE_COMP3','0','10','WAIT','','SIG_SHOW','','',''),
('M06_CYCLE_COMP3','10','0','Z_EPSILON','','','REF_MACHINE(WIP1);
predicate cardmach(id,cost);
cardmach(R_WPARM,?BFRAME);
SHOW(0,IDS_VIALCNT);','',''),
('M06_CYCLE_TEMPL_ANIM','0','0','WAIT','','SIG_INC1','SHOW(0,IDS_MACHANI);
ANIMATE();
PLAYWAVE(SOUND_RATCHET);
SIGNAL(WIP1,SIG_INC1);','',''),
('M06_CYCLE_TEMPL_ANIM','0','0','WAIT','','SIG_DEC1','SHOW(0,IDS_MACHANI);
ANIMATE(0,V_REVERSE);
PLAYWAVE(SOUND_RATCHET);
SIGNAL(WIP1,SIG_DEC1);','',''),
('M06_CYCLE_TEMPL_DN_BTN','0','0','CLICK','','','PLAYWAVE(SOUND_CLICK);
SIGNAL(WIP1,SIG_DEC1);','',''),
('M06_CYCLE_TEMPL_UP_BTN','0','0','CLICK','','','PLAYWAVE(SOUND_CLICK);
SIGNAL(WIP1,SIG_INC1);','',''),
('M06_CYCLE_VIEW','0','1','Z_EPSILON','','','WPARM=0;
SIGNAL(WIP1,SIG_DEC1);
SIGNAL(WIP2,SIG_DEC1);
SIGNAL(WIP3,SIG_DEC1);','',''),
('M06_CYCLE_VIEW','1','2','Z_EPSILON','','','predicate cardmach(id,object);
cardmach(WPARM,?WOBJECT);
ASHOW(WOBJECT);
','',''),
('M06_CYCLE_VIEW','2','1','WAIT','','SIG_INC1','WPARM = WPARM + 1;
if (WPARM > 24) {WPARM=0;}
SIGNAL(WIP1,SIG_INC1);
SIGNAL(WIP2,SIG_INC1);
SIGNAL(WIP3,SIG_INC1);','',''),
('M06_CYCLE_VIEW','2','1','WAIT','','SIG_DEC1','SUBI(WPARM,1);
if (WPARM<0) {WPARM=24;}
SIGNAL(WIP1,SIG_DEC1);
SIGNAL(WIP2,SIG_DEC1);
SIGNAL(WIP3,SIG_DEC1);','',''),
('M06_CYCLE_VIEW','2','1','WAIT','','SIG_SHOW','REF_MACHINE(WIP4);
WPARM=R_WPARM;','',''),
('M06_EJECT_CARD_ANIM','0','20','WAIT','','SIG_EJECT','
SHOW(0,IDS_CARDANI);
ANIMATE(0);
PLAYWAVE(SOUND_CARDEJECT);
REF_MACHINE(WIP1);
predicate cardmach(id,card);
cardmach(R_WPARM,?WOBJECT);
','',''),
('M06_EJECT_CARD_ANIM','20','0','GRAB','WOBJECT','','CLEAR(WSPRITE); SHOW(0);','',''),
('M06_EJECT_CARD_BTN','0','0','CLICK','','','PLAYWAVE(SOUND_CLICK);SIGNAL(WIP1, SIG_EJECT);','',''),
('M06_EJECT_TEMPL_ANIM','0','1','C_ACCEPT','','IDC_TEMPLATE','','',''),
('M06_EJECT_TEMPL_ANIM','1','30','DROP','','','','',''),
('M06_EJECT_TEMPL_ANIM','1','5','WAIT','','SIG_EJECT','','',''),
('M06_EJECT_TEMPL_ANIM','20','0','GRAB','0','0','CLEAR(WOBJECT); CLEAR(WSPRITE); SHOW(0);','',''),
('M06_EJECT_TEMPL_ANIM','30','31','SHOW','0','IDS_TEMPEJEC','ANIMATE(0,V_REVERSE);PLAYWAVE(SOUND_CARDEJECT);','',''),
('M06_EJECT_TEMPL_ANIM','31','32','MOV','WPARM','WOBJECT','MAPi(WPARM,S06_TEMP_INDEX);','',''),
('M06_EJECT_TEMPL_ANIM','32','0','SIGNAL','WIP4','SIG_SHOW','SIGNAL(WIP1,SIG_SHOW);SIGNAL(WIP2,SIG_SHOW);SIGNAL(WIP3,SIG_SHOW);','',''),
('M06_EJECT_TEMPL_ANIM','5','20','SHOW','0','IDS_TEMPEJEC','ANIMATE(0);PLAYWAVE(SOUND_CARDEJECT);','',''),
('M06_PEZPOP','0','1','CLICK','0','0','','',''),
('M06_PEZPOP','1','2','SHOW','0','IDS_PEZPOP','','',''),
('M06_PEZPOP','2','3','ANIMATE','0','0','','',''),
('M06_PEZPOP','3','4','GRAB','WIP1','','','',''),
('M06_PEZPOP','4','5','SHOW','0','0','','',''),
('M06_PEZPOP','5','6','CLEAR','WSPRITE','','','',''),
('M06_PEZPOP','6','0','VIDEO','V_REVERSE','IDS_PEZPOP','','',''),
('M06_TEMPHOLD','0','10','C_ACCEPT','0','IDC_TEMPLATE','','',''),
('M06_TEMPHOLD','10','11','DROP','0','0','','',''),
('M06_TEMPHOLD','11','12','SHOW','0','IDS_TMORPH','','',''),
('M06_TEMPHOLD','12','13','ANIMATE','0','V_LOOP|V_REWIND','','',''),
('M06_TEMPHOLD','13','14','MOV','WTEMP1','WOBJECT','','',''),
('M06_TEMPHOLD','14','15','SUBI','WTEMP1','IDD_TEMPLATE01','','',''),
('M06_TEMPHOLD','15','16','SIGNAL','WIP1','','','',''),
('M06_TEMPHOLD','16','17','GRAB','0','0','','',''),
('M06_TEMPHOLD','17','18','CLEAR','WOBJECT','','','',''),
('M06_TEMPHOLD','18','19','SIGNAL','WIP1','','','',''),
('M06_TEMPHOLD','19','10','SHOW','0','0','','',''),
('M06_TEMPL_EJECT_BTN','0','0','CLICK','','','PLAYWAVE(SOUND_CLICK);SIGNAL(WIP1, SIG_EJECT);','',''),
('M06_TRI1','0','1','WAIT','0','0','','',''),
('M06_TRI1','1','2','MOV','WOBJECT','WTEMP1','','',''),
('M06_TRI1','2','3','MAPi','WOBJECT','TEMPLATE_OBJECTS','','',''),
('M06_TRI1','3','4','ASHOW','WOBJECT','','','',''),
('M06_TRI1','4','5','SIGNAL','WIP1','','','',''),
('M06_TRI1','5','6','WAIT','0','0','','',''),
('M06_TRI1','6','7','CLEAR','WOBJECT','','','',''),
('M06_TRI1','7','8','SHOW','0','0','','',''),
('M06_TRI1','8','0','SIGNAL','WIP1','','','',''),
('M06_TRI2','0','1','WAIT','0','0','','',''),
('M06_TRI2','1','2','MOV','BFRAME','WTEMP1','','',''),
('M06_TRI2','2','3','MAPi','BFRAME','TEMPLATE_COST','','',''),
('M06_TRI2','3','4','SHOW','0','IDS_VIALCNT','','',''),
('M06_TRI2','4','5','SIGNAL','WIP1','','','',''),
('M06_TRI2','5','6','WAIT','0','0','','',''),
('M06_TRI2','6','7','CLEAR','BFRAME','','','',''),
('M06_TRI2','7','8','SHOW','0','0','','',''),
('M06_TRI2','8','0','SIGNAL','WIP1','','','',''),
('M06_TRI3','0','1','WAIT','0','0','','',''),
('M06_TRI3','1','2','MOV','BFRAME','WTEMP1','','',''),
('M06_TRI3','2','3','MAPi','BFRAME','TEMPLATE_CHEM1','','',''),
('M06_TRI3','3','4','SHOW','0','IDS_CHEMS','','',''),
('M06_TRI3','4','5','SIGNAL','WIP1','','','',''),
('M06_TRI3','5','6','WAIT','0','0','','',''),
('M06_TRI3','6','7','CLEAR','BFRAME','','','',''),
('M06_TRI3','7','8','SHOW','0','0','','',''),
('M06_TRI3','8','0','SIGNAL','WIP1','','','',''),
('M06_TRI4','0','1','WAIT','0','0','','',''),
('M06_TRI4','1','2','MOV','BFRAME','WTEMP1','','',''),
('M06_TRI4','2','3','MAPi','BFRAME','TEMPLATE_CHEM2','','',''),
('M06_TRI4','3','4','SHOW','0','IDS_CHEMS','','',''),
('M06_TRI4','4','5','WAIT','0','0','','',''),
('M06_TRI4','5','6','CLEAR','BFRAME','','','',''),
('M06_TRI4','6','0','SHOW','0','0','','',''),
('M08_BEEM','0','1','CLICK','0','0','','',''),
('M08_BEEM','0','1','WAIT','0','0','','',''),
('M08_BEEM','1','0','VIDEO','0','IDS_BEAMER','','',''),
('M08_BIN','0','100','CLICK','','','','',''),
('M08_BIN','0','100','WAIT','','','','',''),
('M08_BIN','100','101','REF_MACHINE','WIP1','','
    MOV (WPARM,R_WOBJECT);
','',''),
('M08_BIN','101','0','EQUALi','WPARM','0','','',''),
('M08_BIN','101','102','Z_EPSILON','','','
    MOV(WTEMP1,WPARM);
    MAPi(WTEMP1,CARD_CHEM1);
    REF_MACHINE(WIP2);
','',''),
('M08_BIN','102','0','NEQUAL','WTEMP1','R_WOBJECT','','',''),
('M08_BIN','102','103','Z_EPSILON','','','
    MOV(WTEMP1,WPARM);
    MAPi(WTEMP1,CARD_CHEM2);
    REF_MACHINE(WIP3);
','',''),
('M08_BIN','103','0','NEQUAL','WTEMP1','R_WOBJECT','','',''),
('M08_BIN','103','104','Z_EPSILON','','','
    MOV(WTEMP1,WPARM);
    MAPi(WTEMP1,CARD_COST);
    REF_MACHINE(WIP4);
','',''),
('M08_BIN','104','0','LT','R_BPARM','WTEMP1','','',''),
('M08_BIN','104','105','Z_EPSILON','','','
    SIGNAL(WIP2, SIG_CLEAR);
    SIGNAL(WIP3, SIG_CLEAR);
    SIGNAL(WIP4, SIG_CLEAR);
    MOV(WOBJECT,WPARM);
    MAPi(WOBJECT,CARD_OBJECTS);
    ASHOW(WOBJECT);','',''),
('M08_BIN','105','0','GRAB','','','SHOW();','',''),
('M08_CARDHOLD','0','10','C_ACCEPT','0','IDC_CARD','','',''),
('M08_CARDHOLD','10','20','DROP','0','0','
    SHOW(0,IDS_CARDANI);
    ANIMATE(0,V_REVERSE);
    PLAYWAVE(0,SOUND_CARDEJECT);
    MOV(WPARM,WOBJECT);
    SUBI(WPARM,IDD_TEMPLATE01);
    SIGNAL(WIP1);
    SIGNAL(WIP2, SIG_SET);
    SIGNAL(WIP3, SIG_SET);
    SIGNAL(WIP4, SIG_SET);
    ','',''),
('M08_CARDHOLD','20','30','CLICK','','','
    SHOW(0,IDS_CARDANI);
    ANIMATE();
    PLAYWAVE(0,SOUND_CARDEJECT);','',''),
('M08_CARDHOLD','20','30','WAIT','','SIG_SET','
    SHOW(0,IDS_CARDANI);
    ANIMATE();
    PLAYWAVE(0,SOUND_CARDEJECT);','',''),
('M08_CARDHOLD','30','10','GRAB','0','0','
    CLEAR(WOBJECT);
    CLEAR(WPARM);
    SHOW();
    SIGNAL(WIP2,SIG_CLEAR);
    SIGNAL(WIP3,SIG_CLEAR);
    SIGNAL(WIP4,SIG_CLEAR);
','',''),
('M08_CHEMHOLD1','0','10','C_ACCEPT','0','IDC_CHEM','','',''),
('M08_CHEMHOLD1','10','20','DROP','','','
    SHOW(WOBJECT);','',''),
('M08_CHEMHOLD1','20','30','GRAB','','','','',''),
('M08_CHEMHOLD1','20','30','WAIT','','SIG_CLEAR','','',''),
('M08_CHEMHOLD1','30','10','Z_EPSILON','','','
    CLEAR(WOBJECT);
    SHOW();','',''),
('M08_CHEMIND1','0','10','Z_EPSILON','','','','',''),
('M08_CHEMIND1','10','10','WAIT','','SIG_SET','
    REF_MACHINE(WIP1);
    MOV(BFRAME,R_WOBJECT);
    MAP(BFRAME,WIP2);
    MAPi(BFRAME,CHEM_INDEX);
    SHOW(0, IDS_PLAQCHEM);
','',''),
('M08_CHEMIND1','10','10','WAIT','','SIG_CLEAR','
    SHOW();
','',''),
('M08_EJECT','0','1','CLICK','','','
    SIGNAL(WIP1, SIG_SET);
','',''),
('M08_EJECT','1','0','Z_EPSILON','','','','',''),
('M08_HOPPER','0','0','DRAG','0','IDD_SCOOPF','
    HANDOFF(0,IDD_SCOOPE);
    PLAYWAVE(0,SOUND_SPIT);
    ADDI(BPARM,1);','',''),
('M08_HOPPER','0','10','DRAG','0','IDD_SCOOPE','','',''),
('M08_HOPPER','0','10','WAIT','','SIG_CLEAR','
    ASSIGN(BPARM,0);
    ','',''),
('M08_HOPPER','10','0','LTEi','BPARM','0','','',''),
('M08_HOPPER','10','0','Z_EPSILON','','','
    HANDOFF(0,IDD_SCOOPF);
    PLAYWAVE(0,SOUND_SLURP);
    SUBI(BPARM,1);
    ','',''),
('M08_PLAQUE','0','1','WAIT','','SIG_SET','
    SHOW(IDS_PLAQUE);
','',''),
('M08_PLAQUE','1','0','WAIT','0','SIG_CLEAR','
    SHOW();
','',''),
('M10_DRYPIT','0','10','Z_EPSILON','','','
    ASSIGN(BFRAME,9);
    MUL(BFRAME,BPARM);
    ASSIGN(WPARM,MAX_DRYPIT);
    DIV(BFRAME,WPARM);
    ASSIGN(WSPRITE,IDS_PITFUL);
    SHOW(WSPRITE);','',''),
('M10_DRYPIT','10','21','DRAG','0','IDD_SCOOPE','','',''),
('M10_DRYPIT','10','31','DRAG','0','IDD_SCOOPF','','',''),
('M10_DRYPIT','10','0','WAIT','','SIG_CLOSE','
    MOV(BPARM,0);
    PLAYWAVE(SOUND_BURBLE);','',''),
('M10_DRYPIT','21','25','GTEi','BPARM','1','
    PLAYWAVE(SOUND_SLURP);
    SUBI(BPARM,1);
    HANDOFF(0,IDD_SCOOPF);
    ADDI(LKARMA,1);
    SIGNAL(SID_HALO,SIG_ADD);','',''),
('M10_DRYPIT','21','10','Z_EPSILON','0','','','',''),
('M10_DRYPIT','25','0','EQUALi','BPARM','MAX_DRYPIT-1','SIGNALi(SIG_CLOSE,S10_FLOWER);','',''),
('M10_DRYPIT','25','0','Z_EPSILON','','','','',''),
('M10_DRYPIT','31','35','LTEi','BPARM','MAX_DRYPIT-1','
    PLAYWAVE(SOUND_SPIT);
    ADDI(BPARM,1);
    HANDOFF(0,IDD_SCOOPE);','',''),
('M10_DRYPIT','31','10','Z_EPSILON','','','','',''),
('M10_DRYPIT','35','0','EQUALi','BPARM','MAX_DRYPIT','SIGNALi(SIG_OPEN,S10_FLOWER);','',''),
('M10_DRYPIT','35','0','Z_EPSILON','','','','',''),
('M10_FLOWER','0','1','SHOW','0','IDS_FLOPN1','','',''),
('M10_FLOWER','1','30','WAIT','','SIG_OPEN','
    PLAYWAVE(SOUND_BUZZFUZZ);
    SHOW(0,IDS_FLOPN1);
    ANIMATE();
    SIGNALi(SIG_COMPLETE,REC_DRYPIT);','',''),
('M10_FLOWER','30','1','GRAB','','IDD_SEED','
    PLAYWAVE(SOUND_BUZZFUZZ);
    SHOW(0,IDS_FLOPN1);
    ANIMATE(0,V_REVERSE);
    SIGNALi(SIG_CLOSE,S10_DRYPIT);','',''),
('M10_FLOWER','30','1','WAIT','','SIG_CLOSE','
    PLAYWAVE(SOUND_BUZZFUZZ);
    SHOW(0,IDS_FLOPN1);
    ANIMATE(0,V_REVERSE);','',''),
('M11_ASCENT','0','3','WAIT','0','SIG_BURNED','
   SHOW(IDS_SPIRIT0);
   ANIMATE();
   ESTIME(4);
 ','',''),
('M11_ASCENT','3','0','GRAB','0','IDD_SPRINGS','
   CLEAR(WOBJECT);
   CLEAR(WPARM);
   CLEAR(WSPRITE);
   SHOW();
 ','',''),
('M11_FIRE','0','logLoaded','DROP','0','IDD_LOG','
    PLAYWAVE(SOUND_CLUNK);
    SHOW(0,IDS_FISHWOOD);
    ASSIGN(BPARM,0);
 ','',''),
('M11_FIRE','addLog','burning','ADDI','WPARM','BURN_TIME','','',''),
('M11_FIRE','burning','addLog','DROP','0','IDD_LOG','','',''),
('M11_FIRE','burning','extinguished','DROP','0','IDD_BUCKF','
   PLAYWAVE(SOUND_SPLASH);
   ASSIGN(BPARM,0);
   HANDOFF(IDD_BUCKE);
   SIGNAL(WIP1, SIG_EXTINGUISHED);
 ','',''),
('M11_FIRE','burning','extinguished','ESTIME','WPARM','','
   ASSIGN(BPARM,0);
   CLEAR(DETIME);
 ','',''),
('M11_FIRE','extinguished','0','CLEAR','WOBJECT','','
    CLEAR(WSPRITE);
    CLEAR(WPARM);
    SHOW();
    STOPWAVE();
 ','',''),
('M11_FIRE','logLoaded','burning','DRAG','0','IDD_MATCH','
    ASHOW(IDS_BURNWOOD,V_LOOP);
    ADDI(WPARM,BURN_TIME);
    ASSIGN(BPARM,1); //for others to reference
    SIGNAL(WIP1, SIG_FIRE);
    CLEAR(DETIME);
    PLAYWAVE(SOUND_FIRE);
 ','',''),
('M11_FIRE','logLoaded','0','GRAB','0','0','','',''),
('M11_GRILL','0','emptyGrill','C_ACCEPT','0','IDC_FISH','
    REF_MACHINE(WIP1);
 ','',''),
('M11_GRILL','burned','takenAsh','GRAB','0','0','','',''),
('M11_GRILL','burning','burned','ESTIME','0','FISH_BURN_TIME','
    MAP_OBJ(0,OP_BURN);
    SHOW(IDS_FISHASH);
    PLAYWAVE(SOUND_FIRE); 
    //Cast off soul
    SIGNAL(WIP2,SIG_BURNED);
 ','',''),
('M11_GRILL','burning','fishOnGrill','WAIT','','SIG_EXTINGUISHED','
   CLEAR(DETIME);
 ','',''),
('M11_GRILL','emptyGrill','fishOnGrill','DROP','0','0','
    SHOW(WOBJECT);
    ANIMATE(0,V_LOOP);
 ','',''),
('M11_GRILL','fishOnGrill','burning','EQUAL','R_BPARM','1','','',''),
('M11_GRILL','fishOnGrill','emptyGrill','GRAB','0','0','
    SHOW();
 ','',''),
('M11_GRILL','fishOnGrill','burning','WAIT','','SIG_FIRE','','',''),
('M11_GRILL','takenAsh','emptyGrill','SHOW','0','0','','',''),
('M12_ASHSHELF','0','10','C_ACCEPT','0','IDC_FISHASH','','',''),
('M12_ASHSHELF','10','11','DROP','0','0','','',''),
('M12_ASHSHELF','11','12','SHOW','WOBJECT','','','',''),
('M12_ASHSHELF','115','116','ASHOW','WOBJECT','','','',''),
('M12_ASHSHELF','116','117','SIGNAL','WIP2','','','',''),
('M12_ASHSHELF','117','118','SIGNAL','WIP3','','','',''),
('M12_ASHSHELF','118','119','GRAB','0','0','','',''),
('M12_ASHSHELF','119','10','SHOW','0','0','','',''),
('M12_ASHSHELF','12','13','SIGNAL','WIP1','','','',''),
('M12_ASHSHELF','13','119','GRAB','0','0','','',''),
('M12_ASHSHELF','13','14','WAIT','0','0','','',''),
('M12_ASHSHELF','14','15','ADDI','WOBJECT','IDD_SPELL01-IDD_FISHASH1','','',''),
('M12_ASHSHELF','15','115','ADDI','WOBJECT','IDD_SPELx01-IDD_SPELL01','','',''),
('M12_ASHSHELF','15','115','NOTSTATE','M12_SPRING_PRESENT','WIP3','','',''),
('M12_CANDLE','0','1','DRAG','0','IDD_MATCH','','',''),
('M12_CANDLE','0','6','WAIT','0','0','','',''),
('M12_CANDLE','1','2','SHOW','0','IDD_VESTCAN','','',''),
('M12_CANDLE','2','5','NOTSTATE','M12_WATER_FULL','WIP1','','',''),
('M12_CANDLE','2','5','NOTSTATE','M12_SHELF_FULL','WIP2','','',''),
('M12_CANDLE','2','0','SIGNAL','WIP2','','','',''),
('M12_CANDLE','5','6','WAIT','0','0','','',''),
('M12_CANDLE','6','0','SHOW','0','0','','',''),
('M12_ING_FSH','0','1','WAIT','0','SIG_SHOW','','',''),
('M12_ING_FSH','1','0','REF_MACHINE','WIP1','0','MOV(BFRAME,R_WPARM);MAPi(BFRAME,S12_ING_D);SUBI(BFRAME,1);SHOW(WIP3);','',''),
('M12_ING_NATA','0','1','WAIT','0','SIG_SHOW','','',''),
('M12_ING_NATA','1','0','REF_MACHINE','WIP1','0','CLEAR(BFRAME);MOV(WPARM,R_WPARM);MOV(BFRAME,WPARM);MAPi(BFRAME,S12_ING_A);SHOW(WIP4);','',''),
('M12_ING_NATB','0','1','WAIT','0','SIG_SHOW','','',''),
('M12_ING_NATB','1','0','REF_MACHINE','WIP1','0','CLEAR(BFRAME);MOV(WPARM,R_WPARM);MOV(BFRAME,WPARM);MAPi(BFRAME,S12_ING_B);SHOW(WIP4);','',''),
('M12_ING_NATC','0','1','WAIT','0','SIG_SHOW','','',''),
('M12_ING_NATC','1','0','REF_MACHINE','WIP1','0','CLEAR(BFRAME);MOV(WPARM,R_WPARM);MOV(BFRAME,WPARM);MAPi(BFRAME,S12_ING_C);SHOW(WIP4);','',''),
('M12_ING_NY','0','1','WAIT','0','SIG_SHOW','','',''),
('M12_ING_NY','1','0','REF_MACHINE','WIP1','0','MOV(BFRAME,R_WPARM);MAPi(BFRAME,S12_ING_NY);SHOW(WIP3);','',''),
('M12_ING_STD','0','1','WAIT','0','SIG_SHOW','','',''),
('M12_ING_STD','1','0','REF_MACHINE','WIP1','0','MOV(WPARM,R_WPARM);MOV(BFRAME,WPARM);MAP(BFRAME,WIP2);SHOW(WIP3);','',''),
('M12_SPRING','0','1','DROP','0','IDD_SPRINGS','','',''),
('M12_SPRING','1','2','ASHOW','WOBJECT','','','',''),
('M12_SPRING','1','2','ASHOW','WOBJECT','','','',''),
('M12_SPRING','1','2','ASHOW','WOBJECT','','','',''),
('M12_SPRING','1','2','ASHOW','WOBJECT','','','',''),
('M12_SPRING','2','3','GRAB','0','0','','',''),
('M12_SPRING','2','3','GRAB','0','0','','',''),
('M12_SPRING','2','3','GRAB','0','0','','',''),
('M12_SPRING','2','3','GRAB','0','0','','',''),
('M12_SPRING','2','3','WAIT','0','0','','',''),
('M12_SPRING','2','3','WAIT','0','0','','',''),
('M12_SPRING','2','3','WAIT','0','0','','',''),
('M12_SPRING','2','3','WAIT','0','0','','',''),
('M12_SPRING','3','4','CLEAR','WOBJECT','','','',''),
('M12_SPRING','3','4','CLEAR','WOBJECT','','','',''),
('M12_SPRING','3','4','CLEAR','WOBJECT','','','',''),
('M12_SPRING','3','4','CLEAR','WOBJECT','','','',''),
('M12_SPRING','4','0','SHOW','0','0','','',''),
('M12_SPRING','4','0','SHOW','0','0','','',''),
('M12_SPRING','4','0','SHOW','0','0','','',''),
('M12_SPRING','4','0','SHOW','0','0','','',''),
('M12_WATER','0','1','DROP','0','IDD_BUCKF','','',''),
('M12_WATER','1','2','HANDOFF','0','IDD_BUCKE','','',''),
('M12_WATER','2','3','SHOW','0','IDS_VESTH2O','','',''),
('M12_WATER','3','4','SIGNAL','WIP1','','','',''),
('M12_WATER','4','5','WAIT','0','0','','',''),
('M12_WATER','5','0','SHOW','0','0','','',''),
('M12_xCANDLE','0','0','CLICK','0','0','SIGNAL(WIP1,SIG_HIDE);','',''),
('M12_xCANDLE','0','0','DRAG','0','IDD_MATCH','

// magic candle can't light without enough nystrom!
if (BPARM == BFRAME) {
    // check to see if the spell is ready
    SIGNAL(WIP3, SIG_CHECK);
    REF_MACHINE(WIP3);
    if ((R_WPARM > 0) && (R_WPARM == R_BPARM)) {
                SIGNAL(WIP1, SIG_SHOW); // WIP1 is the candle light
                BPARM = 0; // --BPARM GOES TO ZERO AS THE NYSTROM CATCHES FIRE
        }
    }
','',''),
('M12_xCANDLE','0','0','DRAG','0','IDD_SCOOPF','
/*   BFRAME is how much for the spell
     BPARM is how much stored in the candle
*/
if (BPARM < BFRAME) {    // BPARM is how much stored in the candle
    ADDI(BPARM,1);
    PLAYWAVE(SOUND_SLURP);
    SIGNAL(WIP2, SIG_SHOW); // WIP2 is the nystrom meter (M12_xNYSTROMADDED)
    HANDOFF(0,IDD_SCOOPE);
}','',''),
('M12_xCANDLE','0','0','WAIT','','SIG_EMPTY','
ASSIGN(BPARM,0);SIGNAL(WIP2,SIG_HIDE);','',''),
('M12_xCANDLELIGHT','0','0','WAIT','','SIG_SHOW','
MOV(WSPRITE,WIP1);
ASHOW(WIP1);
PLAYWAVE(SOUND_FIRE);
SIGNAL(WIP4, SIG_SHOW); // play magic and light wick
SIGNAL(WIP2, SIG_SHOW);','',''),
('M12_xCANDLELIGHT','0','0','WAIT','','SIG_HIDE','
CLEAR(WSPRITE);
ASHOW(0);
SIGNAL(WIP3,SIG_EMPTY);','',''),
('M12_xING_MGR','0','0','WAIT','0','SIG_SHOW','
        SIGNAL(WIP1,SIG_SHOW);
        SIGNAL(WIP2,SIG_SHOW);   
        SIGNAL(WIP3,SIG_SHOW);
        SIGNAL(WIP4,SIG_SHOW);
','',''),
('M12_xING_MGR','0','0','WAIT','0','SIG_HIDE','
        SIGNAL(WIP1,SIG_HIDE);
        SIGNAL(WIP2,SIG_HIDE);   
        SIGNAL(WIP3,SIG_HIDE);
        SIGNAL(WIP4,SIG_HIDE);
','',''),
('M12_xING_MGR','0','0','WAIT','','SIG_CLOSE','
        SIGNAL(WIP1,SIG_CLOSE);
        SIGNAL(WIP2,SIG_CLOSE);   
        SIGNAL(WIP3,SIG_CLOSE);
        SIGNAL(WIP4,SIG_CLOSE);
        ASSIGN(BPARM,0);
        ASSIGN(WPARM,0);
','',''),
('M12_xING_MGR','0','0','WAIT','0','SIG_CHECK','BPARM=0;
// check all the machines for ready or idle ...
if (  (IFSTATE('ready', WIP1) || IFSTATE('0', WIP1))
   && (IFSTATE('ready', WIP2) || IFSTATE('0', WIP2))
   && (IFSTATE('ready', WIP3) || IFSTATE('0', WIP3))
   && (IFSTATE('ready', WIP4) || IFSTATE('0', WIP4))) {
        WRITE('winner winner chicken dinner');
        BPARM=1;
        WPARM=1;
}','',''),
('M12_xMAGIC','0','10','WAIT','','SIG_SHOW','','',''),
('M12_xMAGIC','10','11','VIDEO','','IDS_SPEFFECT','','',''),
('M12_xMAGIC','11','0','Z_EPSILON','','','','',''),
('M12_xNYSTROMADDED','0','0','WAIT','','SIG_HIDE','SHOW();','',''),
('M12_xNYSTROMADDED','0','0','WAIT','','SIG_SHOW','SHOW(IDS_CANGRN1);','',''),
('M12_xPLANT','0','show_hint','WAIT','','SIG_SHOW','','',''),
('M12_xPLANT','hold_if_invalid','show_hint','GRAB','','','','',''),
('M12_xPLANT','hold_if_invalid','ready','IS_A','WOBJECT','WACCEPT','','',''),
('M12_xPLANT','hold_if_invalid','no_scroll','WAIT','','SIG_HIDE','','',''),
('M12_xPLANT','no_scroll','0','GRAB','0','0','WOBJECT=0;
SHOW();','',''),
('M12_xPLANT','no_scroll','hold_if_invalid','WAIT','0','SIG_SHOW','','',''),
('M12_xPLANT','ready','show_hint','GRAB','0','0','WOBJECT=0;','',''),
('M12_xPLANT','ready','no_scroll','WAIT','0','SIG_HIDE','','',''),
('M12_xPLANT','ready','0','WAIT','','SIG_CLOSE','
WOBJECT=0;
ASHOW();','','consume the object'),
('M12_xPLANT','show_hint','ready','DROP','0','0','SHOW(WOBJECT);','',''),
('M12_xPLANT','show_hint','0','WAIT','','SIG_HIDE','','',''),
('M12_xPLANT','show_hint','0','Z_EPSILON','','','','(WACCEPT==0)',''),
('M12_xSCROLL','0','vacant','REF_MACHINE','WIP2','0','C_ACCEPT(0,IDC_SCROLL);','',''),
('M12_xSCROLL','occupied','vacant','GRAB','0','','SHOW();
// remove the place holders and snuff the candle, drain nystrom
SIGNAL(WIP2,SIG_HIDE);
SIGNAL(WIP3,SIG_HIDE);
SIGNAL(WIP4,SIG_HIDE);','',''),
('M12_xSCROLL','vacant','occupied','DROP','0','0','SHOW(0,IDS_SCRHUNG);
SIGNAL(WIP2,SIG_SHOW);','',''),
('M12_xSPELLPORTAL','0','ready','WAIT','','SIG_SHOW','
SIGNAL(WIP1, SIG_CLOSE);
REF_MACHINE(WIP2);
WOBJECT=R_WOBJECT;
MAPi(WOBJECT,S12_SCROLL);
MAPi(WOBJECT,S12_SCROLLL_MK);
ASHOW(WOBJECT);
','',''),
('M12_xSPELLPORTAL','ready','0','GRAB','','','WOBJECT=0;
SHOW();
SIGNAL(WIP3,SIG_HIDE);
SIGNAL(WIP4,SIG_HIDE);
SIGNAL(WIP1,SIG_SHOW);','',''),
('M16_BLOBDROP','0','2','O_ACCEPT','0','IDD_BLOBBALL','','',''),
('M16_BLOBDROP','2','3','DROP','0','0','
    PLAYWAVE(SOUND_SUCK);
','',''),
('M16_BLOBDROP','2','0','GRAB','WOBJECT','','SHOW();','',''),
('M16_BLOBDROP','2','5','WAIT','','SIG_RESET','SHOW();','',''),
('M16_BLOBDROP','3','4','MOV','WSPRITE','WIP1','','',''),
('M16_BLOBDROP','4','0','SHOW','WSPRITE','','','',''),
('M16_BLOBDROP','5','0','Z_EPSILON','','','','',''),
('M16_BLOBHOLDER','0','ballpresent','ACCEPT','','IDD_BLOBBALL','
    MOV(WOBJECT,IDD_BLOBBALL);
    SHOW(WOBJECT);
','',''),
('M16_BLOBHOLDER','ballempty','0','DROP','','','','',''),
('M16_BLOBHOLDER','ballempty','resetting','WAIT','','SIG_RESET','','',''),
('M16_BLOBHOLDER','ballpresent','ballempty','GRAB','','IDD_BLOBBALL','SHOW();','',''),
('M16_BLOBHOLDER','resetting','0','Z_EPSILON','','','','',''),
('M16_BLOBHOLDER_E','0','ballempty','ACCEPT','','IDD_BLOBBALL','','',''),
('M16_BLOBHOLDER_E','ballempty','ballholding','DROP','','','
    MOV(WOBJECT,IDD_BLOBBALL);
    SHOW(WOBJECT); 
','',''),
('M16_BLOBHOLDER_E','ballempty','resetting','WAIT','','SIG_RESET','','',''),
('M16_BLOBHOLDER_E','ballholding','ballempty','GRAB','','IDD_BLOBBALL','SHOW();','',''),
('M16_BLOBHOLDER_E','resetting','0','Z_EPSILON','','','','',''),
('M16_BLOBHOLE','0','2','O_ACCEPT','0','IDD_BLOBBALL','','',''),
('M16_BLOBHOLE','2','0','DROP','0','0','SHOW();PLAYWAVE(SOUND_QSUCK);','',''),
('M16_BLOBRESET','0','0','CLICK','0','','
   SIGNAL(S16_BLOBHOLD1,SIG_RESET);
   SIGNAL(S16_BLOBHOLD2,SIG_RESET);
   SIGNAL(S16_BLOBHOLD3,SIG_RESET);
   SIGNAL(S16_BLOBHOLD4,SIG_RESET);
   SIGNAL(S16_BLOBHOLD5,SIG_RESET);
   SIGNAL(S16_BLOBHOLD6,SIG_RESET);
   SIGNAL(S16_BLOBHOLD7,SIG_RESET);
   SIGNAL(S16_BLOBHOLD8,SIG_RESET);
   SIGNAL(S16_BLOBHOLD9,SIG_RESET);
   SIGNAL(S16_BLOBHOLD10,SIG_RESET);
   SIGNAL(S16_BLOBHOLD11,SIG_RESET);
   SIGNAL(S16_BLOBHOLD12,SIG_RESET);
   SIGNAL(S16_BLOBHOLD13,SIG_RESET);
   SIGNAL(S16_BLOBHOLD14,SIG_RESET);
   SIGNAL(S16_BLOBHOLD15,SIG_RESET);
   SIGNAL(S16_BLOBHOLD16,SIG_RESET);
   SIGNAL(S16_BLOBFILL1,SIG_RESET);
   SIGNAL(S16_BLOBFILL2,SIG_RESET);
   SIGNAL(S16_BLOBFILL3,SIG_RESET);
   SIGNAL(S16_BLOBFILL4,SIG_RESET);
   SIGNAL(S16_BLOBFILL5,SIG_RESET); ','',''),
('M16_COMBINER','0','ready','O_ACCEPT','0','IDD_DICE','
    SHOW();
    ASSIGN(WPARM,0);
    REF_MACHINE(WIP3);
','',''),
('M16_COMBINER','holding','0','GRAB','','','SHOW();SIGNAL(WIP3,SIG_CLOSE);','',''),
('M16_COMBINER','holding','0','WAIT','0','SIG_CLOSE','','',''),
('M16_COMBINER','ready','holding','DROP','0','0','
        if(R_WPARM == 1){
            ASSIGN(WPARM,2);
            ASSIGN(WOBJECT,WIP2);
            SHOW(WOBJECT);
        }
        if(R_WPARM == 0){
            ASSIGN(WPARM,1);
            ASSIGN(WOBJECT,WIP1);
            SHOW(WOBJECT);
         
        }    
','',''),
('M16_DICEDROP','0','2','O_ACCEPT','0','IDD_SHAKE','','',''),
('M16_DICEDROP','2','0','DRAG','0','0','PLAYWAVE(SOUND_DICESHAKE);','',''),
('M16_DICEDROP','2','3','DROP','0','0','SIGNAL(WIP1,SIG_SHOW);','',''),
('M16_DICEDROP','3','0','ESTIME','','1','SIGNAL(WIP2,SIG_SHOW);','',''),
('M16_DICEROLL','0','2','WAIT','0','SIG_SHOW','PLAYWAVE(SOUND_DICEROLL);','',''),
('M16_DICEROLL','2','4','MOV','WSPRITE','WIP1','','',''),
('M16_DICEROLL','4','5','ASHOW','WSPRITE','V_LOOP','','',''),
('M16_DICEROLL','5','6','ESTIME','','2','','',''),
('M16_DICEROLL','6','7','RAND','6','1','','',''),
('M16_DICEROLL','7','8','MOV','BFRAME','WRAND','
    MAPi(BFRAME,S16_DICE_MAP);
    SHOW(BFRAME);
','',''),
('M16_DICEROLL','8','0','GRAB','','IDD_SHAKE',' 
    SIGNAL(WIP2,SIG_HIDE); 
    CLEAR(WOBJECT);
    SHOW();
','',''),
('M16_DICEROLL','8','9','WAIT','0','SIG_HIDE','','',''),
('M16_DICEROLL','9','0','CLEAR','','WOBJECT','SHOW(); 
','',''),
('M16_DICESTAKE','0','1','DROP','0','','SHOW(WOBJECT);','',''),
('M16_DICESTAKE','1','0','GRAB','WOBJECT','','SHOW();','',''),
('M16_DIEROLL','0','2','O_ACCEPT','0','IDD_DICE','','',''),
('M16_DIEROLL','2','3','DROP','0','0','','',''),
('M16_DIEROLL','3','4','MOV','WSPRITE','WIP1','','',''),
('M16_DIEROLL','4','5','ASHOW','WSPRITE','V_LOOP','PLAYWAVE(SOUND_ONEDIEROLL);','',''),
('M16_DIEROLL','5','6','ESTIME','','2','','',''),
('M16_DIEROLL','6','7','RAND','6','1','','',''),
('M16_DIEROLL','7','8','MOV','BFRAME','WRAND','
    MAPi(BFRAME,S16_DICE_MAP);
    SHOW(BFRAME);
','',''),
('M16_DIEROLL','8','0','GRAB','','','CLEAR(WOBJECT);SHOW();','',''),
('M16_PAYBUCKET','0','accept_pay','WAIT','0','SIG_ON','
    ASSIGN(WSPRITE,WIP1);
    ASHOW(WSPRITE);
    /* BPARM = what you payed
    WPARM = Total owed 
    */
    ASSIGN(BPARM,0); 
    ASSIGN(WPARM,WIP2);
','',''),
('M16_PAYBUCKET','accept_pay','check_scoop','DRAG','IDD_SCOOPF','','
    HANDOFF(0,IDD_SCOOPE);
    PLAYWAVE(0,SOUND_SPIT);
    ADDI(BPARM,1); 
','',''),
('M16_PAYBUCKET','accept_pay','0','WAIT','0','SIG_OFF','
    CLEAR(WSPRITE);
    SHOW();
    ','',''),
('M16_PAYBUCKET','check_scoop','paid_in_full','EQUAL','BPARM','WPARM','','',''),
('M16_PAYBUCKET','check_scoop','accept_pay','Z_EPSILON','','','','',''),
('M16_PAYBUCKET','paid_in_full','0','Z_EPSILON','','','
    PLAYWAVE(0,SOUND_LEVER);
    ASHOW();
','',''),
('M16_PAYGRAB','0','open_bin','WAIT','0','SIG_OPEN','REF_MACHINE(WIP2);','',''),
('M16_PAYGRAB','open_bin','0','GRAB','WIP1','','
    if(R_WPARM != R_BPARM){
        ADDI(LKARMA,1);
        SIGNAL(SID_HALO,SIG_ADD);
        PLAYWAVE(0,SOUND_CLUNK);
    }
    SIGNAL(WIP3,SIG_OFF);
    SIGNAL(WIP2,SIG_OFF);
','',''),
('M16_PAYGRAB','open_bin','0','WAIT','0','SIG_CLOSE','','',''),
('M16_PAYSTAMP','0','startframe','ASSIGN','BFRAME','1','CLEAR(WSPRITE);','',''),
('M16_PAYSTAMP','readyToPay','waiting','CLICK','','','SHOW(WSPRITE);ANIMATE(0,V_REVERSE);SIGNAL(WIP2,SIG_OFF);SIGNAL(WIP3,SIG_CLOSE);PLAYWAVE(0,SOUND_CHAIN);','',''),
('M16_PAYSTAMP','readyToPay','0','WAIT','0','SIG_OFF','','',''),
('M16_PAYSTAMP','startframe','waiting','SHOW','WIP1','','','',''),
('M16_PAYSTAMP','waiting','readyToPay','CLICK','','','SHOW(WSPRITE); ANIMATE(); SIGNAL(WIP2,SIG_ON);SIGNAL(WIP3,SIG_OPEN);PLAYWAVE(0,SOUND_CHAIN);','',''),
('M16_POTTERY','0','1','MOV','WSPRITE','WIP1','SHOW(WSPRITE);','',''),
('M16_POTTERYCHECK','0','validate','WAIT','0','SIG_CHECK','
    ASSIGN(WPARM,0);
    REF_MACHINE(S16_POTTERYDROP1);
    ADD(WPARM,R_WPARM);
    REF_MACHINE(S16_POTTERYDROP2);
    ADD(WPARM,R_WPARM);
    REF_MACHINE(S16_POTTERYDROP3);
    ADD(WPARM,R_WPARM);
    REF_MACHINE(S16_POTTERYDROP4);
    ADD(WPARM,R_WPARM);
    REF_MACHINE(S16_POTTERYDROP5);
    ADD(WPARM,R_WPARM);
    REF_MACHINE(S16_POTTERYDROP6);
    ADD(WPARM,R_WPARM);
    //Check to see if we have the 6 required talismen
    ','',''),
('M16_POTTERYCHECK','success','0','Z_EPSILON','','','
        PLAYWAVE(SOUND_CHIMES);
        SIGNAL(S16_POTTERYDROP1,SIG_RESET);
        SIGNAL(S16_POTTERYDROP2,SIG_RESET);
        SIGNAL(S16_POTTERYDROP3,SIG_RESET);
        SIGNAL(S16_POTTERYDROP4,SIG_RESET);
        SIGNAL(S16_POTTERYDROP5,SIG_RESET);
        SIGNAL(S16_POTTERYDROP6,SIG_RESET);    
','',''),
('M16_POTTERYCHECK','validate','success','EQUAL','WPARM','6','','',''),
('M16_POTTERYCHECK','validate','0','Z_EPSILON','','','','',''),
('M16_POTTERYDROP','0','waitForDrop','ACCEPT','WIP2','','','',''),
('M16_POTTERYDROP','containTalisman','showSparkle','Z_EPSILON','','','
    SIGNAL(WIP3,SIG_CHECK); 
','',''),
('M16_POTTERYDROP','showSparkle','waitForReset','ASHOW','0','IDS_SPARKLE','','',''),
('M16_POTTERYDROP','waitForDrop','containTalisman','DROP','0','0','
    ASSIGN(WPARM,1);
    PLAYWAVE(SOUND_CLINK);
    ','',''),
('M16_POTTERYDROP','waitForReset','waitForDrop','WAIT','0','SIG_RESET','ASHOW();ASSIGN(WPARM,0);','',''),
('M17_DOORWAY','0','caveNoLockEntry','CLICK','0','0','','',''),
('M17_DOORWAY','0','Lock','WAIT','0','SIG_CLOSE','','',''),
('M17_DOORWAY','Lock','forcefieldUp','SIGNAL','WIP2','SIG_ON','','',''),
('M17_DOORWAY','LockBombed','0','SIGNAL','WIP2','SIG_OFF','','',''),
('M17_DOORWAY','caveNoLockEntry','0','LOADVIEW','WIP1','','
    WRITE("No Lock entry - SIGNAL THE FOUL WIND");
    SIGNAL(WIP3,SIG_START);
','',''),
('M17_DOORWAY','forcefieldUp','LockBombed','WAIT','0','SIG_OPEN','','',''),
('M17_DOORWAY','forcefieldUp','keyUsed','WAIT','0','SIG_ENTER_1','','',''),
('M17_DOORWAY','keyUsed','tempOpen','SIGNAL','WIP2','SIG_OFF','','',''),
('M17_DOORWAY','letInOne','Lock','LOADVIEW','WIP1','','
   WRITE("unlocked SIGNAL THE FOUL WIND");
   SIGNAL(WIP3,SIG_START);
','',''),
('M17_DOORWAY','tempOpen','letInOne','CLICK','0','0','','',''),
('M17_DOORWAY','tempOpen','Lock','WAIT','0','SIG_CLOSE','','',''),
('M17_FFIELD','0','1','WAIT','0','SIG_ON','','',''),
('M17_FFIELD','1','2','SIGNAL','WIP1','SIG_ON','','',''),
('M17_FFIELD','2','3','SHOW','0','IDS_FORCEFLD','','',''),
('M17_FFIELD','3','4','ANIMATE','0','V_REWIND|V_LOOP','','',''),
('M17_FFIELD','4','5','WAIT','0','SIG_OFF','','',''),
('M17_FFIELD','5','6','SIGNAL','WIP1','SIG_OFF','','',''),
('M17_FFIELD','6','0','SHOW','0','0','','',''),
('M17_FOULWIND','0','loopTop','WAIT','0','SIG_START','','',''),
('M17_FOULWIND','bottomOfLoop','loopTop','EQUALi','LVIEW','WIP1','','',''),
('M17_FOULWIND','bottomOfLoop','loopTop','EQUALi','LVIEW','WIP2','','',''),
('M17_FOULWIND','bottomOfLoop','0','Z_EPSILON','','','','',''),
('M17_FOULWIND','loopTop','bottomOfLoop','ESTIME','0','5','
    //TODO need to look for protection spell nybreath and fan
    if (  (IFSTATE(0, WIP3) || IFSTATE(spellStopped, WIP3)) ){
        WRITE("fair game no protection");
        PLAYWAVE(SOUND_BURBLE);
        SIGNAL(SID_DEC_ENERGY,SIG_DEC); 
    }
','',''),
('M17_LOCKBURN','0','1','WAIT','0','SIG_BURN','','',''),
('M17_LOCKBURN','0','5','WAIT','0','SIG_HIDE','','',''),
('M17_LOCKBURN','1','2','SHOW','0','IDS_MINEBLOW','','',''),
('M17_LOCKBURN','2','3','PLAYWAVE','0','SOUND_EXPLODE','','',''),
('M17_LOCKBURN','3','0','VIDEO','0','IDS_EXPLODE1','','',''),
('M17_LOCKBURN','5','0','Z_EPSILON','','','
    SHOW();
','',''),
('M17_LOCKSOCKET','0','citlockdropped','DROP','0','IDD_CITLOCK','','',''),
('M17_LOCKSOCKET','0','villockdropped','DROP','0','IDD_VILLOCK','','',''),
('M17_LOCKSOCKET','0','bombed','DROP','0','IDD_BOMB1','','',''),
('M17_LOCKSOCKET','0','bombed','DROP','0','IDD_BOMB2','','',''),
('M17_LOCKSOCKET','bombed','lockremoved','SIGNAL','WIP1','SIG_OPEN','
    SIGNAL(WIP2,SIG_BURN);
    SIGNAL(WIP3,SIG_HIDE);
    SIGNAL(WIP4,SIG_HIDE);
','',''),
('M17_LOCKSOCKET','citclicklocked','citlockshown','SIGNAL','WIP1','SIG_CLOSE','','',''),
('M17_LOCKSOCKET','citlockdropped','citlockshown','SIGNAL','WIP1','SIG_CLOSE','
    SIGNAL(WIP2,SIG_HIDE);
    SIGNAL(WIP3,SIG_SHOW);
    SIGNAL(WIP4,SIG_SHOW);
    ASHOW(WOBJECT);
    ADDI(LKARMA,1);
    SIGNAL(SID_HALO,SIG_ADD);
','',''),
('M17_LOCKSOCKET','citlockshown','citclicklocked','CLICK','0','0','','',''),
('M17_LOCKSOCKET','citlockshown','citunlocked','DRAG','0','IDD_CITKEY','','',''),
('M17_LOCKSOCKET','citlockshown','bombed','DROP','0','IDD_BOMB1','','',''),
('M17_LOCKSOCKET','citlockshown','bombed','DROP','0','IDD_BOMB2','','',''),
('M17_LOCKSOCKET','citunlocked','citlockshown','SIGNAL','WIP1','SIG_ENTER_1','','',''),
('M17_LOCKSOCKET','lockremoved','0','SHOW','0','0','','',''),
('M17_LOCKSOCKET','vilclicklocked','villockshown','SIGNAL','WIP1','SIG_CLOSE','','',''),
('M17_LOCKSOCKET','villockdropped','villockshown','SIGNAL','WIP1','SIG_CLOSE','
    SIGNAL(WIP2,SIG_HIDE);
    SIGNAL(WIP3,SIG_SHOW);
    SIGNAL(WIP4,SIG_SHOW);
    ASHOW(WOBJECT);
    ADDI(LKARMA,1);
    SIGNAL(SID_HALO,SIG_ADD);
','',''),
('M17_LOCKSOCKET','villockshown','vilclicklocked','CLICK','0','0','','',''),
('M17_LOCKSOCKET','villockshown','vilunlocked','DRAG','0','IDD_VILKEY','','',''),
('M17_LOCKSOCKET','villockshown','bombed','DROP','0','IDD_BOMB1','','',''),
('M17_LOCKSOCKET','villockshown','bombed','DROP','0','IDD_BOMB2','','',''),
('M17_LOCKSOCKET','vilunlocked','villockshown','SIGNAL','WIP1','SIG_ENTER_1','','',''),
('M17_MINE','0','1','DRAG','0','IDD_SCOOPE','','',''),
('M17_MINE','0','3','DRAG','0','IDD_SCOOPF','','',''),
('M17_MINE','1','2','PLAYWAVE','0','SOUND_SLURP','','',''),
('M17_MINE','2','0','HANDOFF','0','IDD_SCOOPF','','',''),
('M17_MINE','3','4','PLAYWAVE','0','SOUND_SPIT','','',''),
('M17_MINE','4','0','HANDOFF','0','IDD_SCOOPE','','',''),
('M19_BUTTON','0','1','CLICK','0','','
    SIGNAL(WIP4, SIG_SPIN);
    SIGNAL(WIP3, SIG_SPIN);
     SIGNAL(WIP2, SIG_SPIN);
     SIGNAL(WIP1, SIG_SPIN);
','',''),
('M19_BUTTON','1','0','Z_EPSILON','','','','',''),
('M19_DICEHOLD','0','presentdie','WAIT','','SIG_RESET','
     MOV(WOBJECT,IDD_DICE);
     SHOW(WOBJECT);
','',''),
('M19_DICEHOLD','presentdie','0','GRAB','','IDD_DICE','
    SHOW();
','',''),
('M19_HOLDER','0','present','ACCEPT','','WIP2','
    MOV(WOBJECT,WIP2);
    SHOW(WOBJECT);
','',''),
('M19_HOLDER','empty','0','DROP','','','','',''),
('M19_HOLDER','empty','resetting','WAIT','','SIG_RESET','','',''),
('M19_HOLDER','present','empty','GRAB','','','SHOW();','',''),
('M19_HOLDER','resetting','0','Z_EPSILON','','','','',''),
('M19_PAYBUCKET','0','setup','MOV','BFRAME','0','
    ASSIGN(WSPRITE,WIP1);
    SHOW(WSPRITE);
    /* BPARM = what you payed
    WPARM = Total owed 
    */
    ASSIGN(BPARM,0); 
    ASSIGN(WPARM,WIP2);
','',''),
('M19_PAYBUCKET','accept_pay','check_scoop','DRAG','IDD_SCOOPF','','
    HANDOFF(0,IDD_SCOOPE);
    PLAYWAVE(0,SOUND_SPIT);
    ADDI(BPARM,1); 
','',''),
('M19_PAYBUCKET','check_scoop','paid_in_full','EQUAL','BPARM','WPARM','','',''),
('M19_PAYBUCKET','check_scoop','accept_pay','Z_EPSILON','','','','',''),
('M19_PAYBUCKET','paid_in_full','0','Z_EPSILON','','','
    PLAYWAVE(0,SOUND_LEVER);
    SIGNAL(sq_0_t,SIG_RESET);
    SIGNAL(sq_0_b,SIG_RESET);
     SIGNAL(S19_DICEHOLD,SIG_RESET);
    SUBI(BFRAME,1);
','',''),
('M19_PAYBUCKET','setup','accept_pay','CLICK','','','
    ADDI(BFRAME,1);
','',''),
('M19_PICK','0','setup','MOV','WSPRITE','WIP1','
    ASSIGN(WTEMP1,0);
','',''),
('M19_PICK','frameMapped','0','WAIT','0','SIG_SPIN','','',''),
('M19_PICK','randomGenned','frameMapped','MOV','WTEMP1','WRAND','
    MAPi(WTEMP1,WIP3);
    MOV(BFRAME,WTEMP1);
    SHOW(WSPRITE);
    MOV(WPARM,WTEMP1);
','',''),
('M19_PICK','setup','randomGenned','RAND','8','1','','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_1T','MOV(WPARM,1);REF_MACHINE(sq_1_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_1B','MOV(WPARM,1);REF_MACHINE(sq_1_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_2T','MOV(WPARM,2);REF_MACHINE(sq_2_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_2B','MOV(WPARM,2);REF_MACHINE(sq_2_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_3T','MOV(WPARM,3);REF_MACHINE(sq_3_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_3B','MOV(WPARM,3);REF_MACHINE(sq_3_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_4T','MOV(WPARM,4);REF_MACHINE(sq_4_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_4B','MOV(WPARM,4);REF_MACHINE(sq_4_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_5T','MOV(WPARM,5);REF_MACHINE(sq_5_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_5B','MOV(WPARM,5);REF_MACHINE(sq_5_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_6T','MOV(WPARM,6);REF_MACHINE(sq_6_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_6B','MOV(WPARM,6);REF_MACHINE(sq_6_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_7T','MOV(WPARM,7);REF_MACHINE(sq_7_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_7B','MOV(WPARM,7);REF_MACHINE(sq_7_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_8T','MOV(WPARM,8);REF_MACHINE(sq_8_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_8B','MOV(WPARM,8);REF_MACHINE(sq_8_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_9T','MOV(WPARM,9);REF_MACHINE(sq_9_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_9B','MOV(WPARM,9);REF_MACHINE(sq_9_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_10T','MOV(WPARM,10);REF_MACHINE(sq_10_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_10B','MOV(WPARM,10);REF_MACHINE(sq_10_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_11T','MOV(WPARM,11);REF_MACHINE(sq_11_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_11B','MOV(WPARM,11);REF_MACHINE(sq_11_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_12T','MOV(WPARM,12);REF_MACHINE(sq_12_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_12B','MOV(WPARM,12);REF_MACHINE(sq_12_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_13T','MOV(WPARM,13);REF_MACHINE(sq_13_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_13B','MOV(WPARM,13);REF_MACHINE(sq_13_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_14T','MOV(WPARM,14);REF_MACHINE(sq_14_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_14B','MOV(WPARM,14);REF_MACHINE(sq_14_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_15T','MOV(WPARM,15);REF_MACHINE(sq_15_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_15B','MOV(WPARM,15);REF_MACHINE(sq_15_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_16T','MOV(WPARM,16);REF_MACHINE(sq_16_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_16B','MOV(WPARM,16);REF_MACHINE(sq_16_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_17T','MOV(WPARM,17);REF_MACHINE(sq_17_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_17B','MOV(WPARM,17);REF_MACHINE(sq_17_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_18T','MOV(WPARM,18);REF_MACHINE(sq_18_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_18B','MOV(WPARM,18);REF_MACHINE(sq_18_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_19T','MOV(WPARM,19);REF_MACHINE(sq_19_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_19B','MOV(WPARM,19);REF_MACHINE(sq_19_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_20T','MOV(WPARM,20);REF_MACHINE(sq_20_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_20B','MOV(WPARM,20);REF_MACHINE(sq_20_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_21T','MOV(WPARM,21);REF_MACHINE(sq_21_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_21B','MOV(WPARM,21);REF_MACHINE(sq_21_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_22T','MOV(WPARM,22);REF_MACHINE(sq_22_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_22B','MOV(WPARM,22);REF_MACHINE(sq_22_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_23T','MOV(WPARM,23);REF_MACHINE(sq_23_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_23B','MOV(WPARM,23);REF_MACHINE(sq_23_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_24T','MOV(WPARM,24);REF_MACHINE(sq_24_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_24B','MOV(WPARM,24);REF_MACHINE(sq_24_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_25T','MOV(WPARM,25);REF_MACHINE(sq_25_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_25B','MOV(WPARM,25);REF_MACHINE(sq_25_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_26T','MOV(WPARM,26);REF_MACHINE(sq_26_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_26B','MOV(WPARM,26);REF_MACHINE(sq_26_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_27T','MOV(WPARM,27);REF_MACHINE(sq_27_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_27B','MOV(WPARM,27);REF_MACHINE(sq_27_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_28T','MOV(WPARM,28);REF_MACHINE(sq_28_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_28B','MOV(WPARM,28);REF_MACHINE(sq_28_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_29T','MOV(WPARM,29);REF_MACHINE(sq_29_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_29B','MOV(WPARM,29);REF_MACHINE(sq_29_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_30T','MOV(WPARM,30);REF_MACHINE(sq_30_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_30B','MOV(WPARM,30);REF_MACHINE(sq_30_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_31T','MOV(WPARM,31);REF_MACHINE(sq_31_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_31B','MOV(WPARM,31);REF_MACHINE(sq_31_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_32T','MOV(WPARM,32);REF_MACHINE(sq_32_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_32B','MOV(WPARM,32);REF_MACHINE(sq_32_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_33T','MOV(WPARM,33);REF_MACHINE(sq_33_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_33B','MOV(WPARM,33);REF_MACHINE(sq_33_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_34T','MOV(WPARM,34);REF_MACHINE(sq_34_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_34B','MOV(WPARM,34);REF_MACHINE(sq_34_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_35T','MOV(WPARM,35);REF_MACHINE(sq_35_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_35B','MOV(WPARM,35);REF_MACHINE(sq_35_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_36T','MOV(WPARM,36);REF_MACHINE(sq_36_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_36B','MOV(WPARM,36);REF_MACHINE(sq_36_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_37T','MOV(WPARM,37);REF_MACHINE(sq_37_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_37B','MOV(WPARM,37);REF_MACHINE(sq_37_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_38T','MOV(WPARM,38);REF_MACHINE(sq_38_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_38B','MOV(WPARM,38);REF_MACHINE(sq_38_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_39T','MOV(WPARM,39);REF_MACHINE(sq_39_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_39B','MOV(WPARM,39);REF_MACHINE(sq_39_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_40T','MOV(WPARM,40);REF_MACHINE(sq_40_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_40B','MOV(WPARM,40);REF_MACHINE(sq_40_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_41T','MOV(WPARM,41);REF_MACHINE(sq_41_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_41B','MOV(WPARM,41);REF_MACHINE(sq_41_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_42T','MOV(WPARM,42);REF_MACHINE(sq_42_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_42B','MOV(WPARM,42);REF_MACHINE(sq_42_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_43T','MOV(WPARM,43);REF_MACHINE(sq_43_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_43B','MOV(WPARM,43);REF_MACHINE(sq_43_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_44T','MOV(WPARM,44);REF_MACHINE(sq_44_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_44B','MOV(WPARM,44);REF_MACHINE(sq_44_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_45T','MOV(WPARM,45);REF_MACHINE(sq_45_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_45B','MOV(WPARM,45);REF_MACHINE(sq_45_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_46T','MOV(WPARM,46);REF_MACHINE(sq_46_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_46B','MOV(WPARM,46);REF_MACHINE(sq_46_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_47T','MOV(WPARM,47);REF_MACHINE(sq_47_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_47B','MOV(WPARM,47);REF_MACHINE(sq_47_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_48T','MOV(WPARM,48);REF_MACHINE(sq_48_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_48B','MOV(WPARM,48);REF_MACHINE(sq_48_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_49T','MOV(WPARM,49);REF_MACHINE(sq_49_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_49B','MOV(WPARM,49);REF_MACHINE(sq_49_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_50T','MOV(WPARM,50);REF_MACHINE(sq_50_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_50B','MOV(WPARM,50);REF_MACHINE(sq_50_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_51T','MOV(WPARM,51);REF_MACHINE(sq_51_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_51B','MOV(WPARM,51);REF_MACHINE(sq_51_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_52T','MOV(WPARM,52);REF_MACHINE(sq_52_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_52B','MOV(WPARM,52);REF_MACHINE(sq_52_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_53T','MOV(WPARM,53);REF_MACHINE(sq_53_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_53B','MOV(WPARM,53);REF_MACHINE(sq_53_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_54T','MOV(WPARM,54);REF_MACHINE(sq_54_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_54B','MOV(WPARM,54);REF_MACHINE(sq_54_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_55T','MOV(WPARM,55);REF_MACHINE(sq_55_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_55B','MOV(WPARM,55);REF_MACHINE(sq_55_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_56T','MOV(WPARM,56);REF_MACHINE(sq_56_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_56B','MOV(WPARM,56);REF_MACHINE(sq_56_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_57T','MOV(WPARM,57);REF_MACHINE(sq_57_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_57B','MOV(WPARM,57);REF_MACHINE(sq_57_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_58T','MOV(WPARM,58);REF_MACHINE(sq_58_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_58B','MOV(WPARM,58);REF_MACHINE(sq_58_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_59T','MOV(WPARM,59);REF_MACHINE(sq_59_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_59B','MOV(WPARM,59);REF_MACHINE(sq_59_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_60T','MOV(WPARM,60);REF_MACHINE(sq_60_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_60B','MOV(WPARM,60);REF_MACHINE(sq_60_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_61T','MOV(WPARM,61);REF_MACHINE(sq_61_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_61B','MOV(WPARM,61);REF_MACHINE(sq_61_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_62T','MOV(WPARM,62);REF_MACHINE(sq_62_t);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','0','1','WAIT','0','SIG_62B','MOV(WPARM,62);REF_MACHINE(sq_62_b);MOV(BPARM,R_BPARM);','',''),
('M19_PLAYERWATCHER','1','0','PLAYWAVE','0','SOUND_CLICK','','',''),
('M19_SPELLCASTER','0','collectingColor','WAIT','0','SIG_START','','',''),
('M19_SPELLCASTER','castspell','pickspell','EQUAL','WTEMP1','WPARM','','',''),
('M19_SPELLCASTER','castspell','0','Z_EPSILON','0','','','',''),
('M19_SPELLCASTER','collectingColor','collectingEvent','REF_MACHINE','WIP1','','
    //Top spinner frame
    WTEMP1=R_WPARM;
    MOV(WPARM,WTEMP1);
    //color to attack violet,green, or brown square
    MAPi(WPARM,WIP3);
','',''),
('M19_SPELLCASTER','collectingEvent','findVictimOne','REF_MACHINE','WIP2','','
    //Bottom spinner frame
    WTEMP2=R_WPARM;
    MOV(BPARM,WTEMP2);
    //event or spell to cast
    MAPi(BPARM,WIP4);
','',''),
('M19_SPELLCASTER','done','0','Z_EPSILON','','','','',''),
('M19_SPELLCASTER','findVictimOne','castspell','REF_MACHINE','0','S19_PLAYERWATCHER','
    //R_WPARM is the squre theyre on,
    //R_BPARM is either player object like IDD_PLAYER_B or W
    //map the square theyre on to a color , then if it matches WPARM execute the event in BPARM
    MOV(WTEMP1,R_WPARM);
    MAPi(WTEMP1,S19_SQUARE_MAP);','',''),
('M19_SPELLCASTER','pickspell','done','EQUAL','BPARM','bomb1','
    WRITE(someone is bomb1ed!);
    SIGNAL(SID_ID,SIG_BOMB);
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M19_SPELLCASTER','pickspell','done','EQUAL','BPARM','bomb2','
    WRITE(someone is bomb2ed!);
    SIGNAL(SID_ID,SIG_BOMB);
    SUBI(LENERGY,2);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M19_SPELLCASTER','pickspell','done','EQUAL','BPARM','bomb3','
    WRITE(someone is bomb3ed!);
    SIGNAL(SID_ID,SIG_BOMB);
    SUBI(LENERGY,3);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M19_SPELLCASTER','pickspell','done','EQUAL','BPARM','wealth','
    WRITE(someone is given nystrom!);
    SIGNAL(SID_ID,SIG_HAPPY);
    ADDI(LWEALTH,10);
','',''),
('M19_SPELLCASTER','pickspell','done','EQUAL','BPARM','banish','
    WRITE(someone is banished!);
    LOADVIEW(0,IDV_BANISH);
','',''),
('M19_SPELLCASTER','pickspell','done','EQUAL','BPARM','gopa','
     WRITE(someone is given gopa!);
    ADDI(LENERGY,5);
    SIGNAL(SID_AURA,SIG_ADD);
','',''),
('M19_SPELLCASTER','pickspell','0','Z_EPSILON','','','','',''),
('M19_SPIN','0','1','WAIT','0','SIG_SPIN','PLAYWAVE(SOUND_SPIN);','',''),
('M19_SPIN','1','2','ASHOW','WIP1','V_LOOP','','',''),
('M19_SPIN','2','3','ESTIME','','4','','',''),
('M19_SPIN','3','reveal','CLEAR','WSPRITE','','','',''),
('M19_SPIN','reveal','0','SHOW','0','0','
    if(WIP1 == IDS_BOTSPIN){
        SIGNALi(SIG_START,S19_SPELLCASTER);
    }
','',''),
('M19_SQUARE','0','squareempty','C_ACCEPT','','ISA_PLAYTOKEN','ASSIGN(BPARM,0);CLEAR(WOBJECT);','',''),
('M19_SQUARE','resetting','0','Z_EPSILON','','','','',''),
('M19_SQUARE','squareempty','squareholding','DROP','','','
    SHOW(WOBJECT);
    MOV(BPARM,WOBJECT);
    SIGNALi(WIP2,S19_PLAYERWATCHER); 
','',''),
('M19_SQUARE','squareempty','resetting','WAIT','','SIG_RESET','','',''),
('M19_SQUARE','squareholding','squareempty','GRAB','','','SHOW();','',''),
('M24_BIGEYE','0','1','MOV','WSPRITE','WIP1','','',''),
('M24_BIGEYE','1','2','ASHOW','WSPRITE','V_LOOP','','',''),
('M24_BIGEYE','10','50','IFSTATEi','0','S24_EYEPLATE1','','',''),
('M24_BIGEYE','10','50','IFSTATEi','0','S24_EYEPLATE2','','',''),
('M24_BIGEYE','10','50','IFSTATEi','0','S24_EYEPLATE3','','',''),
('M24_BIGEYE','10','50','IFSTATEi','0','S24_EYESPELL1','','',''),
('M24_BIGEYE','10','50','IFSTATEi','0','S24_EYESPELL3','','',''),
('M24_BIGEYE','10','20','Z_EPSILON','','','','',''),
('M24_BIGEYE','2','5','ANIMATE','0','V_LOOP','','',''),
('M24_BIGEYE','20','30','ASHOW','0','IDS_BIGEYE1','','',''),
('M24_BIGEYE','30','30','GRAB','0','IDD_EYEWAND','SIGNALi(SIG_COMPLETE,REC_EYEOG);','',''),
('M24_BIGEYE','30','50','WAIT','0','SIG_BOMB','','',''),
('M24_BIGEYE','5','6','SIGNAL','WIP2','SIG_SHOW','','',''),
('M24_BIGEYE','50','51','SHOW','0','0','','',''),
('M24_BIGEYE','51','52','SIGNAL','WIP2','SIG_HIDE','','',''),
('M24_BIGEYE','52','0','SIGNAL','WIP3','SIG_HIDE','','',''),
('M24_BIGEYE','6','7','SIGNAL','WIP3','SIG_SHOW','','',''),
('M24_BIGEYE','7','0','CLICK','','','','',''),
('M24_BIGEYE','7','10','WAIT','0','0','','',''),
('M24_EYEPLATE','0','1','DROP','0','IDD_EYEFUSE','','',''),
('M24_EYEPLATE','1','2','SIGNALi','0','S24_BIGEYE','','',''),
('M24_EYEPLATE','2','3','C_ACCEPT','0','IDC_BOMB','','',''),
('M24_EYEPLATE','3','4','ASHOW','0','IDS_EYEPLATE','','',''),
('M24_EYEPLATE','4','5','SIGNAL','WIP1','SIG_SHOW','','',''),
('M24_EYEPLATE','5','6','SIGNAL','WIP2','SIG_SHOW','','',''),
('M24_EYEPLATE','50','51','VIDEO','0','IDS_EXPLODE1','','',''),
('M24_EYEPLATE','51','52','PLAYWAVE','0','SOUND_EXPLODE','','',''),
('M24_EYEPLATE','52','53','SHOW','0','0','','',''),
('M24_EYEPLATE','53','54','SIGNAL','WIP1','SIG_HIDE','','',''),
('M24_EYEPLATE','54','55','SIGNAL','WIP2','SIG_HIDE','','',''),
('M24_EYEPLATE','55','56','O_ACCEPT','0','IDD_EYEFUSE','','',''),
('M24_EYEPLATE','56','0','SIGNALi','SIG_BOMB','S24_BIGEYE','','',''),
('M24_EYEPLATE','6','50','DROP','0','0','','',''),
('M24_EYESPELL','0','1','DROP','0','IDD_EYESPELL','','',''),
('M24_EYESPELL','1','2','SIGNALi','0','S24_BIGEYE','','',''),
('M24_EYESPELL','2','3','C_ACCEPT','0','IDC_BOMB','','',''),
('M24_EYESPELL','3','4','ASHOW','0','IDS_EYESPELL','','',''),
('M24_EYESPELL','4','5','SIGNAL','WIP1','SIG_SHOW','','',''),
('M24_EYESPELL','5','6','SIGNAL','WIP2','SIG_SHOW','','',''),
('M24_EYESPELL','50','51','VIDEO','0','IDS_EXPLODE1','','',''),
('M24_EYESPELL','51','52','PLAYWAVE','0','SOUND_EXPLODE','','',''),
('M24_EYESPELL','52','53','SHOW','0','0','','',''),
('M24_EYESPELL','53','54','SIGNAL','WIP1','SIG_HIDE','','',''),
('M24_EYESPELL','54','55','SIGNAL','WIP2','SIG_HIDE','','',''),
('M24_EYESPELL','55','56','O_ACCEPT','0','IDD_EYESPELL','','',''),
('M24_EYESPELL','56','0','SIGNALi','SIG_BOMB','S24_BIGEYE','','',''),
('M24_EYESPELL','6','50','DROP','0','0','','',''),
('M24_EYETEXT','0','10','DRAG','0','IDD_EYEWAND','','',''),
('M24_EYETEXT','0','20','DRAGFOCUS','0','FALSE','','',''),
('M24_EYETEXT','0','20','WAIT','0','SIG_INIT','','',''),
('M24_EYETEXT','10','11','MOV','WSPRITE','WIP1','','',''),
('M24_EYETEXT','11','0','SHOW','WSPRITE','','','',''),
('M24_EYETEXT','20','0','SHOW','0','0','','',''),
('M25_EXITDOOR','0','1','CLICK','0','0','','',''),
('M25_EXITDOOR','1','0','LOADVIEW','WIP1','','','',''),
('M25_OPNDOOR','0','10','C_ACCEPT','0','IDC_BOMB','','',''),
('M25_OPNDOOR','10','40','DROP','0','0','','',''),
('M25_OPNDOOR','40','50','Z_EPSILON','','','','',''),
('M25_OPNDOOR','50','51','VIDEO','0','IDS_EXPLODE1','','',''),
('M25_OPNDOOR','51','52','PLAYWAVE','0','SOUND_EXPLODE','SIGNAL(WIP3,SIG_COMPLETE);','',''),
('M25_OPNDOOR','52','53','MOV','WSPRITE','WIP1','','',''),
('M25_OPNDOOR','53','70','SHOW','WSPRITE','','','',''),
('M25_OPNDOOR','70','71','CLICK','0','0','','',''),
('M25_OPNDOOR','71','70','LOADVIEW','WIP2','','','',''),
('M25_ROLL','0','1','WAIT','0','SIG_OPEN','','',''),
('M25_ROLL','1','2','SHOW','','IDS_ROLL','','',''),
('M25_ROLL','2','3','SIGNALi','SIG_OPEN','S25_RUMROLL_ALT','','',''),
('M25_ROLL','3','0','ANIMATE','','','','',''),
('M25_RUMBLE','0','1','ASSIGN','BFRAME','1','','',''),
('M25_RUMBLE','1','2','ASSIGN','WSPRITE','IDS_RUMBLE','','',''),
('M25_RUMBLE','10','3','CLEAR','BPARM','','','',''),
('M25_RUMBLE','2','3','SHOW','WSPRITE','','','',''),
('M25_RUMBLE','20','3','SUBI','BPARM','1','','',''),
('M25_RUMBLE','3','20','DRAGFOCUS','0','FALSE','','',''),
('M25_RUMBLE','3','40','DRAGFOCUS','0','TRUE','','',''),
('M25_RUMBLE','3','30','DROP','0','IDD_TELEKINESIS','','',''),
('M25_RUMBLE','3','10','WAIT','0','SIG_INIT','','',''),
('M25_RUMBLE','30','50','ADDI','BPARM','1','','',''),
('M25_RUMBLE','40','50','ADDI','BPARM','1','','',''),
('M25_RUMBLE','50','60','GTi','BPARM','1','','',''),
('M25_RUMBLE','50','0','VIDEO','0','IDS_RUMBLE','','',''),
('M25_RUMBLE','60','61','ASSIGN','WSPRITE','0','','',''),
('M25_RUMBLE','61','62','SHOW','WSPRITE','','','',''),
('M25_RUMBLE','62','70','SIGNALi','SIG_OPEN','S25_ROLL','','',''),
('M25_RUMBLE','70','71','CLICK','0','0','','',''),
('M25_RUMBLE','71','70','LOADVIEW','0','IDV_WALL2EN','','',''),
('M25_SCATTER','0','notscattered','MOV','BFRAME','0','
    ASSIGN(WSPRITE,IDS_SCATTER);
    SHOW(WSPRITE);
','',''),
('M25_SCATTER','advanceFrame','checkIfComplete','ADDI','BFRAME','1','
    ASSIGN(BPARM,0);
','',''),
('M25_SCATTER','allowAccess','scattered','CLICK','','','
    LOADVIEW(0,IDV_WALL1EN);
','',''),
('M25_SCATTER','axed','checkDamage','PLAYWAVE','0','SOUND_PICKAXE','
      ADDI(BPARM,1);
','',''),
('M25_SCATTER','bombed','checkDamage','VIDEO','0','IDS_EXPLODE1','
    //add damage
    PLAYWAVE(SOUND_EXPLODE);
    ADDI(BPARM,20);
','',''),
('M25_SCATTER','checkDamage','advanceFrame','GTEi','BPARM','20','','',''),
('M25_SCATTER','checkDamage','notscattered','Z_EPSILON','','','','',''),
('M25_SCATTER','checkIfComplete','scattered','GTEi','BFRAME','10','
    SIGNALi(SIG_OPEN,S25_SCAT_ALT);
','',''),
('M25_SCATTER','checkIfComplete','notscattered','Z_EPSILON','','','','',''),
('M25_SCATTER','notscattered','axed','DRAG','0','IDD_PICK','','',''),
('M25_SCATTER','notscattered','axed','DRAG','0','IDD_SHOVEL','','',''),
('M25_SCATTER','notscattered','bombed','DROP','IDD_BOMB2','0','','',''),
('M25_SCATTER','scattered','allowAccess','CLICK','','','
    LOADVIEW(0,IDV_WALL1EN);
','',''),
('M26_BANISH','0','30','CLICK','0','0','','',''),
('M26_BANISH','0','10','DRAG','0','IDD_SCOOPF','','',''),
('M26_BANISH','0','20','DRAGFOCUS','0','TRUE','','',''),
('M26_BANISH','10','20','HANDOFF','0','IDD_SCOOPE','','',''),
('M26_BANISH','20','0','PLAYWAVE','0','SOUND_SPIT','','',''),
('M26_BANISH','30','70','EQUALi','LWEALTH','0','','',''),
('M26_BANISH','30','0','Z_EPSILON','','','','',''),
('M26_BANISH','70','0','LOADVIEW','WIP1','','','',''),
('MEFLIN_COORD','0','Q1Started','WAIT','','SIG_Q1_START','','',''),
('MEFLIN_COORD','Q1Pending','Q1Solved','WAIT','','SIG_Q1_SOLVED','','',''),
('MEFLIN_COORD','Q1Solved','Q2Started','WAIT','','SIG_Q2_START','','',''),
('MEFLIN_COORD','Q1Started','Q1Pending','WAIT','','SIG_Q1_GIVEN','','',''),
('MEFLIN_COORD','Q2Pending','Q2Solved','WAIT','','SIG_Q2_SOLVED','','',''),
('MEFLIN_COORD','Q2Solved','Q3Started','WAIT','','SIG_Q3_START','','',''),
('MEFLIN_COORD','Q2Started','Q2Pending','WAIT','','SIG_Q2_GIVEN','','',''),
('MEFLIN_COORD','Q3Pending','Q3Solved','WAIT','','SIG_Q3_SOLVED','','',''),
('MEFLIN_COORD','Q3Started','Q3Pending','WAIT','','SIG_Q3_GIVEN','','',''),
('M_ALARM','0','ready','O_ACCEPT','0','IDD_ALARM','
    ASSIGN(WPARM,0); //WILL BE LVIEW VALUE
','',''),
('M_ALARM','alarmGreen','alarmWhite','CLICK','0','','
    MOV(WSPRITE,IDS_ALARMOFF);
    SHOW(WSPRITE);
    LOADVIEW(WPARM);
','',''),
('M_ALARM','alarmGreen','alarmRed','WAIT','0','SIG_ALARM','
    MOV(WSPRITE,IDS_ALARMRED);
    ASHOW(WSPRITE);
','',''),
('M_ALARM','alarmRed','alarmWhite','CLICK','0','','
    MOV(WSPRITE,IDS_ALARMOFF);
    SHOW(WSPRITE);
    LOADVIEW(WPARM);
','',''),
('M_ALARM','alarmWhite','alarmGreen','ESTIME','0','2','
    MOV(WSPRITE,IDS_ALARMGRN);
    SHOW(WSPRITE);
','',''),
('M_ALARM','alarmWhite','0','GRAB','0','0','SHOW();','',''),
('M_ALARM','ready','alarmWhite','DROP','0','0','
    SHOW(WOBJECT);
    MOV(WPARM,LVIEW);
','',''),
('M_ALTVIEW','0','0','CLICK','','','LOADVIEW(WIP1);','',''),
('M_ALTVIEW','0','0','WAIT','SIG_VIEWINIT','','REF_MACHINE(WIP2);
ASHOW(R_WOBJECT);','',''),
('M_ANIBIN','0','1','MOV','WSPRITE','WIP1','','',''),
('M_ANIBIN','1','2','ASHOW','WSPRITE','V_LOOP','','',''),
('M_ANIBIN','2','2','GRAB','WIP2','','','',''),
('M_ANIPORTAL','0','1','MOV','WSPRITE','WIP1','','',''),
('M_ANIPORTAL','1','2','ASHOW','WSPRITE','V_LOOP','','',''),
('M_ANIPORTAL','2','3','CLICK','0','0','','',''),
('M_ANIPORTAL','3','4','SIGNALi','SIG_OPEN','WIP2','','',''),
('M_ANIPORTAL','4','1','LOADVIEW','0','WIP3','','',''),
('M_ATTACKSPELL','0','turntOn','WAIT','0','SIG_START','
    //start the timer
    SIGNAL(WIP2,SIG_START);
','',''),
('M_ATTACKSPELL','active','caughtInLoop','ESTIME','0','0','
        if(WIP1==BLINDNESS){
             MOV(WPARM,IDV_BLINDVIEW);
             LOADVIEW(WPARM);
        }
  
        if(WIP1==HALUCINATE){ 
            MOV(WPARM,IDV_BLINDVIEW);
            LOADVIEW(WPARM);
        }
','',''),
('M_ATTACKSPELL','caughtInLoop','ended','WAIT','0','SIG_STOP','SIGNAL(SID_SPELL,SIG_CLEAR);','',''),
('M_ATTACKSPELL','caughtInLoop','active','Z_EPSILON','','','','',''),
('M_ATTACKSPELL','ended','0','Z_EPSILON','','','','',''),
('M_ATTACKSPELL','turntOn','active','Z_EPSILON','','','','',''),
('M_AURA','0','energyBoost','Z_EPSILON','0','0','','',''),
('M_AURA','1','energyBoost','WAIT','0','SIG_ADD','','',''),
('M_AURA','1','energyDrain','WAIT','0','SIG_SUB','','',''),
('M_AURA','1','energyBoost','WAIT','0','0','','',''),
('M_AURA','energyBoost','1','ASSIGN','WPARM','','
       if(LENERGY > (MAX_AURAS - 1)){
             ASSIGN(LENERGY,(MAX_AURAS -1));
       }
        ASSIGN(BPARM,LENERGY);
        MOV(WSPRITE,BPARM);
        MAPi(WSPRITE,S00_AURA_MAP);
        SHOW(WSPRITE);
        ANIMATE(WPARM);
        SIGNALi(0,SID_ID);
','',''),
('M_AURA','energyDrain','1','ASSIGN','WPARM','V_REVERSE','
        if(LENERGY <= 1){
             ASSIGN(LENERGY,1);
       }      
       ASSIGN(BPARM,LENERGY);
        MOV(WSPRITE,BPARM);
        MAPi(WSPRITE,S00_AURA_MAP);
        SHOW(WSPRITE);
        ANIMATE(WPARM);
       // SIGNALi(0,SID_ID);
        
        if(LENERGY <= 1){
             ASSIGN(LENERGY,1);
             SIGNAL(SID_ID,SIG_DEAD);
       }   
','',''),
('M_BACKBUTTON','0','1','CLICK','0','0','','',''),
('M_BACKBUTTON','1','2','PLAYWAVE','0','SOUND_POPUP','','',''),
('M_BACKBUTTON','2','0','LOADVIEW','0','IDV_TOPMENU','','',''),
('M_BAITSTATION','0','1','C_ACCEPT','0','IDC_POLE','','',''),
('M_BAITSTATION','1','2','SHOW','0','0','','',''),
('M_BAITSTATION','2','3','DROP','0','0','','',''),
('M_BAITSTATION','3','8','IS_A','WOBJECT','ISA_BAITEDPOLE','','',''),
('M_BAITSTATION','3','4','SHOW','0','IDS_POLE1LOL','','',''),
('M_BAITSTATION','4','5','MOV','WPARM','WOBJECT','','',''),
('M_BAITSTATION','5','6','C_ACCEPT','0','ISA_BAIT','','',''),
('M_BAITSTATION','6','7','DROP','0','0','','',''),
('M_BAITSTATION','6','0','GRAB','0','0','','',''),
('M_BAITSTATION','7','8','MIX','WPARM','WOBJECT','','',''),
('M_BAITSTATION','8','9','SHOW','0','IDS_POLE1B','','',''),
('M_BAITSTATION','9','0','GRAB','0','0','','',''),
('M_BARD','0','10','ASSIGN','DETIME','1500','','',''),
('M_BARD','10','FWcountdown','SYNCPOINT','DETIME','SYNC_FOULWIND','','',''),
('M_BARD','10','hideStuff','Z_EPSILON','','','','',''),
('M_BARD','FWcountdown','summonFoulWind','ESTIME','0','1500','','',''),
('M_BARD','hideStuff','kickOffNature','SIGNALi','SIG_OPEN','S00_HIDER','','',''),
('M_BARD','kickOffNature','20','SIGNALi','SIG_OPEN','S01_NATURE','','',''),
('M_BARD','summonFoulWind','FWcountdown','SIGNALi','0','S17_aFOULWIND','','',''),
('M_BIN','0','1','O_ACCEPT','WIP1','','','',''),
('M_BIN','1','10','SHOW','WIP2','','','',''),
('M_BIN','10','10','DROP','0','0','','',''),
('M_BIN','10','10','GRAB','WIP1','','','',''),
('M_BLINDVIEW','0','5','CLICK','','','','',''),
('M_BLINDVIEW','10','','Z_EPSILON','','','','',''),
('M_BLINDVIEW','5','10','RAND','10','1','
    if(WRAND > 5){
        SIGNAL(BLINDNESS_ACTIVE,SIG_STOP);
    }
','',''),
('M_BTN_1phase','0','0','CLICK','','','PLAYWAVE(SOUND_BTNPRESS);
LOADVIEW(WIP1);
SHOW();','',''),
('M_BTN_1phase','0','0','DRAGFOCUS','0','FALSE','SHOW();','',''),
('M_BTN_1phase','0','0','DRAGFOCUS','0','TRUE','WSPRITE=WIP2;
SHOW(WSPRITE);
PLAYWAVE(SOUND_BTNDRAG);','',''),
('M_BTN_2phase','0','1','CLICK','0','0','','',''),
('M_BTN_2phase','0','10','DRAGFOCUS','0','TRUE','','',''),
('M_BTN_2phase','0','20','DRAGFOCUS','0','FALSE','','',''),
('M_BTN_2phase','1','2','PLAYWAVE','0','SOUND_BTNPRESS','','',''),
('M_BTN_2phase','10','11','MOV','WSPRITE','WIP2','','',''),
('M_BTN_2phase','11','12','SHOW','WSPRITE','','','',''),
('M_BTN_2phase','12','0','PLAYWAVE','0','SOUND_BTNDRAG','','',''),
('M_BTN_2phase','2','20','LOADVIEW','WIP1','','','',''),
('M_BTN_2phase','20','21','MOV','WSPRITE','WIP3','','',''),
('M_BTN_2phase','21','0','SHOW','WSPRITE','','','',''),
('M_CHESS','0','1','SHOW','WIP1','','','',''),
('M_CHESS','1','150','CLICK','0','0','','',''),
('M_CHESS','101','102','ASSIGN','WTEMP1','IDD_WPAWN','','',''),
('M_CHESS','102','103','SIGNALi','SIG_SET','S00_SQUARE00+8','','',''),
('M_CHESS','103','104','SIGNALi','SIG_SET','S00_SQUARE00+9','','',''),
('M_CHESS','104','105','SIGNALi','SIG_SET','S00_SQUARE00+10','','',''),
('M_CHESS','105','106','SIGNALi','SIG_SET','S00_SQUARE00+11','','',''),
('M_CHESS','106','107','SIGNALi','SIG_SET','S00_SQUARE00+12','','',''),
('M_CHESS','107','108','SIGNALi','SIG_SET','S00_SQUARE00+13','','',''),
('M_CHESS','108','109','SIGNALi','SIG_SET','S00_SQUARE00+14','','',''),
('M_CHESS','109','110','SIGNALi','SIG_SET','S00_SQUARE00+15','','',''),
('M_CHESS','110','111','ASSIGN','WTEMP1','IDD_WROOK','','',''),
('M_CHESS','111','112','SIGNALi','SIG_SET','S00_SQUARE00+0','','',''),
('M_CHESS','112','113','SIGNALi','SIG_SET','S00_SQUARE00+7','','',''),
('M_CHESS','113','114','ASSIGN','WTEMP1','IDD_WKNIGHT','','',''),
('M_CHESS','114','115','SIGNALi','SIG_SET','S00_SQUARE00+1','','',''),
('M_CHESS','115','116','SIGNALi','SIG_SET','S00_SQUARE00+6','','',''),
('M_CHESS','116','117','ASSIGN','WTEMP1','IDD_WBISHOP','','',''),
('M_CHESS','117','118','SIGNALi','SIG_SET','S00_SQUARE00+2','','',''),
('M_CHESS','118','119','SIGNALi','SIG_SET','S00_SQUARE00+5','','',''),
('M_CHESS','119','120','ASSIGN','WTEMP1','IDD_WQUEEN','','',''),
('M_CHESS','120','121','SIGNALi','SIG_SET','S00_SQUARE00+3','','',''),
('M_CHESS','121','122','ASSIGN','WTEMP1','IDD_WKING','','',''),
('M_CHESS','122','124','SIGNALi','SIG_SET','S00_SQUARE00+4','','',''),
('M_CHESS','124','125','ASSIGN','WTEMP1','IDD_BPAWN','','',''),
('M_CHESS','125','126','SIGNALi','SIG_SET','S00_SQUARE48','','',''),
('M_CHESS','126','127','SIGNALi','SIG_SET','S00_SQUARE48+1','','',''),
('M_CHESS','127','128','SIGNALi','SIG_SET','S00_SQUARE48+2','','',''),
('M_CHESS','128','129','SIGNALi','SIG_SET','S00_SQUARE48+3','','',''),
('M_CHESS','129','130','SIGNALi','SIG_SET','S00_SQUARE48+4','','',''),
('M_CHESS','130','131','SIGNALi','SIG_SET','S00_SQUARE48+5','','',''),
('M_CHESS','131','132','SIGNALi','SIG_SET','S00_SQUARE48+6','','',''),
('M_CHESS','132','133','SIGNALi','SIG_SET','S00_SQUARE48+7','','',''),
('M_CHESS','133','134','ASSIGN','WTEMP1','IDD_BROOK','','',''),
('M_CHESS','134','135','SIGNALi','SIG_SET','S00_SQUARE56+0','','',''),
('M_CHESS','135','136','SIGNALi','SIG_SET','S00_SQUARE56+7','','',''),
('M_CHESS','136','137','ASSIGN','WTEMP1','IDD_BKNIGHT','','',''),
('M_CHESS','137','138','SIGNALi','SIG_SET','S00_SQUARE56+1','','',''),
('M_CHESS','138','139','SIGNALi','SIG_SET','S00_SQUARE56+6','','',''),
('M_CHESS','139','140','ASSIGN','WTEMP1','IDD_BBISHOP','','',''),
('M_CHESS','140','141','SIGNALi','SIG_SET','S00_SQUARE56+2','','',''),
('M_CHESS','141','142','SIGNALi','SIG_SET','S00_SQUARE56+5','','',''),
('M_CHESS','142','143','ASSIGN','WTEMP1','IDD_BQUEEN','','',''),
('M_CHESS','143','144','SIGNALi','SIG_SET','S00_SQUARE56+3','','',''),
('M_CHESS','144','145','ASSIGN','WTEMP1','IDD_BKING','','',''),
('M_CHESS','145','146','SIGNALi','SIG_SET','S00_SQUARE56+4','','',''),
('M_CHESS','146','1','CLEAR','WTEMP1','','','',''),
('M_CHESS','150','101','SIGNALi','SIG_NULL','S00_CLEAR','','',''),
('M_CLAM','0','1','MOV','BFRAME','0','','',''),
('M_CLAM','1','2','SHOW','WIP1','','','',''),
('M_CLAM','2','3','DRAG','0','IDD_TICKLELEAF','','',''),
('M_CLAM','3','4','ESTIME','','3','','',''),
('M_CLAM','4','5','ADDI','BFRAME','1','','',''),
('M_CLAM','5','0','GRAB','','IDD_EMERALD','','',''),
('M_CLEAR','0','5','SHOW','WIP1','','','',''),
('M_CLEAR','10','20','ASSIGN','WPARM','S00_SQUARE63','','',''),
('M_CLEAR','20','30','SIGNAL','WPARM','SIG_CLEAR','','',''),
('M_CLEAR','30','50','SUBI','WPARM','1','','',''),
('M_CLEAR','5','9','CLICK','0','0','','',''),
('M_CLEAR','5','9','WAIT','0','0','','',''),
('M_CLEAR','50','0','CLEAR','WOBJECT','','','',''),
('M_CLEAR','50','20','GTEi','WPARM','S00_SQUARE00','','',''),
('M_CLEAR','9','10','SHOW','WIP1','','','',''),
('M_CLICKBAIT','0','1','MOV','BFRAME','0','','',''),
('M_CLICKBAIT','1','2','SHOW','WIP1','','','',''),
('M_CLICKBAIT','2','3','CLICK','','','','',''),
('M_CLICKBAIT','3','4','ADDI','BFRAME','1','','',''),
('M_CLICKBAIT','4','0','GTE','BFRAME','WIP2','','',''),
('M_CLICKBAIT','4','1','Z_EPSILON','','','','',''),
('M_COMPASS','0','1','CLICK','0','0','','',''),
('M_COMPASS','1','0','PLAYWAVE','0','SOUND_CLICK','','',''),
('M_CONTLOCKED','0','unlocked','WAIT','','SIG_UNLOCK','','',''),
('M_CONTLOCKED','passthru','unlocked','Z_EPSILON','','','','',''),
('M_CONTLOCKED','unlocked','passthru','CLICK','','','
    LOADVIEW(WIP1);
','',''),
('M_CONTLOCKED','unlocked','0','WAIT','','SIG_LOCK','','',''),
('M_DEC_ENERG','0','drain','WAIT','0','0','','',''),
('M_DEC_ENERG','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','0','drain','WAIT','','SIG_DEC','','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEC_ENERGY','drain','0','Z_EPSILON','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
','',''),
('M_DEFENSESPELL','0','turntOn','WAIT','0','SIG_START','
    SHOW(WIP1);
    SIGNAL(WIP2,SIG_START);
','',''),
('M_DEFENSESPELL','active','ended','WAIT','0','SIG_STOP','
    SHOW();
','',''),
('M_DEFENSESPELL','ended','0','Z_EPSILON','','','','',''),
('M_DEFENSESPELL','turntOn','active','Z_EPSILON','','','','',''),
('M_DIGDIRECT','0','determinedItem','MOV','WOBJECT','WIP1','','',''),
('M_DIGDIRECT','coverActive','firstWhack','C_ACCEPT','WIP3','','','',''),
('M_DIGDIRECT','determinedItem','coverActive','MOV','WSPRITE','WIP2','
        SHOW(WSPRITE);
','',''),
('M_DIGDIRECT','displayItem','itemGrabbed','GRAB','','','','',''),
('M_DIGDIRECT','firstWhack','secondWhack','DRAG','','','
        if(WIP3 == ISA_TOOL_DIGGER){
            SHOW(0,IDS_SANDPILE1);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
         if(WIP3 == ISA_TOOL_STRIKER){
            SHOW(0,IDS_SANDSTRIKE);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
          if(WIP3 == ISA_TOOL_PRYER){
            SHOW(0,IDS_SANDWOBBLE);
            ANIMATE();
            PLAYWAVE(SOUND_THUMP);
         }   
','',''),
('M_DIGDIRECT','fourthWhack','moveMe','DRAG','','','','',''),
('M_DIGDIRECT','itemGrabbed','0','Z_EPSILON','','','SHOW();','',''),
('M_DIGDIRECT','moveMe','displayItem','SET_YOFFSET','ADD','50','
        PLAYWAVE(SOUND_CHIMES);
        SHOW(WOBJECT);
','',''),
('M_DIGDIRECT','secondWhack','thirdWhack','DRAG','','','
        if(WIP3 == ISA_TOOL_DIGGER){
            SHOW(0,IDS_SANDPILE2);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
         if(WIP3 == ISA_TOOL_STRIKER){
            SHOW(0,IDS_SANDSTRIKE);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
           if(WIP3 == ISA_TOOL_PRYER){
            SHOW(0,IDS_SANDFLIP);
            ANIMATE();
            PLAYWAVE(SOUND_THUMP);
         }   
','',''),
('M_DIGDIRECT','thirdWhack','fourthWhack','DRAG','','','
        if(WIP3 == ISA_TOOL_DIGGER){
            SHOW(0,IDS_SANDPILE3);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
         if(WIP3 == ISA_TOOL_STRIKER){
            SHOW(0,IDS_SANDSTRIKE);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
           if(WIP3 == ISA_TOOL_PRYER){
            SHOW(0,IDS_SANDFLIP);
            ANIMATE();
            PLAYWAVE(SOUND_THUMP);
         }   
','',''),
('M_DIGGABLE','0','fixinToHideItem','WAIT','','SIG_OPEN','
    REF_MACHINE(S00_HIDER);
    MOV(WOBJECT,R_WPARM);
','',''),
('M_DIGGABLE','coverActive','firstWhack','C_ACCEPT','WIP3','','','',''),
('M_DIGGABLE','determinedItem','coverActive','MOV','WSPRITE','WIP2','
        SHOW(WSPRITE);
','',''),
('M_DIGGABLE','displayItem','itemGrabbed','GRAB','','','','',''),
('M_DIGGABLE','firstWhack','secondWhack','DRAG','','','
        if(WIP3 == ISA_TOOL_DIGGER){
            SHOW(0,IDS_SANDPILE1);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
         if(WIP3 == ISA_TOOL_STRIKER){
            SHOW(0,IDS_SANDSTRIKE);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
          if(WIP3 == ISA_TOOL_PRYER){
            SHOW(0,IDS_SANDWOBBLE);
            ANIMATE();
            PLAYWAVE(SOUND_THUMP);
         }   
','',''),
('M_DIGGABLE','fixinToHideItem','determinedItem','MAPi','WOBJECT','S00_HIDDENITEM','','',''),
('M_DIGGABLE','fourthWhack','moveMe','DRAG','','','','',''),
('M_DIGGABLE','itemGrabbed','0','Z_EPSILON','','','SHOW();','',''),
('M_DIGGABLE','moveMe','displayItem','SET_YOFFSET','ADD','50','
        PLAYWAVE(SOUND_CHIMES);
        SHOW(WOBJECT);
','',''),
('M_DIGGABLE','secondWhack','thirdWhack','DRAG','','','
        if(WIP3 == ISA_TOOL_DIGGER){
            SHOW(0,IDS_SANDPILE2);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
         if(WIP3 == ISA_TOOL_STRIKER){
            SHOW(0,IDS_SANDSTRIKE);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
           if(WIP3 == ISA_TOOL_PRYER){
            SHOW(0,IDS_SANDFLIP);
            ANIMATE();
            PLAYWAVE(SOUND_THUMP);
         }   
','',''),
('M_DIGGABLE','thirdWhack','fourthWhack','DRAG','','','
        if(WIP3 == ISA_TOOL_DIGGER){
            SHOW(0,IDS_SANDPILE3);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
         if(WIP3 == ISA_TOOL_STRIKER){
            SHOW(0,IDS_SANDSTRIKE);
            ANIMATE();
            PLAYWAVE(SOUND_DIG);
         }   
           if(WIP3 == ISA_TOOL_PRYER){
            SHOW(0,IDS_SANDFLIP);
            ANIMATE();
            PLAYWAVE(SOUND_THUMP);
         }   
','',''),
('M_DIG_UNCOVER','0','coverActive','MOV','WSPRITE','WIP2','
        SHOW(WSPRITE);
','',''),
('M_DIG_UNCOVER','coverActive','firstWhack','C_ACCEPT','WIP3','','','',''),
('M_DIG_UNCOVER','firstWhack','secondWhack','DRAG','','','
        if(WIP3 == ISA_TOOL_DIGGER){
            SHOW(0,IDS_SANDPILE1);
            PLAYWAVE(SOUND_DIG);
            ANIMATE();
         }   
','',''),
('M_DIG_UNCOVER','moveMe','oncovered','DRAG','','','','',''),
('M_DIG_UNCOVER','oncovered','done','SET_YOFFSET','ADD','50','
        PLAYWAVE(SOUND_CHIMES);
        SHOW();
','',''),
('M_DIG_UNCOVER','secondWhack','thirdWhack','DRAG','','','
        if(WIP3 == ISA_TOOL_DIGGER){
            SHOW(0,IDS_SANDPILE2);
            PLAYWAVE(SOUND_DIG);
            ANIMATE();
         }   
','',''),
('M_DIG_UNCOVER','thirdWhack','moveMe','DRAG','','','
        if(WIP3 == ISA_TOOL_DIGGER){
            SHOW(0,IDS_SANDPILE3);
            PLAYWAVE(SOUND_DIG);
            ANIMATE();
         }   
','',''),
('M_DISKSPIN','0','5','MOV','BFRAME','0','','',''),
('M_DISKSPIN','10','20','LTE','BFRAME','7','','',''),
('M_DISKSPIN','10','0','Z_EPSILON','','','ADD(BFRAME,1);','',''),
('M_DISKSPIN','20','10','CLICK','','','PLAYWAVE(SOUND_STONERUB);ADD(BFRAME,1);MOV(BPARM,BFRAME);SIGNALi(SIG_CHECK,S28_KAMDOOR);','',''),
('M_DISKSPIN','5','10','SHOW','','IDS_MOONSPIN','','',''),
('M_EYEINFO','0','checkObject','DROP','0','0','
PLAYWAVE(SOUND_POPUP);ASHOW(WOBJECT);
MOV(BPARM,LVIEW);
','',''),
('M_EYEINFO','0','replacedView','GRAB','0','0','
      SHOW(0);
','',''),
('M_EYEINFO','checkObject','viewSpell','IS_A','WOBJECT','IDC_SCROLL','MOV(WPARM,WOBJECT);
        MAPi(WPARM,S12_SCROLL);
        SIGNALi(SIG_SHOW,S12_SHIELD);
        SIGNALi(SIG_SHOW,S12_WORD);
        SIGNALi(SIG_SHOW,S12_ING1);
        SIGNALi(SIG_SHOW,S12_ING2);
        SIGNALi(SIG_SHOW,S12_ING3);
        SIGNALi(SIG_SHOW,S12_ING4);
        SIGNALi(SIG_SHOW,S12_NYST);
       
       ','',''),
('M_EYEINFO','checkObject','viewEnchantment','IS_A','WOBJECT','ISA_ENCHANTEDSTONE','MOV(WPARM,WOBJECT);      
        ','',''),
('M_EYEINFO','checkObject','0','IS_A','WOBJECT','ISA_DIARY','MOV(WPARM,WOBJECT);
        if((WOBJECT == IDD_DIARY1 )){
                 SIGNAL(NIRET_DIARY_WAITER,SIG_DIARY);
        }
        if((WOBJECT == IDD_DIARY2 )){
                 SIGNAL(ETNOC_DIARY_WAITER,SIG_DIARY);
        }
         if((WOBJECT == IDD_DIARY3 )){
                 SIGNAL(ETNOC_DIARY_WAITER,SIG_DIARY);
        }
         if((WOBJECT == IDD_DIARY4 )){
                 SIGNAL(ETNOC_DIARY_WAITER,SIG_DIARY);
        }
         if((WOBJECT == IDD_DIARY5 )){
                  SIGNAL(NIRET_DIARY_WAITER,SIG_DIARY);
        }
        ','',''),
('M_EYEINFO','checkObject','0','Z_EPSILON','','','
       
if(IS_A(WOBJECT,IDD_SCOOPE) || IS_A(WOBJECT,IDD_SCOOPF)){
                MOV(WPARM,WOBJECT);
                SIGNAL(NYSTROM_WAITER,SIG_NYSTROM);
                }

       if(IS_A(WOBJECT,IDC_NULL) || IS_A(WOBJECT,IDC_BOMB) || IS_A(WOBJECT,IDC_FISH) || IS_A(WOBJECT,IDC_SPELL) || IS_A(WOBJECT,IDC_BAIT)){
                MOV(WPARM,WOBJECT);
                SIGNAL(OBJECT_WAITER,SIG_OBJECT);
                }
','',''),
('M_EYEINFO','checkObject','0','Z_EPSILON','0','0','','',''),
('M_EYEINFO','replacedView','0','Z_EPSILON','0','0','
        LOADVIEW(BPARM);
','',''),
('M_EYEINFO','viewEnchantment','0','LOADVIEW','0','IDV_ENCHANTPAN','','',''),
('M_EYEINFO','viewSpell','0','LOADVIEW','0','IDV_SPELLPAN','','',''),
('M_FISHSTATION','0','vacant','C_ACCEPT','0','IDC_POLE','SHOW();','',''),
('M_FISHSTATION','baited_pole','0','GRAB','0','0','','',''),
('M_FISHSTATION','baited_pole','fish_on','SYNCPOINT','WRAND','SYNC_FISH1','PLAYWAVE(0,SOUND_HURT);
    MOV(WPARM,WOBJECT);
      if(WTEMP1 < 6 ){
        RAND(5,1); 
        MOV(WOBJECT,WRAND);
        MAP(WOBJECT,FISH_CAUGHT);
      }
    if(WTEMP1 >= 6 ){
        RAND(10,6); 
        MOV(WOBJECT,WRAND);
        MAP(WOBJECT,FISH_CAUGHT);
    }
    SHOW(IDS_POLE1LCT);','',''),
('M_FISHSTATION','branch','baited_pole','IS_A','WOBJECT','ISA_BAITEDPOLE','SHOW(IDS_POLE1LCL);
RAND(ADD_CATCH_TIME,MIN_CATCH_TIME);','',''),
('M_FISHSTATION','branch','pole','Z_EPSILON','','','SHOW(IDS_POLE1LCU);
MOV(WPARM,WOBJECT);
C_ACCEPT(0,ISA_BAIT);','',''),
('M_FISHSTATION','fish_on','branch','GRAB','0','0','MOV(WOBJECT,IDD_POLE1);
SHOW(IDS_POLE1LCU);','',''),
('M_FISHSTATION','pole','branch','DROP','0','0','
        MOV(WTEMP1,WOBJECT);
        MIX(WPARM,WOBJECT); 
        MAP(WTEMP1,BAIT_POWER);
        SHOW(IDS_POLE1B);
','',''),
('M_FISHSTATION','pole','0','GRAB','0','0','','',''),
('M_FISHSTATION','vacant','vacant','DRAG','0','IDD_BUCKE','HANDOFF(0,IDD_BUCKF);','',''),
('M_FISHSTATION','vacant','branch','DROP','0','0','','',''),
('M_FLYBINa','0','1','Z_EPSILON','','','MOV(WSPRITE,WIP1);
         ASHOW(WSPRITE, V_LOOP);','',''),
('M_FLYBINa','1','2','GRAB','WIP2','','PLAYWAVE(WIP4);','',''),
('M_FLYBINa','2','3','Z_EPSILON','','','WRITE('This is something to write');','',''),
('M_FLYBINa','3','1','Z_EPSILON','','','','',''),
('M_FLYBINb','0','BAIT_0','Z_EPSILON','','','MOV(WSPRITE,WIP1);
         ASHOW(WSPRITE, V_LOOP);','',''),
('M_FLYBINb','4','5','GRAB','WOBJECT','','PLAYWAVE(WIP4);WOBJECT=IDD_BAIT3;ASHOW(WOBJECT);','',''),
('M_FLYBINb','5','6','CLICK','','','WPARM=1;','',''),
('M_FLYBINb','6','7','CLICK','','','WPARM=WPARM+1*3;','',''),
('M_FLYBINb','7','6','CLICK','','','','WPARM<5',''),
('M_FLYBINb','7','8','CLICK','','','WPARM=(WOBJECT+1000);','',''),
('M_FLYBINb','8','FINAL','CLICK','','','','(WPARM==WOBJECT+1000) && (WPARM-1000 == WOBJECT)',''),
('M_FLYBINb','BAIT_0','BAIT_1','GRAB','WIP2','','PLAYWAVE(WIP4);WOBJECT=IDD_BAIT0;ASHOW(WOBJECT);','',''),
('M_FLYBINb','BAIT_1','BAIT_2','GRAB','WOBJECT','','PLAYWAVE(WIP4);WOBJECT=IDD_BAIT1;ASHOW(WOBJECT);','',''),
('M_FLYBINb','BAIT_2','4','GRAB','WOBJECT','','PLAYWAVE(WIP4);WOBJECT=IDD_BAIT2;ASHOW(WOBJECT);','',''),
('M_FLYBINb','FINAL','BAIT_0','CLICK','','','WRITE('CODE BLOCK 1...');','',''),
('M_GENERAL_WAITER','0','waiting','Z_EPSILON','','','
        REF_MACHINE(SMP_EYEINFO);
        CLEAR(WPARM);
','',''),
('M_GENERAL_WAITER','showText','0','Z_EPSILON','','','
        CLEAR(WTEMP1);
        CLEAR(BPARM);
        CLEAR(WPARM);
','',''),
('M_GENERAL_WAITER','waiting','showText','WAIT','0','WIP2','
        predicate objectInfo(object,view,control,content);
        objectInfo(R_WPARM,?BPARM,?WPARM, ?WTEMP1);
        LOADVIEW(BPARM);
        SETTEXT(WPARM,WTEMP1);
       
','',''),
('M_GOPABIN','0','1','MOV','BFRAME','WIP3','','',''),
('M_GOPABIN','1','2','SHOW','WIP1','','','',''),
('M_GOPABIN','2','20','GRAB','','','','',''),
('M_GOPABIN','2','3','WAIT','0','SIG_RIPEN','','',''),
('M_GOPABIN','20','30','EQUALi','BFRAME','0','','',''),
('M_GOPABIN','20','40','EQUALi','BFRAME','1','','',''),
('M_GOPABIN','20','50','EQUALi','BFRAME','2','','',''),
('M_GOPABIN','20','1','Z_EPSILON','','','','',''),
('M_GOPABIN','3','4','ADDI','BFRAME','1','','',''),
('M_GOPABIN','30','31','ASSIGN','WOBJECT','IDD_GOPAR','','',''),
('M_GOPABIN','31','1','SHOW','0','0','','',''),
('M_GOPABIN','4','5','EQUALi','BFRAME','0','','',''),
('M_GOPABIN','4','6','EQUALi','BFRAME','1','','',''),
('M_GOPABIN','4','7','EQUALi','BFRAME','2','','',''),
('M_GOPABIN','4','8','EQUALi','BFRAME','3','','',''),
('M_GOPABIN','4','9','GTE','BFRAME','WIP2','','',''),
('M_GOPABIN','40','41','ASSIGN','WOBJECT','IDD_GOPAG','','',''),
('M_GOPABIN','41','1','SHOW','0','0','','',''),
('M_GOPABIN','5','2','ASSIGN','WOBJECT','IDD_GOPAR','','',''),
('M_GOPABIN','50','51','ASSIGN','WOBJECT','IDD_GOPAB','','',''),
('M_GOPABIN','51','1','SHOW','0','0','','',''),
('M_GOPABIN','6','2','ASSIGN','WOBJECT','IDD_GOPAG','','',''),
('M_GOPABIN','7','2','ASSIGN','WOBJECT','IDD_GOPAB','','',''),
('M_GOPABIN','8','2','ASSIGN','WOBJECT','','','',''),
('M_GOPABIN','9','0','ASSIGN','WOBJECT','IDD_GOPAR','','',''),
('M_HALO','0','karmaBoost','Z_EPSILON','0','0','','',''),
('M_HALO','1','karmaBoost','WAIT','0','SIG_ADD','','',''),
('M_HALO','1','karmaDrain','WAIT','0','SIG_SUB','','',''),
('M_HALO','1','karmaBoost','WAIT','0','0','','',''),
('M_HALO','karmaBoost','1','ASSIGN','WPARM','','
       if(LKARMA > (MAX_KARMA - 1)){
             ASSIGN(LKARMA,(MAX_KARMA));
       }
        ASSIGN(BPARM,LKARMA);
        MOV(WSPRITE,BPARM);
        DIV(WSPRITE,2);
        MAPi(WSPRITE,S00_KARMA_MAP);
        ASHOW(WSPRITE);
        SIGNALi(0,SID_ID);
','',''),
('M_HALO','karmaDrain','1','ASSIGN','WPARM','','
        if(LKARMA <= 0){
             ASSIGN(LKARMA,1);
       }      
        ASSIGN(BPARM,LKARMA);
        MOV(WSPRITE,BPARM);
        DIV(WSPRITE,2);
        MAPi(WSPRITE,S00_KARMA_MAP);
        ASHOW(WSPRITE);
        SIGNALi(0,SID_ID);
','',''),
('M_HIDELIST','0','0','CLICK','','','
    SIGNAL(WIP1,SIG_CHECK);
','',''),
('M_HIDER','0','topOLoop','WAIT','','SIG_OPEN','
    ASSIGN(WPARM,1);
    RAND(2,1); //The machine to start at
    ASSIGN(BPARM,WRAND);  // BPARM starting point for locations
    MOV(WTEMP1,BPARM);
    MAPi(WTEMP1,S00_HIDINGPLACE);
    SIGNAL(WTEMP1,SIG_OPEN); // Signal first hidden spot
    WRITE('FIRST ITEM HIDDEN'); 
  ','',''),
('M_HIDER','objectHidden','topOLoop','LT','WPARM','WIP1','','',''),
('M_HIDER','objectHidden','stopped','Z_EPSILON','','','
     WRITE('Finished Hiding Items');   
','',''),
('M_HIDER','stopped','0','WAIT','','SIG_OPEN','','',''),
('M_HIDER','topOLoop','objectHidden','LTE','WPARM','WIP1','  
            //Set wparm to represent the object pointer
            ADD(WPARM,1); // the new item is old one +1
           
            //climb up the list to find a new hiding place  
            RAND(2,1); //Location increases by 1 or 2
            MOV(WTEMP2,BPARM);
            ADD(WTEMP2,WRAND); 
            ASSIGN(BPARM,WTEMP2);
            MAPi(WTEMP2,S00_HIDINGPLACE);  //get the new hider machine into BPARM 
            SIGNAL(WTEMP2,SIG_OPEN); 
            WRITE('NEXT ITEM HIDDEN'); 
','',''),
('M_ID','0','setId','EQUALi','LSEX','1','
    if(LWISDOM >= 30){
       ASSIGN(WPARM,F3);
    }
     if(LWISDOM >= 20 && LWISDOM < 31){
        ASSIGN(WPARM,F2);
    }
    if(LWISDOM < 20){
       ASSIGN(WPARM,F1);
    }
','',''),
('M_ID','0','setId','NEQUALi','LSEX','1','
    if(LWISDOM >= 30){
       ASSIGN(WPARM,M3);
    }
    if(LWISDOM >= 20 && LWISDOM < 31){
        ASSIGN(WPARM,M2);
    }
    if(LWISDOM < 20){
       ASSIGN(WPARM,M1);
    }
','',''),
('M_ID','100','empty','SHOW','0','0','
    SIGNAL(WIP4,SIG_CLEAR);
','',''),
('M_ID','20','playForward','ASSIGN','WSPRITE','happy','','',''),
('M_ID','21','playForward','ASSIGN','WSPRITE','hurt','','',''),
('M_ID','22','playOnce','ASSIGN','WSPRITE','kiss','','',''),
('M_ID','23','playForward','ASSIGN','WSPRITE','mad','','',''),
('M_ID','24','playForward','ASSIGN','WSPRITE','sad','','',''),
('M_ID','25','playForward','ASSIGN','WSPRITE','surprised','','',''),
('M_ID','26','playForward','ASSIGN','WSPRITE','stress','','',''),
('M_ID','27','playForward','ASSIGN','WSPRITE','wave','','',''),
('M_ID','30','playDead','ASSIGN','WSPRITE','dead','','',''),
('M_ID','50','51','VIDEO','0','IDS_EXPLODE1','','',''),
('M_ID','51','21','PLAYWAVE','0','SOUND_EXPLODE','','',''),
('M_ID','empty','sitting','WAIT','','SIG_SHOW','','',''),
('M_ID','playDead','sitting','ASSIGN','BFRAME','0','
    MAP(WSPRITE,WPARM);
    SHOW(0,WSPRITE);
    VIDEO(0,WSPRITE);
    ANIMATE(0,0);
    ASSIGN(LENERGY,1);
    ASSIGN(LWEALTH,0);
    SIGNAL(SMP_VIAL,SIG_DRAIN);
    LOADVIEW(IDV_VIL8);
','',''),
('M_ID','playForward','sitting','ASSIGN','BFRAME','0','
    MAP(WSPRITE,WPARM);
    SHOW(WSPRITE);
    ANIMATE(0,V_REWIND); //PLAY FORWARD THEN BACK
','',''),
('M_ID','playOnce','sitting','ASSIGN','BFRAME','0','
    MAP(WSPRITE,WPARM);
    SHOW(0,WSPRITE);
    ANIMATE(0,0);
','',''),
('M_ID','setId','sitting','ASSIGN','WSPRITE','happy','
    MAP(WSPRITE,WPARM);
    ASSIGN(BFRAME,0);
    SHOW(WSPRITE);
','',''),
('M_ID','sitting','20','WAIT','0','SIG_HAPPY','','',''),
('M_ID','sitting','21','WAIT','0','SIG_HURT','','',''),
('M_ID','sitting','22','WAIT','0','SIG_KISS','','',''),
('M_ID','sitting','23','WAIT','0','SIG_MAD','','',''),
('M_ID','sitting','24','WAIT','0','SIG_SAD','','',''),
('M_ID','sitting','25','WAIT','0','SIG_SURPRISED','','',''),
('M_ID','sitting','26','WAIT','0','SIG_STRESS','','',''),
('M_ID','sitting','27','WAIT','0','SIG_WAVE','','',''),
('M_ID','sitting','30','WAIT','0','SIG_DEAD','','',''),
('M_ID','sitting','50','WAIT','0','SIG_BOMB','','',''),
('M_ID','sitting','100','WAIT','0','SIG_CLEAR','','',''),
('M_ID','sitting','0','WAIT','0','0','','',''),
('M_IDSPELL','0','checkObject','DROP','0','0','
    CLEAR(WVIEWID);
    SHOW(WOBJECT);
','',''),
('M_IDSPELL','0','0','WAIT','0','SIG_CLEAR','
    SHOW();
','',''),
('M_IDSPELL','benign','0','GRAB','0','0','
    SHOW();
','',''),
('M_IDSPELL','checkObject','itsAbomb','IS_A','WOBJECT','IDC_BOMB','','',''),
('M_IDSPELL','checkObject','itsAspell','IS_A','WOBJECT','IDC_SPELL','','',''),
('M_IDSPELL','checkObject','benign','Z_EPSILON','0','0','','',''),
('M_IDSPELL','itsAbomb','0','SPELL_ME','0','SIG_BOMB','','',''),
('M_IDSPELL','itsAspell','0','Z_EPSILON','','','
    if(WOBJECT == IDD_PROTECT){SHOW();SIGNAL(PROTECT_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_NYBREATH){SHOW();SIGNAL(NYBREATH_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_WETBREATH){SHOW();SIGNAL(WETBREATH_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_TELEKINESIS){SHOW();SIGNAL(TELEKINESIS_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_INVISIBLE){SHOW();SIGNAL(INVISIBLE_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_ENCHANT){SHOW(WOBJECT);SIGNAL(ENCHANT_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_HOLDING){SHOW(WOBJECT);SIGNAL(HOLDING_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_STALKER){SHOW(WOBJECT);SIGNAL(STALKING_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_TRANSFER){SHOW();SIGNAL(TRANSFER_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_DEATH){SHOW();SIGNAL(DEATH_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_BANISHMENT){SHOW();SIGNAL(BANISHMENT_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_BLINDNESS){SHOW();SIGNAL(BLINDNESS_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_HALUCINATE){SHOW();SIGNAL(HALUCINATE_ACTIVE,SIG_START);}
    if(WOBJECT == IDD_GVIAL){SHOW();SIGNAL(GOPA_ACTIVE,SIG_START);}
','',''),
('M_INSTANTATTACK','0','spellcast','WAIT','0','SIG_START','','',''),
('M_INSTANTATTACK','impact','0','Z_EPSILON','','','','',''),
('M_INSTANTATTACK','spellcast','impact','Z_EPSILON','','','
        if(WIP1 == TRANSFER){
            //this should read the other players stas and take them
            //MOV(WPARM,OWISDOM);MOV(BPARM,OKARMA;MOV(WTEMP1,OENERGY);
            ASSIGN(LWISDOM,39);
            SIGNALi(0,SID_ID);
            ASSIGN(LKARMA,1);
            SIGNAL(SID_HALO,SIG_ADD);
            ASSIGN(LENERGY,20);
            SIGNAL(SID_AURA,SIG_SUB);

        }
        if(WIP1 == DEATH){ 
            ASSIGN(LENERGY,1);
            SIGNAL(SID_AURA,SIG_SUB);
            ASSIGN(LWEALTH,0);SIGNAL(S1_VIALMETER,SIG_SHOW);
            SIGNAL(SID_ID,SIG_DEAD);
            SUBI(LKARMA,6);
        }
         if(WIP1 == BANISHMENT){
            MOV(WPARM,IDV_BANISH);
            LOADVIEW(WPARM);
            SUBI(LKARMA,2);
        }
         if(WIP1 == GOPA){
            ADDI(LENERGY,1);
            SIGNAL(SID_AURA,SIG_ADD);
        }
','',''),
('M_INV_LEFT','0','1','CLICK','0','0','','',''),
('M_INV_LEFT','1','2','SENDKEYI','KEY_LEFT','IDV_INVENTORY','','',''),
('M_INV_LEFT','2','0','PLAYWAVE','0','SOUND_CLICK','','',''),
('M_INV_RIGHT','0','1','CLICK','0','0','','',''),
('M_INV_RIGHT','1','2','SENDKEYI','KEY_RIGHT','IDV_INVENTORY','','',''),
('M_INV_RIGHT','2','0','PLAYWAVE','0','SOUND_CLICK','','',''),
('M_KAMALTAR','0','5','ACCEPT','','IDD_SEED','','',''),
('M_KAMALTAR','10','20','ASHOW','WOBJECT','','','',''),
('M_KAMALTAR','20','21','SIGNAL','WIP1','SIG_SHOW','','',''),
('M_KAMALTAR','21','0','GRAB','','','
    SHOW();
','',''),
('M_KAMALTAR','5','10','DROP','','','','',''),
('M_KAMDOOR','0','startChecking','WAIT','','SIG_CHECK','
/*
    Each change in moon disk rotation checks to see 
    which frame matches are present across all paired moons/disks.
    it checks to see if the moons are showing
    at all first (MEMSTONE(X)- R_WPARM), then 
    counts matches in WPARM up to the 7 required
*/
ASSIGN(WPARM,0);
','',''),
('M_KAMDOOR','allowEntry','0','CLICK','','','
    LOADVIEW(0,IDV_KAMIOZA);
','',''),
('M_KAMDOOR','fiveChecked','fourChecked','Z_EPSILON','','','
    REF_MACHINE(0,S27_MEMSTONE4);
    MOV(WTEMP1,R_BPARM);
     if (R_WPARM > 0) { 
        REF_MACHINE(0,S28_DISK4);
        MOV(WTEMP2,R_BPARM);
             if (WTEMP1 == (WTEMP2 - 1)) {
                ADD(WPARM,1);
            }}','',''),
('M_KAMDOOR','fourChecked','threeChecked','Z_EPSILON','','','
    REF_MACHINE(0,S27_MEMSTONE3);
    MOV(WTEMP1,R_BPARM);
     if (R_WPARM > 0) { 
        REF_MACHINE(0,S28_DISK3);
        MOV(WTEMP2,R_BPARM);
             if (WTEMP1 == (WTEMP2 - 1)) {
                ADD(WPARM,1);
            }}','',''),
('M_KAMDOOR','oneChecked','success','EQUAL','WPARM','7','','',''),
('M_KAMDOOR','oneChecked','0','Z_EPSILON','','','','',''),
('M_KAMDOOR','sevenChecked','sixChecked','Z_EPSILON','','','
    REF_MACHINE(0,S27_MEMSTONE6);
    MOV(WTEMP1,R_BPARM);
     if (R_WPARM > 0) { 
        REF_MACHINE(0,S28_DISK6);
        MOV(WTEMP2,R_BPARM);
             if (WTEMP1 == (WTEMP2 - 1)) {
                ADD(WPARM,1);
            }}','',''),
('M_KAMDOOR','showDoors','allowEntry','Z_EPSILON','','','
    SIGNAL(WIP1,SIG_SHOW);
    SIGNAL(WIP2,SIG_SHOW);
    SIGNAL(WIP3,SIG_SHOW);
    SIGNAL(WIP4,SIG_SHOW);
','',''),
('M_KAMDOOR','sixChecked','fiveChecked','Z_EPSILON','','','
    REF_MACHINE(0,S27_MEMSTONE5);
    MOV(WTEMP1,R_BPARM);
     if (R_WPARM > 0) { 
        REF_MACHINE(0,S28_DISK5);
        MOV(WTEMP2,R_BPARM);
             if (WTEMP1 == (WTEMP2 - 1)) {
                ADD(WPARM,1);
            }}','',''),
('M_KAMDOOR','startChecking','sevenChecked','Z_EPSILON','','','
    REF_MACHINE(0,S27_MEMSTONE7);
    MOV(WTEMP1,R_BPARM);
     if (R_WPARM > 0) { 
        REF_MACHINE(0,S28_DISK7);
        MOV(WTEMP2,R_BPARM);
             if (WTEMP1 == (WTEMP2 - 1)) {
                ADD(WPARM,1);
            }}','',''),
('M_KAMDOOR','success','showDoors','Z_EPSILON','0','','
    PLAYWAVE(SOUND_CHIMES);
    SHOW(IDS_KAMDOOR);
    ANIMATE();
    //show alt views and allow entry
','',''),
('M_KAMDOOR','threeChecked','twoChecked','Z_EPSILON','','','
    REF_MACHINE(0,S27_MEMSTONE2);
    MOV(WTEMP1,R_BPARM);
     if (R_WPARM > 0) { 
        REF_MACHINE(0,S28_DISK2);
        MOV(WTEMP2,R_BPARM);
            if (WTEMP1 == (WTEMP2 - 1)) {
                ADD(WPARM,1);
            }}','',''),
('M_KAMDOOR','twoChecked','oneChecked','Z_EPSILON','','','
    REF_MACHINE(0,S27_MEMSTONE1);
    MOV(WTEMP1,R_BPARM);
     if (R_WPARM > 0) { 
        REF_MACHINE(0,S28_DISK1);
        MOV(WTEMP2,R_BPARM);
            if (WTEMP1 == (WTEMP2 - 1)) {
                ADD(WPARM,1);
            }}','',''),
('M_KAMDOOR_alt','0','altViewShown','WAIT','','SIG_SHOW','
     SHOW(WIP1);
     ANIMATE();
','',''),
('M_KAMDOOR_alt','altViewShown','zoomed','CLICK','','','
     LOADVIEW(0,IDV_MOON5);
','',''),
('M_KAMDOOR_alt','altViewShown','0','WAIT','','SIG_HIDE','
     SHOW();
','',''),
('M_KAMDOOR_alt','zoomed','altViewShown','Z_EPSILON','','','','',''),
('M_KAMRAIN','0','1','WAIT','','SIG_SHOW','','',''),
('M_KAMRAIN','1','2','VIDEO','','IDS_RAIN','','',''),
('M_KAMRAIN','2','0','Z_EPSILON','','','','',''),
('M_LAPSPELL','0','turntOn','WAIT','0','SIG_START','
    SHOW(WIP1);
    SIGNAL(WIP2,SIG_START);
','',''),
('M_LAPSPELL','active','ended','WAIT','0','SIG_STOP','
    SHOW();
','',''),
('M_LAPSPELL','ended','0','Z_EPSILON','','','','',''),
('M_LAPSPELL','turntOn','active','Z_EPSILON','','','','',''),
('M_LEVDOOR','0','1','WAIT','0','SIG_OPEN','','',''),
('M_LEVDOOR','1','3','MOV','WSPRITE','WIP1','','',''),
('M_LEVDOOR','3','4','SHOW','WSPRITE','0','','',''),
('M_LEVDOOR','4','5','CLICK','','0','','',''),
('M_LEVDOOR','4','7','WAIT','0','SIG_CLOSE','','',''),
('M_LEVDOOR','5','4','LOADVIEW','WIP2','','','',''),
('M_LEVDOOR','7','0','SHOW','0','0','','',''),
('M_LEVER','0','1','MOV','BFRAME','0','','',''),
('M_LEVER','1','2','SHOW','WIP1','','','',''),
('M_LEVER','10','9','IFSTATEi','60','S21_LEVSTOP','','',''),
('M_LEVER','10','11','Z_EPSILON','','','','',''),
('M_LEVER','11','12','SUBI','BFRAME','1','','',''),
('M_LEVER','12','13','SIGNALi','SIG_CLOSE','S21_MAPOPEN','','',''),
('M_LEVER','13','14','SIGNALi','SIG_HIDE','S21_ALT_MAPBOX','','',''),
('M_LEVER','14','15','SIGNALi','SIG_HIDE','S21_ALT_LEVER','','',''),
('M_LEVER','15','16','PLAYWAVE','0','SOUND_LEVER','','',''),
('M_LEVER','16','2','SHOW','WIP1','','','',''),
('M_LEVER','2','3','CLICK','0','0','','',''),
('M_LEVER','3','4','PLAYWAVE','0','SOUND_LEVER','','',''),
('M_LEVER','4','6','ADDI','BFRAME','1','','',''),
('M_LEVER','6','7','SIGNALi','SIG_OPEN','S21_MAPOPEN','','',''),
('M_LEVER','7','8','SIGNALi','SIG_SHOW','S21_ALT_MAPBOX','','',''),
('M_LEVER','8','9','SIGNALi','SIG_SHOW','S21_ALT_LEVER','','',''),
('M_LEVER','9','10','ESTIME','','3','','',''),
('M_LEVSTOP','0','10','O_ACCEPT','0','IDD_ROCK','','',''),
('M_LEVSTOP','10','30','DROP','0','0','','',''),
('M_LEVSTOP','30','40','SHOW','WOBJECT','','','',''),
('M_LEVSTOP','40','50','PLAYWAVE','0','SOUND_CLICK','','',''),
('M_LEVSTOP','50','60','SIGNAL','WIP2','','','',''),
('M_LEVSTOP','60','70','GRAB','0','0','','',''),
('M_LEVSTOP','70','10','SHOW','0','0','','',''),
('M_LISTEN','0','1','CLICK','0','0','','',''),
('M_LISTEN','1','2','SENDMSG','WIP1','IDV_S_TELETYPE','','',''),
('M_LISTEN','2','3','PLAYWAVE','0','SOUND_CLICK','','',''),
('M_LISTEN','3','4','SHOW','0','IDS_REDEAR','','',''),
('M_LISTEN','4','5','CLICK','0','0','','',''),
('M_LISTEN','5','6','SENDMSG','WIP2','IDV_S_TELETYPE','','',''),
('M_LISTEN','6','7','PLAYWAVE','0','SOUND_CLICK','','',''),
('M_LISTEN','7','0','SHOW','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','0','1','CLICK','0','0','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_LUNCHPORTAL','1','0','LOADVIEW','0','IDV_LUNCHCU','','',''),
('M_MAPBUTTON','0','1','O_ACCEPT','0','IDD_MAPBTN','
   CLEAR(WOBJECT);
   SHOW();
','',''),
('M_MAPBUTTON','1','mapPresent','DROP','0','IDD_MAPBTN','
   SHOW(WOBJECT);
','',''),
('M_MAPBUTTON','mapPresent','requested','CLICK','0','0','
   PLAYWAVE(SOUND_POPUP);
','',''),
('M_MAPBUTTON','mapPresent','empty','GRAB','0','','','',''),
('M_MAPBUTTON','requested','mapPresent','LOADVIEW','0','IDV_CONTINENT','','',''),
('M_MATCHMAKER','0','BURNING','ASHOW','IDS_CANNY1','V_LOOP','ACCEPT(IDD_LOG);','',''),
('M_MATCHMAKER','BURNING','BURNING','DRAG','IDD_LOG','','PLAYWAVE(SOUND_FIRE);
HANDOFF(IDD_MATCH);','',''),
('M_MEFCURRENT','0','quest1','WAIT','','SIG_Q1','ASSIGN(BPARM,S33_NEELP);ASSIGN(WPARM,S33_NEELP_Q1);','',''),
('M_MEFCURRENT','0','quest1p','WAIT','','SIG_Q1P','ASSIGN(BPARM,S33_NEELP);ASSIGN(WPARM,NEELP_I1);','',''),
('M_MEFCURRENT','0','quest2','WAIT','','SIG_Q2','ASSIGN(BPARM,S11_NEELP);ASSIGN(WPARM,S11_NEELP_Q2);','',''),
('M_MEFCURRENT','0','quest2p','WAIT','','SIG_Q2P','ASSIGN(BPARM,S11_NEELP);ASSIGN(WPARM,NEELP_I2);','',''),
('M_MEFCURRENT','0','quest3','WAIT','','SIG_Q3','ASSIGN(BPARM,S30_NEELP);ASSIGN(WPARM,S30_NEELP_Q3);','',''),
('M_MEFCURRENT','0','quest3p','WAIT','','SIG_Q3P','ASSIGN(BPARM,S30_NEELP);ASSIGN(WPARM,NEELP_I3);','',''),
('M_MEFCURRENT','0','quest4','WAIT','','SIG_Q4','ASSIGN(BPARM,S24_RATHE);ASSIGN(WPARM,S24_RATHE_Q1);','',''),
('M_MEFCURRENT','0','quest4p','WAIT','','SIG_Q4P','ASSIGN(BPARM,S24_RATHE);ASSIGN(WPARM,RATHE_I1);','',''),
('M_MEFCURRENT','0','quest5','WAIT','','SIG_Q5','ASSIGN(BPARM,S25_RATHE);ASSIGN(WPARM,S25_RATHE_Q2);','',''),
('M_MEFCURRENT','0','quest5p','WAIT','','SIG_Q5P','ASSIGN(BPARM,S25_RATHE);ASSIGN(WPARM,RATHE_I2);','',''),
('M_MEFCURRENT','0','quest6','WAIT','','SIG_Q6','ASSIGN(BPARM,S10_THAOR);ASSIGN(WPARM,S10_THAOR_Q1);','',''),
('M_MEFCURRENT','0','quest6p','WAIT','','SIG_Q6P','ASSIGN(BPARM,S10_THAOR);ASSIGN(WPARM,THAOR_I1);','',''),
('M_MEFCURRENT','0','quest7','WAIT','','SIG_Q7','ASSIGN(BPARM,S19_THAOR);ASSIGN(WPARM,S19_THAOR_Q2);','',''),
('M_MEFCURRENT','0','quest7p','WAIT','','SIG_Q7P','ASSIGN(BPARM,S19_THAOR);ASSIGN(WPARM,THAOR_I2);','',''),
('M_MEFCURRENT','0','quest8','WAIT','','SIG_Q8','ASSIGN(BPARM,S16_PERST);ASSIGN(WPARM,S16_PERST_Q1);','',''),
('M_MEFCURRENT','0','quest8p','WAIT','','SIG_Q8P','ASSIGN(BPARM,S16_PERST);ASSIGN(WPARM,PERST_I1);','',''),
('M_MEFCURRENT','0','quest9','WAIT','','SIG_Q9','ASSIGN(BPARM,S12_PERST);ASSIGN(WPARM,S12_PERST_Q2);','',''),
('M_MEFCURRENT','0','quest9p','WAIT','','SIG_Q9P','ASSIGN(BPARM,S12_PERST);ASSIGN(WPARM,PERST_I2);','',''),
('M_MEFCURRENT','quest1','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest1p','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest2','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest2p','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest3','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest3p','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest4','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest4p','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest5','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest5p','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest6','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest6p','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest7','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest7p','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest8','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest8p','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest9','0','Z_EPSILON','','','','',''),
('M_MEFCURRENT','quest9p','0','Z_EPSILON','','','','',''),
('M_MEFLIN_DROP','0','postProcessObject','DROP','0','0','
    REF_MACHINE(MEFPAN_VIEWCAP);
    MOV(BPARM,R_BPARM);
    if(BPARM == 1){  //Theres a meflin up
        WRITE("MEFLIN INSPECTION");
        REF_MACHINE(MEFCURRENT); //Who is it?
        MOV(WPARM,R_WPARM);
        SIGNAL(WPARM,SIG_DROP); //so the meflin mef_talk can look at the wobject
        SHOW();
    }
','',''),
('M_MEFLIN_DROP','postProcessObject','0','Z_EPSILON','','','','',''),
('M_MEFPAN_OK','0','1','SHOW','0','IDS_BTN_OK','
    CLEAR(WPARM);
','',''),
('M_MEFPAN_OK','1','2','CLICK','0','0','
    REF_MACHINE(MEFCURRENT);
    PLAYWAVE(SOUND_POPUP);
    SIGNAL(R_WPARM,SIG_CLOSE);

    SIGNAL(MEFPAN_VIEWCAP,SIG_VIEWRETURN);
    SIGNAL(SOD_ID,SIG_SHOW);
    SIGNAL(MEFPAN_WAITER,SIG_RESET);

    SIGNAL(MEFPAN_PRIZE_A,SIG_RESET);
    SIGNAL(MEFPAN_PRIZE_B,SIG_RESET);
    SIGNAL(MEFPAN_PRIZE_C,SIG_RESET);
','',''),
('M_MEFPAN_OK','2','1','Z_EPSILON','','','','',''),
('M_MEFPAN_OKR','0','1','SHOW','0','IDS_BTN_OK','','',''),
('M_MEFPAN_OKR','1','2','CLICK','0','0','PLAYWAVE(SOUND_POPUP); SIGNALi(SIG_CLOSE,S24_RATHE_Q1);','',''),
('M_MEFPAN_OKR','2','0','LOADVIEW','WIP2','','','',''),
('M_MEFPAN_PRIZE','0','setup','Z_EPSILON','','','','',''),
('M_MEFPAN_PRIZE','pickPrize','showPrize','ASHOW','WOBJECT','','','',''),
('M_MEFPAN_PRIZE','setup','pickPrize','WAIT','0','SIG_SHOWPRIZE','
    REF_MACHINE(MEFCURRENT);
    REF_MACHINE(R_WPARM); 
    MOV(WPARM,R_WPARM); // Should be the cacheid
    mefPrize(WPARM,WIP1,?WOBJECT);
','',''),
('M_MEFPAN_PRIZE','showPrize','0','GRAB','','','
    SHOW(0);
','',''),
('M_MEFPAN_PRIZE','showPrize','0','WAIT','0','SIG_RESET','
    SHOW(0);
','',''),
('M_MEFPAN_SHOW_COORD','0','allBrandNew','Z_EPSILON','','','
    SIGNAL(S33_NEELP,SIG_SHOW); SIGNAL(S33_NEELP_alt1,SIG_SHOW); SIGNAL(S33_NEELP_alt2,SIG_SHOW);
    SIGNAL(S24_RATHE,SIG_SHOW);
    SIGNAL(S10_THAOR,SIG_SHOW);SIGNAL(S10_THAOR_alt1,SIG_SHOW);
    SIGNAL(S16_PERST,SIG_SHOW);SIGNAL(S16_PERST_alt1,SIG_SHOW);
','',''),
('M_MEFPAN_VIEWCAP','0','waiting','ASSIGN','BPARM','0','','',''),
('M_MEFPAN_VIEWCAP','viewGrabbed','waiting','Z_EPSILON','','','
      MOV(BPARM,1); // A Meflin is presently up
      MOV(WPARM,LVIEW);
','',''),
('M_MEFPAN_VIEWCAP','viewReloaded','waiting','Z_EPSILON','','','
      MOV(BPARM,0);// A Meflin is no longer there
      LOADVIEW(WPARM);
','',''),
('M_MEFPAN_VIEWCAP','waiting','viewGrabbed','WAIT','0','SIG_VIEWCAP','','',''),
('M_MEFPAN_VIEWCAP','waiting','viewReloaded','WAIT','0','SIG_VIEWRETURN','','',''),
('M_MEFPAN_WAITER','0','waiting','Z_EPSILON','','','
    REF_MACHINE(MEFCURRENT); //what mef are we hittin up
     PLAYWAVE(SOUND_POPUP);
     CLEAR(WPARM);
 ','',''),
('M_MEFPAN_WAITER','Q1P','waiting','Z_EPSILON','','','','',''),
('M_MEFPAN_WAITER','Q1S','waiting','Z_EPSILON','','','','',''),
('M_MEFPAN_WAITER','Q2P','waiting','Z_EPSILON','','','','',''),
('M_MEFPAN_WAITER','Q2S','waiting','Z_EPSILON','','','','',''),
('M_MEFPAN_WAITER','Q3P','waiting','Z_EPSILON','','','','',''),
('M_MEFPAN_WAITER','Q3S','waiting','Z_EPSILON','','','','',''),
('M_MEFPAN_WAITER','showPrizeText','0','Z_EPSILON','','','','',''),
('M_MEFPAN_WAITER','waiting','0','GRAB','WOBJECT','','SHOW(0);','',''),
('M_MEFPAN_WAITER','waiting','showPrizeText','WAIT','0','SIG_PRIZETEXT','
    REF_MACHINE(MEFCURRENT); //what mef are we hittin up
    REF_MACHINE(R_WPARM); //R_WPARM is the active mef machine
   CLEAR(BPARM);
   MOV(BPARM,R_BPARM);
   SETTEXT(ID_MEFTEXT,BPARM); //prize text
   
','',''),
('M_MEFPAN_WAITER','waiting','Q1S','WAIT','0','SIG_Q1S','
   
    if(R_BPARM == S33_NEELP){mefQuest("1",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WPARM);}
     if(R_BPARM == S24_RATHE){mefQuest("4",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WPARM);}
      if(R_BPARM == S10_THAOR){mefQuest("6",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WPARM);}
        if(R_BPARM == S16_PERST){mefQuest("8",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WPARM);}
       
        //Add any objects being offered here
        ASHOW(WOBJECT);
','',''),
('M_MEFPAN_WAITER','waiting','Q1P','WAIT','0','SIG_Q1P','
    if(R_BPARM == S33_NEELP){mefQuest("1",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WTEMP3);}
     if(R_BPARM == S24_RATHE){mefQuest("4",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WTEMP3);}
      if(R_BPARM == S10_THAOR){mefQuest("6",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WTEMP3);}
        if(R_BPARM == S16_PERST){mefQuest("8",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WTEMP3);}
  
','',''),
('M_MEFPAN_WAITER','waiting','Q2S','WAIT','0','SIG_Q2S','
      CLEAR(WPARM);
      CLEAR(WOBJECT);
      if(R_BPARM == S11_NEELP){mefQuest("2",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WPARM);}
       if(R_BPARM == S12_PERST){mefQuest("9",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WPARM);}
       if(R_BPARM == S25_RATHE){mefQuest("5",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WPARM);}
        if(R_BPARM == S19_THAOR){mefQuest("7",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WPARM);}
        ASHOW(WOBJECT);
','',''),
('M_MEFPAN_WAITER','waiting','Q2P','WAIT','0','SIG_Q2P','
  if(R_BPARM == S11_NEELP){mefQuest("2",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WTEMP3);}
  if(R_BPARM == S12_PERST){mefQuest("9",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WTEMP3);}
  if(R_BPARM == S25_RATHE){mefQuest("5",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WTEMP3);}
  if(R_BPARM == S19_THAOR){mefQuest("7",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WTEMP3);}
','',''),
('M_MEFPAN_WAITER','waiting','Q3S','WAIT','0','SIG_Q3S','
   CLEAR(WOBJECT);
   CLEAR(WPARM);
   if(R_BPARM == S30_NEELP){mefQuest("3",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WPARM);}
   ASHOW(WOBJECT);
','',''),
('M_MEFPAN_WAITER','waiting','Q3P','WAIT','0','SIG_Q3P','
   if(R_BPARM == S30_NEELP){mefQuest("3",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP3);SETTEXT(ID_MEFTEXT,WTEMP3);}
','',''),
('M_MEF_APPROACH','0','setup','MOV','WVIEWID','LVIEW','','',''),
('M_MEF_APPROACH','chillin','mef_bothered','CLICK','0','0','
CLEAR(WPARM);CLEAR(BPARM);SIGNAL(SOD_ID,SIG_CLEAR);','',''),
('M_MEF_APPROACH','chillin','vanished','WAIT','','SIG_VANISH','
    CLEAR(WSPRITE);
    SHOW(0);
','',''),
('M_MEF_APPROACH','mef_bothered','mef_response','REF_MACHINE','0','WIP3','
    if(IFSTATE(0,WIP3)){
        //Tell the active meflins coordinator
        SIGNAL(WIP3,SIG_Q1_START); ///--------------The first question and pending interogatve to any Meflin
            //Tell the outside world where we a
            //WTEMP1 will be machine, WTemp2 is wordin
            if(WIP2 == 1){SIGNAL(MEFCURRENT,SIG_Q1); mefQuest("1",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP1);}
            if(WIP2 == 2){SIGNAL(MEFCURRENT,SIG_Q4); mefQuest("4",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP1);}
            if(WIP2 == 3){SIGNAL(MEFCURRENT,SIG_Q6); mefQuest("6",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP1);}
            if(WIP2 == 4){SIGNAL(MEFCURRENT,SIG_Q8); mefQuest("8",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP1);}
    }
    if(IFSTATE(Q1Pending,WIP3)){
            if(WIP2 == 1){SIGNAL(MEFCURRENT,SIG_Q1P); mefQuest("1",?WTEMP1,?WTEMP1,?WOBJECT,?BPARM,?WPARM);}
            if(WIP2 == 2){SIGNAL(MEFCURRENT,SIG_Q4P); mefQuest("4",?WTEMP1,?WTEMP1,?WOBJECT,?BPARM,?WPARM);}
            if(WIP2 == 3){SIGNAL(MEFCURRENT,SIG_Q6P); mefQuest("6",?WTEMP1,?WTEMP1,?WOBJECT,?BPARM,?WPARM);}
            if(WIP2 == 4){SIGNAL(MEFCURRENT,SIG_Q8P); mefQuest("8",?WTEMP1,?WTEMP1,?WOBJECT,?BPARM,?WPARM);}
    }
    if(IFSTATE(Q1Solved,WIP3)){
        SIGNAL(WIP3,SIG_Q2_START); ///--------------The second question and pending interogative to any Meflin
        if(WIP2 == 1){SIGNAL(MEFCURRENT,SIG_Q2); mefQuest("2",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP1);}
        if(WIP2 == 2){SIGNAL(MEFCURRENT,SIG_Q5); mefQuest("5",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP1);}
        if(WIP2 == 3){SIGNAL(MEFCURRENT,SIG_Q7); mefQuest("7",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP1);}
        if(WIP2 == 4){SIGNAL(MEFCURRENT,SIG_Q9); mefQuest("9",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP1);}       
    }
    if(IFSTATE(Q2Pending,WIP3)){
        if(WIP2 == 1){SIGNAL(MEFCURRENT,SIG_Q2P); mefQuest("2",?WTEMP1,?WTEMP1,?WOBJECT,?BPARM,?WPARM);}
        if(WIP2 == 2){SIGNAL(MEFCURRENT,SIG_Q5P); mefQuest("5",?WTEMP1,?WTEMP1,?WOBJECT,?BPARM,?WPARM);}
        if(WIP2 == 3){SIGNAL(MEFCURRENT,SIG_Q7P); mefQuest("7",?WTEMP1,?WTEMP1,?WOBJECT,?BPARM,?WPARM);}
        if(WIP2 == 4){SIGNAL(MEFCURRENT,SIG_Q9P); mefQuest("9",?WTEMP1,?WTEMP1,?WOBJECT,?BPARM,?WPARM);}
    }
    if(IFSTATE(Q2Solved,WIP3)){
        SIGNAL(WIP3,SIG_Q3_START);  
         if(WIP2 == 1){SIGNAL(MEFCURRENT,SIG_Q3); mefQuest("3",?BPARM,?WPARM,?WOBJECT,?WTEMP1,?WTEMP1);}
    }
    if(IFSTATE(Q3Pending,WIP3)){
         WRITE("Q3Pending State found");
         if(WIP2 == 1){SIGNAL(MEFCURRENT,SIG_Q3P); mefQuest("3",?WTEMP1,?WTEMP1,?WOBJECT,?BPARM,?WPARM);}
    }
','',''),
('M_MEF_APPROACH','mef_response','chillin','Z_EPSILON','','','
    
    //Advance the individual meflin state WIP3 to pending states and play the machines
   //--Q3
    if(IFSTATE(Q3Pending,WIP3)){ SIGNAL(MEFPAN_VIEWCAP,SIG_VIEWCAP);LOADVIEW(IDV_MEFPAN);SIGNAL(MEFPAN_WAITER,SIG_Q3P); SIGNAL(BPARM,SIG_PLAY);}
    if(IFSTATE(Q3Started,WIP3)){  SIGNAL(MEFPAN_VIEWCAP,SIG_VIEWCAP);LOADVIEW(IDV_MEFPAN);SIGNAL(MEFPAN_WAITER,SIG_Q3S); SIGNAL(BPARM,SIG_PLAY); SIGNAL(WIP3,SIG_Q3_GIVEN);}
    //--Q2
    if(IFSTATE(Q2Pending,WIP3)){ SIGNAL(MEFPAN_VIEWCAP,SIG_VIEWCAP);LOADVIEW(IDV_MEFPAN);SIGNAL(MEFPAN_WAITER,SIG_Q2P); SIGNAL(BPARM,SIG_PLAY);}
    if(IFSTATE(Q2Started,WIP3)){ SIGNAL(MEFPAN_VIEWCAP,SIG_VIEWCAP);LOADVIEW(IDV_MEFPAN);SIGNAL(MEFPAN_WAITER,SIG_Q2S); SIGNAL(BPARM,SIG_PLAY); SIGNAL(WIP3,SIG_Q2_GIVEN);}
   
   // --Q1                                                                                                              PLAY THE RIGHT MACHINE , SET CALLING MEFLIN COORDINATOR
    if(IFSTATE(Q1Pending,WIP3)){ SIGNAL(MEFPAN_VIEWCAP,SIG_VIEWCAP);LOADVIEW(IDV_MEFPAN);SIGNAL(MEFPAN_WAITER,SIG_Q1P); SIGNAL(BPARM,SIG_PLAY);}
    if(IFSTATE(Q1Started,WIP3)){ SIGNAL(MEFPAN_VIEWCAP,SIG_VIEWCAP);LOADVIEW(IDV_MEFPAN);SIGNAL(MEFPAN_WAITER,SIG_Q1S); SIGNAL(BPARM,SIG_PLAY); SIGNAL(WIP3,SIG_Q1_GIVEN);}
   
','',''),
('M_MEF_APPROACH','setup','chillin','WAIT','','SIG_SHOW','
    MOV(WSPRITE,WIP1);
    ASHOW(WSPRITE,V_LOOP);
','',''),
('M_MEF_TALK','0','gotPlaySignal','WAIT','','SIG_PLAY','','',''),
('M_MEF_TALK','chatting','talkDone','MOV','BFRAME','0','
    SHOW(WIP4); //expression file
   // ANIMATE(10);
','',''),
('M_MEF_TALK','closed','0','Z_EPSILON','0','0','','',''),
('M_MEF_TALK','droppedItem','selectMeflin','REF_MACHINE','MEFCURRENT','','
     CLEAR(WPARM);
     CLEAR(WTEMP2);
     CLEAR(BPARM);
','',''),
('M_MEF_TALK','finishAprasal','givePrize','ESTIME','4','','
    SHOW(BFRAME);
    MOV(BFRAME,10); //may need frame 10 here
   // ANIMATE(0);
','',''),
('M_MEF_TALK','finishAprasal','closed','WAIT','','SIG_CLOSE','
    STOPWAVE();
    CLEAR(WSPRITE);
    SHOW();
','',''),
('M_MEF_TALK','givePrize','talkDone','Z_EPSILON','','','','',''),
('M_MEF_TALK','gotPlaySignal','prepLongTalk','MOV','WSPRITE','WIP1','','',''),
('M_MEF_TALK','neelpCheck','finishAprasal','Z_EPSILON','0','0','if(R_BPARM == S33_NEELP || R_BPARM == S11_NEELP || R_BPARM == S30_NEELP){ //-----NEELP------------------------------------------
        if(R_WPARM == NEELP_I1){mefResp(?WTEMP4,"1",?WPARM,?WTEMP1,?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
        if(R_WPARM == NEELP_I2){mefResp(?WTEMP4,"2",?WPARM,?WTEMP1,?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
        if(R_WPARM == NEELP_I3){mefResp(?WTEMP4,"3",?WPARM,?WTEMP1,?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
            if(WPARM == WOBJECT){
                MOV(WPARM,WTEMP3); // Move the prize cache id in so the prize boxes can get it
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_PRIZE_A,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_B,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_C,SIG_SHOWPRIZE);
                //Signal the quest solved - the new start happens whith the next approach
                     if(R_BPARM == S33_NEELP){
                        SIGNAL(NEELP_COORD,SIG_Q1_SOLVED);
                        SIGNAL(S33_NEELP,SIG_VANISH); SIGNAL(S33_NEELP_alt1,SIG_HIDE); SIGNAL(S33_NEELP_alt2,SIG_HIDE);
                        SIGNAL(S11_NEELP,SIG_SHOW);SIGNAL(S11_NEELP_alt1,SIG_SHOW);
                     }
                    if(R_BPARM == S11_NEELP){
                        SIGNAL(NEELP_COORD,SIG_Q2_SOLVED);
                        SIGNAL(S11_NEELP,SIG_VANISH); SIGNAL(S11_NEELP_alt1,SIG_HIDE);
                        SIGNAL(S30_NEELP,SIG_SHOW);SIGNAL(S30_NEELP_alt1,SIG_SHOW);
                    }
                    if(R_BPARM == S30_NEELP){
                        SIGNAL(NEELP_COORD,SIG_Q3_SOLVED);
                        SIGNAL(S30_NEELP,SIG_VANISH); SIGNAL(S30_NEELP_alt1,SIG_HIDE);
                    }
             //--------------
                MOV(WSPRITE,IDS_M1T1ANIM); //talking reply
                ASHOW(WSPRITE);
                PLAYWAVE(WTEMP2);
            }
            
            if(IS_A(WOBJECT,IDC_FISH) || IS_A(WOBJECT,IDC_BOMB) || IS_A(WOBJECT,IDC_PLANT) || IS_A(WOBJECT,IDC_GOPA) || IS_A(WOBJECT,IDC_SPELL)|| IS_A(WOBJECT,IDC_BAIT)){
            //alternatives here                                         SOUND   TEXT   CACHE   ANIMATE
           if(IS_A(WOBJECT,IDC_FISH)){mefResp("1",?WTEMP1,?WTEM4,"FISH",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_BOMB)){mefResp("1",?WTEMP1,?WTEM4,"BOMB",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_PLANT)){mefResp("1",?WTEMP1,?WTEM4,"PLANT",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_GOPA)){mefResp("1",?WTEMP1,?WTEM4,"GOPA",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_SPELL)){mefResp("1",?WTEMP1,?WTEM4,"SPELL",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_BAIT)){mefResp("1",?WTEMP1,?WTEM4,"BAIT",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
                MOV(WPARM,WTEMP3); // Move the prize cache id in so the prize boxes can get it
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_PRIZE_A,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_B,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_C,SIG_SHOWPRIZE);
                MOV(WSPRITE,IDS_M1T1ANIM); //talking reply
                ASHOW(WSPRITE);
                PLAYWAVE(WTEMP2);
             }   
        }           
','',''),
('M_MEF_TALK','perstCheck','finishAprasal','Z_EPSILON','0','0','if(R_BPARM == S16_PERST || R_BPARM == S12_PERST){ //-----PERST------------------------------------------
        if(R_WPARM == PERST_I1){mefResp(?WTEMP4,"8",?WPARM,?WTEMP1,?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
        if(R_WPARM == PERST_I2){mefResp(?WTEMP4,"9",?WPARM,?WTEMP1,?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
            if(WPARM == WOBJECT){
                MOV(WPARM,WTEMP3); // Move the prize cache id in so the prize boxes can get it
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_PRIZE_A,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_B,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_C,SIG_SHOWPRIZE);
                MOV(WSPRITE,IDS_M2T10000); //talking reply
                ASHOW(WSPRITE);
                PLAYWAVE(WTEMP2);
                    if(R_BPARM == S16_PERST){
                        SIGNAL(PERST_COORD,SIG_Q1_SOLVED);
                        SIGNAL(S16_PERST,SIG_VANISH); SIGNAL(S16_PERST_alt1,SIG_HIDE); 
                        SIGNAL(S12_PERST,SIG_SHOW);
                     }
                     if(R_BPARM == S12_PERST){
                        SIGNAL(PERST_COORD,SIG_Q2_SOLVED);
                        SIGNAL(S12_PERST,SIG_VANISH);
                     }
            }
            
             if(IS_A(WOBJECT,IDC_FISH) || IS_A(WOBJECT,IDC_BOMB) || IS_A(WOBJECT,IDC_PLANT) || IS_A(WOBJECT,IDC_SPELL)|| IS_A(WOBJECT,IDC_BAIT)){
            //alternatives here                                         SOUND   TEXT   CACHE   ANIMATE  
           if(IS_A(WOBJECT,IDC_FISH)){mefResp("2",?WTEMP1,?WTEM4,"FISH",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_BOMB)){mefResp("2",?WTEMP1,?WTEM4,"BOMB",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_PLANT)){mefResp("2",?WTEMP1,?WTEM4,"PLANT",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_SPELL)){mefResp("2",?WTEMP1,?WTEM4,"SPELL",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_BAIT)){mefResp("2",?WTEMP1,?WTEM4,"BAIT",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
                MOV(WPARM,WTEMP3); // Move the prize cache id in so the prize boxes can get it
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_PRIZE_A,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_B,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_C,SIG_SHOWPRIZE);
                MOV(WSPRITE,IDS_M2T10000); //talking reply
                ASHOW(WSPRITE);
                PLAYWAVE(WTEMP2);
             }   
        }
','',''),
('M_MEF_TALK','prepLongTalk','startPlayingTalkFile','ASHOW','WSPRITE','','
PLAYWAVE(WIP3);
','',''),
('M_MEF_TALK','ratheCheck','finishAprasal','Z_EPSILON','0','0','if(R_BPARM == S24_RATHE || R_BPARM == S25_RATHE){ //-----RATHE------------------------------------------
        if(R_WPARM == RATHE_I1){mefResp(?WTEMP4,"4",?WPARM,?WTEMP1,?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
        if(R_WPARM == RATHE_I2){mefResp(?WTEMP4,"5",?WPARM,?WTEMP1,?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
            if(WPARM == WOBJECT){
                MOV(WPARM,WTEMP3); // Move the prize cache id in so the prize boxes can get it
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_PRIZE_A,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_B,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_C,SIG_SHOWPRIZE);
                MOV(WSPRITE,IDS_M6T10000); //talking reply
                ASHOW(WSPRITE);
                PLAYWAVE(WTEMP2);
                   if(R_BPARM == S24_RATHE){
                        SIGNAL(RATHE_COORD,SIG_Q1_SOLVED);
                        SIGNAL(S24_RATHE,SIG_VANISH);
                        SIGNAL(S25_RATHE,SIG_SHOW);
                     }
                     if(R_BPARM == S25_RATHE){
                        SIGNAL(RATHE_COORD,SIG_Q2_SOLVED);
                        SIGNAL(S25_RATHE,SIG_VANISH);
                     }
            }
            
            if(IS_A(WOBJECT,IDC_BOMB) || IS_A(WOBJECT,IDC_PLANT) || IS_A(WOBJECT,IDC_SPELL)|| IS_A(WOBJECT,IDC_BAIT) || IS_A(WOBJECT,IDC_GOPA)){
            //alternatives here                                         SOUND   TEXT   CACHE   ANIMATE
           if(IS_A(WOBJECT,IDC_FISH)){mefResp("4",?WTEMP1,?WTEM4,"GOPA",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_BOMB)){mefResp("4",?WTEMP1,?WTEM4,"BOMB",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_PLANT)){mefResp("4",?WTEMP1,?WTEM4,"PLANT",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_SPELL)){mefResp("4",?WTEMP1,?WTEM4,"SPELL",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_BAIT)){mefResp("4",?WTEMP1,?WTEM4,"BAIT",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
                MOV(WPARM,WTEMP3); // Move the prize cache id in so the prize boxes can get it
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_PRIZE_A,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_B,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_C,SIG_SHOWPRIZE);
                MOV(WSPRITE,IDS_M6T10000); //talking reply
                ASHOW(WSPRITE);
                PLAYWAVE(WTEMP2);
             }   
        }
','',''),
('M_MEF_TALK','selectMeflin','neelpCheck','EQUAL','R_BPARM','S33_NEELP','','',''),
('M_MEF_TALK','selectMeflin','neelpCheck','EQUAL','R_BPARM','S11_NEELP','','',''),
('M_MEF_TALK','selectMeflin','neelpCheck','EQUAL','R_BPARM','S30_NEELP','','',''),
('M_MEF_TALK','selectMeflin','ratheCheck','EQUAL','R_BPARM','S24_RATHE','','',''),
('M_MEF_TALK','selectMeflin','thaorCheck','EQUAL','R_BPARM','S10_THAOR','','',''),
('M_MEF_TALK','selectMeflin','thaorCheck','EQUAL','R_BPARM','S19_THAOR','','',''),
('M_MEF_TALK','selectMeflin','perstCheck','EQUAL','R_BPARM','S16_PERST','','',''),
('M_MEF_TALK','selectMeflin','perstCheck','EQUAL','R_BPARM','S12_PERST','','',''),
('M_MEF_TALK','selectMeflin','ratheCheck','EQUAL','R_BPARM','S25_RATHE','','',''),
('M_MEF_TALK','startPlayingTalkFile','chatting','ESTIME','WIP2','','','',''),
('M_MEF_TALK','startPlayingTalkFile','closed','WAIT','','SIG_CLOSE','
    STOPWAVE();
    CLEAR(WSPRITE);
    SHOW();
','',''),
('M_MEF_TALK','talkDone','closed','WAIT','','SIG_CLOSE','
    STOPWAVE();
    CLEAR(WSPRITE);
    SHOW();
','',''),
('M_MEF_TALK','talkDone','droppedItem','WAIT','0','SIG_DROP','
   // REF_MACHINE(SOD_SPELL);
    REF_MACHINE(MEF_DROPTARGET);
    MOV(WOBJECT,R_WOBJECT);
','',''),
('M_MEF_TALK','thaorCheck','finishAprasal','Z_EPSILON','0','0','if(R_BPARM == S10_THAOR || R_BPARM == S19_THAOR){ //-----THAOR------------------------------------------
        if(R_WPARM == THAOR_I1){mefResp(?WTEMP4,"6",?WPARM,?WTEMP1,?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
        if(R_WPARM == THAOR_I2){mefResp(?WTEMP4,"7",?WPARM,?WTEMP1,?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
            if(WPARM == WOBJECT){
                MOV(WPARM,WTEMP3); // Move the prize cache id in so the prize boxes can get it
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_PRIZE_A,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_B,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_C,SIG_SHOWPRIZE);
                MOV(WSPRITE,IDS_MYT10000); //talking reply
                ASHOW(WSPRITE);
                PLAYWAVE(WTEMP2);
                    if(R_BPARM == S10_THAOR){
                        SIGNAL(THAOR_COORD,SIG_Q1_SOLVED);
                        SIGNAL(S10_THAOR,SIG_VANISH); SIGNAL(S10_THAOR_alt1,SIG_HIDE); 
                        SIGNAL(S19_THAOR,SIG_SHOW);SIGNAL(S19_THAOR_alt1,SIG_SHOW);
                     }
                     if(R_BPARM == S19_THAOR){
                        SIGNAL(THAOR_COORD,SIG_Q2_SOLVED);
                        SIGNAL(S19_THAOR,SIG_VANISH);SIGNAL(S19_THAOR_alt1,SIG_HIDE);
                     }
            }
            
            if(IS_A(WOBJECT,IDC_BOMB) || IS_A(WOBJECT,IDC_SPELL)|| IS_A(WOBJECT,IDC_BAIT)){
            //alternatives here                                         SOUND   TEXT   CACHE   ANIMATE  
           if(IS_A(WOBJECT,IDC_BOMB)){mefResp("3",?WTEMP1,?WTEM4,"BOMB",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_SPELL)){mefResp("3",?WTEMP1,?WTEM4,"SPELL",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
           if(IS_A(WOBJECT,IDC_BAIT)){mefResp("3",?WTEMP1,?WTEM4,"BAIT",?WTEMP2,?BPARM,?WTEMP3,?BFRAME);}
                MOV(WPARM,WTEMP3); // Move the prize cache id in so the prize boxes can get it
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_WAITER,SIG_PRIZETEXT);
                SIGNAL(MEFPAN_PRIZE_A,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_B,SIG_SHOWPRIZE);
                SIGNAL(MEFPAN_PRIZE_C,SIG_SHOWPRIZE);
                MOV(WSPRITE,IDS_MYT10000); //talking reply
                ASHOW(WSPRITE);
                PLAYWAVE(WTEMP2);
             }   
        }
','',''),
('M_MEMOBJ','0','1','O_ACCEPT','WIP1','','','',''),
('M_MEMOBJ','1','2','DROP','0','','','',''),
('M_MEMOBJ','11','12','SIGNALi','SIG_SHOW','S27_MEMSTONE1','','',''),
('M_MEMOBJ','12','13','SIGNALi','SIG_SHOW','S27_MEMSTONE2','','',''),
('M_MEMOBJ','13','14','SIGNALi','SIG_SHOW','S27_MEMSTONE3','','',''),
('M_MEMOBJ','14','15','SIGNALi','SIG_SHOW','S27_MEMSTONE4','','',''),
('M_MEMOBJ','15','16','SIGNALi','SIG_SHOW','S27_MEMSTONE5','','',''),
('M_MEMOBJ','16','17','SIGNALi','SIG_SHOW','S27_MEMSTONE6','','',''),
('M_MEMOBJ','17','18','SIGNALi','SIG_SHOW','S27_MEMSTONE7','','',''),
('M_MEMOBJ','18','20','GRAB','WIP1','','','',''),
('M_MEMOBJ','2','3','MOV','WSPRITE','WIP3','','',''),
('M_MEMOBJ','20','21','CLEAR','WOBJECT','','','',''),
('M_MEMOBJ','21','22','CLEAR','WPARM','','','',''),
('M_MEMOBJ','22','23','CLEAR','WSPRITE','','','',''),
('M_MEMOBJ','23','30','SHOW','','','','',''),
('M_MEMOBJ','3','4','SHOW','WSPRITE','','','',''),
('M_MEMOBJ','30','31','SIGNALi','SIG_HIDE','S27_MEMSTONE1','','',''),
('M_MEMOBJ','31','32','SIGNALi','SIG_HIDE','S27_MEMSTONE2','','',''),
('M_MEMOBJ','32','33','SIGNALi','SIG_HIDE','S27_MEMSTONE3','','',''),
('M_MEMOBJ','33','34','SIGNALi','SIG_HIDE','S27_MEMSTONE4','','',''),
('M_MEMOBJ','34','35','SIGNALi','SIG_HIDE','S27_MEMSTONE5','','',''),
('M_MEMOBJ','35','36','SIGNALi','SIG_HIDE','S27_MEMSTONE6','','',''),
('M_MEMOBJ','36','0','SIGNALi','SIG_HIDE','S27_MEMSTONE7','','',''),
('M_MEMOBJ','4','5','ASSIGN','BPARM','WIP1','','',''),
('M_MEMOBJ','5','11','IFSTATE','18','WIP4','','',''),
('M_MEMOBJ','5','18','Z_EPSILON','','','','',''),
('M_MEMORY','0','1','WAIT','','SIG_SHOW','','',''),
('M_MEMORY','1','2','RAND','8','0','','',''),
('M_MEMORY','2','3','MOV','BFRAME','WRAND','','',''),
('M_MEMORY','3','4','SHOW','WIP1','','MOV(BPARM,BFRAME);ASSIGN(WPARM,1);','',''),
('M_MEMORY','4','5','WAIT','','SIG_HIDE','','',''),
('M_MEMORY','5','6','CLEAR','WSPRITE','','','',''),
('M_MEMORY','6','0','SHOW','','','','',''),
('M_NATURE','0','1','WAIT','0','SIG_OPEN','','',''),
('M_NATURE','1','2','ESTIME','','4','','',''),
('M_NATURE','2','3','SIGNALi','SIG_OPEN','S03_BIRDSFWD','','',''),
('M_NATURE','3','4','ESTIME','10','10','','',''),
('M_NATURE','4','5','SIGNALi','SIG_OPEN','S03_BIRDSBKWD','','',''),
('M_NATURE','5','6','SIGNALi','SIG_OPEN','S12_BUTTERFLY','','',''),
('M_NATURE','6','7','SIGNALi','SIG_RIPEN','S16_GOPABUSH','','',''),
('M_NATURE','7','8','SIGNALi','SIG_RIPEN','S10_GOPABUSH','','',''),
('M_NATURE','8','1','ESTIME','','300','','',''),
('M_OBJECTBIN','0','0','GRAB','WIP1','','','',''),
('M_OBJECTMAP','0','1','DRAG','WIP1','','','',''),
('M_OBJECTMAP','1','2','HANDOFF','WIP2','','','',''),
('M_OBJECTMAP','2','0','PLAYWAVE','WIP3','','','',''),
('M_OLIEOLIE','0','1','WAIT','','SIG_CHECK','','',''),
('M_OLIEOLIE','1','0','Z_EPSILON','','','
if ( (IFSTATE(firstWhack, S00_HIDDEN_1)) ){WRITE("Place 1 IDV_PATH2");}

      if( (IFSTATE(firstWhack, S00_HIDDEN_2)) ){
         WRITE("Place 2 IDV_MOON3");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_3)) ){
         WRITE("Place 3 IDV_MOON5");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_4 )) ){
         WRITE("Place 4 IDV_EYEB");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_5 )) ){
         WRITE("Place 5 IDV_WR3");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_6 )) ){
         WRITE("Place 6 IDV_CTO1");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_7 )) ){
         WRITE("Place 7 IDV_VIL4");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_8 )) ){
         WRITE("Place 8 IDV_TMPLPTH5");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_9)) ){
         WRITE("Place 9 IDV_EYEB");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_10 )) ){
         WRITE("Place 10 IDV_WR2");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_11 )) ){
         WRITE("Place 11 IDV_SCN10PT0");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_12 )) ){
         WRITE("Place 12 IDV_FA1PAN");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_13 )) ){
         WRITE("Place 13 IDV_FA1PAN");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_14 )) ){
         WRITE("Place 14 IDV_FH1PTH1");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_15 )) ){
         WRITE("Place 15 IDV_SCN10PT0");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_16 )) ){
         WRITE("Place 16 IDV_CTO3");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_17 )) ){
         WRITE("Place 17 IDV_CTO2");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_18 )) ){
         WRITE("Place 18 IDV_ctyh");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_19 )) ){
         WRITE("Place 19 IDV_TMPLPTH5");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_20 )) ){
         WRITE("Place 20nIDV_SCN10PT0");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_21 )) ){
         WRITE("Place 21 IDV_WR3");
      }
      if( (IFSTATE(firstWhack, S00_HIDDEN_22 )) ){
         WRITE("Place 22 IDV_WR3");
      }

','',''),
('M_ORIESPEAKER','0','1','O_ACCEPT','0','IDD_SPEAKER','','',''),
('M_ORIESPEAKER','1','2','DROP','0','0','','',''),
('M_ORIESPEAKER','2','3','ASSIGN','WOBJECT','IDD_SPEAKER','','',''),
('M_ORIESPEAKER','2','3','ASSIGN','WOBJECT','IDD_SPEAKER','','',''),
('M_ORIESPEAKER','2','3','ASSIGN','WOBJECT','IDD_SPEAKER','','',''),
('M_ORIESPEAKER','3','4','SHOW','WOBJECT','','','',''),
('M_ORIESPEAKER','4','5','PLAYWAVE','WIP3','','','',''),
('M_ORIESPEAKER','5','6','GRAB','0','0','','',''),
('M_ORIESPEAKER','6','1','SHOW','0','0','','',''),
('M_O_AURA','0','2','WAIT','0','SIG_ADD','','',''),
('M_O_AURA','0','3','WAIT','0','SIG_SUB','','',''),
('M_O_AURA','0','30','WAIT','0','SIG_CLEAR','','',''),
('M_O_AURA','0','2','WAIT','0','0','','',''),
('M_O_AURA','2','4','ASSIGN','WPARM','0','','',''),
('M_O_AURA','3','4','ASSIGN','WPARM','V_REVERSE','','',''),
('M_O_AURA','30','0','SHOW','0','0','','',''),
('M_O_AURA','4','5','MOV','WSPRITE','OENERGY','','',''),
('M_O_AURA','5','6','MODI','WSPRITE','MAX_AURAS','','',''),
('M_O_AURA','6','7','ADDI','WSPRITE','IDS_AURA1','','',''),
('M_O_AURA','7','8','SHOW','WSPRITE','','','',''),
('M_O_AURA','8','9','ANIMATE','WPARM','','','',''),
('M_O_AURA','9','0','SIGNALi','0','SOD_ID','','',''),
('M_O_IDSPELL','0','postProcessObject','DROP','0','0','
    REF_MACHINE(MEFPAN_VIEWCAP);
    MOV(BPARM,R_BPARM);
    if(R_BPARM == 1){  //Theres a meflin up
        REF_MACHINE(MEFCURRENT); //Who is it?
        MOV(WPARM,R_WPARM);
        SIGNAL(WPARM,SIG_DROP); //so the meflin mef_talk can look at the wobject
        SHOW();
    }
','',''),
('M_O_IDSPELL','0','cleared','WAIT','0','SIG_CLEAR','
    SHOW();
','',''),
('M_O_IDSPELL','benign','0','GRAB','0','0','
    SHOW();
','',''),
('M_O_IDSPELL','checkObject','itsAbomb','IS_A','WOBJECT','IDC_BOMB','','',''),
('M_O_IDSPELL','checkObject','itsAspell','IS_A','WOBJECT','IDC_SPELL','','',''),
('M_O_IDSPELL','checkObject','benign','Z_EPSILON','0','0','
    SHOW(WOBJECT);
','',''),
('M_O_IDSPELL','itsAbomb','0','SPELL_ME','0','SIG_BOMB','','',''),
('M_O_IDSPELL','itsAspell','0','Z_EPSILON','','','
        SHOW();
        if(WOBJECT == IDD_PROTECT){SHOW();SIGNAL(PROTECT_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_NYBREATH){SHOW();SIGNAL(NYBREATH_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_WETBREATH){SHOW();SIGNAL(WETBREATH_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_TELEKINESIS){SHOW();SIGNAL(TELEKINESIS_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_INVISIBLE){SHOW();SIGNAL(INVISIBLE_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_ENCHANT){SHOW(WOBJECT);SIGNAL(ENCHANT_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_HOLDING){SHOW(WOBJECT);SIGNAL(HOLDING_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_STALKER){SHOW(WOBJECT);SIGNAL(STALKING_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_TRANSFER){SHOW();SIGNAL(TRANSFER_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_DEATH){SHOW();SIGNAL(DEATH_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_BANISHMENT){SHOW();SIGNAL(BANISHMENT_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_BLINDNESS){SHOW();SIGNAL(BLINDNESS_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_HALUCINATE){SHOW();SIGNAL(HALUCINATE_ACTIVE,SIG_START);}
        if(WOBJECT == IDD_GVIAL){SHOW();SIGNAL(GOPA_ACTIVE,SIG_START);}
','',''),
('M_O_IDSPELL','postProcessObject','checkObject','NEQUAL','BPARM','1','
      
','',''),
('M_O_IDSPELL','postProcessObject','0','Z_EPSILON','','','','',''),
('M_O_PED','0','1','GRAB','0','0','','',''),
('M_O_PED','0','1','WAIT','0','0','','',''),
('M_PARCHBIG_WAITER','0','waiting','Z_EPSILON','','','
        REF_MACHINE(SMP_EYEINFO);
','',''),
('M_PARCHBIG_WAITER','showDiary','0','Z_EPSILON','','','','',''),
('M_PARCHBIG_WAITER','waiting','showDiary','WAIT','0','SIG_DIARY1','
        predicate diary(object,control,content);
        diary(R_WPARM,?BPARM,?WPARM);
        LOADVIEW(IDV_PARCHBIG);
        SETTEXT(ID_PARCHBIGTXT,WPARM);
       
','',''),
('M_PLANTBIN','0','1','MOV','WSPRITE','WIP2','','',''),
('M_PLANTBIN','1','5','SHOW','WSPRITE','','','',''),
('M_PLANTBIN','10','20','SHOW','0','0','','',''),
('M_PLANTBIN','20','30','ESTIME','WIP3','','','',''),
('M_PLANTBIN','30','40','MOV','WSPRITE','WIP2','','',''),
('M_PLANTBIN','40','5','SHOW','WSPRITE','','','',''),
('M_PLANTBIN','5','10','GRAB','WIP1','','','',''),
('M_POLESTAND','0','1','ASSIGN','WOBJECT','IDD_POLE1','','',''),
('M_POLESTAND','1','2','SHOW','WOBJECT','','','',''),
('M_POLESTAND','2','3','GRAB','0','0','','',''),
('M_POLESTAND','3','4','SHOW','0','0','','',''),
('M_POLESTAND','4','5','C_ACCEPT','0','IDC_POLE','','',''),
('M_POLESTAND','5','1','DROP','0','0','','',''),
('M_PORTAL','0','portal','CLICK','','','LOADVIEW(WIP1);','',''),
('M_PORTAL','portal','0','Z_EPSILON','0','','','',''),
('M_QANIPORTAL','0','1','MOV','WSPRITE','WIP1','','',''),
('M_QANIPORTAL','1','2','ASHOW','WSPRITE','V_LOOP','','',''),
('M_QANIPORTAL','2','3','CLICK','0','0','','',''),
('M_QANIPORTAL','3','1','LOADVIEW','0','WIP3','','',''),
('M_RACEGATE','0','1','CLICK','0','','
    REF_MACHINE(S19_COVER1);
    if( (IFSTATE(done,S19_COVER1)) 
     && ( IFSTATE(done,S19_COVER2)) 
     && ( IFSTATE(done,S19_COVER3)) ){
        LOADVIEW(WIP1);
        SIGNAL(S16_CONTINENTPOINT,SIG_UNLOCK);
     }
','',''),
('M_RACEGATE','1','0','Z_EPSILON','0','','','',''),
('M_RECORD_COMPLETE','0','100','WAIT','0','SIG_COMPLETE','ASSIGN(WSPRITE,WIP1);SHOW(WIP1);','',''),
('M_RECORD_COMPLETE','100','101','WAIT','0','SIG_RESET','','',''),
('M_RECORD_COMPLETE','101','0','Z_EPSILON','','','CLEAR(WSPRITE);SHOW();','',''),
('M_RECORD_COUNTER','0','0','WAIT','0','SIG_COUNT','ADDi(WPARM,1);','',''),
('M_RECYCLE','0','1','DROP','0','0','','',''),
('M_RECYCLE','1','0','VIDEO','0','IDS_SMBURST','','',''),
('M_REC_COMPLETE','0','100','WAIT','0','SIG_COMPLETE','ASSIGN(WSPRITE,WIP1);SHOW(WIP1);','',''),
('M_REC_COMPLETE','100','101','WAIT','0','SIG_RESET','','',''),
('M_REC_COMPLETE','101','0','Z_EPSILON','','','CLEAR(WSPRITE);SHOW();','',''),
('M_REC_COUNTER','0','0','WAIT','0','SIG_COUNT','ADDi(WPARM,1);','',''),
('M_SIGNPORTAL','0','portalOpen','DRAG','0','IDD_EYEWAND','
    LOADVIEW(IDV_SIGNPANENG);
','',''),
('M_SIGNPORTAL','portalOpen','0','DRAG','0','IDD_EYEWAND','
    LOADVIEW(IDV_SIGNPAN);
','',''),
('M_SIGNTRANS','0','portalOpen','DRAG','0','IDD_EYEWAND','LOADVIEW(IDV_SIGNPANENG);','',''),
('M_SIGNTRANS','portalOpen','0','Z_EPSILON','0','','','',''),
('M_SPELLTIMER','0','timerStarted','WAIT','0','SIG_START','
  WPARM = LWISDOM*WIP1;
  if ( WIP2 == NYBREATH_ACTIVE ){
    WPARM = 12;
  }
  

','',''),
('M_SPELLTIMER','spellStopped','0','Z_EPSILON','','','','',''),
('M_SPELLTIMER','timerDone','spellStopped','SIGNAL','WIP2','SIG_STOP','','',''),
('M_SPELLTIMER','timerStarted','timerDone','ESTIME','','WPARM','','',''),
('M_SQUARE','0','1','C_ACCEPT','0','IDC_TOKEN','','',''),
('M_SQUARE','1','5','Z_EPSILON','','','
CLEAR(WOBJECT);
CLEAR(WPARM);
SHOW();','',''),
('M_SQUARE','10','40','SHOW','WOBJECT','','
ANIMATE(V_LOOP);
PLAYWAVE(SOUND_CLICK);
MOV(WPARM,WOBJECT);','',''),
('M_SQUARE','110','10','DROP','','','
HANDOFF(WPARM);
CLEAR(WPARM);','',''),
('M_SQUARE','110','1','GRAB','WPARM','','','',''),
('M_SQUARE','110','1','WAIT','0','SIG_CLEAR','','',''),
('M_SQUARE','40','47','NEQUALi','WPARM','IDD_REVERSIA','','',''),
('M_SQUARE','40','110','Z_EPSILON','','','ASSIGN(WPARM, IDD_REVERSIB);','',''),
('M_SQUARE','47','110','NEQUALi','WPARM','IDD_REVERSIB','','',''),
('M_SQUARE','47','110','Z_EPSILON','','','ASSIGN(WPARM, IDD_REVERSIA);','',''),
('M_SQUARE','5','10','DROP','0','0','','',''),
('M_SQUARE','5','10','WAIT','0','SIG_SET','MOV(WOBJECT,WTEMP1);','',''),
('M_STATEDOOR','0','1','MOV','WSPRITE','WIP2','','',''),
('M_STATEDOOR','1','2','SHOW','WSPRITE','0','','',''),
('M_STATEDOOR','10','0','WAIT','0','SIG_CLOSE','','',''),
('M_STATEDOOR','2','3','WAIT','0','SIG_OPEN','','',''),
('M_STATEDOOR','3','5','MOV','WSPRITE','WIP1','','',''),
('M_STATEDOOR','5','10','SHOW','WSPRITE','0','','',''),
('M_STATESCALE','0','1','WAIT','0','SIG_SHOW','','',''),
('M_STATESCALE','1','5','MOV','WSPRITE','WIP1','','',''),
('M_STATESCALE','10','11','WAIT','0','SIG_HIDE','','',''),
('M_STATESCALE','11','0','SHOW','0','0','','',''),
('M_STATESCALE','5','10','SHOW','WSPRITE','0','','',''),
('M_STATESCALEV','0','5','WAIT','0','SIG_SHOW','','',''),
('M_STATESCALEV','10','11','WAIT','0','SIG_HIDE','','',''),
('M_STATESCALEV','11','0','ASHOW','0','0','','',''),
('M_STATESCALEV','5','10','ASHOW','WIP1','0','','',''),
('M_TALK','0','2','MOV','WSPRITE','WIP4','','',''),
('M_TALK','10','11','CLICK','0','0','','',''),
('M_TALK','10','20','WAIT','0','0','','',''),
('M_TALK','11','12','MOV','WPARM','WTHIS','','',''),
('M_TALK','12','13','SUBI','WPARM','SMP_TALK1','','',''),
('M_TALK','13','14','SENDKEY','WPARM','IDV_S_TELETYPE','','',''),
('M_TALK','14','15','ASSIGN','WPARM','0','','',''),
('M_TALK','15','16','PLAYWAVE','0','SOUND_CLICK','','',''),
('M_TALK','16','17','SHOW','0','IDS_REDDOT','','',''),
('M_TALK','17','18','SIGNAL','WIP1','','','',''),
('M_TALK','18','19','SIGNAL','WIP2','','','',''),
('M_TALK','19','10','SIGNAL','WIP3','','','',''),
('M_TALK','2','10','SHOW','WSPRITE','0','','',''),
('M_TALK','20','10','SHOW','0','0','','',''),
('M_TEST1','0','0','CLICK','0','0','
    ASSIGN(LENERGY,4);
    SIGNAL(SID_AURA,SIG_ADD);
','',''),
('M_TEST2','0','0','CLICK','0','0','
    ADDI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_ADD);
    ','',''),
('M_TEST3','0','0','CLICK','0','0','
    SUBI(LENERGY,1);
    SIGNAL(SID_AURA,SIG_SUB);
    ','',''),
('M_TEST4','0','0','CLICK','0','0','
    ASSIGN(LKARMA,0);
    SIGNAL(SID_HALO,SIG_ADD);
','',''),
('M_TEST5','0','0','CLICK','0','0','
    ADDI(LKARMA,1);
    SIGNAL(SID_HALO,SIG_ADD);
    ','',''),
('M_TEST6','0','0','CLICK','0','0','
    SUBI(LKARMA,1);
    SIGNAL(SID_HALO,SIG_SUB);
    ','',''),
('M_TEST7','0','0','CLICK','0','0','
    ASSIGN(LWISDOM,2);
    SIGNALi(0,SID_ID);
','',''),
('M_TEST8','0','0','CLICK','0','0','
    ASSIGN(LWISDOM,25);
    SIGNALi(0,SID_ID);
','',''),
('M_TEST9','0','0','CLICK','0','0','
    ASSIGN(LWISDOM,40);
    ASSIGN(LSEX,1);
    SIGNALi(0,SID_ID);
','',''),
('M_TEXT_DOWN','0','1','CLICK','0','0','','',''),
('M_TEXT_DOWN','1','2','PLAYWAVE','0','SOUND_CLICK','','',''),
('M_TEXT_DOWN','2','3','SENDMSGI','10','IDV_S_TELETYPE','','',''),
('M_TEXT_DOWN','3','4','EMTIME','0','250','','',''),
('M_TEXT_DOWN','4','0','SENDMSGI','11','IDV_S_TELETYPE','','',''),
('M_TEXT_UP','0','1','CLICK','0','0','','',''),
('M_TEXT_UP','1','2','PLAYWAVE','0','SOUND_CLICK','','',''),
('M_TEXT_UP','2','3','SENDMSGI','8','IDV_S_TELETYPE','','',''),
('M_TEXT_UP','3','4','EMTIME','0','250','','',''),
('M_TEXT_UP','4','0','SENDMSGI','9','IDV_S_TELETYPE','','',''),
('M_TIMEDVPLAY','0','1','WAIT','0','SIG_OPEN','','',''),
('M_TIMEDVPLAY','1','2','SHOW','0','IDS_BFLY','','',''),
('M_TIMEDVPLAY','2','0','ANIMATE','0','0','','',''),
('M_TIMEDVPLAY2','0','1','DRAGFOCUS','0','0','','',''),
('M_TIMEDVPLAY2','1','2','SHOW','0','IDS_BIRDS','','',''),
('M_TIMEDVPLAY2','2','0','VIDEO','0','0','','',''),
('M_TINYFISH','0','2','C_ACCEPT','0','ISA_BAIT','','',''),
('M_TINYFISH','10','2','ASHOW','','','','',''),
('M_TINYFISH','2','3','DROP','0','0','','',''),
('M_TINYFISH','3','4','MOV','WSPRITE','WIP1','','',''),
('M_TINYFISH','4','5','ESTIME','','1','','',''),
('M_TINYFISH','5','6','ASHOW','WSPRITE','V_LOOP','','',''),
('M_TINYFISH','6','7','ESTIME','','4','','',''),
('M_TINYFISH','6','7','GRAB','WIP2','','','',''),
('M_TINYFISH','7','8','CLEAR','WOBJECT','','','',''),
('M_TINYFISH','8','9','CLEAR','WPARM','','','',''),
('M_TINYFISH','9','10','CLEAR','WSPRITE','','','',''),
('M_VIAL','0','1','SHOW','0','0','','',''),
('M_VIAL','1','10','LTEi','WPARM','20','ASSIGN(LWEALTH,10);ASSIGN(WPARM,MAX_VIAL_STORAGE);MOV(BPARM,LWEALTH);SIGNALi(SIG_SHOW,S1_VIALMETER);','',''),
('M_VIAL','1','2','Z_EPSILON','','','','',''),
('M_VIAL','10','12','DRAG','0','IDD_SCOOPE','','',''),
('M_VIAL','10','16','DRAG','0','IDD_SCOOPF','ADDI(BPARM,1);','',''),
('M_VIAL','10','10','DROP','0','IDD_SCOOPE','','',''),
('M_VIAL','10','19','DROP','0','IDD_SCOOPF','','',''),
('M_VIAL','10','40','DROP','0','IDD_VIAL1','','',''),
('M_VIAL','10','50','DROP','0','IDD_VIAL2','','',''),
('M_VIAL','10','10','GRAB','0','IDD_SCOOPE','','',''),
('M_VIAL','10','10','WAIT','','SIG_DRAIN','MOV(BPARM,0);SIGNALi(SIG_SHOW,S1_VIALMETER);','',''),
('M_VIAL','12','10','EQUALi','LWEALTH','0','','',''),
('M_VIAL','12','13','Z_EPSILON','','','SUBI(LWEALTH,1);MOV(BPARM,LWEALTH);SIGNALi(SIG_SHOW,S1_VIALMETER);','',''),
('M_VIAL','13','14','PLAYWAVE','0','SOUND_SLURP','','',''),
('M_VIAL','14','10','HANDOFF','0','IDD_SCOOPF','','',''),
('M_VIAL','16','10','GTE','BPARM','WPARM','','',''),
('M_VIAL','16','17','Z_EPSILON','','','ADDI(LWEALTH,1);MOV(BPARM,LWEALTH);SIGNALi(SIG_SHOW,S1_VIALMETER);','',''),
('M_VIAL','17','18','PLAYWAVE','0','SOUND_SPIT','','',''),
('M_VIAL','18','10','HANDOFF','0','IDD_SCOOPE','','',''),
('M_VIAL','19','10','GTE','BPARM','WPARM','','',''),
('M_VIAL','19','20','Z_EPSILON','','','','',''),
('M_VIAL','2','10','MOV','BPARM','LWEALTH','SIGNALi(SIG_SHOW,S1_VIALMETER);','',''),
('M_VIAL','20','10','ADDi','LWEALTH','1','MOV(BPARM,LWEALTH);SIGNALi(SIG_SHOW,S1_VIALMETER);','',''),
('M_VIAL','40','0','ASSIGN','WPARM','40','','',''),
('M_VIAL','50','0','ASSIGN','WPARM','80','','',''),
('M_VIALMETER','0','5','WAIT','0','SIG_SHOW','REF_MACHINE(WIP1);MOV(BPARM,R_BPARM);MOV(WPARM,R_WPARM);','',''),
('M_VIALMETER','10','0','Z_EPSILON','','','','',''),
('M_VIALMETER','20','0','Z_EPSILON','','','','',''),
('M_VIALMETER','30','0','Z_EPSILON','','','','',''),
('M_VIALMETER','5','10','EQUALi','R_WPARM','20','MULI(BPARM,2);MOV(BFRAME,BPARM);SHOW(WIP2);','',''),
('M_VIALMETER','5','20','EQUALi','R_WPARM','40','ASSIGN(WSPRITE,WIP2);MOV(BFRAME,BPARM);SHOW(WIP2);','',''),
('M_VIALMETER','5','30','EQUALi','R_WPARM','80','DIVI(BPARM,2);MOV(BFRAME,BPARM);SHOW(WIP2);','',''),
('M_VIALMETER','5','0','Z_EPSILON','','','','',''),
('M_VIEWSPELL','0','turntOn','WAIT','0','SIG_START','
    //start the timer
    SIGNAL(WIP2,SIG_START);
     MOV(WPARM,LVIEW);
     MOV(BPARM,OVIEW);

','',''),
('M_VIEWSPELL','active','caughtInLoop','ESTIME','0','1','
    //guy needs to let me set the other players view - like loadview
        if(WIP1==ENCHANT){
            MOV(OVIEW,WPARM);
        }
        //As a test we do holding against lview
        if(WIP1==HOLDING){ 
            LOADVIEW(WPARM);
        }
         if(WIP1==STALKING){
            MOV(BPARM,OVIEW);
            LOADVIEW(BPARM);
        }
','',''),
('M_VIEWSPELL','active','ended','WAIT','0','SIG_STOP','SIGNAL(SID_SPELL,SIG_CLEAR);','',''),
('M_VIEWSPELL','caughtInLoop','active','Z_EPSILON','','','','',''),
('M_VIEWSPELL','ended','0','Z_EPSILON','','','','',''),
('M_VIEWSPELL','turntOn','active','Z_EPSILON','','','
    SUBI(LKARMA,2);
','',''),
('M_VPLAY2','0','1','WAIT','0','SIG_OPEN','','',''),
('M_VPLAY2','1','2','SHOW','0','IDS_BIRDSFWD','','',''),
('M_VPLAY2','2','0','ANIMATE','0','0','','',''),
('M_VPLAY3','0','1','WAIT','0','SIG_OPEN','','',''),
('M_VPLAY3','1','2','SHOW','0','IDS_BIRDSBKWD','','',''),
('M_VPLAY3','2','0','ANIMATE','0','0','','',''),
('m_mefltext','0','A','Z_EPSILON','','','SHOW(IDS_BTN_OK);SETTEXT(ID_MYLABEL, "startup text");','',''),
('m_mefltext','A','B','CLICK','','','SETTEXT(ID_MYLABEL,"[A] This Is Some New Text");','',''),
('m_mefltext','B','C','CLICK','','','meflintext('meflin_198', ?WTEMP1);
SETTEXT(ID_MYLABEL,WTEMP1);','',''),
('m_mefltext','C','A','CLICK','','','SETTEXT(ID_MYLABEL,
"[C]
Labels depend on their background image to clear text.
If the image is too small text will be left in the view.
This is a bug, but once fixed the excess text will be clipped, so just
make sure that your text fits on the label image!
Click OK to see what I mean.
");','','');
