Given us Employee table, Get Employee Name whose salary is greater than Manager Salary.

CREATE TABLE employees_tbl (empid INT,ename VARCHAR(50),salary INT,managerid INT)

INSERT INTO employees_tbl VALUES (1, 'John', 50000, NULL), (2, 'Alice', 40000, 1),(3, 'Bob', 70000, 1), (4, 'Emily', 55000, NULL), (5, 'Charlie', 65000, 4),
(6, 'David', 50000, 4)


select t1.ename from employees_tbl t1 join employees_tbl t2
on t1.managerid =t2.empid and t1.salary  > t2.salary   ;