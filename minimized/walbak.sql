PRAGMA synchronous = NORMAL;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = 0;
PRAGMA journal_mode = wal;
BEGIN;
CREATE TABLE t1(a PRIMARY KEY, b);
INSERT INTO t1 VALUES('I', 'one');
COMMIT;
SELECT * FROM t1;
PRAGMA main.journal_mode;
VACUUM;
PRAGMA main.journal_mode;
CREATE TABLE t2(a, b);
INSERT INTO t2 SELECT * FROM t1;
DROP TABLE t1;
PRAGMA integrity_check;
SELECT md5sum(a, b) FROM t1;
CREATE TABLE t1(a PRIMARY KEY, b);
BEGIN;
INSERT INTO t1 VALUES(randomblob(500), randomblob(500));
INSERT INTO t1 SELECT randomblob(500), randomblob(500) FROM t1; /*  2 */
INSERT INTO t1 SELECT randomblob(500), randomblob(500) FROM t1; /*  4 */
INSERT INTO t1 SELECT randomblob(500), randomblob(500) FROM t1; /*  8 */
INSERT INTO t1 SELECT randomblob(500), randomblob(500) FROM t1; /* 16 */
INSERT INTO t1 SELECT randomblob(500), randomblob(500) FROM t1; /* 32 */
INSERT INTO t1 SELECT randomblob(500), randomblob(500) FROM t1; /* 64 */
COMMIT;
B step 50;
B step 50;
BEGIN;
UPDATE t1 SET b = randomblob(500);
B step 1000;
B step 50;
BEGIN;
UPDATE t1 SET b = randomblob(500);
B step 1000;
PRAGMA page_size = 2048;
PRAGMA journal_mode = PERSIST;
CREATE TABLE xx(x);
CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
SELECT * FROM t1;
B step 10000
B finish;
INSERT INTO t1 VALUES(5, 6);
INSERT INTO t1 VALUES(7, 8);
SELECT * FROM t1;
B step 10000
B finish;
CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES('I', 'II');
INSERT INTO t1 VALUES('III', 'IV');
CREATE TABLE t2(x, y);
INSERT INTO t2 VALUES('1', '2');
INSERT INTO t2 VALUES('3', '4');
