Given us sales table, find out the periodic sales.


create table sales(month varchar(50), ytd_sales int, monthnum int);

insert into sales values('jan',15,1),('feb',22,2),('mar',35,3),('apr',45,4),('may',60,5)

SELECT 
    *, 
    ytd_sales - LAG(ytd_sales,1,0) OVER (ORDER BY monthnum) sales_diff
FROM 
    sales
