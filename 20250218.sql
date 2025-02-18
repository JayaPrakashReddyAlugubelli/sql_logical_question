
Q. write a sql query to find minimun 3 consucative free seat 1 free, not free


CREATE TABLE hall_ticket (
    id INT,
    seat_id INT
);

INSERT INTO hall_ticket VALUES (1, 1);
INSERT INTO hall_ticket VALUES (2, 0);
INSERT INTO hall_ticket VALUES (3, 1);
INSERT INTO hall_ticket VALUES (4, 1);
INSERT INTO hall_ticket VALUES (5, 1);
INSERT INTO hall_ticket VALUES (6, 0);
INSERT INTO hall_ticket VALUES (7, 1);
INSERT INTO hall_ticket VALUES (8, 1);
INSERT INTO hall_ticket VALUES (9, 0);
INSERT INTO hall_ticket VALUES (10, 1);
INSERT INTO hall_ticket VALUES (11, 0);
INSERT INTO hall_ticket VALUES (12, 1);
INSERT INTO hall_ticket VALUES (13, 0);
INSERT INTO hall_ticket VALUES (14, 1);
INSERT INTO hall_ticket VALUES (15, 1);
INSERT INTO hall_ticket VALUES (16, 0);
INSERT INTO hall_ticket VALUES (17, 1);
INSERT INTO hall_ticket VALUES (18, 1);
INSERT INTO hall_ticket VALUES (19, 1);
INSERT INTO hall_ticket VALUES (20, 1);





WITH cte AS (
SELECT *,id-ROW_NUMBER() OVER(ORDER BY id) AS rn  FROM hall_ticket WHERE seat_id=1)
select id from cte where rn IN (SELECT rn FROM cte GROUP BY rn HAVING COUNT(*) >=3);

o/p:-

+-----+
| id  |
+-----+
|  3  |
|  4  |
|  5  |
| 17  |
| 18  |
| 19  |
| 20  |
+-----+
