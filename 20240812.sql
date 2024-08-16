CREATE TABLE StudentMarks (
    RollNo INT PRIMARY KEY,
    name VARCHAR(100),
    tamil INT,
    eng INT,
    math INT,
    sci INT,
    social INT
);

INSERT INTO StudentMarks (RollNo, name, tamil, eng, math, sci, social) VALUES
(203040, 'Rajesh', 10, 20, 30, 40, 50);

/*
# findout total marks for each student add new col as Total_Sum
+------+------+-----+---+----+---+------+---------+
|RollNo|  name|tamil|eng|math|sci|social|Total_Sum|
+------+------+-----+---+----+---+------+---------+
|203040|Rajesh|   10| 20|  30| 40|    50|      150|
+------+------+-----+---+----+---+------+---------+
*/

---my solution

SELECT * ,tamil+eng+math+sci+social AS total_sum FROM StudentMarks;