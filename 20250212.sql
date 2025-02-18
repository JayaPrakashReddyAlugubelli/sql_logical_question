---write a sql query to convert original data to pivot table and pivot to otiginal data

DROP TABLE emp;

-- Creating the emp table
CREATE TABLE emp (
    emp_id INT,
    salary_component_type VARCHAR(20),
    val INT
);

-- Inserting data into the emp table
INSERT INTO emp
VALUES
(1, 'salary', 10000),
(1, 'bonus', 5000),
(1, 'hike_percent', 10),
(2, 'salary', 15000),
(2, 'bonus', 7000),
(2, 'hike_percent', 8),
(3, 'salary', 12000),
(3, 'bonus', 6000),
(3, 'hike_percent', 7);


SELECT emp_id, 
max(case when salary_component_type='salary' then val END) AS salary,
max(case when salary_component_type='bonus' then val END) AS bonus,
max(case when salary_component_type='hike_percent' then val END) AS hike_percent
 FROM emp GROUP BY emp_id;
 
o/p:-

+--------+-------+-------+-------------+
| emp_id | salary| bonus | hike_percent|
+--------+-------+-------+-------------+
| 1      | 10000 | 5000  | 10          |
| 2      | 15000 | 7000  | 8           |
| 3      | 12000 | 6000  | 7           |
+--------+-------+-------+-------------+
 