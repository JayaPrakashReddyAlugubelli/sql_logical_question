CREATE TABLE stock_predictions (
    stockid VARCHAR(10),
    prediction_1 INT,
    prediction_2 INT,
    prediction_3 INT,
    prediction_4 INT,
    prediction_5 INT,
    prediction_6 INT,
    prediction_7 INT
);
 
 INSERT INTO stock_predictions (stockid, prediction_1, prediction_2, prediction_3, prediction_4, prediction_5, prediction_6, prediction_7)
VALUES ('RIL', 1000, 1005, 1090, 1200, 1000, 900, 890);

INSERT INTO stock_predictions (stockid, prediction_1, prediction_2, prediction_3, prediction_4, prediction_5, prediction_6, prediction_7)
VALUES ('HDFC', 890, 940, 810, 730, 735, 960, 980);

INSERT INTO stock_predictions (stockid, prediction_1, prediction_2, prediction_3, prediction_4, prediction_5, prediction_6, prediction_7)
VALUES ('INFY', 1001, 902, 1000, 990, 1230, 1100, 1200);


/*find out max value and min value and difeerent between max ,min */

WITH test AS (
SELECT *,GREATEST(prediction_1,prediction_2,prediction_3,prediction_4,prediction_5,prediction_6,prediction_7 ) AS maxv ,
 LEAST(prediction_1,prediction_2,prediction_3,prediction_4,prediction_5,prediction_6,prediction_7 ) AS minv 
 from stock_predictions)
 SELECT stockid,maxv,minv ,(maxv-minv) as profit  FROM test ;