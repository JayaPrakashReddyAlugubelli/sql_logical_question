
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
WITH RankedSalaries AS (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM emp
)
SELECT SUM(salary) AS sum_2nd_3rd_highest
FROM RankedSalaries
WHERE rank IN (2, 3);
