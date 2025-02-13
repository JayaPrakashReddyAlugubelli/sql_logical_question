
write a sql query to find team-name, noofmatch, noofwin and nooflost count and DRAW

DROP TABLE cricket_match;

CREATE TABLE cricket_match (
    match_id INT,
    team1 VARCHAR(20),
    team2 VARCHAR(20),
    result VARCHAR(20)
);

INSERT INTO cricket_match VALUES
(1, 'ENG', 'NZ', 'NZ'),
(2, 'PAK', 'NED', 'PAK'),
(3, 'AFG', 'BAN', 'BAN'),
(4, 'SA', 'SL', 'SA'),
(5, 'AUS', 'IND', 'AUS'),
(6, 'NZ', 'NED', 'NZ'),
(7, 'ENG', 'BAN', 'ENG'),
(8, 'SL', 'PAK', 'PAK'),
(9, 'AFG', 'IND', 'IND'),
(10, 'SA', 'AUS', 'SA'),
(11, 'BAN', 'NZ', 'BAN'),
(12, 'PAK', 'IND', 'IND'),
(13, 'SA', 'IND', 'DRAW');



SELECT teamname,
COUNT(*) AS noofmatch,
SUM(case when teamname=result then 1 ELSE 0 END) AS noofwin ,
SUM(case when teamname !=result AND result !='DRAW' then 1 ELSE 0 END) AS nooflost,
SUM(case when result ='DRAW' then 1 ELSE 0 END) AS DRAW from
(
SELECT team1 AS teamname,result FROM cricket_match
UNION ALL
SELECT team2 AS teamname,result FROM cricket_match)
AS k GROUP BY teamname;

+-------+-----------+--------+--------+------+
| team  | noofmatch | noofwin | nooflost | DRAW |
+-------+-----------+--------+--------+------+
| ENG   |     2     |    1   |    1    |   0  |
| PAK   |     3     |    2   |    1    |   0  |
| AFG   |     2     |    0   |    2    |   0  |
| SA    |     3     |    2   |    0    |   1  |
| AUS   |     2     |    1   |    1    |   0  |
| NZ    |     3     |    2   |    1    |   0  |
| SL    |     2     |    0   |    2    |   0  |
| BAN   |     3     |    2   |    1    |   0  |
| NED   |     2     |    0   |    2    |   0  |
| IND   |     4     |    2   |    1    |   1  |
+-------+-----------+--------+--------+------+
