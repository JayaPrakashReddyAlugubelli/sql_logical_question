
find out sum of 2nd and 3rd height form below table ;

CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    dept VARCHAR(50)
);


INSERT INTO emp (id, name, salary, dept) VALUES 
(101, 'John Doe', 75000.00, 'HR'),
(102, 'Jane Smith', 82000.00, 'Finance'),
(103, 'Alice Johnson', 95000.00, 'IT'),
(104, 'Bob Brown', 67000.00, 'Marketing'),
(105, 'Carol Davis', 72000.00, 'Sales'),
(106, 'David Wilson', 58000.00, 'IT'),
(107, 'Emma Garcia', 70000.00, 'Finance'),
(108, 'Frank Miller', 88000.00, 'Marketing'),
(109, 'Grace Clark', 68000.00, 'Sales'),
(110, 'Henry Lee', 62000.00, 'HR');



output:-
WITH cte as (
SELECT *,DENSE_RANK() OVER(PARTITION BY dept ORDER BY salary desc) AS dn FROM emp)
SELECT dn,SUM(salary) FROM  cte GROUP BY dn;