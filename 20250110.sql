You have worldometer table. Give me countries in ascending order
 of country_name keeping IND and USA on top 2 (No use of joins, unions, subquery, select in select)
 
CREATE TABLE worldometer (
    country_name VARCHAR(3) PRIMARY KEY,
    population INT
);

INSERT INTO worldometer (country_name, population) VALUES ('AUS', 123456);
INSERT INTO worldometer (country_name, population) VALUES ('PAK', 9876543);
INSERT INTO worldometer (country_name, population) VALUES ('JPN', 34532);
INSERT INTO worldometer (country_name, population) VALUES ('USA', 567899);
INSERT INTO worldometer (country_name, population) VALUES ('NZ', 2345);
INSERT INTO worldometer (country_name, population) VALUES ('IND', 12345678);
INSERT INTO worldometer (country_name, population) VALUES ('CHN', 12345677);


SELECT country_name, population
FROM worldometer
ORDER BY 
    CASE 
        WHEN country_name = 'IND' THEN 1
        WHEN country_name = 'USA' THEN 2
        ELSE 3
    END,
    country_name;