-Dept wise 2nd Highest Salary using DENSE_RANK() and Correlated Subquery

-- Drop the tables if they exist
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

-- Create the 'department' table
CREATE TABLE department (
    deptid INT PRIMARY KEY,          -- Unique identifier for each department
    deptname VARCHAR(50)             -- Department name
);

-- Insert data into 'department' table
INSERT INTO department (deptid, deptname)
VALUES 
(101, 'HR'),
(102, 'Finance'),
(103, 'Marketing');

-- Create the 'employee' table with foreign key reference to 'department'
CREATE TABLE employee (
    empid INT PRIMARY KEY,           -- Unique identifier for each employee
    salary INT,                      -- Salary of the employee
    deptid INT,                      -- Foreign key referencing department
    FOREIGN KEY (deptid) REFERENCES department(deptid)  -- Ensure deptid matches the department table
);

-- Insert data into 'employee' table
INSERT INTO employee (empid, salary, deptid)
VALUES 
(1, 70000, 101),
(2, 50000, 101),
(3, 60000, 101),
(4, 65000, 102),
(5, 65000, 102),
(6, 55000, 102),
(7, 60000, 103),
(8, 70000, 103),
(9, 80000, 103);


WITH cte AS (
    SELECT 
        e.empid, 
        d.deptname, 
        e.salary, 
        DENSE_RANK() OVER (PARTITION BY e.deptid ORDER BY e.salary DESC) AS dn
    FROM employee e
    JOIN department d ON e.deptid = d.deptid
)
SELECT * 
FROM cte
WHERE dn = 2;
