CREATE TABLE xyz(one, two, thr, fou);
INSERT INTO xyz VALUES('A', 'A', 'A',  1);
INSERT INTO xyz VALUES('B', 'B', 'B',  2);
INSERT INTO xyz VALUES('C', 'C', 'C',  3);
INSERT INTO xyz VALUES('D', 'D', 'D',  4);
CREATE UNIQUE INDEX xyz_one_two ON xyz(one, two);
SELECT fou FROM xyz
WHERE (one, two, thr) IN (SELECT one, two, thr FROM xyz);
SELECT fou FROM xyz
WHERE (one, two, thr) BETWEEN ('B', 'B', 'B') AND ('C', 'C', 'C') };
