/* Exercise 1: Tiếp tục với Database Testing System
(Sử dụng subquery hoặc CTE)
Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale */
Use Testing_System_Assignment_1;
CREATE OR REPLACE VIEW vw_DSNV_Sale AS
    SELECT 
        a.*, d.DepartmentName
    FROM
        `account` a
            INNER JOIN
        `department` d ON a.DepartmentID = d.DepartmentID
    WHERE
        d.DepartmentName = 'Phong Sale';
SELECT * FROM vw_DSNV_Sale;
SELECT * FROM department JOIN `account` USING(DepartmentID) ;

/*Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất */
CREATE OR REPLACE VIEW v_MAX_DSNV_Join_GROUP AS
    SELECT *, COUNT(a.AccountID) AS Total
    FROM  `account` a
   JOIN `groupaccount` ga USING(AccountID)
    GROUP BY a.AccountID
    HAVING COUNT(ga.AccountID) =
    (SELECT MAX(Total) FROM(
		SELECT *, COUNT(a.AccountID) AS Total
		FROM  `account` a
		JOIN `groupaccount` ga USING(AccountID)
		GROUP BY a.AccountID) AS TatolAcc);
        SELECT * FROM v_MAX_DSNV_Join_GROUP;
        
        
	-- CTE
	WITH CTE_AccGroup AS (SELECT *, COUNT(a.AccountID) AS Total
    FROM  `account` a
	JOIN `groupaccount` ga USING(AccountID)
    GROUP BY a.AccountID)
    SELECT * FROM CTE_AccGroup WHERE Total = (SELECT MAX(Total) FROM CTE_AccGroup );
    
    
    -- VIEW
    CREATE OR REPLACE VIEW v_AccGroup AS(
		SELECT *, COUNT(a.AccountID) AS Total
		FROM  `account` a
		JOIN `groupaccount` ga USING(AccountID)
		GROUP BY a.AccountID
    );
     SELECT * FROM v_AccGroup  WHERE Total = (SELECT MAX(Total) FROM v_AccGroup );
    SELECT * FROM v_AccGroup;
    CREATE OR REPLACE VIEW V_test AS (
    SELECT COUNT(GroupID) AS Total FROM v_AccGroup GROUP BY GroupID HAVING COUNT(GroupID) = 4);
    

    
/*Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
được coi là quá dài) và xóa nó đi */
CREATE Or REPLACE VIEW v_ContenTren15KyTu as
SELECT * FROM question
WHERE length(Content) > 15;

SELECT * FROM v_ContenTren15KyTu;


/* Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất */
SELECT * FROM department JOIN `account` USING(DepartmentID);
CREATE OR REPLACE VIEW V_CoutNV_department AS (	
	SELECT *, COUNT(a.DepartmentID) AS totalAcc
	FROM `account` a 
    JOIN `department` d USING(DepartmentID) 
    GROUP BY DepartmentID);
SELECT * FROM V_CoutNV_department WHERE totalAcc = (SELECT MAX(totalAcc) FROM V_CoutNV_department);

-- CTE
WITH cte_countAcc AS (SELECT *, COUNT(a.DepartmentID) AS totalAcc
	FROM `account` a 
    JOIN `department` d USING(DepartmentID) 
    GROUP BY DepartmentID)
    SELECT * FROM cte_countAcc WHERE totalAcc = (SELECT MAX(totalAcc) FROM cte_countAcc);

/* Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo */
SELECT * FROM question q JOIN `account` a on q.CreatorID = a.AccountID 
WHERE substring_index(a.FullName,' ',1) = 'Nguyen';

