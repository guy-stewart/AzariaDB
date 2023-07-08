



delete from transitions where automaton = 'M16_PAYGRAB' and state = 'open_bin' and opcode = 'GRAB';

insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code], [guard], [doc]) values

('M16_PAYGRAB','open_bin','0','GRAB','WIP1','','
    if(R_WPARM != R_BPARM){
        SUB(LKARMA,4);
        PLAYWAVE(0,SOUND_CLUNK);
    }
    SIGNAL(WIP3,SIG_OFF);
    SIGNAL(WIP2,SIG_OFF);
','','');
