CREATE TABLE MachineActivity (
    MachineId INT,
    ProcessingID INT,
    ActivityType VARCHAR(50),
    Timestamp FLOAT
);


INSERT INTO MachineActivity (MachineId, ProcessingID, ActivityType, Timestamp) 
VALUES (0, 0, 'Start', 0.712),
       (0, 0, 'End', 1.520),
       (0, 1, 'Start', 3.140),
       (0, 1, 'End', 4.120),
       (1, 0, 'Start', 0.550),
       (1, 0, 'End', 1.550),
       (1, 1, 'Start', 0.430),
       (1, 1, 'End', 1.420),
       (2, 0, 'Start', 4.100),
       (2, 0, 'End', 4.512),
       (2, 1, 'Start', 2.500),
       (2, 1, 'End', 5.000);



WITH CTE AS (
    SELECT
        MachineId,
        ProcessingID,
        MAX(CASE WHEN activityType = 'Start' THEN timestamp ELSE NULL END) AS starttime,
        MAX(CASE WHEN activityType = 'End' THEN timestamp ELSE NULL END) AS endtime
    FROM 
        MachineActivity
    GROUP BY 
        MachineId, ProcessingID
)
SELECT
    MachineId,
    AVG(endtime - starttime) AS avg_processingtime
FROM 
    CTE
GROUP BY 
    MachineId;

--------------------------------------------------------------------
----SQL Interview Questions and answers Part 6 | Amazon SQL Interview Question And Answer Part-4

CREATE TABLE `Order_Tbl` (
    `ORDER_DAY` DATE,
    `ORDER_ID` VARCHAR(10),
    `PRODUCT_ID` VARCHAR(10),
    `QUANTITY` INT,
    `PRICE` INT
);

INSERT INTO `Order_Tbl` VALUES ('2015-05-01', 'ODR1', 'PROD1', 5, 5);
INSERT INTO `Order_Tbl` VALUES ('2015-05-01', 'ODR2', 'PROD2', 2, 10);
INSERT INTO `Order_Tbl` VALUES ('2015-05-01', 'ODR3', 'PROD3', 10, 25);
INSERT INTO `Order_Tbl` VALUES ('2015-05-01', 'ODR4', 'PROD1', 20, 5);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR5', 'PROD3', 5, 25);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR6', 'PROD4', 6, 20);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR7', 'PROD1', 2, 5);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR8', 'PROD5', 1, 50);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR9', 'PROD6', 2, 50);
INSERT INTO `Order_Tbl` VALUES ('2015-05-02', 'ODR10', 'PROD2', 4, 10);

WITH cte AS (
SELECT ORDER_DAY,PRODUCT_ID,SUM( (QUANTITY * PRICE) )total from Order_Tbl GROUP BY ORDER_DAY,PRODUCT_Id)
SELECT PRODUCT_ID, 
max(case when ORDER_DAY='2015-05-01' then total ELSE 0 END) AS t_1 ,
max(case when ORDER_DAY='2015-05-02' then total ELSE 0 END) AS t_2  from cte GROUP BY PRODUCT_ID;
