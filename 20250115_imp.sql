----Find the Currency Exchange rate at beginning and ending of month

-- Create the table to store exchange rates
CREATE TABLE exchange_rates (
    currency_code VARCHAR(3),      -- Currency code (e.g., USD, EUR)
    date DATE,                     -- Date for the exchange rate
    currency_exchange_rate DECIMAL(10, 2)  -- Exchange rate for the given currency and date
);

-- Insert records into the table
INSERT INTO exchange_rates (currency_code, date, currency_exchange_rate) VALUES
('USD', '2024-06-01', 1.20),
('USD', '2024-06-02', 1.21),
('USD', '2024-06-03', 1.22),
('USD', '2024-06-04', 1.23),
('USD', '2024-07-01', 1.25),
('USD', '2024-07-02', 1.26),
('USD', '2024-07-03', 1.27),
('EUR', '2024-06-01', 1.40),
('EUR', '2024-06-02', 1.41),
('EUR', '2024-06-03', 1.42),
('EUR', '2024-06-04', 1.43),
('EUR', '2024-07-01', 1.45),
('EUR', '2024-07-02', 1.46),
('EUR', '2024-07-03', 1.47);



Find the Currency Exchange rate at beginning and ending of month

WITH cte AS (
    SELECT *,
           currency_code + '_' + FORMAT(date, 'yyyy_MM') AS currency_code_year_month
    FROM exchange_rates
)
SELECT currency_code_year_month,
       MIN(currency_exchange_rate) AS currency_rate_beginofmonth,
       MAX(currency_exchange_rate) AS currency_rate_endofmonth
FROM cte
GROUP BY currency_code_year_month;
