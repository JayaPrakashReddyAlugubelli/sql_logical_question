Given us sales table, We need to Find the percentage variance of sales from previous day.


create table salesvar_tbl (dt date, sales int)

insert into salesvar_tbl values ('2023-10-03', 10),('2023-10-04', 20),
('2023-10-05', 60),('2023-10-06', 50),('2023-10-07', 10)

with cte as (select * ,lag(sales,1,sales) over(order by dt) as lg  from salesvar_tbl),
cte2 as (select * ,(sales-lg)*100/lg as profit from cte)
select * from cte2 where profit >=0 ;