INPUT :-  Employee Table has four columns namely EmpID , EmpName, Salary and DeptID
Write a SQL  to find all Employees who earn more than the average salary in their corresponding department.

-- Create the Employee table
CREATE TABLE Employee (
    EmpID INT,
    EmpName VARCHAR(30),
    Salary FLOAT,
    DeptID INT
);

-- Insert data into the Employee table
INSERT INTO Employee (EmpID, EmpName, Salary, DeptID) VALUES
(1001, 'Mark', 60000, 2),
(1002, 'Antony', 40000, 2),
(1003, 'Andrew', 15000, 1),
(1004, 'Peter', 35000, 1),
(1005, 'John', 55000, 1),
(1006, 'Albert', 25000, 3),
(1007, 'Donald', 35000, 3);


with cte AS (
SELECT * ,AVG(Salary) OVER(PARTITION BY DeptID) AS ags  FROM Employee)
SELECT EmpID, EmpName, Salary, DeptID FROM cte WHERE Salary > ags ;
o/p:-
+-------+------------------+--------+--------+
| EmpID | EmpName          | Salary | DeptID |
+-------+------------------+--------+--------+
| 1005  | John             |  55000 |      1 |
| 1001  | Mark             |  60000 |      2 |
| 1007  | Donald           |  35000 |      3 |
+-------+------------------+--------+--------+
