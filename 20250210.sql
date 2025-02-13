---Write a SQL query to find the product name, year, quantity and price in the year with the highest sales

-- Creating the products table
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(10)
);

-- Inserting data into the products table
INSERT INTO products VALUES (1, 'mobile');
INSERT INTO products VALUES (2, 'computer');
INSERT INTO products VALUES (3, 'tv');

-- Creating the sales table
CREATE TABLE sales (
    product_id INT,
    year INT,
    quantity INT,
    price INT
);

-- Inserting data into the sales table
INSERT INTO sales VALUES (1, 2022, 10, 1000);
INSERT INTO sales VALUES (1, 2023, 12, 1000);
INSERT INTO sales VALUES (1, 2024, 11, 1000);
INSERT INTO sales VALUES (2, 2022, 15, 1300);
INSERT INTO sales VALUES (2, 2023, 18, 1300);
INSERT INTO sales VALUES (3, 2022, 13, 1500);

WITH cte AS (
SELECT *,DENSE_RANK() OVER(PARTITION BY product_id ORDER BY quantity desc) AS dn from sales)
SELECT p.product_name,c.year,c.quantity,c.price  FROM cte c JOIN  products p
 ON c.product_id=p.product_id WHERE c.dn=1;
 
 
o/p:-
 
+--------------+------+----------+-------+
| product_name | year | quantity | price |
+--------------+------+----------+-------+
| mobile       | 2023 |    12    |  1000 |
| computer     | 2023 |    18    |  1300 |
| tv           | 2022 |    13    |  1500 |
+--------------+------+----------+-------+