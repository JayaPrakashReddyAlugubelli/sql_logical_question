
-Q. Write a SQL Query to find the person_name of the last person that --can fit on the bus without exceeding the weight limit. limit is 400

-- Create the table bus
CREATE TABLE bus (
    personId INT,
    personName VARCHAR(100),
    personWeight INT,
    turn INT
);

-- Insert the values into bus table
INSERT INTO bus (personId, personName, personWeight, turn) VALUES (5, 'john', 120, 2);
INSERT INTO bus (personId, personName, personWeight, turn) VALUES (4, 'tom', 100, 1);
INSERT INTO bus (personId, personName, personWeight, turn) VALUES (3, 'rahul', 95, 4);
INSERT INTO bus (personId, personName, personWeight, turn) VALUES (6, 'bhavna', 100, 5);
INSERT INTO bus (personId, personName, personWeight, turn) VALUES (1, 'ankita', 79, 6);
INSERT INTO bus (personId, personName, personWeight, turn) VALUES (2, 'Alex', 80, 3);



with cte AS (SELECT *,SUM(personWeight) OVER(ORDER BY turn) AS sum_ FROM bus)
SELECT personName FROM cte WHERE sum_ <=400  ORDER BY turn DESC LIMIT 1 OFFSET 0; 