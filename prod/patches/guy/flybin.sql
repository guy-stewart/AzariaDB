

delete from games;

delete from machines where name = 'S30_PATH2';

insert into machines values (0x3001,'S30_PATH2',4391,'IDV_PATH1',140,120,300,280,0,'M_ANIBIN','IDS_EYESPELL', 0, 'IDD_EYESPELL', 0x0, '60', 0x0, '', 0x0 );

delete from transitions where name = 'M_ANIBIN';
insert into transitions values ('M_ANIBIN',0,1,'MOV','WSPRITE','WIP1');
insert into transitions values ('M_ANIBIN',1,2,'ASHOW','WSPRITE','V_LOOP');
insert into transitions values ('M_ANIBIN',2,2,'GRAB','WIP2','');
