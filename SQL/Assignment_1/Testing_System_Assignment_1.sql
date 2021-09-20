DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
	-- 1

DROP TABLE IF  EXISTS `Department`;
CREATE TABLE `Department` (
    `DepartmentID` 		TINYINT AUTO_INCREMENT PRIMARY KEY,
	`DepartmentName` 	VARCHAR(255)
);
	-- 2
DROP TABLE IF  EXISTS `Position`;
CREATE TABLE `Position` (
    `PositionID` 	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `PositionName` 	ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);

	-- 3
DROP TABLE IF  EXISTS`Account`;
CREATE TABLE `Account` (
    `AccountID` 	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Email` 		VARCHAR(255) NOT NULL,
    `Username` 		VARCHAR(255) NOT NULL,
    `FullName` 		VARCHAR(255) NOT NULL,
    `DepartmentID` 	TINYINT NOT NULL,
    `PositionID` 	TINYINT NOT NULL,
    `CreateDate` 	DATETIME NOT NULL,
	CONSTRAINT fk_Department FOREIGN KEY (`DepartmentID`)
        REFERENCES `Department` (`DepartmentID`),
    CONSTRAINT fk_Position FOREIGN KEY (`PositionID`)
        REFERENCES `Position` (`PositionID`)
);
	-- 4
DROP TABLE IF  EXISTS `Group`;
CREATE TABLE `Group` (
    `GroupID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `GroupName` VARCHAR(255) NOT NULL,
    `CreatorID` TINYINT NOT NULL,
    `CreateDate` DATETIME NOT NULL
);

	-- 5
DROP TABLE IF  EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount` (
    `GroupID` TINYINT,
    `AccountID` TINYINT,
    `JoinDate` DATETIME,
    CONSTRAINT fk_Group2 FOREIGN KEY (`GroupID`)
        REFERENCES `Group` (`GroupID`),
    CONSTRAINT fk_Account2 FOREIGN KEY (`AccountID`)
        REFERENCES `Account` (`AccountID`)
);
	-- 6
DROP TABLE IF  EXISTS `TypeQuestion`;
CREATE TABLE `TypeQuestion` (
    `TypeID` 	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `TypeName` 	ENUM('Essay', ' Multiple-Choice')
);
	-- 7
DROP TABLE IF  EXISTS `CategoryQuestion`;
CREATE TABLE `CategoryQuestion` (
    `CategoryID` 	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `CategoryName` 	VARCHAR(255) NOT NULL
);
	-- 8
DROP TABLE IF  EXISTS `Question`;
CREATE TABLE `Question` (
    `QuestionID` 	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Content` 		VARCHAR(1000) NOT NULL,
    `CategoryID` 	TINYINT NOT NULL,
    `TypeID` 		TINYINT NOT NULL,
    `CreatorID` 	TINYINT NOT NULL,
    `CreateDate` 	DATETIME NOT NULL,
    CONSTRAINT fk_CategoryQuestion1 FOREIGN KEY (`CategoryID`)
        REFERENCES `CategoryQuestion` (`CategoryID`),
	CONSTRAINT fk_TypeQuestion1 FOREIGN KEY (`TypeID`) REFERENCES `TypeQuestion` (`TypeID`)
);
	-- 9
DROP TABLE IF  EXISTS `Answer`;
CREATE TABLE `Answer` (
    `AnswerID` 		TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Content` 		VARCHAR(1000) NOT NULL,
    `QuestionID` 	TINYINT NOT NULL,
    `isCorrect` 	ENUM('DUNG', 'SAI'),
   CONSTRAINT fk_Question1 FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`)
);
	-- 10
DROP TABLE  IF  EXISTS `Exam`;
CREATE TABLE `Exam` (
    `ExamID` 		TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Code` 			VARCHAR(10) NOT NULL,
    `Title` 		VARCHAR(255) NOT NULL,
    `CategoryID` 	TINYINT NOT NULL,
    `Duration` 		TINYINT NOT NULL,
    `CreatorID` 	TINYINT NOT NULL,
    `CreateDate` 	DATETIME NOT NULL,
    CONSTRAINT fk_Categoryquestion2 FOREIGN KEY (`CategoryID`)
        REFERENCES `Categoryquestion` (`CategoryID`)
);
ALTER TABLE `testing_system_assignment_1`.`exam` 
CHANGE COLUMN `Duration` `Duration` TINYINT NOT NULL ;

	-- 11
DROP TABLE  IF  EXISTS `ExamQuestion`;
CREATE TABLE `ExamQuestion` (
    `ExamID` 		TINYINT AUTO_INCREMENT PRIMARY KEY,
    `QuestionID` 	TINYINT NOT NULL,
    CONSTRAINT fk_Question2 FOREIGN KEY (`QuestionID`)
        REFERENCES `Question` (`QuestionID`)
);

/* Assignmrnt 2 */
/* Question 1:  Thêm ít nhất 10 record vào mỗi table */
INSERT INTO `department` (`DepartmentName`)
VALUE ('Phong Ky Thuat 1'),
       ('Phong Ky Thuat 2'),
       ('Phong Dev 1'),
       ('Phong Dev 2'),
       ('Phong Sale'),
       ('Phong Marketing'),
       ('Phong Giam Doc'),
       ('Phong Tai Chinh');
       
       
alter table `position` modify column `PositionName` enum ('Dev1', 'Dev2', 'PM', 'Leader', 'Scrum Master' , 'Test', 'Developer');
INSERT INTO `position`(`PositionName`)
VALUE ('Dev1'),('Dev2'),('PM'),('Scrum Master'),('Test') ,('Developer');
INSERT INTO `position`(`PositionName`)
VALUE ('Developer');


INSERT INTO `Account`(`Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`)
VALUES ('tiennnc96@gmail.com', 'vti1', 'Nguyen ngoc tien', 1, 1, '2021-05-20'),
       ('tiennnc1@gmail.com', 'vti2', 'Trinh Hoai Linh', 1, 2, '2020-12-01'),
       ('tiennnc2@gmail.com', 'vti3', 'Nguyen Van Test', 1, 1, '2020-07-01'),
       ('tiennnc3@gmail.com', 'vti4', 'Tran Van Tinh', 1, 2, '2019-09-01'),
       ('tiennnc4@gmail.com', 'account5', 'Ho Van Tinh', 3, 2, '2021-07-01'),
       ('tiennnc5@gmail.com', 'account_vti6', 'Cao Thai Son', 3, 1, '2019-10-01'),
       ('tiennnc6@gmail.com', 'account_vti7', 'Tran van linh', 3, 3, '2020-10-01'),
       ('tiennnc7@gmail.com', 'account_vti8', 'Nguyen Quynh Thu', 3, 4, '2019-04-01'),
       ('tiennnc8@gmail.com', 'account_vti9', 'Tran Kim Tuyen', 2, 1, '2019-12-01'),
       ('tiennnc9@gmail.com', 'account_vti10', 'Nguyen Ba Dao', 1, 5, '2019-10-01'),
       ('tiennnc10@gmail.com', 'account_vti11', 'Nguyen Van Binh', 1, 3, '2020-12-01');


INSERT INTO `Group`(`GroupName`, `CreatorID`, `CreateDate`)
VALUES ('Nhom 1', '3', '2021-04-03'),
       ('Nhom 2', '3', '2019-01-03'),
       ('Nhom 3', '2', '2020-04-03'),
       ('Nhom 4', '1', NOW()),
       ('Nhom 5', '3', '2021-06-03'),
       ('Nhom 6', '1', '2020-04-03'),
       ('Nhom 7', '5', '2021-04-03'),
       ('Nhom 8', '5', '2019-05-03'),
       ('Nhom 9', '3', '2019-01-03'),
       ('Nhom 10', '1', NOW());
	
INSERT INTO `GroupAccount`(`GroupID`, `AccountID`, `JoinDate`)
VALUES ('1', '1', '2021-06-01'),
       ('1', '3', '2020-01-01'),
       ('1', '2', NOW()),
       ('1', '4', '2021-06-01'),
       ('2', '1', '2021-06-01'),
       ('2', '10', '2019-05-01'),
       ('5', '1', '2021-06-01'),
       ('5', '3', '2020-01-01'),
       ('5', '4', '2021-07-01'),
       ('3', '1', '2021-06-01'),
       ('9', '2', '2021-06-01'),
       ('10', '1', NOW());    
       
INSERT INTO `TypeQuestion`(`TypeName`)
VALUES (' Multiple-Choice'),
       ('Essay');
       
INSERT INTO `CategoryQuestion` (`CategoryName`)
VALUES ('Java'),
       ('SQL'),
       ('HTML'),
       ('CSS '),
       ('.NET'),
       ('Python'),
       ('Ruby'),
       ('JavaScript');
       
INSERT INTO `Question`(`Content`, CategoryID, TypeID, CreatorID, CreateDate)
VALUES ('Câu hỏi SQL 1', 2, 2, 1, '2021-04-01'),
       ('Câu hỏi SQL 2', 2, 2, 2, '2020-01-01'),
       ('Câu hỏi JAVA 1', 1, 1, 10, '2021-07-01'),
       ('Câu hỏi JAVA 2', 1, 2, 5, '2021-06-01'),
       ('Câu hỏi HTML 1', 3, 1, 2, NOW()),
       ('Câu hỏi HTML 2', 3, 2, 2, NOW());       
       
INSERT INTO `Answer` (`Content`, `QuestionID`, `isCorrect`)
VALUES ('Câu trả lời 1 - question SQL 1', 1, 'DUNG'),
       ('Câu trả lời 2 - question SQL 1', 1, 'SAI'),
       ('Câu trả lời 3 - question SQL 1', 1, 'DUNG'),
       ('Câu trả lời 4 - question SQL 1', 1, 'SAI'),
       ('Câu trả lời 1 - question SQL 2', 2, 'SAI'),
       ('Câu trả lời 2 - question SQL 2', 2, 'DUNG'),
       ('Câu trả lời 3 - question SQL 2', 2, 'SAI'),
       ('Câu trả lời 4 - question SQL 2', 2, 'SAI'),
       ('Câu trả lời 1 - question JAVA 1', 3, 'DUNG'),
       ('Câu trả lời 2 - question JAVA 1', 3, 'SAI'),
       ('Câu trả lời 1 - question JAVA 2', 4, 'DUNG'),
       ('Câu trả lời 2 - question JAVA 2', 4, 'SAI'),
       ('Câu trả lời 3 - question JAVA 2', 4, 'DUNG'),
       ('Câu trả lời 4 - question JAVA 2', 4, 'SAI'),
       ('Câu trả lời 1 - question HTML 1', 5, 'DUNG'),
       ('Câu trả lời 2 - question HTML 2', 5, 'DUNG');

INSERT INTO `Exam`(`Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`)
VALUES ('MS_01', 'De thi 01', 1, 90, 1, NOW()),
       ('MS_02', 'De thi 02', 1, 60, 5, NOW()),
       ('MS_03', 'De thi 03', 2, 60, 9, NOW()),
       ('MS_04', 'De thi 04', 2, 90, 1, NOW()),
       ('MS_05', 'De thi 05', 1, 60, 2, NOW()),
       ('MS_06', 'De thi 06', 2, 90, 2, NOW()),
       ('MS_07', 'De thi 07', 1, 60, 1, NOW());
SELECT * FROM exam;
INSERT INTO `ExamQuestion`
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 2),
       (6, 2),
       (7, 2),
       (8, 2),
       (9, 3),
       (10, 3),
       (11, 4),
       (12, 4),
       (13, 4),
       (14, 4),
       (15, 5),
       (16, 5);
       
								/* SQL – Assignment 3  */    
/* Question 1:  Thêm ít nhất 10 record vào mỗi table */

INSERT INTO `department` (`DepartmentName`)
VALUE 	('Phong Ky Thuat 2'),
		('Phong Ky Thuat 3'),
		('Phong Ky Thuat 4'),
		('Phong Ky Thuat 5'),
		('Phong Ky Thuat 6'),
		('Phong Ky Thuat 7'),
		('Phong Ky Thuat 8'),
		('Phong Ky Thuat 9'),
		('Phong Ky Thuat 10'),
		('Phong Ky Thuat 11');
        
INSERT INTO `position`(`PositionName`)
VALUE ('Dev1'),('Dev2'),('PM'),('Scrum Master'),('Test');

INSERT INTO `Account`(`Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`)
VALUES ('tiennnc20@gmail.com', 'vti5', 'Nguyen ngoc tien', 1, 1, '2021-05-20'),
       ('tiennnc21@gmail.com', 'vti6', 'Trinh Hoai Sa', 2, 2, '2019-12-01'),
       ('tiennnc22@gmail.com', 'vti7', 'Nguyen Hoang Sa', 3, 3, '2020-10-01'),
       ('tiennn23@gmail.com', 'vti8', 'Nguyen Truong Sa', 2, 4, '2020-01-01'),
       ('tiennn24@gmail.com', 'vti9', 'Le Van Tu', 3, 5, '2019-08-01'),
       ('tiennn25@gmail.com', 'vti10', 'Pham Thi Dao', 1, 1, '2020-02-01'),
       ('tiennnc26@gmail.com', 'vti11', 'Phan Thanh Hai', 1, 3, '2021-01-01'),
       ('tiennnc27@gmail.com', 'vti12', 'Phan Chu Chinh', 2, 2, '2020-12-01'),
       ('tiennnc28@gmail.com', 'vti13', 'Nguyen Tien Tu', 3, 5, '2021-02-01'),
       ('tiennn29@gmail.com', 'vti14', 'Trinh Van Lam', 1, 4, '2020-06-01');
       
INSERT INTO `Account`(`Email`, `Username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`)
VALUES ('tiennnc30@gmail.com', 'vti15', 'Doan Duy Ngo', 1, 1, '2021-05-20'),
 ('tiennnc31@gmail.com', 'vti16', 'Do Ngoc Dao', 1, 1, '2021-05-20');

INSERT INTO `Group`(`GroupName`, `CreatorID`, `CreateDate`)
VALUES ('Nhom 11', '3', '2021-04-03'),
       ('Nhom 12', '3', '2019-01-03'),
       ('Nhom 13', '2', '2020-04-03'),
       ('Nhom 14', '1', NOW()),
       ('Nhom 15', '3', '2021-06-03'),
       ('Nhom 16', '1', '2020-04-03'),
       ('Nhom 17', '5', '2021-04-03'),
       ('Nhom 18', '5', '2019-05-03'),
       ('Nhom 19', '3', '2019-01-03'),
       ('Nhom 20', '1', NOW());

INSERT INTO `GroupAccount`(`GroupID`, `AccountID`, `JoinDate`)
VALUES ('1', '2', '2021-06-01'),
       ('1', '3', '2020-01-01'),
       ('2', '2', NOW()),
       ('3', '4', '2021-06-01'),
       ('5', '1', '2021-06-01'),
       ('6', '10', '2019-05-01'),
       ('7', '1', '2021-06-01'),
       ('1', '3', '2020-01-01'),
       ('9', '4', '2021-07-01'),
       ('2', '1', '2021-06-01'),
       ('1', '2', '2021-06-01'),
       ('8', '1', NOW());  

INSERT INTO `GroupAccount`(`GroupID`, `AccountID`, `JoinDate`)
VALUES ('1', '5', '2021-06-01'),
       ('3', '5', '2020-01-01'),
       ('2', '5', NOW());
       
INSERT INTO `CategoryQuestion` (`CategoryName`)
VALUES ('Java1'),
		('Java2'),
		('Java3'),
       ('SQL1'),
       ('SQL2'),
       ('SQL3'),
       ('HTML1'),
       ('HTML2'),
       ('CSS 1'),
       ('CSS 2');
       
INSERT INTO `Question`(`Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`)
VALUES ('Câu hỏi SQL 3', 2, 2, 1, '2021-04-01'),
       ('Câu hỏi SQL 4', 2, 2, 2, '2021-01-01'),
       ('Câu hỏi SQL 5', 2, 2, 2, '2020-01-01'),
       ('Câu hỏi JAVA 3', 1, 1, 10, '2021-07-01'),
       ('Câu hỏi JAVA 4', 1, 1, 10, '2021-08-01'),
       ('Câu hỏi JAVA 5', 1, 1, 10, '2020-09-01'),
       ('Câu hỏi JAVA 6', 1, 1, 10, '2020-10-01'),
       ('Câu hỏi JAVA 7', 1, 1, 10, '2020-11-01'),
       ('Câu hỏi JAVA 8', 1, 1, 10, '2020-12-01'),
       ('Câu hỏi JAVA 0', 1, 2, 5, '2020-06-01');
       
INSERT INTO `Question`(`Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`)
VALUES ('Question SQL 3', 2, 2, 1, '2021-04-01'),
       ('Question SQL 4', 2, 2, 2, '2021-01-01'),
       ('Question SQL 5', 2, 2, 2, '2020-01-01'),
       ('Question JAVA 3', 1, 1, 10, '2021-07-01'),
       ('Question JAVA 4', 1, 1, 10, '2021-08-01'),
       ('Question JAVA 5', 1, 1, 10, '2020-09-01'),
       ('Question JAVA 6', 1, 1, 10, '2020-10-01'),
       ('Question JAVA 7', 1, 1, 10, '2020-11-01'),
       ('Question JAVA 8', 1, 1, 10, '2020-12-01'),
       ('Question JAVA 0', 1, 2, 5, '2020-06-01');
       
INSERT INTO `Answer` (`Content`, `QuestionID`, `isCorrect`)
VALUES ('Câu trả lời 5 - question SQL 1', 1, 'DUNG'),
       ('Câu trả lời 6 - question SQL 1', 1, 'SAI'),
       ('Câu trả lời 7 - question SQL 1', 1, 'DUNG'),
       ('Câu trả lời 8 - question SQL 1', 1, 'SAI'),
       ('Câu trả lời 5 - question SQL 2', 2, 'SAI'),
       ('Câu trả lời 6 - question SQL 2', 2, 'DUNG'),
       ('Câu trả lời 7 - question SQL 2', 2, 'SAI'),
       ('Câu trả lời 8 - question SQL 2', 2, 'SAI'),
       ('Câu trả lời 3 - question JAVA 1', 3, 'DUNG');
       
INSERT INTO `Exam`(`Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`)
VALUES ('MS_08', 'De thi 08', 1, 90, 1, '2021-08-01'),
       ('MS_09', 'De thi 09', 1, 60, 5, '2021-05-01'),
       ('MS_10', 'De thi 10', 2, 60, 9, '2021-07-01'),
       ('MS_11', 'De thi 11', 2, 90, 1, '2021-08-02'),
       ('MS_12', 'De thi 12', 1, 60, 2, '2021-03-01'),
       ('MS_13', 'De thi 13', 1, 60, 2, '2021-04-01'),
       ('MS_14', 'De thi 14', 2, 90, 2, '2021-03-15'),
       ('MS_15', 'De thi 15', 1, 60, 1, '2021-06-19');

INSERT INTO `Exam`(`Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`)
VALUES 	('MS_16', 'De thi 16', 1, 90, 1, '2019-08-01'),
		('MS_17', 'De thi 17', 1, 90, 1, '2019-09-01'),
		('MS_18', 'De thi 18', 1, 90, 1, '2019-10-01'),
		('MS_19', 'De thi 19', 1, 90, 1, '2019-11-01'); 
	
 /* Question 2: lấy ra tất cả các phòng ban */      
SELECT DepartmentName FROM department;

 /* Question 3: lấy ra id của phòng ban "Sale" */
 SELECT * FROM department;
 SELECT DepartmentID FROM department WHERE DepartmentName  LIKE ('%Sale%');
 SELECT DepartmentID FROM department WHERE DepartmentName = 'Phong Ky Thuat 8';
 
/* Question 4: lấy ra thông tin account có full name dài nhất */
 SELECT * FROM `account`;
 SELECT FullName, DepartmentID , character_length(FullName) AS Total FROM `account`;
SELECT *, CHARACTER_LENGTH(FullName) AS Total FROM `account` WHERE CHARACTER_LENGTH(FullName) = (SELECT MAX(CHARACTER_LENGTH(FullName)) FROM `account`);

/* Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3 */ 
SELECT * FROM `account`WHERE character_length(FullName) = (SELECT MAX(character_length(FullName)) FROM `account` where DepartmentID = 3) 
								AND DepartmentID = 3;

/* Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019 */
	SELECT GroupName FROM `group` WHERE CreateDate < '2019-12-20';
    
/* Question 7: Lấy ra ID của question có >= 4 câu trả lời */
SELECT * from answer;
SELECT QuestionID, COUNT(`QuestionID`) AS SL FROM    answer GROUP BY QuestionID HAVING SL >= 4; 

/* Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019 */
SELECT * FROM exam WHERE `Duration` >= 60  AND CreateDate < '2019-12-20';

/* Question 9: Lấy ra 5 group được tạo gần đây nhất */
SELECT * FROM `group`;
SELECT GroupName, CreateDate FROM `group` ORDER BY CreateDate DESC LIMIT 5;

/* Question 10: Đếm số nhân viên thuộc department có id = 2 */
SELECT *  FROM `account` WHERE  `DepartmentID` = 2 ;
SELECT COUNT(`DepartmentID`) AS SLNV  FROM `account` WHERE  `DepartmentID` = 2 ;

/* Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" */
SELECT * FROM `account` WHERE `FullName` LIKE 'D%' AND `FullName` LIKE '%o';

/* Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019 */
SELECT * FROM exam;
BEGIN WORK;
DELETE FROM exam WHERE `CreateDate` < '2019-12-20';
ROLLBACK;

/* Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "Question" */
SELECT * FROM question;
BEGIN WORK;
DELETE FROM question WHERE `Content` LIKE 'Question%';
ROLLBACK;

/* Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn */
SELECT * FROM `account`;
UPDATE `account` SET `FullName` = 'Nguyễn Bá Lộc' , `Email` = 'loc.nguyenba@vti.com.vn' WHERE `AccountID` = 5;

/* Question 15: update account có id = 5 sẽ thuộc group có id = 4 */
SELECT * FROM groupaccount;
UPDATE `groupaccount` SET `GroupID` = 4 WHERE `AccountID` = 5;

/* INNER JOIN */
SELECT * FROM `account` a JOIN `department` d ON a.DepartmentID = d.DepartmentID;
SELECT * FROM `account` a JOIN `department` d USING(DepartmentID); -- KHI 2 CỘT CỦA 2 BẢNG GIỐNG NHAU THÌ DÙNG USING



	/* SQL – Assignment 4 */ 
    
/* Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ */
SELECT * FROM `account` AS a LEFT JOIN `department` AS d ON a.DepartmentID = d.DepartmentID;

/* Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 01/12/2019 */
SELECT * FROM `account` AS a LEFT JOIN `department` AS d ON a.DepartmentID = d.DepartmentID WHERE CreateDate > '2019-12-01';

/* Question 3: Viết lệnh để lấy ra tất cả các Developer */
SELECT * FROM position;
SELECT * FROM `account` AS a LEFT JOIN `position` AS d ON a.PositionID = d.PositionID  WHERE PositionName LIKE 'Dev%' ;
/* Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên */
SELECT 
    *, COUNT(a.`DepartmentID`) AS SLNV
FROM
    `account` AS a
        JOIN
    `department` AS d ON a.DepartmentID = d.DepartmentID
GROUP BY a.DepartmentID
HAVING SLNV > 3;


/* Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất */
SELECT q.QuestionID, q.Content, COUNT(Content)  AS TotalQues
FROM `examquestion` AS e JOIN `question` AS q ON e.QuestionID = q.QuestionID
GROUP BY e.QuestionID
HAVING COUNT(e.QuestionID) = 
	( SELECT MAX(countQues) 
		FROM ( SELECT COUNT(e.QuestionID) AS countQues
				FROM examquestion AS e
				GROUP BY e.QuestionID) AS MaxTotalQues );

/* Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question */
SELECT q.CategoryID, c.CategoryName, COUNT(q.CategoryID) AS TotalQues FROM `question` as q INNER JOIN `categoryquestion` as c on q.CategoryID = c.CategoryID
GROUP BY q.CategoryID;

/* Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam*/
SELECT q.Content,COUNT(eq.QuestionID) AS TotalExam FROM `question` AS q LEFT JOIN `examquestion` AS eq ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID;


/* Question 8: Lấy ra Question có nhiều câu trả lời nhất */  
SELECT q.QuestionID, q.Content, COUNT(a.QuestionID) AS Count FROM answer AS a INNER JOIN question AS q ON a.QuestionID = q.QuestionID 
GROUP BY a.QuestionID 
HAVING COUNT(a.QuestionID) = (SELECT MAX(CountQues) FROM
									(SELECT COUNT(a.QuestionID) AS CountQues FROM answer AS a
										GROUP BY a.QuestionID) AS MaxTotalQues); 

/* Question 9: Thống kê số lượng account trong mỗi group */
SELECT g.GroupName,ga.GroupID,COUNT(ga.AccountID) AS TotalAcc  FROM `group` AS g INNER JOIN `groupaccount` AS ga ON g.GroupID = ga.GroupID 
GROUP BY ga.GroupID;

/* Question 10: Tìm chức vụ có ít người nhất*/
SELECT P.PositionID, P.PositionName, count( A.PositionID) AS SL FROM `account` A
INNER JOIN `position` P ON A.PositionID = P.PositionID
GROUP BY A.PositionID
HAVING count(A.PositionID)= (SELECT MIN(minP) FROM(
SELECT count(B.PositionID) AS minP FROM `account` B
GROUP BY B.PositionID) AS MinTatolPosi);

/* Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM */
 -- SELECT DepartmentID, PositionID , COUNT(*) AS SL FROM `account`
     -- GROUP BY DepartmentID,PositionID ORDER BY DepartmentID, PositionID;

SELECT   t.DepartmentName, t.PositionName, COUNT(UserName) AS `SL`
	FROM  `account` a RIGHT JOIN (SELECT * FROM department CROSS JOIN position) AS `t` 
    ON (a.DepartmentID = t.DepartmentID AND a.PositionID = t.PositionID)
GROUP BY t.DepartmentID , t.PositionID
ORDER BY t.DepartmentID , t.PositionID;

/* Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, … */
SELECT q.QuestionID, q.Content, a.FullName, tq.TypeName AS Author, ans.Content FROM question AS q 
INNER JOIN categoryquestion AS cq ON q.CategoryID = cq.CategoryID
INNER JOIN typequestion tq ON q.TypeID = tq.TypeID
INNER JOIN `account` a ON a.AccountID = q.CreatorID
INNER JOIN Answer AS ans ON q.QuestionID = ans.QuestionID
ORDER BY q.QuestionID ASC;


/* --  Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm */ 

SELECT tq.TypeID, tq.TypeName, COUNT(q.TypeID) AS SL FROM question q
INNER JOIN typequestion tq ON q.TypeID = tq.TypeID
GROUP BY q.TypeID; 

/* Question 14:Lấy ra group không có account nào */
SELECT * FROM `group` g
LEFT JOIN groupaccount ga ON g.GroupID = ga.GroupID
WHERE ga.AccountID IS NULL; 

/* Question 15: Lấy ra account không có group nào */ 
SELECT * FROM groupaccount;
SELECT * FROM `group` g RIGHT JOIN groupaccount ga ON g.GroupID = ga.GroupID WHERE ga.AccountID IS NULL;

/* Question 16: Lấy ra question không có answer nào*/
SELECT q.QuestionID FROM answer a
RIGHT JOIN question q on a.QuestionID = q.QuestionID
WHERE a.AnswerID IS NULL;


/* Question 17:
a) Lấy các account thuộc nhóm thứ 1 */
SELECT * FROM groupaccount ;
SELECT a.AccountID, a.FullName FROM `account` a 
INNER JOIN `groupaccount` ga on a.AccountID = ga.AccountID 
INNER JOIN `group` g on ga.GroupID =g.GroupID 
WHERE ga.GroupID = 1;

/*b) Lấy các account thuộc nhóm thứ 2*/ 
SELECT a.AccountID, a.FullName FROM `Account` a
JOIN `groupaccount` ga ON a.AccountID = ga.AccountID
WHERE ga.GroupID = 2;
/*c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau*/
SELECT a.AccountID, a.FullName FROM `account` a 
INNER JOIN `groupaccount` ga on a.AccountID = ga.AccountID 
INNER JOIN `group` g on ga.GroupID =g.GroupID 
WHERE ga.GroupID = 1
UNION
SELECT a.AccountID, a.FullName FROM `Account` a
JOIN `groupaccount` ga ON a.AccountID = ga.AccountID
WHERE ga.GroupID = 2;

/* Question 18:
/* a) Lấy các group có lớn hơn 5 thành viên*/
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) >= 5;

/* b) Lấy các group có nhỏ hơn 7 thành viên*/
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) <= 7;

-- c) Ghép 2 kết quả từ câu a) và câu b)*/
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) >= 5
UNION 
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) <= 7;

/**/
