CREATE TABLE t1(a,b,c,d,e, PRIMARY KEY(a,b,c,d,e));
SELECT * FROM t1 WHERE a=? AND b=? AND c=? AND d=? AND e=?;
CREATE TABLE "a" (;
PRIMARY KEY ("b", "c");
CREATE TABLE "d" (;
PRIMARY KEY ("e", "g", "f", "h");
CREATE TABLE "d_to_a" (;
PRIMARY KEY ("f_e", "f_g", "f_f", "f_h", "t_b", "t_c");
INSERT INTO d (g, e, h, f, j, i) VALUES ( 1, 1, 1, 1, 1, 1 );
INSERT INTO a (b, c) VALUES ( 1, 1 );
INSERT INTO d_to_a VALUES (1, 1, 1, 1, 1, 1, 1, 1);
DELETE FROM d_to_a
WHERE f_g = 1 AND f_e = 1 AND f_h = 1 AND f_f = 1 AND t_b = 1 AND t_c = 1;
SELECT * FROM d_to_a;
