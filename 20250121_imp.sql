KPMG SQL Interview Question - Using ROW_NUMMBER( ) & CASE Statement
--Create table syntax
CREATE TABLE transactions_1308 (transaction_id BIGINT, type VARCHAR(50), amount INT,transaction_date DATE)

-- Insert data into the table
INSERT INTO transactions_1308 VALUES (53151, 'deposit', 178, '2022-07-08'), (29776, 'withdrawal', 25, '2022-07-08'),(16461, 'withdrawal', 45, '2022-07-08'),(19153, 'deposit', 65, '2022-07-10'),(77134, 'deposit', 32, '2022-07-10')


with cte AS (
SELECT *,
case when TYPE='withdrawal' then -1 * amount ELSE amount END AS running_total,
ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS rn
FROM transactions_1308)
SELECT *, SUM(running_total) OVER(ORDER BY rn) AS running_total FROM cte;
