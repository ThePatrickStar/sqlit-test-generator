PRAGMA journal_mode = WAL;
CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 1);
INSERT INTO t1 VALUES(2, 3);
INSERT INTO t1 VALUES(3, 6);
INSERT INTO t1 VALUES(4, (SELECT sum(a) FROM t1) + 4);
INSERT INTO t1 VALUES(5, (SELECT sum(a) FROM t1) + 5);
PRAGMA journal_mode = WAL;
CREATE TABLE t1(a PRIMARY KEY, b);
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
INSERT INTO t1 VALUES(5, 9);
INSERT INTO t1 VALUES(6, (SELECT sum(a) FROM t1) + 6);
INSERT INTO t1 VALUES(7, (SELECT sum(a) FROM t1) + 7);
PRAGMA journal_mode = WAL;
PRAGMA page_size = 1024;
CREATE TABLE t1(a PRIMARY KEY, b);
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
SELECT * FROM t1 WHERE a = 1;
PRAGMA journal_mode = WAL;
PRAGMA page_size = 1024;
BEGIN;
CREATE TABLE t1(x PRIMARY KEY);
INSERT INTO t1 VALUES(randomblob(900));
INSERT INTO t1 VALUES(randomblob(900));
INSERT INTO t1 SELECT randomblob(900) FROM t1;           /* 4 */
COMMIT;
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 8 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 12 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 16 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 20 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 24 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 28 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 32 */
PRAGMA wal_checkpoint;
INSERT INTO t1 VALUES(randomblob(900));
INSERT INTO t1 VALUES(randomblob(900));
INSERT INTO t1 VALUES(randomblob(900));
PRAGMA journal_mode = WAL;
PRAGMA page_size = 1024;
BEGIN;
CREATE TABLE t1(x PRIMARY KEY);
INSERT INTO t1 VALUES(randomblob(900));
INSERT INTO t1 VALUES(randomblob(900));
INSERT INTO t1 SELECT randomblob(900) FROM t1;           /* 4 */
COMMIT;
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 8 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 12 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 16 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 20 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 24 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 28 */
INSERT INTO t1 SELECT randomblob(900) FROM t1 LIMIT 4;   /* 32 */
PRAGMA wal_checkpoint;
INSERT INTO t1 VALUES(randomblob(9000));
INSERT INTO t1 VALUES(randomblob(9000));
INSERT INTO t1 VALUES(randomblob(9000));
INSERT INTO t1 VALUES(randomblob(9000));
PRAGMA page_size = $pgsz;
PRAGMA journal_mode = wal;
BEGIN;
CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 2);
COMMIT;
PRAGMA wal_checkpoint;
CREATE INDEX i1 ON t1(a);
PRAGMA wal_checkpoint;
