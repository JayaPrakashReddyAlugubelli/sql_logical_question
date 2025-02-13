Write a sql to return all emp whose salary is same in same department
CREATE TABLE emp_salary (emp_id INT NOT NULL, name VARCHAR(20) NOT NULL, salary VARCHAR(30), dept_id INT,  PRIMARY KEY (emp_id)
);
INSERT INTO emp_salary (emp_id, name, salary, dept_id)
VALUES  (101, 'sohan', '3000', 11), (102, 'rohan', '4000', 12),
    (103, 'mohan', '5000', 13),(104, 'cat', '3000', 11), (105, 'suresh', '4000', 12),
    (109, 'mahesh', '7000', 12), (108, 'kamal', '8000', 11);
SELECT emp_id, name, salary FROM emp_salary
WHERE salary IN ( SELECT salary
FROM emp_salary
    GROUP BY salary
    HAVING COUNT(*) > 1
);
SELECT e1.emp_id, e1.name, e1.salary, e1.dept_id
FROM emp_salary e1
JOIN emp_salary e2
ON e1.salary = e2.salary AND e1.dept_id = e2.dept_id
WHERE e1.emp_id <> e2.emp_id
ORDER BY e1.dept_id, e1.salary, e1.emp_id;
