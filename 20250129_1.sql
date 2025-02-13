how to remove duplicates in sql?
-- Create the table EmpDetail
CREATE TABLE EmpDetail (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    EmpName VARCHAR(25),
    Department VARCHAR(20),
    Age INT,
    Gender CHAR(1),
    Salary BIGINT
);

-- Insert values into the EmpDetail table
INSERT INTO EmpDetail (EmpName, Department, Age, Gender, Salary) VALUES ('James', 'HR', 30, 'M', 40000);
INSERT INTO EmpDetail (EmpName, Department, Age, Gender, Salary) VALUES ('James', 'HR', 30, 'M', 40000);
INSERT INTO EmpDetail (EmpName, Department, Age, Gender, Salary) VALUES ('James', 'HR', 30, 'M', 40000);
INSERT INTO EmpDetail (EmpName, Department, Age, Gender, Salary) VALUES ('John', 'Finance', 32, 'M', 45000);
INSERT INTO EmpDetail (EmpName, Department, Age, Gender, Salary) VALUES ('Maria', 'Admin', 28, 'M', 30000);
INSERT INTO EmpDetail (EmpName, Department, Age, Gender, Salary) VALUES ('Maria', 'Admin', 28, 'M', 30000);
INSERT INTO EmpDetail (EmpName, Department, Age, Gender, Salary) VALUES ('Mark', 'Account', 35, 'M', 50000);



WITH CTE AS (
    SELECT ID, EmpName, Department, Age, Gender, Salary,
           ROW_NUMBER() OVER (PARTITION BY EmpName, Department, Age, Gender, Salary ORDER BY ID) AS row_num
    FROM EmpDetail
)
DELETE FROM EmpDetail WHERE ID IN (SELECT ID FROM CTE WHERE row_num > 1);
