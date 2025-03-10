Problem Statement:-
Student Table has three columns Student_Name, Total_Marks and Year. User has to write a SQL query to display Student_Name, Total_Marks, Year,  Prev_Yr_Marks for those whose Total_Marks are greater than or equal to the previous year.


CREATE TABLE Student (
    Student_Name VARCHAR(30),
    Total_Marks INT,
    Year INT
);

INSERT INTO Student (Student_Name, Total_Marks, Year) VALUES
('Rahul', 90, 2010),
('Sanjay', 80, 2010),
('Mohan', 70, 2010),
('Rahul', 90, 2011),
('Sanjay', 85, 2011),
('Mohan', 65, 2011),
('Rahul', 80, 2012),
('Sanjay', 80, 2012),
('Mohan', 90, 2012);


WITH cte AS (
SELECT * ,lag(Total_Marks) OVER(PARTITION BY Student_Name ORDER BY YEAR) AS prev_ye_marks FROM Student)
SELECT * FROM cte WHERE prev_ye_marks IS not NULL  AND Total_Marks >= prev_ye_marks  ;

+----------------+------------+------ +----------------+
| Student_Name   | Total_Marks| Year | prev_ye_marks  |
+----------------+------------+------ +----------------+
| Mohan          | 90         | 2012 | 65             |
| Rahul          | 90         | 2011 | 90             |
| Sanjay         | 85         | 2011 | 80             |
+----------------+------------+------ +----------------+
