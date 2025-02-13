CREATE TABLE `Transaction_Tbl` (
    `CustID` INT,
    `TranID` INT,
    `TranAmt` FLOAT,
    `TranDate` DATE
);

INSERT INTO `Transaction_Tbl` (`CustID`, `TranID`, `TranAmt`, `TranDate`) 
VALUES (1001, 20001, 10000, '2020-04-25');

INSERT INTO `Transaction_Tbl` (`CustID`, `TranID`, `TranAmt`, `TranDate`) 
VALUES (1001, 20002, 15000, '2020-04-25');

INSERT INTO `Transaction_Tbl` (`CustID`, `TranID`, `TranAmt`, `TranDate`) 
VALUES (1001, 20003, 80000, '2020-04-25');

INSERT INTO `Transaction_Tbl` (`CustID`, `TranID`, `TranAmt`, `TranDate`) 
VALUES (1001, 20004, 20000, '2020-04-25');

INSERT INTO `Transaction_Tbl` (`CustID`, `TranID`, `TranAmt`, `TranDate`) 
VALUES (1002, 30001, 7000, '2020-04-25');

INSERT INTO `Transaction_Tbl` (`CustID`, `TranID`, `TranAmt`, `TranDate`) 
VALUES (1002, 30002, 15000, '2020-04-25');

INSERT INTO `Transaction_Tbl` (`CustID`, `TranID`, `TranAmt`, `TranDate`) 
VALUES (1002, 30003, 22000, '2020-04-25');


WITH cte AS (
SELECT *, FIRST_VALUE(TranAmt) OVER(PARTITION BY CustID ORDER BY TranAmt DESC) AS max_amount FROM Transaction_Tbl)
SELECT *,(TranAmt/max_amount) as ratio from cte ORDER BY TranID;

---------------------------------------------------------------------------------------------------------------------------------------

drop table emp;

CREATE TABLE Emp (
    `Group_data` VARCHAR(20),
    `Sequence` INT
);

INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('A', 1);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('A', 2);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('A', 3);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('A', 5);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('A', 6);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('A', 8);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('A', 9);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('B', 11);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('C', 1);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('C', 2);
INSERT INTO Emp (`Group_data`, `Sequence`) VALUES ('C', 3);


with cte AS (
SELECT * ,Sequence - ROW_NUMBER() OVER(PARTITION BY Group_data ORDER BY Sequence) AS diff FROM Emp)
SELECT Group_data,MIN(Sequence) AS min_seq ,MAX(Sequence) AS max_seq FROM cte GROUP BY Group_data,diff;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Student (
    `Student_Name` VARCHAR(30),
    `Total_Marks` INT,
    `Year_data` INT
);

INSERT INTO Student (`Student_Name`, `Total_Marks`, `Year_data`) VALUES ('Rahul', 90, 2010);
INSERT INTO Student (`Student_Name`, `Total_Marks`, `Year_data`) VALUES ('Sanjay', 80, 2010);
INSERT INTO Student (`Student_Name`, `Total_Marks`, `Year_data`) VALUES ('Mohan', 70, 2010);
INSERT INTO Student (`Student_Name`, `Total_Marks`, `Year_data`) VALUES ('Rahul', 90, 2011);
INSERT INTO Student (`Student_Name`, `Total_Marks`, `Year_data`) VALUES ('Sanjay', 85, 2011);
INSERT INTO Student (`Student_Name`, `Total_Marks`, `Year_data`) VALUES ('Mohan', 65, 2011);
INSERT INTO Student (`Student_Name`, `Total_Marks`, `Year_data`) VALUES ('Rahul', 80, 2012);
INSERT INTO Student (`Student_Name`, `Total_Marks`, `Year_data`) VALUES ('Sanjay', 80, 2012);
INSERT INTO Student (`Student_Name`, `Total_Marks`, `Year_data`) VALUES ('Mohan', 90, 2012);


with cte  AS
(SELECT * ,LAG(Total_Marks,1,0) OVER(PARTITION BY Student_Name) AS pre_yr_marks from Student)
SELECT * from cte where Total_Marks >= pre_yr_marks AND pre_yr_marks <>0 ; 

------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Emp_Details (
    EMPID INT,
    Gender VARCHAR(1),        -- Fixed the length for Gender column
    EmailID VARCHAR(30),      -- Specified length for EmailID column
    DeptID INT
);

INSERT INTO Emp_Details VALUES (1001, 'M', 'YYYYY@gmaix.com', 104);
INSERT INTO Emp_Details VALUES (1002, 'M', 'ZZZ@gmaix.com', 103);
INSERT INTO Emp_Details VALUES (1003, 'F', 'AAAAA@gmaix.com', 102);
INSERT INTO Emp_Details VALUES (1004, 'F', 'PP@gmaix.com', 104);
INSERT INTO Emp_Details VALUES (1005, 'M', 'CCCC@yahu.com', 101);
INSERT INTO Emp_Details VALUES (1006, 'M', 'DDDDD@yahu.com', 100);
INSERT INTO Emp_Details VALUES (1007, 'F', 'E@yahu.com', 102);
INSERT INTO Emp_Details VALUES (1008, 'M', 'M@yahu.com', 102);
INSERT INTO Emp_Details VALUES (1009, 'F', 'SS@yahu.com', 100);

SELECT DeptID,GROUP_CONCAT(EmailID,';') FROM Emp_Details GROUP BY DeptID ;

------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE `Order_Tbl` (
    `ORDER_DAY` DATE,
    `ORDER_ID` VARCHAR(10),
    `PRODUCT_ID` VARCHAR(10),
    `QUANTITY` INT,
    `PRICE` INT
);

INSERT INTO `Order_Tbl` VALUES ('2015-05-01', 'ODR1', 'PROD1', 5, 5);
INSERT INTO `Order_Tbl` VALUES ('2015-05-01', 'ODR2', 'PROD2', 2, 10);
INSERT INTO `Order_Tbl` VALUES ('2015-05-01', 'ODR3', 'PROD3', 10, 25);
INSERT INTO `Order_Tbl` VALUES ('2015-05-01', 'ODR4', 'PROD1', 20, 5);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR5', 'PROD3', 5, 25);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR6', 'PROD4', 6, 20);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR7', 'PROD1', 2, 5);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR8', 'PROD5', 1, 50);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR9', 'PROD6', 2, 50);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR10', 'PROD2', 4, 10);


SELECT PRODUCT_ID,COUNT(*) AS count FROM Order_Tbl GROUP BY PRODUCT_ID HAVING COUNT(*) > 1;
------------------------------------------------------------------------------------------------------------------------------------------
WITH cte AS (
SELECT ORDER_DAY,PRODUCT_ID,SUM(QUANTITY * PRICE) AS SUM_amount
 FROM Order_Tbl GROUP BY ORDER_DAY,PRODUCT_ID),
 cte2 AS (
SELECT *,DENSE_RANK() OVER(PARTITION BY ORDER_DAY ORDER BY sum_amount DESC) AS rn FROM cte)
SELECT * FROM cte2  WHERE rn=1;

WITH cte AS (
SELECT ORDER_DAY,PRODUCT_ID,SUM( (QUANTITY * PRICE) )total from Order_Tbl GROUP BY ORDER_DAY,PRODUCT_Id)
SELECT PRODUCT_ID, 
max(case when ORDER_DAY='2015-05-01' then total ELSE 0 END) AS t_1 ,
max(case when ORDER_DAY='2015-05-02' then total ELSE 0 END) AS t_2  from cte GROUP BY PRODUCT_ID;
------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE employee;

CREATE TABLE Employee (
    EmpID INT,
    EmpName VARCHAR(30),
    Salary FLOAT,
    DeptID INT
);

INSERT INTO Employee VALUES (1001, 'Mark', 60000, 2);
INSERT INTO Employee VALUES (1002, 'Antony', 40000, 2);
INSERT INTO Employee VALUES (1003, 'Andrew', 15000, 1);
INSERT INTO Employee VALUES (1004, 'Peter', 35000, 1);
INSERT INTO Employee VALUES (1005, 'John', 55000, 1);
INSERT INTO Employee VALUES (1006, 'Albert', 25000, 3);
INSERT INTO Employee VALUES (1007, 'Donald', 35000, 3);

WITH cte AS (
SELECT * ,AVG(Salary) over (PARTITION BY DeptID) AS avg_sal FROM employee)
SELECT * FROM cte WHERE Salary > avg_sal
------------------------------------------------------------------------------------------------------------------------------------------
-- Create the Transaction_Table
CREATE TABLE Transaction_Table (
    AccountNumber INT,
    TransactionTime DATETIME,
    TransactionID INT,
    Balance INT
);

-- Insert data into the Transaction_Table
INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (550, '2020-05-12 05:29:44.120', 1001, 2000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (550, '2020-05-15 10:29:25.630', 1002, 8000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (460, '2020-03-15 11:29:23.620', 1003, 9000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (460, '2020-04-30 11:29:57.320', 1004, 7000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (460, '2020-04-30 12:32:44.233', 1005, 5000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (640, '2020-02-18 06:29:34.420', 1006, 5000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (640, '2020-02-18 06:29:37.120', 1007, 9000);

SELECT t1.* FROM Transaction_Table t1 JOIN (SELECT AccountNumber,MAX(TransactionTime) AS TransactionTime 
,MAX(TransactionID) AS TransactionID  FROM Transaction_Table GROUP BY AccountNumber) t2 ON 
 t1.AccountNumber=t2.AccountNumber and t1.TransactionID=t2.TransactionID AND t1.TransactionTime=t2.TransactionTime;
------------------------------------------------------------------------------------------------------------------------------------------
-- Create the Product_Sales table
CREATE TABLE Product_Sales (
    ID INT,
    Product VARCHAR(50),
    SalesYear INT,
    QuantitySold INT
);

-- Insert data into the Product_Sales table
INSERT INTO Product_Sales (ID, Product, SalesYear, QuantitySold) VALUES (1, 'Laptop', 1998, 2500);
INSERT INTO Product_Sales (ID, Product, SalesYear, QuantitySold) VALUES (2, 'Laptop', 1999, 3600);
INSERT INTO Product_Sales (ID, Product, SalesYear, QuantitySold) VALUES (3, 'Laptop', 2000, 4200);
INSERT INTO Product_Sales (ID, Product, SalesYear, QuantitySold) VALUES (4, 'Keyboard', 1998, 2300);
INSERT INTO Product_Sales (ID, Product, SalesYear, QuantitySold) VALUES (5, 'Keyboard', 1999, 4800);
INSERT INTO Product_Sales (ID, Product, SalesYear, QuantitySold) VALUES (6, 'Keyboard', 2000, 5000);
INSERT INTO Product_Sales (ID, Product, SalesYear, QuantitySold) VALUES (7, 'Mouse', 1998, 6000);
INSERT INTO Product_Sales (ID, Product, SalesYear, QuantitySold) VALUES (8, 'Mouse', 1999, 3400);
INSERT INTO Product_Sales (ID, Product, SalesYear, QuantitySold) VALUES (9, 'Mouse', 2000, 4600);


SELECT 
    'totalsales' AS totalsales,
    SUM(CASE WHEN SalesYear = 1998 THEN QuantitySold ELSE 0 END) AS `1998`,
    SUM(CASE WHEN SalesYear = 1999 THEN QuantitySold ELSE 0 END) AS `1999`,
    SUM(CASE WHEN SalesYear = 2000 THEN QuantitySold ELSE 0 END) AS `2000`
FROM 
    Product_Sales;
------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Inventory (
    ProdName VARCHAR(20),
    ProductCode VARCHAR(15),
    Quantity INT,
    InventoryDate DATE
);

INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) 
VALUES ('Keyboard', 'K1001', 20, '2020-03-01');

INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) 
VALUES ('Keyboard', 'K1001', 30, '2020-03-02');

INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) 
VALUES ('Keyboard', 'K1001', 10, '2020-03-03');

INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) 
VALUES ('Keyboard', 'K1001', 40, '2020-03-04');

INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) 
VALUES ('Laptop', 'L1002', 100, '2020-03-01');

INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) 
VALUES ('Laptop', 'L1002', 60, '2020-03-02');

INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) 
VALUES ('Laptop', 'L1002', 40, '2020-03-03');

INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) 
VALUES ('Monitor', 'M5005', 30, '2020-03-01');

INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) 
VALUES ('Monitor', 'M5005', 20, '2020-03-02');

SELECT *,SUM(Quantity) OVER (partition BY ProdName ORDER BY InventoryDate) AS rolling_sum FROM Inventory;

------------------------------------------------------------------------------------------------------------------------------------------
-- Create the Account_Table in MySQL SQL Interview Questions and answers Part 18 | SQL Scenario based Interview Question and Answer
CREATE TABLE Account_Table (
    TranDate DATETIME,
    TranID VARCHAR(20),
    TranType VARCHAR(10),
    Amount FLOAT
);

-- Insert data into Account_Table
INSERT INTO Account_Table (TranDate, TranID, TranType, Amount) 
VALUES 
    ('2020-05-12 05:29:44', 'A10001', 'Credit', 50000),
    ('2020-05-13 10:30:20', 'B10001', 'Debit', 10000),
    ('2020-05-13 11:27:50', 'B10002', 'Credit', 20000),
    ('2020-05-14 08:35:30', 'C10001', 'Debit', 5000),
    ('2020-05-14 09:43:51', 'C10002', 'Debit', 5000),
    ('2020-05-15 05:51:11', 'D10001', 'Credit', 30000);
WITH cte AS (
SELECT * ,case when TranType='Credit' then 1*Amount ELSE -1*Amount END AS net from Account_Table)
SELECT *,SUM(net) OVER(ORDER BY TranDate) from cte;
------------------------------------------------------------------------------------------------------------------------------------------
----SQL Interview Questions and answers Part 19 | SQL Scenario based Interview Question and Answer

------------------------------------------------------------------------------------------------------------------------------------------
--SQL Interview Questions and answers Part 21 | SQL Scenario based Interview Question and Answer
-- Create the BalanceTbl table
----Problem Statements :- Write SQL to derive Start_Date and End_Date column when there is continuous amount in Balance column as shown below.
CREATE TABLE BalanceTbl (
    Balance INT,
    Dates DATE
);

-- Insert data into BalanceTbl
INSERT INTO BalanceTbl VALUES(26000, '2020-01-01');
INSERT INTO BalanceTbl VALUES(26000, '2020-01-02');
INSERT INTO BalanceTbl VALUES(26000, '2020-01-03');
INSERT INTO BalanceTbl VALUES(30000, '2020-01-04');
INSERT INTO BalanceTbl VALUES(30000, '2020-01-05');
INSERT INTO BalanceTbl VALUES(26000, '2020-01-06');
INSERT INTO BalanceTbl VALUES(26000, '2020-01-07');
INSERT INTO BalanceTbl VALUES(32000, '2020-01-08');
INSERT INTO BalanceTbl VALUES(31000, '2020-01-09');

WITH cte AS (
SELECT *,ROW_number() OVER(PARTITION BY Balance ORDER BY Dates) AS rn  FROM BalanceTbl)
SELECT Balance,MIN(Dates) AS start_date,MAX(Dates)  AS end_adte FROM cte  GROUP BY Balance ,DATE_SUB(Dates, INTERVAL rn DAY);
------------------------------------------------------------------------------------------------------------------------------------------
SQL Interview Questions and answers Part 22 | Amazon SQL Interview Question And Answer Part-6

Input :- There are two table. First table name is Sales_Table. Second Table name is ExchangeRate_Table. As and when exchange rate changes, a new row is inserted in the ExchangeRate table with a new effective start date.

Problem Statements :- Write SQL to get Total  sales amount in USD for each sales date as shown below :-

CREATE TABLE Sales_Table (
  Sales_Date DATE,
  Sales_Amount BIGINT,
  Currency VARCHAR(10)
);

INSERT INTO Sales_Table VALUES 
  ('2020-01-01', 500, 'INR'),
  ('2020-01-01', 100, 'GBP'),
  ('2020-01-02', 1000, 'INR'),
  ('2020-01-02', 500, 'GBP'),
  ('2020-01-03', 500, 'INR'),
  ('2020-01-17', 200, 'GBP');

CREATE TABLE ExchangeRate_Table (
  Source_Currency VARCHAR(10),
  Target_Currency VARCHAR(10),
  Exchange_Rate FLOAT,
  Effective_Start_Date DATE
);

INSERT INTO ExchangeRate_Table VALUES 
  ('INR', 'USD', 0.014, '2019-12-31'),
  ('INR', 'USD', 0.015, '2020-01-02'),
  ('GBP', 'USD', 1.32, '2019-12-20'),
  ('GBP', 'USD', 1.3, '2020-01-01'),
  ('GBP', 'USD', 1.35, '2020-01-16');

------------------------------------------------------------------------------------------------------------------------------------------
SQL Interview Questions and answers Part 23 | SQL Scenario based Interview Question and Answer
Input :- Travel_Table has three columns namely Source, Destination and Distance. 

Problem Statements :- Write SQL to get unique combination of  two columns Source and Destination irrespective of order of columns as shown below :-

CREATE TABLE Travel_Table (
  Start_Location VARCHAR(30),
  End_Location VARCHAR(30),
  Distance INT
);

INSERT INTO Travel_Table VALUES
  ('Delhi', 'Pune', 1400),
  ('Pune', 'Delhi', 1400),
  ('Bangalore', 'Chennai', 350),
  ('Mumbai', 'Ahmedabad', 500),
  ('Chennai', 'Bangalore', 35);


SELECT distinct Distance , case when Start_Location  > End_Location  then End_Location
 ELSE Start_Location END AS Start_Location ,case when Start_Location  < End_Location  then End_Location
 ELSE Start_Location END  AS End_Location    FROM Travel_Table;

------------------------------------------------------------------------------------------------------------------------------------------

SQL Interview Questions and answers Part 24 | How to find missing rows in SQL
Input :- Sample Table has ID column which is not continuous value starting from 1 to 20
Problem Statement :-  Write a SQL to find the missing ID  From sample Table

Create Table Sample_Table(
ID int)

Insert into Sample_Table Values (1),(4),(7),(9),(12),(14),(16),(17),(20)

WITH RECURSIVE numbers AS (
  SELECT 1 AS num
  UNION 
  SELECT num + 1 FROM numbers WHERE num < (SELECT MAX(id) FROM Sample_Table)
)
SELECT n.num  FROM numbers n left JOIN Sample_Table s ON  n.num=s.id WHERE id is null ;
------------------------------------------------------------------------------------------------------------------------------------------
SQL Interview Questions and answers Part 25 | SQL Scenario based Interview Question and Answer

Input :- Emp_Detail Table four columns namely EmpName , Age, Salary and Department
Problem Statement :-  Write a SQL to find Top 2 records from each department 

DROP TABLE Emp_Detail;

CREATE TABLE Emp_Detail (
  EmpName VARCHAR(25),
  Age INT,
  Salary BIGINT,
  Department VARCHAR(20)
);

INSERT INTO Emp_Detail VALUES
  ('James', 25, 25000, 'Admin'),
  ('Robert', 33, 39000, 'Admin'),
  ('Richard', 41, 48000, 'Admin'),
  ('Thomas', 28, 30000, 'Admin'),
  ('Tom', 40, 55000, 'Finance'),
  ('Donald', 35, 38000, 'Finance'),
  ('Sara', 32, 44000, 'Finance'),
  ('Mike', 28, 25000, 'HR'),
  ('John', 35, 45000, 'HR'),
  ('Mary', 23, 30000, 'HR'),
  ('David', 32, 43000, 'HR');

------------------------------------------------------------------------------------------------------------------------------------------
SQL Interview Questions and answers Part 26 | Amazon SQL Interview Question And Answer Part-5

Input :- Phone_Log Table has three columns namely Source_Phone_Nbr,  Destination_Phone_Nbr and Call_Start_DateTime. This table records all phone numbers that we dial in a given day.

Problem Statement :-  Write a SQL to display the Source_Phone_Nbr and a flag where the flag needs to be set to ‘Y’ if first called number and last called number are the same and ‘N’ if first called number and last called number are different

CREATE TABLE Phone_Log (
  Source_Phone_Nbr BIGINT,
  Destination_Phone_Nbr BIGINT,
  Call_Start_DateTime DATETIME
);

INSERT INTO Phone_Log (Source_Phone_Nbr, Destination_Phone_Nbr, Call_Start_DateTime) VALUES
  (2345, 6789, '2012-07-01 10:00'),
  (2345, 1234, '2012-07-01 11:00'),
  (2345, 4567, '2012-07-01 12:00'),
  (2345, 4567, '2012-07-01 13:00'),
  (2345, 6789, '2012-07-01 15:00'),
  (3311, 7890, '2012-07-01 10:00'),
  (3311, 6543, '2012-07-01 12:00'),
  (3311, 1234, '2012-07-01 13:00');


WITH cte AS (
SELECT Source_Phone_Nbr ,
FIRST_VALUE(Destination_Phone_Nbr) OVER(PARTITION BY Source_Phone_Nbr ORDER BY Call_Start_DateTime  ) AS f,
FIRST_VALUE(Destination_Phone_Nbr) OVER(PARTITION BY Source_Phone_Nbr ORDER BY Call_Start_DateTime desc  ) AS l
FROM Phone_Log )
SELECT distinct Source_Phone_Nbr ,case when f=l then 'Y' ELSE 'N' end FROM cte;
------------------------------------------------------------------------------------------------------------------------------------------

SQL Interview Questions and answers Part 28 | SQL Scenario based Interview Question and Answer 
Input :- SampleTable has three columns namely X, Y and Z
Problem Statement :- Write a SQL query to get the output as shown in the table


CREATE TABLE Sample_1
(
    X BIGINT,
    Y BIGINT,
    Z BIGINT
);

INSERT INTO Sample_1 (X, Y, Z) VALUES (200, 400, 1);
INSERT INTO Sample_1 (X, Y, Z) VALUES (200, 400, 2);
INSERT INTO Sample_1 (X, Y, Z) VALUES (200, 400, 3);
INSERT INTO Sample_1 (X, Y, Z) VALUES (10000, 60000, 1);
INSERT INTO Sample_1 (X, Y, Z) VALUES (500, 600, 1);
INSERT INTO Sample_1 (X, Y, Z) VALUES (500, 600, 2);
INSERT INTO Sample_1 (X, Y, Z) VALUES (20000, 80000, 1);


SELECT * from Sample_1 WHERE x IN (SELECT x FROM Sample_1 GROUP BY x HAVING COUNT(*) >1);

------------------------------------------------------------------------------------------------------------------------------------------
SQL Interview Questions and answers Part 29 | SQL Scenario based Interview Question and Answer
Input :- Employee Table has three columns namely EmployeeID,  EmployeeName and ManagerID
Problem Statement :- Write a SQL query to get the output as shown in the Output table

CREATE TABLE Employee_1 (
    EmployeeID VARCHAR(20),
    EmployeeName VARCHAR(20),
    ManagerID VARCHAR(20)
);

INSERT INTO Employee_1 (EmployeeID, EmployeeName, ManagerID) VALUES (100, 'Mark', 103);
INSERT INTO Employee_1 (EmployeeID, EmployeeName, ManagerID) VALUES (101, 'John', 104);
INSERT INTO Employee_1 (EmployeeID, EmployeeName, ManagerID) VALUES (102, 'Maria', 103);
INSERT INTO Employee_1 (EmployeeID, EmployeeName, ManagerID) VALUES (103, 'Tom', NULL);
INSERT INTO Employee_1 (EmployeeID, EmployeeName, ManagerID) VALUES (104, 'David', 103);


SELECT e1.EmployeeName,e2.EmployeeName AS ManagerName FROM 
Employee_1 e1 JOIN Employee_1 e2 ON e1.ManagerID=e2.EmployeeID ;

with cte AS (SELECT e1.EmployeeName,e2.EmployeeName AS ManagerName FROM                                       
Employee_1 e1 left JOIN Employee_1 e2 ON e1.ManagerID=e2.EmployeeID)                                          
SELECT EmployeeName,(case when ManagerName IS NULL then 'BOSS' ELSE ManagerName END) AS ManagerName FROM cte ;



------------------------------------------------------------------------------------------------------------------------------------------
SQL Interview Questions and answers Part 30 | SQL Scenario based Interview Question and Answer
Input :- Sales Table has three columns namely Id,  Product and Sales
Problem Statement :- Write a SQL query to get the output as shown in the Output tables


CREATE TABLE Sales1 (
    Id INT,
    Product VARCHAR(20),
    Sales BIGINT
);

INSERT INTO Sales1 (Id, Product, Sales) VALUES (1001, 'Keyboard', 20);
INSERT INTO Sales1 (Id, Product, Sales) VALUES (1002, 'Keyboard', 25);
INSERT INTO Sales1 (Id, Product, Sales) VALUES (1003, 'Laptop', 30);
INSERT INTO Sales1 (Id, Product, Sales) VALUES (1004, 'Laptop', 35);
INSERT INTO Sales1 (Id, Product, Sales) VALUES (1005, 'Laptop', 40);
INSERT INTO Sales1 (Id, Product, Sales) VALUES (1006, 'Monitor', 45);
INSERT INTO Sales1 (Id, Product, Sales) VALUES (1007, 'WebCam', 50);
INSERT INTO Sales1 (Id, Product, Sales) VALUES (1008, 'WebCam', 55);


SELECT id,Product,FIRST_VALUE(Sales)  OVER (PARTITION BY Product ORDER BY Sales ) AS sales  FROM Sales1;

SELECT id,Product,sum(Sales)  OVER (PARTITION BY Product ORDER BY Sales ) AS sales  FROM Sales1;
------------------------------------------------------------------------------------------------------------------------------------------
SQL Interview Questions and answers Part 31 | SQL Scenario based Interview Question and Answer
Input :- StudentInfo Table has three columns namely StudentName, Subjects and Marks
Problem Statement :- Write a SQL query to get the output as shown in the Output table
CREATE TABLE StudentInfo_1 (
    StudentName VARCHAR(30),
    Subjects VARCHAR(30),
    Marks BIGINT
);

INSERT INTO StudentInfo_1 (StudentName, Subjects, Marks) VALUES ('David', 'English', 85);
INSERT INTO StudentInfo_1 (StudentName, Subjects, Marks) VALUES ('David', 'Maths', 90);
INSERT INTO StudentInfo_1 (StudentName, Subjects, Marks) VALUES ('David', 'Science', 88);
INSERT INTO StudentInfo_1 (StudentName, Subjects, Marks) VALUES ('John', 'English', 75);
INSERT INTO StudentInfo_1 (StudentName, Subjects, Marks) VALUES ('John', 'Maths', 85);
INSERT INTO StudentInfo_1 (StudentName, Subjects, Marks) VALUES ('John', 'Science', 80);
INSERT INTO StudentInfo_1 (StudentName, Subjects, Marks) VALUES ('Tom', 'English', 83);
INSERT INTO StudentInfo_1 (StudentName, Subjects, Marks) VALUES ('Tom', 'Maths', 80);
INSERT INTO StudentInfo_1 (StudentName, Subjects, Marks) VALUES ('Tom', 'Science', 92);


with cte AS (SELECT StudentName,case when Subjects='English' then Marks END AS English,
          case when Subjects='Maths' then Marks END AS Maths,
          case when Subjects='Science' then Marks END AS Science
FROM StudentInfo_1 )
SELECT StudentName,max(English) AS English, max(Maths) AS Maths,max(Science) AS Science FROM cte GROUP BY StudentName;
------------------------------------------------------------------------------------------------------------------------------------------

SQL Interview Questions and answers Part 32 | SQL Scenario based Interview Question and Answer

Input :- Employee Table has four columns namely EmpName,  DeptName, DeptNo and Salary
Problem Statement :- Write a SQL query to get the output as shown in the Output tables

CREATE TABLE Employee_2 (
    EmpName VARCHAR(30),
    DeptName VARCHAR(25),
    DeptNo BIGINT,
    Salary BIGINT
);

INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('Mark', 'HR', 101, 30000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('John', 'Accountant', 101, 20000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('Smith', 'Analyst', 101, 25000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('Donald', 'HR', 201, 40000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('James', 'Analyst', 201, 22000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('Maria', 'Analyst', 201, 38000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('David', 'Manager', 201, 33000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('Martin', 'Analyst', 301, 22000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('Robert', 'Analyst', 301, 56000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('Michael', 'Manager', 301, 34000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('Robert', 'Accountant', 301, 37000);
INSERT INTO Employee_2 (EmpName, DeptName, DeptNo, Salary) VALUES ('Michael', 'Analyst', 301, 28000);


with cte AS (SELECT * ,DENSE_RANK() OVER(PARTITION BY DeptNo ORDER BY Salary) AS ls,
DENSE_RANK() OVER(PARTITION BY DeptNo ORDER BY Salary desc) AS hs
 from Employee_2)
 SELECT EmpName, DeptName, DeptNo, Salary FROM cte WHERE ls=1 OR hs=1;
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------------