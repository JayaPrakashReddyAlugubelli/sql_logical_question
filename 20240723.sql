
CREATE TABLE employees (
    employee_name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);
 
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('James', 'Sales', 2000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Sofy', 'Sales', 3000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Laren', 'Sales', 4000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Kiku', 'Sales', 5000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Sam', 'Finance', 6000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Samuel', 'Finance', 6000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Yash', 'Finance', 8000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Rabin', 'Finance', 9000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Lukasz', 'Marketing', 10000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Jolly', 'Marketing', 11000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Mausam', 'Marketing', 12000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Lamba', 'Marketing', 13000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Jogesh', 'HR', 14000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Mannu', 'HR', 15000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Sylvia', 'HR', 16000);
INSERT INTO employees (employee_name, dept_name, salary) VALUES ('Sama', 'HR', 17000);
 
 
---find the highest salary in each department 
---solution

 
 WITH dr_data AS (
SELECT *,DENSE_RANK() OVER( PARTITION BY dept_name ORDER BY salary) AS dr FROM employees)
SELECT * FROM dr_data WHERE dr=1;