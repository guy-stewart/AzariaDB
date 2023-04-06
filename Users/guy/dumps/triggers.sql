drop table if exists triggers;
create table triggers
(
	[from]    text, -- origin view
 -- rectange using view coordinates
	[left]    int,
	[top]     int,
	[right]   int,
	[bottom]  int,
	[to]      text -- desination vue
);

insert into triggers values ('IDV_CONTINENT',0,0,100,100,'IDV_BOARD');
insert into triggers values ('IDV_CONTINENT',232,342,355,465,'IDV_SCN10PT0');
insert into triggers values ('IDV_CONTINENT',236,82,302,123,'IDV_EYEA');
insert into triggers values ('IDV_CONTINENT',482,859,569,953,'IDV_VIL2');
insert into triggers values ('IDV_CONTINENT',490,628,579,745,'IDV_TMPLPTH4');
insert into triggers values ('IDV_CONTINENT',670,204,800,299,'IDV_MOON1');
insert into triggers values ('IDV_CONTINENT',766,781,853,920,'IDV_PATH1');
insert into triggers values ('IDV_CONTINENT',843,105,1014,186,'IDV_WR1');
insert into triggers values ('IDV_CONTINENT',1088,550,1194,626,'IDV_QUARSA');
insert into triggers values ('IDV_CONTINENT',1142,327,1214,364,'IDV_MANPAN');
insert into triggers values ('IDV_CONTINENT',1200,887,1284,979,'IDV_GRNDCNT1');
insert into triggers values ('IDV_CONTINENT',1218,204,1380,336,'IDV_CTO1');
insert into triggers values ('IDV_CONTINENT',1424,469,1473,537,'IDV_FA1PAN');
insert into triggers values ('IDV_ORIE',750,24,1005,254,'IDV_DOORS');
insert into triggers values ('IDV_ORIE',1328,70,1520,172,'IDV_RBBING');
insert into triggers values ('IDV_ORIE',1393,188,1479,246,'IDV_TRANSL');
insert into triggers values ('IDV_ORIE',1858,35,2053,155,'IDV_CHART');
insert into triggers values ('IDV_ORIE',1916,189,2003,246,'IDV_MLAYOUT');
insert into triggers values ('IDV_ORIE',2386,27,2593,158,'IDV_TOPMAP');
insert into triggers values ('IDV_ORIE',2447,192,2534,247,'IDV_BOTMAP');
insert into triggers values ('IDV_ctysmith',264,168,856,300,'IDV_ckeyvend');
insert into triggers values ('IDV_ctychem',1400,168,1700,300,'IDV_chempan');
insert into triggers values ('IDV_MANPAN',424,68,517,240,'IDV_MANREP1');
insert into triggers values ('IDV_MANPAN',550,68,645,240,'IDV_MANREP2');
insert into triggers values ('IDV_MANPAN',702,68,790,240,'IDV_MANREP3');
insert into triggers values ('IDV_MANPAN',851,68,944,240,'IDV_MANREP4');
insert into triggers values ('IDV_MANPAN',974,68,1076,240,'IDV_MANREP5');
insert into triggers values ('IDV_MANPAN',2034,68,2124,240,'IDV_MANREP6');
insert into triggers values ('IDV_MANPAN',2160,68,2248,240,'IDV_MANREP7');
insert into triggers values ('IDV_MANPAN',2306,68,2407,240,'IDV_MANREP8');
insert into triggers values ('IDV_MANPAN',2436,68,2551,240,'IDV_MANREP9');
insert into triggers values ('IDV_MANPAN',2585,68,2682,240,'IDV_MANREP10');
insert into triggers values ('IDV_STRATMAP',187,397,270,488,'IDV_SCN10PT0');
insert into triggers values ('IDV_STRATMAP',236,82,302,123,'IDV_EYEA');
insert into triggers values ('IDV_STRATMAP',482,859,569,953,NULL);
insert into triggers values ('IDV_STRATMAP',490,628,579,745,'IDV_TMPLPTH4');
insert into triggers values ('IDV_STRATMAP',843,105,1014,186,'IDV_WR1');
insert into triggers values ('IDV_STRATMAP',972,302,1077,401,'IDV_GRNDCNT1');
insert into triggers values ('IDV_STRATMAP',1088,550,1194,626,'IDV_QUARSA');
insert into triggers values ('IDV_STRATMAP',1142,327,1214,364,'IDV_MANPAN');
insert into triggers values ('IDV_STRATMAP',1176,324,1300,428,'IDV_STRATPAN');
insert into triggers values ('IDV_STRATMAP',1218,204,1380,336,'IDV_ctya');
insert into triggers values ('IDV_STRATMAP',1424,469,1473,537,'IDV_FA1PAN');
insert into triggers values ('IDV_FH1PTH1',2150,160,2400,300,'IDV_GRBDRT1');
insert into triggers values ('IDV_TM1PAN',627,160,1065,300,'IDV_VESTPAN2');
insert into triggers values ('IDV_TM1PAN',1454,50,1600,300,'IDV_TMPLPTH4');
insert into triggers values ('IDV_TM1PAN',2028,160,2459,300,'IDV_VESTPAN1');
insert into triggers values ('IDV_SIGNPAN',106,116,202,195,'IDV_SIGNPANENG');
insert into triggers values ('IDV_SIGNPANENG',106,116,202,195,'IDV_NAT1a');
