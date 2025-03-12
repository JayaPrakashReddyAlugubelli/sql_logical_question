This question has been asked in Amazon interview for the role of Data Analyst
Order_Tbl has four columns namely ORDER_DAY, ORDER_ID, PRODUCT_ID, QUANTITY and PRICE
(a) Write a SQL to get all the products that got sold on both the days and the number of times the product is sold.
(b) (b) Write a SQL to get products that was ordered on 02-May-2015 but not on 01-May-2015

CREATE TABLE Order_Tbl (
    ORDER_DAY DATE,
    ORDER_ID VARCHAR(10),
    PRODUCT_ID VARCHAR(10),
    QUANTITY INT,
    PRICE INT
);
INSERT INTO Order_Tbl (ORDER_DAY, ORDER_ID, PRODUCT_ID, QUANTITY, PRICE) VALUES 
('2015-05-01', 'ODR1', 'PROD1', 5, 5),
('2015-05-01', 'ODR2', 'PROD2', 2, 10),
('2015-05-01', 'ODR3', 'PROD3', 10, 25),
('2015-05-01', 'ODR4', 'PROD1', 20, 5),
('2015-05-02', 'ODR5', 'PROD3', 5, 25),
('2015-05-02', 'ODR6', 'PROD4', 6, 20),
('2015-05-02', 'ODR7', 'PROD1', 2, 5),
('2015-05-02', 'ODR8', 'PROD5', 1, 50),
('2015-05-02', 'ODR9', 'PROD6', 2, 50),
('2015-05-02', 'ODR10', 'PROD2', 4, 10);


1.SELECT PRODUCT_ID,COUNT(PRODUCT_ID) AS count FROM Order_Tbl GROUP BY PRODUCT_ID HAVING COUNT(PRODUCT_ID) > 1;

+------------+-------+
| PRODUCT_ID | count |
+------------+-------+
| PROD1      |     3 |
| PROD2      |     2 |
| PROD3      |     2 |
+------------+-------+

2.SELECT DISTINCT(PRODUCT_ID)  FROM Order_Tbl WHERE ORDER_DAY ='2015-05-02'  AND PRODUCT_ID
 NOT IN (SELECT PRODUCT_ID FROM  Order_Tbl WHERE ORDER_DAY='2015-05-01'  );
 
 +------------+
| PRODUCT_ID |
+------------+
| PROD4      |
| PROD5      |
| PROD6      |
+------------+
