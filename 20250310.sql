Problem Statement:-
Emp_Details  Table has four columns EmpID, Gender, EmailID and DeptID. User has to write a SQL query to derive another column called Email_List to display all Emailid concatenated with semicolon associated with a each DEPT_ID  as shown below in output Table.

-- Create the Emp_Details table
CREATE TABLE Emp_Details (
    EMPID INT,
    Gender VARCHAR(1),
    EmailID VARCHAR(30),
    DeptID INT
);

-- Insert data into the Emp_Details table
INSERT INTO Emp_Details (EMPID, Gender, EmailID, DeptID) VALUES
(1001, 'M', 'YYYYY@gmaix.com', 104),
(1002, 'M', 'ZZZ@gmaix.com', 103),
(1003, 'F', 'AAAAA@gmaix.com', 102),
(1004, 'F', 'PP@gmaix.com', 104),
(1005, 'M', 'CCCC@yahu.com', 101),
(1006, 'M', 'DDDDD@yahu.com', 100),
(1007, 'F', 'E@yahu.com', 102),
(1008, 'M', 'M@yahu.com', 102),
(1009, 'F', 'SS@yahu.com', 100);


SELECT DeptID,GROUP_CONCAT(EmailID,';') FROM Emp_Details GROUP BY DeptID;

o/p:-

+-----+-----------------------------------------------------------+
| DeptID | GROUP_CONCAT(EmailID, ';')                            |
+-----+-----------------------------------------------------------+
| 100   | DDDDD@yahu.com;SS@yahu.com;                             |
| 101   | CCCC@yahu.com;                                          |
| 102   | AAAAA@gmaix.com;E@yahu.com;M@yahu.com;                  |
| 103   | ZZZ@gmaix.com;                                          |
| 104   | YYYYY@gmaix.com;PP@gmaix.com;                           |
+-----+-----------------------------------------------------------+
