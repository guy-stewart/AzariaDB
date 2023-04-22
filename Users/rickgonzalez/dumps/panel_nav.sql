drop table if exists panel_nav;
create table panel_nav
(
	[from]   text,
	[forward] text,
	[back]   text
);

insert into panel_nav values ('IDV_DOORS',NULL,'IDV_ORIE');
insert into panel_nav values ('IDV_RBBING',NULL,'IDV_ORIE');
insert into panel_nav values ('IDV_TRANSL',NULL,'IDV_ORIE');
insert into panel_nav values ('IDV_CHART',NULL,'IDV_ORIE');
insert into panel_nav values ('IDV_MLAYOUT',NULL,'IDV_ORIE');
insert into panel_nav values ('IDV_TOPMAP',NULL,'IDV_ORIE');
insert into panel_nav values ('IDV_BOTMAP',NULL,'IDV_ORIE');
insert into panel_nav values ('IDV_LOCKERN',NULL,'IDV_LOCKERR');
insert into panel_nav values ('IDV_LOCKERW',NULL,'IDV_LOCKERR');
insert into panel_nav values ('IDV_LOCKERS',NULL,'IDV_LOCKERR');
insert into panel_nav values ('IDV_LOCKERCU00',NULL,'IDV_LOCKERN');
insert into panel_nav values ('IDV_LOCKERCU01',NULL,'IDV_LOCKERN');
insert into panel_nav values ('IDV_LOCKERCU02',NULL,'IDV_LOCKERN');
insert into panel_nav values ('IDV_LOCKERCU03',NULL,'IDV_LOCKERN');
insert into panel_nav values ('IDV_LOCKERCU04',NULL,'IDV_LOCKERN');
insert into panel_nav values ('IDV_LOCKERCU05',NULL,'IDV_LOCKERN');
insert into panel_nav values ('IDV_LOCKERCU06',NULL,'IDV_LOCKERN');
insert into panel_nav values ('IDV_LOCKERCU07',NULL,'IDV_LOCKERN');
insert into panel_nav values ('IDV_LOCKERCU08',NULL,'IDV_LOCKERN');
insert into panel_nav values ('IDV_LOCKERCU09',NULL,'IDV_LOCKERW');
insert into panel_nav values ('IDV_LOCKERCU10',NULL,'IDV_LOCKERW');
insert into panel_nav values ('IDV_LOCKERCU11',NULL,'IDV_LOCKERW');
insert into panel_nav values ('IDV_LOCKERCU12',NULL,'IDV_LOCKERW');
insert into panel_nav values ('IDV_LOCKERCU13',NULL,'IDV_LOCKERW');
insert into panel_nav values ('IDV_LOCKERCU14',NULL,'IDV_LOCKERW');
insert into panel_nav values ('IDV_LOCKERCU15',NULL,'IDV_LOCKERW');
insert into panel_nav values ('IDV_LOCKERCU16',NULL,'IDV_LOCKERW');
insert into panel_nav values ('IDV_LOCKERCU17',NULL,'IDV_LOCKERW');
insert into panel_nav values ('IDV_LOCKERCU18',NULL,'IDV_LOCKERS');
insert into panel_nav values ('IDV_LOCKERCU19',NULL,'IDV_LOCKERS');
insert into panel_nav values ('IDV_LOCKERCU20',NULL,'IDV_LOCKERS');
insert into panel_nav values ('IDV_LOCKERCU21',NULL,'IDV_LOCKERS');
insert into panel_nav values ('IDV_LOCKERCU22',NULL,'IDV_LOCKERS');
insert into panel_nav values ('IDV_LOCKERCU23',NULL,'IDV_LOCKERS');
insert into panel_nav values ('IDV_LOCKERCU24',NULL,'IDV_LOCKERS');
insert into panel_nav values ('IDV_LOCKERCU25',NULL,'IDV_LOCKERS');
insert into panel_nav values ('IDV_LOCKERCU26',NULL,'IDV_LOCKERS');
insert into panel_nav values ('IDV_ckeycf01',NULL,'IDV_ctysmith');
insert into panel_nav values ('IDV_ckeycf02',NULL,'IDV_ctysmith');
insert into panel_nav values ('IDV_ckeycf03',NULL,'IDV_ctysmith');
insert into panel_nav values ('IDV_ckeyvend',NULL,'IDV_ctysmith');
insert into panel_nav values ('IDV_chouse01',NULL,'IDV_ctyhouse');
insert into panel_nav values ('IDV_chouse02',NULL,'IDV_ctyhouse');
insert into panel_nav values ('IDV_chouse03',NULL,'IDV_ctyhouse');
insert into panel_nav values ('IDV_chempan',NULL,'IDV_ctychem');
insert into panel_nav values ('IDV_CLIBMON1',NULL,NULL);
insert into panel_nav values ('IDV_CLIBMON2',NULL,NULL);
insert into panel_nav values ('IDV_CLIBMON3',NULL,NULL);
insert into panel_nav values ('IDV_CLIBMON4',NULL,NULL);
insert into panel_nav values ('IDV_CLIBMON5',NULL,NULL);
insert into panel_nav values ('IDV_CLIBMON6',NULL,NULL);
insert into panel_nav values ('IDV_CARDMACH1',NULL,'IDV_CTLIB1B');
insert into panel_nav values ('IDV_CARDMACH2',NULL,'IDV_CTLIB1B');
insert into panel_nav values ('IDV_CARDMACH3',NULL,'IDV_CTLIB1B');
insert into panel_nav values ('IDV_CARDMACH4',NULL,'IDV_CTLIB1B');
insert into panel_nav values ('IDV_CARDMACH5',NULL,'IDV_CTLIB1B');
insert into panel_nav values ('IDV_CARDMACH6',NULL,'IDV_CTLIB1B');
insert into panel_nav values ('IDV_MANREP1',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_MANREP2',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_MANREP3',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_MANREP4',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_MANREP5',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_MANREP6',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_MANREP7',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_MANREP8',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_MANREP9',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_MANREP10',NULL,'IDV_MANPAN');
insert into panel_nav values ('IDV_STRATMON1',NULL,'IDV_STRATPAN');
insert into panel_nav values ('IDV_STRATMON2',NULL,'IDV_STRATPAN');
insert into panel_nav values ('IDV_SCN10PT1',NULL,'IDV_SCN10PT0');
insert into panel_nav values ('IDV_SCN10PIT',NULL,'IDV_SCN10PT1');
insert into panel_nav values ('IDV_FALTAR',NULL,'IDV_FA1PAN');
insert into panel_nav values ('IDV_GRBDRT1','IDV_GRBDRT2','IDV_FH1PTH1');
insert into panel_nav values ('IDV_GRBDRT2',NULL,'IDV_GRBDRT1');
insert into panel_nav values ('IDV_SHORE',NULL,'IDV_FH1PAN');
insert into panel_nav values ('IDV_VESTPAN1',NULL,'IDV_TM1PAN');
insert into panel_nav values ('IDV_VESTPAN2',NULL,'IDV_TM1PAN');
insert into panel_nav values ('IDV_TMCU1',NULL,'IDV_TM2PAN');
insert into panel_nav values ('IDV_TMCU2',NULL,'IDV_TM5PAN');
insert into panel_nav values ('IDV_TMCU3',NULL,'IDV_TM3PAN');
insert into panel_nav values ('IDV_TMCU4',NULL,'IDV_TM4PAN');
insert into panel_nav values ('IDV_TMCUT',NULL,'IDV_TM3PAN');
insert into panel_nav values ('IDV_MOONDISK1',NULL,'IDV_MOON1');
insert into panel_nav values ('IDV_MOONDISK2',NULL,'IDV_MOON2');
insert into panel_nav values ('IDV_MOONDISK3',NULL,'IDV_MOON3');
insert into panel_nav values ('IDV_MOONDISK4',NULL,'IDV_MOON4');
insert into panel_nav values ('IDV_MOONDISK5',NULL,'IDV_MOON4');
insert into panel_nav values ('IDV_MOONDISK6',NULL,'IDV_MOON5');
insert into panel_nav values ('IDV_MOONDISK7',NULL,'IDV_MOON5');
insert into panel_nav values ('IDV_CROW0000',NULL,'IDV_VIL2');
insert into panel_nav values ('IDV_BUCK0000',NULL,'IDV_VIL2');
insert into panel_nav values ('IDV_SHOV0000',NULL,'IDV_VIL3');
insert into panel_nav values ('IDV_PICK0000',NULL,'IDV_VIL3');
insert into panel_nav values ('IDV_GRUB0000',NULL,'IDV_VIL4');
insert into panel_nav values ('IDV_WOOD0000',NULL,'IDV_VIL4');
insert into panel_nav values ('IDV_SIGNPAN',NULL,'IDV_VIL5');
insert into panel_nav values ('IDV_TRAYR',NULL,'IDV_VIL6');
insert into panel_nav values ('IDV_TRAYL',NULL,'IDV_VIL6');
insert into panel_nav values ('IDV_VILDOOR',NULL,'IDV_VIL4');
insert into panel_nav values ('IDV_MEMSTONE',NULL,'IDV_LAKEB2');
insert into panel_nav values ('IDV_aMINEPAN',NULL,'IDV_QUARSB');
insert into panel_nav values ('IDV_bMINEPAN',NULL,'IDV_QUARSB');
insert into panel_nav values ('IDV_cMINEPAN',NULL,'IDV_QUARSB');
insert into panel_nav values ('IDV_dMINEPAN',NULL,'IDV_QUARSB');
insert into panel_nav values ('IDV_eMINEPAN',NULL,'IDV_QUARSB');
insert into panel_nav values ('IDV_MAPBOX1',NULL,'IDV_N2D2');
insert into panel_nav values ('IDV_LEVERCU',NULL,'IDV_N2B');
insert into panel_nav values ('IDV_RUBBLECU',NULL,'IDV_NAT1d');
insert into panel_nav values ('IDV_EYEC1P',NULL,'IDV_EYEB');
insert into panel_nav values ('IDV_W4LOCK',NULL,'IDV_WR3');
insert into panel_nav values ('IDV_PL1P',NULL,'IDV_WALL1IN');
insert into panel_nav values ('IDV_PL2P',NULL,'IDV_WALL2IN');
