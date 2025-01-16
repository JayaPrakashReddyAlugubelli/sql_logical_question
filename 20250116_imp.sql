----PwC SQL Interview Question - Find the percentage of Genders

CREATE TABLE employees_tbl (
  eid INT,
  ename VARCHAR(50),
  gender VARCHAR(10)
);

INSERT INTO employees_tbl (eid, ename, gender) 
VALUES 
  (1, 'John Doe', 'Male'),
  (2, 'Jane Smith', 'Female'),
  (3, 'Michael Johnson', 'Male'),
  (4, 'Emily Davis', 'Female'),
  (5, 'Robert Brown', 'Male'),
  (6, 'Sophia Wilson', 'Female'),
  (7, 'David Lee', 'Male'),
  (8, 'Emma White', 'Female'),
  (9, 'James Taylor', 'Male'),
  (10, 'William Clark', 'Male');


SELECT
    ROUND(SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS male_perc,
    ROUND(SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS female_perc
FROM employees_tbl;