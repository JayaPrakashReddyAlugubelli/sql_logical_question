Given us Emp and Dept table, we need to find the Department wise highest salary emp name.


Let us create Emp table and insert records
create table emp(empid int, empname varchar(50), salary int, deptid int)
insert into emp values (1,'Nikitha',45000,206),(2,'Ashish',42000,207),(3,'David',40000,206),(4,'Ram',50000,207),(5,'John',35000,208),(6,'Mark',50000,207),(7,'Aravind',39000,208)

Let us create Dept table and insert records
create table dept (deptid int, deptname varchar(50))
insert into dept values (206,'HR'),(207,'IT'),(208,'Finance')

with cte as (
select d.deptname,e.empname,e.salary, DENSE_RANK() over(partition by deptname order by salary desc) as dn from emp e 
left join dept d on e.deptid=d.deptid  )
select deptname,STRING_AGG(empname,',') from cte where dn= 1 group by deptname ;