CREATE TABLE t1(x int, y int);
BEGIN;
COMMIT;
CREATE VIEW v1 AS SELECT * FROM t1 LIMIT 2;
SELECT count(*) FROM (SELECT * FROM v1);
CREATE TABLE t2 AS SELECT * FROM t1 LIMIT 2;
SELECT count(*) FROM t2;
SELECT count(*) FROM t1 WHERE rowid IN (SELECT rowid FROM t1 LIMIT 2);
SELECT z FROM (SELECT y*10+x AS z FROM t1 ORDER BY x LIMIT 10)
ORDER BY z LIMIT 5;
BEGIN;
CREATE TABLE t3(x);
INSERT INTO t3 SELECT x FROM t1 ORDER BY x LIMIT 10 OFFSET 1;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
INSERT INTO t3 SELECT x+(SELECT max(x) FROM t3) FROM t3;
END;
SELECT count(*) FROM t3;
BEGIN;
CREATE TABLE t3(x);
INSERT INTO t3 SELECT x FROM t1 ORDER BY x LIMIT 10 OFFSET 1;
END;
SELECT count(*) FROM t3;
SELECT x FROM t3 LIMIT 2 OFFSET 10000;
CREATE TABLE t4 AS SELECT x,;
FROM t3 LIMIT 1000;
SELECT x FROM t4 ORDER BY y DESC LIMIT 1 OFFSET 999;
CREATE TABLE t5(x,y);
INSERT INTO t5 SELECT x-y, x+y FROM t1 WHERE x BETWEEN 10 AND 15
ORDER BY x LIMIT 2;
SELECT * FROM t5 ORDER BY x;
DELETE FROM t5;
INSERT INTO t5 SELECT x-y, x+y FROM t1 WHERE x BETWEEN 10 AND 15
ORDER BY x DESC LIMIT 2;
SELECT * FROM t5 ORDER BY x;
DELETE FROM t5;
INSERT INTO t5 SELECT x-y, x+y FROM t1 WHERE x ORDER BY x DESC LIMIT 31;
SELECT * FROM t5 ORDER BY x LIMIT 2;
SELECT * FROM t5 ORDER BY x DESC, y DESC LIMIT 2;
DELETE FROM t5;
INSERT INTO t5 SELECT a.x*100+b.x, a.y*100+b.y FROM t1 AS a, t1 AS b
ORDER BY 1, 2 LIMIT 1000;
SELECT count(*), sum(x), sum(y), min(x), max(x), min(y), max(y) FROM t5;
BEGIN;
CREATE TABLE t6(a);
INSERT INTO t6 VALUES(1);
INSERT INTO t6 VALUES(2);
INSERT INTO t6 SELECT a+2 FROM t6;
COMMIT;
SELECT * FROM t6;
SELECT * FROM t6 LIMIT -1 OFFSET -1;
SELECT * FROM t6 LIMIT 2 OFFSET -123;
SELECT * FROM t6 LIMIT -432 OFFSET 2;
SELECT * FROM t6 LIMIT -1;
SELECT * FROM t6 LIMIT -1 OFFSET 1;
SELECT * FROM t6 LIMIT 0;
SELECT * FROM t6 LIMIT 0 OFFSET 1;
SELECT x FROM t2 LIMIT 5 UNION ALL SELECT a FROM t6;
SELECT x FROM t2 LIMIT 5 UNION SELECT a FROM t6;
SELECT x FROM t2 LIMIT 5 EXCEPT SELECT a FROM t6 LIMIT 3;
SELECT x FROM t2 LIMIT 0,5 INTERSECT SELECT a FROM t6;
SELECT x FROM t2 UNION ALL SELECT a FROM t6 LIMIT 5;
SELECT x FROM t2 UNION ALL SELECT a FROM t6 LIMIT 3 OFFSET 1;
SELECT x FROM t2 UNION ALL SELECT a FROM t6 ORDER BY 1 LIMIT 3 OFFSET 1;
SELECT x FROM t2 UNION SELECT x+2 FROM t2 LIMIT 2 OFFSET 1;
SELECT x FROM t2 UNION SELECT x+2 FROM t2 ORDER BY 1 DESC LIMIT 2 OFFSET 1;
SELECT a+9 FROM t6 EXCEPT SELECT y FROM t2 LIMIT 2;
SELECT a+9 FROM t6 EXCEPT SELECT y FROM t2 ORDER BY 1 DESC LIMIT 2;
SELECT a+26 FROM t6 INTERSECT SELECT x FROM t2 LIMIT 1;
SELECT a+27 FROM t6 INTERSECT SELECT x FROM t2 LIMIT 1;
SELECT a+27 FROM t6 INTERSECT SELECT x FROM t2 LIMIT 1 OFFSET 1;
SELECT a+27 FROM t6 INTERSECT SELECT x FROM t2
ORDER BY 1 DESC LIMIT 1 OFFSET 1;
SELECT DISTINCT cast(round(x/100) as integer) FROM t3 LIMIT 5;
SELECT DISTINCT cast(round(x/100) as integer) FROM t3 LIMIT 5 OFFSET 5;
SELECT DISTINCT cast(round(x/100) as integer) FROM t3 LIMIT 5 OFFSET 25;
SELECT * FROM (SELECT * FROM t6 LIMIT 3);
CREATE TABLE t7 AS SELECT * FROM t6;
SELECT * FROM (SELECT * FROM t7 LIMIT 3);
SELECT * FROM (SELECT * FROM t6 LIMIT 3)
UNION
SELECT * FROM (SELECT * FROM t7 LIMIT 3)
ORDER BY 1;
SELECT * FROM (SELECT * FROM t6 LIMIT 3)
UNION
SELECT * FROM (SELECT * FROM t7 LIMIT 3)
ORDER BY 1
LIMIT 2;
SELECT * FROM t6 LIMIT 3
UNION
SELECT * FROM t7 LIMIT 3;
SELECT x FROM t1 LIMIT :limit;
SELECT x FROM t1 LIMIT :limit OFFSET :offset;
SELECT x FROM t1 WHERE x<10 LIMIT :limit;
SELECT x FROM t1 WHERE x<10 LIMIT :limit;
SELECT x FROM t1 WHERE x<10 LIMIT :limit;
SELECT x FROM (SELECT x FROM t1 ORDER BY x LIMIT 0) ORDER BY x;
SELECT * FROM t1 LIMIT replace(1);
SELECT * FROM t1 LIMIT 5 OFFSET replace(1);
SELECT * FROM t1 LIMIT x;
SELECT * FROM t1 LIMIT 1 OFFSET x;
CREATE TABLE t13(x);
INSERT INTO t13 VALUES(1),(2);
CREATE VIEW v13a AS SELECT x AS y FROM t13;
CREATE VIEW v13b AS SELECT y AS z FROM v13a UNION ALL SELECT y+10 FROM v13a;
CREATE VIEW v13c AS SELECT z FROM v13b UNION ALL SELECT z+20 FROM v13b;
SELECT 123 LIMIT 1 OFFSET 0;
SELECT 123 LIMIT 1 OFFSET 1;
SELECT 123 LIMIT 0 OFFSET 0;
SELECT 123 LIMIT 0 OFFSET 1;
SELECT 123 LIMIT -1 OFFSET 0;
SELECT 123 LIMIT -1 OFFSET 1;