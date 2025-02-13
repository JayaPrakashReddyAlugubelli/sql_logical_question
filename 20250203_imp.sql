write a SQL query to find company name ony whose revenue is increasing every year or remain same

CREATE TABLE company_info (
    company_name VARCHAR(10),
    year_cal INT,
    revenue INT
);

INSERT INTO company_info (company_name, year_cal, revenue) VALUES
('x', 2020, 100),
('x', 2021, 90),
('x', 2022, 120),
('y', 2020, 100),
('y', 2021, 100),
('z', 2020, 100),
('z', 2021, 120),
('z', 2022, 130);


with CTE as (select *, revenue - (lag(revenue) over(partition by company_name order by year_cal)) as yr_rn
from company_info)
select company_name, year_cal, revenue from CTE where company_name in 
(select company_name from CTE group by company_name having min(yr_rn) >=0)


o/p:-
+--------------+-----------+---------+
| company_name | year_cal  | revenue |
+--------------+-----------+---------+
| y            | 2020      | 100     |
| y            | 2021      | 100     |
| z            | 2020      | 100     |
| z            | 2021      | 120     |
| z            | 2022      | 130     |
+--------------+-----------+---------+