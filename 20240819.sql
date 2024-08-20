CREATE TABLE Employees (
    Emp_Id INT,
    Emp_name VARCHAR(50),
    Salary INT,
    Manager_Id INT
);

INSERT INTO Employees (Emp_Id, Emp_name, Salary, Manager_Id) VALUES (10, 'Anil', 50000, 18);
INSERT INTO Employees (Emp_Id, Emp_name, Salary, Manager_Id) VALUES (11, 'Vika', 75000, 16);
INSERT INTO Employees (Emp_Id, Emp_name, Salary, Manager_Id) VALUES (12, 'Nisha', 40000, 18);
INSERT INTO Employees (Emp_Id, Emp_name, Salary, Manager_Id) VALUES (13, 'Nidhi', 60000, 17);
INSERT INTO Employees (Emp_Id, Emp_name, Salary, Manager_Id) VALUES (14, 'Priya', 80000, 18);
INSERT INTO Employees (Emp_Id, Emp_name, Salary, Manager_Id) VALUES (15, 'Mohit', 45000, 18);
INSERT INTO Employees (Emp_Id, Emp_name, Salary, Manager_Id) VALUES (16, 'Rajesh', 90000, 16);
INSERT INTO Employees (Emp_Id, Emp_name, Salary, Manager_Id) VALUES (17, 'Raman', 55000, 16);
INSERT INTO Employees (Emp_Id, Emp_name, Salary, Manager_Id) VALUES (18, 'Santosh', 65000, 17);



select e2.Emp_name,avg(e1.Salary) from Employees e1 inner join Employees e2 on e1.Manager_Id=e2.Emp_Id  group by e2.Emp_name 
