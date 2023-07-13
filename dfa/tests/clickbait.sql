
delete from games;

delete from machines where name = 'S3002_PATH1';
delete from machines where name = 's3002_path1';

insert into machines values (0x3002,'s3002_path1',4391,'IDV_PATH1',300,120,450,280,0,'m_clickbait','IDS_BAIT1','3', '', 'SOUND_LEVER' );

delete from transitions where [automaton] = 'M_CLICKBAIT';
delete from transitions where [automaton] = 'm_clickbait';

insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code], [guard]) values

('m_clickbait','0','B1','Z_EPSILON','','','
ASSIGN(WOBJECT,IDD_BAIT0);
SHOW(WOBJECT);',''),

('m_clickbait','B1','B2','CLICK','','','
fishbait(IDD_BAIT1).
ASSIGN(WOBJECT,IDD_BAIT1);
if (WOBJECT == IDD_BAIT1) {
    WRITE(''you found fishbait'');
}
SHOW(WOBJECT);',''),

('m_clickbait','B2','B3','CLICK','','','
ASSIGN(WOBJECT,IDD_BAIT2);
SHOW(WOBJECT);',''),

('m_clickbait','B3','B4','CLICK','','','
ASSIGN(WOBJECT,IDD_BAIT3);
SHOW(WOBJECT);',''),

('m_clickbait','B4','0','CLICK','','','','');
