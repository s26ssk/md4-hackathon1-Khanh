-- BAI 1 --
CREATE DATABASE QUANLYDIEMTHI;
USE QUANLYDIEMTHI;

CREATE TABLE student (
    studentId VARCHAR(4) NOT NULL PRIMARY KEY ,
    studentName VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    gender BIT(1) NOT NULL,
    address TEXT NOT NULL,
    phoneNumber VARCHAR(45)
);

CREATE TABLE subject (
    subjectId VARCHAR(4) NOT NULL PRIMARY KEY ,
    subjectName VARCHAR(45) NOT NULL,
    priority INT(11) NOT NULL 
);

CREATE TABLE mark (
    subjectId VARCHAR(4) NOT NULL,
    studentId VARCHAR(4) NOT NULL,
    point FLOAT NOT NULL,
    FOREIGN KEY (subjectId) REFERENCES subject(subjectId),
    FOREIGN KEY (studentId) REFERENCES student(studentId),
    PRIMARY KEY (subjectId, studentId)
);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- BAI 2 --
INSERT INTO student (studentId, studentName, birthday, gender, address, phoneNumber)
VALUES
    ('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
    ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
    ('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
    ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665353'),
    ('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
    ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '982654268'),
    ('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
    ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
    ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274673'),
    ('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');
    

INSERT INTO subject (subjectId, subjectName, priority)
VALUES
    ('MH01', 'Toán', 2),
    ('MH02', 'Vật Lý', 2),
    ('MH03', 'Hóa Học', 1),
    ('MH04', 'Ngữ Văn', 1),
    ('MH05', 'Tiếng Anh', 2);
    
INSERT INTO mark (subjectId, studentId, point)
VALUES
    -- Học sinh Nguyễn Thế Anh
    ('MH01', 'S001', 8.5), ('MH02', 'S001', 7), ('MH03', 'S001', 9), ('MH04', 'S001', 9), ('MH05', 'S001', 5),
    
    -- Học sinh Đặng Bảo Trâm
    ('MH01', 'S002', 9), ('MH02', 'S002', 8), ('MH03', 'S002', 6.5), ('MH04', 'S002', 8), ('MH05', 'S002', 6),
    
    -- Học sinh Trần Hà Phương
    ('MH01', 'S003', 7.5), ('MH02', 'S003', 6.5), ('MH03', 'S003', 8), ('MH04', 'S003', 7), ('MH05', 'S003', 7),
    
    -- Học sinh Đỗ Tiến Mạnh
    ('MH01', 'S004', 6), ('MH02', 'S004', 7), ('MH03', 'S004', 5), ('MH04', 'S004', 6.5), ('MH05', 'S004', 8),
    
    -- Học sinh Phạm Duy Nhất
    ('MH01', 'S005', 5.5), ('MH02', 'S005', 8), ('MH03', 'S005', 7.5), ('MH04', 'S005', 8.5), ('MH05', 'S005', 9),
    
    -- Học sinh Mai Văn Thái
    ('MH01', 'S006', 8), ('MH02', 'S006', 10), ('MH03', 'S006', 9), ('MH04', 'S006', 7.5), ('MH05', 'S006', 6.5),
    
    -- Học sinh Giang Gia Hân
    ('MH01', 'S007', 9.5), ('MH02', 'S007', 9), ('MH03', 'S007', 6), ('MH04', 'S007', 9), ('MH05', 'S007', 4),
    
    -- Học sinh Nguyễn Ngọc Bảo My
    ('MH01', 'S008', 10), ('MH02', 'S008', 8.5), ('MH03', 'S008', 8.5), ('MH04', 'S008', 6), ('MH05', 'S008', 9.5),
    
    -- Học sinh Nguyễn Tiến Đạt
    ('MH01', 'S009', 7.5), ('MH02', 'S009', 7), ('MH03', 'S009', 9), ('MH04', 'S009', 5), ('MH05', 'S009', 10),
    
    -- Học sinh Nguyễn Thiều Quang
    ('MH01', 'S010', 6.5), ('MH02', 'S010', 8), ('MH03', 'S010', 5.5), ('MH04', 'S010', 4), ('MH05', 'S010', 7);
    
-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
UPDATE student
SET studentName = 'Đỗ Đức Mạnh'
WHERE studentId = 'S004';

-- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
UPDATE subject
SET subjectName = 'Ngoại Ngữ', priority = 1
WHERE subjectId = 'MH05';

-- Cập nhật điểm mới của học sinh S009
UPDATE mark
SET point = 8.5
WHERE studentId = 'S009' AND subjectId = 'MH01';
UPDATE mark
SET point = 7
WHERE studentId = 'S009' AND subjectId = 'MH02';
UPDATE mark
SET point = 5.5
WHERE studentId = 'S009' AND subjectId = 'MH03';
UPDATE mark
SET point = 6
WHERE studentId = 'S009' AND subjectId = 'MH04';
UPDATE mark
SET point = 9
WHERE studentId = 'S009' AND subjectId = 'MH05';
    
-- Xóa thông tin điểm của học sinh S010 trong bảng MARK
DELETE FROM mark
WHERE studentId = 'S010';

-- Xóa thông tin học sinh S010 trong bảng STUDENT
DELETE FROM student
WHERE studentId = 'S010';

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- BAI 3 --
-- Lấy ra tất cả thông tin của sinh viên trong bảng Student
SELECT *
FROM student;

-- Hiển thị tên và mã môn học của những môn có hệ số bằng 1
SELECT subjectId, subjectName
FROM subject
WHERE priority = 1;

-- Hiển thị thông tin học sinh bao gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh
SELECT studentId, studentName, YEAR(CURDATE()) - YEAR(birthday) AS Tuoi, CASE WHEN gender = 1 THEN 'Nam' ELSE 'Nữ' END AS Gioi_Tinh, address AS Que_Quan
FROM student;

-- Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần
SELECT s.studentName, sub.subjectName, m.point
FROM mark m
JOIN student s ON m.studentId = s.studentId
JOIN subject sub ON m.subjectId = sub.subjectId
WHERE sub.subjectName = 'Toán'
ORDER BY m.point DESC;

-- Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng)
SELECT CASE WHEN gender = 1 THEN 'Nam' ELSE 'Nữ' END AS Gioi_Tinh, COUNT(*) AS So_Luong
FROM student
GROUP BY gender;

-- Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình
SELECT m.studentId, s.studentName,
       SUM(m.point) AS Tong_Diem,
       AVG(m.point) AS Diem_Trung_Binh
FROM mark m
JOIN student s ON m.studentId = s.studentId
GROUP BY m.studentId, s.studentName;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- BAI 4 --
-- Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán
CREATE VIEW STUDENT_VIEW AS
SELECT studentId, studentName,
       CASE WHEN gender = 1 THEN 'Nam' ELSE 'Nữ' END AS Gioi_Tinh,
       address AS Que_Quan
FROM student;

-- Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh, điểm trung bình các môn học
CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT m.studentId, s.studentName, AVG(m.point) AS Diem_Trung_Binh
FROM mark m
JOIN student s ON m.studentId = s.studentId
GROUP BY m.studentId, s.studentName;

-- Đánh Index cho trường `phoneNumber` của bảng STUDENT.
CREATE INDEX index_phoneNumber ON student (phoneNumber);

-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó
DELIMITER //
CREATE PROCEDURE PROC_INSERTSTUDENT(
    IN studentId_in VARCHAR(4),
    IN studentName_in VARCHAR(100),
    IN birthday_in DATE,
    IN gender_in BIT(1),
    IN address_in TEXT,
    IN phoneNumber_in VARCHAR(45)
)
BEGIN
    INSERT INTO student (studentId, studentName, birthday, gender, address, phoneNumber)
    VALUES (studentId_in, studentName_in, birthday_in, gender_in, address_in, phoneNumber_in);
END//
DELIMITER ;

-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học
DELIMITER //
CREATE PROCEDURE PROC_UPDATESUBJECT(
    IN subjectId VARCHAR(4),
    IN newSubjectName VARCHAR(45)
)
BEGIN
    UPDATE subject
    SET subjectName = newSubjectName
    WHERE subjectTd = subjectId;
END//
DELIMITER ;

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh và trả về số bản ghi đã xóa.
DELIMITER //
CREATE PROCEDURE PROC_DELETEMARK(
    IN studentId VARCHAR(4),
    OUT num_deleted INT
)
BEGIN
    DECLARE count_deleted INT DEFAULT 0;
    WHILE (EXISTS (SELECT 1 FROM mark WHERE studentTd = studentId)) DO
        DELETE FROM mark WHERE studentTd = studentId;
        SET count_deleted = count_deleted + 1;
    END WHILE;
    SET num_deleted = count_deleted;
END//
DELIMITER ;








