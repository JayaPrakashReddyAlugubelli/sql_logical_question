Find product wise total amount, including products with no sales

-- Create the 'products' table
CREATE TABLE products (
    pid INT PRIMARY KEY,       -- Product ID, Primary Key
    pname VARCHAR(50),         -- Product Name
    price INT                  -- Product Price
);

-- Insert data into the 'products' table
INSERT INTO products (pid, pname, price) 
VALUES 
    (1, 'A', 1000),
    (2, 'B', 400),
    (3, 'C', 500);

-- Create the 'transactions' table
CREATE TABLE transactions (
    pid INT,                   -- Product ID (Foreign Key)
    sold_date DATE,            -- Date of the transaction
    qty INT,                   -- Quantity sold
    amount INT,                -- Total amount for the transaction
    FOREIGN KEY (pid) REFERENCES products(pid) -- Foreign Key constraint
);

-- Insert data into the 'transactions' table
INSERT INTO transactions (pid, sold_date, qty, amount) 
VALUES 
    (1, '2024-02-01', 2, 2000),
    (1, '2024-03-01', 4, 4000),
    (1, '2024-03-15', 2, 2000),
    (3, '2024-04-24', 3, 1500),
    (3, '2024-05-16', 5, 2500);



WITH cte AS (
SELECT t.pid,p.pname,DATE_FORMAT(t.sold_date,'%Y') AS years,DATE_FORMAT(t.sold_date,'%m') AS months,t.amount
FROM transactions t  JOIN products p ON t.pid=p.pid)
SELECT *,sum(amount) OVER (PARTITION BY pname,years ORDER BY months)  FROM cte