drop table if exists triggers;
create table triggers
(
	[from]    text, -- origin view
 -- rectange using view coordinates
	[left]    int,
	[top]     int,
	[right]   int,
	[bottom]  int,
	[to]      text, -- desination vue
   [facing]);

insert into triggers values ('IDV_CONTINENT',0,0,100,100,'IDV_BOARD', -1);
insert into triggers values ('IDV_CONTINENT',232,342,355,465,'IDV_SCN10PT0', 19);
insert into triggers values ('IDV_CONTINENT',236,82,302,123,'IDV_EYEA', 360);
insert into triggers values ('IDV_CONTINENT',482,859,569,953,'IDV_VIL2', 352);
insert into triggers values ('IDV_CONTINENT',490,628,579,745,'IDV_TMPLPTH4', 333);
insert into triggers values ('IDV_CONTINENT',670,204,800,299,'IDV_MOON1', 178);
insert into triggers values ('IDV_CONTINENT',766,781,853,920,'IDV_PATH1', 178);
insert into triggers values ('IDV_CONTINENT',843,105,1014,186,'IDV_WR1', 283);
insert into triggers values ('IDV_CONTINENT',1088,550,1194,626,'IDV_QUARSA', 352);
insert into triggers values ('IDV_CONTINENT',1142,327,1214,364,'IDV_MANPAN', -1);
insert into triggers values ('IDV_CONTINENT',1200,887,1284,979,'IDV_GRNDCNT1', 308);
insert into triggers values ('IDV_CONTINENT',1218,204,1380,336,'IDV_CTO1', 195);
insert into triggers values ('IDV_CONTINENT',1424,469,1473,537,'IDV_FA1PAN', 168);
insert into triggers values ('IDV_ORIE',750,24,1005,254,'IDV_DOORS', -1);
insert into triggers values ('IDV_ORIE',1328,70,1520,172,'IDV_RBBING', -1);
insert into triggers values ('IDV_ORIE',1393,188,1479,246,'IDV_TRANSL', -1);
insert into triggers values ('IDV_ORIE',1858,35,2053,155,'IDV_CHART', -1);
insert into triggers values ('IDV_ORIE',1916,189,2003,246,'IDV_MLAYOUT', -1);
insert into triggers values ('IDV_ORIE',2386,27,2593,158,'IDV_TOPMAP', -1);
insert into triggers values ('IDV_ORIE',2447,192,2534,247,'IDV_BOTMAP', -1);
insert into triggers values ('IDV_ctysmith',264,168,856,300,'IDV_ckeyvend', -1);
insert into triggers values ('IDV_ctychem',1400,168,1700,300,'IDV_chempan', -1);
insert into triggers values ('IDV_MANPAN',424,68,517,240,'IDV_MANREP1', -1);
insert into triggers values ('IDV_MANPAN',550,68,645,240,'IDV_MANREP2', -1);
insert into triggers values ('IDV_MANPAN',702,68,790,240,'IDV_MANREP3', -1);
insert into triggers values ('IDV_MANPAN',851,68,944,240,'IDV_MANREP4', -1);
insert into triggers values ('IDV_MANPAN',974,68,1076,240,'IDV_MANREP5', -1);
insert into triggers values ('IDV_MANPAN',2034,68,2124,240,'IDV_MANREP6', -1);
insert into triggers values ('IDV_MANPAN',2160,68,2248,240,'IDV_MANREP7', -1);
insert into triggers values ('IDV_MANPAN',2306,68,2407,240,'IDV_MANREP8', -1);
insert into triggers values ('IDV_MANPAN',2436,68,2551,240,'IDV_MANREP9', -1);
insert into triggers values ('IDV_MANPAN',2585,68,2682,240,'IDV_MANREP10', -1);
insert into triggers values ('IDV_STRATMAP',187,397,270,488,'IDV_SCN10PT0', -1);
insert into triggers values ('IDV_STRATMAP',236,82,302,123,'IDV_EYEA', -1);
insert into triggers values ('IDV_STRATMAP',482,859,569,953,NULL, -1);
insert into triggers values ('IDV_STRATMAP',490,628,579,745,'IDV_TMPLPTH4', 225);
insert into triggers values ('IDV_STRATMAP',843,105,1014,186,'IDV_WR1', -1);
insert into triggers values ('IDV_STRATMAP',972,302,1077,401,'IDV_GRNDCNT1', -1);
insert into triggers values ('IDV_STRATMAP',1088,550,1194,626,'IDV_QUARSA', -1);
insert into triggers values ('IDV_STRATMAP',1142,327,1214,364,'IDV_MANPAN', -1);
insert into triggers values ('IDV_STRATMAP',1176,324,1300,428,'IDV_STRATPAN', -1);
insert into triggers values ('IDV_STRATMAP',1218,204,1380,336,'IDV_ctya', -1);
insert into triggers values ('IDV_STRATMAP',1424,469,1473,537,'IDV_FA1PAN', -1);
insert into triggers values ('IDV_FH1PTH1',2150,160,2400,300,'IDV_GRBDRT1', -1);
insert into triggers values ('IDV_TM1PAN',627,160,1065,300,'IDV_VESTPAN2', -1);
insert into triggers values ('IDV_TM1PAN',1454,50,1600,300,'IDV_TMPLPTH4', 225);
insert into triggers values ('IDV_TM1PAN',2028,160,2459,300,'IDV_VESTPAN1', -1);
insert into triggers values ('IDV_SIGNPAN',106,116,202,195,'IDV_SIGNPANENG', -1);
insert into triggers values ('IDV_SIGNPANENG',106,116,202,195,'IDV_NAT1a', 1);
