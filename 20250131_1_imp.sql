CREATE TABLE PhoneDirectory (
    CustomerID INT,
    `Type` VARCHAR(100),
    PhoneNumber VARCHAR(12) NOT NULL
);

INSERT INTO PhoneDirectory (CustomerID, `Type`, PhoneNumber) VALUES
(1001, 'Cellular', '555-897-5421'),
(1001, 'Work', '555-897-6542'),
(1001, 'Home', '555-698-9874'),
(2002, 'Cellular', '555-963-6544'),
(2002, 'Work', '555-812-9856'),
(3003, 'Cellular', '555-987-6541');


SELECT 
    CustomerID,
    MAX(CASE WHEN `Type` = 'Cellular' THEN PhoneNumber END) AS Cellular,
    MAX(CASE WHEN `Type` = 'Work' THEN PhoneNumber END) AS Work,
    MAX(CASE WHEN `Type` = 'Home' THEN PhoneNumber END) AS Home
FROM 
    PhoneDirectory
GROUP BY 
    CustomerID
ORDER BY 
    CustomerID;

o/p
+------------+-------------+-------------+-------------+
| CustomerID | Cellular    | Work        | Home        |
+------------+-------------+-------------+-------------+
| 1001       | 555-897-5421| 555-897-6542| 555-698-9874|
| 2002       | 555-963-6544| 555-812-9856| NULL        |
| 3003       | 555-987-6541| NULL        | NULL        |
+------------+-------------+-------------+-------------+