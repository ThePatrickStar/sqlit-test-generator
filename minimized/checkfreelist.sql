CREATE TABLE t1(a, b);
SELECT load_extension('../checkfreelist.so');
WITH s(i) AS (
SELECT 1 UNION ALL SELECT i+1 FROM s WHERE i<10000;
INSERT INTO t1 SELECT randomblob(400), randomblob(400) FROM s;
DELETE FROM t1 WHERE rowid%3;
PRAGMA freelist_count;
WITH freelist_trunk(i, d, n) AS (
SELECT 1, NULL, sqlite_readint32(data, 32) FROM sqlite_dbpage WHERE pgno=1
UNION ALL
SELECT n, data, sqlite_readint32(data)
FROM freelist_trunk, sqlite_dbpage WHERE pgno=n;
SELECT i FROM freelist_trunk WHERE i!=1;
BEGIN;
UPDATE sqlite_dbpage
SET data = set_int(data, 1, get_int(data, 1)-1)
WHERE pgno=4861;
SELECT checkfreelist('main');
ROLLBACK;
BEGIN;
UPDATE sqlite_dbpage
SET data = set_int(data, 5, (SELECT * FROM pragma_page_count)+1)
WHERE pgno=4861;
SELECT checkfreelist('main');
ROLLBACK;
BEGIN;
UPDATE sqlite_dbpage
SET data = set_int(data, 5, 0)
WHERE pgno=4861;
SELECT checkfreelist('main');
ROLLBACK;
BEGIN;
UPDATE sqlite_dbpage
SET data = set_int(data, get_int(data, 1)+1, 0)
WHERE pgno=5;
SELECT checkfreelist('main');
ROLLBACK;
BEGIN;
UPDATE sqlite_dbpage
SET data = set_int(data, 1, 249)
WHERE pgno=5;
SELECT checkfreelist('main');
ROLLBACK;
