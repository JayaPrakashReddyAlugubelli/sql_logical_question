Given us cinemas_tbl, we need to display available seats which are in squence.

create table cinema_tbl (seat_id int, free int)

insert into cinema_tbl values (1,1),(2,0),(3,1),(4,0),(5,1),(6,1),(7,1),(8,0),(9,1),(10,1)




select distinct a.seat_id from cinema_tbl a join cinema_tbl b on abs(a.seat_id - b.seat_id)=1 and a.free=1 and b.free=1


with CTE as (
select * , free * lag(free,1,0) over(order by seat_id) as lags, 
free * lead(free,1,0) over(order by seat_id) as leads from cinema_tbl)
select seat_id from CTE where lags=1 or leads=1;


WITH
    T AS (
        SELECT
            seat_id,
            (free + (LAG(free) OVER (ORDER BY seat_id))) AS a,
            (free + (LEAD(free) OVER (ORDER BY seat_id))) AS b
        FROM cinema_tbl
    )
SELECT seat_id
FROM T
WHERE a = 2 OR b = 2;