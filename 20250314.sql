Problem Statements :- Write SQL to get the total Sales in year 1998,1999 and 2000 for all the products as shown below.

-- Create SalesTable
CREATE TABLE SalesTable (
    Product VARCHAR(50),
    SalesYear INT,
    QuantitySold INT
);

-- Insert data into SalesTable
INSERT INTO SalesTable (Product, SalesYear, QuantitySold) VALUES ('ProductA', 1998, 1000);
INSERT INTO SalesTable (Product, SalesYear, QuantitySold) VALUES ('ProductA', 1999, 1200);
INSERT INTO SalesTable (Product, SalesYear, QuantitySold) VALUES ('ProductA', 2000, 1500);
INSERT INTO SalesTable (Product, SalesYear, QuantitySold) VALUES ('ProductB', 1998, 800);
INSERT INTO SalesTable (Product, SalesYear, QuantitySold) VALUES ('ProductB', 1999, 900);
INSERT INTO SalesTable (Product, SalesYear, QuantitySold) VALUES ('ProductB', 2000, 1100);
INSERT INTO SalesTable (Product, SalesYear, QuantitySold) VALUES ('ProductC', 1998, 600);
INSERT INTO SalesTable (Product, SalesYear, QuantitySold) VALUES ('ProductC', 1999, 700);
INSERT INTO SalesTable (Product, SalesYear, QuantitySold) VALUES ('ProductC', 2000, 750);


WITH cte AS (
SELECT  SalesYear,SUM(QuantitySold) AS sum_ FROM SalesTable GROUP BY SalesYear)
SELECT 'totalsales' AS totalsales,  MAX(case when  SalesYear='1998' then sum_ END) AS '1998',
MAX(case when  SalesYear='1999' then sum_ END) AS '1999',
MAX(case when  SalesYear='2000' then sum_ END) AS '2000'  FROM cte;

+------------+--------+--------+--------+
| totalsales | 1998   | 1999   | 2000   |
+------------+--------+--------+--------+
| totalsales | 2400   | 2800   | 3350   |
+------------+--------+--------+--------+
