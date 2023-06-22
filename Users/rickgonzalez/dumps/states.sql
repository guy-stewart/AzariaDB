-- courtesy TblAutomatons::Dump()drop table if exists states;
create table states
(
    [automaton] text,
    [name]      text
    [enter]     text
    [exit]      text
    PRIMARY KEY ([name]) ON CONFLICT REPLACE);

insert into states ([automaton],[name],[enter],[exit]) values 
('0x0030','0','',''),
('0x0030','1','',''),
('0x0030','2','',''),
('0x0030','3','',''),
('0x0030','4','',''),
('0x0031','0','',''),
('0x0031','1','',''),
('0x0032','0','',''),
('0x0032','1','',''),
('0x0032','2','',''),
('0x0032','3','',''),
('0x0032','4','',''),
('0x0033','0','',''),
('0x0033','1','',''),
('0x0034','0','',''),
('0x0034','1','',''),
('0x0034','2','',''),
('0x0034','3','',''),
('0x0034','4','',''),
('0x0035','0','',''),
('0x0035','1','',''),
('0x0036','0','',''),
('0x0036','1','',''),
('0x0036','2','',''),
('0x0036','3','',''),
('0x0036','4','',''),
('0x0037','0','',''),
('0x0037','1','',''),
('0x0038','0','',''),
('0x0038','1','',''),
('0x0038','2','',''),
('0x0038','3','',''),
('0x0038','4','',''),
('0x0039','0','',''),
('0x0039','1','',''),
('0x0049','1','',''),
('0x0049','2','',''),
('0x0049','3','',''),
('0x0049','4','',''),
('0x0049','5','',''),
('0x0049','6','',''),
('0x0049','7','',''),
('0x1000','0','',''),
('0x1000','1','',''),
('0x1000','2','',''),
('0x1000','3','',''),
('0x1000','4','',''),
('0x1000','5','',''),
('0x1000','6','',''),
('0x1001','3','',''),
('0x1001','32','',''),
('0x1001','33','',''),
('0x1001','34','',''),
('0x1001','35','',''),
('0x1001','36','',''),
('0x1001','37','',''),
('0x1001','4','',''),
('0x1001','5','',''),
('0x1001','6','',''),
('0x1001','7','',''),
('0x1001','8','',''),
('M02_BIN','0','',''),
('M02_BIN','4','',''),
('M02_BIN','8','',''),
('M02_BIN','9','',''),
('M02_DN1','0','',''),
('M02_DN1','1','',''),
('M02_DN10','0','',''),
('M02_DN10','1','',''),
('M02_LOCK','0','',''),
('M02_LOCK','1','',''),
('M02_LOCK','10','',''),
('M02_LOCK','15','',''),
('M02_LOCK','2','',''),
('M02_LOCK','9','',''),
('M02_NUM1','0','',''),
('M02_NUM10','0','',''),
('M02_UP1','0','',''),
('M02_UP1','1','',''),
('M02_UP10','0','',''),
('M02_UP10','1','',''),
('M02_VIAL','0','',''),
('M02_VIAL','10','',''),
('M02_VIAL','22','',''),
('M02_VIAL','24','',''),
('M02_VIAL','25','',''),
('M02_VIAL','26','',''),
('M02_VIAL','5','',''),
('M02_VIAL','8','',''),
('M04_BIN','0','',''),
('M04_BIN','1','',''),
('M04_KEYCLAMP','0','',''),
('M04_KEYCLAMP','1','',''),
('M04_KEYCLAMP','2','',''),
('M04_SLIDER','0','',''),
('M04_SLIDER','1','',''),
('M04_SLIDER','10','',''),
('M04_SLIDER','20','',''),
('M04_SLIDER','5','',''),
('M04_VIAL','0','',''),
('M04_VIAL','1','',''),
('M05_BUBBLE','0','',''),
('M05_BUBBLE','1','',''),
('M05_CHEM','0','',''),
('M05_CHEM','1','',''),
('M05_CHEM','2','',''),
('M05_CHEM','20','',''),
('M05_CHEM','21','',''),
('M05_CHEM','22','',''),
('M05_CHEM','23','',''),
('M05_CHEM','3','',''),
('M05_CHEM','4','',''),
('M05_CHEM','5','',''),
('M05_DOWN','0','',''),
('M05_DOWN','1','',''),
('M05_DOWN','2','',''),
('M05_ICON','0','',''),
('M05_ICON','2','',''),
('M05_ICON','20','',''),
('M05_ICON','7','',''),
('M05_NUM1','0','',''),
('M05_NUM1','1','',''),
('M05_NUM1','2','',''),
('M05_NUM1','3','',''),
('M05_NUM1','4','',''),
('M05_NUM10','0','',''),
('M05_NUM10','1','',''),
('M05_NUM10','2','',''),
('M05_NUM10','3','',''),
('M05_NUM10','4','',''),
('M05_UP','0','',''),
('M05_UP','1','',''),
('M05_UP','2','',''),
('M05_VIAL','0','',''),
('M05_VIAL','1','',''),
('M05_VIAL','7','',''),
('M06_CYCLE_COMP1','0','',''),
('M06_CYCLE_COMP1','10','',''),
('M06_CYCLE_COMP1','11','',''),
('M06_CYCLE_COMP1','12','',''),
('M06_CYCLE_COMP2','0','',''),
('M06_CYCLE_COMP2','10','',''),
('M06_CYCLE_COMP2','11','',''),
('M06_CYCLE_COMP2','12','',''),
('M06_CYCLE_COMP3','0','',''),
('M06_CYCLE_COMP3','10','',''),
('M06_CYCLE_COMP3','11','',''),
('M06_CYCLE_TEMPL_ANIM','0','',''),
('M06_CYCLE_TEMPL_ANIM','1','',''),
('M06_CYCLE_TEMPL_DN_BTN','0','',''),
('M06_CYCLE_TEMPL_UP_BTN','0','',''),
('M06_CYCLE_VIEW','0','',''),
('M06_CYCLE_VIEW','1','',''),
('M06_CYCLE_VIEW','10','',''),
('M06_CYCLE_VIEW','11','',''),
('M06_CYCLE_VIEW','2','',''),
('M06_CYCLE_VIEW','20','',''),
('M06_CYCLE_VIEW','21','',''),
('M06_CYCLE_VIEW','30','',''),
('M06_CYCLE_VIEW','31','',''),
('M06_EJECT_CARD_ANIM','0','',''),
('M06_EJECT_CARD_ANIM','11','',''),
('M06_EJECT_CARD_ANIM','20','',''),
('M06_EJECT_CARD_ANIM','5','',''),
('M06_EJECT_CARD_ANIM','7','',''),
('M06_EJECT_CARD_BTN','0','',''),
('M06_EJECT_TEMPL_ANIM','0','',''),
('M06_EJECT_TEMPL_ANIM','1','',''),
('M06_EJECT_TEMPL_ANIM','20','',''),
('M06_EJECT_TEMPL_ANIM','30','',''),
('M06_EJECT_TEMPL_ANIM','31','',''),
('M06_EJECT_TEMPL_ANIM','32','',''),
('M06_EJECT_TEMPL_ANIM','5','',''),
('M06_PEZPOP','0','',''),
('M06_PEZPOP','1','',''),
('M06_PEZPOP','2','',''),
('M06_PEZPOP','3','',''),
('M06_PEZPOP','4','',''),
('M06_PEZPOP','5','',''),
('M06_PEZPOP','6','',''),
('M06_TEMPHOLD','0','',''),
('M06_TEMPHOLD','10','',''),
('M06_TEMPHOLD','11','',''),
('M06_TEMPHOLD','12','',''),
('M06_TEMPHOLD','13','',''),
('M06_TEMPHOLD','14','',''),
('M06_TEMPHOLD','15','',''),
('M06_TEMPHOLD','16','',''),
('M06_TEMPHOLD','17','',''),
('M06_TEMPHOLD','18','',''),
('M06_TEMPHOLD','19','',''),
('M06_TEMPL_EJECT_BTN','0','',''),
('M06_TRI1','0','',''),
('M06_TRI1','1','',''),
('M06_TRI1','2','',''),
('M06_TRI1','3','',''),
('M06_TRI1','4','',''),
('M06_TRI1','5','',''),
('M06_TRI1','6','',''),
('M06_TRI1','7','',''),
('M06_TRI1','8','',''),
('M06_TRI2','0','',''),
('M06_TRI2','1','',''),
('M06_TRI2','2','',''),
('M06_TRI2','3','',''),
('M06_TRI2','4','',''),
('M06_TRI2','5','',''),
('M06_TRI2','6','',''),
('M06_TRI2','7','',''),
('M06_TRI2','8','',''),
('M06_TRI3','0','',''),
('M06_TRI3','1','',''),
('M06_TRI3','2','',''),
('M06_TRI3','3','',''),
('M06_TRI3','4','',''),
('M06_TRI3','5','',''),
('M06_TRI3','6','',''),
('M06_TRI3','7','',''),
('M06_TRI3','8','',''),
('M06_TRI4','0','',''),
('M06_TRI4','1','',''),
('M06_TRI4','2','',''),
('M06_TRI4','3','',''),
('M06_TRI4','4','',''),
('M06_TRI4','5','',''),
('M06_TRI4','6','',''),
('M08_BEEM','0','',''),
('M08_BEEM','1','',''),
('M08_BIN','0','',''),
('M08_BIN','100','',''),
('M08_BIN','101','',''),
('M08_BIN','102','',''),
('M08_BIN','103','',''),
('M08_BIN','104','',''),
('M08_BIN','105','',''),
('M08_CARDHOLD','0','',''),
('M08_CARDHOLD','10','',''),
('M08_CARDHOLD','20','',''),
('M08_CARDHOLD','30','',''),
('M08_CHEMHOLD1','0','',''),
('M08_CHEMHOLD1','10','',''),
('M08_CHEMHOLD1','20','',''),
('M08_CHEMHOLD1','30','',''),
('M08_CHEMIND1','0','',''),
('M08_CHEMIND1','10','',''),
('M08_HOPPER','0','',''),
('M08_HOPPER','10','',''),
('M10_DRYPIT','0','',''),
('M10_DRYPIT','10','',''),
('M10_DRYPIT','21','',''),
('M10_DRYPIT','25','',''),
('M10_DRYPIT','31','',''),
('M10_DRYPIT','35','',''),
('M10_FLOWER','0','',''),
('M10_FLOWER','1','',''),
('M10_FLOWER','30','',''),
('M11_ASCENT','0','',''),
('M11_ASCENT','1','',''),
('M11_ASCENT','2','',''),
('M11_ASCENT','3','',''),
('M11_ASCENT','4','',''),
('M11_ASCENT','5','',''),
('M11_ASCENT','6','',''),
('M11_ASCENT','7','',''),
('M11_FIRE','0','',''),
('M11_FIRE','1','',''),
('M11_FIRE','2','',''),
('M11_FIRE','20','',''),
('M11_FIRE','21','',''),
('M11_FIRE','22','',''),
('M11_FIRE','30','',''),
('M11_FIRE','31','',''),
('M11_FIRE','32','',''),
('M11_FIRE','40','',''),
('M11_FIRE','50','',''),
('M11_FIRE','51','',''),
('M11_FIRE','52','',''),
('M11_FIRE','53','',''),
('M11_FIRE','54','',''),
('M11_GRILL','0','',''),
('M11_GRILL','1','',''),
('M11_GRILL','10','',''),
('M11_GRILL','20','',''),
('M11_GRILL','50','',''),
('M11_GRILL','60','',''),
('M11_GRILL','61','',''),
('M11_GRILL','62','',''),
('M11_GRILL','63','',''),
('M11_GRILL','70','',''),
('M11_GRILL','80','',''),
('M12_ASHSHELF','0','',''),
('M12_ASHSHELF','10','',''),
('M12_ASHSHELF','11','',''),
('M12_ASHSHELF','115','',''),
('M12_ASHSHELF','116','',''),
('M12_ASHSHELF','117','',''),
('M12_ASHSHELF','118','',''),
('M12_ASHSHELF','119','',''),
('M12_ASHSHELF','12','',''),
('M12_ASHSHELF','13','',''),
('M12_ASHSHELF','14','',''),
('M12_ASHSHELF','15','',''),
('M12_CANDLE','0','',''),
('M12_CANDLE','1','',''),
('M12_CANDLE','2','',''),
('M12_CANDLE','5','',''),
('M12_CANDLE','6','',''),
('M12_ING_FSH','0','',''),
('M12_ING_FSH','1','',''),
('M12_ING_NATA','0','',''),
('M12_ING_NATA','1','',''),
('M12_ING_NATB','0','',''),
('M12_ING_NATB','1','',''),
('M12_ING_NATC','0','',''),
('M12_ING_NATC','1','',''),
('M12_ING_NY','0','',''),
('M12_ING_NY','1','',''),
('M12_ING_STD','0','',''),
('M12_ING_STD','1','',''),
('M12_SPRING','0','',''),
('M12_SPRING','1','',''),
('M12_SPRING','2','',''),
('M12_SPRING','3','',''),
('M12_SPRING','4','',''),
('M12_WATER','0','',''),
('M12_WATER','1','',''),
('M12_WATER','2','',''),
('M12_WATER','3','',''),
('M12_WATER','4','',''),
('M12_WATER','5','',''),
('M12_xASHSHELF','0','',''),
('M12_xASHSHELF','12','',''),
('M12_xASHSHELF','13','',''),
('M12_xASHSHELF','20','',''),
('M12_xASHSHELF','21','',''),
('M12_xASHSHELF','30','',''),
('M12_xASHSHELF','31','',''),
('M12_xASHSHELF','4','',''),
('M12_xASHSHELF','5','',''),
('M12_xASHSHELF','9','',''),
('M12_xCANDLE','0','',''),
('M12_xCANDLE','10','',''),
('M12_xCANDLE','100','',''),
('M12_xCANDLE','101','',''),
('M12_xCANDLE','102','',''),
('M12_xCANDLE','15','',''),
('M12_xCANDLE','20','',''),
('M12_xCANDLE','21','',''),
('M12_xCANDLE','22','',''),
('M12_xCANDLE','50','',''),
('M12_xCANDLELIGHT','0','',''),
('M12_xCANDLELIGHT','1','',''),
('M12_xCANDLELIGHT','2','',''),
('M12_xING_MGR','0','',''),
('M12_xING_MGR','10','',''),
('M12_xING_MGR','11','',''),
('M12_xING_MGR','12','',''),
('M12_xING_MGR','13','',''),
('M12_xING_MGR','19','',''),
('M12_xING_MGR','20','',''),
('M12_xING_MGR','21','',''),
('M12_xING_MGR','22','',''),
('M12_xING_MGR','23','',''),
('M12_xING_MGR','9','',''),
('M12_xMAGIC','0','',''),
('M12_xMAGIC','10','',''),
('M12_xMAGIC','11','',''),
('M12_xNYSTROMADDED','0','',''),
('M12_xPLANT','0','',''),
('M12_xPLANT','11','',''),
('M12_xPLANT','12','',''),
('M12_xPLANT','13','',''),
('M12_xPLANT','20','',''),
('M12_xPLANT','21','',''),
('M12_xPLANT','30','',''),
('M12_xPLANT','31','',''),
('M12_xPLANT','5','',''),
('M12_xPLANT','6','',''),
('M12_xPLANT','7','',''),
('M12_xPLANT','9','',''),
('M12_xSCROLL','0','',''),
('M12_xSCROLL','10','',''),
('M12_xSCROLL','11','',''),
('M12_xSCROLL','12','',''),
('M12_xSCROLL','13','',''),
('M12_xSCROLL','21','',''),
('M12_xSCROLL','22','',''),
('M12_xSCROLL','23','',''),
('M12_xSCROLL','30','',''),
('M12_xSCROLL','5','',''),
('M12_xSPELLPORTAL','0','',''),
('M12_xSPELLPORTAL','1','',''),
('M12_xSPELLPORTAL','11','',''),
('M12_xSPELLPORTAL','12','',''),
('M12_xSPELLPORTAL','3','',''),
('M12_xSPELLPORTAL','4','',''),
('M17_DOORWAY','0','',''),
('M17_DOORWAY','1','',''),
('M17_DOORWAY','2','',''),
('M17_DOORWAY','3','',''),
('M17_DOORWAY','50','',''),
('M17_DOORWAY','70','',''),
('M17_DOORWAY','71','',''),
('M17_DOORWAY','72','',''),
('M17_FFIELD','0','',''),
('M17_FFIELD','1','',''),
('M17_FFIELD','2','',''),
('M17_FFIELD','3','',''),
('M17_FFIELD','4','',''),
('M17_FFIELD','5','',''),
('M17_FFIELD','6','',''),
('M17_FOULWIND','0','',''),
('M17_FOULWIND','1','',''),
('M17_FOULWIND','2','',''),
('M17_FOULWIND','4','',''),
('M17_LOCKBURN','0','',''),
('M17_LOCKBURN','1','',''),
('M17_LOCKBURN','2','',''),
('M17_LOCKBURN','3','',''),
('M17_LOCKSOCKET','0','',''),
('M17_LOCKSOCKET','40','',''),
('M17_LOCKSOCKET','42','',''),
('M17_LOCKSOCKET','43','',''),
('M17_LOCKSOCKET','44','',''),
('M17_LOCKSOCKET','50','',''),
('M17_LOCKSOCKET','51','',''),
('M17_LOCKSOCKET','55','',''),
('M17_LOCKSOCKET','60','',''),
('M17_LOCKSOCKET','61','',''),
('M17_LOCKSOCKET','62','',''),
('M17_LOCKSOCKET','63','',''),
('M17_LOCKSOCKET','64','',''),
('M17_LOCKSOCKET','70','',''),
('M17_LOCKSOCKET','72','',''),
('M17_LOCKSOCKET','73','',''),
('M17_LOCKSOCKET','74','',''),
('M17_LOCKSOCKET','80','',''),
('M17_LOCKSOCKET','81','',''),
('M17_LOCKSOCKET','85','',''),
('M17_MINE','0','',''),
('M17_MINE','1','',''),
('M17_MINE','2','',''),
('M17_MINE','3','',''),
('M17_MINE','4','',''),
('M24_BIGEYE','0','',''),
('M24_BIGEYE','1','',''),
('M24_BIGEYE','10','',''),
('M24_BIGEYE','2','',''),
('M24_BIGEYE','20','',''),
('M24_BIGEYE','30','',''),
('M24_BIGEYE','5','',''),
('M24_BIGEYE','50','',''),
('M24_BIGEYE','51','',''),
('M24_BIGEYE','52','',''),
('M24_BIGEYE','6','',''),
('M24_BIGEYE','7','',''),
('M24_EYEPLATE','0','',''),
('M24_EYEPLATE','1','',''),
('M24_EYEPLATE','2','',''),
('M24_EYEPLATE','3','',''),
('M24_EYEPLATE','4','',''),
('M24_EYEPLATE','5','',''),
('M24_EYEPLATE','50','',''),
('M24_EYEPLATE','51','',''),
('M24_EYEPLATE','52','',''),
('M24_EYEPLATE','53','',''),
('M24_EYEPLATE','54','',''),
('M24_EYEPLATE','55','',''),
('M24_EYEPLATE','56','',''),
('M24_EYEPLATE','6','',''),
('M24_EYESPELL','0','',''),
('M24_EYESPELL','1','',''),
('M24_EYESPELL','2','',''),
('M24_EYESPELL','3','',''),
('M24_EYESPELL','4','',''),
('M24_EYESPELL','5','',''),
('M24_EYESPELL','50','',''),
('M24_EYESPELL','51','',''),
('M24_EYESPELL','52','',''),
('M24_EYESPELL','53','',''),
('M24_EYESPELL','54','',''),
('M24_EYESPELL','55','',''),
('M24_EYESPELL','56','',''),
('M24_EYESPELL','6','',''),
('M24_EYETEXT','0','',''),
('M24_EYETEXT','10','',''),
('M24_EYETEXT','11','',''),
('M24_EYETEXT','20','',''),
('M25_OPNDOOR','0','',''),
('M25_OPNDOOR','10','',''),
('M25_OPNDOOR','40','',''),
('M25_OPNDOOR','50','',''),
('M25_OPNDOOR','51','',''),
('M25_OPNDOOR','52','',''),
('M25_OPNDOOR','53','',''),
('M25_OPNDOOR','70','',''),
('M25_OPNDOOR','71','',''),
('M25_ROLL','0','',''),
('M25_ROLL','1','',''),
('M25_ROLL','2','',''),
('M25_ROLL','3','',''),
('M25_RUMBLE','0','',''),
('M25_RUMBLE','1','',''),
('M25_RUMBLE','10','',''),
('M25_RUMBLE','2','',''),
('M25_RUMBLE','20','',''),
('M25_RUMBLE','3','',''),
('M25_RUMBLE','30','',''),
('M25_RUMBLE','40','',''),
('M25_RUMBLE','50','',''),
('M25_RUMBLE','60','',''),
('M25_RUMBLE','61','',''),
('M25_RUMBLE','62','',''),
('M25_RUMBLE','70','',''),
('M25_RUMBLE','71','',''),
('M25_SCATTER','0','',''),
('M25_SCATTER','10','',''),
('M25_SCATTER','2','',''),
('M25_SCATTER','3','',''),
('M25_SCATTER','4','',''),
('M25_SCATTER','50','',''),
('M25_SCATTER','51','',''),
('M25_SCATTER','52','',''),
('M25_SCATTER','60','',''),
('M25_SCATTER','61','',''),
('M25_SCATTER','70','',''),
('M25_SCATTER','71','',''),
('M25_SCATTER','72','',''),
('M25_SCATTER','73','',''),
('M25_SCATTER','74','',''),
('M25_SCATTER','80','',''),
('M26_BANISH','0','',''),
('M26_BANISH','10','',''),
('M26_BANISH','20','',''),
('M26_BANISH','30','',''),
('M26_BANISH','70','',''),
('MEFLIN_COORD','0','',''),
('MEFLIN_COORD','10','',''),
('MEFLIN_COORD','15','',''),
('MEFLIN_COORD','20','',''),
('MEFLIN_COORD','25','',''),
('MEFLIN_COORD','5','',''),
('M_ANIBIN','0','',''),
('M_ANIBIN','1','',''),
('M_ANIBIN','2','',''),
('M_ANIPORTAL','0','',''),
('M_ANIPORTAL','1','',''),
('M_ANIPORTAL','2','',''),
('M_ANIPORTAL','3','',''),
('M_ANIPORTAL','4','',''),
('M_AURA','0','',''),
('M_AURA','1','',''),
('M_AURA','2','',''),
('M_AURA','3','',''),
('M_AURA','4','',''),
('M_AURA','5','',''),
('M_AURA','6','',''),
('M_AURA','7','',''),
('M_AURA','8','',''),
('M_AURA','9','',''),
('M_BACKBUTTON','0','',''),
('M_BACKBUTTON','1','',''),
('M_BACKBUTTON','2','',''),
('M_BAITSTATION','0','',''),
('M_BAITSTATION','1','',''),
('M_BAITSTATION','2','',''),
('M_BAITSTATION','3','',''),
('M_BAITSTATION','4','',''),
('M_BAITSTATION','5','',''),
('M_BAITSTATION','6','',''),
('M_BAITSTATION','7','',''),
('M_BAITSTATION','8','',''),
('M_BAITSTATION','9','',''),
('M_BARD','0','',''),
('M_BARD','1','',''),
('M_BARD','3','',''),
('M_BARD','4','',''),
('M_BIN','0','',''),
('M_BIN','1','',''),
('M_BIN','10','',''),
('M_BTN_1phase','0','',''),
('M_BTN_1phase','1','',''),
('M_BTN_1phase','10','',''),
('M_BTN_1phase','11','',''),
('M_BTN_1phase','12','',''),
('M_BTN_1phase','2','',''),
('M_BTN_1phase','20','',''),
('M_BTN_2phase','0','',''),
('M_BTN_2phase','1','',''),
('M_BTN_2phase','10','',''),
('M_BTN_2phase','11','',''),
('M_BTN_2phase','12','',''),
('M_BTN_2phase','2','',''),
('M_BTN_2phase','20','',''),
('M_BTN_2phase','21','',''),
('M_CHESS','0','',''),
('M_CHESS','1','',''),
('M_CHESS','101','',''),
('M_CHESS','102','',''),
('M_CHESS','103','',''),
('M_CHESS','104','',''),
('M_CHESS','105','',''),
('M_CHESS','106','',''),
('M_CHESS','107','',''),
('M_CHESS','108','',''),
('M_CHESS','109','',''),
('M_CHESS','110','',''),
('M_CHESS','111','',''),
('M_CHESS','112','',''),
('M_CHESS','113','',''),
('M_CHESS','114','',''),
('M_CHESS','115','',''),
('M_CHESS','116','',''),
('M_CHESS','117','',''),
('M_CHESS','118','',''),
('M_CHESS','119','',''),
('M_CHESS','120','',''),
('M_CHESS','121','',''),
('M_CHESS','122','',''),
('M_CHESS','124','',''),
('M_CHESS','125','',''),
('M_CHESS','126','',''),
('M_CHESS','127','',''),
('M_CHESS','128','',''),
('M_CHESS','129','',''),
('M_CHESS','130','',''),
('M_CHESS','131','',''),
('M_CHESS','132','',''),
('M_CHESS','133','',''),
('M_CHESS','134','',''),
('M_CHESS','135','',''),
('M_CHESS','136','',''),
('M_CHESS','137','',''),
('M_CHESS','138','',''),
('M_CHESS','139','',''),
('M_CHESS','140','',''),
('M_CHESS','141','',''),
('M_CHESS','142','',''),
('M_CHESS','143','',''),
('M_CHESS','144','',''),
('M_CHESS','145','',''),
('M_CHESS','146','',''),
('M_CHESS','150','',''),
('M_CLAM','0','',''),
('M_CLAM','1','',''),
('M_CLAM','2','',''),
('M_CLAM','3','',''),
('M_CLAM','4','',''),
('M_CLAM','5','',''),
('M_CLEAR','0','',''),
('M_CLEAR','10','',''),
('M_CLEAR','20','',''),
('M_CLEAR','30','',''),
('M_CLEAR','5','',''),
('M_CLEAR','50','',''),
('M_CLEAR','9','',''),
('M_CLICKBAIT','0','',''),
('M_CLICKBAIT','1','',''),
('M_CLICKBAIT','2','',''),
('M_CLICKBAIT','3','',''),
('M_CLICKBAIT','4','',''),
('M_COMPASS','0','',''),
('M_COMPASS','1','',''),
('M_EYEINFO','0','',''),
('M_EYEINFO','10','',''),
('M_EYEINFO','100','',''),
('M_EYEINFO','120','',''),
('M_EYEINFO','130','',''),
('M_FISHSTATION','0','',''),
('M_FISHSTATION','2','',''),
('M_FISHSTATION','3','',''),
('M_FISHSTATION','4','',''),
('M_FISHSTATION','6','',''),
('M_FISHSTATION','7','',''),
('M_GOPABIN','0','',''),
('M_GOPABIN','1','',''),
('M_GOPABIN','2','',''),
('M_GOPABIN','20','',''),
('M_GOPABIN','3','',''),
('M_GOPABIN','30','',''),
('M_GOPABIN','31','',''),
('M_GOPABIN','4','',''),
('M_GOPABIN','40','',''),
('M_GOPABIN','41','',''),
('M_GOPABIN','5','',''),
('M_GOPABIN','50','',''),
('M_GOPABIN','51','',''),
('M_GOPABIN','6','',''),
('M_GOPABIN','7','',''),
('M_GOPABIN','8','',''),
('M_GOPABIN','9','',''),
('M_HALO','0','',''),
('M_ID','0','',''),
('M_ID','10','',''),
('M_ID','100','',''),
('M_ID','101','',''),
('M_ID','11','',''),
('M_ID','12','',''),
('M_ID','2','',''),
('M_ID','20','',''),
('M_ID','21','',''),
('M_ID','22','',''),
('M_ID','23','',''),
('M_ID','24','',''),
('M_ID','25','',''),
('M_ID','26','',''),
('M_ID','27','',''),
('M_ID','3','',''),
('M_ID','4','',''),
('M_ID','5','',''),
('M_ID','50','',''),
('M_ID','51','',''),
('M_ID','6','',''),
('M_ID','7','',''),
('M_ID','70','',''),
('M_ID','71','',''),
('M_ID','72','',''),
('M_ID','73','',''),
('M_ID','8','',''),
('M_ID','80','',''),
('M_ID','81','',''),
('M_ID','82','',''),
('M_ID','83','',''),
('M_IDSPELL','0','',''),
('M_IDSPELL','1','',''),
('M_IDSPELL','10','',''),
('M_IDSPELL','100','',''),
('M_IDSPELL','101','',''),
('M_IDSPELL','102','',''),
('M_IDSPELL','11','',''),
('M_IDSPELL','12','',''),
('M_IDSPELL','120','',''),
('M_IDSPELL','121','',''),
('M_IDSPELL','122','',''),
('M_IDSPELL','13','',''),
('M_IDSPELL','2','',''),
('M_IDSPELL','20','',''),
('M_IDSPELL','21','',''),
('M_IDSPELL','22','',''),
('M_IDSPELL','3','',''),
('M_IDSPELL','4','',''),
('M_INV_LEFT','0','',''),
('M_INV_LEFT','1','',''),
('M_INV_LEFT','2','',''),
('M_INV_RIGHT','0','',''),
('M_INV_RIGHT','1','',''),
('M_INV_RIGHT','2','',''),
('M_LEVDOOR','0','',''),
('M_LEVDOOR','1','',''),
('M_LEVDOOR','3','',''),
('M_LEVDOOR','4','',''),
('M_LEVDOOR','5','',''),
('M_LEVDOOR','7','',''),
('M_LEVER','0','',''),
('M_LEVER','1','',''),
('M_LEVER','10','',''),
('M_LEVER','11','',''),
('M_LEVER','12','',''),
('M_LEVER','13','',''),
('M_LEVER','14','',''),
('M_LEVER','15','',''),
('M_LEVER','16','',''),
('M_LEVER','2','',''),
('M_LEVER','3','',''),
('M_LEVER','4','',''),
('M_LEVER','6','',''),
('M_LEVER','7','',''),
('M_LEVER','8','',''),
('M_LEVER','9','',''),
('M_LEVSTOP','0','',''),
('M_LEVSTOP','10','',''),
('M_LEVSTOP','30','',''),
('M_LEVSTOP','40','',''),
('M_LEVSTOP','50','',''),
('M_LEVSTOP','60','',''),
('M_LEVSTOP','70','',''),
('M_LISTEN','0','',''),
('M_LISTEN','1','',''),
('M_LISTEN','2','',''),
('M_LISTEN','3','',''),
('M_LISTEN','4','',''),
('M_LISTEN','5','',''),
('M_LISTEN','6','',''),
('M_LISTEN','7','',''),
('M_LUNCHPORTAL','0','',''),
('M_LUNCHPORTAL','1','',''),
('M_MAPBUTTON','0','',''),
('M_MAPBUTTON','1','',''),
('M_MAPBUTTON','2','',''),
('M_MAPBUTTON','3','',''),
('M_MEFPAN_OK','0','',''),
('M_MEFPAN_OK','1','',''),
('M_MEFPAN_OK','2','',''),
('M_MEFPAN_OK','3','',''),
('M_MEFPAN_OK','4','',''),
('M_MEFPAN_OKR','0','',''),
('M_MEFPAN_OKR','1','',''),
('M_MEFPAN_OKR','2','',''),
('M_MEF_APPROACH','0','',''),
('M_MEF_APPROACH','1','',''),
('M_MEF_APPROACH','2','',''),
('M_MEF_APPROACH','3','',''),
('M_MEF_APPROACH','4','',''),
('M_MEF_TALK','0','',''),
('M_MEF_TALK','1','',''),
('M_MEF_TALK','10','',''),
('M_MEF_TALK','11','',''),
('M_MEF_TALK','14','',''),
('M_MEF_TALK','15','',''),
('M_MEF_TALK','2','',''),
('M_MEF_TALK','3','',''),
('M_MEF_TALK','4','',''),
('M_MEF_TALK','7','',''),
('M_MEF_TALK','8','',''),
('M_MEF_TALK','9','',''),
('M_MEMOBJ','0','',''),
('M_MEMOBJ','1','',''),
('M_MEMOBJ','11','',''),
('M_MEMOBJ','12','',''),
('M_MEMOBJ','13','',''),
('M_MEMOBJ','14','',''),
('M_MEMOBJ','15','',''),
('M_MEMOBJ','16','',''),
('M_MEMOBJ','17','',''),
('M_MEMOBJ','18','',''),
('M_MEMOBJ','2','',''),
('M_MEMOBJ','20','',''),
('M_MEMOBJ','21','',''),
('M_MEMOBJ','22','',''),
('M_MEMOBJ','23','',''),
('M_MEMOBJ','3','',''),
('M_MEMOBJ','30','',''),
('M_MEMOBJ','31','',''),
('M_MEMOBJ','32','',''),
('M_MEMOBJ','33','',''),
('M_MEMOBJ','34','',''),
('M_MEMOBJ','35','',''),
('M_MEMOBJ','36','',''),
('M_MEMOBJ','4','',''),
('M_MEMOBJ','5','',''),
('M_MEMORY','0','',''),
('M_MEMORY','1','',''),
('M_MEMORY','2','',''),
('M_MEMORY','3','',''),
('M_MEMORY','4','',''),
('M_MEMORY','5','',''),
('M_MEMORY','6','',''),
('M_NATURE','0','',''),
('M_NATURE','1','',''),
('M_NATURE','2','',''),
('M_NATURE','3','',''),
('M_NATURE','4','',''),
('M_NATURE','5','',''),
('M_NATURE','6','',''),
('M_NATURE','7','',''),
('M_OBJECTBIN','0','',''),
('M_OBJECTMAP','0','',''),
('M_OBJECTMAP','1','',''),
('M_OBJECTMAP','2','',''),
('M_ORIESPEAKER','0','',''),
('M_ORIESPEAKER','1','',''),
('M_ORIESPEAKER','2','',''),
('M_ORIESPEAKER','3','',''),
('M_ORIESPEAKER','4','',''),
('M_ORIESPEAKER','5','',''),
('M_ORIESPEAKER','6','',''),
('M_O_AURA','0','',''),
('M_O_AURA','2','',''),
('M_O_AURA','3','',''),
('M_O_AURA','30','',''),
('M_O_AURA','4','',''),
('M_O_AURA','5','',''),
('M_O_AURA','6','',''),
('M_O_AURA','7','',''),
('M_O_AURA','8','',''),
('M_O_AURA','9','',''),
('M_O_IDSPELL','0','',''),
('M_O_IDSPELL','1','',''),
('M_O_PED','0','',''),
('M_PED','0','',''),
('M_PED','1','',''),
('M_PED','2','',''),
('M_PED','3','',''),
('M_PED','4','',''),
('M_PED','5','',''),
('M_PED','6','',''),
('M_PED','7','',''),
('M_PED','8','',''),
('M_PLANTBIN','0','',''),
('M_PLANTBIN','1','',''),
('M_PLANTBIN','10','',''),
('M_PLANTBIN','20','',''),
('M_PLANTBIN','30','',''),
('M_PLANTBIN','40','',''),
('M_PLANTBIN','5','',''),
('M_POLESTAND','0','',''),
('M_POLESTAND','1','',''),
('M_POLESTAND','2','',''),
('M_POLESTAND','3','',''),
('M_POLESTAND','4','',''),
('M_POLESTAND','5','',''),
('M_PORTAL','0','',''),
('M_PORTAL','1','',''),
('M_PORTAL','2','',''),
('M_PORTAL','3','',''),
('M_RECORD_COMPLETE','0','',''),
('M_RECORD_COMPLETE','100','',''),
('M_RECORD_COMPLETE','101','',''),
('M_RECORD_COUNTER','0','',''),
('M_RECYCLE','0','',''),
('M_RECYCLE','1','',''),
('M_REC_COMPLETE','0','',''),
('M_REC_COMPLETE','100','',''),
('M_REC_COMPLETE','101','',''),
('M_REC_COUNTER','0','',''),
('M_SQUARE','0','',''),
('M_SQUARE','1','',''),
('M_SQUARE','10','',''),
('M_SQUARE','110','',''),
('M_SQUARE','40','',''),
('M_SQUARE','47','',''),
('M_SQUARE','5','',''),
('M_STATEDOOR','0','',''),
('M_STATEDOOR','1','',''),
('M_STATEDOOR','10','',''),
('M_STATEDOOR','2','',''),
('M_STATEDOOR','3','',''),
('M_STATEDOOR','5','',''),
('M_STATESCALE','0','',''),
('M_STATESCALE','1','',''),
('M_STATESCALE','10','',''),
('M_STATESCALE','11','',''),
('M_STATESCALE','5','',''),
('M_STATESCALEV','0','',''),
('M_STATESCALEV','1','',''),
('M_STATESCALEV','10','',''),
('M_STATESCALEV','11','',''),
('M_STATESCALEV','5','',''),
('M_TALK','0','',''),
('M_TALK','10','',''),
('M_TALK','11','',''),
('M_TALK','12','',''),
('M_TALK','13','',''),
('M_TALK','14','',''),
('M_TALK','15','',''),
('M_TALK','16','',''),
('M_TALK','17','',''),
('M_TALK','18','',''),
('M_TALK','19','',''),
('M_TALK','2','',''),
('M_TALK','20','',''),
('M_TEXT_DOWN','0','',''),
('M_TEXT_DOWN','1','',''),
('M_TEXT_DOWN','2','',''),
('M_TEXT_DOWN','3','',''),
('M_TEXT_DOWN','4','',''),
('M_TEXT_UP','0','',''),
('M_TEXT_UP','1','',''),
('M_TEXT_UP','2','',''),
('M_TEXT_UP','3','',''),
('M_TEXT_UP','4','',''),
('M_TIMEDVPLAY','0','',''),
('M_TIMEDVPLAY','1','',''),
('M_TIMEDVPLAY','2','',''),
('M_TIMEDVPLAY2','0','',''),
('M_TIMEDVPLAY2','1','',''),
('M_TIMEDVPLAY2','2','',''),
('M_TINYFISH','0','',''),
('M_TINYFISH','10','',''),
('M_TINYFISH','2','',''),
('M_TINYFISH','3','',''),
('M_TINYFISH','4','',''),
('M_TINYFISH','5','',''),
('M_TINYFISH','6','',''),
('M_TINYFISH','7','',''),
('M_TINYFISH','8','',''),
('M_TINYFISH','9','',''),
('M_VIAL','0','',''),
('M_VIAL','1','',''),
('M_VIAL','10','',''),
('M_VIAL','12','',''),
('M_VIAL','13','',''),
('M_VIAL','14','',''),
('M_VIAL','16','',''),
('M_VIAL','17','',''),
('M_VIAL','18','',''),
('M_VIAL','19','',''),
('M_VIAL','2','',''),
('M_VIAL','20','',''),
('M_VIAL','40','',''),
('M_VIAL','50','',''),
('M_VIALMETER','0','',''),
('M_VIALMETER','10','',''),
('M_VIALMETER','20','',''),
('M_VIALMETER','30','',''),
('M_VIALMETER','5','',''),
('M_VPLAY2','0','',''),
('M_VPLAY2','1','',''),
('M_VPLAY2','2','',''),
('M_VPLAY3','0','',''),
('M_VPLAY3','1','',''),
('M_VPLAY3','2','','');
