
Given us EmpDept table, we need to update scores column values with department wise maximum score.

create table empdept_tbl (eid int, dept varchar(50),scores float)
insert into empdept_tbl values (1, 'd1', 1.0),(2, 'd1', 5.28),(3, 'd1', 4.0),(4,'d2', 8.0),(5, 'd1', 2.5),(6, 'd2', 7.0),(7, 'd3', 9.0),(8, 'd4', 10.2)


WITH cte AS (
  SELECT 
    eid, 
    dept,
    scores,
    FIRST_VALUE(scores) OVER (PARTITION BY dept ORDER BY scores DESC) AS max_score
  FROM empdept_tbl
)
UPDATE empdept_tbl
SET scores = cte.max_score
FROM cte
WHERE empdept_tbl.dept = cte.dept
  AND empdept_tbl.eid = cte.eid; 
