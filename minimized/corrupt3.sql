PRAGMA auto_vacuum=OFF;
PRAGMA page_size=1024;
CREATE TABLE t1(x);
INSERT INTO t1 VALUES($bigstring);
SELECT x FROM t1;
SELECT substr(x,1,10) FROM t1;
PRAGMA integrity_check;
On tree page 2 cell 0: invalid page number 4
Page 3 is never used}}};
SELECT substr(x,1,10) FROM t1;
PRAGMA integrity_check;
On tree page 2 cell 0: 1 of 1 pages missing from overflow list starting at 0
Page 3 is never used}}}
