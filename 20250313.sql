
Problem Statements :- Write SQL to display total number of matches played, matches won, matches tied and matches lost for each team


-- Create the Match_Result table
CREATE TABLE Match_Result (
    Team_1 VARCHAR(20),
    Team_2 VARCHAR(20),
    Result VARCHAR(20)
);

-- Insert data into the Match_Result table
INSERT INTO Match_Result VALUES('India', 'Australia', 'India');
INSERT INTO Match_Result VALUES('India', 'England', 'England');
INSERT INTO Match_Result VALUES('SouthAfrica', 'India', 'India');
INSERT INTO Match_Result VALUES('Australia', 'England', NULL);
INSERT INTO Match_Result VALUES('England', 'SouthAfrica', 'SouthAfrica');
INSERT INTO Match_Result VALUES('Australia', 'India', 'Australia');

WITH cte AS (
SELECT Team_1,case when Result IS NULL then 'tie' ELSE Result end AS Result  FROM Match_Result
UNION ALL
SELECT Team_2,case when Result IS NULL then 'tie' ELSE Result end AS Result  FROM Match_Result)
SELECT Team_1,COUNT(Team_1) AS played,sum(case when Team_1=Result then 1 ELSE 0  END) AS win,sum(case when Team_1 !=Result then 1 ELSE 0 END) AS loss,
sum(case when Result ='tie' then 1 ELSE 0  END) AS tie  FROM cte GROUP BY Team_1 ;
o/p:-

+-----------------+--------+-----+-----+-----+
| Team_1         | played | win | loss | tie |
+-----------------+--------+-----+-----+-----+
| India          |    4   |  2  |  2  |  0  |
| SouthAfrica    |    2   |  1  |  1  |  0  |
| Australia      |    3   |  1  |  2  |  1  |
| England        |    3   |  1  |  2  |  1  |
+-----------------+--------+-----+-----+-----+
