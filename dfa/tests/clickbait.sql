
delete from games;

delete from machines where name = 'S3002_PATH1';
delete from machines where name = 's3002_path1';

insert into machines values (0x3002,'s3002_path1',4391,'IDV_PATH1',300,120,450,280,0,'m_clickbait','IDS_BAIT1','3', '', 'SOUND_LEVER' );

delete from transitions where [name] = 'M_CLICKBAIT';
delete from transitions where [name] = 'm_clickbait';

insert into transitions ([name], [state], [new_state], [opcode], [param_1], [param_2], [code], [guard]) values

('m_clickbait','0','B1','Z_EPSILON','','','
    ASSIGN(WOBJECT,IDD_BAIT0);
    SHOW(WOBJECT);',''),
('m_clickbait','B1','2','CLICK','','','
    ASSIGN(WOBJECT,IDD_BAIT1);
    SHOW(WOBJECT);',''),
('m_clickbait','2','3','CLICK','','','
    ASSIGN(WOBJECT,IDD_BAIT2);
    SHOW(WOBJECT);',''),
('m_clickbait','3','4','CLICK','','','
    ASSIGN(WOBJECT,IDD_BAIT3);
    SHOW(WOBJECT);',''),
('m_clickbait','4','0','CLICK','','','','');
