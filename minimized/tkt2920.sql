PRAGMA page_size=1024;
PRAGMA max_page_count=40;
PRAGMA auto_vacuum=0;
CREATE TABLE filler (fill);
INSERT INTO filler VALUES(randomblob(1024));
INSERT INTO filler VALUES(randomblob(2048));
INSERT INTO filler VALUES(randomblob(2048));
