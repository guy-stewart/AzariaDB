drop table if exists sounds;

create table sounds
(
    [name]      text unique primary key not null,
    [value]     text,
    [id]        int
);

insert into sounds values ('SOUND_BTNDRAG',	 'btndrag' , 1);
insert into sounds values ('SOUND_BTNPRESS', 'btnpress', 2);
insert into sounds values ('SOUND_POPUP',	 'lever'   , 3);
insert into sounds values ('SOUND_CLUNK',	 'clunk'   , 4);
insert into sounds values ('SOUND_FIRE',	 'fire'    , 5);
insert into sounds values ('SOUND_CLICK',	 'choose'  , 6);
insert into sounds values ('SOUND_HURT',	 'hurt'    , 7);
insert into sounds values ('SOUND_BURBLE',	 'burble'  , 8);
insert into sounds values ('SOUND_THUNDER',	 'thunder' , 9);
insert into sounds values ('SOUND_EXPLODE',	 'explode' ,10);
insert into sounds values ('SOUND_POP',      'pop'     ,11);
insert into sounds values ('SOUND_ARROW',    'movingar',12);
insert into sounds values ('SOUND_TON',	     'ton'     ,13);
insert into sounds values ('SOUND_SLURP',    'slurp'   ,14);
insert into sounds values ('SOUND_SPIT',     'spit'    ,15);
insert into sounds values ('SOUND_FUZZBUZZ', 'fuzzbuzz',16);
insert into sounds values ('SOUND_BUZZFUZZ', 'buzzfuzz',17);
