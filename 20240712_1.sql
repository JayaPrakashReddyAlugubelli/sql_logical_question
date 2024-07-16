-- Create the table to store employee data
CREATE TABLE employees (
    emp_name VARCHAR(50),
    mgr_name VARCHAR(50)
);

-- Insert sample data into the table
INSERT INTO employees (emp_name, mgr_name) VALUES
('John', 'Smith'),
('Erica', 'Meyers'),
('Charles', 'Brown'),
('Michael', 'Brown'),
('HARSH', 'PARESH'),
('NARESH', 'PARESH'),
('SURESH', 'PARESH');



Write SQL program to get maximum employee count manager and minimum employee count manager name




















SELECT mgr_name,emp_counts FROM 
(SELECT mgr_name,emp_counts,DENSE_RANK() OVER (ORDER BY emp_counts DESC ) AS HC ,
DENSE_RANK() OVER (ORDER BY emp_counts  ) AS LC FROM 
(SELECT mgr_name,COUNT(*) AS emp_counts FROM employees GROUP BY mgr_name) AS k ) AS jp WHERE HC=1 OR LC=1;