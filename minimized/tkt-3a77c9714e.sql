CREATE TABLE t1(t1_id INTEGER PRIMARY KEY, t1_title TEXT);
CREATE TABLE t2(t2_id INTEGER PRIMARY KEY, t2_title TEXT);
CREATE TABLE t3(t3_id INTEGER PRIMARY KEY, t3_title TEXT);
INSERT INTO t1 (t1_id, t1_title) VALUES (888, 'ABCDEF');
INSERT INTO t2 (t2_id, t2_title) VALUES (999, 'ABCDEF');
INSERT INTO t3 (t3_id, t3_title) VALUES (999, 'ABCDEF');
SELECT t1_title, t2_title
FROM t1 LEFT JOIN t2
WHERE;
CREATE TABLE [Beginnings] (;
CREATE TABLE [Endings] (Id INT,Title TEXT,EndingId INT);
INSERT INTO Beginnings (Id, Title, EndingId) VALUES (1, 'FACTOR', 18);
INSERT INTO Beginnings (Id, Title, EndingId) VALUES (2, 'SWIMM', 18);
INSERT INTO Endings (Id, Title, EndingId) VALUES (1, 'ING', 18);
SELECT
SrcWord, Beginnings.Title
FROM;
LEFT JOIN
Beginnings
WHERE Beginnings.Id= (
SELECT BeginningId FROM (
SELECT SrcWord, B.Id as BeginningId, B.Title || E.Title As Connected
FROM Beginnings B LEFT JOIN Endings E ON B.EndingId=E.EndingId
WHERE Connected=SrcWord LIMIT 1;
