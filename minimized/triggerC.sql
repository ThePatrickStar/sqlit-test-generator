CREATE TABLE t1(a, b, c);
CREATE TABLE log(t, a1, b1, c1, a2, b2, c2);
CREATE TRIGGER trig1 BEFORE INSERT ON t1 BEGIN
INSERT INTO log VALUES('before', NULL, NULL, NULL, new.a, new.b, new.c);
END;
CREATE TRIGGER trig2 AFTER INSERT ON t1 BEGIN
INSERT INTO log VALUES('after', NULL, NULL, NULL, new.a, new.b, new.c);
END;
CREATE TRIGGER trig3 BEFORE UPDATE ON t1 BEGIN
INSERT INTO log VALUES('before', old.a,old.b,old.c, new.a,new.b,new.c);
END;
CREATE TRIGGER trig4 AFTER UPDATE ON t1 BEGIN
INSERT INTO log VALUES('after', old.a,old.b,old.c, new.a,new.b,new.c);
END;
CREATE TRIGGER trig5 BEFORE DELETE ON t1 BEGIN
INSERT INTO log VALUES('before', old.a,old.b,old.c, NULL,NULL,NULL);
END;
CREATE TRIGGER trig6 AFTER DELETE ON t1 BEGIN
INSERT INTO log VALUES('after', old.a,old.b,old.c, NULL,NULL,NULL);
END;
INSERT INTO t1 VALUES('A', 'B', 'C');
SELECT * FROM log;
DELETE FROM log;
UPDATE t1 SET a = 'a';
SELECT * FROM log;
DELETE FROM log;
DELETE FROM t1;
SELECT * FROM log;
CREATE TABLE t4(a, b);
CREATE TRIGGER t4t AFTER DELETE ON t4 BEGIN
SELECT RAISE(ABORT, 'delete is not supported');
END;
CREATE TABLE t5 (a primary key, b, c);
INSERT INTO t5 values (1, 2, 3);
CREATE TRIGGER au_tbl AFTER UPDATE ON t5 BEGIN
UPDATE OR IGNORE t5 SET a = new.a, c = 10;
END;
CREATE TABLE t6(a INTEGER PRIMARY KEY, b);
INSERT INTO t6 VALUES(1, 2);
SELECT 1;
UPDATE t6 SET a=a;
DROP TABLE t1;
CREATE TABLE cnt(n);
INSERT INTO cnt VALUES(0);
CREATE TABLE t1(a INTEGER PRIMARY KEY, b UNIQUE, c, d, e);
CREATE INDEX t1cd ON t1(c,d);
CREATE TRIGGER t1r1 AFTER UPDATE ON t1 BEGIN UPDATE cnt SET n=n+1; END;
INSERT INTO t1 VALUES(1,2,3,4,5);
INSERT INTO t1 VALUES(6,7,8,9,10);
INSERT INTO t1 VALUES(11,12,13,14,15);
CREATE TABLE t2(a PRIMARY KEY);
CREATE TRIGGER t2_trig AFTER INSERT ON t2 WHEN (new.a>0) BEGIN
INSERT INTO t2 VALUES(new.a - 1);
END;
CREATE TRIGGER t2_trig AFTER INSERT ON t2 BEGIN
SELECT CASE WHEN new.a==2 THEN RAISE(IGNORE) ELSE NULL END;
INSERT INTO t2 VALUES(new.a - 1);
END;
CREATE TRIGGER t2_trig BEFORE INSERT ON t2 WHEN (new.a>0) BEGIN
INSERT INTO t2 VALUES(new.a - 1);
END;
CREATE TRIGGER t2_trig BEFORE INSERT ON t2 BEGIN
SELECT CASE WHEN new.a==2 THEN RAISE(IGNORE) ELSE NULL END;
INSERT INTO t2 VALUES(new.a - 1);
END;
CREATE TRIGGER t2_trig BEFORE INSERT ON t2 BEGIN
INSERT INTO t2 VALUES(new.a - 1);
END;
CREATE TRIGGER t2_trig AFTER INSERT ON t2 WHEN (new.a>0) BEGIN
INSERT OR IGNORE INTO t2 VALUES(new.a);
END;
CREATE TRIGGER t2_trig BEFORE INSERT ON t2 WHEN (new.a>0) BEGIN
INSERT OR IGNORE INTO t2 VALUES(new.a);
END;
INSERT INTO t2 VALUES(10);
SELECT * FROM t2 ORDER BY rowid;
CREATE TABLE t22(x);
CREATE TRIGGER t22a AFTER INSERT ON t22 BEGIN
INSERT INTO t22 SELECT x + (SELECT max(x) FROM t22) FROM t22;
END;
CREATE TRIGGER t22b BEFORE INSERT ON t22 BEGIN
SELECT CASE WHEN (SELECT count(*) FROM t22) >= [expr $SQLITE_MAX_TRIGGER_DEPTH / 2]
THEN RAISE(IGNORE)
ELSE NULL END;
END;
INSERT INTO t22 VALUES(1);
SELECT count(*) FROM t22;
CREATE TABLE t23(x PRIMARY KEY);
CREATE TRIGGER t23a AFTER INSERT ON t23 BEGIN
INSERT INTO t23 VALUES(new.x + 1);
END;
CREATE TRIGGER t23b BEFORE INSERT ON t23 BEGIN
SELECT CASE WHEN new.x>[expr $SQLITE_MAX_TRIGGER_DEPTH / 2]
THEN RAISE(IGNORE)
ELSE NULL END;
END;
INSERT INTO t23 VALUES(1);
SELECT count(*) FROM t23;
CREATE TABLE t3(a, b);
CREATE TRIGGER t3i AFTER INSERT ON t3 BEGIN
DELETE FROM t3 WHERE rowid = new.rowid;
END;
CREATE TRIGGER t3d AFTER DELETE ON t3 BEGIN
INSERT INTO t3 VALUES(old.a, old.b);
END;
CREATE TABLE t3b(x);
CREATE TRIGGER t3bi AFTER INSERT ON t3b WHEN new.x<[expr $SQLITE_MAX_TRIGGER_DEPTH * 2] BEGIN
INSERT INTO t3b VALUES(new.x+1);
END;
INSERT INTO t3b VALUES(1);
INSERT INTO t3b VALUES([expr $SQLITE_MAX_TRIGGER_DEPTH + 1]);
DELETE FROM t3b;
INSERT INTO t3b VALUES([expr $SQLITE_MAX_TRIGGER_DEPTH - 1]);
INSERT INTO t3b VALUES([expr ($SQLITE_MAX_TRIGGER_DEPTH * 2) - ($SQLITE_MAX_TRIGGER_DEPTH / 10) + 1]);
DELETE FROM t3b;
INSERT INTO t3b VALUES([expr ($SQLITE_MAX_TRIGGER_DEPTH * 2) - ($SQLITE_MAX_TRIGGER_DEPTH / 10)]);
INSERT INTO t3b VALUES([expr $SQLITE_MAX_TRIGGER_DEPTH * 2]);
DELETE FROM t3b;
INSERT INTO t3b VALUES([expr ($SQLITE_MAX_TRIGGER_DEPTH * 2) - 1]);
CREATE TABLE log(t);
CREATE TABLE t4(a TEXT,b INTEGER,c REAL);
CREATE TRIGGER t4bi BEFORE INSERT ON t4 BEGIN
INSERT INTO log VALUES(new.rowid || ' ' || typeof(new.rowid) || ' ' ||;
END;
CREATE TRIGGER t4ai AFTER INSERT ON t4 BEGIN
INSERT INTO log VALUES(new.rowid || ' ' || typeof(new.rowid) || ' ' ||;
END;
CREATE TRIGGER t4bd BEFORE DELETE ON t4 BEGIN
INSERT INTO log VALUES(old.rowid || ' ' || typeof(old.rowid) || ' ' ||;
END;
CREATE TRIGGER t4ad AFTER DELETE ON t4 BEGIN
INSERT INTO log VALUES(old.rowid || ' ' || typeof(old.rowid) || ' ' ||;
END;
CREATE TRIGGER t4bu BEFORE UPDATE ON t4 BEGIN
INSERT INTO log VALUES(old.rowid || ' ' || typeof(old.rowid) || ' ' ||;
INSERT INTO log VALUES(new.rowid || ' ' || typeof(new.rowid) || ' ' ||;
END;
CREATE TRIGGER t4au AFTER UPDATE ON t4 BEGIN
INSERT INTO log VALUES(old.rowid || ' ' || typeof(old.rowid) || ' ' ||;
INSERT INTO log VALUES(new.rowid || ' ' || typeof(new.rowid) || ' ' ||;
END;
INSERT INTO t4 VALUES('1', '1', '1');
DELETE FROM t4;
INSERT INTO t4(rowid,a,b,c) VALUES(45, 45, 45, 45);
DELETE FROM t4;
INSERT INTO t4(rowid,a,b,c) VALUES(-42.0, -42.0, -42.0, -42.0);
DELETE FROM t4;
INSERT INTO t4(rowid,a,b,c) VALUES(NULL, -42.4, -42.4, -42.4);
DELETE FROM t4;
INSERT INTO t4 VALUES(7, 7, 7);
UPDATE t4 SET a=8, b=8, c=8;
UPDATE t4 SET rowid=2;
UPDATE t4 SET a='9', b='9', c='9';
UPDATE t4 SET a='9.1', b='9.1', c='9.1';
DELETE FROM log;
SELECT * FROM log ORDER BY rowid;
DROP TABLE IF EXISTS t5;
CREATE TABLE t5(a INTEGER PRIMARY KEY, b);
CREATE UNIQUE INDEX t5i ON t5(b);
INSERT INTO t5 VALUES(1, 'a');
INSERT INTO t5 VALUES(2, 'b');
INSERT INTO t5 VALUES(3, 'c');
CREATE TABLE t5g(a, b, c);
CREATE TRIGGER t5t BEFORE DELETE ON t5 BEGIN
INSERT INTO t5g VALUES(old.a, old.b, (SELECT count(*) FROM t5));
END;
BEGIN;
SELECT * FROM t5g ORDER BY rowid;
SELECT * FROM t5 ORDER BY rowid;
ROLLBACK;
DROP TRIGGER t5t;
CREATE TRIGGER t5t AFTER DELETE ON t5 BEGIN
INSERT INTO t5g VALUES(old.a, old.b, (SELECT count(*) FROM t5));
END;
BEGIN;
SELECT * FROM t5g ORDER BY rowid;
SELECT * FROM t5 ORDER BY rowid;
ROLLBACK;
BEGIN;
SELECT * FROM t5g ORDER BY rowid;
SELECT * FROM t5 ORDER BY rowid;
ROLLBACK;
PRAGMA recursive_triggers = off;
PRAGMA recursive_triggers;
PRAGMA recursive_triggers = on;
PRAGMA recursive_triggers;
CREATE TABLE t8(x);
CREATE TABLE t7(a, b);
INSERT INTO t7 VALUES(1, 2);
INSERT INTO t7 VALUES(3, 4);
INSERT INTO t7 VALUES(5, 6);
CREATE TRIGGER t7t BEFORE UPDATE ON t7 BEGIN
DELETE FROM t7 WHERE a = 1;
END;
CREATE TRIGGER t7ta AFTER UPDATE ON t7 BEGIN
INSERT INTO t8 VALUES('after fired ' || old.rowid || '->' || new.rowid);
END;
BEGIN;
UPDATE t7 SET b=7 WHERE a = 5;
SELECT * FROM t7;
SELECT * FROM t8;
ROLLBACK;
BEGIN;
UPDATE t7 SET b=7 WHERE a = 1;
SELECT * FROM t7;
SELECT * FROM t8;
ROLLBACK;
DROP TRIGGER t7t;
CREATE TRIGGER t7t BEFORE UPDATE ON t7 WHEN (old.rowid!=1 OR new.rowid!=8)
BEGIN
UPDATE t7 set rowid = 8 WHERE rowid=1;
END;
BEGIN;
UPDATE t7 SET b=7 WHERE a = 5;
SELECT rowid, * FROM t7;
SELECT * FROM t8;
ROLLBACK;
BEGIN;
UPDATE t7 SET b=7 WHERE a = 1;
SELECT rowid, * FROM t7;
SELECT * FROM t8;
ROLLBACK;
DROP TRIGGER t7t;
DROP TRIGGER t7ta;
CREATE TRIGGER t7t BEFORE DELETE ON t7 BEGIN
UPDATE t7 set rowid = 8 WHERE rowid=1;
END;
CREATE TRIGGER t7ta AFTER DELETE ON t7 BEGIN
INSERT INTO t8 VALUES('after fired ' || old.rowid);
END;
BEGIN;
DELETE FROM t7 WHERE a = 3;
SELECT rowid, * FROM t7;
SELECT * FROM t8;
ROLLBACK;
BEGIN;
DELETE FROM t7 WHERE a = 1;
SELECT rowid, * FROM t7;
SELECT * FROM t8;
ROLLBACK;
CREATE TABLE t9(a,b);
CREATE INDEX t9b ON t9(b);
INSERT INTO t9 VALUES(1,0);
INSERT INTO t9 VALUES(2,1);
INSERT INTO t9 VALUES(3,2);
INSERT INTO t9 SELECT a+3, a+2 FROM t9;
INSERT INTO t9 SELECT a+6, a+5 FROM t9;
SELECT a FROM t9 ORDER BY a;
CREATE TRIGGER t9r1 AFTER DELETE ON t9 BEGIN
DELETE FROM t9 WHERE b=old.a;
END;
DELETE FROM t9 WHERE b=4;
SELECT a FROM t9 ORDER BY a;
CREATE TABLE t10(a, updatecnt DEFAULT 0);
CREATE TRIGGER t10_bu BEFORE UPDATE OF a ON t10 BEGIN
UPDATE t10 SET updatecnt = updatecnt+1 WHERE rowid = old.rowid;
END;
INSERT INTO t10(a) VALUES('hello');
UPDATE t10 SET a = 'world';
SELECT * FROM t10;
UPDATE t10 SET a = 'tcl', updatecnt = 5;
SELECT * FROM t10;
CREATE TABLE t11(;
CREATE TRIGGER t11_bu BEFORE UPDATE OF c1 ON t11 BEGIN
UPDATE t11 SET c31 = c31+1, c32=c32+1 WHERE rowid = old.rowid;
END;
INSERT INTO t11 VALUES(;
UPDATE t11 SET c4=35, c33=22, c1=5;
SELECT * FROM t11;
CREATE TRIGGER tt1 BEFORE INSERT ON t1 BEGIN
INSERT INTO log VALUES(new.a, new.b);
END;
INSERT INTO t1 DEFAULT VALUES;
SELECT * FROM log;
CREATE TRIGGER tt2 AFTER INSERT ON t1 BEGIN
INSERT INTO log VALUES(new.a, new.b);
END;
INSERT INTO t1 DEFAULT VALUES;
SELECT * FROM log;
INSERT INTO t1 DEFAULT VALUES;
SELECT * FROM log;
DELETE FROM log;
CREATE TABLE t2(a, b);
CREATE VIEW v2 AS SELECT * FROM t2;
CREATE TRIGGER tv2 INSTEAD OF INSERT ON v2 BEGIN
INSERT INTO log VALUES(new.a, new.b);
END;
INSERT INTO v2 DEFAULT VALUES;
SELECT a, b, a IS NULL, b IS NULL FROM log;
CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 2);
INSERT INTO t1 VALUES(3, 4);
INSERT INTO t1 VALUES(5, 6);
CREATE TRIGGER tr1 AFTER INSERT ON t1 BEGIN SELECT 1 ; END ;
SELECT count(*) FROM sqlite_master;
PRAGMA recursive_triggers = ON;
CREATE TABLE t12(a, b);
INSERT INTO t12 VALUES(1, 2);
CREATE TRIGGER tr12 AFTER UPDATE ON t12 BEGIN
UPDATE t12 SET a=new.a+1, b=new.b+1;
END;
UPDATE t12 SET a=a+1, b=b+1;
CREATE TABLE t1(a, b, c);
CREATE INDEX i1 ON t1(a, c);
CREATE INDEX i2 ON t1(b, c);
INSERT INTO t1 VALUES(1, 2, 3);
CREATE TABLE t2(e, f);
CREATE INDEX i3 ON t2(e);
INSERT INTO t2 VALUES(1234567, 3);
CREATE TABLE empty(x);
CREATE TABLE not_empty(x);
INSERT INTO not_empty VALUES(2);
CREATE TABLE t4(x);
CREATE TABLE t5(g, h, i);
CREATE TRIGGER trig BEFORE INSERT ON t4 BEGIN
INSERT INTO t5 SELECT * FROM t1 WHERE;
AND c IN (SELECT f FROM t2 WHERE e=1234567);
END;
INSERT INTO t4 VALUES(0);
SELECT * FROM t5;
PRAGMA recursive_triggers = 1;
CREATE TABLE node(;
CREATE TRIGGER node_delete_referencing AFTER DELETE ON "node"
BEGIN
DELETE FROM "node" WHERE pid = old."id";
END;
INSERT INTO node(id, pid, key) VALUES(9, 0, 'test');
INSERT INTO node(id, pid, key) VALUES(90, 9, 'test1');
INSERT INTO node(id, pid, key) VALUES(900, 90, 'test2');
DELETE FROM node WHERE id=9;
SELECT * FROM node;
CREATE TABLE   x1  (x);
CREATE TABLE   x2  (a, b);
CREATE TABLE '"x2"'(a, b);
INSERT INTO x2 VALUES(1, 2);
INSERT INTO x2 VALUES(3, 4);
INSERT INTO '"x2"' SELECT * FROM x2;
CREATE TRIGGER x1ai AFTER INSERT ON x1 BEGIN
INSERT INTO """x2""" VALUES('x', 'y');
DELETE FROM """x2""" WHERE a=1;
UPDATE """x2""" SET b = 11 WHERE a = 3;
END;
INSERT INTO x1 VALUES('go!');
