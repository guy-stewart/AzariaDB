drop table if exists cardinals;
create table cardinals
(
    [from]      text unique primary key not null,
    [north]     text,
    [northeast] text,
    [east]      text,
    [southeast] text,
    [south]     text,
    [southwest] text,
    [west]      text,
    [northwest] text
);

insert into cardinals values ('IDV_ORIE',NULL,'IDV_GRNDCNT1',NULL,NULL,NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_CTO1','IDV_GRNDCNT1',NULL,NULL,NULL,'IDV_CTO2',NULL,NULL,NULL);
insert into cardinals values ('IDV_CTO2','IDV_CTO1',NULL,NULL,NULL,NULL,'IDV_CTO3',NULL,NULL);
insert into cardinals values ('IDV_CTO3',NULL,NULL,'IDV_CTO2',NULL,'IDV_MANPAN',NULL,'IDV_ctya',NULL);
insert into cardinals values ('IDV_LOCKERR','IDV_LOCKERN',NULL,'IDV_ctyg',NULL,'IDV_LOCKERS',NULL,'IDV_LOCKERW',NULL);
insert into cardinals values ('IDV_ctya','IDV_ctyd',NULL,'IDV_ctyc',NULL,'IDV_CTO3',NULL,'IDV_ctyb','IDV_ctye');
insert into cardinals values ('IDV_ctyb','IDV_ctye','IDV_ctyd','IDV_ctya',NULL,NULL,NULL,'IDV_ctyhouse',NULL);
insert into cardinals values ('IDV_ctyc',NULL,NULL,'IDV_ctysmith',NULL,NULL,NULL,'IDV_ctya','IDV_ctyd');
insert into cardinals values ('IDV_ctyd','IDV_ctyn',NULL,'IDV_ctyk','IDV_ctyc','IDV_ctya','IDV_ctyb','IDV_ctye',NULL);
insert into cardinals values ('IDV_ctye','IDV_ctyf',NULL,'IDV_ctyd',NULL,'IDV_ctyb',NULL,NULL,'IDV_ctyg');
insert into cardinals values ('IDV_ctyf','IDV_ctyh',NULL,NULL,NULL,'IDV_ctye',NULL,'IDV_ctyg',NULL);
insert into cardinals values ('IDV_ctyg',NULL,NULL,'IDV_ctyf','IDV_ctye',NULL,NULL,'IDV_LOCKERR',NULL);
insert into cardinals values ('IDV_ctyh','IDV_ctyi',NULL,NULL,NULL,'IDV_ctyf',NULL,NULL,'IDV_ctyj');
insert into cardinals values ('IDV_ctyi',NULL,NULL,'IDV_ctyp',NULL,'IDV_ctyh',NULL,'IDV_ctyj',NULL);
insert into cardinals values ('IDV_ctyj',NULL,NULL,'IDV_ctyi',NULL,NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_ctyk','IDV_ctyl','IDV_ctys',NULL,NULL,'IDV_ctys','IDV_ctya','IDV_ctyd',NULL);
insert into cardinals values ('IDV_ctyl','IDV_ctyo','IDV_ctym','IDV_ctys',NULL,'IDV_ctyk',NULL,'IDV_ctyn',NULL);
insert into cardinals values ('IDV_ctym','IDV_ctyr',NULL,'IDV_ctyt',NULL,'IDV_ctys','IDV_ctyk','IDV_ctyl','IDV_ctyq');
insert into cardinals values ('IDV_ctyn',NULL,NULL,NULL,NULL,'IDV_ctyd',NULL,NULL,NULL);
insert into cardinals values ('IDV_ctyo','IDV_ctyq','IDV_ctyr','IDV_ctym','IDV_ctys','IDV_ctyl',NULL,NULL,NULL);
insert into cardinals values ('IDV_ctyp',NULL,NULL,'IDV_ctyq',NULL,NULL,NULL,'IDV_ctyi',NULL);
insert into cardinals values ('IDV_ctyq',NULL,NULL,'IDV_ctyr','IDV_ctym','IDV_ctyo',NULL,'IDV_ctyp',NULL);
insert into cardinals values ('IDV_ctyr','IDV_ctytrade',NULL,'IDV_ctyt','IDV_ctym','IDV_ctyl','IDV_ctyo','IDV_ctyq',NULL);
insert into cardinals values ('IDV_ctys','IDV_ctym','IDV_ctyt',NULL,NULL,'IDV_ctychem','IDV_ctyk','IDV_ctyl','IDV_ctyo');
insert into cardinals values ('IDV_ctyt',NULL,NULL,NULL,NULL,NULL,'IDV_ctys','IDV_ctym','IDV_ctyr');
insert into cardinals values ('IDV_CTLIB1A',NULL,'IDV_ctyj',NULL,NULL,NULL,'IDV_CTLIB1B',NULL,NULL);
insert into cardinals values ('IDV_CTLIB1B','IDV_CARDMACH1',NULL,'IDV_CARDMACH6','IDV_CARDMACH5','IDV_CARDMACH4','IDV_CARDMACH3','IDV_ctychem','IDV_CARDMACH2');
insert into cardinals values ('IDV_ctysmith','IDV_ckeycf02','IDV_ckeyvend','IDV_ckeyvend',NULL,'IDV_ckeycf03','IDV_ckeycf01','IDV_ctyc','IDV_ckeycf01');
insert into cardinals values ('IDV_ctyhouse','IDV_chouse02',NULL,'IDV_chouse03','IDV_chouse03','IDV_ctyb','IDV_chouse01',NULL,NULL);
insert into cardinals values ('IDV_ctychem','IDV_ctys','IDV_MANPAN',NULL,NULL,'IDV_chempan',NULL,NULL,NULL);
insert into cardinals values ('IDV_ctytrade',NULL,NULL,NULL,NULL,'IDV_ctyr',NULL,NULL,NULL);
insert into cardinals values ('IDV_MANPAN','IDV_CTO3',NULL,NULL,NULL,'IDV_CTLIB1A',NULL,NULL,NULL);
insert into cardinals values ('IDV_STRATPAN',NULL,NULL,NULL,NULL,NULL,'IDV_STRATMON1',NULL,'IDV_STRATMON2');
insert into cardinals values ('IDV_SCN10PT0','IDV_SCN10PT1',NULL,NULL,NULL,'IDV_GRNDCNT1',NULL,NULL,NULL);
insert into cardinals values ('IDV_SCN10PT1','IDV_SCN10PIT',NULL,NULL,NULL,'IDV_SCN10PT0',NULL,NULL,NULL);
insert into cardinals values ('IDV_FA1PAN','IDV_GRNDCNT1',NULL,NULL,'IDV_FALTAR','IDV_FH1PTH1',NULL,NULL,NULL);
insert into cardinals values ('IDV_FH1PTH1','IDV_FA1PAN',NULL,NULL,NULL,'IDV_FH1PAN',NULL,NULL,NULL);
insert into cardinals values ('IDV_FH1PAN','IDV_FH1PTH1',NULL,NULL,NULL,'IDV_FH1PTH1',NULL,NULL,NULL);
insert into cardinals values ('IDV_PATH1','IDV_GRNDCNT1',NULL,NULL,NULL,'IDV_PATH2',NULL,NULL,NULL);
insert into cardinals values ('IDV_PATH2','IDV_PATH1',NULL,NULL,NULL,'IDV_BOARD',NULL,'IDV_PATH1',NULL);
insert into cardinals values ('IDV_TM1PAN',NULL,'IDV_TM5PAN',NULL,NULL,NULL,NULL,NULL,'IDV_TM2PAN');
insert into cardinals values ('IDV_TM2PAN','IDV_TM3PAN','IDV_TM4PAN','IDV_TM5PAN',NULL,'IDV_TM1PAN',NULL,'IDV_TMCU1','IDV_TM3PAN');
insert into cardinals values ('IDV_TM3PAN',NULL,'IDV_TMCUT','IDV_TM4PAN','IDV_TM5PAN','IDV_TM2PAN',NULL,'IDV_TMCU3',NULL);
insert into cardinals values ('IDV_TM4PAN',NULL,'IDV_TMCU4',NULL,'IDV_TMCU2','IDV_TM5PAN','IDV_TM2PAN','IDV_TM3PAN','IDV_TMCUT');
insert into cardinals values ('IDV_TM5PAN','IDV_TM4PAN',NULL,'IDV_TMCU2',NULL,'IDV_TM1PAN',NULL,'IDV_TM2PAN','IDV_TM3PAN');
insert into cardinals values ('IDV_MOON1','IDV_GRNDCNT1',NULL,NULL,NULL,'IDV_MOON2','IDV_MOONDISK7',NULL,NULL);
insert into cardinals values ('IDV_MOON2','IDV_MOON1',NULL,NULL,'IDV_MOONDISK6','IDV_MOON3',NULL,NULL,'IDV_MOONDISK7');
insert into cardinals values ('IDV_MOON3','IDV_MOON2',NULL,NULL,NULL,'IDV_MOON4',NULL,'IDV_MOONDISK5',NULL);
insert into cardinals values ('IDV_MOON4','IDV_MOON3','IDV_MOONDISK4',NULL,NULL,'IDV_MOON5','IDV_MOONDISK3',NULL,NULL);
insert into cardinals values ('IDV_MOON5','IDV_MOON4',NULL,'IDV_MOONDISK2',NULL,NULL,'IDV_MOONDISK1',NULL,NULL);
insert into cardinals values ('IDV_VIL2','IDV_VIL3',NULL,NULL,NULL,'IDV_GRNDCNT1',NULL,'IDV_CROW0000','IDV_BUCK0000');
insert into cardinals values ('IDV_VIL3','IDV_VIL4',NULL,'IDV_VIL5',NULL,'IDV_VIL2','IDV_SHOV0000','IDV_VIL7','IDV_PICK0000');
insert into cardinals values ('IDV_VIL4',NULL,NULL,'IDV_GRUB0000',NULL,'IDV_VIL3','IDV_WOOD0000',NULL,'IDV_VILDOOR');
insert into cardinals values ('IDV_VIL5',NULL,'IDV_SIGNPAN','IDV_VIL6',NULL,NULL,NULL,'IDV_VIL3',NULL);
insert into cardinals values ('IDV_VIL6',NULL,'IDV_TRAYL','IDV_TRAYR',NULL,NULL,NULL,'IDV_VIL5',NULL);
insert into cardinals values ('IDV_VIL7',NULL,NULL,'IDV_VIL3',NULL,NULL,NULL,'IDV_VIL8','IDV_VIL9');
insert into cardinals values ('IDV_VIL8','IDV_VIL9',NULL,'IDV_VIL7',NULL,NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_VIL9',NULL,NULL,NULL,'IDV_VIL7','IDV_VIL8',NULL,NULL,NULL);
insert into cardinals values ('IDV_CROW0000',NULL,'IDV_VIL2',NULL,NULL,NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_BUCK0000',NULL,NULL,'IDV_VIL2',NULL,NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_PICK0000',NULL,NULL,NULL,'IDV_VIL3',NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_TMPLPTH4','IDV_TMPLPTH5',NULL,NULL,NULL,'IDV_GRNDCNT1',NULL,NULL,'IDV_TMPLPTH5');
insert into cardinals values ('IDV_TMPLPTH5','IDV_TMPLPTH9',NULL,NULL,NULL,'IDV_TMPLPTH4',NULL,'IDV_TM1PAN',NULL);
insert into cardinals values ('IDV_TMPLPTH9','IDV_LAKEB1',NULL,NULL,'IDV_TMPLPTH5',NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_LAKEB1','IDV_LAKEB2',NULL,NULL,NULL,'IDV_TMPLPTH9',NULL,NULL,NULL);
insert into cardinals values ('IDV_LAKEB2','IDV_MEMSTONE',NULL,NULL,NULL,'IDV_LAKEB1',NULL,NULL,NULL);
insert into cardinals values ('IDV_GRNDCNT1','IDV_ctya','IDV_N2A','IDV_VIL2','IDV_TMPLPTH4','IDV_FA1PAN','IDV_QUARSA','IDV_SCN10PT0','IDV_ORIE');
insert into cardinals values ('IDV_QUARSA','IDV_QUARSB',NULL,NULL,NULL,'IDV_GRNDCNT1',NULL,NULL,NULL);
insert into cardinals values ('IDV_QUARSB','IDV_aMINEPAN','IDV_bMINEPAN','IDV_cMINEPAN',NULL,'IDV_QUARSA',NULL,'IDV_dMINEPAN','IDV_eMINEPAN');
insert into cardinals values ('IDV_aCV1aPAN','IDV_aCV1bPAN',NULL,NULL,NULL,NULL,'IDV_QUARSB',NULL,NULL);
insert into cardinals values ('IDV_aCV1bPAN',NULL,NULL,NULL,NULL,'IDV_aCV1aPAN',NULL,NULL,NULL);
insert into cardinals values ('IDV_bCV1aPAN','IDV_bCV1bPAN',NULL,NULL,NULL,NULL,'IDV_QUARSB',NULL,NULL);
insert into cardinals values ('IDV_bCV1bPAN',NULL,NULL,NULL,NULL,'IDV_bCV1aPAN',NULL,NULL,NULL);
insert into cardinals values ('IDV_cCV1aPAN','IDV_cCV1bPAN',NULL,NULL,NULL,NULL,'IDV_QUARSB',NULL,NULL);
insert into cardinals values ('IDV_cCV1bPAN',NULL,NULL,NULL,NULL,'IDV_cCV1aPAN',NULL,NULL,NULL);
insert into cardinals values ('IDV_dCV1aPAN',NULL,NULL,NULL,'IDV_dMINEPAN',NULL,NULL,NULL,'IDV_dCV1bPAN');
insert into cardinals values ('IDV_dCV1bPAN',NULL,NULL,NULL,'IDV_dCV1aPAN',NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_eCV1aPAN',NULL,NULL,NULL,'IDV_eMINEPAN',NULL,NULL,NULL,'IDV_eCV1bPAN');
insert into cardinals values ('IDV_eCV1bPAN',NULL,NULL,NULL,'IDV_eCV1aPAN',NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_N2A',NULL,NULL,'IDV_N2B',NULL,NULL,NULL,'IDV_GRNDCNT1',NULL);
insert into cardinals values ('IDV_N2B',NULL,NULL,'IDV_N2C',NULL,'IDV_LEVERCU',NULL,'IDV_N2A',NULL);
insert into cardinals values ('IDV_N2C',NULL,NULL,'IDV_N2D2',NULL,NULL,NULL,'IDV_N2B',NULL);
insert into cardinals values ('IDV_N2D2',NULL,NULL,NULL,'IDV_MAPBOX1',NULL,NULL,'IDV_N2C',NULL);
insert into cardinals values ('IDV_MAPBOX1','IDV_N2D2',NULL,NULL,NULL,NULL,NULL,NULL,'IDV_N2D2');
insert into cardinals values ('IDV_NAT1a','IDV_NAT1b',NULL,NULL,'IDV_GRNDCNT1',NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_NAT1b','IDV_NAT1c',NULL,NULL,'IDV_NAT1a',NULL,NULL,NULL,'IDV_NAT1c');
insert into cardinals values ('IDV_NAT1c',NULL,'IDV_NAT1d',NULL,NULL,'IDV_NAT1b',NULL,NULL,'IDV_NAT1g');
insert into cardinals values ('IDV_NAT1d',NULL,'IDV_RUBBLECU',NULL,NULL,NULL,'IDV_NAT1c',NULL,NULL);
insert into cardinals values ('IDV_NAT1e',NULL,'IDV_NAT1f',NULL,NULL,'IDV_NAT1o','IDV_NAT1d',NULL,NULL);
insert into cardinals values ('IDV_NAT1f',NULL,'IDV_NAT1p',NULL,NULL,NULL,'IDV_NAT1e',NULL,NULL);
insert into cardinals values ('IDV_NAT1g',NULL,NULL,NULL,'IDV_NAT1c',NULL,'IDV_NAT1h','IDV_NAT1n',NULL);
insert into cardinals values ('IDV_NAT1h',NULL,'IDV_NAT1g',NULL,NULL,'IDV_NAT1n','IDV_NAT1i',NULL,NULL);
insert into cardinals values ('IDV_NAT1i',NULL,'IDV_NAT1h',NULL,'IDV_NAT1n',NULL,'IDV_NAT1j',NULL,'IDV_NAT1k');
insert into cardinals values ('IDV_NAT1j','IDV_NAT1k','IDV_NAT1i',NULL,NULL,NULL,'IDV_NAT1m',NULL,'IDV_NAT1l');
insert into cardinals values ('IDV_NAT1k',NULL,NULL,NULL,'IDV_NAT1i','IDV_NAT1j','IDV_NAT1j',NULL,'IDV_NAT1l');
insert into cardinals values ('IDV_NAT1l',NULL,NULL,'IDV_NAT1i','IDV_NAT1k','IDV_NAT1m',NULL,NULL,NULL);
insert into cardinals values ('IDV_NAT1m','IDV_NAT1l','IDV_NAT1j','IDV_NAT1n',NULL,NULL,NULL,NULL,NULL);
insert into cardinals values ('IDV_NAT1n','IDV_NAT1h','IDV_NAT1g',NULL,NULL,NULL,NULL,'IDV_NAT1m','IDV_NAT1i');
insert into cardinals values ('IDV_NAT1o','IDV_NAT1d','IDV_NAT1e',NULL,NULL,NULL,NULL,NULL,'IDV_NAT1c');
insert into cardinals values ('IDV_NAT1p',NULL,NULL,NULL,NULL,'IDV_NAT1f',NULL,NULL,NULL);
insert into cardinals values ('IDV_EYEA','IDV_EYEB',NULL,NULL,NULL,'IDV_GRNDCNT1',NULL,NULL,NULL);
insert into cardinals values ('IDV_EYEB','IDV_EYEC1P',NULL,NULL,NULL,'IDV_EYEA',NULL,NULL,NULL);
insert into cardinals values ('IDV_WR1',NULL,NULL,'IDV_GRNDCNT1',NULL,NULL,NULL,'IDV_WR2',NULL);
insert into cardinals values ('IDV_WR2',NULL,NULL,'IDV_WR1',NULL,'IDV_WR3',NULL,NULL,NULL);
insert into cardinals values ('IDV_WR3','IDV_WR2',NULL,NULL,NULL,'IDV_W4LOCK',NULL,NULL,NULL);
insert into cardinals values ('IDV_WALL1EN',NULL,'IDV_WALL1IN',NULL,NULL,NULL,'IDV_W4LOCK',NULL,NULL);
insert into cardinals values ('IDV_WALL1IN',NULL,'IDV_PL1P',NULL,NULL,NULL,'IDV_WALL1EN',NULL,NULL);
insert into cardinals values ('IDV_WALL2EN',NULL,NULL,NULL,'IDV_W4LOCK',NULL,NULL,NULL,'IDV_WALL2IN');
insert into cardinals values ('IDV_WALL2IN',NULL,NULL,NULL,'IDV_WALL2EN',NULL,NULL,NULL,'IDV_PL2P');
insert into cardinals values ('IDV_BOARD',NULL,NULL,NULL,NULL,NULL,NULL,'IDV_PATH2',NULL);
