
Given us Students table, we need to create Grades column to the main table.

create table studnts_tbl (sname varchar(50), marks int)

insert into studnts_tbl values ('A', 75),('B', 30),('C', 55),('A', 60),('D', 91),
('B', 19),('G', 36),('S', 65),('K', 49)

select * ,case when marks >= 80 then 'ex'
          when marks >= 60 and marks < 80  then 'vg'
		  when marks >= 35 and marks < 60  then 'av'
		 else 'po' end as grad from studnts_tbl;