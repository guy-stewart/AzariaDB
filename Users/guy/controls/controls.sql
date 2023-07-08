


/*

CONTROL(view, id, type, image, image_selected, position(x,y), border, values, default, ids_font, font_color )

Type:
LABEL
BUTTON
CHECKBOX
LISTBOX
EDITBOX

ids_font:
IDS_FONTENG
IDS_FONTPAR
IDS_FONTVILL
IDS_FONTCITY
IDS_FONTENG_BIG
IDS_FONTPAR_BIG
IDS_FONTVILL_BIG
IDS_FONTCITY_BIG
IDS_FONTTNR12
IDS_FONTTNR14
IDS_FONTTNR16
IDS_FONTTNR18
IDS_FONTTNB12
IDS_FONTTNB14
IDS_FONTTNB16
IDS_FONTTNB18

font_colors:
RED   = 0x0000FF
GREEN = 0x00FF00
BLUE  = 0xFF0000
*/

drop table if exists controls;
create table controls
(
    [view]    text,
    [id]   int,
    [type] text,
    [image]     text,
    [image_selected]     text,
    [x] int,
    [y] int,
    [border] int,
    [values] text,
    [default] text,
    [ids_font] text,
    [font_color] int,
    [code] text,
    PRIMARY KEY ([view],[id]) ON CONFLICT REPLACE);


insert into controls (view, id, [type],[image],image_selected,x,y,border,[values],[default],[ids_font],[font_color]) values
('IDV_CTLTEST1', 1, 'LABEL',    'IDS_REDDOT',       '',                   200, 130, 0,
' This is a test string
      line two
      line three
and this is line FOUR.','', 'IDS_FONTTNR12', 0xFF8888), 
('IDV_CTLTEST1', 2, 'BUTTON',   'IDS_BTN_OK',       'IDS_BTN_OK_HI',       50,  60, 0, '','','',0),
('IDV_CTLTEST1', 3, 'BUTTON',   'IDS_BTN_DOWN',     'IDS_BTN_OK_HI',       50, 110, 0, '','','',0),
('IDV_CTLTEST1', 4, 'CHECKBOX', 'IDS_BTN_VILCULT',  'IDS_BTN_VILCULT_HI',  50, 160, 0, '','','',0),
('IDV_CTLTEST1', 5, 'EDITBOX',  'IDS_STD_EDITBOXM', 'IDS_BTN_DOWN_HI',    200,  50, 10, 'My Edit Box', 'default','IDS_FONTTNR12',0x44FFFF);

delete from views where view_name = 'IDV_CTLTEST1';
insert into views ([view_id],[view_name],[Z],[backgroundAudio],[locator_view],[behavior_id],[portal_filename],[surface_filename] ) values
(6587,'IDV_CTLTEST1',1,3,1,1,'wdepanel.vct','spacebak');