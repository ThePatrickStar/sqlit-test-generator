CREATE TABLE t1(a, b UNIQUE, c UNIQUE);
INSERT INTO t1 VALUES(1, randomblob(500), randomblob(500));
INSERT INTO t1 VALUES(2, randomblob(500), randomblob(500));
PRAGMA journal_mode = wal;
INSERT INTO t1 VALUES(3, randomblob(500), randomblob(500));
BEGIN;
SELECT a FROM t1;
UPDATE t1 SET b=randomblob(501), c=randomblob(501) WHERE a=1;
INSERT INTO t1 VALUES(4, randomblob(500), randomblob(500));
INSERT INTO t1 VALUES(5, randomblob(500), randomblob(500));
INSERT INTO t1 VALUES(6, randomblob(500), randomblob(500));
SELECT a FROM t1;
PRAGMA integrity_check;
CREATE TABLE t1(a, b UNIQUE, c UNIQUE);
INSERT INTO t1 VALUES(1, randomblob(500), randomblob(500));
INSERT INTO t1 VALUES(2, randomblob(500), randomblob(500));
PRAGMA journal_mode = wal;
INSERT INTO t1 VALUES(3, randomblob(500), randomblob(500));
BEGIN;
SELECT a FROM t1;
UPDATE t1 SET b=randomblob(501), c=randomblob(501) WHERE a=1;
INSERT INTO t1 VALUES(4, randomblob(500), randomblob(500));
INSERT INTO t1 VALUES(5, randomblob(500), randomblob(500));
INSERT INTO t1 VALUES(6, randomblob(500), randomblob(500));
SELECT a FROM t1;
PRAGMA integrity_check;
CREATE TABLE t1(a, b UNIQUE, c UNIQUE);
INSERT INTO t1 VALUES(1, randomblob(500), randomblob(500));
INSERT INTO t1 VALUES(2, randomblob(500), randomblob(500));
PRAGMA journal_mode = wal;
INSERT INTO t1 VALUES(3, randomblob(500), randomblob(500));
BEGIN;
SELECT a FROM t1;
UPDATE t1 SET b=randomblob(501), c=randomblob(501) WHERE a=1;
INSERT INTO t1 VALUES(4, randomblob(500), randomblob(500));
INSERT INTO t1 VALUES(5, randomblob(500), randomblob(500));
INSERT INTO t1 VALUES(6, randomblob(500), randomblob(500));
BEGIN;
SELECT a FROM t1;
PRAGMA integrity_check;
PRAGMA journal_mode = wal;
CREATE TABLE t1(zzz);
INSERT INTO t1 VALUES('abc');
INSERT INTO t1 VALUES('def');
PRAGMA page_size = 512;
PRAGMA journal_mode = wal;
PRAGMA wal_autocheckpoint = 0;
CREATE TABLE t1(zzz);
INSERT INTO t1 VALUES(randomblob( 500 * 9500 ));
PRAGMA user_version = 211;
