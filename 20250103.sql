CREATE TABLE account_info (
    account_id INT,
    RPG VARCHAR(10),
    date DATE,
    dayofweek VARCHAR(10)
);

INSERT INTO account_info (account_id, RPG, date, dayofweek)
VALUES
(1, 'GCGV21', '2024-11-01', 'Friday'),
(2, 'GCGV22', '2024-11-04', 'Monday'),
(3, 'GCGV24', '2024-11-05', 'Tuesday'),
(4, 'GCGV21', '2024-11-07', 'Thursday'),
(5, 'GCGV23', '2024-11-11', 'Monday'),
(6, 'GCGV21', '2024-11-14', 'Thursday'),
(7, 'GCGV21', '2024-11-15', 'Friday');

On top of above data I want a sql code which days are missing between Monday to Friday


SELECT a.day_name AS missing_week 
FROM (SELECT 'Monday' AS day_name
      UNION ALL
      SELECT 'Tuesday'
      UNION ALL
      SELECT 'Wednesday'
      UNION ALL
      SELECT 'Thursday'
      UNION ALL
      SELECT 'Friday') a
LEFT join (SELECT DISTINCT dayofweek AS dayofweeks FROM account_info) b 
ON a.day_name = b.dayofweeks WHERE dayofweeks IS null;
