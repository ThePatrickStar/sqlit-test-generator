CREATE TABLE t1(a);
INSERT INTO t1 VALUES(1);
INSERT INTO t1 VALUES(2);
WITH x1 AS (SELECT * FROM t1)
SELECT sum(a) FROM x1;
WITH x1 AS (SELECT * FROM t1)
SELECT (SELECT sum(a) FROM x1);
WITH x1 AS (SELECT * FROM t1)
SELECT (SELECT sum(a) FROM x1);
CREATE TABLE t2(i);
INSERT INTO t2 VALUES(2);
INSERT INTO t2 VALUES(3);
INSERT INTO t2 VALUES(5);
WITH x1   AS (SELECT i FROM t2),;
SELECT min(i)-1 FROM x1 UNION SELECT a+1 FROM i WHERE a<10;
SELECT a FROM i WHERE a NOT IN x1;
WITH x1 AS (SELECT a FROM t1),;
SELECT * FROM x3;
CREATE TABLE t3 AS SELECT 3 AS x;
CREATE TABLE t4 AS SELECT 4 AS x;
WITH x1 AS (SELECT * FROM t3),;
WITH t3 AS (SELECT * FROM t4)
SELECT * FROM x1;
SELECT * FROM x2;
WITH x2 AS (
WITH t3 AS (SELECT * FROM t4)
SELECT * FROM t3;
SELECT * FROM x2;
WITH x2 AS (
WITH t3 AS (SELECT * FROM t4)
SELECT * FROM main.t3;
SELECT * FROM x2;
WITH x1 AS (SELECT * FROM t1)
SELECT (SELECT sum(a) FROM x1), (SELECT max(a) FROM x1);
WITH x1 AS (SELECT * FROM t1)
SELECT (SELECT sum(a) FROM x1), (SELECT max(a) FROM x1), a FROM x1;
WITH;
WITH;
SELECT * FROM j;
SELECT * FROM i;
WITH r(i) AS (
VALUES('.')
UNION ALL
SELECT i || '.' FROM r, (
SELECT x FROM x INTERSECT SELECT y FROM y;
SELECT * FROM r;
WITH r(i) AS (
VALUES('.')
UNION ALL
SELECT i || '.' FROM r, ( SELECT x FROM x WHERE x=2 ) WHERE length(i) < 10;
SELECT * FROM r ORDER BY length(i) DESC;
WITH;
VALUES(4)
UNION ALL
SELECT x+1 FROM t4 WHERE x<10;
SELECT * FROM t4;
WITH;
VALUES(4)
UNION ALL
SELECT x+1 FROM main.t4 WHERE x<10;
SELECT * FROM t4;
WITH;
VALUES(4)
UNION ALL
SELECT x+1 FROM t4, main.t4, t4 WHERE x<10;
SELECT * FROM t4;
WITH i(x) AS (
VALUES($min) UNION ALL SELECT x+1 FROM i WHERE x < $max;
SELECT * FROM i;
WITH i(x) AS (
VALUES($min) UNION ALL SELECT x+1 FROM i WHERE x < $max;
SELECT x FROM i JOIN i AS j USING (x);
WITH i(x, y) AS ( VALUES(1, (SELECT x FROM i)) )
SELECT * FROM i;
WITH;
SELECT * FROM i;
WITH;
SELECT * FROM i;
WITH;
SELECT * FROM j;
WITH;
WITH j(x) AS ( SELECT * FROM i )
SELECT * FROM j;
SELECT * FROM i;
WITH x() AS ( SELECT 1,2,3 )
SELECT * FROM x;
WITH x([join $cols ,]) AS (SELECT [join $vals ,])
SELECT (c1 == 1) FROM x;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a, b);
CREATE TABLE t2(a, b);
WITH x AS (SELECT a, b FROM t2) INSERT INTO t1 SELECT * FROM x;
WITH x AS (SELECT a, b FROM t2) INSERT INTO t1 SELECT * FROM t2;
INSERT INTO t1 WITH x AS ( SELECT * FROM t2 ) SELECT * FROM x;
INSERT INTO t1 WITH x(a,b) AS ( SELECT * FROM t2 ) SELECT * FROM x;
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
CREATE TABLE t1(a, b);
CREATE TABLE t2(a, b);
WITH x AS (SELECT * FROM t1)
INSERT INTO t2 VALUES(1, 2,);
WITH x AS (SELECT * FROM t1)
INSERT INTO t2 SELECT a, b, FROM t1;
WITH x AS (SELECT * FROM t1)
INSERT INTO t2 SELECT a, b FROM abc;
WITH x AS (SELECT * FROM t1)
INSERT INTO t2 SELECT a, b, FROM t1 a a a;
WITH x AS (SELECT * FROM t1)
DELETE FROM t2 WHERE;
WITH x AS (SELECT * FROM t1) DELETE FROM t2 WHERE;
WITH x AS (SELECT * FROM t1) DELETE FROM t2 WHRE 1;
WITH x AS (SELECT * FROM t1) UPDATE t2 SET a = 10, b = ;
WITH x AS (SELECT * FROM t1) UPDATE t2 SET a = 10, b = 1 WHERE a===b;
WITH x(a,b) AS (
SELECT 1, 1
UNION ALL
SELECT a*b,a+b FROM x WHERE c=2;
SELECT * FROM x;
CREATE TABLE t5(x INTEGER);
CREATE TABLE t6(y INTEGER);
WITH s(x) AS ( VALUES(7) UNION ALL SELECT x+7 FROM s WHERE x<49 )
INSERT INTO t5
SELECT * FROM s;
INSERT INTO t6
WITH s(x) AS ( VALUES(2) UNION ALL SELECT x+2 FROM s WHERE x<49 )
SELECT * FROM s;
SELECT * FROM t6 WHERE y IN (SELECT x FROM t5);
WITH ss AS (SELECT x FROM t5)
SELECT * FROM t6 WHERE y IN (SELECT x FROM ss);
WITH ss(x) AS ( VALUES(7) UNION ALL SELECT x+7 FROM ss WHERE x<49 )
SELECT * FROM t6 WHERE y IN (SELECT x FROM ss);
SELECT * FROM t6 WHERE y IN (
WITH ss(x) AS ( VALUES(7) UNION ALL SELECT x+7 FROM ss WHERE x<49 )
SELECT x FROM ss;
CREATE TABLE t7(y);
INSERT INTO t7 VALUES(NULL);
CREATE VIEW v AS SELECT * FROM t7 ORDER BY y;
WITH q(a) AS (
SELECT 1
UNION
SELECT a+1 FROM q, v WHERE a<5;
SELECT * FROM q;
WITH q(a) AS (
SELECT 1
UNION ALL
SELECT a+1 FROM q, v WHERE a<5;
SELECT * FROM q;
