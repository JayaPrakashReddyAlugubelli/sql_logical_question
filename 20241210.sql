CREATE TABLE EmployeeData (
    Dep VARCHAR(50),
    Gender CHAR(1)
);

INSERT INTO EmployeeData (Dep, Gender) VALUES
('IT', 'M'),
('IT', 'F'),
('IT', 'M'),
('IT', 'M'),
('HR', 'F'),
('HR', 'F'),
('HR', 'F'),
('HR', 'F'),
('HR', 'F'),
('Sales', 'M'),
('Sales', 'M'),
('Sales', 'F'),
('Sales', 'M'),
('Sales', 'M'),
('Sales', 'F');

/*
find out toatl employes in each dep ,how many male emps and female emps
output:-
+-----+---+----+------+
|  Dep|Dep|Male|Female|
+-----+---+----+------+
|   IT|  4|   3|     1|
|   HR|  5|null|     5|
|Sales|  6|   4|     2|
+-----+---+----+------+
*/

---my solustion

SELECT Dep,COUNT(gender),sum(male_emp),sum(Female_emp) FROM 
(SELECT *,case when gender='M' then 1 else 0 END AS male_emp , 
case when gender='F' then 1 else 0 END AS Female_emp FROM EmployeeData) AS k GROUP BY Dep ;

-------------
SELECT dep,COUNT(Gender),
SUM(case when Gender='M'then 1 ELSE 0 END) AS Male,
SUM(case when Gender='F'then 1 ELSE 0 END) AS Female
FROM EmployeeData GROUP BY dep ;