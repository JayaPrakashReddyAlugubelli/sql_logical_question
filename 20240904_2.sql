
Given us input table, we need to find the largest value among all the columns.


Let us first create input table
create table tbl_maxval (col1 varchar(50), col2 int, col3 int)

Insert the records
insert into tbl_maxval values ('a',10,20),('b',50,30)


SELECT *, 
  CASE 
    WHEN col2 > col3 THEN col2 
    ELSE col3 
  END AS max 
FROM tbl_maxval;

if have 4 col

SELECT *, 
  CASE 
    WHEN col1 >= col2 AND col1 >= col3 AND col1 >= col4 THEN col1
    WHEN col2 >= col1 AND col2 >= col3 AND col2 >= col4 THEN col2
    WHEN col3 >= col1 AND col3 >= col2 AND col3 >= col4 THEN col3
    ELSE col4 
  END AS max 
FROM tbl_maxval;
