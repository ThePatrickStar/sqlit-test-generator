BEGIN;
CREATE TABLE t1(a int, b int);
COMMIT;
SELECT count(*) FROM t1;
SELECT a FROM t1
WHERE b IN (SELECT b FROM t1 WHERE a<5)
ORDER BY a;
SELECT a FROM t1
WHERE b IN (SELECT b FROM t1 WHERE a<5) OR b==512
ORDER BY a;
SELECT a + 100*(b IN (SELECT b FROM t1 WHERE a<5)) FROM t1 ORDER BY b;
UPDATE t1 SET b=b*2
WHERE b IN (SELECT b FROM t1 WHERE a>8);
DELETE FROM t1 WHERE b IN (SELECT b FROM t1 WHERE a>8);
DELETE FROM t1 WHERE b NOT IN (SELECT b FROM t1 WHERE a>4);
INSERT INTO t1 VALUES('hello', 'world');
SELECT * FROM t1
WHERE a IN (;
CREATE TABLE ta(a INTEGER PRIMARY KEY, b);
INSERT INTO ta VALUES(1,1);
INSERT INTO ta VALUES(2,2);
INSERT INTO ta VALUES(3,3);
INSERT INTO ta VALUES(4,4);
INSERT INTO ta VALUES(6,6);
INSERT INTO ta VALUES(8,8);
INSERT INTO ta VALUES(10,;
SELECT * FROM ta WHERE a<10;
CREATE TABLE tb(a INTEGER PRIMARY KEY, b);
INSERT INTO tb VALUES(1,1);
INSERT INTO tb VALUES(2,2);
INSERT INTO tb VALUES(3,3);
INSERT INTO tb VALUES(5,5);
INSERT INTO tb VALUES(7,7);
INSERT INTO tb VALUES(9,9);
INSERT INTO tb VALUES(11,;
SELECT * FROM tb WHERE a<10;
SELECT a FROM ta WHERE b IN (SELECT a FROM tb);
SELECT a FROM ta WHERE b NOT IN (SELECT a FROM tb);
SELECT a FROM ta WHERE b IN (SELECT b FROM tb);
SELECT a FROM ta WHERE b NOT IN (SELECT b FROM tb);
SELECT a FROM ta WHERE a IN (SELECT a FROM tb);
SELECT a FROM ta WHERE a NOT IN (SELECT a FROM tb);
SELECT a FROM ta WHERE a IN (SELECT b FROM tb);
SELECT a FROM ta WHERE a NOT IN (SELECT b FROM tb);
SELECT a FROM t1 WHERE a IN ();
SELECT a FROM t1 WHERE a IN (5);
SELECT a FROM t1 WHERE a NOT IN () ORDER BY a;
SELECT a FROM t1 WHERE a IN (5) AND b IN ();
SELECT a FROM t1 WHERE a IN (5) AND b NOT IN ();
SELECT a FROM ta WHERE a IN ();
SELECT a FROM ta WHERE a NOT IN ();
SELECT * FROM ta LEFT JOIN tb ON (ta.b=tb.b) WHERE ta.a IN ();
SELECT b FROM t1 WHERE a IN ('hello','there');
SELECT b FROM t1 WHERE a IN ("hello",'there');
CREATE TABLE t4 AS SELECT a FROM tb;
SELECT * FROM t4;
SELECT b FROM t1 WHERE a IN t4;
SELECT b FROM t1 WHERE a NOT IN t4;
SELECT b FROM t1 WHERE a NOT IN tb;
CREATE TABLE t5(;
CHECK( a IN (111,222,333) );
INSERT INTO t5 VALUES(111);
SELECT * FROM t5;
INSERT INTO t5 VALUES(4);
CREATE TABLE t6(a,b NUMERIC);
INSERT INTO t6 VALUES(1,2);
INSERT INTO t6 VALUES(2,3);
SELECT * FROM t6 WHERE b IN (2);
SELECT * FROM t6 WHERE b IN ('2');
SELECT * FROM t6 WHERE +b IN ('2');
SELECT * FROM t6 WHERE a IN ('2');
SELECT * FROM t6 WHERE a IN (2);
SELECT * FROM t6 WHERE +a IN ('2');
CREATE TABLE t2(a, b, c);
CREATE TABLE t3(a, b, c);
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 UNION ALL SELECT a, b FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 UNION SELECT a, b FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 EXCEPT SELECT a, b FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 INTERSECT SELECT a, b FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 UNION ALL SELECT a FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 UNION SELECT a FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 EXCEPT SELECT a FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 INTERSECT SELECT a FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a FROM t3 UNION ALL SELECT a, b FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a FROM t3 UNION SELECT a, b FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a FROM t3 EXCEPT SELECT a, b FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a FROM t3 INTERSECT SELECT a, b FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 UNION ALL SELECT a, b FROM t2;
SELECT * FROM t2 WHERE a IN (
SELECT a, b FROM t3 UNION ALL SELECT a FROM t2;
CREATE TABLE t7(a, b, c NOT NULL);
INSERT INTO t7 VALUES(1,    1, 1);
INSERT INTO t7 VALUES(2,    2, 2);
INSERT INTO t7 VALUES(3,    3, 3);
INSERT INTO t7 VALUES(NULL, 4, 4);
INSERT INTO t7 VALUES(NULL, 5, 5);
SELECT;
SELECT b IN (
SELECT inside.a
FROM t7 AS inside
WHERE inside.b BETWEEN outside.b+1 AND outside.b+2;
FROM t7 AS outside ORDER BY b;
SELECT b NOT IN (
SELECT inside.a
FROM t7 AS inside
WHERE inside.b BETWEEN outside.b+1 AND outside.b+2;
FROM t7 AS outside ORDER BY b;
CREATE INDEX i1 ON t7(a);
CREATE INDEX i2 ON t7(b);
CREATE INDEX i3 ON t7(c);
SELECT;
SELECT;
BEGIN TRANSACTION;
CREATE TABLE a(id INTEGER);
INSERT INTO a VALUES(1);
INSERT INTO a VALUES(2);
INSERT INTO a VALUES(3);
CREATE TABLE b(id INTEGER);
INSERT INTO b VALUES(NULL);
INSERT INTO b VALUES(3);
INSERT INTO b VALUES(4);
INSERT INTO b VALUES(5);
COMMIT;
SELECT * FROM a WHERE id NOT IN (SELECT id FROM b);
CREATE INDEX i5 ON b(id);
SELECT * FROM a WHERE id NOT IN (SELECT id FROM b);
SELECT 0 WHERE (SELECT 0,0) OR (0 IN (1,2));
CREATE TABLE c1(a);
INSERT INTO c1 VALUES(1), (2), (4), (3);
SELECT * FROM c1 WHERE a IN (SELECT a FROM c1) ORDER BY 1;
