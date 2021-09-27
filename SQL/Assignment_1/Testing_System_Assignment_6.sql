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
        
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------        
/* SQL – Assignment 6
Cách nộp bài: xem folder "Hướng dẫn nộp bài qua Git"
Chú ý: Tạo 1 File SQL đặt tên là "Testing_System_Assignment_6"
Exercise 1: Tiếp tục với Database Testing System
Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
account thuộc phòng ban đó*/
CREATE OR REPLACE VIEW v_accDP AS(
	SELECT * FROM `account` a JOIN department dp USING(DepartmentID)
);
SELECT * FROM v_accDP;

DROP PROCEDURE IF EXISTS printAccByDpName;
DELIMITER $$
	CREATE PROCEDURE printAccByDpName(IN uName VARCHAR(50))
    BEGIN
		SELECT DepartmentName, DepartmentID, FullName, AccountID FROM v_accDP WHERE DepartmentName = uName;
        
    END $$
DELIMITER ;
CALL printAccByDpName('Phong Dev 1');
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
/*Question 2: Tạo store để in ra số lượng account trong mỗi group*/
CREATE or REPLACE VIEW v_TotalAccDP AS 
(
	SELECT *, COUNT(DepartmentID) AS TotalAcc 
    FROM `account` a JOIN department dp USING(DepartmentID) 
    GROUP BY DepartmentID
);

DROP PROCEDURE IF EXISTS printTotalAcc;
DELIMITER $$
	CREATE PROCEDURE printTotalAcc(IN ID INT)
    BEGIN
		SELECT DepartmentID, DepartmentName, TotalAcc FROM v_TotalAccDP WHERE DepartmentID = ID;
    END $$
DELIMITER ;
CALL printTotalAcc(1);
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
/* Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại */
CREATE OR REPLACE VIEW v_quest_And_Typequest AS
(
	SELECT * FROM question q JOIN typequestion tq USING(TypeID) 
 );
 -- ,COUNT(TypeID) AS TotalQuest 
SELECT * FROM v_quest_And_Typequest;
DROP PROCEDURE IF EXISTS printTotalQuest;
DELIMITER $$
	CREATE PROCEDURE printTotalQuest()
    BEGIN
		SELECT TypeID, TypeName, COUNT(TypeID) AS TotalQuest 
        FROM v_quest_And_Typequest 
        WHERE month(CreateDate) = month(now()) AND year(CreateDate) = year(now()) 
        GROUP BY TypeID;
        
    END $$
DELIMITER ;
CALL printTotalQuest();
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
/* 	Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất 
	Question 5: Sử dụng store ở question 4 để tìm ra tên của type question */
CREATE OR REPLACE VIEW v_quest_And_Typequest AS
(
	SELECT *,COUNT(TypeID) AS TotalQuest  FROM question q JOIN typequestion tq USING(TypeID) 
    GROUP BY TypeID 
 );
 -- ,COUNT(TypeID) AS TotalQuest 
SELECT * FROM v_quest_And_Typequest;

DROP PROCEDURE IF EXISTS printMaxTypeQuest;
DELIMITER $$
	CREATE PROCEDURE printMaxTypeQuest()
    BEGIN
		SELECT TypeID, TypeName 
        FROM v_quest_And_Typequest 
        WHERE TotalQuest = (SELECT MAX(TotalQuest) FROM v_quest_And_Typequest);
        
    END $$
DELIMITER ;
CALL printMaxTypeQuest();
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
/* Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
chuỗi của người dùng nhập vào */
CREATE OR REPLACE VIEW v_Acc_Group AS
(
	SELECT * FROM `account` a JOIN `groupaccount` tq USING(AccountID) 
    
 );
 -- ,COUNT(TypeID) AS TotalQuest 
SELECT * FROM v_Acc_Group;

DROP PROCEDURE IF EXISTS printUserName;
DELIMITER $$
	CREATE PROCEDURE printUserName()
    BEGIN
		
        
    END $$
DELIMITER ;
CALL printUserName();
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
/*Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
dụng store ở câu 9 để xóa)
Sau đó in số lượng record đã remove từ các table liên quan trong khi
removing */
DROP PROCEDURE IF EXISTS p_delete_before_3y;
DELIMITER $$
	CREATE PROCEDURE p_delete_before_3y()
    BEGIN
		DECLARE i int DEFAULT 1;
        DECLARE countEX int;
        
        CREATE TABLE tbTemp(
			id INT PRIMARY KEY AUTO_INCREMENT,
            idExam INT 
        );
        
		SELECT COUNT(ExamID) INTO CountEX FROM `exam` WHERE (year(now()) - year(CreateDate)) > 2;
        
        INSERT INTO tbTemp(idExam) SELECT ExamID FROM `exam` WHERE (year(now()) - year(CreateDate)) > 2;
        
        WHILE(i <= countEx) DO
			DELETE FROM exam WHERE ExamID = (SELECT idExam FROM tbTemp WHERE id = 1);
            DELETE FROM examquestion WHERE ExamID =  (SELECT idExam FROM tbTemp WHERE id = 1);
			SET i = i+1;
        END WHILE;
        
        SELECT CountEx AS `So luong da xoa`;
    END $$
DELIMITER ;
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------
/* Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay */
CREATE TABLE monthT(
	id TINYINT PRIMARY KEY
);
INSERT INTO monthT VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12);

CREATE OR REPLACE VIEW calender AS 
(
	SELECT id,t.y FROM monthT
	CROSS JOIN(
		SELECT DISTINCT year(now()) AS y ) AS t
);
SELECT id AS `Month`, y , COUNT(QuestionID) 
FROM calender LEFT JOIN question q ON year(q.CreateDate) = y AND month(q.CreateDate) = id 
WHERE y = year(now()) 
GROUP BY id, y 
ORDER BY y;


/* Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
tháng gần đây nhất
(Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong
tháng") */        


DROP PROCEDURE IF EXISTS Frint_Quest_OF_6Month;
DELIMITER $$
	CREATE PROCEDURE Frint_Quest_OF_6Month()
    BEGIN
		WITH CTE_6Month AS
(
	SELECT month(now()) AS `month`, year(now()) AS y
    UNION
	SELECT month(date_sub(now(), interval 1 month)), year(date_sub(now(), interval 1 month)) AS y -- 1 thang  truoc
    UNION
	SELECT month(date_sub(now(), interval 2 month)), year(date_sub(now(), interval 2 month)) AS y -- 2 Thang truoc
    UNION
	SELECT month(date_sub(now(), interval 3 month)), year(date_sub(now(), interval 3 month)) AS y -- 3 thang truoc
    UNION
	SELECT month(date_sub(now(), interval 4 month)), year(date_sub(now(), interval 4 month)) AS y -- 4 thang truoc
    UNION
	SELECT month(date_sub(now(), interval 5 month)), year(date_sub(now(), interval 5 month)) AS y -- 5 thang truoc
)
SELECT `month` ,y, if(count(QuestionID) = 0 , 'Khong co cau nao', count(QuestionID))AS Total 
FROM CTE_6Month LEFT JOIN question q ON `month` = month(q.CreateDate) AND y = year(q.CreateDate)
GROUP BY `month`, y;
    END $$
DELIMITER ;

CALL Frint_Quest_OF_6Month();