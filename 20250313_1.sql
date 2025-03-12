

-- Create the Inventory table
CREATE TABLE Inventory (
    ProdName VARCHAR(20),
    ProductCode VARCHAR(15),
    Quantity INT,
    InventoryDate DATE
);

-- Insert data into the Inventory table
INSERT INTO Inventory (ProdName, ProductCode, Quantity, InventoryDate) VALUES
('Keyboard', 'K1001', 20, '2020-03-01'),
('Keyboard', 'K1001', 30, '2020-03-02'),
('Keyboard', 'K1001', 10, '2020-03-03'),
('Keyboard', 'K1001', 40, '2020-03-04'),
('Laptop', 'L1002', 100, '2020-03-01'),
('Laptop', 'L1002', 60, '2020-03-02'),
('Laptop', 'L1002', 40, '2020-03-03'),
('Monitor', 'M5005', 30, '2020-03-01'),
('Monitor', 'M5005', 20, '2020-03-02');


SELECT *,SUM(Quantity) OVER(PARTITION BY ProdName ORDER BY InventoryDate) AS rolling_sum FROM Inventory;


ProdName	ProductCode	Quantity	InventoryDate	rolling_sum
Keyboard	K1001	20	2020-03-01	20
Keyboard	K1001	30	2020-03-02	50
Keyboard	K1001	10	2020-03-03	60
Keyboard	K1001	40	2020-03-04	100
Laptop	L1002	100	2020-03-01	100
Laptop	L1002	60	2020-03-02	160
Laptop	L1002	40	2020-03-03	200
Monitor	M5005	30	2020-03-01	30
Monitor	M5005	20	2020-03-02	50