CREATE TABLE t1(x);
SELECT 'abc' FROM ( SELECT 'xyz' FROM t1 WHERE (SELECT 1) );
