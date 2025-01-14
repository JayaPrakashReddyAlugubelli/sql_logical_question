 Find aggregated cost of product
 
 -- Create the product table and insert records in a single block
CREATE TABLE prd_tbl (
    dt DATE, 
    brand VARCHAR(50), 
    model VARCHAR(50), 
    production_cost INT
);

INSERT INTO prd_tbl (dt, brand, model, production_cost) 
VALUES 
    ('2023-12-01', 'A', 'A1', 1000),
    ('2023-12-01', 'A', 'A2', 1300),
    ('2023-12-01', 'B', 'B1', 800),
    ('2023-12-02', 'A', 'A1', 1800),
    ('2023-12-02', 'B', 'B1', 900),
    ('2023-12-10', 'A', 'A1', 1400),
    ('2023-12-10', 'A', 'A1', 1200),
    ('2023-12-10', 'C', 'C1', 2500);


SELECT * , SUM(production_cost) OVER (partition BY dt,brand ) AS agg_cost from prd_tbl;