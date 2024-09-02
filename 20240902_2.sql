Given us happiness_tbl, we need to display a few specific Rows always at top of the query results.

create table happiness_tbl (ranking int, country varchar(50))


insert into happiness_tbl values (1,'Finland'),(2,'Denmark'),(3,'Iceland'),
(4,'Israel'),(5,'Netherlands'),(6,'Sweden'),(7,'Norway'),(8,'Switzerland'),
(9,'Luxembourg'),(128,'Srilanka'),(126,'India')

select  * , case when country='India' then 1 when country='Srilanka'  then 2 else 3  
end as ranks from happiness_tbl order by ranks;