

delete from transitions where [name] = 'M_SQUARE';

insert into transitions values
('M_SQUARE',0,1,'C_ACCEPT','0','IDC_TOKEN', ''),
-- reset the square as empty:
('M_SQUARE',1,5,'Z_EPSILON','','', '
CLEAR(WOBJECT);
CLEAR(WPARM);
SHOW();'),
-- Wait for a token drop in an empty square:
('M_SQUARE',5,10,'DROP','0','0',''),
('M_SQUARE',5,10,'WAIT','0','SIG_SET', 'MOV(WOBJECT,WTEMP1);'),
-- show the dropped token and store it in wParm for later handoff
('M_SQUARE',10,40,'SHOW','WOBJECT','', '
ANIMATE(V_LOOP);
PLAYWAVE(SOUND_CLICK);
MOV(WPARM,WOBJECT);'),

('M_SQUARE',40,47,'NEQUALi','WPARM','IDD_REVERSIA', ''),
('M_SQUARE',40,110,'Z_EPSILON','','', 'ASSIGN(WPARM, IDD_REVERSIB);'),
('M_SQUARE',47,110,'NEQUALi','WPARM','IDD_REVERSIB', ''),
('M_SQUARE',47,110,'Z_EPSILON','','', 'ASSIGN(WPARM, IDD_REVERSIA);'),

-- wair for someone or something to grab the token
-- or drop a new token in exchange for the current token
('M_SQUARE',110,10,'DROP','','', '
HANDOFF(WPARM);
CLEAR(WPARM);'),
('M_SQUARE',110,1,'GRAB','WPARM','', ''),
('M_SQUARE',110,1,'WAIT','0','SIG_CLEAR', '');
