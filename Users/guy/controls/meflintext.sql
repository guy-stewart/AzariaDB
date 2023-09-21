
create table if not exists controls (
    [view]  text,
    [id]    text,
    [type]  text,
    [image] text,
    [image_selected] text,
    [x] int,
    [y] int,
    [border] int,
    [values] text,
    [default] text,
    [ids_font] text,
    [font_color] text,
    [code] text,
    PRIMARY KEY ([view],[id]) ON CONFLICT REPLACE);

/*
MEFLIN standing in a field:
*/
insert into machines values (0x3001,'S30_PATH2a',4391,'IDV_PATH1',140,120,300,280,0,'M_TEST_MEFLINa','IDS_EYESPELL', '','','' );
delete from transitions where [automaton] like 'M_TEST_MEFLINa';
insert into transitions ([automaton],[state],[new_state],[opcode],[param_1],[param_2],[code],[guard])
    values
        ('M_TEST_MEFLINa',0,1,'Z_EPSILON','','',
'MOV(WSPRITE,WIP1);
ASHOW(WSPRITE, V_LOOP);',''),
        ('M_TEST_MEFLINa',1,1,'CLICK','','',
'LOADVIEW(IDV_MEFLINTEXT);
SIGNAL(SXX_WAITER, "B");','');

/*
PARCHPAN:
*/
insert into controls values
('IDV_MEFLINTEXT','ID_MYLABEL','LABEL','CLISTBXL','',120, 30, 0,'default text','', 'IDS_FONTTNB16', 0x010101,'');

delete from views where view_name = 'IDV_MEFLINTEXT';

insert into views ([view_id],[view_name],[Z],[backgroundAudio],[locator_view],[behavior_id],[portal_filename],[surface_filename] ) values
(6588,'IDV_MEFLINTEXT',1,3,1,1,'wdepanel.vct','PARCHPAN');

delete from machines where view_name = 'IDV_MEFLINTEXT';
insert into machines values (0,'SXX_BUTTON',0,'IDV_MEFLINTEXT',30,120,30+64,120+64,1,'m_test_button','','','','' );
insert into machines values (0,'SXX_WAITER',0,'IDV_MEFLINTEXT',0,0,0,0,1,'m_test_waiter','','','','' );

delete from transitions where [automaton] = 'm_mefltext';
delete from transitions where [automaton] = 'm_test_button';
delete from transitions where [automaton] = 'm_test_waiter';
insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code], [guard]) values
('m_test_waiter','0','0','WAIT','A','','SETTEXT(ID_MYLABEL,"[A] This Is Some New Text");',''),

('m_test_waiter','0','0','WAIT','B','',
'SETTEXT(ID_MYLABEL,
"[B]
Notes:
  1. Labels need a background (sprite)
     Text is output to the sprite.
     Text is cleared by removing the sprite
  1. The sprite image can be transparent
     for example, a single color image
  2. Updated text is not saved.
     labels revert to the default text.
");',''),

('m_test_waiter','0','0','WAIT','C','',
'SETTEXT(ID_MYLABEL,
"[C]
Labels depend on their background image to clear text.
If the image is too small text will be left in the view.
This is a bug, but once fixed the excess text will be clipped, so just
make sure that your text fits on the label image!
Click OK to see what I mean.
");','');

insert into transitions ([automaton], [state], [new_state], [opcode], [param_1], [param_2], [code], [guard]) values
('m_test_button','0','a','Z_EPSILON','','','SHOW(IDS_BTN_OK);SETTEXT(ID_MYLABEL, "startup text");',''),
('m_test_button','a','b','CLICK','','','SIGNAL(SXX_WAITER,"A");',''),
('m_test_button','b','c','CLICK','','','SIGNAL(SXX_WAITER,"B");',''),
('m_test_button','c','a','CLICK','','','SIGNAL(SXX_WAITER,"C");','');
