---SQL Sub queries Seat Exchange


-- Create the table
CREATE TABLE students (
    id INT PRIMARY KEY,
    student VARCHAR(50)
);

-- Insert the records
INSERT INTO students (id, student) VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');



SELECT 
       CASE 
           WHEN MOD(id, 2) = 1 AND id <> (SELECT MAX(id) FROM students) THEN id + 1
           WHEN MOD(id, 2) = 0 THEN id - 1
           WHEN MOD(id, 2) = 1 AND id = (SELECT MAX(id) FROM students) THEN id
       END AS swap,student
FROM students ORDER by swap;


---- o/p
id   | student

1    | Dorris
2    | Abbot 
3    | Green 
4    | Emerson
5    | Jeames