CREATE TABLE cards (
    card_number BIGINT
);

INSERT INTO cards VALUES 
    (1234567812345678),
    (2345678923456789),
    (3456789034567890);

--mysql
SELECT 
    CONCAT(REPEAT('*', LENGTH(card_number) - 4), RIGHT(card_number, 4)) AS masked_card_number
FROM 
    cards;


---SQL SERVER
SELECT 
    CONCAT(REPLICATE('*', LEN(CAST(card_number AS VARCHAR)) - 4), RIGHT(CAST(card_number AS VARCHAR), 4)) AS masked_card_number
FROM 
    cards;