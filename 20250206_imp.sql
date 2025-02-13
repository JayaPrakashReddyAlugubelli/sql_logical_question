
#write a sql query to find actual working days between issue_date and resolve_date


create table ticket(ticket_id int,issue_date date,resolve_date date)

insert into ticket values(1,'2024-12-18','2025-01-7')
insert into ticket values(2,'2024-12-20','2025-01-10')
insert into ticket values(3,'2024-12-22','2025-01-11')
insert into ticket values(4,'2025-01-02','2025-01-13')

create table holiday_cal(holiday_date date,occasion varchar(15))
insert into holiday_cal values('2024-12-25','christmas')
insert into holiday_cal values('2025-01-01','new_year')



WITH ticket_cte AS (
    SELECT 
        ticket_id, 
        issue_date, 
        resolve_date, 
        FLOOR(DATEDIFF(resolve_date, issue_date) - (DATEDIFF(resolve_date, issue_date) / 7) * 2) AS actual_days
    FROM ticket
)
SELECT 
    tc.ticket_id, 
    tc.issue_date, 
    tc.resolve_date, 
    (tc.actual_days - COUNT(hc.occasion)) AS holiday_count
FROM ticket_cte tc
LEFT JOIN holiday_cal hc
    ON hc.holiday_date BETWEEN tc.issue_date AND tc.resolve_date
GROUP BY tc.ticket_id, tc.issue_date, tc.resolve_date, tc.actual_days;


o/p:-

+-----------+------------+------------+--------------+
| ticket_id | issue_date | resolve_date| holiday_count|
+-----------+------------+------------+--------------+
|     1     | 2024-12-18 | 2025-01-07 |      12      |
|     2     | 2024-12-20 | 2025-01-10 |      13      |
|     3     | 2024-12-22 | 2025-01-11 |      12      |
|     4     | 2025-01-02 | 2025-01-13 |      7       |
+-----------+------------+------------+--------------+
