Write a sql query to distribute salary based on experience
employees
"id"	"name"	"yearsofexp"
"1"	"a"	"8"
"2"	"b"	"16"
"3"	"c"	"6"
bonuses
"year"	"bonus"
"2022"	"3000000.00"
"2023"	"3000000.00"
"2024"	"6000000.00" 
output :-

"id" "name"	"yearsofexp"	"b_salary"
"1"	"a"	"8"	"319999999.200000"
"2"	"b"	"16"	"639999999.600000"
"3"	"c"	"6"	"240000000.000000"


WITH total_exp AS (
    SELECT SUM(yearsofexp) AS total_experience FROM employees
),
bonus_sum AS (SELECT SUM(bonus) AS b_s FROM bonuses
)
SELECT e.id, e.name,  e.yearsofexp, 
    (e.yearsofexp / total.total_experience) * bonus_sum.b_s AS b_salary
FROM 
    employees e,total_exp total,bonus_sum;