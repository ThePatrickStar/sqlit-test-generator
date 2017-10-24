CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 'one');
INSERT INTO t1 VALUES(2, 'two');
INSERT INTO t1 VALUES(3, 'three');
CREATE INDEX i1 ON t1(b || 'x');
SELECT 'TWOX' == (b || 'x') FROM t1 WHERE (b || 'x')>'onex';
SELECT 'TWOX' == (b || 'x') COLLATE nocase  FROM t1 WHERE (b || 'x')>'onex';
CREATE INDEX i2 ON t1(a+1);
SELECT a+1, quote(a+1) FROM t1 ORDER BY 1;
CREATE TABLE t1(a, b);
CREATE INDEX i1 ON t1(a, b);
SELECT b FROM t1 WHERE b IS NOT NULL AND a IS NULL
GROUP BY b COLLATE nocase
ORDER BY b COLLATE nocase;
CREATE TABLE t2(x);
INSERT INTO t2 VALUES('.ABC');
INSERT INTO t2 VALUES('.abcd');
INSERT INTO t2 VALUES('.defg');
INSERT INTO t2 VALUES('.DEF');
SELECT x FROM t2 ORDER BY substr(x, 2) COLLATE nocase;
CREATE INDEX i2 ON t2( substr(x, 2) );
SELECT x FROM t2 ORDER BY substr(x, 2) COLLATE nocase;
CREATE TABLE t3(x);
SELECT json_extract(x, '$.b') FROM t2
WHERE json_extract(x, '$.b') IS NOT NULL AND json_extract(x, '$.a') IS NULL
GROUP BY json_extract(x, '$.b') COLLATE nocase
ORDER BY json_extract(x, '$.b') COLLATE nocase;
CREATE INDEX i3 ON t3(json_extract(x, '$.a'), json_extract(x, '$.b'));
SELECT json_extract(x, '$.b') FROM t3
WHERE json_extract(x, '$.b') IS NOT NULL AND json_extract(x, '$.a') IS NULL
GROUP BY json_extract(x, '$.b') COLLATE nocase
ORDER BY json_extract(x, '$.b') COLLATE nocase;
CREATE TABLE t4(a, b);
INSERT INTO t4 VALUES('.ABC', 1);
INSERT INTO t4 VALUES('.abc', 2);
INSERT INTO t4 VALUES('.ABC', 3);
INSERT INTO t4 VALUES('.abc', 4);
SELECT * FROM t4
WHERE substr(a, 2) = 'abc' COLLATE NOCASE
ORDER BY substr(a, 2), b;
CREATE INDEX i4 ON t4( substr(a, 2) COLLATE NOCASE, b );
SELECT * FROM t4
WHERE substr(a, 2) = 'abc' COLLATE NOCASE
ORDER BY substr(a, 2), b;
DROP INDEX i4;
UPDATE t4 SET a = printf('%s%d',a,b);
SELECT * FROM t4 ORDER BY Substr(a,-2) COLLATE nocase;
SELECT * FROM t4 ORDER BY Substr(a,-2) COLLATE binary;
CREATE INDEX i4 ON t4( Substr(a,-2) COLLATE nocase );
SELECT * FROM t4 ORDER BY Substr(a,-2) COLLATE nocase;
EXPLAIN QUERY PLAN
SELECT * FROM t4 ORDER BY Substr(a,-2) COLLATE nocase;
SELECT * FROM t4 ORDER BY Substr(a,-2) COLLATE binary;
