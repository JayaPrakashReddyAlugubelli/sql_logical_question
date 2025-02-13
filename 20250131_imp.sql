CREATE TABLE Matches (
    Team1 VARCHAR(50),
    Team2 VARCHAR(50),
    Winner VARCHAR(50)
);
INSERT INTO Matches (Team1, Team2, Winner)
VALUES 
('India', 'Pakistan', 'India'),
('India', 'Srilanka', 'India'),
('Srilanka', 'India', 'India'),
('Pakistan', 'Srilanka', 'Srilanka'),
('Pakistan', 'England', 'Pakistan'),
('Srilanka', 'England', 'Srilanka');

WITH cte AS (
    SELECT 
        TeamName,
        SUM(CASE WHEN TeamName = Winner THEN 1 ELSE 0 END) AS Won,
        SUM(CASE WHEN TeamName != Winner THEN 1 ELSE 0 END) AS Lost
    FROM (
        SELECT Team1 AS TeamName, Winner FROM Matches
        UNION ALL
        SELECT Team2 AS TeamName, Winner FROM Matches
    ) AS TeamResults
    GROUP BY TeamName
)
SELECT 
    TeamName,
    (Won + Lost) AS TotalMatches,
    Won, Lost
FROM cte
ORDER BY TeamName;

o/p:-
+-----------+-------------------+-----+-----+
| TeamName  | TotalMatches      | Won | Lost|
+-----------+-------------------+-----+-----+
| England   | 2                 | 1   | 1   |
| India     | 3                 | 3   | 0   |
| Pakistan  | 2                 | 1   | 1   |
| Srilanka  | 3                 | 2   | 1   |
+-----------+-------------------+-----+-----+