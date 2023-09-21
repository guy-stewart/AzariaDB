

/*
(0x20,'IDV_TOPMENU',1,0,1,6,'surround.vct','spacemen'),
(0x21,'IDV_CFGPLAYER1',1,0,1,10,'wdepanel.vct','spacebak'),
(0x22,'IDV_CFGPLAYER2',1,0,1,10,'wdepanel.vct','spacebak'),
(0x23,'IDV_CFGPROV',1,0,1,9,'wdepanel.vct','spacebak'),
(0x24,'IDV_CFGSESS',1,0,1,9,'wdepanel.vct','spacebak'),
(0x25,'IDV_CFGNEWSESS',1,0,1,9,'wdepanel.vct','spacebak'),
(0x26,'IDV_CFGGAME',1,0,1,11,'wdepanel.vct','spacebak'),
(0x27,'IDV_CFGAV',1,0,1,12,'wdepanel.vct','spacebak'),
*/
delete from machines where view_name = 'IDV_TOPMENU';
insert into machines ([name],[view_name],[left],[top],[right],[bottom],[local_visible],[dfa_name], [wip1_name],[wip2_name],[wip3_name],[wip4_name]) values
('BTN_QUIT','IDV_TOPMENU',390,216,518,271,2,'M_BTN_1phase','0','IDS_BTN_QUIT','',''),
('BTN_CREDITS','IDV_TOPMENU',793,221,921,276,2,'M_BTN_1phase','IDV_CREDITS','IDS_BTN_CREDITS','',''),
('BTN_CFGAV','IDV_TOPMENU',1438,224,1566,279,2,'M_BTN_1phase','IDV_CFGAV','IDS_BTN_AUDIO','',''),
('BTN_CFGPLAYER','IDV_TOPMENU',1916,222,2044,277,2,'M_BTN_1phase','IDV_CFGPLAYER1','IDS_BTN_PLAYER','',''),
('BTN_CFGGAME','IDV_TOPMENU',2216,219,2344,274,2,'M_BTN_1phase','IDV_CFGGAME','IDS_BTN_GAME','',''),
('BTN_CFGPROVIDER','IDV_TOPMENU',2568,216,2696,271,2,'M_BTN_1phase','IDV_CFGPROV','IDS_BTN_NETWORK','',''),
('BTN_HELP','IDV_TOPMENU',3000,215,3128,270,2,'M_BTN_1phase','IDV_HELP','IDS_BTN_HELP','','');

delete from transitions where automaton = 'M_BTN_1phase';
insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code], [guard], [doc]) values
('M_BTN_1phase','0','0','CLICK','','',
'PLAYWAVE(SOUND_BTNPRESS);
LOADVIEW(WIP1);
SHOW();','',''),
('M_BTN_1phase','0','0','DRAGFOCUS','0','FALSE','SHOW();','',''),
('M_BTN_1phase','0','0','DRAGFOCUS','0','TRUE',
'WSPRITE=WIP2;
SHOW(WSPRITE);
PLAYWAVE(SOUND_BTNDRAG);','','');