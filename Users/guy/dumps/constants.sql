drop table if exists constants;
create table constants
(
    [name]      text unique primary key on conflist replace not null,
    [value]     text
);

insert into constants ([name],[value]) values 
('1000/1',0x3e8),
('ADD_CATCH_TIME',0x78),
('BURN_TIME',0x1e),
('CHEMCOST',0x0),
('DETIME',0x7),
('EMOTIONS_PER_LEVEL',0x10),
('FISH_BURN_TIME',0xa),
('HAS_TEMPLATE',0x10),
('IDD_CITY_KEY1',0x200),
('IDD_FISH1',0x1140),
('IDD_FISH10-IDD_FISH1',0x9),
('IDD_SPELL01-IDD_FISHASH1',0x6617),
('IDD_SPELx01-IDD_SPELL01',0x10),
('IDD_TEMPLATE01',0x601),
('IDS_POLE1B',0x1110),
('IDp_FEMALE',0x100),
('IDp_MALE',0x160),
('IDp_xxHAPPY',0x0),
('IDp_xxHURT',0x1),
('IDp_xxKISS',0x2),
('IDp_xxMAD',0x3),
('IDp_xxSAD',0x4),
('IDp_xxSTRESS',0x6),
('IDp_xxSURPRISED',0x5),
('IDp_xxWAVE',0x7),
('M02_KEYED',0x9),
('M02_LOCKED',0xf),
('M02_OPENEMPTY',0x0),
('M12_SHELF_FULL',0x3),
('M12_SPRING_PRESENT',0x2),
('M12_WATER_FULL',0x4),
('MAX_AURAS',0x18),
('MAX_DRYPIT',0x14),
('MAX_DRYPIT-1',0x13),
('MAX_KARMA',0xa),
('MAX_PEDS',0xa),
('MAX_VIAL_STORAGE',0x14),
('MAX_WISDOM/MAX_LEVEL',0x28),
('MIN_CATCH_TIME',0x14),
('ON_FIRE',0x28),
('OP_BURN',0x8002),
('PTR(WIP1)',0x90),
('PTR(WIP2)',0x91),
('S00_SQUARE00',0x7100),
('S00_SQUARE00+0',0x7100),
('S00_SQUARE00+1',0x7101),
('S00_SQUARE00+10',0x710a),
('S00_SQUARE00+11',0x710b),
('S00_SQUARE00+12',0x710c),
('S00_SQUARE00+13',0x710d),
('S00_SQUARE00+14',0x710e),
('S00_SQUARE00+15',0x710f),
('S00_SQUARE00+2',0x7102),
('S00_SQUARE00+3',0x7103),
('S00_SQUARE00+4',0x7104),
('S00_SQUARE00+5',0x7105),
('S00_SQUARE00+6',0x7106),
('S00_SQUARE00+7',0x7107),
('S00_SQUARE00+8',0x7108),
('S00_SQUARE00+9',0x7109),
('S00_SQUARE48',0x7130),
('S00_SQUARE48+1',0x7131),
('S00_SQUARE48+2',0x7132),
('S00_SQUARE48+3',0x7133),
('S00_SQUARE48+4',0x7134),
('S00_SQUARE48+5',0x7135),
('S00_SQUARE48+6',0x7136),
('S00_SQUARE48+7',0x7137),
('S00_SQUARE56+0',0x7138),
('S00_SQUARE56+1',0x7139),
('S00_SQUARE56+2',0x713a),
('S00_SQUARE56+3',0x713b),
('S00_SQUARE56+4',0x713c),
('S00_SQUARE56+5',0x713d),
('S00_SQUARE56+6',0x713e),
('S00_SQUARE56+7',0x713f),
('S00_SQUARE63',0x713f),
('S02_BIN___XX-S02_LOCK__XX',0x1),
('S02_BIN___XX-S02_VIAL__XX',0x2),
('SCROLL_SPELL',0x6),
('SIG_DEC1',0x19),
('SIG_DEC10',0x1b),
('SIG_INC1',0x18),
('SIG_INC10',0x1a),
('SYNC_FISH1',0x1),
('SYNC_FOULWIND',0x0),
('TEMPLATE_CHEM1',0x3),
('TEMPLATE_CHEM2',0x4),
('TEMPLATE_COST',0x2),
('TEMPLATE_OBJECTS',0x1),
('WIP_DISP01',0x10),
('WIP_DISP10',0x12),
('WIP_S02_EBIN',0x14),
('WIP_S02_LOCK',0x11),
('WIP_S02_VIAL',0x10);
