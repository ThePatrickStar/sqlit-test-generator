CREATE TABLE t1(x,y);
INSERT INTO t1 VALUES('abc123', 5);
INSERT INTO t1 VALUES('xyz987', 42);
SELECT * FROM t1 WHERE x GLOB 'abc*';
CREATE TABLE t1(x PRIMARY KEY,y UNIQUE);
INSERT INTO t1 VALUES('abc123', 5);
INSERT INTO t1 VALUES('xyz987', 42);
SELECT x FROM t1
WHERE y=1 OR y=2 OR y=3 OR y=4 OR y=5
OR y=6 OR y=7 OR y=8 OR y=9 OR y=10
OR y=11 OR y=12 OR y=13 OR y=14 OR y=15
OR y=x;
CREATE TABLE t1(x PRIMARY KEY,y UNIQUE);
INSERT INTO t1 VALUES('abc123', 5);
INSERT INTO t1 VALUES('xyz987', 42);
SELECT x FROM t1 WHERE y BETWEEN 10 AND 29;
CREATE TABLE t1(x);
CREATE TRIGGER r1 BEFORE INSERT ON t1 BEGIN
SELECT 'hello';
END;
INSERT INTO t1 VALUES(random());