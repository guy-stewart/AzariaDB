drop table if exists constants;
create table constants
(
    [name]      text unique primary key not null,
    [value]     text
);

insert into constants values ('1000/1',0x3e8);
insert into constants values ('ADD_CATCH_TIME',0x78);
insert into constants values ('BURN_TIME',0x1e);
insert into constants values ('CHEMCOST',0x0);
insert into constants values ('DETIME',0x7);
insert into constants values ('EMOTIONS_PER_LEVEL',0x10);
insert into constants values ('FISH_BURN_TIME',0xa);
insert into constants values ('HAS_TEMPLATE',0x10);
insert into constants values ('IDC_BOMB',0xa);
insert into constants values ('IDC_FISH',0x3);
insert into constants values ('IDC_FISHASH',0x4);
insert into constants values ('IDC_KEY',0x5);
insert into constants values ('IDC_POLE',0x1);
insert into constants values ('IDC_SCROLL',0xc);
insert into constants values ('IDC_TEMPLATE',0x7);
insert into constants values ('IDC_TOKEN',0x9);
insert into constants values ('IDD_CITY_KEY1',0x200);
insert into constants values ('IDD_FISH1',0x1140);
insert into constants values ('IDD_FISH10-IDD_FISH1',0x9);
insert into constants values ('IDD_SPELL01-IDD_FISHASH1',0x6617);
insert into constants values ('IDD_SPELx01-IDD_SPELL01',0x10);
insert into constants values ('IDD_TEMPLATE01',0x601);
insert into constants values ('IDS_POLE1B',0x1110);
insert into constants values ('IDp_FEMALE',0x100);
insert into constants values ('IDp_MALE',0x160);
insert into constants values ('IDp_xxHAPPY',0x0);
insert into constants values ('IDp_xxHURT',0x1);
insert into constants values ('IDp_xxKISS',0x2);
insert into constants values ('IDp_xxMAD',0x3);
insert into constants values ('IDp_xxSAD',0x4);
insert into constants values ('IDp_xxSTRESS',0x6);
insert into constants values ('IDp_xxSURPRISED',0x5);
insert into constants values ('IDp_xxWAVE',0x7);
insert into constants values ('ISA_BAIT',0x7001);
insert into constants values ('ISA_BAITEDPOLE',0x7002);
insert into constants values ('M02_KEYED',0x9);
insert into constants values ('M02_LOCKED',0xf);
insert into constants values ('M02_OPENEMPTY',0x0);
insert into constants values ('M12_SHELF_FULL',0x3);
insert into constants values ('M12_SPRING_PRESENT',0x2);
insert into constants values ('M12_WATER_FULL',0x4);
insert into constants values ('MAX_AURAS',0x18);
insert into constants values ('MAX_DRYPIT',0x14);
insert into constants values ('MAX_DRYPIT-1',0x13);
insert into constants values ('MAX_KARMA',0xa);
insert into constants values ('MAX_PEDS',0xa);
insert into constants values ('MAX_VIAL_STORAGE',0x14);
insert into constants values ('MAX_WISDOM/MAX_LEVEL',0x28);
insert into constants values ('MIN_CATCH_TIME',0x14);
insert into constants values ('ON_FIRE',0x28);
insert into constants values ('OP_BURN',0x8002);
insert into constants values ('PTR(WIP1)',0x90);
insert into constants values ('PTR(WIP2)',0x91);
insert into constants values ('S00_SQUARE00',0x7100);
insert into constants values ('S00_SQUARE00+0',0x7100);
insert into constants values ('S00_SQUARE00+1',0x7101);
insert into constants values ('S00_SQUARE00+10',0x710a);
insert into constants values ('S00_SQUARE00+11',0x710b);
insert into constants values ('S00_SQUARE00+12',0x710c);
insert into constants values ('S00_SQUARE00+13',0x710d);
insert into constants values ('S00_SQUARE00+14',0x710e);
insert into constants values ('S00_SQUARE00+15',0x710f);
insert into constants values ('S00_SQUARE00+2',0x7102);
insert into constants values ('S00_SQUARE00+3',0x7103);
insert into constants values ('S00_SQUARE00+4',0x7104);
insert into constants values ('S00_SQUARE00+5',0x7105);
insert into constants values ('S00_SQUARE00+6',0x7106);
insert into constants values ('S00_SQUARE00+7',0x7107);
insert into constants values ('S00_SQUARE00+8',0x7108);
insert into constants values ('S00_SQUARE00+9',0x7109);
insert into constants values ('S00_SQUARE48',0x7130);
insert into constants values ('S00_SQUARE48+1',0x7131);
insert into constants values ('S00_SQUARE48+2',0x7132);
insert into constants values ('S00_SQUARE48+3',0x7133);
insert into constants values ('S00_SQUARE48+4',0x7134);
insert into constants values ('S00_SQUARE48+5',0x7135);
insert into constants values ('S00_SQUARE48+6',0x7136);
insert into constants values ('S00_SQUARE48+7',0x7137);
insert into constants values ('S00_SQUARE56+0',0x7138);
insert into constants values ('S00_SQUARE56+1',0x7139);
insert into constants values ('S00_SQUARE56+2',0x713a);
insert into constants values ('S00_SQUARE56+3',0x713b);
insert into constants values ('S00_SQUARE56+4',0x713c);
insert into constants values ('S00_SQUARE56+5',0x713d);
insert into constants values ('S00_SQUARE56+6',0x713e);
insert into constants values ('S00_SQUARE56+7',0x713f);
insert into constants values ('S00_SQUARE63',0x713f);
insert into constants values ('S02_BIN___XX-S02_LOCK__XX',0x1);
insert into constants values ('S02_BIN___XX-S02_VIAL__XX',0x2);
insert into constants values ('SCROLL_SPELL',0x6);
insert into constants values ('SIG_DEC1',0x19);
insert into constants values ('SIG_DEC10',0x1b);
insert into constants values ('SIG_INC1',0x18);
insert into constants values ('SIG_INC10',0x1a);
insert into constants values ('SYNC_FISH1',0x1);
insert into constants values ('SYNC_FOULWIND',0x0);
insert into constants values ('TEMPLATE_CHEM1',0x3);
insert into constants values ('TEMPLATE_CHEM2',0x4);
insert into constants values ('TEMPLATE_COST',0x2);
insert into constants values ('TEMPLATE_OBJECTS',0x1);
insert into constants values ('WIP_DISP01',0x10);
insert into constants values ('WIP_DISP10',0x12);
insert into constants values ('WIP_S02_EBIN',0x14);
insert into constants values ('WIP_S02_LOCK',0x11);
insert into constants values ('WIP_S02_VIAL',0x10);