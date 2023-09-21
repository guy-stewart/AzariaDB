
drop table if exists fishbait;
drop table if exists meflintext;
delete from games;

delete from machines where name = 'S3002_PATH1';
delete from machines where name = 's3002_path1';
delete from machines where name = 'clickbait';

insert into machines values (0,'clickbait',0,'IDV_PATH1',300,120,450,280,0,'m_clickbait','IDS_BAIT1','3', '', 'SOUND_LEVER' );

delete from transitions where [automaton] = 'M_CLICKBAIT';
delete from transitions where [automaton] = 'm_clickbait';
delete from states where [automaton] = 'm_clickbait';

/*
╔═╗┌┬┐┌─┐┌┬┐┌─┐┌─┐
╚═╗ │ ├─┤ │ ├┤ └─┐
╚═╝ ┴ ┴ ┴ ┴ └─┘└─┘

Code and documentation in the state blocks:
*/
insert into states ([automaton],[state],[entry],[exit], [doc]) values 
-- B0
('m_clickbait','B0',
'WRITE(''B0: onEntry'');
WOBJECT = IDD_BAIT0;
SHOW(WOBJECT);',
'',
'In B0 we simply show bait0.'),

-- ASSERT_FACTS
('m_clickbait','ASSERT_FACTS',
'WRITE(''ASSERT_FACTS: onEntry'');
fishbait(IDD_BAIT0).
fishbait(IDD_BAIT1).
fishbait(IDD_BAIT2).
meflintext(meflin_101,''this is test meflin_101'').
meflintext(meflin_117,''this is test meflin_117'').
meflintext(meflin_198,''this is test meflin_198'').',
'WRITE(''ASSERT_FACTS:onExit'');',
'In ASSERT_FACTS we assert the fishbait facts
for the scope of this state machine.'),

-- QUERY_FACTS
('m_clickbait','QUERY_FACTS',
'WRITE(''QUERY_FACTS: onEntry'');
WOBJECT = IDD_BAIT1;
fishbait(IDD_BAIT2)?
BPARM = fishbait(WOBJECT);
if (1 == BPARM) {
    WRITE(''WOBECT is a fishbait.'');
}
BPARM = fishbait(?WOBJECT);
if (BPARM == 1) {
    WRITE(''WOBJECT is now set to :'', WOBJECT);
}
meflintext(meflin_198, ?WPARM);
WRITE(WPARM);
SHOW(WOBJECT);',
'WRITE(''QUERY_FACTS: onExit'');',
'In ASSERT_FACTS we assert the fishbait facts
for the scope of this state machine.'),

-- RETRACT FACTS
('m_clickbait','RETRACT_FACTS',
'WRITE(''RETRACT_FACTS: onEntry'');
fishbait(IDD_BAIT0)~
fishbait(IDD_BAIT1)~
fishbait(IDD_BAIT2)~
meflintext(''meflin_1%'')~
WOBJECT = IDD_BAIT1;
BPARM = fishbait(WOBJECT);
if (1 == BPARM) {
    WRITE(''WOBECT is a fishbait.'');
}
SHOW(WOBJECT);',
'WRITE(''RETRACT_FACTS: onExit'');',
'In RETRACT_FACTS we assert the fishbait facts
for the scope of this state machine.');

insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code], [guard]) values
('m_clickbait','0','B0','CLICK','','','',''),
('m_clickbait','0','B0','Z_EPSILON','','','',''),
('m_clickbait','B0','ASSERT_FACTS','CLICK','','','',''),
('m_clickbait','ASSERT_FACTS','QUERY_FACTS','CLICK','','','',''),
('m_clickbait','QUERY_FACTS','RETRACT_FACTS','CLICK','','','',''),
('m_clickbait','RETRACT_FACTS','0','CLICK','','','','');

