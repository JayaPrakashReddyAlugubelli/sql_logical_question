CREATE TABLE Performance (
    Name VARCHAR(50),
    Role VARCHAR(10),
    Performance INT
);
INSERT INTO Performance (Name, Role, Performance) VALUES
('Virat', 'Bat', 89),
('Axar', 'Ball', 3),
('Gill', 'Bat', 47),
('Buvi', 'Ball', 1),
('Shami', 'Ball', 5),
('Shardul', 'Ball', 2),
('Sreyas', 'Bat', 54),
('Rohit', 'Bat', 38);


SELECT  batsmen,bowler,bm.dr from
(SELECT NAME AS batsmen,DENSE_RANK() OVER (PARTITION BY ROLE ORDER BY Performance DESC) AS dr FROM Performance WHERE ROLE='Bat')AS bm    
 join
(SELECT NAME AS bowler,DENSE_RANK() OVER (PARTITION BY ROLE ORDER BY Performance DESC) AS dr FROM Performance WHERE ROLE='Ball') AS bw ON bm.dr=bw.dr;


o/p:-
batsmen	bowler	dr
Virat	Axar	1
Sreyas	Shami	2
Gill	Shardul	3
Rohit	Buvi	4