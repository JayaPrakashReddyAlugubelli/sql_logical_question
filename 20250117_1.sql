Need to select employee names with same salary.


CREATE TABLE Employee (
    employee_id INT, 
    ename VARCHAR(50), 
    salary INT
);

INSERT INTO Employee VALUES 
    (3, 'Bob', 60000),
    (4, 'Diana', 70000),
    (5, 'Eve', 60000),
    (6, 'Frank', 80000),
    (7, 'Grace', 70000),
    (8, 'Henry', 90000);



SELECT ename FROM Employee WHERE salary IN(SELECT salary FROM Employee group BY salary HAVING COUNT(*) > 1)