CREATE TABLE t1(a,b,c);
CREATE TABLE t2(x,y,z);
INSERT INTO t1 VALUES(1,2,3);
INSERT INTO t1 VALUES(4,5,6);
INSERT INTO t1 VALUES(7,8,9);
SAVEPOINT x1;
SAVEPOINT x2;
CREATE TABLE IF NOT EXISTS t3(xyz);
INSERT INTO t2 VALUES($a,$b,$c);
RELEASE x2;
SAVEPOINT x2;
INSERT INTO t2 VALUES($a,$b,$c);
RELEASE x2;
SAVEPOINT x2;
INSERT INTO t2 VALUES($a,$b,$c);
RELEASE x2;
SAVEPOINT x2;
INSERT INTO t2 VALUES($a,$b,$c);
ROLLBACK TO x2;
SAVEPOINT x2;
CREATE TABLE t5(pqr);
INSERT INTO t2 VALUES($a,$b,$c);
ROLLBACK TO x2;
PRAGMA page_size=1024;
PRAGMA temp_store=MEMORY;
BEGIN;
CREATE TABLE t1(x INTEGER PRIMARY KEY, y TEXT);
WITH RECURSIVE c(x) AS (VALUES(1) UNION SELECT x+1 FROM c WHERE x<$::i)
INSERT INTO t1(x,y) SELECT x*10, printf('%04d%.800c',x,'*') FROM c;
SAVEPOINT one;
SELECT count(*) FROM t1;
WITH RECURSIVE c(x) AS (VALUES(1) UNION SELECT x+1 FROM c WHERE x<$::i)
INSERT INTO t1(x,y) SELECT x*10+1, printf('%04d%.800c',x,'*') FROM c;
ROLLBACK TO one;
SELECT count(*) FROM t1;
SAVEPOINT twoB;
WITH RECURSIVE c(x) AS (VALUES(1) UNION SELECT x+1 FROM c WHERE x<10)
INSERT INTO t1(x,y) SELECT x*10+2, printf('%04d%.800c',x,'*') FROM c;
ROLLBACK TO twoB;
RELEASE one;
COMMIT;
