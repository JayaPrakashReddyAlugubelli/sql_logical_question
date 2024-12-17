Write a sql query to distribute salary based on experience
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    yearsofexp INT
);

INSERT INTO employees (id, name, yearsofexp) 
VALUES 
    (1, 'a', 8),
    (2, 'b', 16),
    (3, 'c', 6);
CREATE TABLE bonuses (
    year INT PRIMARY KEY,
    bonus DECIMAL(18, 2)
);

INSERT INTO bonuses (year, bonus) 
VALUES 
    (2022, 3000000.00),
    (2023, 3000000.00),
    (2024, 6000000.00);




-----------------------------------------------------------------------------
WITH total_exp AS (
    SELECT SUM(yearsofexp) AS total_experience 
    FROM employees
),
bonus_sum AS (
    SELECT SUM(bonus) AS b_s 
    FROM bonuses
)
SELECT 
    e.id, 
    e.name,  
    e.yearsofexp, 
    (CAST(e.yearsofexp AS DECIMAL(18, 2)) / total.total_experience) * bonus_sum.b_s AS b_salary
FROM 
    employees e,
    total_exp total,
    bonus_sum;
	
	