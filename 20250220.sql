
--Q.Write a SQL querie to find the customer ids from the Customers table --that bought all the products in the Products table


-- Create the products table
CREATE TABLE products (
  product_id INT
);

-- Create the customers table
CREATE TABLE customers (
  customer_id VARCHAR(10),
  product_id INT
);

-- Insert data into the products table
INSERT INTO products VALUES (1);
INSERT INTO products VALUES (2);
INSERT INTO products VALUES (3);

-- Insert data into the customers table
INSERT INTO customers VALUES ('c1', 1);
INSERT INTO customers VALUES ('c2', 1);
INSERT INTO customers VALUES ('c2', 2);
INSERT INTO customers VALUES ('c2', 3);
INSERT INTO customers VALUES ('c3', 1);
INSERT INTO customers VALUES ('c3', 2);


SELECT customer_id FROM customers GROUP BY customer_id HAVING COUNT(*) >=(SELECT COUNT(*) FROM products);


+-------------+
| customer_id |
+-------------+
| c2          |
+-------------+
