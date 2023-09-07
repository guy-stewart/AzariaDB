-- courtesy TblAutomatons::Dump()drop table if exists automatons;
create table automatons
(
    [name]    text,
    [start]   text,
    [doc]     text,
    PRIMARY KEY ([name]) ON CONFLICT REPLACE);

insert into automatons ([name]) values 
('0x0030','0',''),
('0x0031','0',''),
('0x0032','0',''),
('0x0033','0',''),
('0x0034','0',''),
('0x0035','0',''),
('0x0036','0',''),
('0x0037','0',''),
('0x0038','0',''),
('0x0039','0',''),
('0x0049','0',''),
('0x1000','0',''),
('0x1001','0',''),
('M02_BIN','0',''),
('M02_DN1','0',''),
('M02_DN10','0',''),
('M02_LOCK','0',''),
('M02_NUM1','0',''),
('M02_NUM10','0',''),
('M02_UP1','0',''),
('M02_UP10','0',''),
('M02_VIAL','0',''),
('M04_BIN','0',''),
('M04_KEYCLAMP','0',''),
('M04_SLIDER','0',''),
('M04_VIAL','0',''),
('M05_BUBBLE','0',''),
('M05_CHEM','0',''),
('M05_DOWN','0',''),
('M05_ICON','0',''),
('M05_NUM1','0',''),
('M05_NUM10','0',''),
('M05_UP','0',''),
('M05_VIAL','0',''),
('M06_CYCLE_COMP1','0',''),
('M06_CYCLE_COMP2','0',''),
('M06_CYCLE_COMP3','0',''),
('M06_CYCLE_TEMPL_ANIM','0',''),
('M06_CYCLE_TEMPL_DN_BTN','0',''),
('M06_CYCLE_TEMPL_UP_BTN','0',''),
('M06_CYCLE_VIEW','0',''),
('M06_EJECT_CARD_ANIM','0',''),
('M06_EJECT_CARD_BTN','0',''),
('M06_EJECT_TEMPL_ANIM','0',''),
('M06_PEZPOP','0',''),
('M06_TEMPHOLD','0',''),
('M06_TEMPL_EJECT_BTN','0',''),
('M06_TRI1','0',''),
('M06_TRI2','0',''),
('M06_TRI3','0',''),
('M06_TRI4','0',''),
('M08_BEEM','0',''),
('M08_BIN','0',''),
('M08_CARDHOLD','0',''),
('M08_CHEMHOLD1','0',''),
('M08_CHEMIND1','0',''),
('M08_HOPPER','0',''),
('M10_DRYPIT','0',''),
('M10_FLOWER','0',''),
('M11_ASCENT','0',''),
('M11_FIRE','0',''),
('M11_GRILL','0',''),
('M12_ASHSHELF','0',''),
('M12_CANDLE','0',''),
('M12_ING_FSH','0',''),
('M12_ING_NATA','0',''),
('M12_ING_NATB','0',''),
('M12_ING_NATC','0',''),
('M12_ING_NY','0',''),
('M12_ING_STD','0',''),
('M12_SPRING','0',''),
('M12_WATER','0',''),
('M12_xCANDLE','0',' The candle casts the spell.
WIP1: CANDLELIGHT
WIP2: NYSTROMADDED
WIP3: INGREDIENTS_MGR
WIP4: SCROLL holder
SIG_EMPTY: From candlelight when candle burns out
'),
('M12_xCANDLELIGHT','0',''),
('M12_xING_MGR','0','used in the temple to hold ingredients for spell making.
WIP1: The scroll holder
WIP2: The scroll map
SIG_SHOW: A scroll was dropped
SIG_HIDE: The scroll was grabbed
SIG_CLOSE: The spell is cast
SIG_CHECK: Check spell ingredients'),
('M12_xMAGIC','0',''),
('M12_xNYSTROMADDED','0',''),
('M12_xPLANT','0','used in the temple to hold ingredients for spell making.
WIP1: The scroll holder
WIP2: The scroll map
SIG_SHOW: A scroll was dropped
SIG_HIDE: The scroll was grabbed
SIG_CLOSE: The spell is cast'),
('M12_xSCROLL','0',''),
('M12_xSPELLPORTAL','0',''),
('M16_BLOBDROP','0',''),
('M16_BLOBHOLDER','0',''),
('M16_BLOBHOLDER_E','0',''),
('M16_BLOBHOLE','0',''),
('M16_BLOBRESET','0',''),
('M16_COMBINER','0',''),
('M16_DICEDROP','0',''),
('M16_DICEROLL','0',''),
('M16_DICESTAKE','0',''),
('M16_DIEROLL','0',''),
('M16_PAYBUCKET','0',''),
('M16_PAYGRAB','0',''),
('M16_PAYSTAMP','0',''),
('M16_POTTERY','0',''),
('M16_POTTERYCHECK','0',''),
('M16_POTTERYDROP','0',''),
('M17_DOORWAY','0',''),
('M17_FFIELD','0',''),
('M17_FOULWIND','0',''),
('M17_LOCKBURN','0',''),
('M17_LOCKSOCKET','0',''),
('M17_MINE','0',''),
('M19_BUTTON','0',''),
('M19_DICEHOLD','0',''),
('M19_HOLDER','0',''),
('M19_PAYBUCKET','0',''),
('M19_PICK','0',''),
('M19_PLAYERWATCHER','0',''),
('M19_SPELLCASTER','0',''),
('M19_SPIN','0',''),
('M19_SQUARE','0',''),
('M24_BIGEYE','0',''),
('M24_EYEPLATE','0',''),
('M24_EYESPELL','0',''),
('M24_EYETEXT','0',''),
('M25_EXITDOOR','0',''),
('M25_OPNDOOR','0',''),
('M25_ROLL','0',''),
('M25_RUMBLE','0',''),
('M25_SCATTER','0',''),
('M26_BANISH','0',''),
('MEFLIN_COORD','0',''),
('M_ALARM','0',''),
('M_ANIBIN','0',''),
('M_ANIPORTAL','0',''),
('M_AURA','0',''),
('M_BACKBUTTON','0',''),
('M_BAITSTATION','0',''),
('M_BARD','0',''),
('M_BIN','0',''),
('M_BTN_1phase','0',''),
('M_BTN_2phase','0',''),
('M_CHESS','0',''),
('M_CLAM','0',''),
('M_CLEAR','0',''),
('M_CLICKBAIT','0',''),
('M_COMPASS','0',''),
('M_DIGGABLE','0',''),
('M_DISKSPIN','0',''),
('M_EYEINFO','0',''),
('M_FISHSTATION','0',''),
('M_FLYBINa','0',''),
('M_FLYBINb','0',''),
('M_GOPABIN','0',''),
('M_HALO','0',''),
('M_HIDELIST','0',''),
('M_HIDER','0',''),
('M_ID','0',''),
('M_IDSPELL','0',''),
('M_INV_LEFT','0',''),
('M_INV_RIGHT','0',''),
('M_KAMALTAR','0',''),
('M_KAMDOOR','0',''),
('M_KAMDOOR_alt','0',''),
('M_KAMRAIN','0',''),
('M_LEVDOOR','0',''),
('M_LEVER','0',''),
('M_LEVSTOP','0',''),
('M_LISTEN','0',''),
('M_LUNCHPORTAL','0',''),
('M_MAPBUTTON','0',''),
('M_MEFPAN_OK','0',''),
('M_MEFPAN_OKR','0',''),
('M_MEF_APPROACH','0',''),
('M_MEF_TALK','0',''),
('M_MEMOBJ','0',''),
('M_MEMORY','0',''),
('M_NATURE','0',''),
('M_OBJECTBIN','0',''),
('M_OBJECTMAP','0',''),
('M_OLIEOLIE','0',''),
('M_ORIESPEAKER','0',''),
('M_O_AURA','0',''),
('M_O_IDSPELL','0',''),
('M_O_PED','0',''),
('M_PLANTBIN','0',''),
('M_POLESTAND','0',''),
('M_PORTAL','0',''),
('M_RECORD_COMPLETE','0',''),
('M_RECORD_COUNTER','0',''),
('M_RECYCLE','0',''),
('M_REC_COMPLETE','0',''),
('M_REC_COUNTER','0',''),
('M_SQUARE','0',''),
('M_STATEDOOR','0',''),
('M_STATESCALE','0',''),
('M_STATESCALEV','0',''),
('M_TALK','0',''),
('M_TEST1','0',''),
('M_TEST2','0',''),
('M_TEST3','0',''),
('M_TEST4','0',''),
('M_TEST5','0',''),
('M_TEST6','0',''),
('M_TEST7','0',''),
('M_TEST8','0',''),
('M_TEST9','0',''),
('M_TEXT_DOWN','0',''),
('M_TEXT_UP','0',''),
('M_TIMEDVPLAY','0',''),
('M_TIMEDVPLAY2','0',''),
('M_TINYFISH','0',''),
('M_VIAL','0',''),
('M_VIALMETER','0',''),
('M_VPLAY2','0',''),
('M_VPLAY3','0','');
