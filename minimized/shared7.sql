CREATE TABLE t1(x);
ATTACH 'test.db' AS err1;
ATTACH 'test2.db' AS test2;
CREATE TABLE test2.t2(y);
ATTACH 'test2.db' AS err2;
ATTACH 'test.db' AS err1;
