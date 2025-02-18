---

-- Dropping the Products table if it exists
DROP TABLE IF EXISTS Products;

-- Creating the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Product VARCHAR(255),
    Category VARCHAR(100)
);

-- Inserting data into the Products table
INSERT INTO Products (ProductID, Product, Category)
VALUES
    (1, 'Laptop', 'Electronics'),
    (2, 'Smartphone', 'Electronics'),
    (3, 'Tablet', 'Electronics'),
    (4, 'Headphones', 'Accessories'),
    (5, 'Smartwatch', 'Accessories'),
    (6, 'Keyboard', 'Accessories'),
    (7, 'Mouse', 'Accessories'),
    (8, 'Monitor', 'Accessories'),
    (9, 'Printer', 'Electronics');


with cte AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY Category ORDER BY ProductID) AS rn1,
ROW_NUMBER() OVER(PARTITION BY Category ORDER BY ProductID desc) AS rn2 FROM products ORDER BY Category DESC)
SELECT c1.ProductID,c2.Product,c2.Category FROM cte c1 JOIN  cte c2 ON c1.Category=c2.Category AND c1.rn1=c2.rn2 ;

O/p:-

+-----------+------------+-------------+
| ProductID | Product    | Category    |
+-----------+------------+-------------+
| 9         | Laptop     | Electronics |
| 3         | Smartphone | Electronics |
| 2         | Tablet     | Electronics |
| 1         | Printer    | Electronics |
| 8         | Headphones | Accessories |
| 7         | Smartwatch | Accessories |
| 6         | Keyboard   | Accessories |
| 5         | Mouse      | Accessories |
| 4         | Monitor    | Accessories |
+-----------+------------+-------------+