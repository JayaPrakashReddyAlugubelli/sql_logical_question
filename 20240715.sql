CREATE TABLE EmployeeSkills (
    Col1 VARCHAR(255),
    Col2 VARCHAR(255)
);

INSERT INTO EmployeeSkills (Col1, Col2) VALUES ('ramu', 'a.b.c');
INSERT INTO EmployeeSkills (Col1, Col2) VALUES ('hari', 'x.y.z');


/*
+----+-----+----+----+----+
|Col1|Col2 |Col3|Col4|Col5|
+----+-----+----+----+----+
|ramu|a.b.c|a   |b   |c   |
|hari|x.y.z|x   |y   |z   |
+----+-----+----+----+----+
*/


---my solution---

SELECT * , SUBSTRING_INDEX(Col2, '.', 1) as Col3,
           SUBSTRING_INDEX(SUBSTRING_INDEX(Col2, '.', 2), '.', -1) AS Col4,
			  SUBSTRING_INDEX(Col2, '.', -1) AS Col5
from employeeskills;
