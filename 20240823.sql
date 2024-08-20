CREATE TABLE CustomerDevices (
    customer_id INT,
    device_using1 VARCHAR(10),
    device_using2 VARCHAR(10),
    device_using3 VARCHAR(10)
);

INSERT INTO CustomerDevices (customer_id, device_using1, device_using2, device_using3) 
VALUES 
(1, 'yes', NULL, NULL),
(2, NULL, 'yes', NULL),
(3, 'No', NULL, 'yes');

SELECT 
    customer_id, 
    device_using1, 
    device_using2, 
    device_using3,
    COALESCE(device_using1, device_using2, device_using3) AS result
FROM 
    CustomerDevices;
