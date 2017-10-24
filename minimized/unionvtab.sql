ATTACH 'test.db2' AS aux;
CREATE TABLE t1(a INTEGER PRIMARY KEY, b TEXT);
CREATE TABLE t2(a INTEGER PRIMARY KEY, b TEXT);
CREATE TABLE aux.t3(a INTEGER PRIMARY KEY, b TEXT);
INSERT INTO t1 VALUES(1, 'one'), (2, 'two'), (3, 'three');
INSERT INTO t2 VALUES(10, 'ten'), (11, 'eleven'), (12, 'twelve');
INSERT INTO t3 VALUES(20, 'twenty'), (21, 'twenty-one'), (22, 'twenty-two');
CREATE VIRTUAL TABLE temp.uuu USING unionvtab(;
SELECT * FROM uuu;
PRAGMA table_info(uuu);
SELECT * FROM uuu WHERE rowid = 3;
SELECT * FROM uuu WHERE rowid = 11;
SELECT * FROM uuu WHERE rowid IN (12, 10, 2);
SELECT * FROM uuu WHERE rowid BETWEEN 3 AND 11;
SELECT * FROM uuu WHERE rowid BETWEEN 11 AND 15;
SELECT * FROM uuu WHERE rowid BETWEEN -46 AND 1500;
CREATE TABLE src(db, tbl, min, max);
INSERT INTO src VALUES(NULL, 't1', 1, 9);
INSERT INTO src VALUES('main', 't2', 10, 19);
INSERT INTO src VALUES('aux', 't3', 20, 29);
CREATE VIRTUAL TABLE temp.opp USING unionvtab(src);
SELECT * FROM opp;
CREATE VIRTUAL TABLE temp.qll USING unionvtab(;
SELECT * FROM qll WHERE rowid BETWEEN 10 AND 21;
CREATE VIRTUAL TABLE u1 USING unionvtab("VALUES(NULL, 't1', 1, 100)");
CREATE VIRTUAL TABLE main.u1 USING unionvtab("VALUES('', 't1', 1, 100)");
CREATE VIRTUAL TABLE aux.u1 USING unionvtab("VALUES('', 't1', 1, 100)");
CREATE VIRTUAL TABLE temp.u1 USING unionvtab("VALUES(NULL, 't555', 1, 100)");
CREATE VIRTUAL TABLE temp.u1 USING unionvtab("VALUES('aux', 't555', 1, 100)");
CREATE VIRTUAL TABLE temp.u1 USING unionvtab("VALUES('xua', 't555', 1, 100)");
CREATE TABLE wr1(a, b, c PRIMARY KEY) WITHOUT ROWID;
CREATE VIEW v1 AS SELECT * FROM t1;
CREATE VIEW v2 AS SELECT _rowid_, * FROM t1;
CREATE TABLE wr2(a, _rowid_ INTEGER, c PRIMARY KEY) WITHOUT ROWID;
CREATE TABLE wr3(a, b, _rowid_ PRIMARY KEY) WITHOUT ROWID;
CREATE VIRTUAL TABLE temp.u1 USING unionvtab("VALUES('main', 'wr1', 1, 2)");
CREATE VIRTUAL TABLE temp.u1 USING unionvtab("VALUES(NULL, 'v1', 1, 2)");
CREATE VIRTUAL TABLE temp.u1 USING unionvtab("VALUES(NULL, 'v2', 1, 2)");
CREATE VIRTUAL TABLE temp.u1 USING unionvtab("VALUES(NULL, 'wr2', 1, 2)");
CREATE VIRTUAL TABLE temp.u1 USING unionvtab("VALUES(NULL, 'wr3', 1, 2)");
CREATE TABLE x1(a BLOB, b);
CREATE TABLE x2(a BLOB, b);
CREATE TEMP TABLE x3(a BLOB, b);
CREATE TABLE aux.y1(one, two, three INTEGER PRIMARY KEY);
CREATE TEMP TABLE y2(one, two, three INTEGER PRIMARY KEY);
CREATE TABLE y3(one, two, three INTEGER PRIMARY KEY);
DROP TABLE IF EXISTS temp.a1;
CREATE VIRTUAL TABLE temp.a1 USING unionvtab(\"VALUES [join $L ,]\");
CREATE VIRTUAL TABLE temp.b1 USING unionvtab(;
CREATE VIRTUAL TABLE temp.a1 USING unionvtab(`$sql`);
CREATE VIRTUAL TABLE temp.b1 USING unionvtab(1, 2, 3, 4);
CREATE TABLE tbl1(a INTEGER PRIMARY KEY, b);
CREATE TABLE tbl2(a INTEGER PRIMARY KEY, b);
CREATE TABLE tbl3(a INTEGER PRIMARY KEY, b);
WITH ss(ii) AS ( SELECT 1 UNION ALL SELECT ii+1 FROM ss WHERE ii<100 )
INSERT INTO tbl1 SELECT ii, '1.' || ii FROM ss;
WITH ss(ii) AS ( SELECT 1 UNION ALL SELECT ii+1 FROM ss WHERE ii<100 )
INSERT INTO tbl2 SELECT ii, '2.' || ii FROM ss;
WITH ss(ii) AS ( SELECT 1 UNION ALL SELECT ii+1 FROM ss WHERE ii<100 )
INSERT INTO tbl3 SELECT ii, '3.' || ii FROM ss;
CREATE VIRTUAL TABLE temp.uu USING unionvtab(;
SELECT * FROM uu WHERE rowid = 10;
SELECT * FROM uu WHERE rowid = 25;
CREATE TABLE s1(k INTEGER PRIMARY KEY, v);
INSERT INTO s1 VALUES($S, 'one');
INSERT INTO s1 VALUES($S+1, 'two');
INSERT INTO s1 VALUES($S+2, 'three');
CREATE TABLE l1(k INTEGER PRIMARY KEY, v);
INSERT INTO l1 VALUES($L, 'six');
INSERT INTO l1 VALUES($L-1, 'five');
INSERT INTO l1 VALUES($L-2, 'four');
CREATE VIRTUAL TABLE temp.sl USING unionvtab(;
UNION ALL
SELECT NULL, 's1', -9223372036854775808, -1";
SELECT * FROM sl;
SELECT * FROM sl WHERE rowid>-9223372036854775808;
SELECT * FROM sl WHERE rowid>=-9223372036854775808;
SELECT * FROM sl WHERE rowid<=-9223372036854775808;
SELECT * FROM sl WHERE rowid<-9223372036854775808;
SELECT * FROM sl WHERE rowid<9223372036854775807;
SELECT * FROM sl WHERE rowid<=9223372036854775807;
SELECT * FROM sl WHERE rowid>=9223372036854775807;
SELECT * FROM sl WHERE rowid>9223372036854775807;
CREATE TABLE c0(one, two INTEGER PRIMARY KEY);
CREATE TABLE c1(one, two INTEGER PRIMARY KEY);
CREATE TABLE c2(one, two INTEGER PRIMARY KEY);
CREATE TABLE c3(one, two INTEGER PRIMARY KEY);
CREATE TABLE c4(one, two INTEGER PRIMARY KEY);
CREATE TABLE c5(one, two INTEGER PRIMARY KEY);
CREATE TABLE c6(one, two INTEGER PRIMARY KEY);
CREATE TABLE c7(one, two INTEGER PRIMARY KEY);
CREATE TABLE c8(one, two INTEGER PRIMARY KEY);
CREATE TABLE c9(one, two INTEGER PRIMARY KEY);
INSERT INTO c0 VALUES('zero', 0);
INSERT INTO c1 VALUES('one', 1);
INSERT INTO c2 VALUES('two', 2);
INSERT INTO c3 VALUES('three', 3);
INSERT INTO c4 VALUES('four', 4);
INSERT INTO c5 VALUES('five', 5);
INSERT INTO c6 VALUES('six', 6);
INSERT INTO c7 VALUES('seven', 7);
INSERT INTO c8 VALUES('eight', 8);
INSERT INTO c9 VALUES('nine', 9);
CREATE VIRTUAL TABLE temp.cc USING unionvtab([
SELECT 'main', 'c9', 9, 9 UNION ALL
SELECT 'main', 'c8', 8, 8 UNION ALL
SELECT 'main', 'c7', 7, 7 UNION ALL
SELECT 'main', 'c6', 6, 6 UNION ALL
SELECT 'main', 'c5', 5, 5 UNION ALL
SELECT 'main', 'c4', 4, 4 UNION ALL
SELECT 'main', 'c3', 3, 3 UNION ALL
SELECT 'main', 'c2', 2, 2 UNION ALL
SELECT 'main', 'c1', 1, 1 UNION ALL
SELECT 'main', 'c0', 0, 0;
SELECT sum(two) FROM cc;
SELECT one FROM cc WHERE one>='seven';
SELECT y.one FROM cc AS x, cc AS y WHERE x.one=y.one AND x.rowid>5;
SELECT cc.one FROM c4, cc WHERE cc.rowid>c4.rowid;
SELECT * FROM cc WHERE two LIKE '6';
