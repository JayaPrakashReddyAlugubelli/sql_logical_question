Given us input table, we need to find the length of each record in the table.

Let us first create input table
create table tbl_cnt (col1 int, col2 varchar(50))

Insert the records
insert into tbl_cnt values (1, 'a,b,c'),(2, 'a,b')

select *,len(REPLACE(col2,',' ,'')) from tbl_cnt;