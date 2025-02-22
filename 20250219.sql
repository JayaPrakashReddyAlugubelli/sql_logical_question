
----You have a dataset with daily stock prices for multiple stocks. Your task is to flag each row based on whether the stock price has 𝐢𝐧𝐜𝐫𝐞𝐚𝐬𝐞𝐝, 𝐝𝐞𝐜𝐫𝐞𝐚𝐬𝐞𝐝, 𝐨𝐫 𝐬𝐭𝐚𝐲𝐞𝐝 𝐭𝐡𝐞 𝐬𝐚𝐦𝐞 compared to the previous day.



CREATE TABLE stock_data (
    stock_id VARCHAR(50),
    date DATE,
    price INT
);
INSERT INTO stock_data (stock_id, date, price) VALUES ('𝘈', '2024-01-01', 100);
INSERT INTO stock_data (stock_id, date, price) VALUES ('𝘈', '2024-01-02', 105);
INSERT INTO stock_data (stock_id, date, price) VALUES ('𝘈', '2024-01-03', 104);
INSERT INTO stock_data (stock_id, date, price) VALUES ('𝘉', '2024-01-01', 200);
INSERT INTO stock_data (stock_id, date, price) VALUES ('𝘉', '2024-01-02', 200);
INSERT INTO stock_data (stock_id, date, price) VALUES ('𝘉', '2024-01-03', 201);


WITH cte AS (
SELECT *,LAG(price,1) OVER(PARTITION BY stock_id ORDER BY DATE) AS prv_price FROM stock_data)
SELECT stock_id, date, price,case when price=prv_price then "SAME" 
when price > prv_price then "UP" when price < prv_price then "DOWN" end AS price_change FROM cte; 

o/p:-

+-----------+------------+-------+--------------+
| stock_id  | date       | price | price_change |
+-----------+------------+-------+--------------+
| 𝘈         | 2024-01-01 | 100   | NULL         |
| 𝘈         | 2024-01-02 | 105   | UP           |
| 𝘈         | 2024-01-03 | 104   | DOWN         |
| 𝘉         | 2024-01-01 | 200   | NULL         |
| 𝘉         | 2024-01-02 | 200   | SAME         |
| 𝘉         | 2024-01-03 | 201   | UP           |
+-----------+------------+-------+--------------+
