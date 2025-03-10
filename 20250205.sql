Problem Statement:- Transatcion_tbl Table has four columns CustID, TranID, TranAmt, and  TranDate. User has to display all these fields along with maximum TranAmt for each CustID and ratio of TranAmt and maximum TranAmt for each transaction.


CREATE TABLE Transaction_Tbl (
  CustID INT,
  TranID INT,
  TranAmt FLOAT,
  TranDate DATE
);

INSERT INTO Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20001, 10000, '2020-04-25');
INSERT INTO Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20002, 15000, '2020-04-25');
INSERT INTO Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20003, 80000, '2020-04-25');
INSERT INTO Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20004, 20000, '2020-04-25');
INSERT INTO Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30001, 7000, '2020-04-25');
INSERT INTO Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30002, 15000, '2020-04-25');
INSERT INTO Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30003, 22000, '2020-04-25');

o/p:-

SELECT CustID, TranID, TranAmt ,MAX(TranAmt) OVER(PARTITION BY CustID) AS MaxTranAmt,ROUND( (TranAmt/MAX(TranAmt) OVER(PARTITION BY CustID)),3) AS ratio,TranDate FROM Transaction_Tbl
+--------+--------+---------+-----------+-------+------------+
| CustID | TranID | TranAmt | MaxTranAmt | ratio | TranDate   |
+--------+--------+---------+-----------+-------+------------+
| 1001   | 20001  | 10000   | 80000     | 0.125 | 2020-04-25 |
| 1001   | 20002  | 15000   | 80000     | 0.188 | 2020-04-25 |
| 1001   | 20003  | 80000   | 80000     | 1     | 2020-04-25 |
| 1001   | 20004  | 20000   | 80000     | 0.25  | 2020-04-25 |
| 1002   | 30001  | 7000    | 22000     | 0.318 | 2020-04-25 |
| 1002   | 30002  | 15000   | 22000     | 0.682 | 2020-04-25 |
| 1002   | 30003  | 22000   | 22000     | 1     | 2020-04-25 |
+--------+--------+---------+-----------+-------+------------+
