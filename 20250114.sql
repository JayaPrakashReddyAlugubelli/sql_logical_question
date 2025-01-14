 Get Employee Name whose salary is greater than Manager Salary
 
 -- Create the employees_tbl table
CREATE TABLE employees_tbl (
    empid INT,
    ename VARCHAR(50),
    salary INT,
    managerid INT
);

-- Insert records into employees_tbl
INSERT INTO employees_tbl (empid, ename, salary, managerid) 
VALUES 
    (1, 'John', 50000, NULL),
    (2, 'Alice', 40000, 1),
    (3, 'Bob', 70000, 1),
    (4, 'Emily', 55000, NULL),
    (5, 'Charlie', 65000, 4),
    (6, 'David', 50000, 4);


--op:
SELECT e1.ename AS empname FROM employees_tbl e1 left JOIN employees_tbl e2 ON e1.managerid=e2.empid
WHERE  e1.salary > e2.salary;
