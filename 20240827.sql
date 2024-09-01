Given us Student table, find out the total marks of top 2 subjects based on marks.

create table students(sname varchar(50), sid varchar(50), marks int)

Insert the records
insert into students values('A','X',75),('A','Y',75),('A','Z',80),('B','X',90),('B','Y',91),('B','Z',75)

with CTE as (select  * ,ROW_NUMBER() over(partition by sname order  by marks DESC) AS RN from students)
select sname,SUM(marks) from CTE WHERE RN < 3 GROUP BY sname ;