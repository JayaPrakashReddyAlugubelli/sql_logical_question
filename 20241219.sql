CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name NVARCHAR(50),
    salary INT,
    manager_id INT
);
INSERT INTO Employees (id, name, salary, manager_id) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);



SELECT e.id AS employee_id, e.name AS employee_name, e.salary AS employee_salary,
       m.name AS manager_name, m.salary AS manager_salary
FROM Employees e
JOIN Employees m ON e.manager_id = m.id
WHERE e.salary > m.salary;