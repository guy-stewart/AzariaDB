-- map entries are used to map an op(key) to a value.
-- used declaratively the syntax might be:
-- op([key], _value). Or specifically burn(fish1, _value).
-- functional syntax might look more like this:
-- int i_value = op[key];

drop table if exists map_obj;
create table map_obj
(
    [op]       text,
    [key]  text,
    [value]  text,
    PRIMARY KEY ([op],[key]) ON CONFLICT REPLACE);

insert into map_obj ([op],[key],[value]) values 
('IDD_POLE1','IDD_BAIT0','IDD_POLE1B0'),
('IDD_POLE1','IDD_BAIT1','IDD_POLE1B1'),
('IDD_POLE1','IDD_BAIT2','IDD_POLE1B2'),
('IDD_POLE1','IDD_BAIT3','IDD_POLE1B3'),
('IDD_POLE1','IDD_BAIT4','IDD_POLE1B4'),
('IDD_POLE1','IDD_BAIT5','IDD_POLE1B5'),
('IDD_POLE1','IDD_BAIT6','IDD_POLE1B6'),
('IDD_POLE1','IDD_BAIT7','IDD_POLE1B7'),
('IDD_POLE1','IDD_BAIT8','IDD_POLE1B8'),
('IDD_POLE1','IDD_BAIT9','IDD_POLE1B9'),
('IDD_POLE1','IDD_LUNCHCRUMBS','IDD_POLE1B9'),
('IDD_POLE2','IDD_BAIT0','IDD_POLE2B0'),
('IDD_POLE2','IDD_BAIT1','IDD_POLE2B1'),
('IDD_POLE2','IDD_BAIT2','IDD_POLE2B2'),
('IDD_POLE2','IDD_BAIT3','IDD_POLE2B3'),
('IDD_POLE2','IDD_BAIT4','IDD_POLE2B4'),
('IDD_POLE2','IDD_BAIT5','IDD_POLE2B5'),
('IDD_POLE2','IDD_BAIT6','IDD_POLE2B6'),
('IDD_POLE2','IDD_BAIT7','IDD_POLE2B7'),
('IDD_POLE2','IDD_BAIT8','IDD_POLE2B8'),
('IDD_POLE2','IDD_BAIT9','IDD_POLE2B9'),
('OP_BURN','IDD_FISH1','IDD_FISHASH1'),
('OP_BURN','IDD_FISH2','IDD_FISHASH2'),
('OP_BURN','IDD_FISH3','IDD_FISHASH3'),
('OP_BURN','IDD_FISH4','IDD_FISHASH4'),
('OP_BURN','IDD_FISH5','IDD_FISHASH5'),
('OP_BURN','IDD_FISH6','IDD_FISHASH6'),
('OP_BURN','IDD_FISH7','IDD_FISHASH7'),
('OP_BURN','IDD_FISH8','IDD_FISHASH8'),
('OP_BURN','IDD_FISH9','IDD_FISHASH9'),
('OP_BURN','IDD_FISH10','IDD_FISHASH10'),
('OP_KING_ME','IDD_WKING','IDD_WKINGME'),
('OP_KING_ME','IDD_BKING','IDD_BKINGME');
