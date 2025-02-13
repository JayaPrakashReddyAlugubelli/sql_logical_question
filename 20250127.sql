
---Given us Customer table, we need to domain from email id.


-- Create the table
CREATE TABLE customer_tbl (
    id INT,
    email VARCHAR(50)
);

-- Insert the values
INSERT INTO customer_tbl (id, email) 
VALUES 
    (1, 'abc@gmail.com'),
    (2, 'xyz@hotmail.com'),
    (3, 'pqr@outlook.com');


SELECT 
    id,
    email,
    SUBSTRING_INDEX(email, '@', -1) AS domain
FROM 
    customer_tbl;
	
	
	-----------The SUBSTRING_INDEX function in MySQL is used to return a substring from a string before a specified delimiter a given number of times.
	------------------SUBSTRING_INDEX(str, delimiter, count)