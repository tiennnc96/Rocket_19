DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
	-- 1
-- DROP TABLE `Department`;
CREATE TABLE `Department` (
    `DepartmentID` 		TINYINT AUTO_INCREMENT PRIMARY KEY,
	`DepartmentName` 	VARCHAR(255)
);
	-- 2
-- DROP TABLE `Position`;
CREATE TABLE `Position` (
    `PositionID` 	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `PositionName` 	ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);
	-- 3
-- DROP TABLE `Account`;
CREATE TABLE `Account` (
    `AccountID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Email` VARCHAR(255) NOT NULL,
    `Username` VARCHAR(255) NOT NULL,
    `FullName` VARCHAR(255) NOT NULL,
    `DepartmentID` TINYINT NOT NULL,
    `PositionID` TINYINT NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    FOREIGN KEY (`DepartmentID`)
        REFERENCES `Department` (`DepartmentID`),
    FOREIGN KEY (`PositionID`)
        REFERENCES `Position` (`PositionID`)
);
	-- 4
-- DROP TABLE `Group`;
CREATE TABLE `Group` (
    `GroupID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `AccountID` TINYINT NOT NULL,
    `JoinDate` DATETIME NOT NULL,
    FOREIGN KEY (`AccountID`)
        REFERENCES `Account` (`AccountID`)
);
	-- 5
-- DROP TABLE `GroupAccount`;
CREATE TABLE `GroupAccount` (
    `GroupID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `AccountID` TINYINT NOT NULL,
    `JoinDate` DATETIME NOT NULL,
    FOREIGN KEY (`AccountID`)
        REFERENCES Account (`AccountID`)
);
	-- 6
-- DROP TABLE `TypeQuestion`;
CREATE TABLE `TypeQuestion` (
    `TypeID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `TypeName` ENUM('Essay', ' Multiple-Choice')
);
	-- 7
-- DROP TABLE `CategoryQuestion`;
CREATE TABLE `CategoryQuestion` (
    `CategoryID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `CategoryName` VARCHAR(255) NOT NULL
);
	-- 8
-- DROP TABLE `Question`;
CREATE TABLE `Question` (
    `QuestionID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Content` VARCHAR(1000) NOT NULL,
    `CategoryID` TINYINT NOT NULL,
    `TypeID` TINYINT NOT NULL,
    `CreatorID` TINYINT NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    FOREIGN KEY (`CategoryID`)
        REFERENCES `CategoryQuestion` (`CategoryID`),
    FOREIGN KEY (`TypeID`)
        REFERENCES `TypeQuestion` (`TypeID`)
);
	-- 9
-- DROP TABLE `Answer`;
CREATE TABLE `Answer` (
    `AnswerID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Content` VARCHAR(1000) NOT NULL,
    `QuestionID` TINYINT NOT NULL,
    `isCorrect` ENUM('DUNG', 'SAI'),
    FOREIGN KEY (`QuestionID`)
        REFERENCES `Question` (`QuestionID`)
);
	-- 10
-- DROP TABLE  IF  EXISTS `Exam`;
CREATE TABLE `Exam` (
    `ExamID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Code` VARCHAR(10) NOT NULL,
    `Title` VARCHAR(255) NOT NULL,
    `CategoryID` TINYINT NOT NULL,
    `Duration` TIME NOT NULL,
    `CreatorID` TINYINT NOT NULL,
    `CreateDate` DATETIME NOT NULL,
    FOREIGN KEY (`CategoryID`)
        REFERENCES `Categoryquestion` (`CategoryID`)
);
	-- 11
-- DROP TABLE  IF  EXISTS `ExamQuestion`;
CREATE TABLE `ExamQuestion` (
    `ExamID` TINYINT AUTO_INCREMENT PRIMARY KEY,
    `QuestionID` TINYINT NOT NULL,
    FOREIGN KEY (`QuestionID`)
        REFERENCES `Question` (`QuestionID`)
);

