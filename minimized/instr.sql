SELECT coalesce(instr(NULL,'abc'), 999);
SELECT coalesce(instr('abc',NULL), 999);
SELECT coalesce(instr(NULL,NULL), 999);
SELECT instr(X'', 'abc');
CREATE TABLE x1(a, b);
INSERT INTO x1 VALUES(X'', 'abc');
SELECT instr(a, b) FROM x1;
