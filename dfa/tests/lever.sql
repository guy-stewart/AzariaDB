
delete from games;

-- ASSETS:
delete from spr_names where name = 'IDS_LEVANI';
insert into spr_names values ('IDS_LEVANI','levani',0);
insert into sounds values ('SOUND_LEVER', 	'lever',0);



delete from machines where name = 'S21_LEVER';
INSERT INTO "main"."machines" ("id", "name", "view_id", "view_name", "left", "top", "right", "bottom", "local_visible", "dfa_name", "wip1_name", "wip1_value", "wip2_name", "wip2_value", "wip3_name", "wip3_value", "wip4_name", "wip4_value") 
VALUES ('8465', 'S21_LEVER', '8105', 'IDV_LEVERCU', '32', '42', '300', '187', '0', 'M_LEVER', 'IDS_LEVANI', '0', '2', '0', 'S21_LEVSTOP', '8466', 'SOUND_LEVER', '0');

delete from  "main"."transitions" where name = 'M_LEVER';

/*
                                                       _________YES_________
M_LEVER:                                              /                     \
           epsilon                     click          v    Sleep(3)         | 
[start]  --------------------->[ 2 ]--------------->[ 7 ]----------->< IFSTATE(S21_LEVSTOP, 60) >
          BFRAME = 0,            ^    BFRAME = 1                           |
          SHOW(IDS_LEVANI).      |                                         |
                                  \_________________NO____________________/
                                                 BFRAME = 0
                                                   
*/
INSERT INTO "main"."transitions" ("name", "state", "new_state", "opcode", "param_1", "param_2")
 VALUES 
    ('M_LEVER', '0', '1', 'MOV', 'BFRAME', '0'),
    ('M_LEVER', '1', '2', 'SHOW', 'WIP1', ''),
    ('M_LEVER', '2', '3', 'CLICK', '0', '0'),
    ('M_LEVER', '3', '4', 'PLAYWAVE', '0', 'SOUND_LEVER'),
    ('M_LEVER', '4', '7', 'ADDI', 'BFRAME', '1'),
    ('M_LEVER', '7', '8', 'ESTIME', '', '3'), -- sleep 3 seconds.
    ('M_LEVER', '8', '7', 'IFSTATEi', '60', 'S21_LEVSTOP'),
    ('M_LEVER', '8', '9', 'Z_EPSILON', '', ''),
    ('M_LEVER', '9', '11', 'SUBI', 'BFRAME', '1'),
    ('M_LEVER', '11', '12', 'PLAYWAVE', '0', 'SOUND_LEVER'),
    ('M_LEVER', '12', '2', 'SHOW', 'WIP1', '');

-- sleep only works with WPARM and not an arbitrary number
-- Ask Guy about clearing DETIME and what that does
delete from machines where name = 'S21_LEVSTOP';
INSERT INTO "main"."machines" (
    "id", "name", "view_id", "view_name", "left", "top", "right", "bottom", "local_visible", "dfa_name", "wip1_name","wip1_value", "wip2_name", "wip2_value", "wip3_name", "wip3_value", "wip4_name", "wip4_value") 
    VALUES ('8466', 'S21_LEVSTOP', '8105', 'IDV_LEVERCU', '333', '116', '366', '213', '0', 'M_LEVSTOP', '', '', 'S21_LEVER', '8465', '', '0', '', '0');

delete from  "main"."transitions" where name = 'M_LEVSTOP';

INSERT INTO "main"."transitions" ("name", "state", "new_state", "opcode", "param_1", "param_2")
 VALUES 
    ('M_LEVSTOP', '0', '10', 'O_ACCEPT', '0', 'IDD_ROCK'),
    ('M_LEVSTOP', '10', '30', 'DROP', '0', '0'), -- A dropped object is automatically assigend to WOBJECT.
--    ('M_LEVSTOP', '20', '30', 'ASSIGN', 'WOBJECT', 'IDD_ROCK');
    ('M_LEVSTOP', '30', '40', 'SHOW', 'WOBJECT', ''),
    ('M_LEVSTOP', '40', '50', 'PLAYWAVE', '0', 'SOUND_CLICK'),
    ('M_LEVSTOP', '50', '60', 'SIGNAL', 'WIP2', ''),
    ('M_LEVSTOP', '60', '70', 'GRAB', '0', '0'),
    ('M_LEVSTOP', '70', '10', 'SHOW', '0', '0');