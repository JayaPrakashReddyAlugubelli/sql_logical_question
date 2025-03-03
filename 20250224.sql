Q. Write a SQL querie to find the prices of all products on 2024-12-16.
Assume the price of all products before any change is 10.


CREATE TABLE products (
    product_id INT,
    new_price INT,
    change_date DATE
);

INSERT INTO products (product_id, new_price, change_date) VALUES
(1, 20, '2024-12-14'),
(2, 50, '2024-12-14'),
(1, 30, '2024-12-15'),
(1, 35, '2024-12-16'),
(2, 65, '2024-12-17'),
(3, 20, '2024-12-18');





WITH price AS (
    SELECT 
        product_id,
        new_price,
        change_date,
        CASE 
            WHEN change_date = '2024-12-16' THEN new_price
            WHEN change_date > '2024-12-16' AND product_id = LAG(product_id) OVER (ORDER BY product_id, change_date) THEN LAG(new_price, 1) OVER (ORDER BY product_id, change_date)
            WHEN change_date > '2024-12-16' AND product_id <> LAG(product_id) OVER (ORDER BY product_id, change_date) THEN 10
            ELSE NULL
        END AS price
    FROM products
)
SELECT product_id, price
FROM price
WHERE price IS NOT NULL;


o/p:-
+------------+-------+
| product_id | price |
+------------+-------+
|      1     |   35  |
|      2     |   50  |
|      3     |   10  |
+------------+-------+
