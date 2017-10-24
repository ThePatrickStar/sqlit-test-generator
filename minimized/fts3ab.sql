CREATE VIRTUAL TABLE t1 USING fts3(english,spanish,german);
CREATE VIRTUAL TABLE t2 USING fts3(from,to);
INSERT INTO t2([from],[to]) VALUES ('one two three', 'four five six');
SELECT [from], [to] FROM t2;
CREATE VIRTUAL TABLE t4 USING fts3([norm],'plusone',"invert");
