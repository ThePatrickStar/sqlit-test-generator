CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1,11);
INSERT INTO t1 VALUES(2,22);
INSERT INTO t1 VALUES(3,33);
INSERT INTO t1 VALUES(4,44);
INSERT INTO t1 VALUES(5,55);
SELECT * FROM t1;
SELECT a, b FROM t1
UNION ALL
SELECT a, b FROM t1;
SELECT a, b FROM t1
UNION ALL
SELECT a, abs(b) FROM t1;
SELECT a, b FROM t1
UNION ALL
SELECT abs(a), b FROM t1;
SELECT a, b FROM t1
UNION ALL
SELECT abs(a), abs(b) FROM t1;
SELECT a, abs(b) FROM t1
UNION ALL
SELECT a, b FROM t1;
SELECT a, abs(b) FROM t1
UNION ALL
SELECT a, abs(b) FROM t1;
SELECT a, abs(b) FROM t1
UNION ALL
SELECT abs(a), b FROM t1;
SELECT a, abs(b) FROM t1
UNION ALL
SELECT abs(a), abs(b) FROM t1;
SELECT abs(a), b FROM t1
UNION ALL
SELECT a, b FROM t1;
SELECT abs(a), b FROM t1
UNION ALL
SELECT a, abs(b) FROM t1;
SELECT abs(a), b FROM t1
UNION ALL
SELECT abs(a), b FROM t1;
SELECT abs(a), b FROM t1
UNION ALL
SELECT abs(a), abs(b) FROM t1;
SELECT abs(a), abs(b) FROM t1
UNION ALL
SELECT a, b FROM t1;
SELECT abs(a), abs(b) FROM t1
UNION ALL
SELECT a, abs(b) FROM t1;
SELECT abs(a), abs(b) FROM t1
UNION ALL
SELECT abs(a), b FROM t1;
SELECT abs(a), abs(b) FROM t1
UNION ALL
SELECT abs(a), abs(b) FROM t1;
SELECT a, b FROM t1
UNION
SELECT a, b FROM t1
ORDER BY 1;
SELECT a, b FROM t1
UNION
SELECT a, abs(b) FROM t1
ORDER BY 1;
SELECT a, b FROM t1
UNION
SELECT abs(a), b FROM t1
ORDER BY 1;
SELECT a, b FROM t1
UNION
SELECT abs(a), abs(b) FROM t1
ORDER BY 1;
SELECT a, abs(b) FROM t1
UNION
SELECT a, b FROM t1
ORDER BY 1;
SELECT a, abs(b) FROM t1
UNION
SELECT a, abs(b) FROM t1
ORDER BY 1;
SELECT a, abs(b) FROM t1
UNION
SELECT abs(a), b FROM t1
ORDER BY 1;
SELECT a, abs(b) FROM t1
UNION
SELECT abs(a), abs(b) FROM t1
ORDER BY 1;
SELECT abs(a), b FROM t1
UNION
SELECT a, b FROM t1
ORDER BY 1;
SELECT abs(a), b FROM t1
UNION
SELECT a, abs(b) FROM t1
ORDER BY 1;
SELECT abs(a), b FROM t1
UNION
SELECT abs(a), b FROM t1
ORDER BY 1;
SELECT abs(a), b FROM t1
UNION
SELECT abs(a), abs(b) FROM t1
ORDER BY 1;
SELECT abs(a), abs(b) FROM t1
UNION
SELECT a, b FROM t1
ORDER BY 1;
SELECT abs(a), abs(b) FROM t1
UNION
SELECT a, abs(b) FROM t1
ORDER BY 1;
SELECT abs(a), abs(b) FROM t1
UNION
SELECT abs(a), b FROM t1
ORDER BY 1;
SELECT abs(a), abs(b) FROM t1
UNION
SELECT abs(a), abs(b) FROM t1
ORDER BY 1;
SELECT a+b, a-b, a, b FROM t1
UNION ALL
SELECT a+b, a-b, a, b FROM t1;
SELECT a+b, a-b, a, b FROM t1
UNION ALL
SELECT a+b, a-b, a, abs(b) FROM t1;
SELECT a+b, a-b, a, b FROM t1
UNION ALL
SELECT a+b, a-b, abs(a), b FROM t1;
SELECT a+b, a-b, a, b FROM t1
UNION ALL
SELECT a+b, a-b, abs(a), abs(b) FROM t1;
SELECT a+b, a-b, a, abs(b) FROM t1
UNION ALL
SELECT a+b, a-b, a, b FROM t1;
SELECT a+b, a-b, a, abs(b) FROM t1
UNION ALL
SELECT a+b, a-b, a, abs(b) FROM t1;
SELECT a+b, a-b, a, abs(b) FROM t1
UNION ALL
SELECT a+b, a-b, abs(a), b FROM t1;
SELECT a+b, a-b, a, abs(b) FROM t1
UNION ALL
SELECT a+b, a-b, abs(a), abs(b) FROM t1;
SELECT a+b, a-b, abs(a), b FROM t1
UNION ALL
SELECT a+b, a-b, a, b FROM t1;
SELECT a+b, a-b, abs(a), b FROM t1
UNION ALL
SELECT a+b, a-b, a, abs(b) FROM t1;
SELECT a+b, a-b, abs(a), b FROM t1
UNION ALL
SELECT a+b, a-b, abs(a), b FROM t1;
SELECT a+b, a-b, abs(a), b FROM t1
UNION ALL
SELECT a+b, a-b, abs(a), abs(b) FROM t1;
SELECT a+b, a-b, abs(a), abs(b) FROM t1
UNION ALL
SELECT a+b, a-b, a, b FROM t1;
SELECT a+b, a-b, abs(a), abs(b) FROM t1
UNION ALL
SELECT a+b, a-b, a, abs(b) FROM t1;
SELECT a+b, a-b, abs(a), abs(b) FROM t1
UNION ALL
SELECT a+b, a-b, abs(a), b FROM t1;
SELECT a+b, a-b, abs(a), abs(b) FROM t1
UNION ALL
SELECT a+b, a-b, abs(a), abs(b) FROM t1;
SELECT a, b FROM t1
EXCEPT
SELECT a, b FROM t1;
SELECT a, b FROM t1
EXCEPT
SELECT a, abs(b) FROM t1;
SELECT a, b FROM t1
EXCEPT
SELECT abs(a), b FROM t1;
SELECT a, b FROM t1
EXCEPT
SELECT abs(a), abs(b) FROM t1;
SELECT a, abs(b) FROM t1
EXCEPT
SELECT a, b FROM t1;
SELECT a, abs(b) FROM t1
EXCEPT
SELECT a, abs(b) FROM t1;
SELECT a, abs(b) FROM t1
EXCEPT
SELECT abs(a), b FROM t1;
SELECT a, abs(b) FROM t1
EXCEPT
SELECT abs(a), abs(b) FROM t1;
SELECT abs(a), b FROM t1
EXCEPT
SELECT a, b FROM t1;
SELECT abs(a), b FROM t1
EXCEPT
SELECT a, abs(b) FROM t1;
SELECT abs(a), b FROM t1
EXCEPT
SELECT abs(a), b FROM t1;
SELECT abs(a), b FROM t1
EXCEPT
SELECT abs(a), abs(b) FROM t1;
SELECT abs(a), abs(b) FROM t1
EXCEPT
SELECT a, b FROM t1;
SELECT abs(a), abs(b) FROM t1
EXCEPT
SELECT a, abs(b) FROM t1;
SELECT abs(a), abs(b) FROM t1
EXCEPT
SELECT abs(a), b FROM t1;
SELECT abs(a), abs(b) FROM t1
EXCEPT
SELECT abs(a), abs(b) FROM t1;
SELECT a, b FROM t1
INTERSECT
SELECT a, b FROM t1
ORDER BY 1;
SELECT a, b FROM t1
INTERSECT
SELECT a, abs(b) FROM t1
ORDER BY 1;
SELECT a, b FROM t1
INTERSECT
SELECT abs(a), b FROM t1
ORDER BY 1;
SELECT a, b FROM t1
INTERSECT
SELECT abs(a), abs(b) FROM t1
ORDER BY 1;
SELECT a, abs(b) FROM t1
INTERSECT
SELECT a, b FROM t1
ORDER BY 1;
SELECT a, abs(b) FROM t1
INTERSECT
SELECT a, abs(b) FROM t1
ORDER BY 1;
SELECT a, abs(b) FROM t1
INTERSECT
SELECT abs(a), b FROM t1
ORDER BY 1;
SELECT a, abs(b) FROM t1
INTERSECT
SELECT abs(a), abs(b) FROM t1
ORDER BY 1;
SELECT abs(a), b FROM t1
INTERSECT
SELECT a, b FROM t1
ORDER BY 1;
SELECT abs(a), b FROM t1
INTERSECT
SELECT a, abs(b) FROM t1
ORDER BY 1;
SELECT abs(a), b FROM t1
INTERSECT
SELECT abs(a), b FROM t1
ORDER BY 1;
SELECT abs(a), b FROM t1
INTERSECT
SELECT abs(a), abs(b) FROM t1
ORDER BY 1;
SELECT abs(a), abs(b) FROM t1
INTERSECT
SELECT a, b FROM t1
ORDER BY 1;
SELECT abs(a), abs(b) FROM t1
INTERSECT
SELECT a, abs(b) FROM t1
ORDER BY 1;
SELECT abs(a), abs(b) FROM t1
INTERSECT
SELECT abs(a), b FROM t1
ORDER BY 1;
SELECT abs(a), abs(b) FROM t1
INTERSECT
SELECT abs(a), abs(b) FROM t1
ORDER BY 1;
CREATE TABLE host (;
INSERT INTO "host" VALUES('aald04','aalp03','4');
INSERT INTO "host" VALUES('aald17','aalp01','1');
CREATE VIEW consolemap1a as;
CREATE VIEW consolemap1b as;
CREATE VIEW consolemap1 as;
SELECT * from consolemap1b;
SELECT * FROM consolemap1;
