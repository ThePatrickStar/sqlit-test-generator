PRAGMA auto_vacuum=0;
PRAGMA page_size=1024;
CREATE TABLE abc(a, b, c);
SELECT * FROM sqlite_master;
SELECT * FROM sqlite_master;
SELECT * FROM sqlite_master;
SELECT * FROM sqlite_master;
CREATE INDEX a1 ON abc(a);
CREATE INDEX a2 ON abc(b);
PRAGMA writable_schema = 1;
UPDATE sqlite_master
SET name = 'a3', sql = 'CREATE INDEX a3' || substr(sql, 16, 10000)
WHERE type = 'index';
PRAGMA writable_schema = 0;
SELECT * FROM sqlite_master;
PRAGMA auto_vacuum = 1;
PRAGMA page_size = 1024;
CREATE TABLE t1(a, b, c);
CREATE TABLE t2(a, b, c);
INSERT INTO t2 VALUES(randomblob(100), randomblob(100), randomblob(100));
INSERT INTO t2 SELECT * FROM t2;
INSERT INTO t2 SELECT * FROM t2;
INSERT INTO t2 SELECT * FROM t2;
INSERT INTO t2 SELECT * FROM t2;
DROP TABLE t1;
SELECT * FROM t2;
PRAGMA auto_vacuum = 0;
PRAGMA page_size = 1024;
CREATE TABLE t1(a, b, c);
CREATE TABLE t2(a, b, c);
INSERT INTO t2 VALUES(randomblob(100), randomblob(100), randomblob(100));
INSERT INTO t2 SELECT * FROM t2;
INSERT INTO t2 SELECT * FROM t2;
INSERT INTO t2 SELECT * FROM t2;
INSERT INTO t2 SELECT * FROM t2;
INSERT INTO t1 SELECT * FROM t2;
On tree page 2 cell 0: 2nd reference to page 10
Page 4 is never used}}
PRAGMA auto_vacuum = incremental;
PRAGMA page_size = 1024;
CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, randomblob(2500));
INSERT INTO t1 VALUES(2, randomblob(2500));
DELETE FROM t1 WHERE a = 1;
PRAGMA auto_vacuum = incremental;
PRAGMA page_size = 1024;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b);
INSERT INTO t1 VALUES(1, randomblob(2500));
INSERT INTO t1 VALUES(2, randomblob(50));
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
DELETE FROM t1 WHERE a = 1;
PRAGMA auto_vacuum = incremental;
PRAGMA page_size = 1024;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b);
INSERT INTO t1 VALUES(1, randomblob(2500));
INSERT INTO t1 VALUES(2, randomblob(2500));
INSERT INTO t1 VALUES(3, randomblob(2500));
DELETE FROM t1 WHERE a = 1;
PRAGMA auto_vacuum = 1;
PRAGMA page_size = 1024;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b);
INSERT INTO t1 VALUES(1, randomblob(2500));
DELETE FROM t1 WHERE a = 1;
BEGIN EXCLUSIVE;
COMMIT;
PRAGMA auto_vacuum = 0;
PRAGMA page_size = 1024;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b);
CREATE INDEX i1 ON t1(b);
INSERT INTO t1 VALUES(1, randomblob(50));
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
INSERT INTO t1 SELECT NULL, randomblob(50) FROM t1;
CREATE TABLE t1(a, b, c); CREATE TABLE t8(a, b, c); CREATE TABLE tE(a, b, c);
CREATE TABLE t2(a, b, c); CREATE TABLE t9(a, b, c); CREATE TABLE tF(a, b, c);
CREATE TABLE t3(a, b, c); CREATE TABLE tA(a, b, c); CREATE TABLE tG(a, b, c);
CREATE TABLE t4(a, b, c); CREATE TABLE tB(a, b, c); CREATE TABLE tH(a, b, c);
CREATE TABLE t5(a, b, c); CREATE TABLE tC(a, b, c); CREATE TABLE tI(a, b, c);
CREATE TABLE t6(a, b, c); CREATE TABLE tD(a, b, c); CREATE TABLE tJ(a, b, c);
CREATE TABLE x1(a, b, c); CREATE TABLE x8(a, b, c); CREATE TABLE xE(a, b, c);
CREATE TABLE x2(a, b, c); CREATE TABLE x9(a, b, c); CREATE TABLE xF(a, b, c);
CREATE TABLE x3(a, b, c); CREATE TABLE xA(a, b, c); CREATE TABLE xG(a, b, c);
CREATE TABLE x4(a, b, c); CREATE TABLE xB(a, b, c); CREATE TABLE xH(a, b, c);
CREATE TABLE x5(a, b, c); CREATE TABLE xC(a, b, c); CREATE TABLE xI(a, b, c);
CREATE TABLE x6(a, b, c); CREATE TABLE xD(a, b, c); CREATE TABLE xJ(a, b, c);
CREATE TABLE t1(a, b, c);
CREATE TABLE t2(a, b, c);
PRAGMA writable_schema = 1;
UPDATE sqlite_master SET rootpage = NULL WHERE name = 't2';
PRAGMA auto_vacuum = incremental;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b);
CREATE TABLE t2(a INTEGER PRIMARY KEY, b);
INSERT INTO t1 VALUES(1, randstr(100,100));
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t2 SELECT * FROM t1;
DELETE FROM t1;
PRAGMA auto_vacuum = incremental;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b);
CREATE TABLE t2(a INTEGER PRIMARY KEY, b);
INSERT INTO t1 VALUES(1, randstr(100,100));
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t1 SELECT NULL, randstr(100,100) FROM t1;
INSERT INTO t2 SELECT * FROM t1;
DELETE FROM t1;
PRAGMA auto_vacuum = full;
PRAGMA page_size = 1024;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b);
INSERT INTO t1 VALUES(NULL, randstr(50,50));
PRAGMA auto_vacuum = 0;
CREATE TABLE t1(x);
INSERT INTO t1 VALUES(randomblob(3500));
DELETE FROM t1;
PRAGMA integrity_check;
PRAGMA freelist_count;
PRAGMA integrity_check;
Main freelist: free-page count in header is too small}}
INSERT INTO t1 VALUES(randomblob(2500));
PRAGMA freelist_count;
PRAGMA integrity_check;
Page 3 is never used}}
