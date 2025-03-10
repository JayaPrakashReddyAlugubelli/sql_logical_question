Problem Statement : Write a SQL query to find the maximum and minimum values of continuous ‘Sequence’ in each ‘Grou’


drop table emp;

CREATE TABLE Emp (
  `Grou` VARCHAR(20),
  `Sequence` INT
);

INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('A', 1);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('A', 2);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('A', 3);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('A', 5);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('A', 6);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('A', 8);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('A', 9);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('B', 11);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('C', 1);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('C', 2);
INSERT INTO Emp (`Grou`, `Sequence`) VALUES ('C', 3);


with cte AS (
SELECT * ,Sequence - ROW_NUMBER() OVER(PARTITION BY grou) AS rn FROM Emp)
SELECT Grou,MIN(Sequence) AS min_Sequence,MAX(Sequence) AS MAX_Sequence FROM cte GROUP BY Grou,rn ;


+-------+-------------+-------------+
| Group | min_Sequence| MAX_Sequence|
+-------+-------------+-------------+
| A     | 1           | 3           |
| A     | 5           | 6           |
| A     | 8           | 9           |
| B     | 11          | 11          |
| C     | 1           | 3           |
+-------+-------------+-------------+
