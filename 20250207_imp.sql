write a sql query to find out call duration (in minute) for every calls

DROP TABLE call_start;
DROP TABLE call_end;

-- Create the call_start table
CREATE TABLE call_start (
    ph_no VARCHAR(10),
    start_time DATETIME
);

-- Insert values into the call_start table
INSERT INTO call_start (ph_no, start_time) VALUES
('contact_1', '2024-05-01 10:20:00'),
('contact_1', '2024-05-01 16:25:00'),
('contact_2', '2024-05-01 12:30:00'),
('contact_3', '2024-05-02 10:00:00'),
('contact_3', '2024-05-02 12:30:00'),
('contact_3', '2024-05-03 09:20:00');

-- Create the call_end table
CREATE TABLE call_end (
    ph_no VARCHAR(10),
    end_time DATETIME
);

-- Insert values into the call_end table
INSERT INTO call_end (ph_no, end_time) VALUES
('contact_1', '2024-05-01 10:45:00'),
('contact_1', '2024-05-01 17:05:00'),
('contact_2', '2024-05-01 12:55:00'),
('contact_3', '2024-05-02 10:20:00'),
('contact_3', '2024-05-02 12:50:00'),
('contact_3', '2024-05-03 09:40:00');



WITH cte_1 AS (
SELECT * ,DENSE_RANK() OVER(PARTITION BY ph_no ORDER BY start_time) AS dn FROM call_start),
cte_2 AS (SELECT * ,DENSE_RANK() OVER(PARTITION BY ph_no ORDER BY end_time) AS dn FROM call_end)
SELECT c1.ph_no,c1.start_time,c2.end_time,TIMESTAMPDIFF(MINUTE, c1.start_time, c2.end_time) AS time_diff_minutes FROM cte_1 c1 join cte_2 c2 ON c1.ph_no=c2.ph_no AND c1.dn=c2.dn ;

o/p:-

+------------+---------------------+---------------------+-------------------+
| ph_no      | start_time          | end_time            | time_diff_minutes |
+------------+---------------------+---------------------+-------------------+
| contact_1  | 2024-05-01 10:20:00 | 2024-05-01 10:45:00 | 25                |
| contact_1  | 2024-05-01 16:25:00 | 2024-05-01 17:05:00 | 40                |
| contact_2  | 2024-05-01 12:30:00 | 2024-05-01 12:55:00 | 25                |
| contact_3  | 2024-05-02 10:00:00 | 2024-05-02 10:20:00 | 20                |
| contact_3  | 2024-05-02 12:30:00 | 2024-05-02 12:50:00 | 20                |
| contact_3  | 2024-05-03 09:20:00 | 2024-05-03 09:40:00 | 20                |
+------------+---------------------+---------------------+-------------------+
