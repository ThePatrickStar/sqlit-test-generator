PRAGMA automatic_index = 0;
CREATE TABLE t1(a, b, c);
CREATE TABLE t2(d, e, f);
CREATE UNIQUE INDEX i1 ON t1(a);
CREATE UNIQUE INDEX i2 ON t2(d);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a, b, c);
CREATE TABLE t2(d, e, f);
CREATE UNIQUE INDEX i1 ON t1(a);
CREATE UNIQUE INDEX i2 ON t1(b);
CREATE UNIQUE INDEX i3 ON t2(d);
DROP TABLE t1;
DROP TABLE t2;
CREATE TABLE t1(a, b, c);
CREATE TABLE t2(d, e, f);
CREATE UNIQUE INDEX i1 ON t1(a, b);
CREATE INDEX i2 ON t2(d);
WHERE t2.d=t1.b AND t1.a=(t2.d+1) AND t1.b = (t2.e+1)}
WHERE t2.d=t1.b AND t1.a=(t2.d+1) AND t1.b = (t2.e+1)}
WHERE t2.d=t1.b AND t1.a=(t2.d+1) AND t1.b = (t2.e+1)};
CREATE TABLE t4(a,b,c,d,e, PRIMARY KEY(a,b,c));
CREATE INDEX t4adc ON t4(a,d,c);
CREATE UNIQUE INDEX t4aebc ON t4(a,e,b,c);
EXPLAIN QUERY PLAN SELECT rowid FROM t4 WHERE a=? AND b=?;
CREATE TABLE t1(f1);
CREATE TABLE t2(f2);
CREATE INDEX t2f ON t2(f2);
INSERT INTO t1 VALUES(-1);
INSERT INTO t1 VALUES(-1);
INSERT INTO t1 VALUES(-1);
INSERT INTO t1 VALUES(-1);
WITH w(i) AS (
SELECT 1 UNION ALL SELECT i+1 FROM w WHERE i<1000;
INSERT INTO t2 SELECT -1 FROM w;
SELECT count(*) FROM t1, t2 WHERE t2.rowid = +t1.rowid;
SELECT count(*) FROM t1, t2 WHERE (;
SELECT count(*) FROM t1, t2 WHERE (;
CREATE TABLE t6(x);
SELECT * FROM t6 WHERE 1 IN (SELECT value FROM json_each(x));
DROP TABLE t6;
CREATE TABLE t6(a,b,c);
INSERT INTO t6 VALUES;
SELECT * FROM t6
WHERE (EXISTS (SELECT 1 FROM json_each(t6.c) AS x WHERE x.value=1));
DROP TABLE IF EXISTS t;
CREATE TABLE t(json JSON);
SELECT * FROM t
WHERE(EXISTS(SELECT 1 FROM json_each(t.json,"$.foo") j
WHERE j.value = 'meep'));
INSERT INTO t VALUES('{"xyzzy":null}');
INSERT INTO t VALUES('{"foo":"meep","other":12345}');
INSERT INTO t VALUES('{"foo":"bingo","alt":5.25}');
SELECT * FROM t
WHERE(EXISTS(SELECT 1 FROM json_each(t.json,"$.foo") j
WHERE j.value = 'meep'));
