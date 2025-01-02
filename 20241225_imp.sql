CREATE TABLE CustomerProducts (
    customer_id INT,
    product_purchase VARCHAR(255)
);
INSERT INTO CustomerProducts (customer_id, product_purchase) 
VALUES 
(1, 'mobile,PC,Tab'),
(2, 'mobile,PC'),
(3, 'Tab,Pen');

SELECT 
    customer_id, 
    TRIM(value) AS product
FROM 
    CustomerProducts
CROSS APPLY 
    STRING_SPLIT(product_purchase, ',');
