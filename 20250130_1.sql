CREATE TABLE events (
    ID INT,
    event VARCHAR(255),
    YEAR INT,
    GOLD VARCHAR(255),
    SILVER VARCHAR(255),
    BRONZE VARCHAR(255)
);
INSERT INTO events (ID, event, YEAR, GOLD, SILVER, BRONZE) VALUES
    (1, '100m', 2016, 'Amthhew Mcgarray', 'donald', 'barbara'),
    (2, '200m', 2016, 'Nichole', 'Alvaro Eaton', 'janet Smith'),
    (3, '500m', 2016, 'Charles', 'Nichole', 'Susana'),
    (4, '100m', 2016, 'Ronald', 'maria', 'paula'),
    (5, '200m', 2016, 'Alfred', 'carol', 'Steven'),
    (6, '500m', 2016, 'Nichole', 'Alfred', 'Brandon'),
    (7, '100m', 2016, 'Charles', 'Dennis', 'Susana'),
    (8, '200m', 2016, 'Thomas', 'Dawn', 'catherine'),
    (9, '500m', 2016, 'Thomas', 'Dennis', 'paula'),
    (10, '100m', 2016, 'Charles', 'Dennis', 'Susana'),
    (11, '200m', 2016, 'jessica', 'Donald', 'Stefeney'),
    (12, '500m', 2016, 'Thomas', 'Steven', 'Catherine');



SELECT gold,COUNT(*) FROM EVENTS WHERE gold NOT IN (
SELECT SILVER FROM EVENTS  union
SELECT BRONZE FROM EVENTS ) 
group BY gold;



+-------------------+----------+
| GOLD              | COUNT(*) |
+-------------------+----------+
| Amthhew Mcgarray  | 1        |
| Alfred            | 1        |
| Ronald            | 1        |
| Thomas            | 1        |
+-------------------+----------+