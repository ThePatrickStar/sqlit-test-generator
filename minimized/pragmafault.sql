CREATE TABLE t1(a, b, CHECK(a!=b));
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
