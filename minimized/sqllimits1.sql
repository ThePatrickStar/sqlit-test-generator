CREATE TABLE t4(x);
INSERT INTO t4 VALUES(1);
INSERT INTO t4 VALUES(2);
INSERT INTO t4 SELECT 2+x FROM t4;
SELECT group_concat(hex(randomblob(20000))) FROM t4;
AND   1  ==  1";
AND   1  ==  1";
PRAGMA max_page_count = 1000;
CREATE TRIGGER update_b BEFORE UPDATE ON trig
FOR EACH ROW BEGIN
INSERT INTO trig VALUES (65, 'update_b');
END;
CREATE TRIGGER update_a AFTER UPDATE ON trig
FOR EACH ROW BEGIN
INSERT INTO trig VALUES (65, 'update_a');
END;
CREATE TRIGGER insert_b BEFORE INSERT ON trig
FOR EACH ROW BEGIN
UPDATE trig SET a = 1;
END;
CREATE TRIGGER insert_a AFTER INSERT ON trig
FOR EACH ROW BEGIN
UPDATE trig SET a = 1;
END;
INSERT INTO trig VALUES (1,1);
SELECT COUNT(*) FROM trig;
INSERT INTO trig VALUES (1,10);
SELECT COUNT(*) FROM trig;
PRAGMA max_page_count = 1000000;
CREATE TABLE abc(a, b, c);
INSERT INTO abc VALUES(1, 2, 3);
INSERT INTO abc SELECT a||b||c, b||c||a, c||a||b FROM abc;
INSERT INTO abc SELECT a||b||c, b||c||a, c||a||b FROM abc;
INSERT INTO abc SELECT a||b||c, b||c||a, c||a||b FROM abc;
INSERT INTO abc SELECT a||b||c, b||c||a, c||a||b FROM abc;
INSERT INTO abc SELECT a||b||c, b||c||a, c||a||b FROM abc;
INSERT INTO abc SELECT a||b||c, b||c||a, c||a||b FROM abc;
INSERT INTO abc SELECT a||b||c, b||c||a, c||a||b FROM abc;
INSERT INTO abc SELECT a||b||c, b||c||a, c||a||b FROM abc;
INSERT INTO abc SELECT a, b, c FROM abc;
INSERT INTO abc SELECT b, a, c FROM abc;
INSERT INTO abc SELECT c, b, a FROM abc;
PRAGMA max_page_count = 1000;
SELECT count(*) FROM sqlite_master;
PRAGMA max_page_count;
DROP TABLE abc;
SELECT $expr;
PRAGMA max_page_count = 1000000;  -- 1 GB
CREATE TABLE v0(a);
INSERT INTO v0 VALUES(1);
CREATE VIEW v${i} AS SELECT $expr FROM v[expr {1-1}];
SELECT a FROM v199;
SELECT $::string LIKE $::pattern;
SELECT $::string LIKE $::pattern;
SELECT strftime($::format, 1);
SELECT *,*,*,*,*,*,*,* FROM (
SELECT *,*,*,*,*,*,*,* FROM (
SELECT *,*,*,*,*,*,*,* FROM (
SELECT *,*,*,*,*,*,*,* FROM (
SELECT *,*,*,*,*,*,*,* FROM (
SELECT 1,2,3,4,5,6,7,8,9,10;
