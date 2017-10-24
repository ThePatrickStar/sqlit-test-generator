CREATE TABLE a1(a, b);
CREATE TABLE a2(a, b, c DEFAULT 'xyz');
CREATE TABLE a3(x DEFAULT 1.0, y DEFAULT 'string', z);
CREATE TABLE a4(c UNIQUE, d);
INSERT INTO a1 VALUES('x', 'y');
S  "SELECT * FROM a1" {;
INSERT INTO a4 VALUES(1, 'a');
INSERT INTO a4 VALUES(2, 'a');
INSERT INTO a4 VALUES(3, 'a');
CREATE TRIGGER AFTER UPDATE ON a1 BEGIN
INSERT INTO main.a4 VALUES(new.a, new.b);
END;
CREATE TEMP TABLE IF NOT EXISTS tmptable(a, b);
CREATE TRIGGER AFTER DELETE ON a3 BEGIN
INSERT INTO temp.tmptable VALUES(1, 2);
END;
CREATE TRIGGER AFTER UPDATE ON a1 BEGIN
INSERT INTO a4 DEFAULT VALUES;
END;
