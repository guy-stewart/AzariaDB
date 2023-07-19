
-- SIG_NULL through SIG_HIDE are currently hard-coded in the game engine.
-- Removing this pathological coupling is a Work In Progress :)
-- Until therapy is complete, please add new signals to the end of this list ...

insert into constants ([name],[value]) values 
('SIG_NULL',0),
('SIG_INIT',1),			-- Sent to all machines when a game is loaded (not transfered!)
('SIG_VIEWINIT',2),		-- sent to all machines in a view when the view is loaded

('SIG_OBJECT',3),
('SIG_HAPPY',4),
('SIG_HURT',5),
('SIG_KISS',6),
('SIG_MAD',7),
('SIG_SAD',8),
('SIG_SURPRISED',9),
('SIG_STRESS',10),
('SIG_WAVE',11),

('SIG_BURST',12),
('SIG_BOMB',13),
('SIG_BURN',14),
('SIG_OPEN',15),
('SIG_CLOSE',16),
('SIG_ON',17),
('SIG_OFF',18),
('SIG_ENTER_1',19),

('SIG_ADD',20),
('SIG_SUB',21),
('SIG_SET',22),
('SIG_CLEAR',23),

('SIG_INC1',24),
('SIG_DEC1',25),
('SIG_INC10',26),
('SIG_DEC10',27),
    
('SIG_SHOW',28),
('SIG_HIDE',29),

('SIG_CHECK',30);
