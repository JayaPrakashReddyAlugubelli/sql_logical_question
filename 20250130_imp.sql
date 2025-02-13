CREATE TABLE Lifts (
    LIFT_ID INT PRIMARY KEY,
    CAPACITY_KG INT
);

CREATE TABLE Passengers (
    PASSENGER_NAME VARCHAR(50),
    WEIGHT_KG INT,
    LIFT_ID INT,
    FOREIGN KEY (LIFT_ID) REFERENCES Lifts(LIFT_ID)
);

INSERT INTO Lifts (LIFT_ID, CAPACITY_KG) VALUES
(1, 300),
(2, 350);

INSERT INTO Passengers (PASSENGER_NAME, WEIGHT_KG, LIFT_ID) VALUES
('Rahul', 85, 1),
('Adarsh', 73, 1),
('Riti', 95, 1),
('Dheeraj', 80, 1),
('Vimal', 83, 2),
('Neha', 77, 2),
('Priti', 73, 2),
('Himanshi', 85, 2);



SELECT LIFT_ID, GROUP_CONCAT(PASSENGER_NAME) FROM 
(SELECT p.PASSENGER_NAME,p.LIFT_ID,l.CAPACITY_KG, SUM(p.WEIGHT_KG) OVER (PARTITION BY p.LIFT_ID ORDER BY p.WEIGHT_KG  ) AS cum_sum FROM Passengers p JOIN Lifts l ON 
p.LIFT_ID =l. LIFT_ID) AS k WHERE CAPACITY_KG > cum_sum  GROUP BY  LIFT_ID;


+---------+--------------------------+
| LIFT_ID | PASSENGERS_IN_LIFT       |
+---------+--------------------------+
| 1       | Rahul,Adarsh             |
| 2       | Vimal,Neha,Priti         |
+---------+--------------------------+
