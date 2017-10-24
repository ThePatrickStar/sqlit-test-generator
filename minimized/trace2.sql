SELECT 1, 2, 3;
SELECT sql('SELECT 1, 2, 3');
SELECT sql('SELECT 1,;
SELECT sql('SELECT 1,
SELECT $var, sql('SELECT 1,;
CREATE VIRTUAL TABLE x1 USING fts4;
INSERT INTO x1 VALUES('Cloudy, with a high near 16');
INSERT INTO x1 VALUES('Wind chill values as low as -13');
INSERT INTO x1 VALUES('North northwest wind between 8 and 14 mph');
INSERT INTO x1(x1) VALUES('optimize');
