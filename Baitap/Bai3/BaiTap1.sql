use QuanLySinhVien;
--  Hiển thị tất cả các sinh viên có tên bắt đầu bằng ký tự 'h':
SELECT * FROM Student
WHERE StudentName LIKE 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12:
SELECT * FROM Class
WHERE EXTRACT(MONTH FROM StartDate) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3 đến 5:
SELECT * FROM Subject
WHERE Credit BETWEEN 3 AND 5;
-- Thay đổi mã lớp (ClassID) của sinh viên có tên 'Hung' thành 2:
UPDATE Student
SET ClassId = 2
WHERE StudentName = 'Hung';
SELECT * FROM Student;
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (Mark) giảm dần, nếu trùng sắp theo tên tăng dần:
SELECT S.StudentName, Su.SubName, M.Mark
FROM Mark M
JOIN Student S ON M.StudentId = S.StudentId
JOIN Subject Su ON M.SubId = Su.SubId
ORDER BY M.Mark DESC, S.StudentName ASC;


