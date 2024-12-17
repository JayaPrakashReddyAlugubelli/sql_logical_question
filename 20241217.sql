CREATE TABLE Relationships (
    child VARCHAR(10),
    parent VARCHAR(10)
);

INSERT INTO Relationships (child, parent) VALUES ('A', 'AA');
INSERT INTO Relationships (child, parent) VALUES ('B', 'BB');
INSERT INTO Relationships (child, parent) VALUES ('C', 'CC');
INSERT INTO Relationships (child, parent) VALUES ('AA', 'AAA');
INSERT INTO Relationships (child, parent) VALUES ('BB', 'BBB');
INSERT INTO Relationships (child, parent) VALUES ('CC', 'CCC');


select r1.child,r1.parent,r2.parent as grandparent from  Relationships r1 inner join Relationships r2 on r1.parent=r2.child;

child	parent	grandparent
A	     AA			AAA
B		 BB			BBB
C		 CC			CCC