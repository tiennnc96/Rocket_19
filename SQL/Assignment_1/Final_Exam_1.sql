DROP DATABASE IF EXISTS Final_Exam_1  ;
CREATE DATABASE IF NOT EXISTS Final_Exam_1;
USE Final_Exam_1;
	-- 1
-- ___________________________________________________________________________________________
DROP TABLE IF  EXISTS `Student`;
CREATE TABLE `Student` (
    `ID` 	TINYINT AUTO_INCREMENT PRIMARY KEY,
	`Name` 	VARCHAR(100),
    `Age` 	INT UNSIGNED,
    `Gender` BIT 
    );
    
INSERT INTO `final_exam_1`.`student` (`Name`, `Age`, `Gender`) VALUES ('Nguyen Ngoc Tien', '25', 0);
INSERT INTO `final_exam_1`.`student` (`Name`, `Age`, `Gender`) VALUES ('Tran Nguyen Ngoc', '24',1);
INSERT INTO `final_exam_1`.`student` (`Name`, `Age`, `Gender`) VALUES ('Ta Huyen Trang', '25', 0);
INSERT INTO `final_exam_1`.`student` (`Name`, `Age`, `Gender`) VALUES ('Le Ngoc Mai', '24', 1);
INSERT INTO `final_exam_1`.`student` (`Name`, `Age`, `Gender`) VALUES ('Le Nguyen Ngoc', '23',1);
INSERT INTO `final_exam_1`.`student` (`Name`, `Age`, `Gender`) VALUES ('Nguyen Le Hien', '22',1);
INSERT INTO `final_exam_1`.`student` (`Name`, `Age`) VALUES ('Nguyen Ngoc Manh','22');
    
-- ___________________________________________________________________________________________
DROP TABLE IF  EXISTS `Subject`;
CREATE TABLE `Subject` (
	`ID` 	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Name` 	VARCHAR(100)
);

INSERT INTO `final_exam_1`.`subject` (`Name`) VALUES ('Toan ');
INSERT INTO `final_exam_1`.`subject` (`Name`) VALUES ('Van ');
INSERT INTO `final_exam_1`.`subject` (`Name`) VALUES ('Su');
INSERT INTO `final_exam_1`.`subject` (`Name`) VALUES ('Dia');
INSERT INTO `final_exam_1`.`subject` (`Name`) VALUES ('Vat ly');
INSERT INTO `final_exam_1`.`subject` (`Name`) VALUES ('Hoa Hoc');
INSERT INTO `final_exam_1`.`subject` (`Name`) VALUES ('Tin Hoc');

-- ___________________________________________________________________________________________
DROP TABLE IF  EXISTS `StudentSubject`;
CREATE TABLE `StudentSubject` (
	`StudentID` 	TINYINT,
    `SubjectID`		TINYINT,
    `Mark` 			TINYINT UNSIGNED,
    `Date` 			DATETIME,
     PRIMARY KEY (StudentID,SubjectID)
);
INSERT INTO `final_exam_1`.`studentsubject` (`StudentID`, `SubjectID`, `Mark`, `Date`) VALUES ('1', '2', '9', '2021-01-22');
INSERT INTO `final_exam_1`.`studentsubject` (`StudentID`, `SubjectID`, `Mark`, `Date`) VALUES ('2', '1', '10', '2021-02-23');
INSERT INTO `final_exam_1`.`studentsubject` (`StudentID`, `SubjectID`, `Mark`, `Date`) VALUES ('4', '3', '8', '2021-03-21');
INSERT INTO `final_exam_1`.`studentsubject` (`StudentID`, `SubjectID`, `Mark`, `Date`) VALUES ('3', '2', '7', '2021-04-22');
INSERT INTO `final_exam_1`.`studentsubject` (`StudentID`, `SubjectID`, `Mark`, `Date`) VALUES ('5', '4', '9', '2021-05-22');
INSERT INTO `final_exam_1`.`studentsubject` (`StudentID`, `SubjectID`, `Mark`, `Date`) VALUES ('1', '5', '10', '2021-02-01');

-- ___________________________________________________________________________________________
/* 2. Viết lệnh để 
a) Lấy tất cả các môn học không có bất kì điểm nào  */

WITH CTE_Monhoc_khongCoDiemNao AS 
( 
SELECT * FROM studentsubject ss  
RIGHT JOIN `subject` sub On ss.SubjectID = sub.ID
)
SELECT * FROM CTE_Monhoc_khongCoDiemNao WHERE subjectID is null;
;
/* b) Lấy danh sách các môn học có ít nhất 2 điểm  */ 
WITH CTE_Monhoc AS 
(
SELECT sub.ID, sub.Name, count(sub.ID) AS Total 
FROM studentsubject ss JOIN `subject` sub On ss.SubjectID = sub.ID 
Group by sub.ID
) 
SELECT `Name` , Total FROM CTE_Monhoc WHERE Total > 1 ;
-- ___________________________________________________________________________________________
/*3. Tạo view có tên là "StudentInfo" lấy các thông tin về học sinh bao gồm: 
Student ID,Subject ID, Student Name, Student Age, Student Gender, 
Subject Name, Mark, Date  */
CREATE OR REPLACE VIEW StudentInfo AS
    SELECT 
        STU.ID AS StudentID,
        SUB.ID AS SubjectID,
        STU.NAME AS StudentName,
        STU.AGE AS StudentAge,
        CASE 
			WHEN Gender = '0' THEN 'Female'
			WHEN Gender = '1' THEN 'Male'
			ELSE 'Unknow'
		END AS Gender,
        SUB.NAME AS SubjectName,
        SS.MARK AS MARK,
        SS.DATE AS `DATE`
    FROM
        student STU
            LEFT JOIN
        studentsubject SS ON STU.ID = SS.StudentID
            LEFT JOIN
        `subject` SUB ON SS.SubjectID = SUB.ID;

SELECT * FROM StudentInfo;
-- ___________________________________________________________________________________________
/* 4. Không sử dụng On Update Cascade & On Delete Cascade
a) Tạo trigger cho table Subject có tên là SubjectUpdateID:
Khi thay đổi data của cột ID của table Subject, thì giá trị tương
ứng với cột SubjectID của table StudentSubject cũng thay đổi
theo*/

DROP TRIGGER IF EXISTS SubjectUpdateID;
DELIMITER $$
	CREATE TRIGGER SubjectUpdateID
    BEFORE update ON `Subject`
    FOR EACH ROW
    BEGIN
		UPDATE `studentsubject` SET `SubjectID` =  new.id where `SubjectID` = old.ID;
    END $$
DELIMITER ;

select * FROm subject;
select * FROm studentsubject;
begin work;
	UPDATE `subject` SET `ID` =  30 where `ID` = 3;
rollback;

/*b) Tạo trigger cho table Student có tên là StudentDeleteID:
Khi xóa data của cột ID của table Student, 
thì giá trị tương ứng với cột SubjectID của table StudentSubject cũng bị xóa theo*/

DROP TRIGGER IF EXISTS SubjectUpdateID;
DELIMITER $$
	CREATE TRIGGER SubjectUpdateID
    BEFORE delete ON `student`
    FOR EACH ROW
    BEGIN
		delete from studentsubject where StudentID = old.id;
    END $$
DELIMITER ;

begin work;
delete from `student` where `ID` =  3;
rollback;
-- ___________________________________________________________________________________________
/* 5. Viết 1 store procedure (có 2 parameters: student name) sẽ xóa tất cả các 
thông tin liên quan tới học sinh có cùng tên như parameter 
Trong trường hợp nhập vào student name = "*" thì procedure sẽ xóa tất cả 
các học sinh  */

DROP PROCEDURE IF EXISTS p_delete_STU;
DELIMITER $$
	CREATE PROCEDURE p_delete_STU(IN stuName varchar(100))
    BEGIN
		DECLARE x int DEFAULT 0;
        IF (stuName != '*' ) THEN
			SELECT COUNT(ID) INTO x FROM student WHERE `Name` = stuName; --  ĐẾM SỐ STUDENT ĐÃ XÓA
			DELETE  FROM student WHERE `Name` = stuName; 
            
        ELSE 
			SELECT COUNT(*) INTO x FROM student;
			DELETE  FROM student; 
        END IF
        ;
		SELECT x AS 'So luong da xoa';
    END $$
DELIMITER ;
-- 0 row(s) affected, 1 warning(s): 1305 PROCEDURE final_exam_1.p_delete_STU does not exist

SELECT * FROM final_exam_1.student;

BEGIN WORK;
CALL p_delete_STU('Nguyen Ngoc Manh');
CALL p_delete_STU('*');
ROLLBACK;
-- ___________________________________________________________________________________________