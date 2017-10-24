CREATE TABLE aux.t1(a INTEGER PRIMARY KEY, b UNIQUE);
INSERT INTO t1 VALUES(1, 1);
INSERT INTO t1 VALUES(2, 2);
BEGIN;
DELETE FROM t1 WHERE a = (SELECT max(a) FROM t1);
INSERT INTO t1 VALUES(NULL, NULL);
UPDATE t1 SET b = a WHERE a = (SELECT max(a) FROM t1);
SELECT count(*) FROM t1 WHERE b IS NULL;
COMMIT;
BEGIN;
SELECT count(*) FROM t1 WHERE b IS NULL;
COMMIT;
