-- Step 1: Create the user_relationships table and insert the data
CREATE TABLE user_relationships (
    user1 INT,
    user2 INT
);

INSERT INTO user_relationships (user1, user2) VALUES (1, 5);
INSERT INTO user_relationships (user1, user2) VALUES (1, 3);
INSERT INTO user_relationships (user1, user2) VALUES (1, 6);
INSERT INTO user_relationships (user1, user2) VALUES (2, 1);
INSERT INTO user_relationships (user1, user2) VALUES (2, 6);
INSERT INTO user_relationships (user1, user2) VALUES (3, 9);
INSERT INTO user_relationships (user1, user2) VALUES (4, 1);
INSERT INTO user_relationships (user1, user2) VALUES (7, 2);
INSERT INTO user_relationships (user1, user2) VALUES (8, 3);

/*

Find the popularity percentage for each user on Meta/Facebook. The populrity percentage is defined as the no of friends the user has divided by the total no of users in the platform multiply with 100. Output each user with popular percentage. Order records in ascending order by user id.

"user1"	"friends_ratio"
"1"	"55.56"
"2"	"33.33"
"3"	"33.33"
"4"	"11.11"
"7"	"11.11"
"8"	"11.11"
"5"	"11.11"
"6"	"22.22"
"9"	"11.11"

*/


WITH test AS (
    SELECT user1, COUNT(*) AS user_counts
    FROM (
        SELECT user1, user2 FROM user_relationships
        UNION 
        SELECT user2, user1 FROM user_relationships
    ) AS k
    GROUP BY user1
)
SELECT user1, ROUND((user_counts / (SELECT COUNT(*) FROM test)) * 100, 2) AS friends_ratio
FROM test;
