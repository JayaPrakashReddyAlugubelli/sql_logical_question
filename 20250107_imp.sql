Given us input table with details id timestamp and empid, we need to Find Total Weekend working hours for each employee.

In order to solve this question, we used functions like DATEPART(), DATEDIFF(). You will understand how all these functions works in this video.

Let us first create table
CREATE TABLE emp_tbl (id datetime, empid int)

Insert the records
INSERT INTO emp_tbl VALUES ('2024-01-13 09:25:00', 10),('2024-01-13 19:35:00', 10),('2024-01-16 09:10:00', 10),
('2024-01-16 18:10:00', 10),('2024-02-11 09:07:00', 10),('2024-02-11 19:20:00', 10),('2024-02-17 08:40:00', 17),
('2024-02-17 18:04:00', 17),('2024-03-23 09:20:00', 10),('2024-03-23 18:30:00', 10)


with CTE as (
select empid,max(id) as max,min(id) as min from emp_tbl where DATEPART(DW,id) in (1,7) group by DAY(id),empid)
select empid,sum(DATEDIFF(MINUTE,min,max))/60.0 as hours_week from  CTE group by empid ;