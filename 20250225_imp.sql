--Q.write a sql query to find maximum population and minimum population city for state


CREATE TABLE city_info (
    id INT,
    state VARCHAR(15),
    city VARCHAR(10),
    population INT
);

INSERT INTO city_info (id, state, city, population) VALUES
(1, 'Maharashtra', 'Mumbai', 1000),
(2, 'Maharashtra', 'Pune', 500),
(3, 'Maharashtra', 'Nagpur', 400),
(4, 'Punjab', 'Amritsar', 800),
(5, 'Punjab', 'Ludhiana', 350),
(6, 'Punjab', 'Patiala', 200),
(7, 'TamilNadu', 'Chennai', 700),
(8, 'TamilNadu', 'Vellore', 400);



SELECT distinct state,FIRST_VALUE(city) OVER(PARTITION BY state ORDER  BY population) AS min_population,
FIRST_VALUE(city) OVER(PARTITION BY state ORDER  BY population desc) AS max_population FROM city_info;


o/p:-
+------------+--------------+-------------+
| state      | min_population | max_population |
+------------+--------------+-------------+
| Maharashtra| Nagpur       | Mumbai      |
| Punjab     | Patiala      | Amritsar    |
| TamilNadu  | Vellore      | Chennai     |
+------------+--------------+-------------+
