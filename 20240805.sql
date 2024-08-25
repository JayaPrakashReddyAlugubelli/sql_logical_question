CREATE TABLE CricketTeams (
    Id INT PRIMARY KEY,
    TeamName VARCHAR(100)
);

INSERT INTO CricketTeams (Id, TeamName) VALUES
(1, 'India'),
(2, 'Australia'),
(3, 'England'),
(4, 'NewZealand');
/*
Sql query to schedule a match between each teams
+-----------------------+
|schedule_match         |
+-----------------------+
|India VS Australia     |
|India VS England       |
|India VS NewZealand    |
|Australia VS England   |
|Australia VS NewZealand|
|England VS NewZealand  |
+-----------------------+
*/

-----my solution ---
SELECT a.TeamName + ' vs ' + b.TeamName AS Matchup
FROM CricketTeams a
INNER JOIN CricketTeams b ON a.TeamName < b.TeamName;
