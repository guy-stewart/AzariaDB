
drop table if exists sounds;
create table sounds
(
    [name]      text,
    [value]     text,
    [id]        int,   -- DEPRECATED / IGNORED
    primary key ([name]) on conflict replace
);

insert into sounds values ('EFFECT_CLICK','wrong value please repalce',0);
insert into sounds values ('EFFECT_CLICK','pop',0);
insert into sounds values ('SOUND_NARRATION','narrative',0);

insert into sounds values ('SOUND_BTNDRAG', 	'btndrag',0);
insert into sounds values ('SOUND_BTNPRESS',	'btnpress',0);
insert into sounds values ('SOUND_POPUP',   	'lever',0);
insert into sounds values ('SOUND_CLUNK',   	'clunk',0);
insert into sounds values ('SOUND_FIRE',    	'fire',0);
insert into sounds values ('SOUND_CLICK',   	'choose',0); 
insert into sounds values ('SOUND_HURT',    	'hurt',0);
insert into sounds values ('SOUND_BURBLE',  	'burble',0);  
insert into sounds values ('SOUND_THUNDER', 	'thunder',0);   
insert into sounds values ('SOUND_EXPLODE', 	'explode',0);  
insert into sounds values ('SOUND_POP',     	'pop',0);
insert into sounds values ('SOUND_ARROW',   	'movingar',0); 
insert into sounds values ('SOUND_TON',     	'ton',0);
insert into sounds values ('SOUND_SLURP',   	'slurp',0);  
insert into sounds values ('SOUND_SPIT',    	'spit',0);
insert into sounds values ('SOUND_FUZZBUZZ',	'fuzzbuzz',0);   
insert into sounds values ('SOUND_BUZZFUZZ',	'buzzfuzz',0);  
