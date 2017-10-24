PRAGMA encoding='UTF-16';
CREATE TABLE t1(a);
INSERT INTO t1
VALUES('0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ');
SELECT lower(a), upper(a), quote(a), trim(a), trim('x',a) FROM t1;
PRAGMA encoding='UTF-16';
CREATE TABLE t1(a);
INSERT INTO t1
VALUES('0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ');
SELECT replace(a,'x','y'), replace('x',a,'y'), replace('x','y',a)
FROM t1;
PRAGMA encoding='UTF-16';
CREATE TABLE t1(a);
INSERT INTO t1
VALUES('0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ');
SELECT length(a), substr(a, 4, 4) FROM t1;
PRAGMA encoding='UTF-16';
CREATE TABLE t1(a);
INSERT INTO t1
VALUES('0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ');
SELECT julianday(a,a) FROM t1;
PRAGMA encoding='UTF-16';
CREATE TABLE t1(a);
INSERT INTO t1
VALUES('0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ');
SELECT 1 FROM t1 WHERE a LIKE 'hello' ESCAPE NULL;
PRAGMA encoding='UTF-16';
CREATE TABLE t1(a);
INSERT INTO t1
VALUES('0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ');
SELECT hex(randomblob(100));
