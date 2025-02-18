#Write a sql query pivot below dataset

CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(15) NULL,
    amount INT NULL,
    country VARCHAR(10) NULL
);

INSERT INTO product (product, amount, country) VALUES
('banana', 1000, 'usa'),
('carrots', 1500, 'usa'),
('beans', 1600, 'usa'),
('orange', 2000, 'usa'),
('banana', 400, 'china'),
('carrots', 1200, 'china'),
('beans', 1500, 'china'),
('orange', 4000, 'china'),
('banana', 2000, 'canada'),
('carrots', 2000, 'canada'),
('beans', 2000, 'mexico');


SELECT country, 
max(case when product='banana' then amount END) AS banana,
max(case when product='carrots' then amount END) AS carrots,
max(case when product='beans' then amount END) AS beans,
max(case when product='orange' then amount END) AS orange  FROM product GROUP BY country ;



o/p:-

+------------------+--------+--------+-------+--------+
| Country          | Banana | Carrots | Beans | Orange |
+------------------+--------+--------+-------+--------+
| usa              |   1000 |   1500 |  1600 |   2000 |
| china            |    400 |   1200 |  1500 |   4000 |
| canada           |   2000 |   2000 |     0 |      0 |
| mexico           |      0 |      0 |  2000 |      0 |
+------------------+--------+--------+-------+--------+
