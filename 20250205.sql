write a sql query to find lowest and highest salary emp in each dept
drop table emp;
CREATE TABLE emp (
    id INT,
    emp_name VARCHAR(20),
    gender VARCHAR(10),
    dept VARCHAR(20),
    salary INT
);

INSERT INTO emp VALUES 
(1, 'Tildie', 'Female', 'Support', 1676),
(2, 'Averil', 'Female', 'Engineering', 1572),
(3, 'Matthiew', 'Male', 'Engineering', 1477),
(4, 'Reinald', 'Male', 'Services', 1877),
(5, 'Karola', 'Genderqueer', 'Marketing', 1029),
(6, 'Manon', 'Genderfluid', 'Research and Development', 1729),
(7, 'Tabbie', 'Female', 'Research and Development', 1000),
(8, 'Corette', 'Female', 'Marketing', 1624),
(9, 'Edward', 'Male', 'Accounting', 1157),
(10, 'Philipa', 'Female', 'Human Resources', 1992),
(11, 'Ingeberg', 'Female', 'Services', 1515),
(12, 'Kort', 'Male', 'Support', 1005),
(13, 'Shelby', 'Male', 'Product Management', 1020),
(14, 'Shelden', 'Male', 'Legal', 1354),
(15, 'Sonya', 'Female', 'Marketing', 1321);


with cte AS (SELECT * ,DENSE_RANK() OVER(PARTITION BY dept ORDER BY salary desc) AS hs,
 DENSE_RANK() OVER(PARTITION BY dept ORDER BY salary asc) AS ls from emp)
 SELECT dept,
 max(case when hs=1 then emp_name END) AS hs,
 max(case when ls=1 then emp_name END) AS ls FROM cte WHERE hs=1 OR ls=1 GROUP BY dept 
 
+-------------------------+------------------+------------------+
|          dept           |        hs        |        ls        |
+-------------------------+------------------+------------------+
| Accounting              | Edward           | Edward           |
| Engineering             | Averil           | Matthiew         |
| Human Resources         | Philipa          | Philipa          |
| Legal                   | Shelden          | Shelden          |
| Marketing               | Corette          | Karola           |
| Product Management      | Shelby           | Shelby           |
| Research and Development| Manon            | Tabbie           |
| Services                | Reinald          | Ingeberg         |
| Support                 | Tildie           | Kort             |
+-------------------------+------------------+------------------+
