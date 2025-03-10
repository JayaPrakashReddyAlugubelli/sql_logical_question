Problem Statement :- You are working with a table called Orders that tracks customer orders with their order dates and amounts. Write a query to find each customer latest order amount along with the amount of the second latest order.

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(1, 101, '2024-01-10', 150.00),
(2, 101, '2024-02-15', 200.00),
(3, 101, '2024-03-20', 180.00),
(4, 102, '2024-01-12', 200.00),
(5, 102, '2024-02-25', 250.00),
(6, 102, '2024-03-10', 320.00),
(7, 103, '2024-01-25', 400.00),
(8, 103, '2024-02-15', 420.00);


WITH cte AS (
    SELECT 
        customer_id,
        NTH_VALUE(order_amount, 1) 
            OVER (
                PARTITION BY customer_id 
                ORDER BY order_date DESC
            ) AS latest_order_amount,
        NTH_VALUE(order_amount, 2) 
            OVER (
                PARTITION BY customer_id 
                ORDER BY order_date DESC
            ) AS second_highest_order
    FROM orders
)
SELECT DISTINCT customer_id, latest_order_amount, second_highest_order 
FROM cte 
WHERE second_highest_order IS NOT NULL;


o/p:-

+-------------+---------------------+----------------------+
| customer_id | latest_order_amount  | second_highest_order |
+-------------+---------------------+----------------------+
| 101         | 180.00              | 200.00               |
| 102         | 320.00              | 250.00               |
| 103         | 420.00              | 400.00               |
+-------------+---------------------+----------------------+


WITH cte AS (
SELECT customer_id,order_date,order_amount AS latest_order_amount ,LEAD(order_amount) OVER(PARTITION BY customer_id  ORDER BY order_date DESC) AS second_highest_order ,
ROW_NUMBER() OVER(PARTITION BY customer_id  ORDER BY order_date DESC) AS rn FROM orders )
SELECT customer_id,latest_order_amount,second_highest_order FROM cte WHERE rn=1