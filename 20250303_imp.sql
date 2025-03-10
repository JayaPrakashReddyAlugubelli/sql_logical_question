--Q. Write an SQL query to swap the seat IDs of every two consecutive students.
--If the last student has an odd ID, it remains unchanged.

-- Create the seat table
CREATE TABLE seat (
    id INT,
    name VARCHAR(10)
);

-- Insert data into seat table
INSERT INTO seat (id, name) VALUES (1, 'John');
INSERT INTO seat (id, name) VALUES (2, 'Tom');
INSERT INTO seat (id, name) VALUES (3, 'Yash');
INSERT INTO seat (id, name) VALUES (4, 'Bhavna');
INSERT INTO seat (id, name) VALUES (5, 'Aryan');
INSERT INTO seat (id, name) VALUES (6, 'Kiran');
INSERT INTO seat (id, name) VALUES (7, 'Prativa');
INSERT INTO seat (id, name) VALUES (8, 'Ash');
INSERT INTO seat (id, name) VALUES (9, 'Jay');


SELECT name ,case when mod(id,2)!=0 and id=(SELECT MAX(id) FROM seat) then id
 when mod(id,2)=0 then id-1 
 when mod(id,2)!=0 AND id<>(SELECT MAX(id) FROM seat) then id+1 
 END AS  new_id FROM seat ORDER BY new_id ;
 
o/p:-
+-------+------+
|name   |new_id|
+-------+------+
|Tom    |1     |
|John   |2     |
|Bhavna |3     |
|Yash   |4     |
|Kiran  |5     |
|Aryan  |6     |
|Ash    |7     |
|Prativa|8     |
|Jay    |9     |
+-------+------+
