SELECT compile_options AS x FROM pragma_compile_options
WHERE x LIKE 'max_mmap_size=%';
PRAGMA page_size = 4096;
CREATE TABLE t0(a INTEGER PRIMARY KEY, b, c, UNIQUE(b, c));
WITH  s(i) AS ( SELECT 1 UNION ALL SELECT i+1 FROM s LIMIT 100 )
INSERT INTO t0 SELECT i, 't0', randomblob(800) FROM s;
CREATE TABLE t1 (a INTEGER PRIMARY KEY, b, c, UNIQUE(b, c));
WITH  s(i) AS ( SELECT 1 UNION ALL SELECT i+1 FROM s LIMIT 100 )
INSERT INTO t1 SELECT i, 't1', randomblob(800) FROM s;
PRAGMA main.mmap_size;
SELECT count(*) FROM t$t;
SELECT count(b || c) FROM t$t GROUP BY b;
SELECT * FROM t$t AS o WHERE
NOT EXISTS( SELECT * FROM t$t AS i WHERE a=o.a AND +b=o.b AND +c=o.c )
ORDER BY b, c;
SELECT * FROM t$t AS o WHERE
NOT EXISTS( SELECT * FROM t$t AS i WHERE a=o.a AND +b=o.b AND +c=o.c )
ORDER BY b, c;
