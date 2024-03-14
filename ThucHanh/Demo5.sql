-- Lấy tên của giảng viên và học viên, 
-- đồng thời hiển thị trình độ tương ứng
-- Mac dinh khong có mo ta thi hien thi trinh do 'cu nhan'
/*
Trung thac si
Tung  cu nhan
*/
select ten, trinh_do
from giao_vien
union all
select ten, "cu nhan" as trinh_do
from hoc_vien;

create or replace view ten_trinh_do
as
	select ten, trinh_do
	from giao_vien
	union all
	select ten, "cu nhan" as trinh_do
	from hoc_vien;

select * from ten_trinh_do;

update ten_trinh_do
set trinh_do = 'tien si'
where ten = 'Hung';

create view hoc_vien_ten
as
	select ma_hv, ten
    from hoc_vien;

update hoc_vien_ten
set ten = 'Hung New'
where ma_hv = 1;


select table_name, is_updatable
from information_schema.views
where table_schema = 'c1123_student'

-- Xây dựng thủ tục tính tổng 2 số nguyên truyền vào
-- và trả về kết quả cho người dùng
DELIMITER $$
create procedure sum_number(in a int, in b int, out c int)
begin
	set c = a + b;
end $$
DELIMITER ;

call sum_number(1, 7, @tong);
select @tong;

-- Viết thủ tục nhận vào giá trị là 1 số nguyên.
-- thủ tục sẽ tăng giá trị của số nguyên lên 1 đơn vị và trả về kết quả
DELIMITER $$
create procedure add_number(inout a int)
begin
	set a = a + 1;
end $$
DELIMITER ;

set @a = 2;
call add_number(@a);
select @a;


explain select *
from hoc_vien
where ten = 'Sang';

explain select *
from hoc_vien
where ma_hv = 2;

show indexes from hoc_vien;

/* implict index (Clustered index) ==> DBMS tạo ngầm định ==> primary key*/

-- Non-Clustered index
/* Single column */
create index ten_index on hoc_vien(ten);

/* unique column */
-- create unique index ten_index on hoc_vien(ten);

/* compisite */
create index ten_index on hoc_vien(ten, dia_chi);