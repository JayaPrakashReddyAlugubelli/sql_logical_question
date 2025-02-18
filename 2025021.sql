write a SQL query to find the percentage of immediate orders --in the first orders of all customers, rounded to 2 decimal places. Note: order_date and delivery date same is called immediate order


CREATE TABLE delivery (
    id INT,
    customer_id INT,
    order_date DATE,
    delivery_date DATE
);

INSERT INTO delivery (id, customer_id, order_date, delivery_date) VALUES
(1, 1, '2024-12-01', '2024-12-02'),
(2, 2, '2024-12-02', '2024-12-02'),
(3, 1, '2024-12-10', '2024-12-11'),
(4, 3, '2024-12-01', '2024-12-01'),
(5, 3, '2024-12-02', '2024-12-03'),
(6, 2, '2024-12-10', '2024-12-11'),
(7, 4, '2024-12-02', '2024-12-02');





WITH cte AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn ,
case when order_date=delivery_date then 1 ELSE 0 end as flag FROM delivery)
SELECT COUNT(*) AS total_user,SUM(flag) AS immediate_order ,SUM(flag)/COUNT(*)*100 AS immediate_order_percentage  FROM cte WHERE rn=1;

o/p:-

+--------------+-----------------+--------------------------+
| total_user  | immediate_order | immediate_order_percentage |
+--------------+-----------------+--------------------------+
|      4       |        3        |          75.0000         |
+--------------+-----------------+--------------------------+
