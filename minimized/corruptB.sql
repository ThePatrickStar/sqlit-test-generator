PRAGMA auto_vacuum = 1;
CREATE TABLE t1(x);
INSERT INTO t1 VALUES(randomblob(200));
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
INSERT INTO t1 SELECT randomblob(200) FROM t1;
CREATE TABLE t2(a);
INSERT INTO t2 VALUES($v);
