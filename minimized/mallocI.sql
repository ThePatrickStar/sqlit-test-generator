CREATE TABLE t1(a,b,c,d);
CREATE VIEW v1 AS SELECT a*b, c*d FROM t1 ORDER BY b-d;
SELECT * FROM v1;
PRAGMA temp.page_size;
CREATE TABLE t1(a,b,c);
CREATE TABLE t2 AS SELECT b,c FROM t1;
CREATE TABLE t1(a, b, c);
CREATE TABLE t2(a, b, c);
SELECT * FROM t1;
