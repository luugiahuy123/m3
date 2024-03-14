-- Lấy thông tin sinh viên và cho biết sv đó đang học lớp nào, khóa.
SELECT ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
FROM hoc_vien
INNER JOIN lop ON hoc_vien.ma_lop = lop.ma_lop;

-- Lấy thông tin sinh viên và cho biết sv đó đang học lớp nào, khóa.
-- bao gồm cả sinh viên mới đăng ký (chưa có lớp)
SELECT ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
FROM hoc_vien
LEFT JOIN lop ON hoc_vien.ma_lop = lop.ma_lop;

-- Lấy thông tin sinh viên và cho biết sv đó đang học lớp nào, khóa.
-- bao gồm thông tin các lớp chưa khai giảng
SELECT ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
FROM hoc_vien
RIGHT JOIN lop ON hoc_vien.ma_lop = lop.ma_lop;

-- Lấy toàn bộ thông tin của 2 table trên
SELECT ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
FROM hoc_vien
LEFT JOIN lop ON hoc_vien.ma_lop = lop.ma_lop
UNION
SELECT ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
FROM hoc_vien
RIGHT JOIN lop ON hoc_vien.ma_lop = lop.ma_lop;

-- thong tin hv ở Đà Nẵng
SELECT ma_hv, ten, ngay_sinh, dia_chi, ma_lop
FROM hoc_vien
WHERE dia_chi = 'Da Nang';


SELECT ma_hv, ten, ngay_sinh, dia_chi, ma_lop
FROM hoc_vien
WHERE ten like '%u%';

-- Đếm số lượng học viên của mỗi lớp
-- C11 1
-- C12 2
SELECT ma_lop, count(ma_hv) as so_luong
FROM hoc_vien
where ma_lop is not null
group by ma_lop;


-- Đếm số lượng học viên của mỗi lớp (chỉ hiển thị lớp có số lượng >= 2)
SELECT ma_lop, count(ma_hv) as so_luong
FROM hoc_vien
where ma_lop is not null
group by ma_lop
having so_luong >= 2;

select *
from hoc_vien
order by dia_chi, ngay_sinh desc;