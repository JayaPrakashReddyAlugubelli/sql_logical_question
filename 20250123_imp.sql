PwC SQL Interview Question - STRING_SPLIT(), CROSS APPLY & CROSS JOIN

-- Create table with one column
CREATE TABLE testtbl (
    cola VARCHAR(10)
);

-- Insert data into the table
INSERT INTO testtbl (cola)
VALUES 
    ('1'),
	('2'), 
    ('3'), 
    ('4');


SELECT a.cola AS cola ,b.cola AS  colb FROM testtbl a CROSS JOIN  testtbl b WHERE a.cola > b.cola ORDER BY a.cola  ;