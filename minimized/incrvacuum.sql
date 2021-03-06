CREATE TABLE abc(a, b, c);
PRAGMA auto_vacuum = 2;
BEGIN;
CREATE TABLE tbl2(str);
INSERT INTO tbl2 VALUES($::str);
COMMIT;
DROP TABLE abc;
DELETE FROM tbl2;
PRAGMA auto_vacuum = 1;
INSERT INTO tbl2 VALUES('hello world');
PRAGMA auto_vacuum = 2;
INSERT INTO tbl2 VALUES($::str);
CREATE TABLE tbl1(a, b, c);
DELETE FROM tbl2;
DROP TABLE tbl1;
BEGIN;
DROP TABLE tbl2;
PRAGMA incremental_vacuum;
COMMIT;
BEGIN;
CREATE TABLE tbl1(a);
INSERT INTO tbl1 VALUES($::str);
PRAGMA incremental_vacuum;                 -- this is a no-op.
COMMIT;
BEGIN;
INSERT INTO tbl1 VALUES($::str);
INSERT INTO tbl1 SELECT * FROM tbl1;
DELETE FROM tbl1 WHERE oid%2;        -- Put 2 overflow pages on free-list.
COMMIT;
BEGIN;
PRAGMA incremental_vacuum;           -- Vacuum up the two pages.
CREATE TABLE tbl2(b);                -- Use one free page as a table root.
INSERT INTO tbl2 VALUES('a nice string');
COMMIT;
SELECT * FROM tbl2;
DROP TABLE tbl1;
DROP TABLE tbl2;
PRAGMA incremental_vacuum;
BEGIN;
CREATE TABLE t1(a, b);
CREATE TABLE t2(a, b);
CREATE INDEX t1_i ON t1(a);
CREATE INDEX t2_i ON t2(a);
INSERT INTO t1 VALUES($::str1, $::str2);
INSERT INTO t1 VALUES($::str1||$::str2, $::str2||$::str1);
INSERT INTO t2 SELECT b, a FROM t1;
INSERT INTO t2 SELECT a, b FROM t1;
INSERT INTO t1 SELECT b, a FROM t2;
UPDATE t2 SET b = '';
PRAGMA incremental_vacuum;
UPDATE t2 SET b = (SELECT b FROM t1 WHERE t1.oid = t2.oid);
PRAGMA incremental_vacuum;
CREATE TABLE t3(a, b);
INSERT INTO t3 SELECT * FROM t2;
DROP TABLE t2;
PRAGMA incremental_vacuum;
CREATE INDEX t3_i ON t3(a);
COMMIT;
BEGIN;
DROP INDEX t3_i;
PRAGMA incremental_vacuum;
INSERT INTO t3 VALUES('hello', 'world');
ROLLBACK;
INSERT INTO t3 VALUES('hello', 'world');
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
SELECT tbl_name FROM sqlite_master WHERE type = 'table';
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
COMMIT;
DROP TABLE tbl1;
DROP TABLE IF EXISTS tbl1;
DROP TABLE IF EXISTS tbl2;
PRAGMA incremental_vacuum;
CREATE TABLE tbl1(a, b);
CREATE TABLE tbl2(a, b);
BEGIN;
INSERT INTO tbl2 SELECT * FROM tbl1;
COMMIT;
DROP TABLE tbl1;
CREATE TABLE tbl1(a, b);
INSERT INTO tbl1 VALUES('hello', 'world');
SELECT * FROM tbl1;
PRAGMA incremental_vacuum(50);
PRAGMA auto_vacuum = 'incremental';
CREATE TABLE t1(a, b, c);
CREATE TABLE t2(a, b, c);
INSERT INTO t2 VALUES(randstr(500,500),randstr(500,500),randstr(500,500));
INSERT INTO t1 VALUES(1, 2, 3);
INSERT INTO t1 SELECT a||a, b||b, c||c FROM t1;
INSERT INTO t1 SELECT a||a, b||b, c||c FROM t1;
INSERT INTO t1 SELECT a||a, b||b, c||c FROM t1;
INSERT INTO t1 SELECT a||a, b||b, c||c FROM t1;
INSERT INTO t1 SELECT a||a, b||b, c||c FROM t1;
INSERT INTO t1 SELECT a||a, b||b, c||c FROM t1;
INSERT INTO t1 SELECT a||a, b||b, c||c FROM t1;
INSERT INTO t1 SELECT a||a, b||b, c||c FROM t1;
PRAGMA synchronous = 'OFF';
BEGIN;
UPDATE t1 SET a = a, b = b, c = c;
DROP TABLE t2;
PRAGMA incremental_vacuum(10);
ROLLBACK;
PRAGMA cache_size = 10;
BEGIN;
UPDATE t1 SET a = a, b = b, c = c;
DROP TABLE t2;
PRAGMA incremental_vacuum(10);
ROLLBACK;
DROP TABLE t1;
DROP TABLE t2;
PRAGMA incremental_vacuum(1);
PRAGMA incremental_vacuum(5);
PRAGMA incremental_vacuum('1');
PRAGMA incremental_vacuum("+3");
PRAGMA incremental_vacuum = 1;
PRAGMA incremental_vacuum(2147483649);
CREATE TABLE t1(x);
INSERT INTO t1 VALUES(hex(randomblob(1000)));
DROP TABLE t1;
PRAGMA incremental_vacuum=-1;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum = incremental;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum = 'full';
PRAGMA auto_vacuum;
PRAGMA auto_vacuum = 1;
PRAGMA auto_vacuum = none;
PRAGMA default_cache_size = 1024;
PRAGMA auto_vacuum;
PRAGMA auto_vacuum;
PRAGMA incremental_vacuum(10);
PRAGMA cache_size = 10;
PRAGMA auto_vacuum = incremental;
CREATE TABLE t1(x, y);
INSERT INTO t1 VALUES('a', $str);
INSERT INTO t1 VALUES('b', $str);
INSERT INTO t1 VALUES('c', $str);
INSERT INTO t1 VALUES('d', $str);
INSERT INTO t1 VALUES('e', $str);
INSERT INTO t1 VALUES('f', $str);
INSERT INTO t1 VALUES('g', $str);
INSERT INTO t1 VALUES('h', $str);
INSERT INTO t1 VALUES('i', $str);
INSERT INTO t1 VALUES('j', $str);
INSERT INTO t1 VALUES('j', $str);
CREATE TABLE t2(x PRIMARY KEY, y);
INSERT INTO t2 VALUES('a', $str);
INSERT INTO t2 VALUES('b', $str);
INSERT INTO t2 VALUES('c', $str);
INSERT INTO t2 VALUES('d', $str);
BEGIN;
DELETE FROM t2;
PRAGMA incremental_vacuum;
COMMIT;
PRAGMA integrity_check;
