CREATE TABLE EmployeeSkills (
    EmpId INT,
    EmpName VARCHAR(255),
    Skill VARCHAR(255)
);

INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (1, 'John', 'ADF');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (1, 'John', 'ADB');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (1, 'John', 'PowerBI');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (2, 'Joanne', 'ADF');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (2, 'Joanne', 'SQL');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (2, 'Joanne', 'Crystal Report');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (3, 'Vikas', 'ADF');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (3, 'Vikas', 'SQL');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (3, 'Vikas', 'SSIS');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (4, 'Monu', 'SQL');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (4, 'Monu', 'SSIS');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (4, 'Monu', 'SSAS');
INSERT INTO EmployeeSkills (EmpId, EmpName, Skill) VALUES (4, 'Monu', 'ADF');

/*
output:
+-------+--------------------------+
|EmpName|                     Skill|
+-------+--------------------------+
|   John|       [ADF, ADB, PowerBI]|
| Joanne|[ADF, SQL, Crystal Report]|
|  Vikas|          [ADF, SQL, SSIS]|
|   Monu|    [SQL, SSIS, SSAS, ADF]|
+-------+--------------------------+
*/

---solution 

SELECT 
    EmpName, 
    STRING_AGG(Skill, ', ') AS Skills
FROM 
    EmployeeSkills
GROUP BY 
    EmpName;
