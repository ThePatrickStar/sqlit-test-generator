CREATE TABLE t1(a VARINT, b BLOB, c VARCHAR(16));
INSERT INTO t1 VALUES(1, 2, 3);
INSERT INTO t1 VALUES('one', 'two', NULL);
INSERT INTO t1 VALUES(1.2, 1.3, 1.4);
SELECT * FROM sqlite_master;
CREATE TABLE t1(a);
PRAGMA writable_schema=ON;
INSERT INTO sqlite_master VALUES(NULL,NULL,NULL,NULL,NULL);
SELECT * FROM sqlite_master;
CREATE TABLE t1(a);
PRAGMA writable_schema=ON;
INSERT INTO sqlite_master VALUES('table',NULL,NULL,NULL,NULL);
SELECT * FROM sqlite_master;
SQLITE_OK         {not an error} \
SQLITE_ERROR      {SQL logic error} \
SQLITE_PERM       {access permission denied} \
SQLITE_ABORT      {query aborted} \
SQLITE_BUSY       {database is locked} \
SQLITE_LOCKED     {database table is locked} \
SQLITE_NOMEM      {out of memory} \
SQLITE_READONLY   {attempt to write a readonly database} \
SQLITE_INTERRUPT  {interrupted} \
SQLITE_IOERR      {disk I/O error} \
SQLITE_CORRUPT    {database disk image is malformed} \
SQLITE_FULL       {database or disk is full} \
SQLITE_CANTOPEN   {unable to open database file} \
SQLITE_SCHEMA     {database schema has changed} \
SQLITE_CONSTRAINT {constraint failed} \
SQLITE_MISMATCH   {datatype mismatch} \
SQLITE_MISUSE     {bad parameter or other API misuse} \
SQLITE_AUTH       {authorization denied} \
SQLITE_RANGE      {column index out of range} \
SQLITE_NOTADB     {file is not a database} \;
BEGIN;
CREATE TABLE t1(a, b);
INSERT INTO t1 VALUES(1, 'int');
INSERT INTO t1 VALUES(2, 'notatype');
COMMIT;
SELECT * FROM t1;
CREATE TABLE t2(a);
INSERT INTO t2 VALUES(1);
INSERT INTO t2 VALUES(2);
BEGIN;
INSERT INTO t2 VALUES(3);
ROLLBACK;
SELECT a FROM t2;
ROLLBACK;
SELECT a FROM t2;
BEGIN;
COMMIT;
BEGIN;
COMMIT;
COMMIT;
INSERT INTO t1 VALUES(3, NULL);
INSERT INTO t2 VALUES(4);
BEGIN;
INSERT INTO t1 VALUES(4, NULL);
COMMIT;
SELECT a FROM t1;
DELETE FROM t1;
SELECT * FROM t1;
CREATE TABLE t4(x);
INSERT INTO t4 VALUES('abcdefghij');
