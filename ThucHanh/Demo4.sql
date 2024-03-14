select ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
from hoc_vien
left join lop on hoc_vien.ma_lop = lop.ma_lop
union all
select ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
from hoc_vien
right join lop on hoc_vien.ma_lop = lop.ma_lop;

-- Lấy thông tin học viên có tuổi lớn nhất
SELECT *
FROM hoc_vien
order by ngay_sinh
limit 2;

-- Lấy 3 record liên tiếp từ id 3
SELECT *
FROM hoc_vien
limit 2, 40;

-- Lấy ngày sinh lớn nhất trong table hoc_vien
select min(ngay_sinh) as max
from hoc_vien;

-- Lấy ngày sinh lớn nhất theo từng địa chỉ
SELECT dia_chi, max(ngay_sinh) as max_ngay_sinh
FROM hoc_vien
group by dia_chi;

-- Lấy thông tin học viên có tuổi lớn nhất

-- SELECT ma_hv, ten, ngay_sinh, dia_chi, ma_Lop, 
-- max(ngay_sinh) as max_ngay_sinh
-- FROM hoc_vien
-- group by 

SELECT *
FROM hoc_vien
ORDER BY ngay_sinh
LIMIT 1;

SELECT *
FROM hoc_vien
GROUP BY ngay_sinh
having min(ngay_sinh);

SELECT *
FROM hoc_vien
where ngay_sinh = (
	select min(ngay_sinh) as min
	from hoc_vien
    );
    
-- C11 ==> CGVN-C11, 1 2 3 ==> NV-O1, NV-O2
select ma_hv, ten, ngay_sinh, dia_chi,
concat('CGVN-', ma_lop) as ma_lop
from hoc_vien;

-- chỉ hiển thị năm sinh
select ma_hv, ten, year(ngay_sinh) as nam_sinh, dia_chi,
concat('CGVN-', ma_lop) as ma_lop
from hoc_vien;

select ma_hv, ten, substring(ngay_sinh, 1, 4) as nam_sinh, dia_chi,
concat('CGVN-', ma_lop) as ma_lop
from hoc_vien;

-- Tính tuổi học viên (thêm column tuoi)
select ma_hv, ten, year(ngay_sinh) as nam_sinh,
year(curdate()) - year(ngay_sinh) as tuoi, dia_chi,
concat('CGVN-', ma_lop) as ma_lop
from hoc_vien;

select ma_hv, ten, year(ngay_sinh) as nam_sinh,
date_format(from_days(datediff(now(), ngay_sinh)), '%y') as tuoi, dia_chi,
concat('CGVN-', ma_lop) as ma_lop
from hoc_vien;


select ma_hv, ten, year(ngay_sinh) as nam_sinh,
timestampdiff(YEAR, ngay_sinh, now()) as tuoi, dia_chi,
concat('CGVN-', ma_lop) as ma_lop
from hoc_vien;