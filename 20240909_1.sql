Given us Customer table, we need to domain from email id.

create table customer_tbl (id int, email varchar(50))
insert into customer_tbl values (1,'abc@gmail.com'),(2,'xyz@hotmail.com'),
(3,'pqr@outlook.com')

SELECT Id,
       SUBSTRING(Email, 1, CHARINDEX('@', Email) - 1) AS Username,
       SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email)) AS Domain
FROM customer_tbl ;
