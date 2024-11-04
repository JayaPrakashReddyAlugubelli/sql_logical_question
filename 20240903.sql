Given us brands table, we need to forward fill the categories wherever we have nulls for all brands in the table.

create table brands (category varchar(50), brand_name varchar(50))
------------

insert into brands values ('chocolates', '5-star'),(NULL, 'dairy milk'),(NULL, 'perk'),(NULL, 'eclair'),('Biscuits', 'Britania'),(NULL, 'good day'),(NULL, 'boost')
----------

WITH cte_1 as(
SELECT * ,ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS rn FROM brands)
, cte_2 AS (
SELECT *,COUNT(category ) OVER(ORDER BY rn ) AS ct FROM cte_1)
SELECT first_value(category) OVER(partition BY ct ORDER BY rn),brand_name  FROM cte_2;
------

SELECT 
    COALESCE(b.category, prev_categories.last_non_null_category) AS filled_category,
    b.brand_name
FROM brands b
OUTER APPLY (
    SELECT TOP 1 category AS last_non_null_category
    FROM brands b2
    WHERE b2.brand_name <= b.brand_name
      AND b2.category IS NOT NULL
    ORDER BY b2.brand_name
) prev_categories;

---Deloitte SQL Interview Question | BIG 4 | Forward Filling | Deepankar Pathak