PRAGMA cache_size = 10;
PRAGMA default_cache_size = 10;
CREATE TABLE t1(a, b, PRIMARY KEY(a, b));
INSERT INTO t1 VALUES(randstr(400,400),randstr(400,400));
INSERT INTO t1 SELECT randstr(400,400), randstr(400,400) FROM t1; -- 2
INSERT INTO t1 SELECT randstr(400,400), randstr(400,400) FROM t1; -- 4
INSERT INTO t1 SELECT randstr(400,400), randstr(400,400) FROM t1; -- 8
INSERT INTO t1 SELECT randstr(400,400), randstr(400,400) FROM t1; -- 16
INSERT INTO t1 SELECT randstr(400,400), randstr(400,400) FROM t1; -- 32;
PRAGMA cache_size = 10;
PRAGMA default_cache_size = 10;
BEGIN;
DELETE FROM t1 WHERE (oid%7)==0;
INSERT INTO t1 SELECT randstr(400,400), randstr(400,400)
WHERE (random()%7)==0;
UPDATE t1 SET a = randstr(400,400), b = randstr(400,400)
WHERE (random()%7)==0;
ROLLBACK;
CREATE TABLE t2 AS SELECT * FROM t1;
PRAGMA temp_store = memory;
PRAGMA cache_size = 10;
PRAGMA auto_vacuum = 1;
CREATE TABLE ab(a, b);
CREATE TABLE de(d, e);
INSERT INTO ab VALUES(1, randstr(200,200));
INSERT INTO ab SELECT a+1, randstr(200,200) FROM ab;
INSERT INTO ab SELECT a+2, randstr(200,200) FROM ab;
INSERT INTO ab SELECT a+4, randstr(200,200) FROM ab;
INSERT INTO ab SELECT a+8, randstr(200,200) FROM ab;
INSERT INTO ab SELECT a+16, randstr(200,200) FROM ab;
INSERT INTO ab SELECT a+32, randstr(200,200) FROM ab;
INSERT INTO ab SELECT a+64, randstr(200,200) FROM ab;
INSERT INTO de SELECT * FROM ab;
BEGIN;
UPDATE ab SET b = randstr(200,200);
UPDATE de SET e = randstr(200,200) WHERE d = (SELECT max(d) FROM de);
DELETE FROM ab;
COMMIT;
