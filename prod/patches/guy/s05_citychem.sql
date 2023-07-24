
/*

uses CHEMCOST; // CHEMCOST is a MAP where CHEMCOST(n) gives the cost of each chemical.

dfa M05_UP(receiver) {
    0: click() {
            playwave(sound_click);
            signal(receiver, SIG_INC1);
        } -> 0;
    }
};
dfa M05_DN(receiver) {
    0: click() {
            playwave(sound_click);
            signal(receiver, SIG_DEC1);
        } -> 0;
    }
};
dfa ICON(vial, num1, num10) {
    int selection; // currently selected chemical.
    int cost;      // cost of the currenlty selected chemical;
    0:  wait(SIG_INC1) {
            selection++;
            if (selection > count(CHEMCOST)) {
                selection = 0;
            }
        } -> update;
        wait(SIG_DEC1) {
            selection--;
            if (selection < 0) {
                selection = count(CHEMCOST)-1;
            }
        } -> update;
    update: {
            .frame = selection;
            map(chemcost, selection, _result);
            cost = _result;
            show(IDS_CHEMS);
            signal(vial);
            signal(num1);
            signal(num10);
        }  -> 0;
};
dfa NUM1(vial) {
    0: wait() {
            frame(vial.balance % 10);
            show(IDS_CITYNUM);
        } -> 0; 
}
dfa NUM10(vial) {
    0: wait() {
            frame(vial.balance / 10);
            show(IDS_CITYNUM);
        } -> 0;
}
dfa VIAL() {
    int balance;   // amount of nystrom stored in the vial
    0:  on_click() -> 7;
        drag(IDD_SCOOPF) {
            balance += 1;
            playwave(SOUND_SLURP);
            handoff(IDD_SCOOPE);
        } -> 7;
    7:  epsilon() {
            if (balance >= cost) {
                balance -= cost;
                signal(BUBLE);
                signal(CHEM);
            }
        } -> 0; 
};
dfa CHEM(vial) {
    0: wait() {
        VIDEO(0,IDS_CHEMFILL);
        REF_MACHINE(vial);
        MOV(WOBJECT,vial.BFRAME);
        ADDI(WOBJECT,IDD_CHEMV01);'),
    } -> 20;
    20: grab() {
        CLEAR(WOBJECT);
        CLEAR(WSPRITE);
        SHOW(NOTHING);
    } -> 0;
};
dfa BUBBLE() {
    0: wait() {VIDEO(0,IDS_CHEMBUBL);} -> 0;
}

rig s05_citychem():view(IDV_chempan,global=true) :-
    M05_UP   S05_UP(ICON):view.pos(7,126,28,153);
    M05_DN   S05_DN(ICON):view.pos(...);
    M05_ICON S05_ICON(S05_VIAL, S05_NUM1, SO5_NUM10, CHEM_COUNT):view.pos(...);
    ...
*/

-- these deletes are not required since table map uses 'on conflict replace'
-- delete from map where [op] = 'CHEMCOST';
-- delete from map where [op] = 'CHEM_IDDX';
insert into map ([op],[key],[value]) values 
('CHEM_IDDX','0', 'IDD_CHEMV01'),
('CHEM_IDDX','1', 'IDD_CHEMV02'),
('CHEM_IDDX','2', 'IDD_CHEMV03'),
('CHEM_IDDX','3', 'IDD_CHEMV04'),
('CHEM_IDDX','4', 'IDD_CHEMV05'),
('CHEM_IDDX','5', 'IDD_CHEMV06'),
('CHEM_IDDX','6', 'IDD_CHEMV07'),
('CHEM_IDDX','7', 'IDD_CHEMV08'),
('CHEM_IDDX','8', 'IDD_CHEMV09'),
('CHEM_IDDX','9', 'IDD_CHEMV10'),
('CHEM_IDDX','10', 'IDD_CHEMV11'),
('CHEM_IDDX','11', 'IDD_CHEMV12'),
('CHEM_IDDX','12', 'IDD_CHEMV13'),
('CHEM_IDDX','13', 'IDD_CHEMV14'),
('CHEM_IDDX','14', 'IDD_CHEMV15'),
('CHEM_IDDX','15', 'IDD_CHEMV16'),
('CHEM_IDDX','16', 'IDD_CHEMV17'),
('CHEM_IDDX','17', 'IDD_CHEMV18'),
('CHEM_IDDX','18', 'IDD_CHEMV19'),
('CHEM_IDDX','19', 'IDD_CHEMV20');

insert into constants values ('CHEM_COUNT',20);

delete from machines where [name] like 'S05_%';

insert into machines ([id],[name],[view_id],[view_name],[left],[top],[right],[bottom],[local_visible],[dfa_name], [wip1_name],[wip2_name],[wip3_name],[wip4_name]) values
(0x501,'S05_UP',0x501,'IDV_chempan',7,126,28,153,0,'M05_UP','S05_ICON','','',''),
(0x502,'S05_DN',0x501,'IDV_chempan',7,161,28,191,0,'M05_DOWN','S05_ICON','','',''),
(0x503,'S05_ICON',0x501,'IDV_chempan',75,125,125,175,0,'M05_ICON','S05_VIAL','S05_NUM1','S05_NUM10','CHEM_COUNT'),
(0x504,'S05_NUM1',0x501,'IDV_chempan',234,96,258,120,0,'M05_NUM1','S05_VIAL','','',''),
(0x505,'S05_NUM10',0x501,'IDV_chempan',206,99,228,123,0,'M05_NUM10','S05_VIAL','','',''),
(0x506,'S05_VIAL',0x501,'IDV_chempan',161,131,221,172,0,'M05_VIAL','S05_CHEM','S05_BUBBLE','S05_ICON',''),
(0x507,'S05_CHEM',0x501,'IDV_chempan',283,76,386,238,0,'M05_CHEM','S05_ICON','','',''),
(0x508,'S05_BUBBLE',0x501,'IDV_chempan',63,0,72,76,0,'M05_BUBBLE','','','','');

delete from transitions where [automaton] like 'M05_%';
insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code]) values
('M05_BUBBLE','0','0','WAIT','0','0','VIDEO(0,IDS_CHEMBUBL);'),

('M05_CHEM','0','20','WAIT','','', '
    SHOW(0,IDS_CHEMFILL);
    ANIMATE(0,0);
    REF_MACHINE(WIP1);
    MOV(WOBJECT,R_BFRAME);
    MAP(WOBJECT,CHEM_IDDX);'),
('M05_CHEM','20','0','GRAB','','','
    CLEAR(WOBJECT);
    CLEAR(WSPRITE);
    SHOW(0,0);'), 

/*
  ___  __  ___   ___ ___ ___  _  _ 
 / __|/  \| __| |_ _/ __/ _ \| \| |
 \__ \ () |__ \  | | (_| (_) | .` |
 |___/\__/|___/_|___\___\___/|_|\_|

automaton M05_DOWN(WIP1=M05_ICON) ::


*/
('M05_DOWN','0','0','CLICK','','', '
    PLAYWAVE(0,SOUND_CLICK);
    SIGNAL(WIP1,SIG_DEC1);'),
('M05_UP','0','0','CLICK','','','
    PLAYWAVE(0,SOUND_CLICK);
    SIGNAL(WIP1,SIG_INC1);'),

('M05_ICON','0','2','WAIT','0','SIG_INC1', 'ADDI(BFRAME,1);'),
('M05_ICON','0','7','WAIT','0','SIG_DEC1', 'SUBI(BFRAME,1);'),
('M05_ICON','2','20','GTEi','BFRAME','WIP4', 'ASSIGN(BFRAME,0);'), -- if bframe >= WIP4 (CHEM_COUNT)
('M05_ICON','2','20','Z_EPSILON','','',''), -- else
('M05_ICON','7','20','LTi','BFRAME','0', '
    ASSIGN(BFRAME,WIP4);
    SUBI  (BFRAME,1);'),
('M05_ICON','7','20','Z_EPSILON','','',''),
('M05_ICON','20','0','Z_EPSILON','','','
    SHOW(0,IDS_CHEMS);
    SIGNAL(WIP1, SIG_UPDATE);
    SIGNAL(WIP2, SIG_UPDATE);
    SIGNAL(WIP3, SIG_UPDATE);'),

-- display 1's column: update display on any signal
('M05_NUM1','0','0','WAIT','SIG_UPDATE','', '
    REF_MACHINE(WIP1);
    MOV(BFRAME,R_BPARM);
    MODI(BFRAME,10);
    SHOW(0,IDS_CITYNUM);'),
-- display 10's column:
('M05_NUM10','0','0','WAIT','SIG_UPDATE','', '
    REF_MACHINE(WIP1);
    MOV(BFRAME,R_BPARM);
    DIVI(BFRAME,10);
    SHOW(0,IDS_CITYNUM);'),

('M05_VIAL','0','7','CLICK','0','0', ''),
('M05_VIAL','0','1','DRAG','0','IDD_SCOOPF', ''),
('M05_VIAL','0','0','WAIT','SIG_UPDATE','', '
    REF_MACHINE(WIP3);
    MOV(BPARM,R_BFRAME);
    MAPi(BPARM,CHEMCOST);'),
('M05_VIAL','1','7','LT','WPARM','BPARM', '
    ADDI(WPARM,1);
    HANDOFF(0,IDD_SCOOPE);
    PLAYWAVE(0,SOUND_SLURP);'),
('M05_VIAL','1','7','Z_EPSILON','','', ''),
('M05_VIAL','7','0','GTE','WPARM','BPARM', '
    SIGNAL(WIP1);
    SIGNAL(WIP2);
    SUB(WPARM,BPARM);'),
('M05_VIAL','7','0','Z_EPSILON','','', '');
