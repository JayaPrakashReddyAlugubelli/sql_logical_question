---DBS Bank SQL Interview Question - Find the missing weeks in a table


-- Create the table with columns: pid, sls_dt (sales date), sls_amt (sales amount)
CREATE TABLE sls_tbl (
    pid INT,               -- Product ID
    sls_dt DATE,           -- Sales date
    sls_amt INT            -- Sales amount
);

-- Insert sample data into the table
INSERT INTO sls_tbl (pid, sls_dt, sls_amt)
VALUES 
    (201, '2024-07-11', 140),
    (201, '2024-07-18', 160),
    (201, '2024-07-25', 150),
    (201, '2024-08-01', 180),
    (201, '2024-08-15', 170),
    (201, '2024-08-29', 130);


WITH cte AS (
SELECT * , -1 * DATEDIFF (sls_dt,LEAD(sls_dt,1,sls_dt) OVER(partition by pid ORDER BY pid)) AS diff FROM sls_tbl)
SELECT DATE_ADD(sls_dt,INTERVAL 7 DAY) AS missing_date FROM cte WHERE diff > 7 ;