PRAGMA auto_vacuum=0;
PRAGMA page_size=4096;
PRAGMA journal_mode=WAL;
CREATE TABLE t1(a,b);
WITH RECURSIVE c(x) AS (VALUES(1) UNION ALL SELECT x+1 FROM c WHERE x<100)
INSERT INTO t1(a,b) SELECT x, printf('%d-x%.*c',x,x,'x') FROM c;
PRAGMA integrity_check;
SELECT pgno, quote(substr(data,1,5)) FROM sqlite_dbpage('main') ORDER BY pgno;
SELECT pgno, quote(substr(data,1,5)) FROM sqlite_dbpage WHERE pgno=2;
SELECT pgno, quote(substr(data,1,5)) FROM sqlite_dbpage WHERE pgno=4;
SELECT pgno, quote(substr(data,1,5)) FROM sqlite_dbpage WHERE pgno=5;
SELECT pgno, quote(substr(data,1,5)) FROM sqlite_dbpage WHERE pgno=0;
CREATE TEMP TABLE saved_content(x);
INSERT INTO saved_content(x) SELECT data FROM sqlite_dbpage WHERE pgno=4;
UPDATE sqlite_dbpage SET data=zeroblob(4096) WHERE pgno=4;
PRAGMA integrity_check;
SELECT pgno, quote(substr(data,1,5)) FROM sqlite_dbpage('main') ORDER BY pgno;
UPDATE sqlite_dbpage SET data=(SELECT x FROM saved_content) WHERE pgno=4;
PRAGMA integrity_check;
