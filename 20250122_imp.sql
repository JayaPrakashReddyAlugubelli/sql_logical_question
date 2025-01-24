Tredence SQL Interview Question - Find events with 3 or more consecutive years for each pid

CREATE TABLE events (
  pid INT,
  year INT
);

INSERT INTO events (pid, year) 
VALUES 
  (1, 2019),
  (1, 2020),
  (1, 2021),
  (2, 2022),
  (2, 2021),
  (3, 2019),
  (3, 2021),
  (3, 2022);
  
  
WITH cte AS (
SELECT * ,(YEAR - ROW_NUMBER() OVER(PARTITION BY pid ORDER BY YEAR ) )AS rn
from event_test)
SELECT pid FROM cte GROUP BY rn,pid HAVING COUNT(*) >=3