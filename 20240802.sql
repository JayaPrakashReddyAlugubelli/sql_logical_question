CREATE TABLE UserDetails (
    user_id INT PRIMARY KEY,
    age INT,
    gender CHAR(1),
    occupation VARCHAR(100),
    zip_code INT
);


INSERT INTO UserDetails (user_id, age, gender, occupation, zip_code) VALUES
(1, 24, 'M', 'Engineer', 85711),
(2, 53, 'F', 'other', 94043),
(3, 23, 'M', 'writer', 32067),
(4, 24, 'M', 'technician', 43537),
(5, 33, 'F', 'doctor', 15213),
(6, 35, 'M', 'Crickter', 32067),
(7, 44, 'M', 'technician', 43537),
(8, 33, 'F', 'Engineer', 15213),
(9, 24, 'M', 'Engineer', 85711),
(10, 35, 'F', 'Crickter', 32067),
(11, 24, 'M', 'Engineer', 85711),
(12, 23, 'F', 'writer', 32067),
(13, 23, 'F', 'writer', 32067);

/*
---find out male and female ration on each occupation
+----------+-----------------+-----------------+
|occupation|                F|                M|
+----------+-----------------+-----------------+
|  Crickter|             50.0|             50.0|
|    writer|66.66666666666666|33.33333333333333|
|     other|            100.0|             null|
|technician|             null|            100.0|
|  Engineer|             25.0|             75.0|
|    doctor|            100.0|             null|
+----------+-----------------+-----------------+
*/

--my solution 
SELECT 
    occupation,
    (SUM(male) * 100.0 / COUNT(gender)) AS male_ratio,
    (SUM(female) * 100.0 / COUNT(gender)) AS female_ratio
FROM (
    SELECT 
        occupation,
        gender,
        CASE WHEN gender = 'M' THEN 1 ELSE 0 END AS male,
        CASE WHEN gender = 'F' THEN 1 ELSE 0 END AS female
    FROM UserDetails
) AS k
GROUP BY occupation;
