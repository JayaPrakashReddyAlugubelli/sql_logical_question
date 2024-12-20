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
