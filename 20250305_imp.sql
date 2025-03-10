
Problem Statement :
A vaccine is administered in two doses. It is best if the doses are given between 48 and 72 days apart, inclusive. Write a SQL query to return the percentage of beneficiaries who received both doses within the recommended time period, rounded to the nearest integer. Dose Table has columns namely Dose_id, Beneficiary_id, Dose_type and Vaccination_Date :

CREATE TABLE Doses (
    Dose_id INT ,
    Beneficiary_id INT,
    Dose_type VARCHAR(6),
    Vaccination_date DATE
);
INSERT INTO Doses (dose_id, beneficiary_id, dose_type, vaccination_date) VALUES
(2193, 750, 'first', '2021-05-15'),
(2194, 750, 'second', '2021-07-05'),
(2195, 751, 'first', '2021-06-01'),
(2196, 751, 'second', '2021-07-31'),
(2197, 752, 'first', '2021-06-10'),
(2198, 752, 'second', '2021-07-30'),
(2199, 753, 'first', '2021-06-15'),
(2200, 753, 'second', '2021-09-01'),
(2201, 754, 'first', '2021-04-18'),
(2202, 754, 'second', '2021-06-10'),
(2203, 755, 'first', '2021-05-25'),
(2204, 755, 'second', '2021-08-15');



with cte AS (SELECT *,DATEDIFF(LEAD(Vaccination_date) OVER(PARTITION BY Beneficiary_id  ORDER BY Dose_id),Vaccination_date) AS date_diff FROM doses)
SELECT ROUND(((select COUNT(Beneficiary_id) FROM cte WHERE date_diff BETWEEN 48 AND 72) /(SELECT COUNT(DISTINCT Beneficiary_id) as total_count)* 100),0) AS percentage  FROM cte;

o/P:-
"percentage"
"67"
