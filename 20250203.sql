write a sql query to find emp who is inside the office

drop table office;

CREATE TABLE office (
    emp_id INT,
    emp_status VARCHAR(10),
    time_id DATETIME
);

INSERT INTO office (emp_id, emp_status, time_id) VALUES 
(1, 'in', '2023-12-22 09:00:00'),
(1, 'out', '2023-12-22 09:15:00'),
(2, 'in', '2023-12-22 09:00:00'),
(2, 'out', '2023-12-22 09:15:00'),
(2, 'in', '2023-12-22 09:30:00'),
(3, 'out', '2023-12-22 09:00:00'),
(3, 'in', '2023-12-22 09:15:00'),
(3, 'out', '2023-12-22 09:30:00'),
(3, 'in', '2023-12-22 09:45:00'),
(4, 'in', '2023-12-22 09:45:00'),
(5, 'out', '2023-12-22 09:40:00');


with cte AS (SELECT emp_id, 
       max(CASE 
           WHEN emp_status = 'in' THEN time_id 
           ELSE '0' 
       END) AS in_,
       max(CASE 
           WHEN emp_status = 'out' THEN time_id 
           ELSE '0' 
       END) AS out_
FROM office GROUP BY emp_id) 
SELECT emp_id FROM cte WHERE out_=0;


+--------+
| emp_id |
+--------+
|      4 |
+--------+
