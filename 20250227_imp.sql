write a sql in below dataset to find each flight source and destination


CREATE TABLE flight_info (
    id INT,
    source VARCHAR(25),
    destination VARCHAR(15)
);

INSERT INTO flight_info VALUES(1, 'Delhi', 'Kolkata');
INSERT INTO flight_info VALUES(1, 'Kolkata', 'Bangalore');
INSERT INTO flight_info VALUES(2, 'Mumbai', 'Pune');
INSERT INTO flight_info VALUES(2, 'Pune', 'Goa');
INSERT INTO flight_info VALUES(3, 'Kolkata', 'Delhi');
INSERT INTO flight_info VALUES(3, 'Delhi', 'Srinagar');



SELECT f1.id AS flight_id,f1.source AS source,f2.destination AS destination FROM flight_info f1 INNER JOIN  flight_info f2 ON f1.id=f2.id AND  f1.destination=f2.source ;

o/p:-
+-----------+---------+------------+
| flight_id | source  | destination |
+-----------+---------+------------+
| 1         | Delhi   | Bangalore   |
| 2         | Mumbai  | Goa         |
| 3         | Kolkata | Srinagar    |
+-----------+---------+------------+