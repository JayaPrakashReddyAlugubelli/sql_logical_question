 write a sql query to find minimum and maximum salary in each company



CREATE TABLE employee_info (
    emp_id VARCHAR(10),
    company VARCHAR(10),
    salary INT,
    dept VARCHAR(10)
);

INSERT INTO employee_info VALUES('emp1', 'X', 1000, 'Sales');
INSERT INTO employee_info VALUES('emp2', 'X', 1020, 'IT');
INSERT INTO employee_info VALUES('emp3', 'X', 870, 'Sales');
INSERT INTO employee_info VALUES('emp4', 'Y', 1200, 'Marketing');
INSERT INTO employee_info VALUES('emp5', 'Y', 1500, 'IT');
INSERT INTO employee_info VALUES('emp6', 'Y', 1100, 'Sales');
INSERT INTO employee_info VALUES('emp7', 'Z', 1050, 'IT');
INSERT INTO employee_info VALUES('emp8', 'Z', 1350, 'Marketing');
INSERT INTO employee_info VALUES('emp9', 'Z', 1700, 'Sales');

SELECT company, 
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employee_info
GROUP BY company;


o/P:-
+---------+------------+------------+
| company | highest_salary | lowest_salary |
+---------+------------+------------+
| X       | 1020       | 870        |
| Y       | 1500       | 1100       |
| Z       | 1700       | 1050       |
+---------+------------+------------+

