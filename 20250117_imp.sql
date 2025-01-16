WIPRO SQL Interview Question - FIRST_VALUE( ) Function

CREATE TABLE emps_tbl (
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

INSERT INTO emps_tbl VALUES 
    ('Siva', 1, 30000), 
    ('Ravi', 2, 40000), 
    ('Prasad', 1, 50000), 
    ('Sai', 2, 20000), 
    ('Anna', 2, 10000);

SELECT distinct dept_id,FIRST_VALUE(emp_name) OVER (PARTITION BY dept_id ORDER BY salary DESC) AS max_sal_empname,
FIRST_VALUE(emp_name) OVER (PARTITION BY dept_id ORDER BY salary)  AS min_sal_empname FROM emps_tbl;