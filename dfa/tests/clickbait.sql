
delete from games;

delete from machines where name = 'S3002_PATH1';
delete from machines where name = 'S3002_PATH2';

insert into machines values (0x3002,'S3002_PATH1',4391,'IDV_PATH1',300,120,450,280,0,'M_CLICKBAIT','IDS_BAIT0', 0, '3', 0x0, '', 0x0, 'SOUND_LEVER', 0x0 );

delete from transitions where name = 'M_CLICKBAIT';
insert into transitions values ('M_CLICKBAIT',0,1,'MOV','BFRAME','0');
insert into transitions values ('M_CLICKBAIT',1,2,'SHOW','WIP1', '');
insert into transitions values ('M_CLICKBAIT',2,3,'CLICK','','');
insert into transitions values ('M_CLICKBAIT',3,4,'ADDI','BFRAME','1');
insert into transitions values ('M_CLICKBAIT',4,0,'GTE','BFRAME','WIP2');
insert into transitions values ('M_CLICKBAIT',4,1,'Z_EPSILON','','');
