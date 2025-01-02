Given us Employees table, find out the max ID from Employees excluding duplicates.

create table employees (id int)


insert into employees values (2),(5),(6),(6),(7),(8),(8)

select max(id) from (select *,count(*)  as counts from employees group by id) as k where  counts = 1;