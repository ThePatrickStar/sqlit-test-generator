PRAGMA cache_size = 5;
WITH r(x,y) AS (
SELECT 1, $::str
UNION ALL
SELECT x+1, $::str FROM r
LIMIT 200;
SELECT count(x), length(y) FROM r GROUP BY (x%5);
WITH r(x,y) AS (
SELECT 100, $::str
UNION ALL
SELECT x-1, $::str FROM r
LIMIT 100;
SELECT count(x), length(y) FROM r GROUP BY y COLLATE utf16bin, (x%5);
WITH r(x,y) AS (
SELECT 300, $::str2
UNION ALL
SELECT x-1, $::str2 FROM r
LIMIT 300;
SELECT count(x), length(y) FROM r GROUP BY y, (x%5);
CREATE TABLE t1(a, b, c);
INSERT INTO t1 VALUES(1, 2, 3);
INSERT INTO t1 SELECT;
FROM t1 ORDER BY rowid DESC LIMIT 1;
CREATE TABLE t1(a, b, c);
INSERT INTO t1 VALUES($a, $b, $c);
INSERT INTO t1 VALUES($c, $b, $a);
