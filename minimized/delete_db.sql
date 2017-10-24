CREATE TABLE t1(x, y);
BEGIN;
INSERT INTO t1 VALUES(1, 2);
COMMIT;
PRAGMA journal_mode = wal;
INSERT INTO t1 VALUES(3, 4);
CREATE TABLE x1(a, b);
WITH s(i) AS ( VALUES(1) UNION ALL SELECT i+1 FROM s WHERE i<1000 )
INSERT INTO x1 SELECT randomblob(100), randomblob(100) FROM s;
BEGIN;
UPDATE x1 SET a=randomblob(101);
COMMIT;
PRAGMA journal_mode = wal;
UPDATE x1 SET a=randomblob(102);
CREATE TABLE t1(x, y);
BEGIN;
INSERT INTO t1 VALUES(1, 2);
COMMIT;
PRAGMA journal_mode = wal;
INSERT INTO t1 VALUES(3, 4);
CREATE TABLE x1(a, b);
WITH s(i) AS ( VALUES(1) UNION ALL SELECT i+1 FROM s WHERE i<1000 )
INSERT INTO x1 SELECT randomblob(100), randomblob(100) FROM s;
BEGIN;
UPDATE x1 SET a=randomblob(101);
COMMIT;
PRAGMA journal_mode = wal;
UPDATE x1 SET a=randomblob(102);
