Given us two tables, find out the result from the combination of 2 input tables.

create table tablea (empid int, empname varchar(50), salary int)
create table tablea (empid int, empname varchar(50), salary int)

insert into tablea values(1,'AA',1000),(2,'BB',300)
insert into tableb values(2,'BB',400),(3,'CC',100)


with cte as (
select * from tablea 
union
select * from tableb)

select empid, empname, min (salary) as salary from cte group by empid, empname