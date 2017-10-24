PRAGMA cache_size = 5;
PRAGMA page_size = 1024;
PRAGMA auto_vacuum = 2;
CREATE TABLE t1(x UNIQUE);
INSERT INTO t1 VALUES(randomblob(400));
INSERT INTO t1 VALUES(randomblob(400));
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --   4
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --   8
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --  16
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --  32
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --  64
INSERT INTO t1 SELECT randomblob(400) FROM t1;    -- 128
INSERT INTO t1 SELECT randomblob(400) FROM t1;    -- 256;
DELETE FROM t1 WHERE rowid%8;
BEGIN;
PRAGMA incremental_vacuum = 100;
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --  64
INSERT INTO t1 SELECT randomblob(400) FROM t1;    -- 128
INSERT INTO t1 SELECT randomblob(400) FROM t1;    -- 256
ROLLBACK;
BEGIN;
SAVEPOINT one;
PRAGMA incremental_vacuum = 100;
SAVEPOINT two;
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --  64
INSERT INTO t1 SELECT randomblob(400) FROM t1;    -- 128
INSERT INTO t1 SELECT randomblob(400) FROM t1;    -- 256;
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --  64
PRAGMA incremental_vacuum = 1000;
INSERT INTO t1 SELECT randomblob(400) FROM t1;    -- 128
INSERT INTO t1 SELECT randomblob(400) FROM t1;    -- 256
ROLLBACK;
BEGIN;
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --  64
PRAGMA incremental_vacuum = 1000;
INSERT INTO t1 SELECT randomblob(400) FROM t1;    --  128
COMMIT;
