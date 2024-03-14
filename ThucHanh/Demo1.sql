SELECT * FROM C11_DB.mon_hoc;
-- tao table 
insert into mon_hoc(ma_mh,ten_mh)
-- them du lieu vao table mon hoc
value (2,'hoa'),(3,'Ly'),(4,'Sinh');
-- cap nhat 
update mon_hoc
set ten_mh = 'A'
WHERE ma_mh = 2;
-- xoa record id  = 2
delete from mon_hoc
where ma_mh = 2;
-- them column hoc phi
alter table mon_hoc
add column hoc_phi int;