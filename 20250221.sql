
Q. write a SQL query to find consecutive 3 rows with the visited people more than 500


CREATE TABLE tourist (
    id INT AUTO_INCREMENT,
    date_id DATE,
    visited_people INT,
    PRIMARY KEY (id)
);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-01-01', 700);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-02-01', 460);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-03-01', 550);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-04-01', 510);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-05-01', 550);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-06-01', 540);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-07-01', 90);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-08-01', 650);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-09-01', 580);
INSERT INTO tourist (date_id, visited_people) VALUES ('2024-10-01', 590);


WITH cte AS (
SELECT *,DATE_FORMAT(date_id,'%m') - ROW_NUMBER() OVER(ORDER BY date_id) 
AS rn FROM tourist WHERE visited_people >=500)
SELECT id, date_id, visited_people from cte WHERE rn in (SELECT rn FROM cte GROUP BY rn HAVING COUNT(*) >=3);

o/p:-

+----+------------+----------------+
| id |  date_id   | visited_people |
+----+------------+----------------+
|  3 | 2024-03-01 |       550      |
|  4 | 2024-04-01 |       510      |
|  5 | 2024-05-01 |       550      |
|  6 | 2024-06-01 |       540      |
|  8 | 2024-08-01 |       650      |
|  9 | 2024-09-01 |       580      |
| 10 | 2024-10-01 |       590      |
+----+------------+----------------+
