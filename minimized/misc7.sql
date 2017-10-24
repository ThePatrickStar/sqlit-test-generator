CREATE TABLE abc(a, b, c);
BEGIN;
INSERT INTO abc VALUES(1, 2, 3);
INSERT INTO abc VALUES(2, 3, 4);
INSERT INTO abc SELECT a+2, b, c FROM abc;
COMMIT;
PRAGMA temp.cache_size = 1000;
DELETE FROM abc;
INSERT INTO abc VALUES(1, 2, 3);
INSERT INTO abc VALUES(2, 3, 4);
INSERT INTO abc SELECT a+2, b, c FROM abc;
BEGIN EXCLUSIVE;
SELECT * FROM sqlite_master;
PRAGMA omit_readlock = 1;
ATTACH 'test2.db' AS aux;
CREATE TABLE aux.hello(world);
SELECT name FROM aux.sqlite_master;
DETACH aux;
PRAGMA omit_readlock = 1;
ATTACH 'test2.db' AS aux;
SELECT name FROM aux.sqlite_master;
SELECT name FROM aux.sqlite_master;
SELECT *
FROM (SELECT name+1 AS one FROM sqlite_master LIMIT 1 OFFSET 1)
WHERE one LIKE 'hello%';
CREATE VIRTUAL TABLE t1 USING echo(abc);
SELECT a FROM t1 WHERE a = 1 ORDER BY b;
SELECT t1.a, t2.a FROM t1, t1 AS t2 ORDER BY 2 LIMIT 1;
CREATE TABLE abc(a PRIMARY KEY, b, c);
INSERT INTO abc VALUES(1, 2, 3);
CREATE VIRTUAL TABLE t1 USING echo(abc);
CREATE TABLE abc(a PRIMARY KEY, b, c);
EXPLAIN QUERY PLAN SELECT * FROM abc AS t2 WHERE rowid = 1;
EXPLAIN QUERY PLAN SELECT * FROM abc AS t2 WHERE a = 1;
EXPLAIN QUERY PLAN SELECT * FROM abc AS t2 ORDER BY a;
PRAGMA cache_size = 10;
BEGIN;
CREATE TABLE abc(a PRIMARY KEY, b, c);
INSERT INTO abc
VALUES(randstr(100,100), randstr(100,100), randstr(100,100));
INSERT INTO abc SELECT;
INSERT INTO abc SELECT;
INSERT INTO abc SELECT;
INSERT INTO abc SELECT;
INSERT INTO abc SELECT;
INSERT INTO abc SELECT;
INSERT INTO abc SELECT;
INSERT INTO abc SELECT;
COMMIT;
DELETE FROM abc WHERE rowid > 12;
INSERT INTO abc SELECT;
PRAGMA cache_size = 10;
PRAGMA default_cache_size = 10;
CREATE TABLE t3(a, b, UNIQUE(a, b));
INSERT INTO t3 VALUES( randstr(100, 100), randstr(100, 100) );
INSERT INTO t3 SELECT randstr(100, 100), randstr(100, 100) FROM t3;
INSERT INTO t3 SELECT randstr(100, 100), randstr(100, 100) FROM t3;
INSERT INTO t3 SELECT randstr(100, 100), randstr(100, 100) FROM t3;
INSERT INTO t3 SELECT randstr(100, 100), randstr(100, 100) FROM t3;
INSERT INTO t3 SELECT randstr(100, 100), randstr(100, 100) FROM t3;
UPDATE t3
SET b = 'hello world'
WHERE rowid >= (SELECT max(rowid)-1 FROM t3);
BEGIN;
PRAGMA cache_size = 10;
INSERT INTO t3 VALUES( randstr(100, 100), randstr(100, 100) );
UPDATE t3 SET a = b;
COMMIT;
SELECT count(*) FROM t3;
BEGIN;
DELETE FROM t3 WHERE (oid%3)==0;
COMMIT;
SELECT count(*) FROM t3;
SELECT count(*) FROM t3;
UPDATE sqlite_master
SET rootpage = $pending_byte_page
WHERE type = 'table' AND name = 't3';
SELECT rootpage FROM sqlite_master WHERE type = 'table' AND name = 't3';
SELECT count(*) FROM t3;
CREATE TABLE table_1 (col_10);
CREATE TABLE table_2 (;
SELECT a.col_10
FROM;
FROM table_1, table_2
GROUP BY table_1.col_10, qcol_9);
CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
INSERT INTO t1 VALUES(5, 6);
