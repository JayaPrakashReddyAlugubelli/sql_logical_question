
Problem Statements :- Write SQL to get the most recent / latest balance, and TransactionID for each AccountNumber

-- Create Transaction_Table
CREATE TABLE Transaction_Table (
    AccountNumber INT,
    TransactionTime DATETIME,
    TransactionID INT,
    Balance INT
);

-- Insert data into Transaction_Table
INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (550, '2020-05-12 05:29:44.120', 1001, 2000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (550, '2020-05-15 10:29:25.630', 1002, 8000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (460, '2020-03-15 11:29:23.620', 1003, 9000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (460, '2020-04-30 11:29:57.320', 1004, 7000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (460, '2020-04-30 12:32:44.233', 1005, 5000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (640, '2020-02-18 06:29:34.420', 1006, 5000);

INSERT INTO Transaction_Table (AccountNumber, TransactionTime, TransactionID, Balance) 
VALUES (640, '2020-02-18 06:29:37.120', 1007, 9000);


WITH cte AS (
SELECT *,ROW_NUMBER() OVER(PARTITION BY AccountNumber ORDER BY TransactionTime DESC ) AS rn FROM Transaction_Table)
SELECT AccountNumber, TransactionTime, TransactionID, Balance from cte WHERE  rn =1

+--------------+-------------------------+--------------+---------+
| AccountNumber| TransactionTime          | TransactionID| Balance |
+--------------+-------------------------+--------------+---------+
| 460          | 2020-04-30 12:32:44     | 1005         | 5000    |
| 550          | 2020-05-15 10:29:26     | 1002         | 8000    |
| 640          | 2020-02-18 06:29:37     | 1007         | 9000    |
+--------------+-------------------------+--------------+---------+
