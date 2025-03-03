-- Create the source table
CREATE TABLE source (
    id INT,
    name VARCHAR(5)
);

-- Insert data into source table
INSERT INTO source VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D');

-- Create the target table
CREATE TABLE target (
    id INT,
    name VARCHAR(5)
);

-- Insert data into target table
INSERT INTO target VALUES
(1, 'A'),
(2, 'B'),
(4, 'X'),
(5, 'F');


select * from (

SELECT a.id AS aid , b.id AS bid,a.name AS aname,b.name AS bname, coalesce(a.id , b.id) id , 

case when a.name = b.name then 'Matched' 

when a.name <> b.name  then 'Mismatched' 

when b.name is null then 'New in Source' 

when a.name is null then 'New in target'

end as output

from source a left join target as b on a.id = b.id

UNION 

SELECT a.id AS aid , b.id AS bid,a.name AS aname,b.name AS bname, coalesce(a.id , b.id) id , 

case when a.name = b.name then 'Matched' 

when a.name <> b.name  then 'Mismatched' 

when b.name is null then 'New in Source' 

when a.name is null then 'New in target'

end as output

from source a right join target as b on a.id = b.id ) as a where output <> 'Matched';

o/p:-
+-----+-----+-------+-------+----+-----------------+
| aid | bid | aname | bname | id | output          |
+-----+-----+-------+-------+----+-----------------+
|  1  |  1  |   A   |   A   |  1 | Matched         |
|  2  |  2  |   B   |   B   |  2 | Matched         |
|  3  | NULL|   C   | NULL  |  3 | New in Source   |
|  4  |  4  |   D   |   X   |  4 | Mismatched      |
| NULL|  5  | NULL  |   F   |  5 | New in Target   |
+-----+-----+-------+-------+----+-----------------+



+-----+-----+-------+-------+----+-----------------+
| aid | bid | aname | bname | id | output          |
+-----+-----+-------+-------+----+-----------------+
|  3  | \N  |   C   | \N    |  3 | New in Source   |
|  4  |  4  |   D   |   X   |  4 | Mismatched      |
| \N  |  5  | \N    |   F   |  5 | New in Target   |
+-----+-----+-------+-------+----+-----------------+
