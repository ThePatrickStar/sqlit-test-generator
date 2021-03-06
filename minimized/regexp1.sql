CREATE TABLE t1(x INTEGER PRIMARY KEY, y TEXT);
INSERT INTO t1 VALUES(1, 'For since by man came death,');
INSERT INTO t1 VALUES(2, 'by man came also the resurrection of the dead.');
INSERT INTO t1 VALUES(3, 'For as in Adam all die,');
INSERT INTO t1 VALUES(4, 'even so in Christ shall all be made alive.');
SELECT x FROM t1 WHERE y REGEXP '^For ' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'by|in' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'by|Christ' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'shal+ al+' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'shall x*y*z*all' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'shallx?y? ?z?all' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'r{2}' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'r{3}' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'r{1}' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'ur{2,10}e' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP '[Aa]dam' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP '[^Aa]dam' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP '[^b-zB-Z]dam' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'alive' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP '^alive' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'alive$' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'alive.$' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'alive\.$' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'ma[nd]' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP '\bma[nd]' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'ma[nd]\b' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'ma\w' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'ma\W' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP '\sma\w' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP '\Sma\w' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP 'alive\S$' ORDER BY x;
SELECT x FROM t1 WHERE y REGEXP;
SELECT 'aaaabbbbcccc' REGEXP 'ab*c',;
SELECT 'aaaabbbbcccc' REGEXP 'ab+c',;
SELECT 'aaaabbbbcccc' REGEXP 'ab?c',;
SELECT 'aaaabbbbbbcccc' REGEXP 'ab{3,5}c',;
SELECT 'aaaabbbbcccc' REGEXP 'a(a|b|c)+c',;
SELECT 'aaaabbbbcccc' REGEXP '^a(a|bb|c)+c$',;
SELECT 'aaaabbbbcccc' REGEXP '^a([ac]+|bb){3}c$',;
SELECT 'abc*def+ghi.jkl[mno]pqr' REGEXP 'c.d',;
SELECT 'abc\def' REGEXP '^abc\\def',;
SELECT 'abc$¢€xyz' REGEXP '^abc\u0024\u00a2\u20acxyz$',;
SELECT 'abc$¢€xyz' REGEXP '^abc[\u0024][\u00a2][\u20ac]xyz$',;
SELECT 'abc$¢€xyz' REGEXP '^abc[^\u0025-X][^ -\u007f][^\u20ab]xyz$';
