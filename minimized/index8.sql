CREATE TABLE t1(a,b,c,d);
WITH RECURSIVE c(x) AS (VALUES(0) UNION ALL SELECT x+1 FROM c WHERE x<100)
INSERT INTO t1(a,b,c,d)
SELECT x/10, x%10, x%19, x FROM c;
CREATE INDEX t1abc ON t1(a,b,c);
SELECT * FROM t1 WHERE c=4 ORDER BY a, b LIMIT 2;
EXPLAIN QUERY PLAN
SELECT * FROM t1 WHERE c=4 ORDER BY a, b LIMIT 2;
DROP INDEX t1abc;
CREATE INDEX t1abd ON t1(a,b,d);
SELECT * FROM t1 WHERE c=4 ORDER BY a, b LIMIT 2;
EXPLAIN QUERY PLAN
SELECT * FROM t1 WHERE c=4 ORDER BY a, b LIMIT 2;
