drop table if exists isa;
create table isa
(
    [class]   text not null,
    [member]  text not null,
    PRIMARY KEY ([class],[member]) ON CONFLICT REPLACE);

insert into isa ([class],[member])  values
('ISA_BAIT','IDD_BAIT0'),
('ISA_BAIT','IDD_BAIT1'),
('ISA_BAIT','IDD_BAIT2'),
('ISA_BAIT','IDD_BAIT3'),
('ISA_BAIT','IDD_BAIT4'),
('ISA_BAIT','IDD_BAIT5'),
('ISA_BAIT','IDD_BAIT6'),
('ISA_BAIT','IDD_BAIT7'),
('ISA_BAIT','IDD_BAIT8'),
('ISA_BAIT','IDD_BAIT9'),
('ISA_BAITEDPOLE','IDD_POLE1B0'),
('ISA_BAITEDPOLE','IDD_POLE1B1'),
('ISA_BAITEDPOLE','IDD_POLE1B2'),
('ISA_BAITEDPOLE','IDD_POLE1B3'),
('ISA_BAITEDPOLE','IDD_POLE1B4'),
('ISA_BAITEDPOLE','IDD_POLE1B5'),
('ISA_BAITEDPOLE','IDD_POLE1B6'),
('ISA_BAITEDPOLE','IDD_POLE1B7'),
('ISA_BAITEDPOLE','IDD_POLE1B8'),
('ISA_BAITEDPOLE','IDD_POLE1B9'),
('ISA_BAITEDPOLE','IDD_POLE2B0'),
('ISA_BAITEDPOLE','IDD_POLE2B1'),
('ISA_BAITEDPOLE','IDD_POLE2B2'),
('ISA_BAITEDPOLE','IDD_POLE2B3'),
('ISA_BAITEDPOLE','IDD_POLE2B4'),
('ISA_BAITEDPOLE','IDD_POLE2B5'),
('ISA_BAITEDPOLE','IDD_POLE2B6'),
('ISA_BAITEDPOLE','IDD_POLE2B7'),
('ISA_BAITEDPOLE','IDD_POLE2B8'),
('ISA_BAITEDPOLE','IDD_POLE2B9'),
('ISA_LOCKDROP','IDD_BOMB1'),
('ISA_LOCKDROP','IDD_BOMB2'),
('ISA_LOCKDROP','IDD_CITLOCK'),
('ISA_LOCKDROP','IDD_VILLOCK'),
('ISA_NYSTROMVIAL','IDD_VIAL2'),
('ISA_NYSTROMVIAL','IDD_VIAL3'),
('ISA_NYSTROMVIAL','IDD_VIAL1'),
('ISA_ENCHANTEDSTONE','IDD_ENCSTONE'),
('ISA_PLNT_FENAPRIAL_FERN','IDD_FERNLEAF'),
('ISA_PLNT_CASIPEM_BERRYS','IDD_BLUEBERRY'),
('ISA_PLNT_CASIPEM_BERRYS','IDD_REDBERRY'),
('ISA_PLNT_TREONIC_LEAF','IDD_LEAF'),
('ISA_PLNT_PEDOFIC_LEAF','IDD_GLEAFSPT'),
('ISA_PLNT_PEDOFIC_LEAF','IDD_PLEAFSPT'),
('ISA_PLNT_THINIUS_SPORE','IDD_OMUSHSPT'),
('ISA_PLNT_GORDIUS_SPORE','IDD_YMUSHSPT'),
('ISA_PLNT_BRUSHERBIUS_FLOWER','IDD_FLOWERD'),
('ISA_PLNT_CARTONIST_FLOWER','IDD_PFLWRSPT'),
('ISA_PLNT_CARTONIST_FLOWER','IDD_WFLWRSPT'),
('ISA_PLNT_CARTONIST_FLOWER','IDD_YFLWRSPT'),
('ISA_PLNT_CARTONIST_FLOWER','IDD_FLOWERD'),
('ISA_PLNT_SHYANTHIUS_FLOWER','IDD_FLOWERR'),
('ISA_PLNT_ITSIUS_BERRY','IDD_WILDBERRY'),
('ISA_PLNT_PAKSIUM_ROOT','IDD_ROOTDBL'),
('ISA_PLNT_SPECROOT','IDD_ROOTBLUE'),
('ISA_PLNT_RIPE_GOPA','IDD_GOPAB'),
('ISA_PLNT_RIPE_GOPA','IDD_GOPAR');
delete from constants where [name] like 'ISA_%';
delete from constants where [name] like 'IDC_%';
