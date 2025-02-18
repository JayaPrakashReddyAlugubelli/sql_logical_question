----Write a SQL query to find the employee names who have the same salary as another employee in the same department.

DROP TABLE emp_info;

-- Creating the emp_info table
CREATE TABLE emp_info (
    id INT,
    name VARCHAR(10),
    dept VARCHAR(10),
    salary INT
);

-- Inserting data into the emp_info table
INSERT INTO emp_info VALUES (1, 'Akash', 'Sales', 100);
INSERT INTO emp_info VALUES (2, 'John', 'Sales', 110);
INSERT INTO emp_info VALUES (3, 'Rohit', 'Sales', 100);
INSERT INTO emp_info VALUES (4, 'Tom', 'IT', 200);
INSERT INTO emp_info VALUES (5, 'Subham', 'IT', 205);
INSERT INTO emp_info VALUES (6, 'Vabna', 'IT', 200);
INSERT INTO emp_info VALUES (7, 'Prativa', 'Marketing', 150);
INSERT INTO emp_info VALUES (8, 'Rahul', 'Marketing', 155);
INSERT INTO emp_info VALUES (9, 'Yash', 'Marketing', 160);


SELECT * FROM emp_info WHERE salary IN
(SELECT salary from emp_info GROUP BY salary  HAVING COUNT(*) > 1);


o/p:-

+----+--------+----------+-------+
| id | name   | dept     | salary|
+----+--------+----------+-------+
| 1  | Akash  | Sales    | 100   |
| 3  | Rohit  | Sales    | 100   |
| 4  | Tom    | IT       | 200   |
| 6  | Vabna  | IT       | 200   |
+----+--------+----------+-------+