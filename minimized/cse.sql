CREATE TABLE t1(a INTEGER PRIMARY KEY, b, c, d, e, f);
INSERT INTO t1 VALUES(1,11,12,13,14,15);
INSERT INTO t1 VALUES(2,21,22,23,24,25);
SELECT b, -b, ~b, NOT b, NOT NOT b, b-b, b+b, b*b, b/b, b FROM t1;
SELECT b, b%b, b==b, b!=b, b<b, b<=b, b IS NULL, b NOT NULL, b FROM t1;
SELECT b, abs(b), coalesce(b,-b,NOT b,c,NOT c), c, -c FROM t1;
SELECT CASE WHEN a==1 THEN b ELSE c END, b, c FROM t1;
SELECT CASE a WHEN 1 THEN b WHEN 2 THEN c ELSE d END, b, c, d FROM t1;
SELECT CASE b WHEN 11 THEN -b WHEN 21 THEN -c ELSE -d END, b, c, d FROM t1;
SELECT CASE b+1 WHEN c THEN d WHEN e THEN f ELSE 999 END, b, c, d FROM t1;
SELECT CASE WHEN b THEN d WHEN e THEN f ELSE 999 END, b, c, d FROM t1;
SELECT b, c, d, CASE WHEN b THEN d WHEN e THEN f ELSE 999 END FROM t1;
SELECT b, c, d, CASE WHEN 0 THEN d WHEN e THEN f ELSE 999 END FROM t1;
SELECT a, -a, ~a, NOT a, NOT NOT a, a-a, a+a, a*a, a/a, a FROM t1;
SELECT a, a%a, a==a, a!=a, a<a, a<=a, a IS NULL, a NOT NULL, a FROM t1;
SELECT NOT b, ~b, NOT NOT b, b FROM t1;
SELECT CAST(b AS integer), typeof(b), CAST(b AS text), typeof(b) FROM t1;
SELECT *,* FROM t1 WHERE a=2
UNION ALL
SELECT *,* FROM t1 WHERE a=1;
SELECT coalesce(b,c,d,e), a, b, c, d, e FROM t1 WHERE a=2
UNION ALL
SELECT coalesce(e,d,c,b), e, d, c, b, a FROM t1 WHERE a=1;
SELECT upper(b), typeof(b), b FROM t1;
SELECT b, typeof(b), upper(b), typeof(b), b FROM t1;
CREATE TABLE t2(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,;
INSERT INTO t2 VALUES(0,1,2,3,4,5,6,7,8,9,;
SELECT * FROM t2;
