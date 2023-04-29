

delete from views where view_name = 'IDV_CAFE_01';
insert into views values (
    0xCAFE0001,     -- View ID. Unique. Deprecated, will be removed from future versions.
    'IDV_CAFE_01',  -- Name. A universally unique name for this view.
    1,              -- Z paint order from back to front.
    0,              -- Background audio ID
    1,              -- '1' = view is used to locate the player in the universe.
    6,              -- Behavior ID. Deprecated.
    'surround.vct', -- Mask for projecting the view to the display
    'cafe_01');     -- Background image for the view


-- Add a link from the map to jump into our demo view
delete from triggers where [to] = 'IDV_CAFE_01';
insert into triggers values ('IDV_CONTINENT',0,0,100,100,'IDV_CAFE_01');

-- Add a state machine instance within the view:
insert into machines values (
    0x10,             -- machine instance ID. deprecated.
    'S60_CAFE_BELL',  -- machine instance name. Universally unique.
    0xCAFE0001,       -- view ID. Deprecated.
    'IDV_CAFE_01',    -- view name.
    222,12,275,63,    -- machine region within view (left, top, right, bottom)
    3,                -- local visibility
    'M_DOORBELL',     -- DFA name 
    'IDS_DESKBELL',   -- DFA instance parameter 1
    0x0,              -- deprecated.
    '',               -- DFA instance parameter 2
    0x0,              -- deprecated.
    '',               -- DFA instance parameter 3
    0x0,              -- deprecated.
    '',               -- DFA instance parameter 4
    0x0);              -- deprecated.

-- DFA M_DOORBELL
insert into transitions values ('M_DOORBELL',0,1,'SHOW','WIP1','');
insert into transitions values ('M_DOORBELL',1,2,'CLICK','','');
insert into transitions values ('M_DOORBELL',1,2,'CLICK','','');

