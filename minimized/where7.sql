CREATE TABLE t1(a INTEGER PRIMARY KEY,b,c,d);
INSERT INTO t1 VALUES(1,2,3,4);
INSERT INTO t1 VALUES(2,3,4,5);
INSERT INTO t1 VALUES(3,4,6,8);
INSERT INTO t1 VALUES(4,5,10,15);
INSERT INTO t1 VALUES(5,10,100,1000);
CREATE INDEX t1b ON t1(b);
CREATE INDEX t1c ON t1(c);
SELECT * FROM t1;
CREATE TABLE t(a);
CREATE INDEX ta ON t(a);
INSERT INTO t(a) VALUES(1),(2);
SELECT * FROM t ORDER BY a;
SELECT * FROM t WHERE a<2 OR a<3 ORDER BY a;
PRAGMA count_changes=ON;
DELETE FROM t WHERE a<2 OR a<3;
SELECT * FROM t;
PRAGMA count_changes=OFF;
DROP TABLE t;
SELECT a FROM t1 WHERE b=3 OR c=6 ORDER BY a;
SELECT a FROM t1 WHERE b=3 OR +c=6 ORDER BY a;
SELECT a FROM t1 WHERE +b=3 OR c=6 ORDER BY 1;
SELECT a FROM t1 WHERE 3=b OR c=6 ORDER BY rowid;
SELECT a FROM t1 WHERE (3=b OR c=6) AND +a>0 ORDER BY a;
SELECT a FROM t1 WHERE (b=3 OR c>10);
SELECT a FROM t1 WHERE (b=3 OR c>=10);
SELECT a FROM t1 WHERE (b=3 OR c>=10 OR c=4);
SELECT a FROM t1 WHERE (b=3 OR c>=10 OR c=4 OR b>10);
SELECT a FROM t1 WHERE (d=5 AND b=3) OR c==100 ORDER BY a;
SELECT a FROM t1 WHERE (b BETWEEN 2 AND 4) OR c=100 ORDER BY a;
SELECT a FROM t1 WHERE (b BETWEEN 0 AND 2) OR (c BETWEEN 9 AND 999)
ORDER BY +a DESC;
SELECT a FROM t1 WHERE (d=8 OR c=6 OR b=4) AND +a>0;
SELECT a FROM t1 WHERE +a>=0 AND (d=8 OR c=6 OR b=4);
CREATE TABLE t2(a INTEGER PRIMARY KEY,b,c,d,e,f TEXT,g);
INSERT INTO t2 VALUES(1,11,1001,1.001,100.1,'bcdefghij','yxwvuts');
INSERT INTO t2 VALUES(2,22,1001,2.002,100.1,'cdefghijk','yxwvuts');
INSERT INTO t2 VALUES(3,33,1001,3.0029999999999997,100.1,'defghijkl','xwvutsr');
INSERT INTO t2 VALUES(4,44,2002,4.004,200.2,'efghijklm','xwvutsr');
INSERT INTO t2 VALUES(5,55,2002,5.004999999999999,200.2,'fghijklmn','xwvutsr');
INSERT INTO t2 VALUES(6,66,2002,6.005999999999999,200.2,'ghijklmno','xwvutsr');
INSERT INTO t2 VALUES(7,77,3003,7.007,300.29999999999995,'hijklmnop','xwvutsr');
INSERT INTO t2 VALUES(8,88,3003,8.008,300.29999999999995,'ijklmnopq','wvutsrq');
INSERT INTO t2 VALUES(9,99,3003,9.008999999999999,300.29999999999995,'jklmnopqr','wvutsrq');
INSERT INTO t2 VALUES(10,110,4004,10.009999999999998,400.4,'klmnopqrs','wvutsrq');
INSERT INTO t2 VALUES(11,121,4004,11.011,400.4,'lmnopqrst','wvutsrq');
INSERT INTO t2 VALUES(12,132,4004,12.011999999999999,400.4,'mnopqrstu','wvutsrq');
INSERT INTO t2 VALUES(13,143,5005,13.012999999999998,500.5,'nopqrstuv','vutsrqp');
INSERT INTO t2 VALUES(14,154,5005,14.014,500.5,'opqrstuvw','vutsrqp');
INSERT INTO t2 VALUES(15,165,5005,15.014999999999999,500.5,'pqrstuvwx','vutsrqp');
INSERT INTO t2 VALUES(16,176,6006,16.016,600.5999999999999,'qrstuvwxy','vutsrqp');
INSERT INTO t2 VALUES(17,187,6006,17.017,600.5999999999999,'rstuvwxyz','vutsrqp');
INSERT INTO t2 VALUES(18,198,6006,18.017999999999997,600.5999999999999,'stuvwxyza','utsrqpo');
INSERT INTO t2 VALUES(19,209,7007,19.019,700.6999999999999,'tuvwxyzab','utsrqpo');
INSERT INTO t2 VALUES(20,220,7007,20.019999999999996,700.6999999999999,'uvwxyzabc','utsrqpo');
INSERT INTO t2 VALUES(21,231,7007,21.020999999999997,700.6999999999999,'vwxyzabcd','utsrqpo');
INSERT INTO t2 VALUES(22,242,8008,22.022,800.8,'wxyzabcde','utsrqpo');
INSERT INTO t2 VALUES(23,253,8008,23.022999999999996,800.8,'xyzabcdef','tsrqpon');
INSERT INTO t2 VALUES(24,264,8008,24.023999999999997,800.8,'yzabcdefg','tsrqpon');
INSERT INTO t2 VALUES(25,275,9009,25.025,900.9,'zabcdefgh','tsrqpon');
INSERT INTO t2 VALUES(26,286,9009,26.025999999999996,900.9,'abcdefghi','tsrqpon');
INSERT INTO t2 VALUES(27,297,9009,27.026999999999997,900.9,'bcdefghij','tsrqpon');
INSERT INTO t2 VALUES(28,308,10010,28.028,1001.0,'cdefghijk','srqponm');
INSERT INTO t2 VALUES(29,319,10010,29.028999999999996,1001.0,'defghijkl','srqponm');
INSERT INTO t2 VALUES(30,330,10010,30.029999999999998,1001.0,'efghijklm','srqponm');
INSERT INTO t2 VALUES(31,341,11011,31.030999999999995,1101.1,'fghijklmn','srqponm');
INSERT INTO t2 VALUES(32,352,11011,32.032,1101.1,'ghijklmno','srqponm');
INSERT INTO t2 VALUES(33,363,11011,33.032999999999994,1101.1,'hijklmnop','rqponml');
INSERT INTO t2 VALUES(34,374,12012,34.034,1201.1999999999998,'ijklmnopq','rqponml');
INSERT INTO t2 VALUES(35,385,12012,35.035,1201.1999999999998,'jklmnopqr','rqponml');
INSERT INTO t2 VALUES(36,396,12012,36.035999999999994,1201.1999999999998,'klmnopqrs','rqponml');
INSERT INTO t2 VALUES(37,407,13013,37.037,1301.3,'lmnopqrst','rqponml');
INSERT INTO t2 VALUES(38,418,13013,38.038,1301.3,'mnopqrstu','qponmlk');
INSERT INTO t2 VALUES(39,429,13013,39.038999999999994,1301.3,'nopqrstuv','qponmlk');
INSERT INTO t2 VALUES(40,440,14014,40.03999999999999,1401.3999999999999,'opqrstuvw','qponmlk');
INSERT INTO t2 VALUES(41,451,14014,41.041,1401.3999999999999,'pqrstuvwx','qponmlk');
INSERT INTO t2 VALUES(42,462,14014,42.041999999999994,1401.3999999999999,'qrstuvwxy','qponmlk');
INSERT INTO t2 VALUES(43,473,15015,43.04299999999999,1501.5,'rstuvwxyz','ponmlkj');
INSERT INTO t2 VALUES(44,484,15015,44.044,1501.5,'stuvwxyza','ponmlkj');
INSERT INTO t2 VALUES(45,495,15015,45.044999999999995,1501.5,'tuvwxyzab','ponmlkj');
INSERT INTO t2 VALUES(46,506,16016,46.04599999999999,1601.6,'uvwxyzabc','ponmlkj');
INSERT INTO t2 VALUES(47,517,16016,47.047,1601.6,'vwxyzabcd','ponmlkj');
INSERT INTO t2 VALUES(48,528,16016,48.047999999999995,1601.6,'wxyzabcde','onmlkji');
INSERT INTO t2 VALUES(49,539,17017,49.04899999999999,1701.6999999999998,'xyzabcdef','onmlkji');
INSERT INTO t2 VALUES(50,550,17017,50.05,1701.6999999999998,'yzabcdefg','onmlkji');
INSERT INTO t2 VALUES(51,561,17017,51.050999999999995,1701.6999999999998,'zabcdefgh','onmlkji');
INSERT INTO t2 VALUES(52,572,18018,52.05199999999999,1801.8,'abcdefghi','onmlkji');
INSERT INTO t2 VALUES(53,583,18018,53.053,1801.8,'bcdefghij','nmlkjih');
INSERT INTO t2 VALUES(54,594,18018,54.053999999999995,1801.8,'cdefghijk','nmlkjih');
INSERT INTO t2 VALUES(55,605,19019,55.05499999999999,1901.8999999999999,'defghijkl','nmlkjih');
INSERT INTO t2 VALUES(56,616,19019,56.056,1901.8999999999999,'efghijklm','nmlkjih');
INSERT INTO t2 VALUES(57,627,19019,57.056999999999995,1901.8999999999999,'fghijklmn','nmlkjih');
INSERT INTO t2 VALUES(58,638,20020,58.05799999999999,2002.0,'ghijklmno','mlkjihg');
INSERT INTO t2 VALUES(59,649,20020,59.05899999999999,2002.0,'hijklmnop','mlkjihg');
INSERT INTO t2 VALUES(60,660,20020,60.059999999999995,2002.0,'ijklmnopq','mlkjihg');
INSERT INTO t2 VALUES(61,671,21021,61.06099999999999,2102.1,'jklmnopqr','mlkjihg');
INSERT INTO t2 VALUES(62,682,21021,62.06199999999999,2102.1,'klmnopqrs','mlkjihg');
INSERT INTO t2 VALUES(63,693,21021,63.062999999999995,2102.1,'lmnopqrst','lkjihgf');
INSERT INTO t2 VALUES(64,704,22022,64.064,2202.2,'mnopqrstu','lkjihgf');
INSERT INTO t2 VALUES(65,715,22022,65.065,2202.2,'nopqrstuv','lkjihgf');
INSERT INTO t2 VALUES(66,726,22022,66.06599999999999,2202.2,'opqrstuvw','lkjihgf');
INSERT INTO t2 VALUES(67,737,23023,67.067,2302.2999999999997,'pqrstuvwx','lkjihgf');
INSERT INTO t2 VALUES(68,748,23023,68.068,2302.2999999999997,'qrstuvwxy','kjihgfe');
INSERT INTO t2 VALUES(69,759,23023,69.06899999999999,2302.2999999999997,'rstuvwxyz','kjihgfe');
INSERT INTO t2 VALUES(70,770,24024,70.07,2402.3999999999996,'stuvwxyza','kjihgfe');
INSERT INTO t2 VALUES(71,781,24024,71.071,2402.3999999999996,'tuvwxyzab','kjihgfe');
INSERT INTO t2 VALUES(72,792,24024,72.07199999999999,2402.3999999999996,'uvwxyzabc','kjihgfe');
INSERT INTO t2 VALUES(73,803,25025,73.073,2502.5,'vwxyzabcd','jihgfed');
INSERT INTO t2 VALUES(74,814,25025,74.074,2502.5,'wxyzabcde','jihgfed');
INSERT INTO t2 VALUES(75,825,25025,75.07499999999999,2502.5,'xyzabcdef','jihgfed');
INSERT INTO t2 VALUES(76,836,26026,76.076,2602.6,'yzabcdefg','jihgfed');
INSERT INTO t2 VALUES(77,847,26026,77.077,2602.6,'zabcdefgh','jihgfed');
INSERT INTO t2 VALUES(78,858,26026,78.07799999999999,2602.6,'abcdefghi','ihgfedc');
INSERT INTO t2 VALUES(79,869,27027,79.079,2702.7,'bcdefghij','ihgfedc');
INSERT INTO t2 VALUES(80,880,27027,80.07999999999998,2702.7,'cdefghijk','ihgfedc');
INSERT INTO t2 VALUES(81,891,27027,81.08099999999999,2702.7,'defghijkl','ihgfedc');
INSERT INTO t2 VALUES(82,902,28028,82.082,2802.7999999999997,'efghijklm','ihgfedc');
INSERT INTO t2 VALUES(83,913,28028,83.08299999999998,2802.7999999999997,'fghijklmn','hgfedcb');
INSERT INTO t2 VALUES(84,924,28028,84.08399999999999,2802.7999999999997,'ghijklmno','hgfedcb');
INSERT INTO t2 VALUES(85,935,29029,85.085,2902.8999999999996,'hijklmnop','hgfedcb');
INSERT INTO t2 VALUES(86,946,29029,86.08599999999998,2902.8999999999996,'ijklmnopq','hgfedcb');
INSERT INTO t2 VALUES(87,957,29029,87.08699999999999,2902.8999999999996,'jklmnopqr','hgfedcb');
INSERT INTO t2 VALUES(88,968,30030,88.088,3003.0,'klmnopqrs','gfedcba');
INSERT INTO t2 VALUES(89,979,30030,89.08899999999998,3003.0,'lmnopqrst','gfedcba');
INSERT INTO t2 VALUES(90,990,30030,90.08999999999999,3003.0,'mnopqrstu','gfedcba');
INSERT INTO t2 VALUES(91,1001,31031,91.091,3103.1,'nopqrstuv','gfedcba');
INSERT INTO t2 VALUES(92,1012,31031,92.09199999999998,3103.1,'opqrstuvw','gfedcba');
INSERT INTO t2 VALUES(93,1023,31031,93.09299999999999,3103.1,'pqrstuvwx','fedcbaz');
INSERT INTO t2 VALUES(94,1034,32032,94.094,3203.2,'qrstuvwxy','fedcbaz');
INSERT INTO t2 VALUES(95,1045,32032,95.09499999999998,3203.2,'rstuvwxyz','fedcbaz');
INSERT INTO t2 VALUES(96,1056,32032,96.09599999999999,3203.2,'stuvwxyza','fedcbaz');
INSERT INTO t2 VALUES(97,1067,33033,97.097,3303.2999999999997,'tuvwxyzab','fedcbaz');
INSERT INTO t2 VALUES(98,1078,33033,98.09799999999998,3303.2999999999997,'uvwxyzabc','edcbazy');
INSERT INTO t2 VALUES(99,1089,33033,99.09899999999999,3303.2999999999997,'vwxyzabcd','edcbazy');
INSERT INTO t2 VALUES(100,1100,34034,100.1,3403.3999999999996,'wxyzabcde','edcbazy');
CREATE INDEX t2b ON t2(b);
CREATE INDEX t2c ON t2(c);
CREATE INDEX t2d ON t2(d);
CREATE INDEX t2e ON t2(e);
CREATE INDEX t2f ON t2(f);
CREATE INDEX t2g ON t2(g);
CREATE TABLE t3(a INTEGER PRIMARY KEY,b,c,d,e,f TEXT,g);
INSERT INTO t3 SELECT * FROM t2;
CREATE INDEX t3b ON t3(b,c);
CREATE INDEX t3c ON t3(c,e);
CREATE INDEX t3d ON t3(d,g);
CREATE INDEX t3e ON t3(e,f,g);
CREATE INDEX t3f ON t3(f,b,d,c);
CREATE INDEX t3g ON t3(g,f);
SELECT a FROM t2
WHERE b=1070
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR (f GLOB '?hijk*' AND f GLOB 'ghij*');
SELECT a FROM t3
WHERE b=1070
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR (f GLOB '?hijk*' AND f GLOB 'ghij*');
SELECT a FROM t2
WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR b=220
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR (g='qponmlk' AND f GLOB 'pqrst*');
SELECT a FROM t3
WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR b=220
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR (g='qponmlk' AND f GLOB 'pqrst*');
SELECT a FROM t2
WHERE b=190
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR (g='rqponml' AND f GLOB 'hijkl*')
OR b=407;
SELECT a FROM t3
WHERE b=190
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR (g='rqponml' AND f GLOB 'hijkl*')
OR b=407;
SELECT a FROM t2
WHERE (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=795
OR b=1103
OR b=583;
SELECT a FROM t3
WHERE (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=795
OR b=1103
OR b=583;
SELECT a FROM t2
WHERE a=74
OR a=50
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR c=21021
OR ((a BETWEEN 82 AND 84) AND a!=83);
SELECT a FROM t3
WHERE a=74
OR a=50
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR c=21021
OR ((a BETWEEN 82 AND 84) AND a!=83);
SELECT a FROM t2
WHERE ((a BETWEEN 8 AND 10) AND a!=9)
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR c=14014
OR b=828;
SELECT a FROM t3
WHERE ((a BETWEEN 8 AND 10) AND a!=9)
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR c=14014
OR b=828;
SELECT a FROM t2
WHERE 1000000<b
OR b=308;
SELECT a FROM t3
WHERE 1000000<b
OR b=308;
SELECT a FROM t2
WHERE b=949
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR a=63;
SELECT a FROM t3
WHERE b=949
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR a=63;
SELECT a FROM t2
WHERE ((a BETWEEN 49 AND 51) AND a!=50)
OR b=396
OR ((a BETWEEN 68 AND 70) AND a!=69);
SELECT a FROM t3
WHERE ((a BETWEEN 49 AND 51) AND a!=50)
OR b=396
OR ((a BETWEEN 68 AND 70) AND a!=69);
SELECT a FROM t2
WHERE (d>=72.0 AND d<73.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR c=11011
OR c=20020
OR (d>=18.0 AND d<19.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=72.0 AND d<73.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR c=11011
OR c=20020
OR (d>=18.0 AND d<19.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=50.0 AND d<51.0 AND d NOT NULL)
OR (d>=83.0 AND d<84.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR b=792
OR a=97
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR b=916
OR a=69
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR c=6006;
SELECT a FROM t3
WHERE (d>=50.0 AND d<51.0 AND d NOT NULL)
OR (d>=83.0 AND d<84.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR b=792
OR a=97
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR b=916
OR a=69
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR c=6006;
SELECT a FROM t2
WHERE ((a BETWEEN 50 AND 52) AND a!=51)
OR c=9009
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR b=539
OR b=297
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR b=957
OR f='xyzabcdef'
OR b=619;
SELECT a FROM t3
WHERE ((a BETWEEN 50 AND 52) AND a!=51)
OR c=9009
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR b=539
OR b=297
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR b=957
OR f='xyzabcdef'
OR b=619;
SELECT a FROM t2
WHERE ((a BETWEEN 47 AND 49) AND a!=48)
OR (d>=48.0 AND d<49.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 47 AND 49) AND a!=48)
OR (d>=48.0 AND d<49.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=20
OR a=67
OR b=58
OR ((a BETWEEN 19 AND 21) AND a!=20);
SELECT a FROM t3
WHERE a=20
OR a=67
OR b=58
OR ((a BETWEEN 19 AND 21) AND a!=20);
SELECT a FROM t2
WHERE b=938
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'rstuv*');
SELECT a FROM t3
WHERE b=938
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'rstuv*');
SELECT a FROM t2
WHERE (d>=68.0 AND d<69.0 AND d NOT NULL)
OR f='zabcdefgh'
OR b=308
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'defgh*')
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR b=443
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR f='uvwxyzabc'
OR (f GLOB '?zabc*' AND f GLOB 'yzab*');
SELECT a FROM t3
WHERE (d>=68.0 AND d<69.0 AND d NOT NULL)
OR f='zabcdefgh'
OR b=308
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'defgh*')
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR b=443
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR f='uvwxyzabc'
OR (f GLOB '?zabc*' AND f GLOB 'yzab*');
SELECT a FROM t2
WHERE (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=762
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR a=19;
SELECT a FROM t3
WHERE (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=762
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR a=19;
SELECT a FROM t2
WHERE (d>=63.0 AND d<64.0 AND d NOT NULL)
OR a=46
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR a=73
OR c=20020
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR b=267
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (g='utsrqpo' AND f GLOB 'uvwxy*');
SELECT a FROM t3
WHERE (d>=63.0 AND d<64.0 AND d NOT NULL)
OR a=46
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR a=73
OR c=20020
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR b=267
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (g='utsrqpo' AND f GLOB 'uvwxy*');
SELECT a FROM t2
WHERE ((a BETWEEN 27 AND 29) AND a!=28)
OR (g='gfedcba' AND f GLOB 'nopqr*');
SELECT a FROM t3
WHERE ((a BETWEEN 27 AND 29) AND a!=28)
OR (g='gfedcba' AND f GLOB 'nopqr*');
SELECT a FROM t2
WHERE c=13013
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR f='bcdefghij'
OR b=586
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR (d>=6.0 AND d<7.0 AND d NOT NULL)
OR a=9;
SELECT a FROM t3
WHERE c=13013
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR f='bcdefghij'
OR b=586
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR (d>=6.0 AND d<7.0 AND d NOT NULL)
OR a=9;
SELECT a FROM t2
WHERE b=399
OR c=28028
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR (d>=98.0 AND d<99.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=399
OR c=28028
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR (d>=98.0 AND d<99.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR c=14014
OR c=33033
OR a=89
OR b=770
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR a=35
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR b=253
OR c=14014;
SELECT a FROM t3
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR c=14014
OR c=33033
OR a=89
OR b=770
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR a=35
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR b=253
OR c=14014;
SELECT a FROM t2
WHERE (g='utsrqpo' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=330
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR a=16;
SELECT a FROM t3
WHERE (g='utsrqpo' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=330
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR a=16;
SELECT a FROM t2
WHERE c=5005
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR (g='ponmlkj' AND f GLOB 'vwxyz*');
SELECT a FROM t3
WHERE c=5005
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR (g='ponmlkj' AND f GLOB 'vwxyz*');
SELECT a FROM t2
WHERE (d>=30.0 AND d<31.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=33;
SELECT a FROM t3
WHERE (d>=30.0 AND d<31.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=33;
SELECT a FROM t2
WHERE b=1026
OR b=410;
SELECT a FROM t3
WHERE b=1026
OR b=410;
SELECT a FROM t2
WHERE c=18018
OR a=94
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=1012
OR a=3
OR d>1e10
OR b=905
OR b=1089;
SELECT a FROM t3
WHERE c=18018
OR a=94
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=1012
OR a=3
OR d>1e10
OR b=905
OR b=1089;
SELECT a FROM t2
WHERE a=100
OR c=11011
OR b=297
OR a=63
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR a=76
OR b=1026
OR a=26
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR c=30030;
SELECT a FROM t3
WHERE a=100
OR c=11011
OR b=297
OR a=63
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR a=76
OR b=1026
OR a=26
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR c=30030;
SELECT a FROM t2
WHERE b=561
OR b=1070
OR a=59
OR b=715
OR (f GLOB '?yzab*' AND f GLOB 'xyza*');
SELECT a FROM t3
WHERE b=561
OR b=1070
OR a=59
OR b=715
OR (f GLOB '?yzab*' AND f GLOB 'xyza*');
SELECT a FROM t2
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=1056
OR b=1012
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR (f GLOB '?bcde*' AND f GLOB 'abcd*');
SELECT a FROM t3
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=1056
OR b=1012
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR (f GLOB '?bcde*' AND f GLOB 'abcd*');
SELECT a FROM t2
WHERE f='rstuvwxyz'
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR (d>=98.0 AND d<99.0 AND d NOT NULL);
SELECT a FROM t3
WHERE f='rstuvwxyz'
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR (d>=98.0 AND d<99.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR c=12012
OR a=18
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*');
SELECT a FROM t3
WHERE (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR c=12012
OR a=18
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*');
SELECT a FROM t2
WHERE a=77
OR (d>=58.0 AND d<59.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=77
OR (d>=58.0 AND d<59.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=498
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR c=33033
OR b=11
OR (g='wvutsrq' AND f GLOB 'lmnop*')
OR ((a BETWEEN 7 AND 9) AND a!=8);
SELECT a FROM t3
WHERE b=498
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR c=33033
OR b=11
OR (g='wvutsrq' AND f GLOB 'lmnop*')
OR ((a BETWEEN 7 AND 9) AND a!=8);
SELECT a FROM t2
WHERE (d>=6.0 AND d<7.0 AND d NOT NULL)
OR ((a BETWEEN 58 AND 60) AND a!=59);
SELECT a FROM t3
WHERE (d>=6.0 AND d<7.0 AND d NOT NULL)
OR ((a BETWEEN 58 AND 60) AND a!=59);
SELECT a FROM t2
WHERE b=1059
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR c=4004
OR b=806;
SELECT a FROM t3
WHERE b=1059
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR c=4004
OR b=806;
SELECT a FROM t2
WHERE b=165
OR b=201
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR a=32;
SELECT a FROM t3
WHERE b=165
OR b=201
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR a=32;
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*');
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*');
SELECT a FROM t2
WHERE b=352
OR b=278
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR b=660
OR a=18
OR a=34
OR b=132
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR c=18018;
SELECT a FROM t3
WHERE b=352
OR b=278
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR b=660
OR a=18
OR a=34
OR b=132
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR c=18018;
SELECT a FROM t2
WHERE (d>=73.0 AND d<74.0 AND d NOT NULL)
OR ((a BETWEEN 5 AND 7) AND a!=6);
SELECT a FROM t3
WHERE (d>=73.0 AND d<74.0 AND d NOT NULL)
OR ((a BETWEEN 5 AND 7) AND a!=6);
SELECT a FROM t2
WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
OR (d>=14.0 AND d<15.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'fghij*')
OR b=297
OR b=113
OR b=176
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR a=67
OR c=26026;
SELECT a FROM t3
WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
OR (d>=14.0 AND d<15.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'fghij*')
OR b=297
OR b=113
OR b=176
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR a=67
OR c=26026;
SELECT a FROM t2
WHERE (d>=78.0 AND d<79.0 AND d NOT NULL)
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR a=83
OR b=44
OR b=1023
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR b=1023
OR f='ijklmnopq';
SELECT a FROM t3
WHERE (d>=78.0 AND d<79.0 AND d NOT NULL)
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR a=83
OR b=44
OR b=1023
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR b=1023
OR f='ijklmnopq';
SELECT a FROM t2
WHERE (d>=42.0 AND d<43.0 AND d NOT NULL)
OR b=935
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=487
OR b=619
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR (g='vutsrqp' AND f GLOB 'rstuv*');
SELECT a FROM t3
WHERE (d>=42.0 AND d<43.0 AND d NOT NULL)
OR b=935
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=487
OR b=619
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR (g='vutsrqp' AND f GLOB 'rstuv*');
SELECT a FROM t2
WHERE (d>=68.0 AND d<69.0 AND d NOT NULL)
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=938
OR b=641
OR c=17017
OR a=82
OR (d>=65.0 AND d<66.0 AND d NOT NULL)
OR (g='rqponml' AND f GLOB 'lmnop*')
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=39.0 AND d<40.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=68.0 AND d<69.0 AND d NOT NULL)
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=938
OR b=641
OR c=17017
OR a=82
OR (d>=65.0 AND d<66.0 AND d NOT NULL)
OR (g='rqponml' AND f GLOB 'lmnop*')
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=39.0 AND d<40.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='ihgfedc' AND f GLOB 'bcdef*')
OR c=22022;
SELECT a FROM t3
WHERE (g='ihgfedc' AND f GLOB 'bcdef*')
OR c=22022;
SELECT a FROM t2
WHERE c=7007
OR b=91
OR b=212
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR c=28028
OR (d>=83.0 AND d<84.0 AND d NOT NULL);
SELECT a FROM t3
WHERE c=7007
OR b=91
OR b=212
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR c=28028
OR (d>=83.0 AND d<84.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
OR a=51
OR ((a BETWEEN 28 AND 30) AND a!=29);
SELECT a FROM t3
WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
OR a=51
OR ((a BETWEEN 28 AND 30) AND a!=29);
SELECT a FROM t2
WHERE (g='wvutsrq' AND f GLOB 'mnopq*')
OR (g='wvutsrq' AND f GLOB 'jklmn*')
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR ((a BETWEEN 0 AND 2) AND a!=1)
OR c=4004
OR b=322
OR c=13013
OR a=6;
SELECT a FROM t3
WHERE (g='wvutsrq' AND f GLOB 'mnopq*')
OR (g='wvutsrq' AND f GLOB 'jklmn*')
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR ((a BETWEEN 0 AND 2) AND a!=1)
OR c=4004
OR b=322
OR c=13013
OR a=6;
SELECT a FROM t2
WHERE b=297
OR b=143
OR a=46
OR b=660
OR (d>=41.0 AND d<42.0 AND d NOT NULL)
OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR b=355
OR a=93
OR b=297;
SELECT a FROM t3
WHERE b=297
OR b=143
OR a=46
OR b=660
OR (d>=41.0 AND d<42.0 AND d NOT NULL)
OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR b=355
OR a=93
OR b=297;
SELECT a FROM t2
WHERE b=190
OR a=62
OR (g='edcbazy' AND f GLOB 'vwxyz*');
SELECT a FROM t3
WHERE b=190
OR a=62
OR (g='edcbazy' AND f GLOB 'vwxyz*');
SELECT a FROM t2
WHERE b=1089
OR b=102
OR a=6
OR b=608;
SELECT a FROM t3
WHERE b=1089
OR b=102
OR a=6
OR b=608;
SELECT a FROM t2
WHERE b=473
OR b=1100
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR a=20
OR b=1089
OR b=330
OR b=124
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t3
WHERE b=473
OR b=1100
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR a=20
OR b=1089
OR b=330
OR b=124
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t2
WHERE ((a BETWEEN 68 AND 70) AND a!=69)
OR b=223
OR a=12
OR b=1048
OR b=256
OR a=72
OR c>=34035
OR (g='rqponml' AND f GLOB 'jklmn*')
OR b=674
OR a=22;
SELECT a FROM t3
WHERE ((a BETWEEN 68 AND 70) AND a!=69)
OR b=223
OR a=12
OR b=1048
OR b=256
OR a=72
OR c>=34035
OR (g='rqponml' AND f GLOB 'jklmn*')
OR b=674
OR a=22;
SELECT a FROM t2
WHERE ((a BETWEEN 76 AND 78) AND a!=77)
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR f='yzabcdefg'
OR c=14014
OR a=1
OR a=9
OR b=960;
SELECT a FROM t3
WHERE ((a BETWEEN 76 AND 78) AND a!=77)
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR f='yzabcdefg'
OR c=14014
OR a=1
OR a=9
OR b=960;
SELECT a FROM t2
WHERE (g='utsrqpo' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR (g='onmlkji' AND f GLOB 'xyzab*');
SELECT a FROM t3
WHERE (g='utsrqpo' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR (g='onmlkji' AND f GLOB 'xyzab*');
SELECT a FROM t2
WHERE b=748
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR b=630;
SELECT a FROM t3
WHERE b=748
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR b=630;
SELECT a FROM t2
WHERE b=223
OR b=267
OR a=40
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR c<=10
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR b=528;
SELECT a FROM t3
WHERE b=223
OR b=267
OR a=40
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR c<=10
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR b=528;
SELECT a FROM t2
WHERE f='rstuvwxyz'
OR a=41
OR b=462
OR a=68
OR a=84
OR a=69;
SELECT a FROM t3
WHERE f='rstuvwxyz'
OR a=41
OR b=462
OR a=68
OR a=84
OR a=69;
SELECT a FROM t2
WHERE b=979
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR (g='vutsrqp' AND f GLOB 'nopqr*');
SELECT a FROM t3
WHERE b=979
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR (g='vutsrqp' AND f GLOB 'nopqr*');
SELECT a FROM t2
WHERE (d>=9.0 AND d<10.0 AND d NOT NULL)
OR a=8
OR a=62
OR b=726
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t3
WHERE (d>=9.0 AND d<10.0 AND d NOT NULL)
OR a=8
OR a=62
OR b=726
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t2
WHERE b=495
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR b=924
OR c=11011
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR b=231
OR b=872
OR (g='jihgfed' AND f GLOB 'yzabc*');
SELECT a FROM t3
WHERE b=495
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR b=924
OR c=11011
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR b=231
OR b=872
OR (g='jihgfed' AND f GLOB 'yzabc*');
SELECT a FROM t2
WHERE a=24
OR b=473
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR b=509
OR b=924
OR (d>=21.0 AND d<22.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=24
OR b=473
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR b=509
OR b=924
OR (d>=21.0 AND d<22.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=93.0 AND d<94.0 AND d NOT NULL)
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR b=363
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t3
WHERE (d>=93.0 AND d<94.0 AND d NOT NULL)
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR b=363
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t2
WHERE a=42
OR e IS NULL
OR b=495
OR 1000000<b
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
OR a=45
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR a=85
OR (d>=65.0 AND d<66.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=42
OR e IS NULL
OR b=495
OR 1000000<b
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
OR a=45
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR a=85
OR (d>=65.0 AND d<66.0 AND d NOT NULL);
SELECT a FROM t2
WHERE c=17017
OR f='ijklmnopq'
OR a=39;
SELECT a FROM t3
WHERE c=17017
OR f='ijklmnopq'
OR a=39;
SELECT a FROM t2
WHERE c>=34035
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR a=91;
SELECT a FROM t3
WHERE c>=34035
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR a=91;
SELECT a FROM t2
WHERE (g='gfedcba' AND f GLOB 'nopqr*')
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR b=649
OR b=231
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR b=58;
SELECT a FROM t3
WHERE (g='gfedcba' AND f GLOB 'nopqr*')
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR b=649
OR b=231
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR b=58;
SELECT a FROM t2
WHERE b=979
OR (d>=78.0 AND d<79.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=979
OR (d>=78.0 AND d<79.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=825
OR b=1004
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t3
WHERE b=825
OR b=1004
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t2
WHERE a=65
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR c=22022
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR b=671
OR (g='onmlkji' AND f GLOB 'zabcd*')
OR a=91
OR (d>=98.0 AND d<99.0 AND d NOT NULL)
OR ((a BETWEEN 47 AND 49) AND a!=48)
OR b=1004
OR b=960;
SELECT a FROM t3
WHERE a=65
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR c=22022
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR b=671
OR (g='onmlkji' AND f GLOB 'zabcd*')
OR a=91
OR (d>=98.0 AND d<99.0 AND d NOT NULL)
OR ((a BETWEEN 47 AND 49) AND a!=48)
OR b=1004
OR b=960;
SELECT a FROM t2
WHERE b=762
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t3
WHERE b=762
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t2
WHERE (d>=11.0 AND d<12.0 AND d NOT NULL)
OR a=14
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR b=212
OR (d>=78.0 AND d<79.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=11.0 AND d<12.0 AND d NOT NULL)
OR a=14
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR b=212
OR (d>=78.0 AND d<79.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='ihgfedc' AND f GLOB 'bcdef*')
OR b=168
OR b=25
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'opqrs*');
SELECT a FROM t3
WHERE (g='ihgfedc' AND f GLOB 'bcdef*')
OR b=168
OR b=25
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'opqrs*');
SELECT a FROM t2
WHERE c=28028
OR f='jklmnopqr'
OR b=1015;
SELECT a FROM t3
WHERE c=28028
OR f='jklmnopqr'
OR b=1015;
SELECT a FROM t2
WHERE c=31031
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR a=49
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'klmno*');
SELECT a FROM t3
WHERE c=31031
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR a=49
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'klmno*');
SELECT a FROM t2
WHERE a=80
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR b=971
OR a=60;
SELECT a FROM t3
WHERE a=80
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR b=971
OR a=60;
SELECT a FROM t2
WHERE (d>=85.0 AND d<86.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR b=1089
OR (d>=43.0 AND d<44.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=85.0 AND d<86.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR b=1089
OR (d>=43.0 AND d<44.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=399
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR a=10
OR b=1026;
SELECT a FROM t3
WHERE b=399
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR a=10
OR b=1026;
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'yzabc*')
OR b=465
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR (g='xwvutsr' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'yzabc*')
OR b=465
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR (g='xwvutsr' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE a=25
OR b=792
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*');
SELECT a FROM t3
WHERE a=25
OR b=792
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*');
SELECT a FROM t2
WHERE b=979
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR a=13
OR a=15
OR ((a BETWEEN 6 AND 8) AND a!=7)
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR a=27
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR a=32
OR a=39;
SELECT a FROM t3
WHERE b=979
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR a=13
OR a=15
OR ((a BETWEEN 6 AND 8) AND a!=7)
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR a=27
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR a=32
OR a=39;
SELECT a FROM t2
WHERE f='hijklmnop'
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR b=528
OR c=30030
OR (g='qponmlk' AND f GLOB 'qrstu*');
SELECT a FROM t3
WHERE f='hijklmnop'
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR b=528
OR c=30030
OR (g='qponmlk' AND f GLOB 'qrstu*');
SELECT a FROM t2
WHERE b=69
OR e IS NULL
OR b=352
OR 1000000<b
OR b=289;
SELECT a FROM t3
WHERE b=69
OR e IS NULL
OR b=352
OR 1000000<b
OR b=289;
SELECT a FROM t2
WHERE (g='lkjihgf' AND f GLOB 'pqrst*')
OR b=748
OR b=696
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR (f GLOB '?fghi*' AND f GLOB 'efgh*');
SELECT a FROM t3
WHERE (g='lkjihgf' AND f GLOB 'pqrst*')
OR b=748
OR b=696
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR (f GLOB '?fghi*' AND f GLOB 'efgh*');
SELECT a FROM t2
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR a=87
OR a=80
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b=784
OR a=49
OR ((a BETWEEN 34 AND 36) AND a!=35);
SELECT a FROM t3
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR a=87
OR a=80
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b=784
OR a=49
OR ((a BETWEEN 34 AND 36) AND a!=35);
SELECT a FROM t2
WHERE ((a BETWEEN 14 AND 16) AND a!=15)
OR (g='wvutsrq' AND f GLOB 'jklmn*')
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR c=1001
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR c=33033;
SELECT a FROM t3
WHERE ((a BETWEEN 14 AND 16) AND a!=15)
OR (g='wvutsrq' AND f GLOB 'jklmn*')
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR c=1001
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR c=33033;
SELECT a FROM t2
WHERE b=311
OR b=1103
OR b=88;
SELECT a FROM t3
WHERE b=311
OR b=1103
OR b=88;
SELECT a FROM t2
WHERE ((a BETWEEN 65 AND 67) AND a!=66)
OR ((a BETWEEN 26 AND 28) AND a!=27)
OR c=5005
OR b=1045
OR c=8008
OR f='bcdefghij';
SELECT a FROM t3
WHERE ((a BETWEEN 65 AND 67) AND a!=66)
OR ((a BETWEEN 26 AND 28) AND a!=27)
OR c=5005
OR b=1045
OR c=8008
OR f='bcdefghij';
SELECT a FROM t2
WHERE b=66
OR b=553
OR a=64
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR a=62
OR b=1081
OR b=770
OR b=762
OR b=803
OR (g='srqponm' AND f GLOB 'efghi*');
SELECT a FROM t3
WHERE b=66
OR b=553
OR a=64
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR a=62
OR b=1081
OR b=770
OR b=762
OR b=803
OR (g='srqponm' AND f GLOB 'efghi*');
SELECT a FROM t2
WHERE (g='wvutsrq' AND f GLOB 'klmno*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR c=17017
OR b=168
OR ((a BETWEEN 77 AND 79) AND a!=78);
SELECT a FROM t3
WHERE (g='wvutsrq' AND f GLOB 'klmno*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR c=17017
OR b=168
OR ((a BETWEEN 77 AND 79) AND a!=78);
SELECT a FROM t2
WHERE c=34034
OR (d>=68.0 AND d<69.0 AND d NOT NULL)
OR a=44
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR c=31031
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR b=619
OR (f GLOB '?efgh*' AND f GLOB 'defg*')
OR ((a BETWEEN 29 AND 31) AND a!=30);
SELECT a FROM t3
WHERE c=34034
OR (d>=68.0 AND d<69.0 AND d NOT NULL)
OR a=44
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR c=31031
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR b=619
OR (f GLOB '?efgh*' AND f GLOB 'defg*')
OR ((a BETWEEN 29 AND 31) AND a!=30);
SELECT a FROM t2
WHERE a=48
OR c=15015
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR b=110
OR f='klmnopqrs'
OR (g='fedcbaz' AND f GLOB 'qrstu*')
OR (g='onmlkji' AND f GLOB 'abcde*')
OR b=674
OR (g='fedcbaz' AND f GLOB 'stuvw*');
SELECT a FROM t3
WHERE a=48
OR c=15015
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR b=110
OR f='klmnopqrs'
OR (g='fedcbaz' AND f GLOB 'qrstu*')
OR (g='onmlkji' AND f GLOB 'abcde*')
OR b=674
OR (g='fedcbaz' AND f GLOB 'stuvw*');
SELECT a FROM t2
WHERE a=72
OR b=913
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=121
OR (d>=2.0 AND d<3.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=72
OR b=913
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=121
OR (d>=2.0 AND d<3.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=18
OR b=286
OR b=1015
OR a=49
OR b=264;
SELECT a FROM t3
WHERE a=18
OR b=286
OR b=1015
OR a=49
OR b=264;
SELECT a FROM t2
WHERE b=69
OR a=11
OR c=1001
OR ((a BETWEEN 54 AND 56) AND a!=55)
OR a=57
OR ((a BETWEEN 48 AND 50) AND a!=49);
SELECT a FROM t3
WHERE b=69
OR a=11
OR c=1001
OR ((a BETWEEN 54 AND 56) AND a!=55)
OR a=57
OR ((a BETWEEN 48 AND 50) AND a!=49);
SELECT a FROM t2
WHERE b=231
OR (g='hgfedcb' AND f GLOB 'ghijk*');
SELECT a FROM t3
WHERE b=231
OR (g='hgfedcb' AND f GLOB 'ghijk*');
SELECT a FROM t2
WHERE b=25
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR ((a BETWEEN 81 AND 83) AND a!=82)
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR b=289
OR ((a BETWEEN 85 AND 87) AND a!=86);
SELECT a FROM t3
WHERE b=25
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR ((a BETWEEN 81 AND 83) AND a!=82)
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR b=289
OR ((a BETWEEN 85 AND 87) AND a!=86);
SELECT a FROM t2
WHERE f='defghijkl'
OR b=465
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR c=9009
OR b=990
OR b=132
OR a=35
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR a=81
OR ((a BETWEEN 71 AND 73) AND a!=72);
SELECT a FROM t3
WHERE f='defghijkl'
OR b=465
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR c=9009
OR b=990
OR b=132
OR a=35
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR a=81
OR ((a BETWEEN 71 AND 73) AND a!=72);
SELECT a FROM t2
WHERE c=26026
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR f='lmnopqrst'
OR a=6
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t3
WHERE c=26026
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR f='lmnopqrst'
OR a=6
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t2
WHERE ((a BETWEEN 98 AND 100) AND a!=99)
OR (d>=7.0 AND d<8.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 98 AND 100) AND a!=99)
OR (d>=7.0 AND d<8.0 AND d NOT NULL);
SELECT a FROM t2
WHERE c=11011
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR b=630
OR c=19019
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR a=24
OR (d>=95.0 AND d<96.0 AND d NOT NULL)
OR ((a BETWEEN 51 AND 53) AND a!=52);
SELECT a FROM t3
WHERE c=11011
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR b=630
OR c=19019
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR a=24
OR (d>=95.0 AND d<96.0 AND d NOT NULL)
OR ((a BETWEEN 51 AND 53) AND a!=52);
SELECT a FROM t2
WHERE ((a BETWEEN 91 AND 93) AND a!=92)
OR b=993
OR a=81
OR b=366
OR b=69;
SELECT a FROM t3
WHERE ((a BETWEEN 91 AND 93) AND a!=92)
OR b=993
OR a=81
OR b=366
OR b=69;
SELECT a FROM t2
WHERE f='stuvwxyza'
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR ((a BETWEEN 1 AND 3) AND a!=2)
OR b=1037
OR f='zabcdefgh'
OR (g='gfedcba' AND f GLOB 'mnopq*');
SELECT a FROM t3
WHERE f='stuvwxyza'
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR ((a BETWEEN 1 AND 3) AND a!=2)
OR b=1037
OR f='zabcdefgh'
OR (g='gfedcba' AND f GLOB 'mnopq*');
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'ghijk*')
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR ((a BETWEEN 30 AND 32) AND a!=31);
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'ghijk*')
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR ((a BETWEEN 30 AND 32) AND a!=31);
SELECT a FROM t2
WHERE b=847
OR b=190
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR ((a BETWEEN 70 AND 72) AND a!=71)
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR b=704;
SELECT a FROM t3
WHERE b=847
OR b=190
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR ((a BETWEEN 70 AND 72) AND a!=71)
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR b=704;
SELECT a FROM t2
WHERE b=88
OR f='vwxyzabcd'
OR f='fghijklmn'
OR (g='gfedcba' AND f GLOB 'lmnop*');
SELECT a FROM t3
WHERE b=88
OR f='vwxyzabcd'
OR f='fghijklmn'
OR (g='gfedcba' AND f GLOB 'lmnop*');
SELECT a FROM t2
WHERE b=498
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR a=1;
SELECT a FROM t3
WHERE b=498
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR a=1;
SELECT a FROM t2
WHERE ((a BETWEEN 47 AND 49) AND a!=48)
OR a=5
OR b=179
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR a=69;
SELECT a FROM t3
WHERE ((a BETWEEN 47 AND 49) AND a!=48)
OR a=5
OR b=179
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR a=69;
SELECT a FROM t2
WHERE b=971
OR (g='xwvutsr' AND f GLOB 'hijkl*')
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR b=828
OR a=81
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR b=627
OR b=355
OR b=377
OR a=44;
SELECT a FROM t3
WHERE b=971
OR (g='xwvutsr' AND f GLOB 'hijkl*')
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR b=828
OR a=81
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR b=627
OR b=355
OR b=377
OR a=44;
SELECT a FROM t2
WHERE b=850
OR ((a BETWEEN 6 AND 8) AND a!=7);
SELECT a FROM t3
WHERE b=850
OR ((a BETWEEN 6 AND 8) AND a!=7);
SELECT a FROM t2
WHERE (g='lkjihgf' AND f GLOB 'opqrs*')
OR (f GLOB '?stuv*' AND f GLOB 'rstu*');
SELECT a FROM t3
WHERE (g='lkjihgf' AND f GLOB 'opqrs*')
OR (f GLOB '?stuv*' AND f GLOB 'rstu*');
SELECT a FROM t2
WHERE b=726
OR b=740
OR a=33
OR c=8008
OR f='rstuvwxyz'
OR b=168;
SELECT a FROM t3
WHERE b=726
OR b=740
OR a=33
OR c=8008
OR f='rstuvwxyz'
OR b=168;
SELECT a FROM t2
WHERE (g='vutsrqp' AND f GLOB 'rstuv*')
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=396;
SELECT a FROM t3
WHERE (g='vutsrqp' AND f GLOB 'rstuv*')
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=396;
SELECT a FROM t2
WHERE a=77
OR ((a BETWEEN 48 AND 50) AND a!=49)
OR c<=10
OR ((a BETWEEN 5 AND 7) AND a!=6);
SELECT a FROM t3
WHERE a=77
OR ((a BETWEEN 48 AND 50) AND a!=49)
OR c<=10
OR ((a BETWEEN 5 AND 7) AND a!=6);
SELECT a FROM t2
WHERE ((a BETWEEN 12 AND 14) AND a!=13)
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR b=253
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR b=396
OR b=630
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR c=3003
OR (d>=49.0 AND d<50.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 12 AND 14) AND a!=13)
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR b=253
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR b=396
OR b=630
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR c=3003
OR (d>=49.0 AND d<50.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=957
OR b=242
OR b=113
OR b=957
OR b=311
OR b=143
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR (d>=10.0 AND d<11.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=957
OR b=242
OR b=113
OR b=957
OR b=311
OR b=143
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR (d>=10.0 AND d<11.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 74 AND 76) AND a!=75)
OR ((a BETWEEN 94 AND 96) AND a!=95)
OR b=451
OR (g='lkjihgf' AND f GLOB 'opqrs*');
SELECT a FROM t3
WHERE ((a BETWEEN 74 AND 76) AND a!=75)
OR ((a BETWEEN 94 AND 96) AND a!=95)
OR b=451
OR (g='lkjihgf' AND f GLOB 'opqrs*');
SELECT a FROM t2
WHERE (d>=3.0 AND d<4.0 AND d NOT NULL)
OR b=451
OR b=363
OR b=330
OR (g='srqponm' AND f GLOB 'efghi*')
OR ((a BETWEEN 52 AND 54) AND a!=53)
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR ((a BETWEEN 81 AND 83) AND a!=82)
OR (g='gfedcba' AND f GLOB 'lmnop*');
SELECT a FROM t3
WHERE (d>=3.0 AND d<4.0 AND d NOT NULL)
OR b=451
OR b=363
OR b=330
OR (g='srqponm' AND f GLOB 'efghi*')
OR ((a BETWEEN 52 AND 54) AND a!=53)
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR ((a BETWEEN 81 AND 83) AND a!=82)
OR (g='gfedcba' AND f GLOB 'lmnop*');
SELECT a FROM t2
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR (d>=68.0 AND d<69.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR e IS NULL
OR b=759;
SELECT a FROM t3
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR (d>=68.0 AND d<69.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR e IS NULL
OR b=759;
SELECT a FROM t2
WHERE (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR (g='jihgfed' AND f GLOB 'wxyza*');
SELECT a FROM t3
WHERE (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR (g='jihgfed' AND f GLOB 'wxyza*');
SELECT a FROM t2
WHERE b=1037
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR ((a BETWEEN 75 AND 77) AND a!=76);
SELECT a FROM t3
WHERE b=1037
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR ((a BETWEEN 75 AND 77) AND a!=76);
SELECT a FROM t2
WHERE b=1045
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR c=12012;
SELECT a FROM t3
WHERE b=1045
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR c=12012;
SELECT a FROM t2
WHERE (g='fedcbaz' AND f GLOB 'tuvwx*')
OR b=421
OR b=429
OR b=498
OR b=33
OR b=198
OR c=14014
OR (f GLOB '?yzab*' AND f GLOB 'xyza*');
SELECT a FROM t3
WHERE (g='fedcbaz' AND f GLOB 'tuvwx*')
OR b=421
OR b=429
OR b=498
OR b=33
OR b=198
OR c=14014
OR (f GLOB '?yzab*' AND f GLOB 'xyza*');
SELECT a FROM t2
WHERE b=47
OR c=31031
OR a=38
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (g='srqponm' AND f GLOB 'fghij*')
OR b=242
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR b=352
OR a=49
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE b=47
OR c=31031
OR a=38
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (g='srqponm' AND f GLOB 'fghij*')
OR b=242
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR b=352
OR a=49
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=704
OR a=7
OR a=8
OR a=46
OR b=740
OR b=993
OR (d>=38.0 AND d<39.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=704
OR a=7
OR a=8
OR a=46
OR b=740
OR b=993
OR (d>=38.0 AND d<39.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 62 AND 64) AND a!=63)
OR c=32032
OR a=76;
SELECT a FROM t3
WHERE ((a BETWEEN 62 AND 64) AND a!=63)
OR c=32032
OR a=76;
SELECT a FROM t2
WHERE (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=528
OR (g='gfedcba' AND f GLOB 'nopqr*');
SELECT a FROM t3
WHERE (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=528
OR (g='gfedcba' AND f GLOB 'nopqr*');
SELECT a FROM t2
WHERE (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR a=65;
SELECT a FROM t3
WHERE (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR a=65;
SELECT a FROM t2
WHERE (d>=71.0 AND d<72.0 AND d NOT NULL)
OR 1000000<b
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR a=24;
SELECT a FROM t3
WHERE (d>=71.0 AND d<72.0 AND d NOT NULL)
OR 1000000<b
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR a=24;
SELECT a FROM t2
WHERE a=60
OR a=39
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR b=36
OR b=814
OR a=14
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR b=440
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR (f GLOB '?abcd*' AND f GLOB 'zabc*');
SELECT a FROM t3
WHERE a=60
OR a=39
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR b=36
OR b=814
OR a=14
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR b=440
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR (f GLOB '?abcd*' AND f GLOB 'zabc*');
SELECT a FROM t2
WHERE f IS NULL
OR ((a BETWEEN 39 AND 41) AND a!=40);
SELECT a FROM t3
WHERE f IS NULL
OR ((a BETWEEN 39 AND 41) AND a!=40);
SELECT a FROM t2
WHERE b=44
OR ((a BETWEEN 17 AND 19) AND a!=18);
SELECT a FROM t3
WHERE b=44
OR ((a BETWEEN 17 AND 19) AND a!=18);
SELECT a FROM t2
WHERE (d>=80.0 AND d<81.0 AND d NOT NULL)
OR a=82;
SELECT a FROM t3
WHERE (d>=80.0 AND d<81.0 AND d NOT NULL)
OR a=82;
SELECT a FROM t2
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR c=24024
OR b=946
OR a=19
OR (d>=47.0 AND d<48.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR c=24024
OR b=946
OR a=19
OR (d>=47.0 AND d<48.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=27
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR b=1045
OR a=84
OR f='qrstuvwxy';
SELECT a FROM t3
WHERE a=27
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR b=1045
OR a=84
OR f='qrstuvwxy';
SELECT a FROM t2
WHERE b=704
OR b=949
OR (d>=72.0 AND d<73.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR c=24024
OR b=553
OR a=18
OR a=92;
SELECT a FROM t3
WHERE b=704
OR b=949
OR (d>=72.0 AND d<73.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR c=24024
OR b=553
OR a=18
OR a=92;
SELECT a FROM t2
WHERE (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR b=902
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR b=25
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR f='zabcdefgh'
OR b=385;
SELECT a FROM t3
WHERE (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR b=902
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR b=25
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR f='zabcdefgh'
OR b=385;
SELECT a FROM t2
WHERE a=22
OR b=36
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR ((a BETWEEN 81 AND 83) AND a!=82);
SELECT a FROM t3
WHERE a=22
OR b=36
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR ((a BETWEEN 81 AND 83) AND a!=82);
SELECT a FROM t2
WHERE b=253
OR (d>=60.0 AND d<61.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=253
OR (d>=60.0 AND d<61.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR b=641
OR ((a BETWEEN 36 AND 38) AND a!=37);
SELECT a FROM t3
WHERE (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR b=641
OR ((a BETWEEN 36 AND 38) AND a!=37);
SELECT a FROM t2
WHERE c=30030
OR a=18
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR b=11
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR a=52
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR a=13
OR (d>=65.0 AND d<66.0 AND d NOT NULL);
SELECT a FROM t3
WHERE c=30030
OR a=18
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR b=11
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR a=52
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR a=13
OR (d>=65.0 AND d<66.0 AND d NOT NULL);
SELECT a FROM t2
WHERE c=23023
OR f='efghijklm'
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR b=1045
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR f='uvwxyzabc'
OR (f GLOB '?zabc*' AND f GLOB 'yzab*');
SELECT a FROM t3
WHERE c=23023
OR f='efghijklm'
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR b=1045
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR f='uvwxyzabc'
OR (f GLOB '?zabc*' AND f GLOB 'yzab*');
SELECT a FROM t2
WHERE b=476
OR a=11
OR a=52
OR b=858
OR b=264
OR f='wxyzabcde'
OR c=18018
OR b=597
OR (d>=69.0 AND d<70.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=476
OR a=11
OR a=52
OR b=858
OR b=264
OR f='wxyzabcde'
OR c=18018
OR b=597
OR (d>=69.0 AND d<70.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=91
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (d>=85.0 AND d<86.0 AND d NOT NULL)
OR b=102
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR b=784;
SELECT a FROM t3
WHERE b=91
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (d>=85.0 AND d<86.0 AND d NOT NULL)
OR b=102
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR b=784;
SELECT a FROM t2
WHERE (g='vutsrqp' AND f GLOB 'opqrs*')
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR b=990
OR a=52
OR (d>=38.0 AND d<39.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='vutsrqp' AND f GLOB 'opqrs*')
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR b=990
OR a=52
OR (d>=38.0 AND d<39.0 AND d NOT NULL);
SELECT a FROM t2
WHERE c=22022
OR b=960
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR a=48
OR b=729
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR a=44
OR b=773;
SELECT a FROM t3
WHERE c=22022
OR b=960
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR a=48
OR b=729
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR a=44
OR b=773;
SELECT a FROM t2
WHERE ((a BETWEEN 68 AND 70) AND a!=69)
OR b=421
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'defgh*')
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR c=22022
OR b=825
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR (f GLOB '?hijk*' AND f GLOB 'ghij*');
SELECT a FROM t3
WHERE ((a BETWEEN 68 AND 70) AND a!=69)
OR b=421
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'defgh*')
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR c=22022
OR b=825
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR (f GLOB '?hijk*' AND f GLOB 'ghij*');
SELECT a FROM t2
WHERE (d>=44.0 AND d<45.0 AND d NOT NULL)
OR b=484
OR b=1026
OR a=90
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR b=608
OR a=32;
SELECT a FROM t3
WHERE (d>=44.0 AND d<45.0 AND d NOT NULL)
OR b=484
OR b=1026
OR a=90
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR b=608
OR a=32;
SELECT a FROM t2
WHERE c<=10
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR b=154
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR b=880
OR a=55
OR b=773
OR b=319
OR (g='hgfedcb' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE c<=10
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR b=154
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR b=880
OR a=55
OR b=773
OR b=319
OR (g='hgfedcb' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE (g='wvutsrq' AND f GLOB 'ijklm*')
OR f='mnopqrstu'
OR a=62;
SELECT a FROM t3
WHERE (g='wvutsrq' AND f GLOB 'ijklm*')
OR f='mnopqrstu'
OR a=62;
SELECT a FROM t2
WHERE a=33
OR b=1045
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR c=13013
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR b=124
OR (g='gfedcba' AND f GLOB 'klmno*');
SELECT a FROM t3
WHERE a=33
OR b=1045
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR c=13013
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR b=124
OR (g='gfedcba' AND f GLOB 'klmno*');
SELECT a FROM t2
WHERE b=883
OR c=32032
OR f='fghijklmn'
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR b=421
OR b=803
OR c=4004
OR (f GLOB '?defg*' AND f GLOB 'cdef*');
SELECT a FROM t3
WHERE b=883
OR c=32032
OR f='fghijklmn'
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR b=421
OR b=803
OR c=4004
OR (f GLOB '?defg*' AND f GLOB 'cdef*');
SELECT a FROM t2
WHERE (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR b=99
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t3
WHERE (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR b=99
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t2
WHERE f='defghijkl'
OR b=308;
SELECT a FROM t3
WHERE f='defghijkl'
OR b=308;
SELECT a FROM t2
WHERE b=795
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR f='jklmnopqr'
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR b=1056;
SELECT a FROM t3
WHERE b=795
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR f='jklmnopqr'
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR b=1056;
SELECT a FROM t2
WHERE a=47
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=410
OR b=682
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR f='hijklmnop'
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=168
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR a=32
OR a=72;
SELECT a FROM t3
WHERE a=47
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=410
OR b=682
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR f='hijklmnop'
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=168
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR a=32
OR a=72;
SELECT a FROM t2
WHERE b=616
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR a=96;
SELECT a FROM t3
WHERE b=616
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR a=96;
SELECT a FROM t2
WHERE (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=352;
SELECT a FROM t3
WHERE (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=352;
SELECT a FROM t2
WHERE b=795
OR c=13013
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=597;
SELECT a FROM t3
WHERE b=795
OR c=13013
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=597;
SELECT a FROM t2
WHERE a=23
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b=641
OR b=352
OR b=179
OR b=806
OR b=839
OR b=33;
SELECT a FROM t3
WHERE a=23
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b=641
OR b=352
OR b=179
OR b=806
OR b=839
OR b=33;
SELECT a FROM t2
WHERE b=1070
OR b=1078
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR c=12012
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR b=319
OR c=5005
OR 1000000<b
OR b=1037
OR b=234;
SELECT a FROM t3
WHERE b=1070
OR b=1078
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR c=12012
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR b=319
OR c=5005
OR 1000000<b
OR b=1037
OR b=234;
SELECT a FROM t2
WHERE f='cdefghijk'
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR (d>=59.0 AND d<60.0 AND d NOT NULL);
SELECT a FROM t3
WHERE f='cdefghijk'
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR (d>=59.0 AND d<60.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=65
OR c=14014
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR a=47
OR b=220
OR (d>=37.0 AND d<38.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=65
OR c=14014
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR a=47
OR b=220
OR (d>=37.0 AND d<38.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'ijklm*')
OR (g='rqponml' AND f GLOB 'jklmn*')
OR b=891
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR b=484
OR a=62
OR (g='ihgfedc' AND f GLOB 'defgh*');
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'ijklm*')
OR (g='rqponml' AND f GLOB 'jklmn*')
OR b=891
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR b=484
OR a=62
OR (g='ihgfedc' AND f GLOB 'defgh*');
SELECT a FROM t2
WHERE b=363
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR a=39
OR (d>=54.0 AND d<55.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=363
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR a=39
OR (d>=54.0 AND d<55.0 AND d NOT NULL);
SELECT a FROM t2
WHERE c=30030
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR b=850
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*');
SELECT a FROM t3
WHERE c=30030
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR b=850
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*');
SELECT a FROM t2
WHERE (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR b=80;
SELECT a FROM t3
WHERE (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR b=80;
SELECT a FROM t2
WHERE ((a BETWEEN 59 AND 61) AND a!=60)
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR b=462
OR a=51
OR b=344
OR b=333
OR ((a BETWEEN 61 AND 63) AND a!=62);
SELECT a FROM t3
WHERE ((a BETWEEN 59 AND 61) AND a!=60)
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR b=462
OR a=51
OR b=344
OR b=333
OR ((a BETWEEN 61 AND 63) AND a!=62);
SELECT a FROM t2
WHERE b=586
OR a=21
OR b=638;
SELECT a FROM t3
WHERE b=586
OR a=21
OR b=638;
SELECT a FROM t2
WHERE b=179
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR ((a BETWEEN 72 AND 74) AND a!=73);
SELECT a FROM t3
WHERE b=179
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR ((a BETWEEN 72 AND 74) AND a!=73);
SELECT a FROM t2
WHERE b=333
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR b=407
OR a=5
OR b=817
OR b=891;
SELECT a FROM t3
WHERE b=333
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR b=407
OR a=5
OR b=817
OR b=891;
SELECT a FROM t2
WHERE b<0
OR b=352
OR b=517
OR (g='fedcbaz' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR b=1012
OR ((a BETWEEN 11 AND 13) AND a!=12);
SELECT a FROM t3
WHERE b<0
OR b=352
OR b=517
OR (g='fedcbaz' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR b=1012
OR ((a BETWEEN 11 AND 13) AND a!=12);
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'pqrst*')
OR c<=10
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR a=32
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR d<0.0;
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'pqrst*')
OR c<=10
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR a=32
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR d<0.0;
SELECT a FROM t2
WHERE ((a BETWEEN 20 AND 22) AND a!=21)
OR b=1045
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR a=26
OR (g='gfedcba' AND f GLOB 'opqrs*');
SELECT a FROM t3
WHERE ((a BETWEEN 20 AND 22) AND a!=21)
OR b=1045
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR a=26
OR (g='gfedcba' AND f GLOB 'opqrs*');
SELECT a FROM t2
WHERE a=49
OR b=58;
SELECT a FROM t3
WHERE a=49
OR b=58;
SELECT a FROM t2
WHERE (d>=3.0 AND d<4.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR c=32032
OR b=289
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t3
WHERE (d>=3.0 AND d<4.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR c=32032
OR b=289
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t2
WHERE ((a BETWEEN 15 AND 17) AND a!=16)
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR b=33
OR (f GLOB '?stuv*' AND f GLOB 'rstu*');
SELECT a FROM t3
WHERE ((a BETWEEN 15 AND 17) AND a!=16)
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR b=33
OR (f GLOB '?stuv*' AND f GLOB 'rstu*');
SELECT a FROM t2
WHERE b=828
OR b=341
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR b=902
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=242
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR (g='qponmlk' AND f GLOB 'qrstu*');
SELECT a FROM t3
WHERE b=828
OR b=341
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR b=902
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=242
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR (g='qponmlk' AND f GLOB 'qrstu*');
SELECT a FROM t2
WHERE (g='nmlkjih' AND f GLOB 'efghi*')
OR b=982
OR b=781
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR d>1e10
OR (d>=71.0 AND d<72.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='nmlkjih' AND f GLOB 'efghi*')
OR b=982
OR b=781
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR d>1e10
OR (d>=71.0 AND d<72.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
OR a=31
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR a=76
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR b=176;
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
OR a=31
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR a=76
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR b=176;
SELECT a FROM t2
WHERE (g='ponmlkj' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=14
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR f='zabcdefgh';
SELECT a FROM t3
WHERE (g='ponmlkj' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=14
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR f='zabcdefgh';
SELECT a FROM t2
WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
OR b=286
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR b=91
OR ((a BETWEEN 43 AND 45) AND a!=44);
SELECT a FROM t3
WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
OR b=286
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR b=91
OR ((a BETWEEN 43 AND 45) AND a!=44);
SELECT a FROM t2
WHERE (g='lkjihgf' AND f GLOB 'nopqr*')
OR c=19019
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR b=374;
SELECT a FROM t3
WHERE (g='lkjihgf' AND f GLOB 'nopqr*')
OR c=19019
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR b=374;
SELECT a FROM t2
WHERE g IS NULL
OR (g='onmlkji' AND f GLOB 'wxyza*');
SELECT a FROM t3
WHERE g IS NULL
OR (g='onmlkji' AND f GLOB 'wxyza*');
SELECT a FROM t2
WHERE a=4
OR b=407;
SELECT a FROM t3
WHERE a=4
OR b=407;
SELECT a FROM t2
WHERE ((a BETWEEN 66 AND 68) AND a!=67)
OR b=564
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR b=234
OR b=641
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR a=98;
SELECT a FROM t3
WHERE ((a BETWEEN 66 AND 68) AND a!=67)
OR b=564
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR b=234
OR b=641
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR a=98;
SELECT a FROM t2
WHERE a=73
OR b=44
OR b=539
OR c=11011
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=69
OR b=1001
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR ((a BETWEEN 32 AND 34) AND a!=33);
SELECT a FROM t3
WHERE a=73
OR b=44
OR b=539
OR c=11011
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=69
OR b=1001
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR ((a BETWEEN 32 AND 34) AND a!=33);
SELECT a FROM t2
WHERE b=264
OR b=143
OR a=48;
SELECT a FROM t3
WHERE b=264
OR b=143
OR a=48;
SELECT a FROM t2
WHERE b=1001
OR b=1070
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR b=14
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR a=66;
SELECT a FROM t3
WHERE b=1001
OR b=1070
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR b=14
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR a=66;
SELECT a FROM t2
WHERE c=23023
OR (d>=83.0 AND d<84.0 AND d NOT NULL)
OR a=66
OR (g='onmlkji' AND f GLOB 'zabcd*')
OR a=51
OR a=23
OR c=4004;
SELECT a FROM t3
WHERE c=23023
OR (d>=83.0 AND d<84.0 AND d NOT NULL)
OR a=66
OR (g='onmlkji' AND f GLOB 'zabcd*')
OR a=51
OR a=23
OR c=4004;
SELECT a FROM t2
WHERE b=36
OR (g='rqponml' AND f GLOB 'lmnop*')
OR a=80;
SELECT a FROM t3
WHERE b=36
OR (g='rqponml' AND f GLOB 'lmnop*')
OR a=80;
SELECT a FROM t2
WHERE (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR a=55
OR f='efghijklm'
OR a=8
OR a=80
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR b=256
OR (d>=72.0 AND d<73.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR a=55
OR f='efghijklm'
OR a=8
OR a=80
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR b=256
OR (d>=72.0 AND d<73.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=836
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR a=91
OR b=594
OR (g='ponmlkj' AND f GLOB 'vwxyz*');
SELECT a FROM t3
WHERE (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=836
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR a=91
OR b=594
OR (g='ponmlkj' AND f GLOB 'vwxyz*');
SELECT a FROM t2
WHERE (g='tsrqpon' AND f GLOB 'yzabc*')
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 62 AND 64) AND a!=63)
OR c=6006
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR (d>=43.0 AND d<44.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='tsrqpon' AND f GLOB 'yzabc*')
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 62 AND 64) AND a!=63)
OR c=6006
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR (d>=43.0 AND d<44.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 83 AND 85) AND a!=84)
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR a=13
OR b=121
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR b=660
OR b=792
OR (g='xwvutsr' AND f GLOB 'ghijk*');
SELECT a FROM t3
WHERE ((a BETWEEN 83 AND 85) AND a!=84)
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR a=13
OR b=121
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR b=660
OR b=792
OR (g='xwvutsr' AND f GLOB 'ghijk*');
SELECT a FROM t2
WHERE b=1089
OR b=495
OR b=157
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
OR (d>=59.0 AND d<60.0 AND d NOT NULL)
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR (g='xwvutsr' AND f GLOB 'hijkl*')
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR f='wxyzabcde';
SELECT a FROM t3
WHERE b=1089
OR b=495
OR b=157
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
OR (d>=59.0 AND d<60.0 AND d NOT NULL)
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR (g='xwvutsr' AND f GLOB 'hijkl*')
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR f='wxyzabcde';
SELECT a FROM t2
WHERE f='bcdefghij'
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (g='srqponm' AND f GLOB 'ghijk*')
OR b=157
OR b=267
OR c=34034;
SELECT a FROM t3
WHERE f='bcdefghij'
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (g='srqponm' AND f GLOB 'ghijk*')
OR b=157
OR b=267
OR c=34034;
SELECT a FROM t2
WHERE a=19
OR a=23
OR c<=10
OR (g='lkjihgf' AND f GLOB 'opqrs*');
SELECT a FROM t3
WHERE a=19
OR a=23
OR c<=10
OR (g='lkjihgf' AND f GLOB 'opqrs*');
SELECT a FROM t2
WHERE ((a BETWEEN 1 AND 3) AND a!=2)
OR b=792
OR b=803
OR b=36
OR (f GLOB '?cdef*' AND f GLOB 'bcde*');
SELECT a FROM t3
WHERE ((a BETWEEN 1 AND 3) AND a!=2)
OR b=792
OR b=803
OR b=36
OR (f GLOB '?cdef*' AND f GLOB 'bcde*');
SELECT a FROM t2
WHERE (g='utsrqpo' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 71 AND 73) AND a!=72)
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR f='jklmnopqr'
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR b=891
OR a=40
OR (d>=67.0 AND d<68.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='utsrqpo' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 71 AND 73) AND a!=72)
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR f='jklmnopqr'
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR b=891
OR a=40
OR (d>=67.0 AND d<68.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
OR a=32
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR a=95
OR d>1e10
OR b=429
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR c=10010
OR ((a BETWEEN 83 AND 85) AND a!=84);
SELECT a FROM t3
WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
OR a=32
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR a=95
OR d>1e10
OR b=429
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR c=10010
OR ((a BETWEEN 83 AND 85) AND a!=84);
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'defgh*')
OR a=22
OR a=26
OR a=81
OR a=53
OR ((a BETWEEN 92 AND 94) AND a!=93)
OR c=30030
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR a=82
OR b=594;
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'defgh*')
OR a=22
OR a=26
OR a=81
OR a=53
OR ((a BETWEEN 92 AND 94) AND a!=93)
OR c=30030
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR a=82
OR b=594;
SELECT a FROM t2
WHERE ((a BETWEEN 34 AND 36) AND a!=35)
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'efghi*')
OR a=83
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR ((a BETWEEN 99 AND 101) AND a!=100)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=1092
OR (g='srqponm' AND f GLOB 'efghi*')
OR b=25;
SELECT a FROM t3
WHERE ((a BETWEEN 34 AND 36) AND a!=35)
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'efghi*')
OR a=83
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR ((a BETWEEN 99 AND 101) AND a!=100)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=1092
OR (g='srqponm' AND f GLOB 'efghi*')
OR b=25;
SELECT a FROM t2
WHERE a=20
OR b=421
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR a=50
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR (d>=53.0 AND d<54.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=20
OR b=421
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR a=50
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR (d>=53.0 AND d<54.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=960
OR (f GLOB '?opqr*' AND f GLOB 'nopq*');
SELECT a FROM t3
WHERE b=960
OR (f GLOB '?opqr*' AND f GLOB 'nopq*');
SELECT a FROM t2
WHERE b=891
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR f='nopqrstuv';
SELECT a FROM t3
WHERE b=891
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR f='nopqrstuv';
SELECT a FROM t2
WHERE b=157
OR b=289
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=1001
OR b=707;
SELECT a FROM t3
WHERE b=157
OR b=289
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=1001
OR b=707;
SELECT a FROM t2
WHERE (g='edcbazy' AND f GLOB 'wxyza*')
OR b=957
OR ((a BETWEEN 48 AND 50) AND a!=49);
SELECT a FROM t3
WHERE (g='edcbazy' AND f GLOB 'wxyza*')
OR b=957
OR ((a BETWEEN 48 AND 50) AND a!=49);
SELECT a FROM t2
WHERE (d>=40.0 AND d<41.0 AND d NOT NULL)
OR a=77
OR (d>=85.0 AND d<86.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=40.0 AND d<41.0 AND d NOT NULL)
OR a=77
OR (d>=85.0 AND d<86.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=11
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR a=99;
SELECT a FROM t3
WHERE (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=11
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR a=99;
SELECT a FROM t2
WHERE f='fghijklmn'
OR a=16
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=80;
SELECT a FROM t3
WHERE f='fghijklmn'
OR a=16
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=80;
SELECT a FROM t2
WHERE (g='wvutsrq' AND f GLOB 'mnopq*')
OR a=44
OR a=43
OR (g='lkjihgf' AND f GLOB 'opqrs*')
OR b=25;
SELECT a FROM t3
WHERE (g='wvutsrq' AND f GLOB 'mnopq*')
OR a=44
OR a=43
OR (g='lkjihgf' AND f GLOB 'opqrs*')
OR b=25;
SELECT a FROM t2
WHERE f='vwxyzabcd'
OR a=73
OR b=597;
SELECT a FROM t3
WHERE f='vwxyzabcd'
OR a=73
OR b=597;
SELECT a FROM t2
WHERE b=22
OR ((a BETWEEN 61 AND 63) AND a!=62)
OR e IS NULL
OR a=1;
SELECT a FROM t3
WHERE b=22
OR ((a BETWEEN 61 AND 63) AND a!=62)
OR e IS NULL
OR a=1;
SELECT a FROM t2
WHERE (d>=3.0 AND d<4.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'opqrs*')
OR b=1015
OR c=16016
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR f='abcdefghi'
OR b=605
OR a=63;
SELECT a FROM t3
WHERE (d>=3.0 AND d<4.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'opqrs*')
OR b=1015
OR c=16016
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR f='abcdefghi'
OR b=605
OR a=63;
SELECT a FROM t2
WHERE (g='yxwvuts' AND f GLOB 'bcdef*')
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR b=641
OR b=795;
SELECT a FROM t3
WHERE (g='yxwvuts' AND f GLOB 'bcdef*')
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR b=641
OR b=795;
SELECT a FROM t2
WHERE f='fghijklmn'
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR (d>=15.0 AND d<16.0 AND d NOT NULL);
SELECT a FROM t3
WHERE f='fghijklmn'
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR (d>=15.0 AND d<16.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 99 AND 101) AND a!=100)
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR a=92
OR b=1100
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR ((a BETWEEN 30 AND 32) AND a!=31);
SELECT a FROM t3
WHERE ((a BETWEEN 99 AND 101) AND a!=100)
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR a=92
OR b=1100
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR ((a BETWEEN 30 AND 32) AND a!=31);
SELECT a FROM t2
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=880
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR b=1089
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR f IS NULL
OR (f GLOB '?ghij*' AND f GLOB 'fghi*');
SELECT a FROM t3
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=880
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR b=1089
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR f IS NULL
OR (f GLOB '?ghij*' AND f GLOB 'fghi*');
SELECT a FROM t2
WHERE b=1026
OR b=407
OR (g='srqponm' AND f GLOB 'fghij*')
OR b=564
OR c=23023
OR b=891
OR c=22022
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR (g='rqponml' AND f GLOB 'ijklm*')
OR (g='utsrqpo' AND f GLOB 'vwxyz*');
SELECT a FROM t3
WHERE b=1026
OR b=407
OR (g='srqponm' AND f GLOB 'fghij*')
OR b=564
OR c=23023
OR b=891
OR c=22022
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR (g='rqponml' AND f GLOB 'ijklm*')
OR (g='utsrqpo' AND f GLOB 'vwxyz*');
SELECT a FROM t2
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR a=72
OR a=43;
SELECT a FROM t3
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR a=72
OR a=43;
SELECT a FROM t2
WHERE ((a BETWEEN 67 AND 69) AND a!=68)
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR c=18018
OR b=792
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR f='uvwxyzabc'
OR (d>=74.0 AND d<75.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 67 AND 69) AND a!=68)
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR c=18018
OR b=792
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR f='uvwxyzabc'
OR (d>=74.0 AND d<75.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=429
OR (d>=33.0 AND d<34.0 AND d NOT NULL)
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR b=1070
OR (g='vutsrqp' AND f GLOB 'rstuv*');
SELECT a FROM t3
WHERE b=429
OR (d>=33.0 AND d<34.0 AND d NOT NULL)
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR b=1070
OR (g='vutsrqp' AND f GLOB 'rstuv*');
SELECT a FROM t2
WHERE (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=572;
SELECT a FROM t3
WHERE (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=572;
SELECT a FROM t2
WHERE ((a BETWEEN 62 AND 64) AND a!=63)
OR f='abcdefghi'
OR (g='wvutsrq' AND f GLOB 'ijklm*');
SELECT a FROM t3
WHERE ((a BETWEEN 62 AND 64) AND a!=63)
OR f='abcdefghi'
OR (g='wvutsrq' AND f GLOB 'ijklm*');
SELECT a FROM t2
WHERE a=40
OR ((a BETWEEN 85 AND 87) AND a!=86);
SELECT a FROM t3
WHERE a=40
OR ((a BETWEEN 85 AND 87) AND a!=86);
SELECT a FROM t2
WHERE a=43
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR a=1
OR ((a BETWEEN 75 AND 77) AND a!=76)
OR a=75
OR (g='hgfedcb' AND f GLOB 'fghij*')
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t3
WHERE a=43
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR a=1
OR ((a BETWEEN 75 AND 77) AND a!=76)
OR a=75
OR (g='hgfedcb' AND f GLOB 'fghij*')
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t2
WHERE (g='gfedcba' AND f GLOB 'nopqr*')
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR b=231
OR a=87;
SELECT a FROM t3
WHERE (g='gfedcba' AND f GLOB 'nopqr*')
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR b=231
OR a=87;
SELECT a FROM t2
WHERE a=77
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR (g='rqponml' AND f GLOB 'hijkl*')
OR c=24024
OR c=5005;
SELECT a FROM t3
WHERE a=77
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR (g='rqponml' AND f GLOB 'hijkl*')
OR c=24024
OR c=5005;
SELECT a FROM t2
WHERE (g='mlkjihg' AND f GLOB 'ijklm*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (g='srqponm' AND f GLOB 'defgh*')
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR b=682
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR (d>=22.0 AND d<23.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='mlkjihg' AND f GLOB 'ijklm*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (g='srqponm' AND f GLOB 'defgh*')
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR b=682
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR (d>=22.0 AND d<23.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=212
OR b=121
OR c=2002
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR (g='jihgfed' AND f GLOB 'xyzab*');
SELECT a FROM t3
WHERE b=212
OR b=121
OR c=2002
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR (g='jihgfed' AND f GLOB 'xyzab*');
SELECT a FROM t2
WHERE (d>=55.0 AND d<56.0 AND d NOT NULL)
OR f='abcdefghi'
OR b=267
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR a=82
OR a=54
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=1078;
SELECT a FROM t3
WHERE (d>=55.0 AND d<56.0 AND d NOT NULL)
OR f='abcdefghi'
OR b=267
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR a=82
OR a=54
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=1078;
SELECT a FROM t2
WHERE (d>=93.0 AND d<94.0 AND d NOT NULL)
OR f='hijklmnop'
OR (d>=34.0 AND d<35.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=93.0 AND d<94.0 AND d NOT NULL)
OR f='hijklmnop'
OR (d>=34.0 AND d<35.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 98 AND 100) AND a!=99)
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR a=18
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR 1000000<b
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR (g='rqponml' AND f GLOB 'lmnop*')
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*');
SELECT a FROM t3
WHERE ((a BETWEEN 98 AND 100) AND a!=99)
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR a=18
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR 1000000<b
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR (g='rqponml' AND f GLOB 'lmnop*')
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*');
SELECT a FROM t2
WHERE b=1001
OR b=168
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR (d>=89.0 AND d<90.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=1001
OR b=168
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR (d>=89.0 AND d<90.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=51
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR b=330;
SELECT a FROM t3
WHERE a=51
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR b=330;
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=704
OR a=62
OR f='pqrstuvwx'
OR b=495
OR c=26026
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b<0
OR b=597;
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=704
OR a=62
OR f='pqrstuvwx'
OR b=495
OR c=26026
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b<0
OR b=597;
SELECT a FROM t2
WHERE (d>=2.0 AND d<3.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR b=520
OR ((a BETWEEN 47 AND 49) AND a!=48)
OR f IS NULL;
SELECT a FROM t3
WHERE (d>=2.0 AND d<3.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR b=520
OR ((a BETWEEN 47 AND 49) AND a!=48)
OR f IS NULL;
SELECT a FROM t2
WHERE c=14014
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=572
OR c=15015;
SELECT a FROM t3
WHERE c=14014
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=572
OR c=15015;
SELECT a FROM t2
WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
OR b=850
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR b=88
OR f='hijklmnop'
OR b=806
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=88;
SELECT a FROM t3
WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
OR b=850
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR b=88
OR f='hijklmnop'
OR b=806
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=88;
SELECT a FROM t2
WHERE b=817
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR a=36
OR b=960
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR b=374
OR b=938
OR b=773
OR (g='jihgfed' AND f GLOB 'zabcd*')
OR (g='mlkjihg' AND f GLOB 'ghijk*');
SELECT a FROM t3
WHERE b=817
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR a=36
OR b=960
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR b=374
OR b=938
OR b=773
OR (g='jihgfed' AND f GLOB 'zabcd*')
OR (g='mlkjihg' AND f GLOB 'ghijk*');
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=146;
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=146;
SELECT a FROM t2
WHERE f='pqrstuvwx'
OR ((a BETWEEN 6 AND 8) AND a!=7)
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR b=704
OR a=18;
SELECT a FROM t3
WHERE f='pqrstuvwx'
OR ((a BETWEEN 6 AND 8) AND a!=7)
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR b=704
OR a=18;
SELECT a FROM t2
WHERE (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR b=399
OR b=1004
OR c=16016
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR b=671
OR a=25
OR a=30
OR a=8
OR (d>=5.0 AND d<6.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR b=399
OR b=1004
OR c=16016
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR b=671
OR a=25
OR a=30
OR a=8
OR (d>=5.0 AND d<6.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=561
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR b=594
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR b=861
OR (d>=90.0 AND d<91.0 AND d NOT NULL)
OR b=949
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR (g='nmlkjih' AND f GLOB 'cdefg*');
SELECT a FROM t3
WHERE b=561
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR b=594
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR b=861
OR (d>=90.0 AND d<91.0 AND d NOT NULL)
OR b=949
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR (g='nmlkjih' AND f GLOB 'cdefg*');
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'hijkl*')
OR a=83
OR c=26026
OR a=49
OR a=57
OR c=23023
OR f='uvwxyzabc';
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'hijkl*')
OR a=83
OR c=26026
OR a=49
OR a=57
OR c=23023
OR f='uvwxyzabc';
SELECT a FROM t2
WHERE d>1e10
OR b=355
OR f='stuvwxyza'
OR b=22;
SELECT a FROM t3
WHERE d>1e10
OR b=355
OR f='stuvwxyza'
OR b=22;
SELECT a FROM t2
WHERE b=451
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*');
SELECT a FROM t3
WHERE b=451
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*');
SELECT a FROM t2
WHERE b=47
OR (f GLOB '?cdef*' AND f GLOB 'bcde*');
SELECT a FROM t3
WHERE b=47
OR (f GLOB '?cdef*' AND f GLOB 'bcde*');
SELECT a FROM t2
WHERE b=1037
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=344
OR (d>=86.0 AND d<87.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=1037
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=344
OR (d>=86.0 AND d<87.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=506
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR b=429
OR b=275;
SELECT a FROM t3
WHERE b=506
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR b=429
OR b=275;
SELECT a FROM t2
WHERE ((a BETWEEN 60 AND 62) AND a!=61)
OR a=28
OR b=443
OR b=363
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR a=60
OR b=80
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR b=616;
SELECT a FROM t3
WHERE ((a BETWEEN 60 AND 62) AND a!=61)
OR a=28
OR b=443
OR b=363
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR a=60
OR b=80
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR b=616;
SELECT a FROM t2
WHERE (d>=33.0 AND d<34.0 AND d NOT NULL)
OR b=660;
SELECT a FROM t3
WHERE (d>=33.0 AND d<34.0 AND d NOT NULL)
OR b=660;
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'hijkl*')
OR a=43
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR b=586
OR c=17017
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR a=87
OR b=968;
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'hijkl*')
OR a=43
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR b=586
OR c=17017
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR a=87
OR b=968;
SELECT a FROM t2
WHERE f='klmnopqrs'
OR b=982
OR b=575
OR b=110
OR b=99;
SELECT a FROM t3
WHERE f='klmnopqrs'
OR b=982
OR b=575
OR b=110
OR b=99;
SELECT a FROM t2
WHERE (g='rqponml' AND f GLOB 'jklmn*')
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR c>=34035
OR b=850
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=924
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR b=355
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (d>=86.0 AND d<87.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='rqponml' AND f GLOB 'jklmn*')
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR c>=34035
OR b=850
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=924
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR b=355
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (d>=86.0 AND d<87.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=982
OR ((a BETWEEN 81 AND 83) AND a!=82)
OR b=374;
SELECT a FROM t3
WHERE (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=982
OR ((a BETWEEN 81 AND 83) AND a!=82)
OR b=374;
SELECT a FROM t2
WHERE ((a BETWEEN 87 AND 89) AND a!=88)
OR b=814
OR (d>=19.0 AND d<20.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 87 AND 89) AND a!=88)
OR b=814
OR (d>=19.0 AND d<20.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'nopqr*')
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=993;
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'nopqr*')
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=993;
SELECT a FROM t2
WHERE b=234
OR a=22
OR b=289
OR b=795
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR b=242
OR a=59
OR b=1045
OR (d>=8.0 AND d<9.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=234
OR a=22
OR b=289
OR b=795
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR b=242
OR a=59
OR b=1045
OR (d>=8.0 AND d<9.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=245
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR c=3003
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (d>=33.0 AND d<34.0 AND d NOT NULL)
OR ((a BETWEEN 71 AND 73) AND a!=72);
SELECT a FROM t3
WHERE b=245
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR c=3003
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (d>=33.0 AND d<34.0 AND d NOT NULL)
OR ((a BETWEEN 71 AND 73) AND a!=72);
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'jklmn*')
OR b=220
OR b=443
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR a=62
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR b=1023
OR a=100
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR (d>=97.0 AND d<98.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'jklmn*')
OR b=220
OR b=443
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR a=62
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR b=1023
OR a=100
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR (d>=97.0 AND d<98.0 AND d NOT NULL);
SELECT a FROM t2
WHERE c=11011
OR f='tuvwxyzab'
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR (g='hgfedcb' AND f GLOB 'ghijk*');
SELECT a FROM t3
WHERE c=11011
OR f='tuvwxyzab'
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR (g='hgfedcb' AND f GLOB 'ghijk*');
SELECT a FROM t2
WHERE ((a BETWEEN 93 AND 95) AND a!=94)
OR a=79
OR (d>=39.0 AND d<40.0 AND d NOT NULL)
OR b=462;
SELECT a FROM t3
WHERE ((a BETWEEN 93 AND 95) AND a!=94)
OR a=79
OR (d>=39.0 AND d<40.0 AND d NOT NULL)
OR b=462;
SELECT a FROM t2
WHERE (d>=33.0 AND d<34.0 AND d NOT NULL)
OR b=146
OR 1000000<b
OR b=99
OR ((a BETWEEN 75 AND 77) AND a!=76);
SELECT a FROM t3
WHERE (d>=33.0 AND d<34.0 AND d NOT NULL)
OR b=146
OR 1000000<b
OR b=99
OR ((a BETWEEN 75 AND 77) AND a!=76);
SELECT a FROM t2
WHERE b=935
OR b=473
OR a=28
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR ((a BETWEEN 62 AND 64) AND a!=63)
OR a=62
OR b=619
OR a=82
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR c=14014
OR (d>=43.0 AND d<44.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=935
OR b=473
OR a=28
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR ((a BETWEEN 62 AND 64) AND a!=63)
OR a=62
OR b=619
OR a=82
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR c=14014
OR (d>=43.0 AND d<44.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=443
OR b=33
OR b=762
OR b=575
OR c=16016
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR b=1092;
SELECT a FROM t3
WHERE (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=443
OR b=33
OR b=762
OR b=575
OR c=16016
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR b=1092;
SELECT a FROM t2
WHERE b=806
OR b=872
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR f='uvwxyzabc'
OR b=748
OR b=586
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR (g='gfedcba' AND f GLOB 'klmno*')
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR b=891;
SELECT a FROM t3
WHERE b=806
OR b=872
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR f='uvwxyzabc'
OR b=748
OR b=586
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR (g='gfedcba' AND f GLOB 'klmno*')
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR b=891;
SELECT a FROM t2
WHERE b=693
OR f='fghijklmn'
OR (g='rqponml' AND f GLOB 'hijkl*')
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR ((a BETWEEN 71 AND 73) AND a!=72)
OR a=96;
SELECT a FROM t3
WHERE b=693
OR f='fghijklmn'
OR (g='rqponml' AND f GLOB 'hijkl*')
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR ((a BETWEEN 71 AND 73) AND a!=72)
OR a=96;
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'ijklm*')
OR b=451
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR a=84;
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'ijklm*')
OR b=451
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR a=84;
SELECT a FROM t2
WHERE (g='nmlkjih' AND f GLOB 'bcdef*')
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR a=75
OR b=960
OR (g='tsrqpon' AND f GLOB 'yzabc*')
OR b=616
OR b=330
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR a=26
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t3
WHERE (g='nmlkjih' AND f GLOB 'bcdef*')
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR a=75
OR b=960
OR (g='tsrqpon' AND f GLOB 'yzabc*')
OR b=616
OR b=330
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR a=26
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t2
WHERE b=762
OR (g='nmlkjih' AND f GLOB 'bcdef*');
SELECT a FROM t3
WHERE b=762
OR (g='nmlkjih' AND f GLOB 'bcdef*');
SELECT a FROM t2
WHERE b=14
OR a=23
OR b=748
OR b=407
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=979
OR ((a BETWEEN 15 AND 17) AND a!=16);
SELECT a FROM t3
WHERE b=14
OR a=23
OR b=748
OR b=407
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=979
OR ((a BETWEEN 15 AND 17) AND a!=16);
SELECT a FROM t2
WHERE ((a BETWEEN 36 AND 38) AND a!=37)
OR a=92;
SELECT a FROM t3
WHERE ((a BETWEEN 36 AND 38) AND a!=37)
OR a=92;
SELECT a FROM t2
WHERE c=14014
OR b=927
OR b=176
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR b=220
OR (g='tsrqpon' AND f GLOB 'yzabc*')
OR a=4;
SELECT a FROM t3
WHERE c=14014
OR b=927
OR b=176
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR b=220
OR (g='tsrqpon' AND f GLOB 'yzabc*')
OR a=4;
SELECT a FROM t2
WHERE a=29
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=979
OR b=275
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=41.0 AND d<42.0 AND d NOT NULL)
OR b=539
OR a=87;
SELECT a FROM t3
WHERE a=29
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=979
OR b=275
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=41.0 AND d<42.0 AND d NOT NULL)
OR b=539
OR a=87;
SELECT a FROM t2
WHERE ((a BETWEEN 43 AND 45) AND a!=44)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR f='fghijklmn'
OR (g='rqponml' AND f GLOB 'klmno*')
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR a=74
OR ((a BETWEEN 7 AND 9) AND a!=8);
SELECT a FROM t3
WHERE ((a BETWEEN 43 AND 45) AND a!=44)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR f='fghijklmn'
OR (g='rqponml' AND f GLOB 'klmno*')
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR a=74
OR ((a BETWEEN 7 AND 9) AND a!=8);
SELECT a FROM t2
WHERE ((a BETWEEN 80 AND 82) AND a!=81)
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR (g='ihgfedc' AND f GLOB 'bcdef*');
SELECT a FROM t3
WHERE ((a BETWEEN 80 AND 82) AND a!=81)
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR (g='ihgfedc' AND f GLOB 'bcdef*');
SELECT a FROM t2
WHERE ((a BETWEEN 58 AND 60) AND a!=59)
OR b=696
OR f='tuvwxyzab'
OR b=374
OR b=110
OR a=90;
SELECT a FROM t3
WHERE ((a BETWEEN 58 AND 60) AND a!=59)
OR b=696
OR f='tuvwxyzab'
OR b=374
OR b=110
OR a=90;
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'ghijk*')
OR c=23023
OR b=377
OR b=858
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'ghijk*')
OR c=23023
OR b=377
OR b=858
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE (d>=38.0 AND d<39.0 AND d NOT NULL)
OR b=322
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'pqrst*')
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR b=432
OR b=55
OR a=53
OR (d>=74.0 AND d<75.0 AND d NOT NULL)
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR b=25;
SELECT a FROM t3
WHERE (d>=38.0 AND d<39.0 AND d NOT NULL)
OR b=322
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'pqrst*')
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR b=432
OR b=55
OR a=53
OR (d>=74.0 AND d<75.0 AND d NOT NULL)
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR b=25;
SELECT a FROM t2
WHERE b=484
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR b=616
OR c=5005
OR ((a BETWEEN 27 AND 29) AND a!=28);
SELECT a FROM t3
WHERE b=484
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR b=616
OR c=5005
OR ((a BETWEEN 27 AND 29) AND a!=28);
SELECT a FROM t2
WHERE b=916
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=1048
OR c=6006
OR b=762
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR b=751
OR (d>=73.0 AND d<74.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=916
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=1048
OR c=6006
OR b=762
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR b=751
OR (d>=73.0 AND d<74.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=32.0 AND d<33.0 AND d NOT NULL)
OR b=927
OR b=275
OR b=396
OR c=4004
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR b=319
OR ((a BETWEEN 83 AND 85) AND a!=84)
OR a=3
OR ((a BETWEEN 73 AND 75) AND a!=74);
SELECT a FROM t3
WHERE (d>=32.0 AND d<33.0 AND d NOT NULL)
OR b=927
OR b=275
OR b=396
OR c=4004
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR b=319
OR ((a BETWEEN 83 AND 85) AND a!=84)
OR a=3
OR ((a BETWEEN 73 AND 75) AND a!=74);
SELECT a FROM t2
WHERE (g='wvutsrq' AND f GLOB 'lmnop*')
OR b=718
OR f='vwxyzabcd'
OR (d>=98.0 AND d<99.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (d>=11.0 AND d<12.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='wvutsrq' AND f GLOB 'lmnop*')
OR b=718
OR f='vwxyzabcd'
OR (d>=98.0 AND d<99.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (d>=11.0 AND d<12.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=187
OR b=1056
OR b=861
OR b=1081
OR b=572
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR a=11
OR ((a BETWEEN 99 AND 101) AND a!=100)
OR a=89
OR b=421;
SELECT a FROM t3
WHERE b=187
OR b=1056
OR b=861
OR b=1081
OR b=572
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR a=11
OR ((a BETWEEN 99 AND 101) AND a!=100)
OR a=89
OR b=421;
SELECT a FROM t2
WHERE b=231
OR b=388
OR d<0.0
OR (d>=39.0 AND d<40.0 AND d NOT NULL)
OR b=1045
OR (d>=12.0 AND d<13.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=231
OR b=388
OR d<0.0
OR (d>=39.0 AND d<40.0 AND d NOT NULL)
OR b=1045
OR (d>=12.0 AND d<13.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=528
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR b=762;
SELECT a FROM t3
WHERE b=528
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR b=762;
SELECT a FROM t2
WHERE f='stuvwxyza'
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR b=916;
SELECT a FROM t3
WHERE f='stuvwxyza'
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR b=916;
SELECT a FROM t2
WHERE (d>=52.0 AND d<53.0 AND d NOT NULL)
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR (d>=4.0 AND d<5.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=52.0 AND d<53.0 AND d NOT NULL)
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR (d>=4.0 AND d<5.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=102
OR c=6006
OR b=231
OR b=212
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'klmno*')
OR c=30030
OR (g='onmlkji' AND f GLOB 'abcde*');
SELECT a FROM t3
WHERE b=102
OR c=6006
OR b=231
OR b=212
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'klmno*')
OR c=30030
OR (g='onmlkji' AND f GLOB 'abcde*');
SELECT a FROM t2
WHERE a=47
OR a=82
OR c=25025
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR f='qrstuvwxy'
OR a=5;
SELECT a FROM t3
WHERE a=47
OR a=82
OR c=25025
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR f='qrstuvwxy'
OR a=5;
SELECT a FROM t2
WHERE b=429
OR a=30
OR f='vwxyzabcd'
OR b=762
OR a=60
OR (g='srqponm' AND f GLOB 'efghi*')
OR (g='xwvutsr' AND f GLOB 'efghi*');
SELECT a FROM t3
WHERE b=429
OR a=30
OR f='vwxyzabcd'
OR b=762
OR a=60
OR (g='srqponm' AND f GLOB 'efghi*')
OR (g='xwvutsr' AND f GLOB 'efghi*');
SELECT a FROM t2
WHERE (g='mlkjihg' AND f GLOB 'ghijk*')
OR a=3
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=498
OR a=100
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR a=69;
SELECT a FROM t3
WHERE (g='mlkjihg' AND f GLOB 'ghijk*')
OR a=3
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=498
OR a=100
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR a=69;
SELECT a FROM t2
WHERE (g='ihgfedc' AND f GLOB 'efghi*')
OR b=300
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR b=58
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR b=286
OR b=234
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR f='ghijklmno'
OR (d>=26.0 AND d<27.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='ihgfedc' AND f GLOB 'efghi*')
OR b=300
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR b=58
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR b=286
OR b=234
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR f='ghijklmno'
OR (d>=26.0 AND d<27.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=95
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR b=594
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR ((a BETWEEN 53 AND 55) AND a!=54);
SELECT a FROM t3
WHERE a=95
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR b=594
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR ((a BETWEEN 53 AND 55) AND a!=54);
SELECT a FROM t2
WHERE b=949
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR (g='vutsrqp' AND f GLOB 'opqrs*');
SELECT a FROM t3
WHERE b=949
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR (g='vutsrqp' AND f GLOB 'opqrs*');
SELECT a FROM t2
WHERE b=960
OR a=44
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR a=39
OR b=828
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR d<0.0
OR b=770
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR b=594
OR ((a BETWEEN 89 AND 91) AND a!=90);
SELECT a FROM t3
WHERE b=960
OR a=44
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR a=39
OR b=828
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR d<0.0
OR b=770
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR b=594
OR ((a BETWEEN 89 AND 91) AND a!=90);
SELECT a FROM t2
WHERE ((a BETWEEN 40 AND 42) AND a!=41)
OR b=198
OR a=51
OR b=1056
OR b=748
OR ((a BETWEEN 9 AND 11) AND a!=10);
SELECT a FROM t3
WHERE ((a BETWEEN 40 AND 42) AND a!=41)
OR b=198
OR a=51
OR b=1056
OR b=748
OR ((a BETWEEN 9 AND 11) AND a!=10);
SELECT a FROM t2
WHERE b=1081
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=1004
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR ((a BETWEEN 29 AND 31) AND a!=30)
OR b=660
OR b=957
OR b=869;
SELECT a FROM t3
WHERE b=1081
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=1004
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR ((a BETWEEN 29 AND 31) AND a!=30)
OR b=660
OR b=957
OR b=869;
SELECT a FROM t2
WHERE b=927
OR c=12012
OR f='yzabcdefg'
OR b=880
OR a=63
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR (g='hgfedcb' AND f GLOB 'ijklm*');
SELECT a FROM t3
WHERE b=927
OR c=12012
OR f='yzabcdefg'
OR b=880
OR a=63
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR (g='hgfedcb' AND f GLOB 'ijklm*');
SELECT a FROM t2
WHERE a=69
OR b=1103
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR f='wxyzabcde'
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR (g='gfedcba' AND f GLOB 'klmno*')
OR f='pqrstuvwx'
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR a=59
OR b=946;
SELECT a FROM t3
WHERE a=69
OR b=1103
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR f='wxyzabcde'
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR (g='gfedcba' AND f GLOB 'klmno*')
OR f='pqrstuvwx'
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR a=59
OR b=946;
SELECT a FROM t2
WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR a=68
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t3
WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR a=68
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t2
WHERE (d>=10.0 AND d<11.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'lmnop*');
SELECT a FROM t3
WHERE (d>=10.0 AND d<11.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'lmnop*');
SELECT a FROM t2
WHERE a=32
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR ((a BETWEEN 92 AND 94) AND a!=93)
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR c=7007
OR b=968
OR (d>=18.0 AND d<19.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=32
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR ((a BETWEEN 92 AND 94) AND a!=93)
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR c=7007
OR b=968
OR (d>=18.0 AND d<19.0 AND d NOT NULL);
SELECT a FROM t2
WHERE f='cdefghijk'
OR b=1103;
SELECT a FROM t3
WHERE f='cdefghijk'
OR b=1103;
SELECT a FROM t2
WHERE ((a BETWEEN 21 AND 23) AND a!=22)
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR c=14014
OR b=990
OR (g='nmlkjih' AND f GLOB 'efghi*')
OR c=14014
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR b=740
OR c=3003;
SELECT a FROM t3
WHERE ((a BETWEEN 21 AND 23) AND a!=22)
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR c=14014
OR b=990
OR (g='nmlkjih' AND f GLOB 'efghi*')
OR c=14014
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR b=740
OR c=3003;
SELECT a FROM t2
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR a=67
OR b=135
OR f='bcdefghij'
OR b=924
OR (d>=22.0 AND d<23.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR a=67
OR b=135
OR f='bcdefghij'
OR b=924
OR (d>=22.0 AND d<23.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=96
OR a=13;
SELECT a FROM t3
WHERE a=96
OR a=13;
SELECT a FROM t2
WHERE ((a BETWEEN 34 AND 36) AND a!=35)
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR ((a BETWEEN 35 AND 37) AND a!=36)
OR a=49
OR a=38
OR b=157
OR a=4
OR b=311
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR b=396;
SELECT a FROM t3
WHERE ((a BETWEEN 34 AND 36) AND a!=35)
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR ((a BETWEEN 35 AND 37) AND a!=36)
OR a=49
OR a=38
OR b=157
OR a=4
OR b=311
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR b=396;
SELECT a FROM t2
WHERE a=82
OR b=333
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR b=99
OR a=63
OR a=35
OR b=176;
SELECT a FROM t3
WHERE a=82
OR b=333
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR b=99
OR a=63
OR a=35
OR b=176;
SELECT a FROM t2
WHERE a=90
OR a=81
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR f='mnopqrstu'
OR b=927
OR b=311
OR a=34
OR b=715
OR f='rstuvwxyz';
SELECT a FROM t3
WHERE a=90
OR a=81
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR f='mnopqrstu'
OR b=927
OR b=311
OR a=34
OR b=715
OR f='rstuvwxyz';
SELECT a FROM t2
WHERE b=484
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR f='lmnopqrst'
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR b<0
OR b=231
OR a=14;
SELECT a FROM t3
WHERE b=484
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR f='lmnopqrst'
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR b<0
OR b=231
OR a=14;
SELECT a FROM t2
WHERE b=905
OR f='hijklmnop'
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR b=817
OR (d>=20.0 AND d<21.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=905
OR f='hijklmnop'
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR b=817
OR (d>=20.0 AND d<21.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
OR b=311
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR a=48
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR c=32032
OR f='opqrstuvw'
OR b=300
OR b=1001
OR ((a BETWEEN 94 AND 96) AND a!=95);
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
OR b=311
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR a=48
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR c=32032
OR f='opqrstuvw'
OR b=300
OR b=1001
OR ((a BETWEEN 94 AND 96) AND a!=95);
SELECT a FROM t2
WHERE (d>=95.0 AND d<96.0 AND d NOT NULL)
OR b=1070
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR a=22
OR (d>=11.0 AND d<12.0 AND d NOT NULL)
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR f='tuvwxyzab'
OR a=72
OR ((a BETWEEN 53 AND 55) AND a!=54);
SELECT a FROM t3
WHERE (d>=95.0 AND d<96.0 AND d NOT NULL)
OR b=1070
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR a=22
OR (d>=11.0 AND d<12.0 AND d NOT NULL)
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR f='tuvwxyzab'
OR a=72
OR ((a BETWEEN 53 AND 55) AND a!=54);
SELECT a FROM t2
WHERE (d>=8.0 AND d<9.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR a=21
OR b=1026
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR b=473;
SELECT a FROM t3
WHERE (d>=8.0 AND d<9.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR a=21
OR b=1026
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR b=473;
SELECT a FROM t2
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR a=100
OR a=29
OR c=15015
OR a=87
OR (g='gfedcba' AND f GLOB 'klmno*');
SELECT a FROM t3
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR a=100
OR a=29
OR c=15015
OR a=87
OR (g='gfedcba' AND f GLOB 'klmno*');
SELECT a FROM t2
WHERE (d>=1.0 AND d<2.0 AND d NOT NULL)
OR b=542
OR b=638;
SELECT a FROM t3
WHERE (d>=1.0 AND d<2.0 AND d NOT NULL)
OR b=542
OR b=638;
SELECT a FROM t2
WHERE ((a BETWEEN 5 AND 7) AND a!=6)
OR b=1070
OR a=91
OR b=1015
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR ((a BETWEEN 91 AND 93) AND a!=92);
SELECT a FROM t3
WHERE ((a BETWEEN 5 AND 7) AND a!=6)
OR b=1070
OR a=91
OR b=1015
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR ((a BETWEEN 91 AND 93) AND a!=92);
SELECT a FROM t2
WHERE a=7
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR b=1015
OR b=839
OR (g='rqponml' AND f GLOB 'klmno*')
OR b=410
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR a=71;
SELECT a FROM t3
WHERE a=7
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR b=1015
OR b=839
OR (g='rqponml' AND f GLOB 'klmno*')
OR b=410
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR a=71;
SELECT a FROM t2
WHERE b=880
OR b=982
OR a=52
OR (g='onmlkji' AND f GLOB 'abcde*')
OR a=24
OR ((a BETWEEN 47 AND 49) AND a!=48)
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR (f GLOB '?zabc*' AND f GLOB 'yzab*');
SELECT a FROM t3
WHERE b=880
OR b=982
OR a=52
OR (g='onmlkji' AND f GLOB 'abcde*')
OR a=24
OR ((a BETWEEN 47 AND 49) AND a!=48)
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR (f GLOB '?zabc*' AND f GLOB 'yzab*');
SELECT a FROM t2
WHERE ((a BETWEEN 67 AND 69) AND a!=68)
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR (f GLOB '?ghij*' AND f GLOB 'fghi*');
SELECT a FROM t3
WHERE ((a BETWEEN 67 AND 69) AND a!=68)
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR (f GLOB '?ghij*' AND f GLOB 'fghi*');
SELECT a FROM t2
WHERE f='abcdefghi'
OR a=5
OR b=124
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=432
OR 1000000<b
OR a=58
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=77
OR b=605;
SELECT a FROM t3
WHERE f='abcdefghi'
OR a=5
OR b=124
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=432
OR 1000000<b
OR a=58
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=77
OR b=605;
SELECT a FROM t2
WHERE (d>=89.0 AND d<90.0 AND d NOT NULL)
OR b=583
OR a=62;
SELECT a FROM t3
WHERE (d>=89.0 AND d<90.0 AND d NOT NULL)
OR b=583
OR a=62;
SELECT a FROM t2
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR f='pqrstuvwx'
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR b=278
OR a=10
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR f='uvwxyzabc';
SELECT a FROM t3
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR f='pqrstuvwx'
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR b=278
OR a=10
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR f='uvwxyzabc';
SELECT a FROM t2
WHERE ((a BETWEEN 57 AND 59) AND a!=58)
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR b=564
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR b=77
OR (g='nmlkjih' AND f GLOB 'efghi*')
OR b=968
OR b=847
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR (g='lkjihgf' AND f GLOB 'opqrs*');
SELECT a FROM t3
WHERE ((a BETWEEN 57 AND 59) AND a!=58)
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR b=564
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR b=77
OR (g='nmlkjih' AND f GLOB 'efghi*')
OR b=968
OR b=847
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR (g='lkjihgf' AND f GLOB 'opqrs*');
SELECT a FROM t2
WHERE b=539
OR b=594
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR f='abcdefghi'
OR a=6
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR b=762;
SELECT a FROM t3
WHERE b=539
OR b=594
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR f='abcdefghi'
OR a=6
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR b=762;
SELECT a FROM t2
WHERE b=869
OR b=630;
SELECT a FROM t3
WHERE b=869
OR b=630;
SELECT a FROM t2
WHERE (d>=72.0 AND d<73.0 AND d NOT NULL)
OR b=693
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR b=968
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR b=132
OR f='nopqrstuv'
OR ((a BETWEEN 28 AND 30) AND a!=29);
SELECT a FROM t3
WHERE (d>=72.0 AND d<73.0 AND d NOT NULL)
OR b=693
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR b=968
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR b=132
OR f='nopqrstuv'
OR ((a BETWEEN 28 AND 30) AND a!=29);
SELECT a FROM t2
WHERE c=32032
OR b=814
OR (d>=90.0 AND d<91.0 AND d NOT NULL)
OR b=814
OR a=78
OR a=37;
SELECT a FROM t3
WHERE c=32032
OR b=814
OR (d>=90.0 AND d<91.0 AND d NOT NULL)
OR b=814
OR a=78
OR a=37;
SELECT a FROM t2
WHERE b=190
OR (g='mlkjihg' AND f GLOB 'hijkl*')
OR b=924
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=759
OR (g='yxwvuts' AND f GLOB 'bcdef*');
SELECT a FROM t3
WHERE b=190
OR (g='mlkjihg' AND f GLOB 'hijkl*')
OR b=924
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=759
OR (g='yxwvuts' AND f GLOB 'bcdef*');
SELECT a FROM t2
WHERE a=97
OR b=201
OR b=597
OR a=6
OR f='cdefghijk'
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR b=300
OR b=693
OR b=333
OR b=740;
SELECT a FROM t3
WHERE a=97
OR b=201
OR b=597
OR a=6
OR f='cdefghijk'
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR b=300
OR b=693
OR b=333
OR b=740;
SELECT a FROM t2
WHERE c=26026
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR c=17017
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (g='srqponm' AND f GLOB 'ghijk*')
OR (g='jihgfed' AND f GLOB 'zabcd*')
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR (d>=43.0 AND d<44.0 AND d NOT NULL);
SELECT a FROM t3
WHERE c=26026
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR c=17017
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (g='srqponm' AND f GLOB 'ghijk*')
OR (g='jihgfed' AND f GLOB 'zabcd*')
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR (d>=43.0 AND d<44.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=70.0 AND d<71.0 AND d NOT NULL)
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR b=638
OR b=495
OR a=44
OR b=374
OR a=22
OR c=12012;
SELECT a FROM t3
WHERE (d>=70.0 AND d<71.0 AND d NOT NULL)
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR b=638
OR b=495
OR a=44
OR b=374
OR a=22
OR c=12012;
SELECT a FROM t2
WHERE c=8008
OR (d>=39.0 AND d<40.0 AND d NOT NULL)
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR b=300
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR a=41
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR b=135
OR b=605;
SELECT a FROM t3
WHERE c=8008
OR (d>=39.0 AND d<40.0 AND d NOT NULL)
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR b=300
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR a=41
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR b=135
OR b=605;
SELECT a FROM t2
WHERE (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR (g='srqponm' AND f GLOB 'efghi*')
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR b=762
OR b=484
OR b=190
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR (d>=74.0 AND d<75.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=1023;
SELECT a FROM t3
WHERE (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR (g='srqponm' AND f GLOB 'efghi*')
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR b=762
OR b=484
OR b=190
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR (d>=74.0 AND d<75.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=1023;
SELECT a FROM t2
WHERE (g='ihgfedc' AND f GLOB 'efghi*')
OR a=34
OR f='rstuvwxyz'
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=729;
SELECT a FROM t3
WHERE (g='ihgfedc' AND f GLOB 'efghi*')
OR a=34
OR f='rstuvwxyz'
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=729;
SELECT a FROM t2
WHERE (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=1004
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR g IS NULL;
SELECT a FROM t3
WHERE (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=1004
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR g IS NULL;
SELECT a FROM t2
WHERE a=73
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR a=9
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR a=44
OR a=23
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR (g='rqponml' AND f GLOB 'lmnop*');
SELECT a FROM t3
WHERE a=73
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR a=9
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR a=44
OR a=23
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR (g='rqponml' AND f GLOB 'lmnop*');
SELECT a FROM t2
WHERE b=487
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR a=11
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR a=13
OR a=15
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR a=36;
SELECT a FROM t3
WHERE b=487
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR a=11
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR a=13
OR a=15
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR a=36;
SELECT a FROM t2
WHERE b=938
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (d>=32.0 AND d<33.0 AND d NOT NULL)
OR b=245
OR (d>=35.0 AND d<36.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=938
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (d>=32.0 AND d<33.0 AND d NOT NULL)
OR b=245
OR (d>=35.0 AND d<36.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=1078
OR c=19019
OR a=38
OR a=59
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR c=25025
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR (d>=76.0 AND d<77.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=1078
OR c=19019
OR a=38
OR a=59
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR c=25025
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR (d>=76.0 AND d<77.0 AND d NOT NULL);
SELECT a FROM t2
WHERE f='cdefghijk'
OR b=168
OR b=561
OR a=81
OR a=87;
SELECT a FROM t3
WHERE f='cdefghijk'
OR b=168
OR b=561
OR a=81
OR a=87;
SELECT a FROM t2
WHERE (g='gfedcba' AND f GLOB 'klmno*')
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR (g='rqponml' AND f GLOB 'hijkl*')
OR a=48
OR b=113
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR b=880
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'bcdef*');
SELECT a FROM t3
WHERE (g='gfedcba' AND f GLOB 'klmno*')
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR (g='rqponml' AND f GLOB 'hijkl*')
OR a=48
OR b=113
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR b=880
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'bcdef*');
SELECT a FROM t2
WHERE b=517
OR b=187
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR b=1092
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR (g='ponmlkj' AND f GLOB 'vwxyz*');
SELECT a FROM t3
WHERE b=517
OR b=187
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR b=1092
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR (g='ponmlkj' AND f GLOB 'vwxyz*');
SELECT a FROM t2
WHERE b=982
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=234
OR c=15015
OR a=47
OR f='qrstuvwxy'
OR (d>=65.0 AND d<66.0 AND d NOT NULL)
OR b=814
OR b=440
OR b=454;
SELECT a FROM t3
WHERE b=982
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=234
OR c=15015
OR a=47
OR f='qrstuvwxy'
OR (d>=65.0 AND d<66.0 AND d NOT NULL)
OR b=814
OR b=440
OR b=454;
SELECT a FROM t2
WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
OR c=7007
OR b=429
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR b=231
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR c=22022
OR f='bcdefghij';
SELECT a FROM t3
WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
OR c=7007
OR b=429
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR b=231
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR c=22022
OR f='bcdefghij';
SELECT a FROM t2
WHERE c=17017
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR b=784
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR ((a BETWEEN 54 AND 56) AND a!=55)
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR f='zabcdefgh';
SELECT a FROM t3
WHERE c=17017
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR b=784
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR ((a BETWEEN 54 AND 56) AND a!=55)
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR f='zabcdefgh';
SELECT a FROM t2
WHERE b=344
OR b=275
OR c<=10;
SELECT a FROM t3
WHERE b=344
OR b=275
OR c<=10;
SELECT a FROM t2
WHERE ((a BETWEEN 44 AND 46) AND a!=45)
OR a=76
OR b=154
OR a=30
OR c=3003
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
OR b=564
OR b=55
OR a=38;
SELECT a FROM t3
WHERE ((a BETWEEN 44 AND 46) AND a!=45)
OR a=76
OR b=154
OR a=30
OR c=3003
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
OR b=564
OR b=55
OR a=38;
SELECT a FROM t2
WHERE a=52
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR (d>=54.0 AND d<55.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=52
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR (d>=54.0 AND d<55.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=792
OR (g='wvutsrq' AND f GLOB 'jklmn*');
SELECT a FROM t3
WHERE b=792
OR (g='wvutsrq' AND f GLOB 'jklmn*');
SELECT a FROM t2
WHERE (d>=73.0 AND d<74.0 AND d NOT NULL)
OR c=21021
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR f='zabcdefgh'
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR b=781
OR a=64
OR (d>=11.0 AND d<12.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=73.0 AND d<74.0 AND d NOT NULL)
OR c=21021
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR f='zabcdefgh'
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR b=781
OR a=64
OR (d>=11.0 AND d<12.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='lkjihgf' AND f GLOB 'pqrst*')
OR (d>=90.0 AND d<91.0 AND d NOT NULL)
OR a=34
OR (g='rqponml' AND f GLOB 'ijklm*')
OR (g='rqponml' AND f GLOB 'klmno*')
OR (g='srqponm' AND f GLOB 'defgh*')
OR b=319
OR b=330
OR ((a BETWEEN 28 AND 30) AND a!=29);
SELECT a FROM t3
WHERE (g='lkjihgf' AND f GLOB 'pqrst*')
OR (d>=90.0 AND d<91.0 AND d NOT NULL)
OR a=34
OR (g='rqponml' AND f GLOB 'ijklm*')
OR (g='rqponml' AND f GLOB 'klmno*')
OR (g='srqponm' AND f GLOB 'defgh*')
OR b=319
OR b=330
OR ((a BETWEEN 28 AND 30) AND a!=29);
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'pqrst*')
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR a=45
OR (d>=81.0 AND d<82.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'pqrst*')
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR a=45
OR (d>=81.0 AND d<82.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=53.0 AND d<54.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR b=165
OR b=836;
SELECT a FROM t3
WHERE (d>=53.0 AND d<54.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR b=165
OR b=836;
SELECT a FROM t2
WHERE b=1034
OR f='vwxyzabcd'
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR ((a BETWEEN 57 AND 59) AND a!=58);
SELECT a FROM t3
WHERE b=1034
OR f='vwxyzabcd'
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR ((a BETWEEN 57 AND 59) AND a!=58);
SELECT a FROM t2
WHERE b=440
OR a=19
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR c=22022
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR a=92
OR b=1026
OR b=608;
SELECT a FROM t3
WHERE b=440
OR a=19
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR c=22022
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR a=92
OR b=1026
OR b=608;
SELECT a FROM t2
WHERE a=37
OR b=88
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR c=23023
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR a=56
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR f='ijklmnopq'
OR ((a BETWEEN 85 AND 87) AND a!=86);
SELECT a FROM t3
WHERE a=37
OR b=88
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR c=23023
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR a=56
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR f='ijklmnopq'
OR ((a BETWEEN 85 AND 87) AND a!=86);
SELECT a FROM t2
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR a=74
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 42 AND 44) AND a!=43);
SELECT a FROM t3
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR a=74
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 42 AND 44) AND a!=43);
SELECT a FROM t2
WHERE f='uvwxyzabc'
OR b=869
OR ((a BETWEEN 49 AND 51) AND a!=50);
SELECT a FROM t3
WHERE f='uvwxyzabc'
OR b=869
OR ((a BETWEEN 49 AND 51) AND a!=50);
SELECT a FROM t2
WHERE b=682
OR b=583
OR b=685
OR b=817
OR ((a BETWEEN 34 AND 36) AND a!=35);
SELECT a FROM t3
WHERE b=682
OR b=583
OR b=685
OR b=817
OR ((a BETWEEN 34 AND 36) AND a!=35);
SELECT a FROM t2
WHERE b=583
OR a=39
OR b=627
OR ((a BETWEEN 72 AND 74) AND a!=73);
SELECT a FROM t3
WHERE b=583
OR a=39
OR b=627
OR ((a BETWEEN 72 AND 74) AND a!=73);
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR b=212
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR a=20
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b=627;
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR b=212
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR a=20
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b=627;
SELECT a FROM t2
WHERE (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR b=157
OR b=1026;
SELECT a FROM t3
WHERE (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR b=157
OR b=1026;
SELECT a FROM t2
WHERE b=553
OR a=16
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='wvutsrq' AND f GLOB 'lmnop*')
OR f='zabcdefgh'
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR (g='xwvutsr' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE b=553
OR a=16
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='wvutsrq' AND f GLOB 'lmnop*')
OR f='zabcdefgh'
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR (g='xwvutsr' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE b=858
OR c=9009
OR b=792
OR b=88
OR b=154;
SELECT a FROM t3
WHERE b=858
OR c=9009
OR b=792
OR b=88
OR b=154;
SELECT a FROM t2
WHERE f IS NULL
OR a=37
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR b=168
OR b=22
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR b=506;
SELECT a FROM t3
WHERE f IS NULL
OR a=37
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR b=168
OR b=22
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR b=506;
SELECT a FROM t2
WHERE a=29
OR ((a BETWEEN 26 AND 28) AND a!=27)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR b=209
OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR b=146;
SELECT a FROM t3
WHERE a=29
OR ((a BETWEEN 26 AND 28) AND a!=27)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR b=209
OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR b=146;
SELECT a FROM t2
WHERE a=63
OR a=69
OR b=333
OR (d>=6.0 AND d<7.0 AND d NOT NULL)
OR b=135
OR b=25
OR b=1037
OR b=682
OR c=27027
OR a=46;
SELECT a FROM t3
WHERE a=63
OR a=69
OR b=333
OR (d>=6.0 AND d<7.0 AND d NOT NULL)
OR b=135
OR b=25
OR b=1037
OR b=682
OR c=27027
OR a=46;
SELECT a FROM t2
WHERE (g='edcbazy' AND f GLOB 'wxyza*')
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR b=113
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t3
WHERE (g='edcbazy' AND f GLOB 'wxyza*')
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR b=113
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t2
WHERE b=1026
OR (d>=48.0 AND d<49.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=1026
OR (d>=48.0 AND d<49.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='rqponml' AND f GLOB 'ijklm*')
OR a=99
OR a=100
OR b=429
OR b=682
OR b=495
OR f='efghijklm'
OR a=10
OR f='mnopqrstu'
OR b=946
OR (d>=95.0 AND d<96.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='rqponml' AND f GLOB 'ijklm*')
OR a=99
OR a=100
OR b=429
OR b=682
OR b=495
OR f='efghijklm'
OR a=10
OR f='mnopqrstu'
OR b=946
OR (d>=95.0 AND d<96.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=11.0 AND d<12.0 AND d NOT NULL)
OR c=23023
OR b=462
OR ((a BETWEEN 17 AND 19) AND a!=18);
SELECT a FROM t3
WHERE (d>=11.0 AND d<12.0 AND d NOT NULL)
OR c=23023
OR b=462
OR ((a BETWEEN 17 AND 19) AND a!=18);
SELECT a FROM t2
WHERE b=539
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR c=6006
OR a=18
OR c=24024
OR (g='wvutsrq' AND f GLOB 'jklmn*')
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR c=19019
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR ((a BETWEEN 44 AND 46) AND a!=45);
SELECT a FROM t3
WHERE b=539
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR c=6006
OR a=18
OR c=24024
OR (g='wvutsrq' AND f GLOB 'jklmn*')
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR c=19019
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR ((a BETWEEN 44 AND 46) AND a!=45);
SELECT a FROM t2
WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
OR a=20
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=121
OR a=10
OR b=792;
SELECT a FROM t3
WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
OR a=20
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=121
OR a=10
OR b=792;
SELECT a FROM t2
WHERE b=99
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*');
SELECT a FROM t3
WHERE b=99
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*');
SELECT a FROM t2
WHERE (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR b=715
OR ((a BETWEEN 23 AND 25) AND a!=24);
SELECT a FROM t3
WHERE (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR b=715
OR ((a BETWEEN 23 AND 25) AND a!=24);
SELECT a FROM t2
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'tuvwx*')
OR a=46
OR (d>=28.0 AND d<29.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'tuvwx*')
OR a=46
OR (d>=28.0 AND d<29.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='ihgfedc' AND f GLOB 'defgh*')
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR b=1056
OR b=146;
SELECT a FROM t3
WHERE (g='ihgfedc' AND f GLOB 'defgh*')
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR b=1056
OR b=146;
SELECT a FROM t2
WHERE a=15
OR b=388
OR ((a BETWEEN 82 AND 84) AND a!=83)
OR a=36
OR b=737
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR a=75;
SELECT a FROM t3
WHERE a=15
OR b=388
OR ((a BETWEEN 82 AND 84) AND a!=83)
OR a=36
OR b=737
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR a=75;
SELECT a FROM t2
WHERE c=9009
OR a=34
OR (d>=95.0 AND d<96.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=715
OR b=619
OR ((a BETWEEN 98 AND 100) AND a!=99);
SELECT a FROM t3
WHERE c=9009
OR a=34
OR (d>=95.0 AND d<96.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=715
OR b=619
OR ((a BETWEEN 98 AND 100) AND a!=99);
SELECT a FROM t2
WHERE (d>=61.0 AND d<62.0 AND d NOT NULL)
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR b=242
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR b=300
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR ((a BETWEEN 93 AND 95) AND a!=94);
SELECT a FROM t3
WHERE (d>=61.0 AND d<62.0 AND d NOT NULL)
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR b=242
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR b=300
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR ((a BETWEEN 93 AND 95) AND a!=94);
SELECT a FROM t2
WHERE a=85
OR (d>=33.0 AND d<34.0 AND d NOT NULL)
OR b=212
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR b=36
OR b=231
OR b=1048
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR c=19019;
SELECT a FROM t3
WHERE a=85
OR (d>=33.0 AND d<34.0 AND d NOT NULL)
OR b=212
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR b=36
OR b=231
OR b=1048
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR c=19019;
SELECT a FROM t2
WHERE ((a BETWEEN 28 AND 30) AND a!=29)
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR b=1059
OR b=630;
SELECT a FROM t3
WHERE ((a BETWEEN 28 AND 30) AND a!=29)
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR b=1059
OR b=630;
SELECT a FROM t2
WHERE f='ghijklmno'
OR f='nopqrstuv'
OR b=297;
SELECT a FROM t3
WHERE f='ghijklmno'
OR f='nopqrstuv'
OR b=297;
SELECT a FROM t2
WHERE b=1001
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR a=58
OR b=333
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR b=572
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*');
SELECT a FROM t3
WHERE b=1001
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR a=58
OR b=333
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR b=572
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*');
SELECT a FROM t2
WHERE b=1034
OR f='lmnopqrst'
OR (g='qponmlk' AND f GLOB 'mnopq*');
SELECT a FROM t3
WHERE b=1034
OR f='lmnopqrst'
OR (g='qponmlk' AND f GLOB 'mnopq*');
SELECT a FROM t2
WHERE c=15015
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'hijkl*')
OR b=58
OR b=674
OR b=979;
SELECT a FROM t3
WHERE c=15015
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'hijkl*')
OR b=58
OR b=674
OR b=979;
SELECT a FROM t2
WHERE ((a BETWEEN 60 AND 62) AND a!=61)
OR b=660
OR b=341;
SELECT a FROM t3
WHERE ((a BETWEEN 60 AND 62) AND a!=61)
OR b=660
OR b=341;
SELECT a FROM t2
WHERE b=528
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR b=630
OR a=19
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR f='wxyzabcde'
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR b=377
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR a=77
OR (d>=8.0 AND d<9.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=528
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR b=630
OR a=19
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR f='wxyzabcde'
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR b=377
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR a=77
OR (d>=8.0 AND d<9.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=506
OR a=70;
SELECT a FROM t3
WHERE b=506
OR a=70;
SELECT a FROM t2
WHERE a=64
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'cdefg*')
OR c=14014
OR b=586
OR c=27027
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'wxyza*');
SELECT a FROM t3
WHERE a=64
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'cdefg*')
OR c=14014
OR b=586
OR c=27027
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'wxyza*');
SELECT a FROM t2
WHERE a=46
OR b=297
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR b=275
OR b=91
OR b=1015
OR c=12012
OR a=23
OR b=278;
SELECT a FROM t3
WHERE a=46
OR b=297
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR b=275
OR b=91
OR b=1015
OR c=12012
OR a=23
OR b=278;
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'tuvwx*')
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR (d>=98.0 AND d<99.0 AND d NOT NULL)
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR a=23
OR b=737
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR ((a BETWEEN 68 AND 70) AND a!=69);
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'tuvwx*')
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR (d>=98.0 AND d<99.0 AND d NOT NULL)
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR a=23
OR b=737
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR ((a BETWEEN 68 AND 70) AND a!=69);
SELECT a FROM t2
WHERE b=814
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR b=377
OR (d>=79.0 AND d<80.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=814
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR b=377
OR (d>=79.0 AND d<80.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=18
OR b=1059
OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=795;
SELECT a FROM t3
WHERE a=18
OR b=1059
OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=795;
SELECT a FROM t2
WHERE (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR a=93
OR a=11
OR f='nopqrstuv'
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR a=17
OR b=366;
SELECT a FROM t3
WHERE (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR a=93
OR a=11
OR f='nopqrstuv'
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR a=17
OR b=366;
SELECT a FROM t2
WHERE b=685
OR a=33
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR (g='rqponml' AND f GLOB 'lmnop*')
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR b=715
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR a=6
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t3
WHERE b=685
OR a=33
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR (g='rqponml' AND f GLOB 'lmnop*')
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR b=715
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR a=6
OR ((a BETWEEN 59 AND 61) AND a!=60);
SELECT a FROM t2
WHERE a=89
OR b=1037
OR (g='mlkjihg' AND f GLOB 'ijklm*');
SELECT a FROM t3
WHERE a=89
OR b=1037
OR (g='mlkjihg' AND f GLOB 'ijklm*');
SELECT a FROM t2
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=663
OR b=531
OR b=146
OR b=102
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR a=26;
SELECT a FROM t3
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=663
OR b=531
OR b=146
OR b=102
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR a=26;
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'stuvw*')
OR (g='rqponml' AND f GLOB 'jklmn*')
OR (g='lkjihgf' AND f GLOB 'mnopq*')
OR b=726
OR ((a BETWEEN 73 AND 75) AND a!=74)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR c=2002
OR c=15015
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR b=201;
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'stuvw*')
OR (g='rqponml' AND f GLOB 'jklmn*')
OR (g='lkjihgf' AND f GLOB 'mnopq*')
OR b=726
OR ((a BETWEEN 73 AND 75) AND a!=74)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR c=2002
OR c=15015
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR b=201;
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'uvwxy*')
OR b=924
OR f='lmnopqrst'
OR b=1048;
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'uvwxy*')
OR b=924
OR f='lmnopqrst'
OR b=1048;
SELECT a FROM t2
WHERE (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=198
OR (d>=58.0 AND d<59.0 AND d NOT NULL)
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR b=286
OR ((a BETWEEN 65 AND 67) AND a!=66);
SELECT a FROM t3
WHERE (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=198
OR (d>=58.0 AND d<59.0 AND d NOT NULL)
OR ((a BETWEEN 12 AND 14) AND a!=13)
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR b=286
OR ((a BETWEEN 65 AND 67) AND a!=66);
SELECT a FROM t2
WHERE b=242
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR f='bcdefghij'
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR a=38
OR b=187;
SELECT a FROM t3
WHERE b=242
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR f='bcdefghij'
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR a=38
OR b=187;
SELECT a FROM t2
WHERE (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=630
OR a=55
OR c=26026
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR (d>=23.0 AND d<24.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=630
OR a=55
OR c=26026
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR (d>=23.0 AND d<24.0 AND d NOT NULL);
SELECT a FROM t2
WHERE f='uvwxyzabc'
OR f='xyzabcdef'
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR b=69
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*');
SELECT a FROM t3
WHERE f='uvwxyzabc'
OR f='xyzabcdef'
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR b=69
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*');
SELECT a FROM t2
WHERE b=1026
OR b=454
OR ((a BETWEEN 92 AND 94) AND a!=93)
OR b=179
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR f='qrstuvwxy';
SELECT a FROM t3
WHERE b=1026
OR b=454
OR ((a BETWEEN 92 AND 94) AND a!=93)
OR b=179
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR f='qrstuvwxy';
SELECT a FROM t2
WHERE ((a BETWEEN 6 AND 8) AND a!=7)
OR b=619
OR a=20
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR b=946
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR a=64
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR b=1001
OR b=858;
SELECT a FROM t3
WHERE ((a BETWEEN 6 AND 8) AND a!=7)
OR b=619
OR a=20
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR b=946
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR a=64
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR b=1001
OR b=858;
SELECT a FROM t2
WHERE b=902
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR a=86
OR (d>=97.0 AND d<98.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=902
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR a=86
OR (d>=97.0 AND d<98.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=56.0 AND d<57.0 AND d NOT NULL)
OR a=32
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR c=32032;
SELECT a FROM t3
WHERE (d>=56.0 AND d<57.0 AND d NOT NULL)
OR a=32
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR c=32032;
SELECT a FROM t2
WHERE b=168
OR c=2002
OR b=77
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR f='qrstuvwxy';
SELECT a FROM t3
WHERE b=168
OR c=2002
OR b=77
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR f='qrstuvwxy';
SELECT a FROM t2
WHERE f='abcdefghi'
OR b=506;
SELECT a FROM t3
WHERE f='abcdefghi'
OR b=506;
SELECT a FROM t2
WHERE b=264
OR c=34034
OR a=96;
SELECT a FROM t3
WHERE b=264
OR c=34034
OR a=96;
SELECT a FROM t2
WHERE (d>=32.0 AND d<33.0 AND d NOT NULL)
OR a=27
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR (g='utsrqpo' AND f GLOB 'tuvwx*');
SELECT a FROM t3
WHERE (d>=32.0 AND d<33.0 AND d NOT NULL)
OR a=27
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR (g='utsrqpo' AND f GLOB 'tuvwx*');
SELECT a FROM t2
WHERE (d>=74.0 AND d<75.0 AND d NOT NULL)
OR b=77;
SELECT a FROM t3
WHERE (d>=74.0 AND d<75.0 AND d NOT NULL)
OR b=77;
SELECT a FROM t2
WHERE c=27027
OR f='vwxyzabcd'
OR b=1048
OR a=96
OR a=99
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR b=561
OR b=352
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR a=95;
SELECT a FROM t3
WHERE c=27027
OR f='vwxyzabcd'
OR b=1048
OR a=96
OR a=99
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR b=561
OR b=352
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR a=95;
SELECT a FROM t2
WHERE b=275
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR f='ghijklmno'
OR b=619
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=476
OR a=83
OR ((a BETWEEN 47 AND 49) AND a!=48);
SELECT a FROM t3
WHERE b=275
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR f='ghijklmno'
OR b=619
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=476
OR a=83
OR ((a BETWEEN 47 AND 49) AND a!=48);
SELECT a FROM t2
WHERE b=542
OR a=17
OR f='jklmnopqr'
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR (d>=39.0 AND d<40.0 AND d NOT NULL)
OR a=23
OR (d>=25.0 AND d<26.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=542
OR a=17
OR f='jklmnopqr'
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR (d>=39.0 AND d<40.0 AND d NOT NULL)
OR a=23
OR (d>=25.0 AND d<26.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=74.0 AND d<75.0 AND d NOT NULL)
OR b=363
OR b=454;
SELECT a FROM t3
WHERE (d>=74.0 AND d<75.0 AND d NOT NULL)
OR b=363
OR b=454;
SELECT a FROM t2
WHERE b=1059
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR (g='rqponml' AND f GLOB 'jklmn*')
OR b=47
OR b=660
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR a=84;
SELECT a FROM t3
WHERE b=1059
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR (g='rqponml' AND f GLOB 'jklmn*')
OR b=47
OR b=660
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR a=84;
SELECT a FROM t2
WHERE f='ghijklmno'
OR b=1012;
SELECT a FROM t3
WHERE f='ghijklmno'
OR b=1012;
SELECT a FROM t2
WHERE b=597
OR f='lmnopqrst'
OR a=24
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR b=1023
OR a=53
OR a=78
OR f='efghijklm'
OR (g='rqponml' AND f GLOB 'lmnop*')
OR (d>=85.0 AND d<86.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=597
OR f='lmnopqrst'
OR a=24
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR b=1023
OR a=53
OR a=78
OR f='efghijklm'
OR (g='rqponml' AND f GLOB 'lmnop*')
OR (d>=85.0 AND d<86.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=198
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=388;
SELECT a FROM t3
WHERE b=198
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=388;
SELECT a FROM t2
WHERE f='tuvwxyzab'
OR b=388
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR b=957
OR b=663
OR b=847
OR (g='jihgfed' AND f GLOB 'vwxyz*');
SELECT a FROM t3
WHERE f='tuvwxyzab'
OR b=388
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR b=957
OR b=663
OR b=847
OR (g='jihgfed' AND f GLOB 'vwxyz*');
SELECT a FROM t2
WHERE (d>=81.0 AND d<82.0 AND d NOT NULL)
OR a=56
OR (g='hgfedcb' AND f GLOB 'ghijk*');
SELECT a FROM t3
WHERE (d>=81.0 AND d<82.0 AND d NOT NULL)
OR a=56
OR (g='hgfedcb' AND f GLOB 'ghijk*');
SELECT a FROM t2
WHERE c>=34035
OR b=168
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR (f GLOB '?cdef*' AND f GLOB 'bcde*');
SELECT a FROM t3
WHERE c>=34035
OR b=168
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR (f GLOB '?cdef*' AND f GLOB 'bcde*');
SELECT a FROM t2
WHERE ((a BETWEEN 79 AND 81) AND a!=80)
OR b=564
OR c=6006
OR b=979;
SELECT a FROM t3
WHERE ((a BETWEEN 79 AND 81) AND a!=80)
OR b=564
OR c=6006
OR b=979;
SELECT a FROM t2
WHERE (d>=29.0 AND d<30.0 AND d NOT NULL)
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR f='rstuvwxyz'
OR (g='qponmlk' AND f GLOB 'nopqr*');
SELECT a FROM t3
WHERE (d>=29.0 AND d<30.0 AND d NOT NULL)
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR f='rstuvwxyz'
OR (g='qponmlk' AND f GLOB 'nopqr*');
SELECT a FROM t2
WHERE b=58
OR b=484
OR (d>=68.0 AND d<69.0 AND d NOT NULL)
OR b=671
OR a=69;
SELECT a FROM t3
WHERE b=58
OR b=484
OR (d>=68.0 AND d<69.0 AND d NOT NULL)
OR b=671
OR a=69;
SELECT a FROM t2
WHERE f='mnopqrstu'
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR b=861
OR b=77
OR f='qrstuvwxy';
SELECT a FROM t3
WHERE f='mnopqrstu'
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR b=861
OR b=77
OR f='qrstuvwxy';
SELECT a FROM t2
WHERE b=113
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR b=113
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR ((a BETWEEN 62 AND 64) AND a!=63)
OR c=6006
OR (d>=14.0 AND d<15.0 AND d NOT NULL)
OR b=946
OR a=86;
SELECT a FROM t3
WHERE b=113
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR b=113
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR ((a BETWEEN 62 AND 64) AND a!=63)
OR c=6006
OR (d>=14.0 AND d<15.0 AND d NOT NULL)
OR b=946
OR a=86;
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR c=22022
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR c=25025;
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR c=22022
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR c=25025;
SELECT a FROM t2
WHERE ((a BETWEEN 74 AND 76) AND a!=75)
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR b=47
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR a=92
OR b=795
OR b=25
OR c=7007
OR a=93
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR (g='utsrqpo' AND f GLOB 'stuvw*');
SELECT a FROM t3
WHERE ((a BETWEEN 74 AND 76) AND a!=75)
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR b=47
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR a=92
OR b=795
OR b=25
OR c=7007
OR a=93
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR (g='utsrqpo' AND f GLOB 'stuvw*');
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'uvwxy*')
OR a=13
OR (g='fedcbaz' AND f GLOB 'qrstu*')
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR c=29029
OR b=311
OR b=366
OR a=94
OR a=72;
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'uvwxy*')
OR a=13
OR (g='fedcbaz' AND f GLOB 'qrstu*')
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR c=29029
OR b=311
OR b=366
OR a=94
OR a=72;
SELECT a FROM t2
WHERE c=26026
OR a=96
OR a=22
OR b=341
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR b=872
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR ((a BETWEEN 25 AND 27) AND a!=26);
SELECT a FROM t3
WHERE c=26026
OR a=96
OR a=22
OR b=341
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR b=872
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR ((a BETWEEN 25 AND 27) AND a!=26);
SELECT a FROM t2
WHERE (d>=82.0 AND d<83.0 AND d NOT NULL)
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=41
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR (g='onmlkji' AND f GLOB 'zabcd*')
OR b=913;
SELECT a FROM t3
WHERE (d>=82.0 AND d<83.0 AND d NOT NULL)
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=41
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR (g='onmlkji' AND f GLOB 'zabcd*')
OR b=913;
SELECT a FROM t2
WHERE ((a BETWEEN 42 AND 44) AND a!=43)
OR a=90;
SELECT a FROM t3
WHERE ((a BETWEEN 42 AND 44) AND a!=43)
OR a=90;
SELECT a FROM t2
WHERE (d>=44.0 AND d<45.0 AND d NOT NULL)
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR b=484;
SELECT a FROM t3
WHERE (d>=44.0 AND d<45.0 AND d NOT NULL)
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR b=484;
SELECT a FROM t2
WHERE (d>=22.0 AND d<23.0 AND d NOT NULL)
OR b=377
OR b=363
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR b=737
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR b=506
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR a=16;
SELECT a FROM t3
WHERE (d>=22.0 AND d<23.0 AND d NOT NULL)
OR b=377
OR b=363
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR b=737
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR b=506
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR a=16;
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'zabcd*')
OR b=102
OR b=212
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=487
OR (g='ihgfedc' AND f GLOB 'efghi*');
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'zabcd*')
OR b=102
OR b=212
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=487
OR (g='ihgfedc' AND f GLOB 'efghi*');
SELECT a FROM t2
WHERE b=154
OR a=51
OR b=520;
SELECT a FROM t3
WHERE b=154
OR a=51
OR b=520;
SELECT a FROM t2
WHERE b=872
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR b=957
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR a=67
OR a=72;
SELECT a FROM t3
WHERE b=872
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR b=957
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR a=67
OR a=72;
SELECT a FROM t2
WHERE b=66
OR b=102
OR b=396
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR ((a BETWEEN 7 AND 9) AND a!=8)
OR b=759
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR f='ghijklmno'
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR (d>=97.0 AND d<98.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=66
OR b=102
OR b=396
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR ((a BETWEEN 7 AND 9) AND a!=8)
OR b=759
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR f='ghijklmno'
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR (d>=97.0 AND d<98.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 69 AND 71) AND a!=70)
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR a=72
OR b=1100
OR b=102
OR b=135;
SELECT a FROM t3
WHERE ((a BETWEEN 69 AND 71) AND a!=70)
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR a=72
OR b=1100
OR b=102
OR b=135;
SELECT a FROM t2
WHERE b=99
OR a=76;
SELECT a FROM t3
WHERE b=99
OR a=76;
SELECT a FROM t2
WHERE b=891
OR b=806
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR b=861
OR ((a BETWEEN 82 AND 84) AND a!=83)
OR (d>=34.0 AND d<35.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=891
OR b=806
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR b=861
OR ((a BETWEEN 82 AND 84) AND a!=83)
OR (d>=34.0 AND d<35.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=1034
OR b=91;
SELECT a FROM t3
WHERE b=1034
OR b=91;
SELECT a FROM t2
WHERE b=47
OR a=91
OR d>1e10
OR (g='srqponm' AND f GLOB 'cdefg*');
SELECT a FROM t3
WHERE b=47
OR a=91
OR d>1e10
OR (g='srqponm' AND f GLOB 'cdefg*');
SELECT a FROM t2
WHERE b=1023
OR f='zabcdefgh'
OR b=451
OR b=443
OR c>=34035
OR b=58;
SELECT a FROM t3
WHERE b=1023
OR f='zabcdefgh'
OR b=451
OR b=443
OR c>=34035
OR b=58;
SELECT a FROM t2
WHERE b=971
OR b=36
OR a=11
OR f='hijklmnop';
SELECT a FROM t3
WHERE b=971
OR b=36
OR a=11
OR f='hijklmnop';
SELECT a FROM t2
WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
OR b=619
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR c=11011
OR b=550
OR b=1059
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR b=737;
SELECT a FROM t3
WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
OR b=619
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR c=11011
OR b=550
OR b=1059
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR b=737;
SELECT a FROM t2
WHERE (g='edcbazy' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR a=78
OR a=27
OR b=792
OR b=946
OR c=22022
OR a=23
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=388;
SELECT a FROM t3
WHERE (g='edcbazy' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR a=78
OR a=27
OR b=792
OR b=946
OR c=22022
OR a=23
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=388;
SELECT a FROM t2
WHERE c=32032
OR f IS NULL
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR b=825;
SELECT a FROM t3
WHERE c=32032
OR f IS NULL
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR b=825;
SELECT a FROM t2
WHERE (d>=84.0 AND d<85.0 AND d NOT NULL)
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR b=1078
OR b=198
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR b=55
OR b=517
OR b=740;
SELECT a FROM t3
WHERE (d>=84.0 AND d<85.0 AND d NOT NULL)
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR b=1078
OR b=198
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR b=55
OR b=517
OR b=740;
SELECT a FROM t2
WHERE (g='wvutsrq' AND f GLOB 'ijklm*')
OR c=25025
OR b=550
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'bcdef*');
SELECT a FROM t3
WHERE (g='wvutsrq' AND f GLOB 'ijklm*')
OR c=25025
OR b=550
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'bcdef*');
SELECT a FROM t2
WHERE b=432
OR f='opqrstuvw'
OR (g='kjihgfe' AND f GLOB 'qrstu*');
SELECT a FROM t3
WHERE b=432
OR f='opqrstuvw'
OR (g='kjihgfe' AND f GLOB 'qrstu*');
SELECT a FROM t2
WHERE ((a BETWEEN 14 AND 16) AND a!=15)
OR b=847
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR b=583
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR b=938;
SELECT a FROM t3
WHERE ((a BETWEEN 14 AND 16) AND a!=15)
OR b=847
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR b=583
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR b=938;
SELECT a FROM t2
WHERE b=671
OR a=56
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR b=157
OR a=83
OR ((a BETWEEN 73 AND 75) AND a!=74)
OR c=21021
OR b=319
OR b=187
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR b=839;
SELECT a FROM t3
WHERE b=671
OR a=56
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR b=157
OR a=83
OR ((a BETWEEN 73 AND 75) AND a!=74)
OR c=21021
OR b=319
OR b=187
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR b=839;
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'uvwxy*')
OR b=586
OR d<0.0
OR c=9009;
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'uvwxy*')
OR b=586
OR d<0.0
OR c=9009;
SELECT a FROM t2
WHERE a=82
OR a=34
OR f='jklmnopqr'
OR a=82
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=454
OR b=355
OR c=21021
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=30;
SELECT a FROM t3
WHERE a=82
OR a=34
OR f='jklmnopqr'
OR a=82
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=454
OR b=355
OR c=21021
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=30;
SELECT a FROM t2
WHERE ((a BETWEEN 44 AND 46) AND a!=45)
OR a=53
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=594
OR b=80
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR d>1e10;
SELECT a FROM t3
WHERE ((a BETWEEN 44 AND 46) AND a!=45)
OR a=53
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=594
OR b=80
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR d>1e10;
SELECT a FROM t2
WHERE f='opqrstuvw'
OR a=7;
SELECT a FROM t3
WHERE f='opqrstuvw'
OR a=7;
SELECT a FROM t2
WHERE b=627
OR ((a BETWEEN 75 AND 77) AND a!=76)
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR a=90
OR (d>=33.0 AND d<34.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=627
OR ((a BETWEEN 75 AND 77) AND a!=76)
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR a=90
OR (d>=33.0 AND d<34.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=59
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR f='wxyzabcde'
OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR a=70
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t3
WHERE a=59
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR f='wxyzabcde'
OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR a=70
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t2
WHERE a=69
OR (g='ihgfedc' AND f GLOB 'defgh*');
SELECT a FROM t3
WHERE a=69
OR (g='ihgfedc' AND f GLOB 'defgh*');
SELECT a FROM t2
WHERE a=41
OR a=43
OR a=92
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR (g='mlkjihg' AND f GLOB 'klmno*');
SELECT a FROM t3
WHERE a=41
OR a=43
OR a=92
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR (g='mlkjihg' AND f GLOB 'klmno*');
SELECT a FROM t2
WHERE b=300
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR b=935
OR b=190;
SELECT a FROM t3
WHERE b=300
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR b=935
OR b=190;
SELECT a FROM t2
WHERE f='fghijklmn'
OR f='fghijklmn'
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR b=465
OR b=586
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR b=88
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR b=726
OR ((a BETWEEN 51 AND 53) AND a!=52);
SELECT a FROM t3
WHERE f='fghijklmn'
OR f='fghijklmn'
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR b=465
OR b=586
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR b=88
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR b=726
OR ((a BETWEEN 51 AND 53) AND a!=52);
SELECT a FROM t2
WHERE (d>=34.0 AND d<35.0 AND d NOT NULL)
OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR (g='fedcbaz' AND f GLOB 'tuvwx*')
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR b=814
OR a=20
OR 1000000<b
OR b=792;
SELECT a FROM t3
WHERE (d>=34.0 AND d<35.0 AND d NOT NULL)
OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR (g='fedcbaz' AND f GLOB 'tuvwx*')
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR b=814
OR a=20
OR 1000000<b
OR b=792;
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR c=1001
OR b=484
OR (d>=65.0 AND d<66.0 AND d NOT NULL)
OR c<=10
OR a=92
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR ((a BETWEEN 0 AND 2) AND a!=1)
OR b=1026;
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR c=1001
OR b=484
OR (d>=65.0 AND d<66.0 AND d NOT NULL)
OR c<=10
OR a=92
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR ((a BETWEEN 0 AND 2) AND a!=1)
OR b=1026;
SELECT a FROM t2
WHERE a=54
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR b=993
OR c=22022
OR a=68
OR ((a BETWEEN 99 AND 101) AND a!=100)
OR a=62
OR (f GLOB '?efgh*' AND f GLOB 'defg*')
OR b=1015;
SELECT a FROM t3
WHERE a=54
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR b=993
OR c=22022
OR a=68
OR ((a BETWEEN 99 AND 101) AND a!=100)
OR a=62
OR (f GLOB '?efgh*' AND f GLOB 'defg*')
OR b=1015;
SELECT a FROM t2
WHERE b=319
OR a=50
OR (g='srqponm' AND f GLOB 'defgh*')
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR a=96;
SELECT a FROM t3
WHERE b=319
OR a=50
OR (g='srqponm' AND f GLOB 'defgh*')
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR a=96;
SELECT a FROM t2
WHERE b=971
OR c=18018
OR b=564
OR b=583
OR b=80;
SELECT a FROM t3
WHERE b=971
OR c=18018
OR b=564
OR b=583
OR b=80;
SELECT a FROM t2
WHERE (d>=35.0 AND d<36.0 AND d NOT NULL)
OR b=1026
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t3
WHERE (d>=35.0 AND d<36.0 AND d NOT NULL)
OR b=1026
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t2
WHERE (g='ponmlkj' AND f GLOB 'uvwxy*')
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR b=407
OR b=454
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR b=627
OR (f GLOB '?opqr*' AND f GLOB 'nopq*');
SELECT a FROM t3
WHERE (g='ponmlkj' AND f GLOB 'uvwxy*')
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR b=407
OR b=454
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR b=627
OR (f GLOB '?opqr*' AND f GLOB 'nopq*');
SELECT a FROM t2
WHERE (d>=79.0 AND d<80.0 AND d NOT NULL)
OR c=34034
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR a=67;
SELECT a FROM t3
WHERE (d>=79.0 AND d<80.0 AND d NOT NULL)
OR c=34034
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR a=67;
SELECT a FROM t2
WHERE a=97
OR b=575
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (f GLOB '?rstu*' AND f GLOB 'qrst*');
SELECT a FROM t3
WHERE a=97
OR b=575
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (f GLOB '?rstu*' AND f GLOB 'qrst*');
SELECT a FROM t2
WHERE b=561
OR b=773
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=201
OR a=99
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR b=946
OR b=993
OR (g='fedcbaz' AND f GLOB 'qrstu*');
SELECT a FROM t3
WHERE b=561
OR b=773
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=201
OR a=99
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR b=946
OR b=993
OR (g='fedcbaz' AND f GLOB 'qrstu*');
SELECT a FROM t2
WHERE b=806
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR b=916
OR b<0
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR b=154
OR c=10010
OR b=451
OR (d>=14.0 AND d<15.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=806
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR b=916
OR b<0
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR b=154
OR c=10010
OR b=451
OR (d>=14.0 AND d<15.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=836
OR d>1e10
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR f='pqrstuvwx'
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR f='abcdefghi'
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR a=33
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR b=476;
SELECT a FROM t3
WHERE b=836
OR d>1e10
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR f='pqrstuvwx'
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR f='abcdefghi'
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR a=33
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR b=476;
SELECT a FROM t2
WHERE a=48
OR a=92
OR a=1
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR (g='rqponml' AND f GLOB 'lmnop*')
OR b=905
OR ((a BETWEEN 51 AND 53) AND a!=52);
SELECT a FROM t3
WHERE a=48
OR a=92
OR a=1
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR (g='rqponml' AND f GLOB 'lmnop*')
OR b=905
OR ((a BETWEEN 51 AND 53) AND a!=52);
SELECT a FROM t2
WHERE (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR b=212
OR a=42
OR a=92;
SELECT a FROM t3
WHERE (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR b=212
OR a=42
OR a=92;
SELECT a FROM t2
WHERE b=740
OR b=564
OR (g='onmlkji' AND f GLOB 'zabcd*')
OR a=11
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR b=322
OR (d>=6.0 AND d<7.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR b=902
OR c>=34035;
SELECT a FROM t3
WHERE b=740
OR b=564
OR (g='onmlkji' AND f GLOB 'zabcd*')
OR a=11
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR b=322
OR (d>=6.0 AND d<7.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR b=902
OR c>=34035;
SELECT a FROM t2
WHERE ((a BETWEEN 52 AND 54) AND a!=53)
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR a=27
OR a=48
OR b=927
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR f='abcdefghi'
OR b=91
OR b=55;
SELECT a FROM t3
WHERE ((a BETWEEN 52 AND 54) AND a!=53)
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR a=27
OR a=48
OR b=927
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (g='fedcbaz' AND f GLOB 'stuvw*')
OR f='abcdefghi'
OR b=91
OR b=55;
SELECT a FROM t2
WHERE (g='srqponm' AND f GLOB 'efghi*')
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR a=20
OR b=11;
SELECT a FROM t3
WHERE (g='srqponm' AND f GLOB 'efghi*')
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR a=20
OR b=11;
SELECT a FROM t2
WHERE (d>=27.0 AND d<28.0 AND d NOT NULL)
OR b=55
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR (g='onmlkji' AND f GLOB 'abcde*')
OR a=50
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=64.0 AND d<65.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=27.0 AND d<28.0 AND d NOT NULL)
OR b=55
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR (g='onmlkji' AND f GLOB 'abcde*')
OR a=50
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=64.0 AND d<65.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='rqponml' AND f GLOB 'ijklm*')
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*');
SELECT a FROM t3
WHERE (g='rqponml' AND f GLOB 'ijklm*')
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*');
SELECT a FROM t2
WHERE b=704
OR b=924
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR b=113;
SELECT a FROM t3
WHERE b=704
OR b=924
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR b=113;
SELECT a FROM t2
WHERE ((a BETWEEN 20 AND 22) AND a!=21)
OR b=289
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t3
WHERE ((a BETWEEN 20 AND 22) AND a!=21)
OR b=289
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t2
WHERE b=935
OR b=1001
OR ((a BETWEEN 78 AND 80) AND a!=79)
OR a=31
OR a=56;
SELECT a FROM t3
WHERE b=935
OR b=1001
OR ((a BETWEEN 78 AND 80) AND a!=79)
OR a=31
OR a=56;
SELECT a FROM t2
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR b=726
OR f='abcdefghi'
OR b=179
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=539
OR b=66
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR (f GLOB '?klmn*' AND f GLOB 'jklm*');
SELECT a FROM t3
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR b=726
OR f='abcdefghi'
OR b=179
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=539
OR b=66
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR (f GLOB '?klmn*' AND f GLOB 'jklm*');
SELECT a FROM t2
WHERE b=179
OR b=685;
SELECT a FROM t3
WHERE b=179
OR b=685;
SELECT a FROM t2
WHERE b=201
OR b=682
OR b=443
OR b=836
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR (d>=11.0 AND d<12.0 AND d NOT NULL)
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR b=110
OR (f GLOB '?defg*' AND f GLOB 'cdef*');
SELECT a FROM t3
WHERE b=201
OR b=682
OR b=443
OR b=836
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR (d>=11.0 AND d<12.0 AND d NOT NULL)
OR ((a BETWEEN 51 AND 53) AND a!=52)
OR b=110
OR (f GLOB '?defg*' AND f GLOB 'cdef*');
SELECT a FROM t2
WHERE (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR b=462
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR a=22
OR b=594
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (g='mlkjihg' AND f GLOB 'jklmn*');
SELECT a FROM t3
WHERE (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR b=462
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR a=22
OR b=594
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (g='mlkjihg' AND f GLOB 'jklmn*');
SELECT a FROM t2
WHERE (g='utsrqpo' AND f GLOB 'wxyza*')
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR f='vwxyzabcd'
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR a=37
OR a=50;
SELECT a FROM t3
WHERE (g='utsrqpo' AND f GLOB 'wxyza*')
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR f='vwxyzabcd'
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR a=37
OR a=50;
SELECT a FROM t2
WHERE ((a BETWEEN 83 AND 85) AND a!=84)
OR b=784
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
OR b=825
OR a=80
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR b=531
OR a=100;
SELECT a FROM t3
WHERE ((a BETWEEN 83 AND 85) AND a!=84)
OR b=784
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
OR b=825
OR a=80
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR b=531
OR a=100;
SELECT a FROM t2
WHERE (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=220
OR (d>=53.0 AND d<54.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='utsrqpo' AND f GLOB 'tuvwx*')
OR b=220
OR (d>=53.0 AND d<54.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=92
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR b=990;
SELECT a FROM t3
WHERE a=92
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR b=990;
SELECT a FROM t2
WHERE ((a BETWEEN 77 AND 79) AND a!=78)
OR b=894
OR c=28028
OR b=905
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR b=1037;
SELECT a FROM t3
WHERE ((a BETWEEN 77 AND 79) AND a!=78)
OR b=894
OR c=28028
OR b=905
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR b=1037;
SELECT a FROM t2
WHERE (d>=72.0 AND d<73.0 AND d NOT NULL)
OR b=773
OR f='defghijkl';
SELECT a FROM t3
WHERE (d>=72.0 AND d<73.0 AND d NOT NULL)
OR b=773
OR f='defghijkl';
SELECT a FROM t2
WHERE (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=861
OR (g='rqponml' AND f GLOB 'lmnop*');
SELECT a FROM t3
WHERE (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=861
OR (g='rqponml' AND f GLOB 'lmnop*');
SELECT a FROM t2
WHERE b=704
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR b=25
OR (g='jihgfed' AND f GLOB 'zabcd*')
OR b=487
OR (g='hgfedcb' AND f GLOB 'fghij*')
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (d>=84.0 AND d<85.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=704
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR b=25
OR (g='jihgfed' AND f GLOB 'zabcd*')
OR b=487
OR (g='hgfedcb' AND f GLOB 'fghij*')
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (d>=84.0 AND d<85.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=19
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR b=674
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR b=355
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR c=28028
OR b=649
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR (g='srqponm' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE a=19
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR b=674
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR b=355
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR c=28028
OR b=649
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR (g='srqponm' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE ((a BETWEEN 76 AND 78) AND a!=77)
OR a=1
OR a=22
OR b=836
OR c=24024;
SELECT a FROM t3
WHERE ((a BETWEEN 76 AND 78) AND a!=77)
OR a=1
OR a=22
OR b=836
OR c=24024;
SELECT a FROM t2
WHERE b=135
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 39 AND 41) AND a!=40);
SELECT a FROM t3
WHERE b=135
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 39 AND 41) AND a!=40);
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'ijklm*')
OR (f GLOB '?klmn*' AND f GLOB 'jklm*');
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'ijklm*')
OR (f GLOB '?klmn*' AND f GLOB 'jklm*');
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'wxyza*')
OR f='ghijklmno';
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'wxyza*')
OR f='ghijklmno';
SELECT a FROM t2
WHERE b=825
OR b=902
OR a=40
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR a=30
OR a=10
OR a=73;
SELECT a FROM t3
WHERE b=825
OR b=902
OR a=40
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR a=30
OR a=10
OR a=73;
SELECT a FROM t2
WHERE ((a BETWEEN 22 AND 24) AND a!=23)
OR a=5
OR b=432
OR b=979
OR b=762
OR b=352
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR c=27027
OR c=20020
OR (d>=23.0 AND d<24.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 22 AND 24) AND a!=23)
OR a=5
OR b=432
OR b=979
OR b=762
OR b=352
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR c=27027
OR c=20020
OR (d>=23.0 AND d<24.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (f GLOB '?lmno*' AND f GLOB 'klmn*')
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR b=99
OR a=54;
SELECT a FROM t3
WHERE (f GLOB '?lmno*' AND f GLOB 'klmn*')
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR b=99
OR a=54;
SELECT a FROM t2
WHERE b=300
OR (g='mlkjihg' AND f GLOB 'klmno*')
OR b=319
OR f='fghijklmn'
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR ((a BETWEEN 42 AND 44) AND a!=43);
SELECT a FROM t3
WHERE b=300
OR (g='mlkjihg' AND f GLOB 'klmno*')
OR b=319
OR f='fghijklmn'
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR ((a BETWEEN 42 AND 44) AND a!=43);
SELECT a FROM t2
WHERE b=671
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR b=1004
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR b=748
OR (g='tsrqpon' AND f GLOB 'xyzab*');
SELECT a FROM t3
WHERE b=671
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR b=1004
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR b=748
OR (g='tsrqpon' AND f GLOB 'xyzab*');
SELECT a FROM t2
WHERE a=47
OR b=784
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR a=16
OR a=25
OR b=572;
SELECT a FROM t3
WHERE a=47
OR b=784
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR a=16
OR a=25
OR b=572;
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'wxyza*')
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR b=110
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR c=26026
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR b=850
OR a=6;
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'wxyza*')
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR b=110
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR c=26026
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR b=850
OR a=6;
SELECT a FROM t2
WHERE ((a BETWEEN 74 AND 76) AND a!=75)
OR ((a BETWEEN 1 AND 3) AND a!=2)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR (g='mlkjihg' AND f GLOB 'klmno*')
OR b=135
OR a=28
OR ((a BETWEEN 1 AND 3) AND a!=2)
OR b=737;
SELECT a FROM t3
WHERE ((a BETWEEN 74 AND 76) AND a!=75)
OR ((a BETWEEN 1 AND 3) AND a!=2)
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR (g='mlkjihg' AND f GLOB 'klmno*')
OR b=135
OR a=28
OR ((a BETWEEN 1 AND 3) AND a!=2)
OR b=737;
SELECT a FROM t2
WHERE b=242
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR ((a BETWEEN 20 AND 22) AND a!=21);
SELECT a FROM t3
WHERE b=242
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR ((a BETWEEN 20 AND 22) AND a!=21);
SELECT a FROM t2
WHERE b=528
OR a=41
OR f='cdefghijk'
OR a=98
OR b=759
OR a=43
OR b=286
OR f='hijklmnop';
SELECT a FROM t3
WHERE b=528
OR a=41
OR f='cdefghijk'
OR a=98
OR b=759
OR a=43
OR b=286
OR f='hijklmnop';
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'ghijk*')
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR a=52;
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'ghijk*')
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR a=52;
SELECT a FROM t2
WHERE (g='ihgfedc' AND f GLOB 'abcde*')
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR a=86
OR c=33033
OR c=2002
OR a=92;
SELECT a FROM t3
WHERE (g='ihgfedc' AND f GLOB 'abcde*')
OR ((a BETWEEN 2 AND 4) AND a!=3)
OR a=86
OR c=33033
OR c=2002
OR a=92;
SELECT a FROM t2
WHERE ((a BETWEEN 47 AND 49) AND a!=48)
OR b=517
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR (g='srqponm' AND f GLOB 'fghij*')
OR f='defghijkl'
OR b=707
OR c>=34035
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR a=80
OR (d>=23.0 AND d<24.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 47 AND 49) AND a!=48)
OR b=517
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR (g='srqponm' AND f GLOB 'fghij*')
OR f='defghijkl'
OR b=707
OR c>=34035
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR a=80
OR (d>=23.0 AND d<24.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=209
OR b=399
OR (g='fedcbaz' AND f GLOB 'tuvwx*');
SELECT a FROM t3
WHERE (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=209
OR b=399
OR (g='fedcbaz' AND f GLOB 'tuvwx*');
SELECT a FROM t2
WHERE ((a BETWEEN 18 AND 20) AND a!=19)
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR b=597
OR a=95
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR b=432
OR (d>=92.0 AND d<93.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 18 AND 20) AND a!=19)
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR b=597
OR a=95
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR b=432
OR (d>=92.0 AND d<93.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=88.0 AND d<89.0 AND d NOT NULL)
OR b=157
OR ((a BETWEEN 78 AND 80) AND a!=79)
OR a=3
OR b=663
OR a=2
OR c=21021
OR b=330
OR b=231
OR (g='tsrqpon' AND f GLOB 'bcdef*');
SELECT a FROM t3
WHERE (d>=88.0 AND d<89.0 AND d NOT NULL)
OR b=157
OR ((a BETWEEN 78 AND 80) AND a!=79)
OR a=3
OR b=663
OR a=2
OR c=21021
OR b=330
OR b=231
OR (g='tsrqpon' AND f GLOB 'bcdef*');
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'fghij*')
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR f IS NULL;
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'fghij*')
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR f IS NULL;
SELECT a FROM t2
WHERE ((a BETWEEN 99 AND 101) AND a!=100)
OR (g='fedcbaz' AND f GLOB 'pqrst*')
OR 1000000<b
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR b=990;
SELECT a FROM t3
WHERE ((a BETWEEN 99 AND 101) AND a!=100)
OR (g='fedcbaz' AND f GLOB 'pqrst*')
OR 1000000<b
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR b=990;
SELECT a FROM t2
WHERE b=165
OR a=69
OR (g='ponmlkj' AND f GLOB 'stuvw*');
SELECT a FROM t3
WHERE b=165
OR a=69
OR (g='ponmlkj' AND f GLOB 'stuvw*');
SELECT a FROM t2
WHERE (g='nmlkjih' AND f GLOB 'defgh*')
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=784
OR b=583
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR b=814
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR b=619
OR (d>=80.0 AND d<81.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='nmlkjih' AND f GLOB 'defgh*')
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=784
OR b=583
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR b=814
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR b=619
OR (d>=80.0 AND d<81.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=86
OR b=484
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR b=418
OR b=509
OR a=42
OR b=825
OR a=91
OR b=1023
OR b=814
OR ((a BETWEEN 99 AND 101) AND a!=100);
SELECT a FROM t3
WHERE a=86
OR b=484
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR b=418
OR b=509
OR a=42
OR b=825
OR a=91
OR b=1023
OR b=814
OR ((a BETWEEN 99 AND 101) AND a!=100);
SELECT a FROM t2
WHERE (d>=86.0 AND d<87.0 AND d NOT NULL)
OR b=231
OR a=81
OR a=72
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR b=396;
SELECT a FROM t3
WHERE (d>=86.0 AND d<87.0 AND d NOT NULL)
OR b=231
OR a=81
OR a=72
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR b=396;
SELECT a FROM t2
WHERE (d>=74.0 AND d<75.0 AND d NOT NULL)
OR a=63
OR ((a BETWEEN 70 AND 72) AND a!=71)
OR a=71
OR b=22
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR a=53;
SELECT a FROM t3
WHERE (d>=74.0 AND d<75.0 AND d NOT NULL)
OR a=63
OR ((a BETWEEN 70 AND 72) AND a!=71)
OR a=71
OR b=22
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR a=53;
SELECT a FROM t2
WHERE b=861
OR b=649
OR b=146
OR f='abcdefghi';
SELECT a FROM t3
WHERE b=861
OR b=649
OR b=146
OR f='abcdefghi';
SELECT a FROM t2
WHERE (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR c=5005
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR a=93
OR c=24024
OR b=619
OR b=234
OR b=55
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR (d>=56.0 AND d<57.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR c=5005
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR a=93
OR c=24024
OR b=619
OR b=234
OR b=55
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR (d>=56.0 AND d<57.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=355
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=806
OR b=462
OR b=531
OR (g='lkjihgf' AND f GLOB 'lmnop*')
OR f='mnopqrstu';
SELECT a FROM t3
WHERE b=355
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=806
OR b=462
OR b=531
OR (g='lkjihgf' AND f GLOB 'lmnop*')
OR f='mnopqrstu';
SELECT a FROM t2
WHERE ((a BETWEEN 60 AND 62) AND a!=61)
OR f='pqrstuvwx'
OR (g='nmlkjih' AND f GLOB 'efghi*')
OR b=495
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR a=75;
SELECT a FROM t3
WHERE ((a BETWEEN 60 AND 62) AND a!=61)
OR f='pqrstuvwx'
OR (g='nmlkjih' AND f GLOB 'efghi*')
OR b=495
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR a=75;
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'efghi*')
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR b=748
OR b=913
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR a=22;
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'efghi*')
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR b=748
OR b=913
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR a=22;
SELECT a FROM t2
WHERE a=19
OR b=902
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR b=168
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR a=50
OR f='uvwxyzabc'
OR b=836
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR a=50;
SELECT a FROM t3
WHERE a=19
OR b=902
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR b=168
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR a=50
OR f='uvwxyzabc'
OR b=836
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR a=50;
SELECT a FROM t2
WHERE c=12012
OR b=993
OR b=839
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR a=87;
SELECT a FROM t3
WHERE c=12012
OR b=993
OR b=839
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR a=87;
SELECT a FROM t2
WHERE b=814
OR c=30030
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR a=16
OR b=1048
OR b=113
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR b=729
OR a=54;
SELECT a FROM t3
WHERE b=814
OR c=30030
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR a=16
OR b=1048
OR b=113
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR b=729
OR a=54;
SELECT a FROM t2
WHERE b=399
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=814
OR c=22022
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR a=1
OR b=311
OR b=121
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=198;
SELECT a FROM t3
WHERE b=399
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=814
OR c=22022
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR a=1
OR b=311
OR b=121
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=198;
SELECT a FROM t2
WHERE b=146
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR a=57;
SELECT a FROM t3
WHERE b=146
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR a=57;
SELECT a FROM t2
WHERE (d>=100.0 AND d<101.0 AND d NOT NULL)
OR f='fghijklmn'
OR a=70
OR (d>=4.0 AND d<5.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=100.0 AND d<101.0 AND d NOT NULL)
OR f='fghijklmn'
OR a=70
OR (d>=4.0 AND d<5.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=42
OR b=333
OR (d>=35.0 AND d<36.0 AND d NOT NULL)
OR b=1089
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR a=22
OR b=594
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR (f GLOB '?ghij*' AND f GLOB 'fghi*');
SELECT a FROM t3
WHERE a=42
OR b=333
OR (d>=35.0 AND d<36.0 AND d NOT NULL)
OR b=1089
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR a=22
OR b=594
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR (f GLOB '?ghij*' AND f GLOB 'fghi*');
SELECT a FROM t2
WHERE (d>=67.0 AND d<68.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=113
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR f='mnopqrstu'
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR b=902;
SELECT a FROM t3
WHERE (d>=67.0 AND d<68.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=113
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR f='mnopqrstu'
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR b=902;
SELECT a FROM t2
WHERE (g='onmlkji' AND f GLOB 'zabcd*')
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR a=13;
SELECT a FROM t3
WHERE (g='onmlkji' AND f GLOB 'zabcd*')
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR a=13;
SELECT a FROM t2
WHERE (g='edcbazy' AND f GLOB 'wxyza*')
OR b=410
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR b=418
OR (g='gfedcba' AND f GLOB 'klmno*')
OR (d>=65.0 AND d<66.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='edcbazy' AND f GLOB 'wxyza*')
OR b=410
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR b=418
OR (g='gfedcba' AND f GLOB 'klmno*')
OR (d>=65.0 AND d<66.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=5
OR a=95
OR a=56
OR a=46
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR (d>=41.0 AND d<42.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=5
OR a=95
OR a=56
OR a=46
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR (d>=41.0 AND d<42.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=87.0 AND d<88.0 AND d NOT NULL)
OR a=13
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR a=9
OR a=27
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=484
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR b=594;
SELECT a FROM t3
WHERE (d>=87.0 AND d<88.0 AND d NOT NULL)
OR a=13
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR a=9
OR a=27
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=484
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR b=594;
SELECT a FROM t2
WHERE b=539
OR b=418
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR b=759;
SELECT a FROM t3
WHERE b=539
OR b=418
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR b=759;
SELECT a FROM t2
WHERE b=1001
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR c=34034
OR a=84;
SELECT a FROM t3
WHERE b=1001
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR c=34034
OR a=84;
SELECT a FROM t2
WHERE b=795
OR b=671
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR ((a BETWEEN 71 AND 73) AND a!=72)
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR b=322
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR c=34034
OR b=410;
SELECT a FROM t3
WHERE b=795
OR b=671
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR ((a BETWEEN 71 AND 73) AND a!=72)
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR b=322
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR c=34034
OR b=410;
SELECT a FROM t2
WHERE c=13013
OR (g='fedcbaz' AND f GLOB 'qrstu*')
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=47
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=828;
SELECT a FROM t3
WHERE c=13013
OR (g='fedcbaz' AND f GLOB 'qrstu*')
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=47
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=828;
SELECT a FROM t2
WHERE b=451
OR b=836
OR (g='onmlkji' AND f GLOB 'wxyza*');
SELECT a FROM t3
WHERE b=451
OR b=836
OR (g='onmlkji' AND f GLOB 'wxyza*');
SELECT a FROM t2
WHERE b=575
OR b=748
OR b=520
OR b=154
OR a=70
OR f='efghijklm';
SELECT a FROM t3
WHERE b=575
OR b=748
OR b=520
OR b=154
OR a=70
OR f='efghijklm';
SELECT a FROM t2
WHERE f='tuvwxyzab'
OR (g='nmlkjih' AND f GLOB 'efghi*');
SELECT a FROM t3
WHERE f='tuvwxyzab'
OR (g='nmlkjih' AND f GLOB 'efghi*');
SELECT a FROM t2
WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=806
OR a=47
OR d<0.0
OR b=982
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'jklmn*')
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR e IS NULL
OR c=32032
OR b=795;
SELECT a FROM t3
WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=806
OR a=47
OR d<0.0
OR b=982
OR (d>=2.0 AND d<3.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'jklmn*')
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR e IS NULL
OR c=32032
OR b=795;
SELECT a FROM t2
WHERE a=62
OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (g='edcbazy' AND f GLOB 'vwxyz*');
SELECT a FROM t3
WHERE a=62
OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR (g='edcbazy' AND f GLOB 'vwxyz*');
SELECT a FROM t2
WHERE (d>=57.0 AND d<58.0 AND d NOT NULL)
OR b=1056
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR b=729
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR b=220
OR b=498
OR ((a BETWEEN 96 AND 98) AND a!=97);
SELECT a FROM t3
WHERE (d>=57.0 AND d<58.0 AND d NOT NULL)
OR b=1056
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR b=729
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR b=220
OR b=498
OR ((a BETWEEN 96 AND 98) AND a!=97);
SELECT a FROM t2
WHERE b=44
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR (g='wvutsrq' AND f GLOB 'klmno*');
SELECT a FROM t3
WHERE b=44
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR (g='wvutsrq' AND f GLOB 'klmno*');
SELECT a FROM t2
WHERE b=883
OR b=311
OR b=880
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR a=88
OR b=154
OR a=94
OR a=37
OR c=31031;
SELECT a FROM t3
WHERE b=883
OR b=311
OR b=880
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR a=88
OR b=154
OR a=94
OR a=37
OR c=31031;
SELECT a FROM t2
WHERE (g='onmlkji' AND f GLOB 'xyzab*')
OR a=10
OR b=190
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR b=385
OR a=82
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR c=22022;
SELECT a FROM t3
WHERE (g='onmlkji' AND f GLOB 'xyzab*')
OR a=10
OR b=190
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR b=385
OR a=82
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR c=22022;
SELECT a FROM t2
WHERE b=1070
OR a=33
OR b=363
OR a=47;
SELECT a FROM t3
WHERE b=1070
OR a=33
OR b=363
OR a=47;
SELECT a FROM t2
WHERE c=1001
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=49
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR c=33033
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR g IS NULL
OR b=220
OR (d>=70.0 AND d<71.0 AND d NOT NULL);
SELECT a FROM t3
WHERE c=1001
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=49
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR c=33033
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR g IS NULL
OR b=220
OR (d>=70.0 AND d<71.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=212
OR b=418
OR ((a BETWEEN 31 AND 33) AND a!=32);
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=212
OR b=418
OR ((a BETWEEN 31 AND 33) AND a!=32);
SELECT a FROM t2
WHERE b=344
OR f='nopqrstuv'
OR b=704
OR a=84;
SELECT a FROM t3
WHERE b=344
OR f='nopqrstuv'
OR b=704
OR a=84;
SELECT a FROM t2
WHERE ((a BETWEEN 30 AND 32) AND a!=31)
OR (d>=5.0 AND d<6.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 30 AND 32) AND a!=31)
OR (d>=5.0 AND d<6.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'jklmn*')
OR (f GLOB '?bcde*' AND f GLOB 'abcd*');
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'jklmn*')
OR (f GLOB '?bcde*' AND f GLOB 'abcd*');
SELECT a FROM t2
WHERE ((a BETWEEN 0 AND 2) AND a!=1)
OR b=1100
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR b=421
OR b=465
OR b=894
OR c=13013
OR b=47
OR b=674
OR ((a BETWEEN 0 AND 2) AND a!=1);
SELECT a FROM t3
WHERE ((a BETWEEN 0 AND 2) AND a!=1)
OR b=1100
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR b=421
OR b=465
OR b=894
OR c=13013
OR b=47
OR b=674
OR ((a BETWEEN 0 AND 2) AND a!=1);
SELECT a FROM t2
WHERE c=18018
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR b=410
OR b=858
OR (d>=49.0 AND d<50.0 AND d NOT NULL);
SELECT a FROM t3
WHERE c=18018
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR b=410
OR b=858
OR (d>=49.0 AND d<50.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='ponmlkj' AND f GLOB 'vwxyz*')
OR b=781;
SELECT a FROM t3
WHERE (g='ponmlkj' AND f GLOB 'vwxyz*')
OR b=781;
SELECT a FROM t2
WHERE b=1070
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR a=54
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR a=9
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR (d>=63.0 AND d<64.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=1070
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR a=54
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR a=9
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR (d>=63.0 AND d<64.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=55
OR a=62
OR a=63
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR (g='rqponml' AND f GLOB 'ijklm*')
OR ((a BETWEEN 99 AND 101) AND a!=100);
SELECT a FROM t3
WHERE a=55
OR a=62
OR a=63
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR (g='rqponml' AND f GLOB 'ijklm*')
OR ((a BETWEEN 99 AND 101) AND a!=100);
SELECT a FROM t2
WHERE b=421
OR b=146
OR b=22
OR f='efghijklm';
SELECT a FROM t3
WHERE b=421
OR b=146
OR b=22
OR f='efghijklm';
SELECT a FROM t2
WHERE b=553
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR (d>=59.0 AND d<60.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=583
OR a=56;
SELECT a FROM t3
WHERE b=553
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR (d>=59.0 AND d<60.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=583
OR a=56;
SELECT a FROM t2
WHERE a=83
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'defgh*')
OR a=1
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR b=245;
SELECT a FROM t3
WHERE a=83
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'defgh*')
OR a=1
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR b=245;
SELECT a FROM t2
WHERE c=3003
OR b=619
OR ((a BETWEEN 19 AND 21) AND a!=20);
SELECT a FROM t3
WHERE c=3003
OR b=619
OR ((a BETWEEN 19 AND 21) AND a!=20);
SELECT a FROM t2
WHERE b=924
OR a=92
OR a=63
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'tuvwx*');
SELECT a FROM t3
WHERE b=924
OR a=92
OR a=63
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'tuvwx*');
SELECT a FROM t2
WHERE b=440
OR f='vwxyzabcd'
OR b=190
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR b=88
OR b=58;
SELECT a FROM t3
WHERE b=440
OR f='vwxyzabcd'
OR b=190
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR b=88
OR b=58;
SELECT a FROM t2
WHERE b=495
OR c=24024
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR b=1001
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR d>1e10
OR b=531
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR b=1089;
SELECT a FROM t3
WHERE b=495
OR c=24024
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR b=1001
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR d>1e10
OR b=531
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR b=1089;
SELECT a FROM t2
WHERE (d>=48.0 AND d<49.0 AND d NOT NULL)
OR (d>=41.0 AND d<42.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=48.0 AND d<49.0 AND d NOT NULL)
OR (d>=41.0 AND d<42.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR d>1e10
OR b=22
OR c=5005
OR ((a BETWEEN 22 AND 24) AND a!=23);
SELECT a FROM t3
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR d>1e10
OR b=22
OR c=5005
OR ((a BETWEEN 22 AND 24) AND a!=23);
SELECT a FROM t2
WHERE ((a BETWEEN 9 AND 11) AND a!=10)
OR b=1078
OR b=806
OR b=605
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*');
SELECT a FROM t3
WHERE ((a BETWEEN 9 AND 11) AND a!=10)
OR b=1078
OR b=806
OR b=605
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*');
SELECT a FROM t2
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR b=572
OR c=10010
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=29
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*');
SELECT a FROM t3
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR b=572
OR c=10010
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=29
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*');
SELECT a FROM t2
WHERE ((a BETWEEN 94 AND 96) AND a!=95)
OR b=858
OR b=806
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (d>=77.0 AND d<78.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 94 AND 96) AND a!=95)
OR b=858
OR b=806
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (d>=77.0 AND d<78.0 AND d NOT NULL);
SELECT a FROM t2
WHERE f='vwxyzabcd'
OR a=72
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=935
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR c=13013;
SELECT a FROM t3
WHERE f='vwxyzabcd'
OR a=72
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=935
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR c=13013;
SELECT a FROM t2
WHERE c=5005
OR (g='gfedcba' AND f GLOB 'klmno*')
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR b=143
OR a=68
OR a=77
OR b=80;
SELECT a FROM t3
WHERE c=5005
OR (g='gfedcba' AND f GLOB 'klmno*')
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR b=143
OR a=68
OR a=77
OR b=80;
SELECT a FROM t2
WHERE (d>=5.0 AND d<6.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR (d>=72.0 AND d<73.0 AND d NOT NULL)
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=99
OR ((a BETWEEN 12 AND 14) AND a!=13);
SELECT a FROM t3
WHERE (d>=5.0 AND d<6.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'ghijk*')
OR (d>=72.0 AND d<73.0 AND d NOT NULL)
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=99
OR ((a BETWEEN 12 AND 14) AND a!=13);
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'opqrs*')
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR b=971
OR (g='xwvutsr' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'opqrs*')
OR ((a BETWEEN 88 AND 90) AND a!=89)
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR b=971
OR (g='xwvutsr' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE (f GLOB '?lmno*' AND f GLOB 'klmn*')
OR b=806
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR b=1015
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (f GLOB '?opqr*' AND f GLOB 'nopq*');
SELECT a FROM t3
WHERE (f GLOB '?lmno*' AND f GLOB 'klmn*')
OR b=806
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR b=1015
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (f GLOB '?opqr*' AND f GLOB 'nopq*');
SELECT a FROM t2
WHERE f='nopqrstuv'
OR b=993
OR a=76
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR c=20020
OR a=26
OR b=1048
OR b=561
OR (g='rqponml' AND f GLOB 'klmno*')
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR a=56;
SELECT a FROM t3
WHERE f='nopqrstuv'
OR b=993
OR a=76
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR c=20020
OR a=26
OR b=1048
OR b=561
OR (g='rqponml' AND f GLOB 'klmno*')
OR ((a BETWEEN 55 AND 57) AND a!=56)
OR a=56;
SELECT a FROM t2
WHERE b=781
OR b=671
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR b=113
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=385
OR (g='hgfedcb' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE b=781
OR b=671
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR b=113
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=385
OR (g='hgfedcb' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE b=410
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR b=674
OR b=825
OR b=704
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR a=76
OR c=32032
OR ((a BETWEEN 43 AND 45) AND a!=44);
SELECT a FROM t3
WHERE b=410
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR b=674
OR b=825
OR b=704
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR a=76
OR c=32032
OR ((a BETWEEN 43 AND 45) AND a!=44);
SELECT a FROM t2
WHERE b=869
OR (g='ponmlkj' AND f GLOB 'rstuv*');
SELECT a FROM t3
WHERE b=869
OR (g='ponmlkj' AND f GLOB 'rstuv*');
SELECT a FROM t2
WHERE b=869
OR a=34
OR (d>=87.0 AND d<88.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=869
OR a=34
OR (d>=87.0 AND d<88.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='rqponml' AND f GLOB 'hijkl*')
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR a=8
OR a=72
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR (g='gfedcba' AND f GLOB 'mnopq*');
SELECT a FROM t3
WHERE (g='rqponml' AND f GLOB 'hijkl*')
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR a=8
OR a=72
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR (g='gfedcba' AND f GLOB 'mnopq*');
SELECT a FROM t2
WHERE a=20
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR b=341
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=814
OR b=1026
OR a=14
OR a=13
OR b=1037
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t3
WHERE a=20
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR b=341
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=814
OR b=1026
OR a=14
OR a=13
OR b=1037
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t2
WHERE b=443
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=839
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR c=7007;
SELECT a FROM t3
WHERE b=443
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=839
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR c=7007;
SELECT a FROM t2
WHERE (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR a=21
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR (d>=3.0 AND d<4.0 AND d NOT NULL)
OR f='zabcdefgh'
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR b=506
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR b=88
OR b=190;
SELECT a FROM t3
WHERE (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR a=21
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR (d>=3.0 AND d<4.0 AND d NOT NULL)
OR f='zabcdefgh'
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR b=506
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR b=88
OR b=190;
SELECT a FROM t2
WHERE (d>=41.0 AND d<42.0 AND d NOT NULL)
OR f='bcdefghij'
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'efghi*')
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=762
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'yzabc*');
SELECT a FROM t3
WHERE (d>=41.0 AND d<42.0 AND d NOT NULL)
OR f='bcdefghij'
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'efghi*')
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=762
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'yzabc*');
SELECT a FROM t2
WHERE (d>=85.0 AND d<86.0 AND d NOT NULL)
OR f='qrstuvwxy'
OR (d>=56.0 AND d<57.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=85.0 AND d<86.0 AND d NOT NULL)
OR f='qrstuvwxy'
OR (d>=56.0 AND d<57.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=89.0 AND d<90.0 AND d NOT NULL)
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR a=21
OR b<0
OR f='bcdefghij'
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t3
WHERE (d>=89.0 AND d<90.0 AND d NOT NULL)
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR a=21
OR b<0
OR f='bcdefghij'
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t2
WHERE (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'fghij*')
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=1067
OR b=231
OR b=113
OR b=22
OR a=55
OR b=663;
SELECT a FROM t3
WHERE (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'fghij*')
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=1067
OR b=231
OR b=113
OR b=22
OR a=55
OR b=663;
SELECT a FROM t2
WHERE a=1
OR b=454
OR b=396
OR b=1059
OR a=69
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR b=440
OR b=825;
SELECT a FROM t3
WHERE a=1
OR b=454
OR b=396
OR b=1059
OR a=69
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR b=440
OR b=825;
SELECT a FROM t2
WHERE (d>=26.0 AND d<27.0 AND d NOT NULL)
OR b=308
OR c<=10
OR (g='xwvutsr' AND f GLOB 'hijkl*')
OR f='ghijklmno'
OR b=289
OR a=5
OR b=267
OR b=949
OR ((a BETWEEN 7 AND 9) AND a!=8);
SELECT a FROM t3
WHERE (d>=26.0 AND d<27.0 AND d NOT NULL)
OR b=308
OR c<=10
OR (g='xwvutsr' AND f GLOB 'hijkl*')
OR f='ghijklmno'
OR b=289
OR a=5
OR b=267
OR b=949
OR ((a BETWEEN 7 AND 9) AND a!=8);
SELECT a FROM t2
WHERE ((a BETWEEN 95 AND 97) AND a!=96)
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR b=993
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR b=663
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR b=869
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR b=121;
SELECT a FROM t3
WHERE ((a BETWEEN 95 AND 97) AND a!=96)
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR b=993
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR b=663
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR b=869
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR b=121;
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'efghi*')
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR (g='hgfedcb' AND f GLOB 'jklmn*')
OR b=770;
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'efghi*')
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR (g='hgfedcb' AND f GLOB 'jklmn*')
OR b=770;
SELECT a FROM t2
WHERE ((a BETWEEN 80 AND 82) AND a!=81)
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR (g='gfedcba' AND f GLOB 'mnopq*');
SELECT a FROM t3
WHERE ((a BETWEEN 80 AND 82) AND a!=81)
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR (g='gfedcba' AND f GLOB 'mnopq*');
SELECT a FROM t2
WHERE b=22
OR c=31031
OR b=894
OR a=31
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR a=94
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR a=21
OR b=1001;
SELECT a FROM t3
WHERE b=22
OR c=31031
OR b=894
OR a=31
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR a=94
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR a=21
OR b=1001;
SELECT a FROM t2
WHERE (g='onmlkji' AND f GLOB 'zabcd*')
OR b=1092
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR a=77
OR a=63
OR b=762
OR b=894
OR b=685
OR (g='vutsrqp' AND f GLOB 'nopqr*');
SELECT a FROM t3
WHERE (g='onmlkji' AND f GLOB 'zabcd*')
OR b=1092
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR a=77
OR a=63
OR b=762
OR b=894
OR b=685
OR (g='vutsrqp' AND f GLOB 'nopqr*');
SELECT a FROM t2
WHERE (g='wvutsrq' AND f GLOB 'klmno*')
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR b=231;
SELECT a FROM t3
WHERE (g='wvutsrq' AND f GLOB 'klmno*')
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR b=231;
SELECT a FROM t2
WHERE b=828
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR ((a BETWEEN 8 AND 10) AND a!=9);
SELECT a FROM t3
WHERE b=828
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR ((a BETWEEN 8 AND 10) AND a!=9);
SELECT a FROM t2
WHERE (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR b=520
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR a=21;
SELECT a FROM t3
WHERE (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR b=520
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR a=21;
SELECT a FROM t2
WHERE b=553
OR (g='lkjihgf' AND f GLOB 'lmnop*')
OR b=1034
OR b=418
OR a=57
OR f='mnopqrstu'
OR (d>=99.0 AND d<100.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=553
OR (g='lkjihgf' AND f GLOB 'lmnop*')
OR b=1034
OR b=418
OR a=57
OR f='mnopqrstu'
OR (d>=99.0 AND d<100.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=43
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR b=418
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR b=594
OR a=21
OR a=78
OR a=91
OR (d>=80.0 AND d<81.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=43
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR b=418
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR b=594
OR a=21
OR a=78
OR a=91
OR (d>=80.0 AND d<81.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=671
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR ((a BETWEEN 95 AND 97) AND a!=96);
SELECT a FROM t3
WHERE b=671
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR ((a BETWEEN 95 AND 97) AND a!=96);
SELECT a FROM t2
WHERE (d>=2.0 AND d<3.0 AND d NOT NULL)
OR b=726
OR b=663
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR a=25
OR f='qrstuvwxy';
SELECT a FROM t3
WHERE (d>=2.0 AND d<3.0 AND d NOT NULL)
OR b=726
OR b=663
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR a=25
OR f='qrstuvwxy';
SELECT a FROM t2
WHERE b=806
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR b=275
OR ((a BETWEEN 80 AND 82) AND a!=81);
SELECT a FROM t3
WHERE b=806
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR b=275
OR ((a BETWEEN 80 AND 82) AND a!=81);
SELECT a FROM t2
WHERE c=24024
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR b=429
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR b=110
OR a=39
OR (g='yxwvuts' AND f GLOB 'cdefg*');
SELECT a FROM t3
WHERE c=24024
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR b=429
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR b=110
OR a=39
OR (g='yxwvuts' AND f GLOB 'cdefg*');
SELECT a FROM t2
WHERE a=66
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR b=198
OR b=682
OR c=23023;
SELECT a FROM t3
WHERE a=66
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR b=198
OR b=682
OR c=23023;
SELECT a FROM t2
WHERE b=806
OR b=253
OR a=36;
SELECT a FROM t3
WHERE b=806
OR b=253
OR a=36;
SELECT a FROM t2
WHERE b=509
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR b=718
OR a=4
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=509
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR (g='vutsrqp' AND f GLOB 'nopqr*')
OR b=718
OR a=4
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'zabcd*')
OR b=1026
OR a=93
OR c=18018;
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'zabcd*')
OR b=1026
OR a=93
OR c=18018;
SELECT a FROM t2
WHERE b=388
OR a=44;
SELECT a FROM t3
WHERE b=388
OR a=44;
SELECT a FROM t2
WHERE c=9009
OR b=542
OR f='cdefghijk'
OR b=319
OR b=616;
SELECT a FROM t3
WHERE c=9009
OR b=542
OR f='cdefghijk'
OR b=319
OR b=616;
SELECT a FROM t2
WHERE b=990
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR b=531
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR f='qrstuvwxy';
SELECT a FROM t3
WHERE b=990
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR b=531
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR f='qrstuvwxy';
SELECT a FROM t2
WHERE a=60
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR b=627
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR b=883
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR f='yzabcdefg'
OR (d>=59.0 AND d<60.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=60
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR b=627
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR b=883
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR f='yzabcdefg'
OR (d>=59.0 AND d<60.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=696
OR b=938
OR a=18
OR b=957
OR c=18018
OR c=3003
OR ((a BETWEEN 33 AND 35) AND a!=34);
SELECT a FROM t3
WHERE b=696
OR b=938
OR a=18
OR b=957
OR c=18018
OR c=3003
OR ((a BETWEEN 33 AND 35) AND a!=34);
SELECT a FROM t2
WHERE c=29029
OR a=73;
SELECT a FROM t3
WHERE c=29029
OR a=73;
SELECT a FROM t2
WHERE a=28
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR b=69
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR b=781
OR a=64
OR b=91
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR a=16
OR b=278
OR a=26;
SELECT a FROM t3
WHERE a=28
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR b=69
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR b=781
OR a=64
OR b=91
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR a=16
OR b=278
OR a=26;
SELECT a FROM t2
WHERE a=70
OR c=3003;
SELECT a FROM t3
WHERE a=70
OR c=3003;
SELECT a FROM t2
WHERE c=31031
OR a=76
OR b=1023
OR b=33;
SELECT a FROM t3
WHERE c=31031
OR a=76
OR b=1023
OR b=33;
SELECT a FROM t2
WHERE (d>=62.0 AND d<63.0 AND d NOT NULL)
OR b=1001
OR (d>=86.0 AND d<87.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=62.0 AND d<63.0 AND d NOT NULL)
OR b=1001
OR (d>=86.0 AND d<87.0 AND d NOT NULL);
SELECT a FROM t2
WHERE f='yzabcdefg'
OR ((a BETWEEN 48 AND 50) AND a!=49)
OR a=100
OR (g='rqponml' AND f GLOB 'ijklm*')
OR a=62
OR a=67
OR b=605
OR c=23023
OR a=26
OR b=982
OR ((a BETWEEN 3 AND 5) AND a!=4);
SELECT a FROM t3
WHERE f='yzabcdefg'
OR ((a BETWEEN 48 AND 50) AND a!=49)
OR a=100
OR (g='rqponml' AND f GLOB 'ijklm*')
OR a=62
OR a=67
OR b=605
OR c=23023
OR a=26
OR b=982
OR ((a BETWEEN 3 AND 5) AND a!=4);
SELECT a FROM t2
WHERE b=220
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR f IS NULL
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR b=784;
SELECT a FROM t3
WHERE b=220
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR f IS NULL
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR b=784;
SELECT a FROM t2
WHERE (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR b=751
OR (g='gfedcba' AND f GLOB 'klmno*')
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR a=67
OR b=102;
SELECT a FROM t3
WHERE (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR b=751
OR (g='gfedcba' AND f GLOB 'klmno*')
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR a=67
OR b=102;
SELECT a FROM t2
WHERE (d>=69.0 AND d<70.0 AND d NOT NULL)
OR b=256
OR c=7007
OR c=26026
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR (d>=74.0 AND d<75.0 AND d NOT NULL)
OR a=66;
SELECT a FROM t3
WHERE (d>=69.0 AND d<70.0 AND d NOT NULL)
OR b=256
OR c=7007
OR c=26026
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR (d>=74.0 AND d<75.0 AND d NOT NULL)
OR a=66;
SELECT a FROM t2
WHERE c=2002
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR b=33
OR b=817
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR (d>=21.0 AND d<22.0 AND d NOT NULL);
SELECT a FROM t3
WHERE c=2002
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR b=33
OR b=817
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR (d>=21.0 AND d<22.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='srqponm' AND f GLOB 'cdefg*')
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR a=80
OR a=53
OR a=62
OR a=49
OR a=53
OR a=56
OR (d>=83.0 AND d<84.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='srqponm' AND f GLOB 'cdefg*')
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR a=80
OR a=53
OR a=62
OR a=49
OR a=53
OR a=56
OR (d>=83.0 AND d<84.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 7 AND 9) AND a!=8)
OR b=652
OR a=72
OR b=209
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR a=38
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR d>1e10;
SELECT a FROM t3
WHERE ((a BETWEEN 7 AND 9) AND a!=8)
OR b=652
OR a=72
OR b=209
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR a=38
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR d>1e10;
SELECT a FROM t2
WHERE b=949
OR e IS NULL;
SELECT a FROM t3
WHERE b=949
OR e IS NULL;
SELECT a FROM t2
WHERE b=179
OR (g='srqponm' AND f GLOB 'defgh*')
OR b=509
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR f='bcdefghij';
SELECT a FROM t3
WHERE b=179
OR (g='srqponm' AND f GLOB 'defgh*')
OR b=509
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR (d>=49.0 AND d<50.0 AND d NOT NULL)
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR f='bcdefghij';
SELECT a FROM t2
WHERE a=23
OR a=43
OR c=19019
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR c=18018;
SELECT a FROM t3
WHERE a=23
OR a=43
OR c=19019
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR c=18018;
SELECT a FROM t2
WHERE a=36
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR b=231;
SELECT a FROM t3
WHERE a=36
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR b=231;
SELECT a FROM t2
WHERE a=21
OR b=355
OR a=97;
SELECT a FROM t3
WHERE a=21
OR b=355
OR a=97;
SELECT a FROM t2
WHERE (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=421
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR b=704
OR a=90
OR a=78
OR 1000000<b
OR (d>=80.0 AND d<81.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR ((a BETWEEN 53 AND 55) AND a!=54);
SELECT a FROM t3
WHERE (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=421
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR b=704
OR a=90
OR a=78
OR 1000000<b
OR (d>=80.0 AND d<81.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR ((a BETWEEN 53 AND 55) AND a!=54);
SELECT a FROM t2
WHERE (g='fedcbaz' AND f GLOB 'pqrst*')
OR ((a BETWEEN 93 AND 95) AND a!=94);
SELECT a FROM t3
WHERE (g='fedcbaz' AND f GLOB 'pqrst*')
OR ((a BETWEEN 93 AND 95) AND a!=94);
SELECT a FROM t2
WHERE d<0.0
OR a=78
OR b=539
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR e IS NULL
OR a=48
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE d<0.0
OR a=78
OR b=539
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR e IS NULL
OR a=48
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE ((a BETWEEN 94 AND 96) AND a!=95)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR b=22;
SELECT a FROM t3
WHERE ((a BETWEEN 94 AND 96) AND a!=95)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR b=22;
SELECT a FROM t2
WHERE b=275
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR (g='rqponml' AND f GLOB 'lmnop*')
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR f='ijklmnopq';
SELECT a FROM t3
WHERE b=275
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR (g='rqponml' AND f GLOB 'lmnop*')
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR f='ijklmnopq';
SELECT a FROM t2
WHERE b=256
OR c=13013
OR b=44
OR f='jklmnopqr'
OR b=883;
SELECT a FROM t3
WHERE b=256
OR c=13013
OR b=44
OR f='jklmnopqr'
OR b=883;
SELECT a FROM t2
WHERE f='zabcdefgh'
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR a=54
OR b=770
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR a=81
OR b=190
OR a=2;
SELECT a FROM t3
WHERE f='zabcdefgh'
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR a=54
OR b=770
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR a=81
OR b=190
OR a=2;
SELECT a FROM t2
WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
OR c=12012
OR a=16
OR a=15
OR ((a BETWEEN 70 AND 72) AND a!=71)
OR a=69
OR b=748
OR a=61
OR b=473
OR ((a BETWEEN 69 AND 71) AND a!=70);
SELECT a FROM t3
WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
OR c=12012
OR a=16
OR a=15
OR ((a BETWEEN 70 AND 72) AND a!=71)
OR a=69
OR b=748
OR a=61
OR b=473
OR ((a BETWEEN 69 AND 71) AND a!=70);
SELECT a FROM t2
WHERE b=223
OR a=14
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR b=539
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR a=21;
SELECT a FROM t3
WHERE b=223
OR a=14
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR b=539
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR a=21;
SELECT a FROM t2
WHERE a=99
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR a=73
OR a=56
OR b=253
OR b=880;
SELECT a FROM t3
WHERE a=99
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR a=73
OR a=56
OR b=253
OR b=880;
SELECT a FROM t2
WHERE b=927
OR b=300
OR b=223
OR (g='wvutsrq' AND f GLOB 'jklmn*')
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=154
OR b=759;
SELECT a FROM t3
WHERE b=927
OR b=300
OR b=223
OR (g='wvutsrq' AND f GLOB 'jklmn*')
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=154
OR b=759;
SELECT a FROM t2
WHERE b=242
OR b=905
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR a=24
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR b=1100
OR b=850
OR ((a BETWEEN 55 AND 57) AND a!=56);
SELECT a FROM t3
WHERE b=242
OR b=905
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'ijklm*')
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR a=24
OR ((a BETWEEN 67 AND 69) AND a!=68)
OR b=1100
OR b=850
OR ((a BETWEEN 55 AND 57) AND a!=56);
SELECT a FROM t2
WHERE b=190
OR a=72
OR b=377
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR b=476
OR (g='yxwvuts' AND f GLOB 'cdefg*');
SELECT a FROM t3
WHERE b=190
OR a=72
OR b=377
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR b=476
OR (g='yxwvuts' AND f GLOB 'cdefg*');
SELECT a FROM t2
WHERE b=245
OR b=638
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR f='opqrstuvw'
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR b=817
OR a=85
OR (g='lkjihgf' AND f GLOB 'mnopq*');
SELECT a FROM t3
WHERE b=245
OR b=638
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR f='opqrstuvw'
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR b=817
OR a=85
OR (g='lkjihgf' AND f GLOB 'mnopq*');
SELECT a FROM t2
WHERE ((a BETWEEN 22 AND 24) AND a!=23)
OR b=968;
SELECT a FROM t3
WHERE ((a BETWEEN 22 AND 24) AND a!=23)
OR b=968;
SELECT a FROM t2
WHERE ((a BETWEEN 60 AND 62) AND a!=61)
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR b=22
OR b=993
OR f='tuvwxyzab';
SELECT a FROM t3
WHERE ((a BETWEEN 60 AND 62) AND a!=61)
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR b=22
OR b=993
OR f='tuvwxyzab';
SELECT a FROM t2
WHERE ((a BETWEEN 55 AND 57) AND a!=56)
OR (d>=85.0 AND d<86.0 AND d NOT NULL)
OR c<=10
OR ((a BETWEEN 75 AND 77) AND a!=76)
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR b=553
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR b=1045;
SELECT a FROM t3
WHERE ((a BETWEEN 55 AND 57) AND a!=56)
OR (d>=85.0 AND d<86.0 AND d NOT NULL)
OR c<=10
OR ((a BETWEEN 75 AND 77) AND a!=76)
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR b=553
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR b=1045;
SELECT a FROM t2
WHERE b=440
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR a=89
OR c=18018
OR b=154
OR b=506
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR a=78
OR b=751;
SELECT a FROM t3
WHERE b=440
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR ((a BETWEEN 44 AND 46) AND a!=45)
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR a=89
OR c=18018
OR b=154
OR b=506
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR a=78
OR b=751;
SELECT a FROM t2
WHERE b=407
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR (g='rqponml' AND f GLOB 'klmno*')
OR b=209
OR b=814
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR a=44
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR b=1092;
SELECT a FROM t3
WHERE b=407
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR (g='rqponml' AND f GLOB 'klmno*')
OR b=209
OR b=814
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR a=44
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR b=1092;
SELECT a FROM t2
WHERE ((a BETWEEN 24 AND 26) AND a!=25)
OR b=1103
OR b=190
OR b=737
OR a=97
OR b=451
OR b=583
OR a=63
OR c=8008
OR ((a BETWEEN 45 AND 47) AND a!=46);
SELECT a FROM t3
WHERE ((a BETWEEN 24 AND 26) AND a!=25)
OR b=1103
OR b=190
OR b=737
OR a=97
OR b=451
OR b=583
OR a=63
OR c=8008
OR ((a BETWEEN 45 AND 47) AND a!=46);
SELECT a FROM t2
WHERE a=12
OR b=935
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=1070
OR a=24
OR a=95
OR ((a BETWEEN 27 AND 29) AND a!=28)
OR a=40
OR b=935
OR (d>=53.0 AND d<54.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=12
OR b=935
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=1070
OR a=24
OR a=95
OR ((a BETWEEN 27 AND 29) AND a!=28)
OR a=40
OR b=935
OR (d>=53.0 AND d<54.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=858
OR a=82
OR b=209
OR b=374
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR c=22022;
SELECT a FROM t3
WHERE b=858
OR a=82
OR b=209
OR b=374
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR c=22022;
SELECT a FROM t2
WHERE a=27
OR (g='rqponml' AND f GLOB 'lmnop*')
OR b=121
OR ((a BETWEEN 7 AND 9) AND a!=8)
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR a=67
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR c=1001
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR ((a BETWEEN 19 AND 21) AND a!=20);
SELECT a FROM t3
WHERE a=27
OR (g='rqponml' AND f GLOB 'lmnop*')
OR b=121
OR ((a BETWEEN 7 AND 9) AND a!=8)
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR a=67
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR c=1001
OR ((a BETWEEN 50 AND 52) AND a!=51)
OR ((a BETWEEN 19 AND 21) AND a!=20);
SELECT a FROM t2
WHERE b=99
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR (d>=98.0 AND d<99.0 AND d NOT NULL)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (d>=46.0 AND d<47.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=99
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR (d>=98.0 AND d<99.0 AND d NOT NULL)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (d>=46.0 AND d<47.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=3
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR b=355
OR b=814
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR a=81
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR b=542
OR b=795;
SELECT a FROM t3
WHERE a=3
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR b=355
OR b=814
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR a=81
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR b=542
OR b=795;
SELECT a FROM t2
WHERE (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR b=363
OR (g='srqponm' AND f GLOB 'fghij*')
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR b=619
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR a=73;
SELECT a FROM t3
WHERE (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR b=363
OR (g='srqponm' AND f GLOB 'fghij*')
OR ((a BETWEEN 64 AND 66) AND a!=65)
OR b=619
OR (g='vutsrqp' AND f GLOB 'opqrs*')
OR a=73;
SELECT a FROM t2
WHERE b=935
OR a=42
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR b=330
OR (f GLOB '?klmn*' AND f GLOB 'jklm*');
SELECT a FROM t3
WHERE b=935
OR a=42
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR b=330
OR (f GLOB '?klmn*' AND f GLOB 'jklm*');
SELECT a FROM t2
WHERE a=79
OR b=201
OR b=99
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR a=64
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR a=89;
SELECT a FROM t3
WHERE a=79
OR b=201
OR b=99
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR a=64
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR a=89;
SELECT a FROM t2
WHERE b=784
OR a=85
OR b=663
OR c=17017
OR b=561
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b=495
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR b=352
OR ((a BETWEEN 39 AND 41) AND a!=40);
SELECT a FROM t3
WHERE b=784
OR a=85
OR b=663
OR c=17017
OR b=561
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR b=495
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR b=352
OR ((a BETWEEN 39 AND 41) AND a!=40);
SELECT a FROM t2
WHERE (d>=100.0 AND d<101.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR f='klmnopqrs'
OR f='lmnopqrst';
SELECT a FROM t3
WHERE (d>=100.0 AND d<101.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR f='klmnopqrs'
OR f='lmnopqrst';
SELECT a FROM t2
WHERE ((a BETWEEN 90 AND 92) AND a!=91)
OR a=46
OR a=44;
SELECT a FROM t3
WHERE ((a BETWEEN 90 AND 92) AND a!=91)
OR a=46
OR a=44;
SELECT a FROM t2
WHERE b=36
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR b=682
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR b=91
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR c=12012
OR b=267
OR (g='jihgfed' AND f GLOB 'yzabc*');
SELECT a FROM t3
WHERE b=36
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR b=682
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR b=91
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR c=12012
OR b=267
OR (g='jihgfed' AND f GLOB 'yzabc*');
SELECT a FROM t2
WHERE b=594
OR f='hijklmnop'
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR b=707
OR b=363
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=157
OR (g='tsrqpon' AND f GLOB 'yzabc*');
SELECT a FROM t3
WHERE b=594
OR f='hijklmnop'
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR b=707
OR b=363
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=157
OR (g='tsrqpon' AND f GLOB 'yzabc*');
SELECT a FROM t2
WHERE (d>=27.0 AND d<28.0 AND d NOT NULL)
OR a=2
OR a=84
OR b=399
OR b=828
OR a=21
OR b=748
OR c=13013
OR a=57
OR f='mnopqrstu';
SELECT a FROM t3
WHERE (d>=27.0 AND d<28.0 AND d NOT NULL)
OR a=2
OR a=84
OR b=399
OR b=828
OR a=21
OR b=748
OR c=13013
OR a=57
OR f='mnopqrstu';
SELECT a FROM t2
WHERE (g='nmlkjih' AND f GLOB 'defgh*')
OR b=674
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR c=3003
OR a=19
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR ((a BETWEEN 20 AND 22) AND a!=21);
SELECT a FROM t3
WHERE (g='nmlkjih' AND f GLOB 'defgh*')
OR b=674
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR c=3003
OR a=19
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR ((a BETWEEN 20 AND 22) AND a!=21);
SELECT a FROM t2
WHERE b=652
OR a=83
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR b=102
OR b=300
OR (d>=49.0 AND d<50.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=652
OR a=83
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR b=102
OR b=300
OR (d>=49.0 AND d<50.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 53 AND 55) AND a!=54)
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR c=4004
OR a=95
OR b=707
OR f='vwxyzabcd'
OR b=286
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=693
OR ((a BETWEEN 6 AND 8) AND a!=7);
SELECT a FROM t3
WHERE ((a BETWEEN 53 AND 55) AND a!=54)
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR c=4004
OR a=95
OR b=707
OR f='vwxyzabcd'
OR b=286
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=693
OR ((a BETWEEN 6 AND 8) AND a!=7);
SELECT a FROM t2
WHERE b=209
OR b=198
OR a=52
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR d<0.0
OR (g='rqponml' AND f GLOB 'jklmn*')
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR b=168
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR f='uvwxyzabc'
OR (d>=42.0 AND d<43.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=209
OR b=198
OR a=52
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR d<0.0
OR (g='rqponml' AND f GLOB 'jklmn*')
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR b=168
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR f='uvwxyzabc'
OR (d>=42.0 AND d<43.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 4 AND 6) AND a!=5)
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR f='rstuvwxyz'
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR a=14
OR (d>=12.0 AND d<13.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 4 AND 6) AND a!=5)
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR f='rstuvwxyz'
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR a=14
OR (d>=12.0 AND d<13.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 13 AND 15) AND a!=14)
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR f='mnopqrstu'
OR (g='fedcbaz' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR a=38
OR c=26026;
SELECT a FROM t3
WHERE ((a BETWEEN 13 AND 15) AND a!=14)
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR f='mnopqrstu'
OR (g='fedcbaz' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR a=38
OR c=26026;
SELECT a FROM t2
WHERE (g='ponmlkj' AND f GLOB 'stuvw*')
OR ((a BETWEEN 71 AND 73) AND a!=72)
OR a=7
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR (g='srqponm' AND f GLOB 'ghijk*')
OR ((a BETWEEN 33 AND 35) AND a!=34);
SELECT a FROM t3
WHERE (g='ponmlkj' AND f GLOB 'stuvw*')
OR ((a BETWEEN 71 AND 73) AND a!=72)
OR a=7
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR (g='srqponm' AND f GLOB 'ghijk*')
OR ((a BETWEEN 33 AND 35) AND a!=34);
SELECT a FROM t2
WHERE c=6006
OR b=938
OR b=484
OR b=652
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR f='opqrstuvw';
SELECT a FROM t3
WHERE c=6006
OR b=938
OR b=484
OR b=652
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR f='opqrstuvw';
SELECT a FROM t2
WHERE c=27027
OR b=968
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR b=487
OR b=924
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR c=14014
OR b=1001;
SELECT a FROM t3
WHERE c=27027
OR b=968
OR (d>=51.0 AND d<52.0 AND d NOT NULL)
OR b=487
OR b=924
OR (d>=70.0 AND d<71.0 AND d NOT NULL)
OR c=14014
OR b=1001;
SELECT a FROM t2
WHERE a=25
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=443
OR b=564
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=531
OR b=1081
OR a=96;
SELECT a FROM t3
WHERE a=25
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=443
OR b=564
OR (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=531
OR b=1081
OR a=96;
SELECT a FROM t2
WHERE b=36
OR (g='srqponm' AND f GLOB 'defgh*');
SELECT a FROM t3
WHERE b=36
OR (g='srqponm' AND f GLOB 'defgh*');
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'stuvw*')
OR b=531
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR (d>=3.0 AND d<4.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'stuvw*')
OR b=531
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR (d>=3.0 AND d<4.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=256
OR b=1034;
SELECT a FROM t3
WHERE b=256
OR b=1034;
SELECT a FROM t2
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR (d>=83.0 AND d<84.0 AND d NOT NULL)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR b=784
OR b=718
OR a=18
OR a=3
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR c=28028;
SELECT a FROM t3
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR (d>=83.0 AND d<84.0 AND d NOT NULL)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR b=784
OR b=718
OR a=18
OR a=3
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR c=28028;
SELECT a FROM t2
WHERE b=473
OR b=649
OR ((a BETWEEN 46 AND 48) AND a!=47)
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR b=1100
OR b=1012
OR a=72
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR b=176
OR b=355;
SELECT a FROM t3
WHERE b=473
OR b=649
OR ((a BETWEEN 46 AND 48) AND a!=47)
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR b=1100
OR b=1012
OR a=72
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR b=176
OR b=355;
SELECT a FROM t2
WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
OR f='cdefghijk'
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'ghijk*')
OR (d>=91.0 AND d<92.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
OR f='cdefghijk'
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'ghijk*')
OR (d>=91.0 AND d<92.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='mlkjihg' AND f GLOB 'ijklm*')
OR b=883
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR b=938
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR f='defghijkl'
OR c=2002
OR b=990;
SELECT a FROM t3
WHERE (g='mlkjihg' AND f GLOB 'ijklm*')
OR b=883
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR b=938
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR f='defghijkl'
OR c=2002
OR b=990;
SELECT a FROM t2
WHERE ((a BETWEEN 7 AND 9) AND a!=8)
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR b=902
OR b=25;
SELECT a FROM t3
WHERE ((a BETWEEN 7 AND 9) AND a!=8)
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR b=902
OR b=25;
SELECT a FROM t2
WHERE (g='tsrqpon' AND f GLOB 'abcde*')
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR b=1092
OR b=495;
SELECT a FROM t3
WHERE (g='tsrqpon' AND f GLOB 'abcde*')
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR ((a BETWEEN 74 AND 76) AND a!=75)
OR b=1092
OR b=495;
SELECT a FROM t2
WHERE ((a BETWEEN 90 AND 92) AND a!=91)
OR a=46
OR a=74;
SELECT a FROM t3
WHERE ((a BETWEEN 90 AND 92) AND a!=91)
OR a=46
OR a=74;
SELECT a FROM t2
WHERE a=18
OR b=66
OR b=498
OR b=143
OR b=1034
OR b=289
OR b=319;
SELECT a FROM t3
WHERE a=18
OR b=66
OR b=498
OR b=143
OR b=1034
OR b=289
OR b=319;
SELECT a FROM t2
WHERE (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR (g='srqponm' AND f GLOB 'efghi*')
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR (g='srqponm' AND f GLOB 'cdefg*')
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR f='lmnopqrst'
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR b=872
OR a=44
OR ((a BETWEEN 38 AND 40) AND a!=39);
SELECT a FROM t3
WHERE (f GLOB '?abcd*' AND f GLOB 'zabc*')
OR (g='srqponm' AND f GLOB 'efghi*')
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR (g='srqponm' AND f GLOB 'cdefg*')
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR f='lmnopqrst'
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR b=872
OR a=44
OR ((a BETWEEN 38 AND 40) AND a!=39);
SELECT a FROM t2
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR a=20
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR b=1004
OR b=77
OR b=927
OR a=99
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*');
SELECT a FROM t3
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR a=20
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR b=1004
OR b=77
OR b=927
OR a=99
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*');
SELECT a FROM t2
WHERE (d>=76.0 AND d<77.0 AND d NOT NULL)
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=11
OR ((a BETWEEN 21 AND 23) AND a!=22);
SELECT a FROM t3
WHERE (d>=76.0 AND d<77.0 AND d NOT NULL)
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=11
OR ((a BETWEEN 21 AND 23) AND a!=22);
SELECT a FROM t2
WHERE b=572
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE b=572
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE (d>=44.0 AND d<45.0 AND d NOT NULL)
OR ((a BETWEEN 54 AND 56) AND a!=55)
OR f='lmnopqrst'
OR (f GLOB '?lmno*' AND f GLOB 'klmn*')
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR a=23
OR (d>=69.0 AND d<70.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=44.0 AND d<45.0 AND d NOT NULL)
OR ((a BETWEEN 54 AND 56) AND a!=55)
OR f='lmnopqrst'
OR (f GLOB '?lmno*' AND f GLOB 'klmn*')
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR a=23
OR (d>=69.0 AND d<70.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=836
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR b=605
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR b=759
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR a=40
OR f='ghijklmno'
OR (g='hgfedcb' AND f GLOB 'hijkl*');
SELECT a FROM t3
WHERE b=836
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR b=605
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR b=759
OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR a=40
OR f='ghijklmno'
OR (g='hgfedcb' AND f GLOB 'hijkl*');
SELECT a FROM t2
WHERE (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=42.0 AND d<43.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=42.0 AND d<43.0 AND d NOT NULL);
SELECT a FROM t2
WHERE c=27027
OR b=872
OR a=56;
SELECT a FROM t3
WHERE c=27027
OR b=872
OR a=56;
SELECT a FROM t2
WHERE b=685
OR b=256
OR ((a BETWEEN 78 AND 80) AND a!=79)
OR a=44
OR a=63
OR a=15
OR ((a BETWEEN 22 AND 24) AND a!=23);
SELECT a FROM t3
WHERE b=685
OR b=256
OR ((a BETWEEN 78 AND 80) AND a!=79)
OR a=44
OR a=63
OR a=15
OR ((a BETWEEN 22 AND 24) AND a!=23);
SELECT a FROM t2
WHERE (g='nmlkjih' AND f GLOB 'efghi*')
OR a=34
OR ((a BETWEEN 6 AND 8) AND a!=7)
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR a=67
OR a=28;
SELECT a FROM t3
WHERE (g='nmlkjih' AND f GLOB 'efghi*')
OR a=34
OR ((a BETWEEN 6 AND 8) AND a!=7)
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR a=67
OR a=28;
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'pqrst*')
OR a=52
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR f='ghijklmno'
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=319
OR a=34
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR f='hijklmnop';
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'pqrst*')
OR a=52
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR f='ghijklmno'
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=319
OR a=34
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR f='hijklmnop';
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'pqrst*')
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR a=47;
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'pqrst*')
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR a=47;
SELECT a FROM t2
WHERE ((a BETWEEN 33 AND 35) AND a!=34)
OR c=7007;
SELECT a FROM t3
WHERE ((a BETWEEN 33 AND 35) AND a!=34)
OR c=7007;
SELECT a FROM t2
WHERE b=531
OR a=12
OR b=583
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR a=61
OR b=187;
SELECT a FROM t3
WHERE b=531
OR a=12
OR b=583
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR a=61
OR b=187;
SELECT a FROM t2
WHERE c=31031
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=256
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR b=715
OR b=212
OR b=99
OR c=29029;
SELECT a FROM t3
WHERE c=31031
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=256
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR b=715
OR b=212
OR b=99
OR c=29029;
SELECT a FROM t2
WHERE ((a BETWEEN 40 AND 42) AND a!=41)
OR b=33
OR a=62
OR b=916
OR b=1012
OR a=2
OR a=51
OR b=286
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=80;
SELECT a FROM t3
WHERE ((a BETWEEN 40 AND 42) AND a!=41)
OR b=33
OR a=62
OR b=916
OR b=1012
OR a=2
OR a=51
OR b=286
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=80;
SELECT a FROM t2
WHERE b=847
OR f='efghijklm'
OR (d>=6.0 AND d<7.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=847
OR f='efghijklm'
OR (d>=6.0 AND d<7.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
OR ((a BETWEEN 62 AND 64) AND a!=63);
SELECT a FROM t3
WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
OR ((a BETWEEN 62 AND 64) AND a!=63);
SELECT a FROM t2
WHERE ((a BETWEEN 43 AND 45) AND a!=44)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR a=43
OR (d>=14.0 AND d<15.0 AND d NOT NULL)
OR b=729
OR (g='vutsrqp' AND f GLOB 'opqrs*');
SELECT a FROM t3
WHERE ((a BETWEEN 43 AND 45) AND a!=44)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR a=43
OR (d>=14.0 AND d<15.0 AND d NOT NULL)
OR b=729
OR (g='vutsrqp' AND f GLOB 'opqrs*');
SELECT a FROM t2
WHERE f='efghijklm'
OR a=70
OR b=278
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR c=8008
OR f='opqrstuvw'
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR (g='xwvutsr' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE f='efghijklm'
OR a=70
OR b=278
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR c=8008
OR f='opqrstuvw'
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR (g='xwvutsr' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE ((a BETWEEN 40 AND 42) AND a!=41)
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR c<=10
OR (g='srqponm' AND f GLOB 'fghij*')
OR a=35
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=1089
OR a=73
OR b=737
OR c=18018
OR (d>=23.0 AND d<24.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 40 AND 42) AND a!=41)
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR c<=10
OR (g='srqponm' AND f GLOB 'fghij*')
OR a=35
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=1089
OR a=73
OR b=737
OR c=18018
OR (d>=23.0 AND d<24.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 0 AND 2) AND a!=1)
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=762
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR a=80;
SELECT a FROM t3
WHERE ((a BETWEEN 0 AND 2) AND a!=1)
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=762
OR ((a BETWEEN 39 AND 41) AND a!=40)
OR a=80;
SELECT a FROM t2
WHERE ((a BETWEEN 28 AND 30) AND a!=29)
OR b=737
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR b=979
OR a=36
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR a=55
OR (g='fedcbaz' AND f GLOB 'rstuv*');
SELECT a FROM t3
WHERE ((a BETWEEN 28 AND 30) AND a!=29)
OR b=737
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR b=979
OR a=36
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
OR (d>=50.0 AND d<51.0 AND d NOT NULL)
OR a=55
OR (g='fedcbaz' AND f GLOB 'rstuv*');
SELECT a FROM t2
WHERE a=75
OR a=61
OR (g='onmlkji' AND f GLOB 'abcde*')
OR (g='gfedcba' AND f GLOB 'nopqr*');
SELECT a FROM t3
WHERE a=75
OR a=61
OR (g='onmlkji' AND f GLOB 'abcde*')
OR (g='gfedcba' AND f GLOB 'nopqr*');
SELECT a FROM t2
WHERE b=1004
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR a=56;
SELECT a FROM t3
WHERE b=1004
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR a=56;
SELECT a FROM t2
WHERE a=93
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR a=83
OR b=828
OR b=454
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR b=924
OR (g='lkjihgf' AND f GLOB 'opqrs*')
OR a=50
OR (d>=38.0 AND d<39.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=93
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR a=83
OR b=828
OR b=454
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR b=924
OR (g='lkjihgf' AND f GLOB 'opqrs*')
OR a=50
OR (d>=38.0 AND d<39.0 AND d NOT NULL);
SELECT a FROM t2
WHERE f='stuvwxyza'
OR a=44
OR c=2002;
SELECT a FROM t3
WHERE f='stuvwxyza'
OR a=44
OR c=2002;
SELECT a FROM t2
WHERE a=55
OR a=65
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*');
SELECT a FROM t3
WHERE a=55
OR a=65
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*');
SELECT a FROM t2
WHERE ((a BETWEEN 72 AND 74) AND a!=73)
OR b=605
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR f='ijklmnopq'
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR c=9009
OR b=374;
SELECT a FROM t3
WHERE ((a BETWEEN 72 AND 74) AND a!=73)
OR b=605
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR f='ijklmnopq'
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR c=9009
OR b=374;
SELECT a FROM t2
WHERE b=476
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR b=982
OR a=43
OR b=355;
SELECT a FROM t3
WHERE b=476
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR b=982
OR a=43
OR b=355;
SELECT a FROM t2
WHERE a=85
OR b=718
OR (g='fedcbaz' AND f GLOB 'pqrst*')
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR (d>=25.0 AND d<26.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=85
OR b=718
OR (g='fedcbaz' AND f GLOB 'pqrst*')
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR (d>=25.0 AND d<26.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=73.0 AND d<74.0 AND d NOT NULL)
OR ((a BETWEEN 96 AND 98) AND a!=97);
SELECT a FROM t3
WHERE (d>=73.0 AND d<74.0 AND d NOT NULL)
OR ((a BETWEEN 96 AND 98) AND a!=97);
SELECT a FROM t2
WHERE b=176
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR ((a BETWEEN 27 AND 29) AND a!=28)
OR b=619
OR b=597
OR b=198
OR a=27
OR b=91
OR a=77
OR (d>=80.0 AND d<81.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=176
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR ((a BETWEEN 27 AND 29) AND a!=28)
OR b=619
OR b=597
OR b=198
OR a=27
OR b=91
OR a=77
OR (d>=80.0 AND d<81.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=41
OR b=528
OR c=3003
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR b=22;
SELECT a FROM t3
WHERE a=41
OR b=528
OR c=3003
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR b=22;
SELECT a FROM t2
WHERE (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR b=465
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=37
OR b=1056
OR (g='srqponm' AND f GLOB 'defgh*')
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR b=1023;
SELECT a FROM t3
WHERE (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR b=465
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=37
OR b=1056
OR (g='srqponm' AND f GLOB 'defgh*')
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR b=1023;
SELECT a FROM t2
WHERE a=76
OR a=8
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR b=495
OR b=663
OR a=98
OR b=748;
SELECT a FROM t3
WHERE a=76
OR a=8
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR b=495
OR b=663
OR a=98
OR b=748;
SELECT a FROM t2
WHERE b=1081
OR b=542
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR b=828
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR a=18;
SELECT a FROM t3
WHERE b=1081
OR b=542
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR b=828
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR a=18;
SELECT a FROM t2
WHERE f='abcdefghi'
OR a=14
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR c=27027
OR a=47;
SELECT a FROM t3
WHERE f='abcdefghi'
OR a=14
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR c=27027
OR a=47;
SELECT a FROM t2
WHERE c=31031
OR b=737
OR a=37
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR a=91
OR b=77
OR (d>=94.0 AND d<95.0 AND d NOT NULL);
SELECT a FROM t3
WHERE c=31031
OR b=737
OR a=37
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR (d>=94.0 AND d<95.0 AND d NOT NULL)
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR a=91
OR b=77
OR (d>=94.0 AND d<95.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=17
OR b=484
OR c=3003
OR b=121
OR a=53;
SELECT a FROM t3
WHERE a=17
OR b=484
OR c=3003
OR b=121
OR a=53;
SELECT a FROM t2
WHERE b=880
OR b=696
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR b=308
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR ((a BETWEEN 96 AND 98) AND a!=97);
SELECT a FROM t3
WHERE b=880
OR b=696
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR b=308
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR ((a BETWEEN 96 AND 98) AND a!=97);
SELECT a FROM t2
WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
OR a=24
OR f IS NULL
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR c=12012
OR (d>=88.0 AND d<89.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
OR a=24
OR f IS NULL
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR c=12012
OR (d>=88.0 AND d<89.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=94
OR (d>=74.0 AND d<75.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR b=792
OR a=77
OR a=26
OR b=641
OR a=38;
SELECT a FROM t3
WHERE a=94
OR (d>=74.0 AND d<75.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR b=792
OR a=77
OR a=26
OR b=641
OR a=38;
SELECT a FROM t2
WHERE ((a BETWEEN 51 AND 53) AND a!=52)
OR (d>=30.0 AND d<31.0 AND d NOT NULL)
OR b=14
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR b=121
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (d>=86.0 AND d<87.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 51 AND 53) AND a!=52)
OR (d>=30.0 AND d<31.0 AND d NOT NULL)
OR b=14
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR ((a BETWEEN 15 AND 17) AND a!=16)
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR b=121
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (d>=86.0 AND d<87.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=517
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR f='opqrstuvw';
SELECT a FROM t3
WHERE b=517
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR f='opqrstuvw';
SELECT a FROM t2
WHERE (d>=84.0 AND d<85.0 AND d NOT NULL)
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=267
OR c=19019
OR a=42
OR b=938
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR (f GLOB '?klmn*' AND f GLOB 'jklm*');
SELECT a FROM t3
WHERE (d>=84.0 AND d<85.0 AND d NOT NULL)
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=267
OR c=19019
OR a=42
OR b=938
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR (f GLOB '?klmn*' AND f GLOB 'jklm*');
SELECT a FROM t2
WHERE b=179
OR a=50
OR (g='srqponm' AND f GLOB 'defgh*');
SELECT a FROM t3
WHERE b=179
OR a=50
OR (g='srqponm' AND f GLOB 'defgh*');
SELECT a FROM t2
WHERE (g='vutsrqp' AND f GLOB 'rstuv*')
OR f='xyzabcdef'
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR b=575
OR b=385
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=46
OR b=220
OR a=63;
SELECT a FROM t3
WHERE (g='vutsrqp' AND f GLOB 'rstuv*')
OR f='xyzabcdef'
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR b=575
OR b=385
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=46
OR b=220
OR a=63;
SELECT a FROM t2
WHERE b=1056
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=1078
OR (d>=80.0 AND d<81.0 AND d NOT NULL)
OR c=31031
OR b=869
OR (g='jihgfed' AND f GLOB 'zabcd*')
OR b=245
OR a=92
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=880;
SELECT a FROM t3
WHERE b=1056
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=1078
OR (d>=80.0 AND d<81.0 AND d NOT NULL)
OR c=31031
OR b=869
OR (g='jihgfed' AND f GLOB 'zabcd*')
OR b=245
OR a=92
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=880;
SELECT a FROM t2
WHERE b=1078
OR c=28028
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR c=9009
OR a=17
OR (d>=39.0 AND d<40.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=1078
OR c=28028
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR (g='mlkjihg' AND f GLOB 'jklmn*')
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR c=9009
OR a=17
OR (d>=39.0 AND d<40.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=57.0 AND d<58.0 AND d NOT NULL)
OR b=762
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR f='tuvwxyzab'
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR b=1034
OR (d>=14.0 AND d<15.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=57.0 AND d<58.0 AND d NOT NULL)
OR b=762
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR f='tuvwxyzab'
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR b=1034
OR (d>=14.0 AND d<15.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=47
OR b=187
OR a=56
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR ((a BETWEEN 89 AND 91) AND a!=90);
SELECT a FROM t3
WHERE b=47
OR b=187
OR a=56
OR ((a BETWEEN 30 AND 32) AND a!=31)
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR ((a BETWEEN 89 AND 91) AND a!=90);
SELECT a FROM t2
WHERE c=11011
OR a=14
OR c=16016
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'efghi*')
OR f='jklmnopqr'
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=916;
SELECT a FROM t3
WHERE c=11011
OR a=14
OR c=16016
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'efghi*')
OR f='jklmnopqr'
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=916;
SELECT a FROM t2
WHERE b=949
OR (g='srqponm' AND f GLOB 'cdefg*')
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR c<=10
OR a=14
OR b=608
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=121
OR b=333
OR ((a BETWEEN 93 AND 95) AND a!=94);
SELECT a FROM t3
WHERE b=949
OR (g='srqponm' AND f GLOB 'cdefg*')
OR (g='vutsrqp' AND f GLOB 'rstuv*')
OR c<=10
OR a=14
OR b=608
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=121
OR b=333
OR ((a BETWEEN 93 AND 95) AND a!=94);
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=355
OR b=627
OR b=1001
OR b=1026
OR ((a BETWEEN 58 AND 60) AND a!=59);
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
OR b=355
OR b=627
OR b=1001
OR b=1026
OR ((a BETWEEN 58 AND 60) AND a!=59);
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'efghi*')
OR (d>=79.0 AND d<80.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'efghi*')
OR (d>=79.0 AND d<80.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=685
OR a=14
OR b=990
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR f='efghijklm'
OR c=1001
OR b=784
OR (g='srqponm' AND f GLOB 'ghijk*')
OR (d>=69.0 AND d<70.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=685
OR a=14
OR b=990
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR f='efghijklm'
OR c=1001
OR b=784
OR (g='srqponm' AND f GLOB 'ghijk*')
OR (d>=69.0 AND d<70.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=54
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR c=26026
OR ((a BETWEEN 97 AND 99) AND a!=98);
SELECT a FROM t3
WHERE a=54
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR c=26026
OR ((a BETWEEN 97 AND 99) AND a!=98);
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'ghijk*')
OR c=24024
OR a=98
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR a=5
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='rqponml' AND f GLOB 'klmno*')
OR f='pqrstuvwx'
OR f='bcdefghij'
OR b=1001
OR ((a BETWEEN 77 AND 79) AND a!=78);
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'ghijk*')
OR c=24024
OR a=98
OR (g='utsrqpo' AND f GLOB 'vwxyz*')
OR a=5
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (g='rqponml' AND f GLOB 'klmno*')
OR f='pqrstuvwx'
OR f='bcdefghij'
OR b=1001
OR ((a BETWEEN 77 AND 79) AND a!=78);
SELECT a FROM t2
WHERE b=781
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR f='lmnopqrst'
OR a=39
OR a=100
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t3
WHERE b=781
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR f='lmnopqrst'
OR a=39
OR a=100
OR ((a BETWEEN 56 AND 58) AND a!=57);
SELECT a FROM t2
WHERE c=4004
OR b=718
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR a=50
OR (d>=11.0 AND d<12.0 AND d NOT NULL)
OR b=363
OR (g='rqponml' AND f GLOB 'ijklm*')
OR b=1023;
SELECT a FROM t3
WHERE c=4004
OR b=718
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR a=50
OR (d>=11.0 AND d<12.0 AND d NOT NULL)
OR b=363
OR (g='rqponml' AND f GLOB 'ijklm*')
OR b=1023;
SELECT a FROM t2
WHERE b=1081
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR b=473
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR b=586
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*');
SELECT a FROM t3
WHERE b=1081
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR b=473
OR ((a BETWEEN 43 AND 45) AND a!=44)
OR b=586
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*');
SELECT a FROM t2
WHERE (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR (d>=58.0 AND d<59.0 AND d NOT NULL)
OR (d>=13.0 AND d<14.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR (d>=58.0 AND d<59.0 AND d NOT NULL)
OR (d>=13.0 AND d<14.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR a=47
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR (g='lkjihgf' AND f GLOB 'lmnop*')
OR (d>=84.0 AND d<85.0 AND d NOT NULL)
OR f='lmnopqrst';
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
OR ((a BETWEEN 76 AND 78) AND a!=77)
OR a=47
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR (g='lkjihgf' AND f GLOB 'lmnop*')
OR (d>=84.0 AND d<85.0 AND d NOT NULL)
OR f='lmnopqrst';
SELECT a FROM t2
WHERE c>=34035
OR a=29
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR f='abcdefghi'
OR b=993
OR ((a BETWEEN 52 AND 54) AND a!=53)
OR ((a BETWEEN 45 AND 47) AND a!=46);
SELECT a FROM t3
WHERE c>=34035
OR a=29
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
OR f='abcdefghi'
OR b=993
OR ((a BETWEEN 52 AND 54) AND a!=53)
OR ((a BETWEEN 45 AND 47) AND a!=46);
SELECT a FROM t2
WHERE (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=696
OR b=154
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR a=22
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR a=52
OR a=21
OR (d>=70.0 AND d<71.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=696
OR b=154
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR a=22
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR a=52
OR a=21
OR (d>=70.0 AND d<71.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=693
OR b=201
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR b=520
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR b=407
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR c>=34035
OR b=135;
SELECT a FROM t3
WHERE b=693
OR b=201
OR ((a BETWEEN 36 AND 38) AND a!=37)
OR b=520
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR b=407
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR c>=34035
OR b=135;
SELECT a FROM t2
WHERE (d>=43.0 AND d<44.0 AND d NOT NULL)
OR b=707
OR b=14
OR b=1089
OR b=352;
SELECT a FROM t3
WHERE (d>=43.0 AND d<44.0 AND d NOT NULL)
OR b=707
OR b=14
OR b=1089
OR b=352;
SELECT a FROM t2
WHERE b=278
OR b=278
OR b=825
OR f='rstuvwxyz'
OR b=938
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR ((a BETWEEN 43 AND 45) AND a!=44);
SELECT a FROM t3
WHERE b=278
OR b=278
OR b=825
OR f='rstuvwxyz'
OR b=938
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR ((a BETWEEN 43 AND 45) AND a!=44);
SELECT a FROM t2
WHERE ((a BETWEEN 32 AND 34) AND a!=33)
OR b=1045
OR c=27027
OR (f GLOB '?mnop*' AND f GLOB 'lmno*');
SELECT a FROM t3
WHERE ((a BETWEEN 32 AND 34) AND a!=33)
OR b=1045
OR c=27027
OR (f GLOB '?mnop*' AND f GLOB 'lmno*');
SELECT a FROM t2
WHERE a=87
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR b=487
OR (g='gfedcba' AND f GLOB 'mnopq*');
SELECT a FROM t3
WHERE a=87
OR (d>=47.0 AND d<48.0 AND d NOT NULL)
OR b=487
OR (g='gfedcba' AND f GLOB 'mnopq*');
SELECT a FROM t2
WHERE ((a BETWEEN 30 AND 32) AND a!=31)
OR b=69
OR b=608
OR b=814
OR a=67
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR b=1059
OR (d>=58.0 AND d<59.0 AND d NOT NULL)
OR a=18
OR b=407
OR ((a BETWEEN 10 AND 12) AND a!=11);
SELECT a FROM t3
WHERE ((a BETWEEN 30 AND 32) AND a!=31)
OR b=69
OR b=608
OR b=814
OR a=67
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR b=1059
OR (d>=58.0 AND d<59.0 AND d NOT NULL)
OR a=18
OR b=407
OR ((a BETWEEN 10 AND 12) AND a!=11);
SELECT a FROM t2
WHERE b=223
OR b=80
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR ((a BETWEEN 74 AND 76) AND a!=75);
SELECT a FROM t3
WHERE b=223
OR b=80
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR ((a BETWEEN 74 AND 76) AND a!=75);
SELECT a FROM t2
WHERE b=220
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR b=363
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR ((a BETWEEN 10 AND 12) AND a!=11);
SELECT a FROM t3
WHERE b=220
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR b=363
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'defgh*')
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR ((a BETWEEN 10 AND 12) AND a!=11);
SELECT a FROM t2
WHERE b=498
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR b=880
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR b=828
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR b=113;
SELECT a FROM t3
WHERE b=498
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR b=880
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR b=828
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR b=113;
SELECT a FROM t2
WHERE b=1059
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR b=960
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=894
OR c=2002;
SELECT a FROM t3
WHERE b=1059
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR b=960
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR b=894
OR c=2002;
SELECT a FROM t2
WHERE b=14
OR (g='hgfedcb' AND f GLOB 'hijkl*');
SELECT a FROM t3
WHERE b=14
OR (g='hgfedcb' AND f GLOB 'hijkl*');
SELECT a FROM t2
WHERE b=806
OR (g='rqponml' AND f GLOB 'hijkl*')
OR b=795
OR ((a BETWEEN 99 AND 101) AND a!=100)
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR c=23023
OR (d>=99.0 AND d<100.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=806
OR (g='rqponml' AND f GLOB 'hijkl*')
OR b=795
OR ((a BETWEEN 99 AND 101) AND a!=100)
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR c=23023
OR (d>=99.0 AND d<100.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=726
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR f='abcdefghi'
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR b=869;
SELECT a FROM t3
WHERE b=726
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR f='abcdefghi'
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR b=869;
SELECT a FROM t2
WHERE a=59
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR b=1081
OR (g='fedcbaz' AND f GLOB 'stuvw*');
SELECT a FROM t3
WHERE a=59
OR ((a BETWEEN 5 AND 7) AND a!=6)
OR b=1081
OR (g='fedcbaz' AND f GLOB 'stuvw*');
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'nopqr*')
OR b=1037
OR b=132
OR c=1001
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR (d>=58.0 AND d<59.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=32;
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'nopqr*')
OR b=1037
OR b=132
OR c=1001
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR (d>=58.0 AND d<59.0 AND d NOT NULL)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=32;
SELECT a FROM t2
WHERE a=24
OR b=927
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR a=7
OR b=462
OR b=608
OR b=781
OR b=253
OR c=25025
OR b=132;
SELECT a FROM t3
WHERE a=24
OR b=927
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR a=7
OR b=462
OR b=608
OR b=781
OR b=253
OR c=25025
OR b=132;
SELECT a FROM t2
WHERE (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=1001
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR a=83;
SELECT a FROM t3
WHERE (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=1001
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR a=83;
SELECT a FROM t2
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR b=36
OR (f GLOB '?efgh*' AND f GLOB 'defg*')
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR ((a BETWEEN 46 AND 48) AND a!=47)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR ((a BETWEEN 26 AND 28) AND a!=27);
SELECT a FROM t3
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR b=36
OR (f GLOB '?efgh*' AND f GLOB 'defg*')
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR ((a BETWEEN 46 AND 48) AND a!=47)
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR (d>=91.0 AND d<92.0 AND d NOT NULL)
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR ((a BETWEEN 26 AND 28) AND a!=27);
SELECT a FROM t2
WHERE a=69
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR a=98
OR b=300
OR a=41
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR a=33
OR ((a BETWEEN 10 AND 12) AND a!=11);
SELECT a FROM t3
WHERE a=69
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR a=98
OR b=300
OR a=41
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR a=33
OR ((a BETWEEN 10 AND 12) AND a!=11);
SELECT a FROM t2
WHERE ((a BETWEEN 68 AND 70) AND a!=69)
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR ((a BETWEEN 94 AND 96) AND a!=95)
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR b=619
OR c=6006
OR b=91
OR b=297
OR b=165;
SELECT a FROM t3
WHERE ((a BETWEEN 68 AND 70) AND a!=69)
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR ((a BETWEEN 94 AND 96) AND a!=95)
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR b=619
OR c=6006
OR b=91
OR b=297
OR b=165;
SELECT a FROM t2
WHERE ((a BETWEEN 9 AND 11) AND a!=10)
OR a=55
OR (g='jihgfed' AND f GLOB 'xyzab*');
SELECT a FROM t3
WHERE ((a BETWEEN 9 AND 11) AND a!=10)
OR a=55
OR (g='jihgfed' AND f GLOB 'xyzab*');
SELECT a FROM t2
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR b=737
OR b=201
OR a=7
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR b=957;
SELECT a FROM t3
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR b=737
OR b=201
OR a=7
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (g='yxwvuts' AND f GLOB 'cdefg*')
OR b=957;
SELECT a FROM t2
WHERE ((a BETWEEN 90 AND 92) AND a!=91)
OR a=74
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR a=89;
SELECT a FROM t3
WHERE ((a BETWEEN 90 AND 92) AND a!=91)
OR a=74
OR (g='lkjihgf' AND f GLOB 'pqrst*')
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
OR a=89;
SELECT a FROM t2
WHERE (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=179
OR b=1081
OR b=377
OR b=495
OR b=564
OR b=289
OR (g='qponmlk' AND f GLOB 'nopqr*');
SELECT a FROM t3
WHERE (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=179
OR b=1081
OR b=377
OR b=495
OR b=564
OR b=289
OR (g='qponmlk' AND f GLOB 'nopqr*');
SELECT a FROM t2
WHERE (g='utsrqpo' AND f GLOB 'wxyza*')
OR a=69
OR a=12
OR b=718
OR ((a BETWEEN 20 AND 22) AND a!=21);
SELECT a FROM t3
WHERE (g='utsrqpo' AND f GLOB 'wxyza*')
OR a=69
OR a=12
OR b=718
OR ((a BETWEEN 20 AND 22) AND a!=21);
SELECT a FROM t2
WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
OR f='klmnopqrs'
OR b=674
OR a=96
OR a=99
OR b=608
OR b=707
OR f='cdefghijk'
OR a=91
OR (g='tsrqpon' AND f GLOB 'xyzab*');
SELECT a FROM t3
WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
OR f='klmnopqrs'
OR b=674
OR a=96
OR a=99
OR b=608
OR b=707
OR f='cdefghijk'
OR a=91
OR (g='tsrqpon' AND f GLOB 'xyzab*');
SELECT a FROM t2
WHERE (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR b=564
OR b=784
OR b=418
OR b=275
OR (g='gfedcba' AND f GLOB 'klmno*')
OR a=58
OR c=11011
OR b=660;
SELECT a FROM t3
WHERE (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR b=564
OR b=784
OR b=418
OR b=275
OR (g='gfedcba' AND f GLOB 'klmno*')
OR a=58
OR c=11011
OR b=660;
SELECT a FROM t2
WHERE (d>=25.0 AND d<26.0 AND d NOT NULL)
OR b=509
OR b=1004
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (g='mlkjihg' AND f GLOB 'hijkl*')
OR f='pqrstuvwx';
SELECT a FROM t3
WHERE (d>=25.0 AND d<26.0 AND d NOT NULL)
OR b=509
OR b=1004
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR ((a BETWEEN 57 AND 59) AND a!=58)
OR (g='mlkjihg' AND f GLOB 'hijkl*')
OR f='pqrstuvwx';
SELECT a FROM t2
WHERE b=440
OR ((a BETWEEN 52 AND 54) AND a!=53);
SELECT a FROM t3
WHERE b=440
OR ((a BETWEEN 52 AND 54) AND a!=53);
SELECT a FROM t2
WHERE (d>=95.0 AND d<96.0 AND d NOT NULL)
OR f='abcdefghi';
SELECT a FROM t3
WHERE (d>=95.0 AND d<96.0 AND d NOT NULL)
OR f='abcdefghi';
SELECT a FROM t2
WHERE a=19
OR a=29
OR b=476
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR b=91;
SELECT a FROM t3
WHERE a=19
OR a=29
OR b=476
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR b=91;
SELECT a FROM t2
WHERE f='lmnopqrst'
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR a=47
OR a=71;
SELECT a FROM t3
WHERE f='lmnopqrst'
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR a=47
OR a=71;
SELECT a FROM t2
WHERE b=531
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=44
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR b=707
OR b=322;
SELECT a FROM t3
WHERE b=531
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=44
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR b=707
OR b=322;
SELECT a FROM t2
WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR f='jklmnopqr';
SELECT a FROM t3
WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR f='jklmnopqr';
SELECT a FROM t2
WHERE b=946
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR a=47
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR b=80
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR (g='tsrqpon' AND f GLOB 'xyzab*');
SELECT a FROM t3
WHERE b=946
OR (g='ihgfedc' AND f GLOB 'abcde*')
OR a=47
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR b=80
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR (g='tsrqpon' AND f GLOB 'xyzab*');
SELECT a FROM t2
WHERE a=48
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR b=1015
OR a=57
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR ((a BETWEEN 47 AND 49) AND a!=48)
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR b=165;
SELECT a FROM t3
WHERE a=48
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR b=1015
OR a=57
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR ((a BETWEEN 47 AND 49) AND a!=48)
OR ((a BETWEEN 98 AND 100) AND a!=99)
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR (d>=4.0 AND d<5.0 AND d NOT NULL)
OR b=165;
SELECT a FROM t2
WHERE ((a BETWEEN 97 AND 99) AND a!=98)
OR a=73
OR b=1048
OR c>=34035
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR a=72
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=638;
SELECT a FROM t3
WHERE ((a BETWEEN 97 AND 99) AND a!=98)
OR a=73
OR b=1048
OR c>=34035
OR (g='ihgfedc' AND f GLOB 'cdefg*')
OR a=72
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=638;
SELECT a FROM t2
WHERE ((a BETWEEN 28 AND 30) AND a!=29)
OR a=39
OR b=165;
SELECT a FROM t3
WHERE ((a BETWEEN 28 AND 30) AND a!=29)
OR a=39
OR b=165;
SELECT a FROM t2
WHERE a=50
OR ((a BETWEEN 61 AND 63) AND a!=62)
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR a=32
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR a=14
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR b=946
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR b=124;
SELECT a FROM t3
WHERE a=50
OR ((a BETWEEN 61 AND 63) AND a!=62)
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR a=32
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR a=14
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR b=946
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR b=124;
SELECT a FROM t2
WHERE ((a BETWEEN 88 AND 90) AND a!=89)
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'klmno*');
SELECT a FROM t3
WHERE ((a BETWEEN 88 AND 90) AND a!=89)
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'klmno*');
SELECT a FROM t2
WHERE a=6
OR f='tuvwxyzab'
OR (g='mlkjihg' AND f GLOB 'hijkl*')
OR b=286
OR b=781;
SELECT a FROM t3
WHERE a=6
OR f='tuvwxyzab'
OR (g='mlkjihg' AND f GLOB 'hijkl*')
OR b=286
OR b=781;
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'zabcd*')
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR f='vwxyzabcd'
OR b=275;
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'zabcd*')
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR f='vwxyzabcd'
OR b=275;
SELECT a FROM t2
WHERE (d>=30.0 AND d<31.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR a=59;
SELECT a FROM t3
WHERE (d>=30.0 AND d<31.0 AND d NOT NULL)
OR (g='xwvutsr' AND f GLOB 'efghi*')
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'nopqr*')
OR a=59;
SELECT a FROM t2
WHERE (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR b=663
OR f='ghijklmno'
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR f='ghijklmno'
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR b=1081;
SELECT a FROM t3
WHERE (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR b=663
OR f='ghijklmno'
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR f='ghijklmno'
OR (d>=64.0 AND d<65.0 AND d NOT NULL)
OR (d>=19.0 AND d<20.0 AND d NOT NULL)
OR b=1081;
SELECT a FROM t2
WHERE ((a BETWEEN 30 AND 32) AND a!=31)
OR a=96
OR b=355
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR b=597
OR ((a BETWEEN 92 AND 94) AND a!=93)
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR (f GLOB '?lmno*' AND f GLOB 'klmn*')
OR b=168
OR (g='vutsrqp' AND f GLOB 'pqrst*');
SELECT a FROM t3
WHERE ((a BETWEEN 30 AND 32) AND a!=31)
OR a=96
OR b=355
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR b=597
OR ((a BETWEEN 92 AND 94) AND a!=93)
OR (d>=88.0 AND d<89.0 AND d NOT NULL)
OR (f GLOB '?lmno*' AND f GLOB 'klmn*')
OR b=168
OR (g='vutsrqp' AND f GLOB 'pqrst*');
SELECT a FROM t2
WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
OR b=957
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR a=40;
SELECT a FROM t3
WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
OR b=957
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR a=40;
SELECT a FROM t2
WHERE ((a BETWEEN 12 AND 14) AND a!=13)
OR a=36
OR a=75
OR b=179
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR (d>=65.0 AND d<66.0 AND d NOT NULL)
OR b=850
OR a=62;
SELECT a FROM t3
WHERE ((a BETWEEN 12 AND 14) AND a!=13)
OR a=36
OR a=75
OR b=179
OR (d>=43.0 AND d<44.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'stuvw*')
OR (d>=65.0 AND d<66.0 AND d NOT NULL)
OR b=850
OR a=62;
SELECT a FROM t2
WHERE ((a BETWEEN 21 AND 23) AND a!=22)
OR a=79
OR a=66
OR b=487
OR a=1
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR c=5005
OR a=47
OR c=5005
OR b=319
OR b=1037;
SELECT a FROM t3
WHERE ((a BETWEEN 21 AND 23) AND a!=22)
OR a=79
OR a=66
OR b=487
OR a=1
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR c=5005
OR a=47
OR c=5005
OR b=319
OR b=1037;
SELECT a FROM t2
WHERE b=176
OR b=297
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR f='ijklmnopq';
SELECT a FROM t3
WHERE b=176
OR b=297
OR (g='tsrqpon' AND f GLOB 'zabcd*')
OR f='ijklmnopq';
SELECT a FROM t2
WHERE (d>=10.0 AND d<11.0 AND d NOT NULL)
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR b=319
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR a=21
OR (d>=72.0 AND d<73.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=10.0 AND d<11.0 AND d NOT NULL)
OR ((a BETWEEN 90 AND 92) AND a!=91)
OR b=319
OR ((a BETWEEN 31 AND 33) AND a!=32)
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR a=21
OR (d>=72.0 AND d<73.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=22.0 AND d<23.0 AND d NOT NULL)
OR b=396
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR b=1012
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR b=784
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR b=979
OR c<=10
OR b=913
OR b=66;
SELECT a FROM t3
WHERE (d>=22.0 AND d<23.0 AND d NOT NULL)
OR b=396
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR b=1012
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR b=784
OR (d>=60.0 AND d<61.0 AND d NOT NULL)
OR b=979
OR c<=10
OR b=913
OR b=66;
SELECT a FROM t2
WHERE a=3
OR b=803;
SELECT a FROM t3
WHERE a=3
OR b=803;
SELECT a FROM t2
WHERE ((a BETWEEN 79 AND 81) AND a!=80)
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*');
SELECT a FROM t3
WHERE ((a BETWEEN 79 AND 81) AND a!=80)
OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
OR ((a BETWEEN 23 AND 25) AND a!=24)
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*');
SELECT a FROM t2
WHERE c=1001
OR a=16
OR b=132
OR b=1012
OR f='xyzabcdef'
OR b=682
OR (d>=52.0 AND d<53.0 AND d NOT NULL);
SELECT a FROM t3
WHERE c=1001
OR a=16
OR b=132
OR b=1012
OR f='xyzabcdef'
OR b=682
OR (d>=52.0 AND d<53.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=96
OR (d>=19.0 AND d<20.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=96
OR (d>=19.0 AND d<20.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=2
OR (d>=11.0 AND d<12.0 AND d NOT NULL)
OR a=23
OR b=1092
OR c=19019
OR b=245
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR b=572
OR ((a BETWEEN 22 AND 24) AND a!=23);
SELECT a FROM t3
WHERE a=2
OR (d>=11.0 AND d<12.0 AND d NOT NULL)
OR a=23
OR b=1092
OR c=19019
OR b=245
OR ((a BETWEEN 97 AND 99) AND a!=98)
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR b=572
OR ((a BETWEEN 22 AND 24) AND a!=23);
SELECT a FROM t2
WHERE (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=993
OR c=17017
OR (d>=85.0 AND d<86.0 AND d NOT NULL)
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR b=333;
SELECT a FROM t3
WHERE (d>=16.0 AND d<17.0 AND d NOT NULL)
OR b=993
OR c=17017
OR (d>=85.0 AND d<86.0 AND d NOT NULL)
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR b=333;
SELECT a FROM t2
WHERE b=330
OR a=73
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=828
OR b=363
OR (g='rqponml' AND f GLOB 'lmnop*');
SELECT a FROM t3
WHERE b=330
OR a=73
OR (d>=61.0 AND d<62.0 AND d NOT NULL)
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=828
OR b=363
OR (g='rqponml' AND f GLOB 'lmnop*');
SELECT a FROM t2
WHERE (g='gfedcba' AND f GLOB 'lmnop*')
OR a=41
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR b=825;
SELECT a FROM t3
WHERE (g='gfedcba' AND f GLOB 'lmnop*')
OR a=41
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR b=825;
SELECT a FROM t2
WHERE ((a BETWEEN 46 AND 48) AND a!=47)
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=905
OR b=176
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR b=561
OR c=8008
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR b=935
OR c=1001;
SELECT a FROM t3
WHERE ((a BETWEEN 46 AND 48) AND a!=47)
OR (d>=10.0 AND d<11.0 AND d NOT NULL)
OR b=905
OR b=176
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR b=561
OR c=8008
OR (g='hgfedcb' AND f GLOB 'ghijk*')
OR b=935
OR c=1001;
SELECT a FROM t2
WHERE ((a BETWEEN 75 AND 77) AND a!=76)
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t3
WHERE ((a BETWEEN 75 AND 77) AND a!=76)
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t2
WHERE ((a BETWEEN 5 AND 7) AND a!=6)
OR a=28;
SELECT a FROM t3
WHERE ((a BETWEEN 5 AND 7) AND a!=6)
OR a=28;
SELECT a FROM t2
WHERE b=781
OR b=410;
SELECT a FROM t3
WHERE b=781
OR b=410;
SELECT a FROM t2
WHERE ((a BETWEEN 18 AND 20) AND a!=19)
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (d>=72.0 AND d<73.0 AND d NOT NULL)
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR f='zabcdefgh'
OR b=861
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR a=28
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=311;
SELECT a FROM t3
WHERE ((a BETWEEN 18 AND 20) AND a!=19)
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR (d>=72.0 AND d<73.0 AND d NOT NULL)
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR f='zabcdefgh'
OR b=861
OR (g='vutsrqp' AND f GLOB 'pqrst*')
OR a=28
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=311;
SELECT a FROM t2
WHERE b=575
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR b=418
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR b=792
OR b=861
OR b=220
OR ((a BETWEEN 89 AND 91) AND a!=90);
SELECT a FROM t3
WHERE b=575
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR b=418
OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
OR b=792
OR b=861
OR b=220
OR ((a BETWEEN 89 AND 91) AND a!=90);
SELECT a FROM t2
WHERE b=517
OR b=913
OR b=253
OR b=198
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR a=17
OR (d>=85.0 AND d<86.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=517
OR b=913
OR b=253
OR b=198
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR a=17
OR (d>=85.0 AND d<86.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'qrstu*')
OR b=693
OR a=73
OR b=627
OR c=5005
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=267
OR b=872
OR a=27
OR (g='gfedcba' AND f GLOB 'klmno*');
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'qrstu*')
OR b=693
OR a=73
OR b=627
OR c=5005
OR (d>=62.0 AND d<63.0 AND d NOT NULL)
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR b=267
OR b=872
OR a=27
OR (g='gfedcba' AND f GLOB 'klmno*');
SELECT a FROM t2
WHERE a=10
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR b=1059
OR a=70
OR a=93;
SELECT a FROM t3
WHERE a=10
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR b=1059
OR a=70
OR a=93;
SELECT a FROM t2
WHERE a=30
OR a=32
OR b=1037
OR b=198
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR a=25;
SELECT a FROM t3
WHERE a=30
OR a=32
OR b=1037
OR b=198
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR a=25;
SELECT a FROM t2
WHERE (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=66
OR b=322
OR b=465
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR (g='lkjihgf' AND f GLOB 'mnopq*')
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR b=454;
SELECT a FROM t3
WHERE (g='ponmlkj' AND f GLOB 'uvwxy*')
OR b=66
OR b=322
OR b=465
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR (d>=7.0 AND d<8.0 AND d NOT NULL)
OR ((a BETWEEN 77 AND 79) AND a!=78)
OR (g='lkjihgf' AND f GLOB 'mnopq*')
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR b=454;
SELECT a FROM t2
WHERE b=924
OR ((a BETWEEN 35 AND 37) AND a!=36)
OR c=15015
OR (d>=84.0 AND d<85.0 AND d NOT NULL)
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR (g='onmlkji' AND f GLOB 'abcde*')
OR b=803;
SELECT a FROM t3
WHERE b=924
OR ((a BETWEEN 35 AND 37) AND a!=36)
OR c=15015
OR (d>=84.0 AND d<85.0 AND d NOT NULL)
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR (g='onmlkji' AND f GLOB 'abcde*')
OR b=803;
SELECT a FROM t2
WHERE b=1100
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR a=75
OR a=45
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR a=27
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR b=850
OR ((a BETWEEN 55 AND 57) AND a!=56);
SELECT a FROM t3
WHERE b=1100
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR ((a BETWEEN 72 AND 74) AND a!=73)
OR ((a BETWEEN 68 AND 70) AND a!=69)
OR a=75
OR a=45
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR a=27
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR b=850
OR ((a BETWEEN 55 AND 57) AND a!=56);
SELECT a FROM t2
WHERE b=751
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR a=89
OR ((a BETWEEN 36 AND 38) AND a!=37);
SELECT a FROM t3
WHERE b=751
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR (d>=71.0 AND d<72.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR (d>=56.0 AND d<57.0 AND d NOT NULL)
OR a=89
OR ((a BETWEEN 36 AND 38) AND a!=37);
SELECT a FROM t2
WHERE (g='wvutsrq' AND f GLOB 'jklmn*')
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR a=1
OR (g='utsrqpo' AND f GLOB 'tuvwx*');
SELECT a FROM t3
WHERE (g='wvutsrq' AND f GLOB 'jklmn*')
OR (g='yxwvuts' AND f GLOB 'bcdef*')
OR a=1
OR (g='utsrqpo' AND f GLOB 'tuvwx*');
SELECT a FROM t2
WHERE b=927
OR c=15015
OR f='klmnopqrs'
OR c=8008
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR b=960
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR b=443
OR (g='rqponml' AND f GLOB 'ijklm*');
SELECT a FROM t3
WHERE b=927
OR c=15015
OR f='klmnopqrs'
OR c=8008
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR b=960
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR b=443
OR (g='rqponml' AND f GLOB 'ijklm*');
SELECT a FROM t2
WHERE (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=212
OR f='cdefghijk';
SELECT a FROM t3
WHERE (d>=37.0 AND d<38.0 AND d NOT NULL)
OR b=212
OR f='cdefghijk';
SELECT a FROM t2
WHERE b=685
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR b=520
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR a=53
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=938
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR c=25025;
SELECT a FROM t3
WHERE b=685
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR b=520
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR a=53
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=938
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR c=25025;
SELECT a FROM t2
WHERE b=583
OR b=894
OR c=26026
OR (d>=84.0 AND d<85.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=583
OR b=894
OR c=26026
OR (d>=84.0 AND d<85.0 AND d NOT NULL);
SELECT a FROM t2
WHERE f='abcdefghi'
OR (g='edcbazy' AND f GLOB 'wxyza*');
SELECT a FROM t3
WHERE f='abcdefghi'
OR (g='edcbazy' AND f GLOB 'wxyza*');
SELECT a FROM t2
WHERE b=1103
OR b=638
OR b=792
OR b=1034
OR b=308
OR f='nopqrstuv'
OR b=264
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR (d>=58.0 AND d<59.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=1103
OR b=638
OR b=792
OR b=1034
OR b=308
OR f='nopqrstuv'
OR b=264
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR (d>=58.0 AND d<59.0 AND d NOT NULL);
SELECT a FROM t2
WHERE f='defghijkl'
OR b=814
OR f='yzabcdefg';
SELECT a FROM t3
WHERE f='defghijkl'
OR b=814
OR f='yzabcdefg';
SELECT a FROM t2
WHERE b=209
OR b=806
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'rstuv*');
SELECT a FROM t3
WHERE b=209
OR b=806
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'rstuv*');
SELECT a FROM t2
WHERE f='opqrstuvw'
OR b=69
OR b=366;
SELECT a FROM t3
WHERE f='opqrstuvw'
OR b=69
OR b=366;
SELECT a FROM t2
WHERE (d>=4.0 AND d<5.0 AND d NOT NULL)
OR a=45
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR a=69
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t3
WHERE (d>=4.0 AND d<5.0 AND d NOT NULL)
OR a=45
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR a=69
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t2
WHERE c=9009
OR (d>=85.0 AND d<86.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'pqrst*');
SELECT a FROM t3
WHERE c=9009
OR (d>=85.0 AND d<86.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR (d>=9.0 AND d<10.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'pqrst*');
SELECT a FROM t2
WHERE a=98
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR a=47
OR c=24024
OR a=27
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR (d>=20.0 AND d<21.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=98
OR (d>=100.0 AND d<101.0 AND d NOT NULL)
OR (d>=63.0 AND d<64.0 AND d NOT NULL)
OR a=47
OR c=24024
OR a=27
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR (d>=20.0 AND d<21.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='utsrqpo' AND f GLOB 'wxyza*')
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR a=19;
SELECT a FROM t3
WHERE (g='utsrqpo' AND f GLOB 'wxyza*')
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR a=19;
SELECT a FROM t2
WHERE c=12012
OR (d>=80.0 AND d<81.0 AND d NOT NULL)
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR (g='edcbazy' AND f GLOB 'uvwxy*');
SELECT a FROM t3
WHERE c=12012
OR (d>=80.0 AND d<81.0 AND d NOT NULL)
OR ((a BETWEEN 16 AND 18) AND a!=17)
OR (g='edcbazy' AND f GLOB 'uvwxy*');
SELECT a FROM t2
WHERE ((a BETWEEN 38 AND 40) AND a!=39)
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR b=429
OR f='jklmnopqr'
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR ((a BETWEEN 77 AND 79) AND a!=78);
SELECT a FROM t3
WHERE ((a BETWEEN 38 AND 40) AND a!=39)
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR b=429
OR f='jklmnopqr'
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR ((a BETWEEN 77 AND 79) AND a!=78);
SELECT a FROM t2
WHERE (g='lkjihgf' AND f GLOB 'mnopq*')
OR b=190;
SELECT a FROM t3
WHERE (g='lkjihgf' AND f GLOB 'mnopq*')
OR b=190;
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'yzabc*')
OR b=674
OR b=289;
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'yzabc*')
OR b=674
OR b=289;
SELECT a FROM t2
WHERE a=17
OR b=539
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR (g='utsrqpo' AND f GLOB 'vwxyz*');
SELECT a FROM t3
WHERE a=17
OR b=539
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR (g='utsrqpo' AND f GLOB 'vwxyz*');
SELECT a FROM t2
WHERE b=924
OR c=27027
OR ((a BETWEEN 65 AND 67) AND a!=66);
SELECT a FROM t3
WHERE b=924
OR c=27027
OR ((a BETWEEN 65 AND 67) AND a!=66);
SELECT a FROM t2
WHERE b=564
OR f='mnopqrstu'
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR b=1103;
SELECT a FROM t3
WHERE b=564
OR f='mnopqrstu'
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR b=1103;
SELECT a FROM t2
WHERE b=231
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR a=38
OR a=4
OR b=784;
SELECT a FROM t3
WHERE b=231
OR (d>=24.0 AND d<25.0 AND d NOT NULL)
OR a=38
OR a=4
OR b=784;
SELECT a FROM t2
WHERE f='ghijklmno'
OR a=26
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=81
OR (d>=3.0 AND d<4.0 AND d NOT NULL)
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR b=275
OR (g='hgfedcb' AND f GLOB 'jklmn*')
OR b=311
OR b=894
OR b=872;
SELECT a FROM t3
WHERE f='ghijklmno'
OR a=26
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR a=81
OR (d>=3.0 AND d<4.0 AND d NOT NULL)
OR ((a BETWEEN 28 AND 30) AND a!=29)
OR b=275
OR (g='hgfedcb' AND f GLOB 'jklmn*')
OR b=311
OR b=894
OR b=872;
SELECT a FROM t2
WHERE a=91
OR b=619;
SELECT a FROM t3
WHERE a=91
OR b=619;
SELECT a FROM t2
WHERE (d>=4.0 AND d<5.0 AND d NOT NULL)
OR a=85
OR f IS NULL
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=154
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR (d>=25.0 AND d<26.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=4.0 AND d<5.0 AND d NOT NULL)
OR a=85
OR f IS NULL
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=154
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR (d>=25.0 AND d<26.0 AND d NOT NULL);
SELECT a FROM t2
WHERE a=44
OR b=55
OR a=30
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR 1000000<b
OR a=24
OR b=1089
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR (g='rqponml' AND f GLOB 'hijkl*');
SELECT a FROM t3
WHERE a=44
OR b=55
OR a=30
OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR 1000000<b
OR a=24
OR b=1089
OR (d>=75.0 AND d<76.0 AND d NOT NULL)
OR (g='rqponml' AND f GLOB 'hijkl*');
SELECT a FROM t2
WHERE (d>=16.0 AND d<17.0 AND d NOT NULL)
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR b=36
OR ((a BETWEEN 33 AND 35) AND a!=34);
SELECT a FROM t3
WHERE (d>=16.0 AND d<17.0 AND d NOT NULL)
OR ((a BETWEEN 80 AND 82) AND a!=81)
OR b=36
OR ((a BETWEEN 33 AND 35) AND a!=34);
SELECT a FROM t2
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR (d>=35.0 AND d<36.0 AND d NOT NULL)
OR c=26026
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR a=56
OR b=506
OR b=781
OR (d>=28.0 AND d<29.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR (d>=35.0 AND d<36.0 AND d NOT NULL)
OR c=26026
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR a=56
OR b=506
OR b=781
OR (d>=28.0 AND d<29.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='edcbazy' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR f='xyzabcdef'
OR b=517
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR (g='kjihgfe' AND f GLOB 'qrstu*');
SELECT a FROM t3
WHERE (g='edcbazy' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 25 AND 27) AND a!=26)
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR ((a BETWEEN 89 AND 91) AND a!=90)
OR f='xyzabcdef'
OR b=517
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR (g='kjihgfe' AND f GLOB 'qrstu*');
SELECT a FROM t2
WHERE a=54
OR a=59;
SELECT a FROM t3
WHERE a=54
OR a=59;
SELECT a FROM t2
WHERE (g='tsrqpon' AND f GLOB 'yzabc*')
OR b=762
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR a=25
OR ((a BETWEEN 65 AND 67) AND a!=66);
SELECT a FROM t3
WHERE (g='tsrqpon' AND f GLOB 'yzabc*')
OR b=762
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR a=25
OR ((a BETWEEN 65 AND 67) AND a!=66);
SELECT a FROM t2
WHERE (d>=59.0 AND d<60.0 AND d NOT NULL)
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR b=839
OR f='defghijkl'
OR (d>=95.0 AND d<96.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR b=498;
SELECT a FROM t3
WHERE (d>=59.0 AND d<60.0 AND d NOT NULL)
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR b=839
OR f='defghijkl'
OR (d>=95.0 AND d<96.0 AND d NOT NULL)
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR (d>=52.0 AND d<53.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR b=498;
SELECT a FROM t2
WHERE b=256
OR c=19019
OR a=54
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=498
OR b=77;
SELECT a FROM t3
WHERE b=256
OR c=19019
OR a=54
OR (d>=46.0 AND d<47.0 AND d NOT NULL)
OR b=498
OR b=77;
SELECT a FROM t2
WHERE (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=256
OR b=586
OR a=74
OR b=113
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR b=495;
SELECT a FROM t3
WHERE (g='mlkjihg' AND f GLOB 'jklmn*')
OR b=256
OR b=586
OR a=74
OR b=113
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR b=495;
SELECT a FROM t2
WHERE a=12
OR a=50
OR (d>=33.0 AND d<34.0 AND d NOT NULL)
OR ((a BETWEEN 66 AND 68) AND a!=67);
SELECT a FROM t3
WHERE a=12
OR a=50
OR (d>=33.0 AND d<34.0 AND d NOT NULL)
OR ((a BETWEEN 66 AND 68) AND a!=67);
SELECT a FROM t2
WHERE b=308
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR a=83
OR c=23023
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR a=58
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR (g='srqponm' AND f GLOB 'efghi*')
OR c=4004;
SELECT a FROM t3
WHERE b=308
OR (d>=73.0 AND d<74.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR a=83
OR c=23023
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR (g='lkjihgf' AND f GLOB 'nopqr*')
OR a=58
OR ((a BETWEEN 17 AND 19) AND a!=18)
OR (g='srqponm' AND f GLOB 'efghi*')
OR c=4004;
SELECT a FROM t2
WHERE b=476
OR a=26
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=762
OR b=157
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'cdefg*');
SELECT a FROM t3
WHERE b=476
OR a=26
OR (d>=87.0 AND d<88.0 AND d NOT NULL)
OR b=762
OR b=157
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (g='nmlkjih' AND f GLOB 'cdefg*');
SELECT a FROM t2
WHERE (d>=77.0 AND d<78.0 AND d NOT NULL)
OR a=1
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR b=278
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR f='qrstuvwxy'
OR (g='onmlkji' AND f GLOB 'abcde*')
OR ((a BETWEEN 82 AND 84) AND a!=83)
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (d>=72.0 AND d<73.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=77.0 AND d<78.0 AND d NOT NULL)
OR a=1
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR b=278
OR (g='xwvutsr' AND f GLOB 'defgh*')
OR f='qrstuvwxy'
OR (g='onmlkji' AND f GLOB 'abcde*')
OR ((a BETWEEN 82 AND 84) AND a!=83)
OR (g='edcbazy' AND f GLOB 'uvwxy*')
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (d>=72.0 AND d<73.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=124
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=759
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR ((a BETWEEN 45 AND 47) AND a!=46)
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t3
WHERE b=124
OR (d>=92.0 AND d<93.0 AND d NOT NULL)
OR ((a BETWEEN 41 AND 43) AND a!=42)
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=759
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR ((a BETWEEN 45 AND 47) AND a!=46)
OR (g='kjihgfe' AND f GLOB 'uvwxy*');
SELECT a FROM t2
WHERE b=872
OR b=267
OR b=814
OR b=99
OR c<=10
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR b=44
OR f='zabcdefgh'
OR b=979
OR (g='rqponml' AND f GLOB 'hijkl*');
SELECT a FROM t3
WHERE b=872
OR b=267
OR b=814
OR b=99
OR c<=10
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR b=44
OR f='zabcdefgh'
OR b=979
OR (g='rqponml' AND f GLOB 'hijkl*');
SELECT a FROM t2
WHERE (d>=26.0 AND d<27.0 AND d NOT NULL)
OR f='xyzabcdef';
SELECT a FROM t3
WHERE (d>=26.0 AND d<27.0 AND d NOT NULL)
OR f='xyzabcdef';
SELECT a FROM t2
WHERE b=487
OR b=355
OR c=9009
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=113
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR a=90
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'jklmn*')
OR f='nopqrstuv';
SELECT a FROM t3
WHERE b=487
OR b=355
OR c=9009
OR (d>=8.0 AND d<9.0 AND d NOT NULL)
OR ((a BETWEEN 32 AND 34) AND a!=33)
OR b=113
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR a=90
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR (g='hgfedcb' AND f GLOB 'jklmn*')
OR f='nopqrstuv';
SELECT a FROM t2
WHERE (d>=34.0 AND d<35.0 AND d NOT NULL)
OR b=275;
SELECT a FROM t3
WHERE (d>=34.0 AND d<35.0 AND d NOT NULL)
OR b=275;
SELECT a FROM t2
WHERE b=355
OR a=44
OR b=374
OR c=25025
OR b=198
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR d<0.0
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR c=9009;
SELECT a FROM t3
WHERE b=355
OR a=44
OR b=374
OR c=25025
OR b=198
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR d<0.0
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR c=9009;
SELECT a FROM t2
WHERE (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR b=814
OR (d>=54.0 AND d<55.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
OR b=814
OR (d>=54.0 AND d<55.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='lkjihgf' AND f GLOB 'mnopq*')
OR b=333
OR b=275;
SELECT a FROM t3
WHERE (g='lkjihgf' AND f GLOB 'mnopq*')
OR b=333
OR b=275;
SELECT a FROM t2
WHERE (g='ihgfedc' AND f GLOB 'efghi*')
OR ((a BETWEEN 33 AND 35) AND a!=34);
SELECT a FROM t3
WHERE (g='ihgfedc' AND f GLOB 'efghi*')
OR ((a BETWEEN 33 AND 35) AND a!=34);
SELECT a FROM t2
WHERE ((a BETWEEN 11 AND 13) AND a!=12)
OR b=253
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR b=286
OR (d>=10.0 AND d<11.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 11 AND 13) AND a!=12)
OR b=253
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR b=286
OR (d>=10.0 AND d<11.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR ((a BETWEEN 26 AND 28) AND a!=27)
OR b=421
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR f='ijklmnopq'
OR b=891
OR b=1056;
SELECT a FROM t3
WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR ((a BETWEEN 26 AND 28) AND a!=27)
OR b=421
OR (g='xwvutsr' AND f GLOB 'fghij*')
OR f='ijklmnopq'
OR b=891
OR b=1056;
SELECT a FROM t2
WHERE f='fghijklmn'
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR b=671
OR (g='xwvutsr' AND f GLOB 'hijkl*');
SELECT a FROM t3
WHERE f='fghijklmn'
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR (g='edcbazy' AND f GLOB 'vwxyz*')
OR b=671
OR (g='xwvutsr' AND f GLOB 'hijkl*');
SELECT a FROM t2
WHERE (g='lkjihgf' AND f GLOB 'lmnop*')
OR (g='srqponm' AND f GLOB 'fghij*')
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR (d>=11.0 AND d<12.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='lkjihgf' AND f GLOB 'lmnop*')
OR (g='srqponm' AND f GLOB 'fghij*')
OR ((a BETWEEN 4 AND 6) AND a!=5)
OR (g='kjihgfe' AND f GLOB 'qrstu*')
OR (d>=11.0 AND d<12.0 AND d NOT NULL);
SELECT a FROM t2
WHERE c=11011
OR a=20
OR b=432
OR b=410
OR a=86
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR b=638
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR b=190;
SELECT a FROM t3
WHERE c=11011
OR a=20
OR b=432
OR b=410
OR a=86
OR (d>=89.0 AND d<90.0 AND d NOT NULL)
OR b=638
OR ((a BETWEEN 58 AND 60) AND a!=59)
OR b=190;
SELECT a FROM t2
WHERE b=88
OR ((a BETWEEN 42 AND 44) AND a!=43)
OR a=76
OR b=69
OR b=847
OR b=275;
SELECT a FROM t3
WHERE b=88
OR ((a BETWEEN 42 AND 44) AND a!=43)
OR a=76
OR b=69
OR b=847
OR b=275;
SELECT a FROM t2
WHERE b=781
OR b=77
OR b=58
OR ((a BETWEEN 67 AND 69) AND a!=68);
SELECT a FROM t3
WHERE b=781
OR b=77
OR b=58
OR ((a BETWEEN 67 AND 69) AND a!=68);
SELECT a FROM t2
WHERE ((a BETWEEN 67 AND 69) AND a!=68)
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR a=46
OR b=187
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (g='onmlkji' AND f GLOB 'yzabc*');
SELECT a FROM t3
WHERE ((a BETWEEN 67 AND 69) AND a!=68)
OR (d>=69.0 AND d<70.0 AND d NOT NULL)
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR a=46
OR b=187
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR (g='onmlkji' AND f GLOB 'yzabc*');
SELECT a FROM t2
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR a=99
OR c=3003
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR b=300
OR b=718
OR c>=34035
OR b=264;
SELECT a FROM t3
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR a=99
OR c=3003
OR (d>=57.0 AND d<58.0 AND d NOT NULL)
OR b=300
OR b=718
OR c>=34035
OR b=264;
SELECT a FROM t2
WHERE b=872
OR b=209
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR b=355
OR b=729
OR ((a BETWEEN 81 AND 83) AND a!=82)
OR a=58
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR b=608;
SELECT a FROM t3
WHERE b=872
OR b=209
OR ((a BETWEEN 65 AND 67) AND a!=66)
OR b=355
OR b=729
OR ((a BETWEEN 81 AND 83) AND a!=82)
OR a=58
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR b=608;
SELECT a FROM t2
WHERE c=29029
OR f='efghijklm'
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR a=26
OR (f GLOB '?efgh*' AND f GLOB 'defg*');
SELECT a FROM t3
WHERE c=29029
OR f='efghijklm'
OR (d>=48.0 AND d<49.0 AND d NOT NULL)
OR a=26
OR (f GLOB '?efgh*' AND f GLOB 'defg*');
SELECT a FROM t2
WHERE a=59
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR a=7
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=762
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*');
SELECT a FROM t3
WHERE a=59
OR (g='wvutsrq' AND f GLOB 'mnopq*')
OR a=7
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=762
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*');
SELECT a FROM t2
WHERE (g='gfedcba' AND f GLOB 'nopqr*')
OR b=539
OR b=399;
SELECT a FROM t3
WHERE (g='gfedcba' AND f GLOB 'nopqr*')
OR b=539
OR b=399;
SELECT a FROM t2
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR a=92;
SELECT a FROM t3
WHERE ((a BETWEEN 71 AND 73) AND a!=72)
OR ((a BETWEEN 96 AND 98) AND a!=97)
OR a=92;
SELECT a FROM t2
WHERE (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (g='rqponml' AND f GLOB 'klmno*')
OR f='lmnopqrst'
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR (g='rqponml' AND f GLOB 'klmno*')
OR f='lmnopqrst'
OR (g='nmlkjih' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE ((a BETWEEN 69 AND 71) AND a!=70)
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=652;
SELECT a FROM t3
WHERE ((a BETWEEN 69 AND 71) AND a!=70)
OR ((a BETWEEN 91 AND 93) AND a!=92)
OR b=652;
SELECT a FROM t2
WHERE b=1067
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR b=520
OR b=399
OR b=209
OR a=68
OR (g='fedcbaz' AND f GLOB 'qrstu*');
SELECT a FROM t3
WHERE b=1067
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR (g='jihgfed' AND f GLOB 'vwxyz*')
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR b=520
OR b=399
OR b=209
OR a=68
OR (g='fedcbaz' AND f GLOB 'qrstu*');
SELECT a FROM t2
WHERE (d>=79.0 AND d<80.0 AND d NOT NULL)
OR a=57
OR b=55
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR (g='rqponml' AND f GLOB 'lmnop*')
OR ((a BETWEEN 0 AND 2) AND a!=1)
OR ((a BETWEEN 21 AND 23) AND a!=22);
SELECT a FROM t3
WHERE (d>=79.0 AND d<80.0 AND d NOT NULL)
OR a=57
OR b=55
OR (d>=34.0 AND d<35.0 AND d NOT NULL)
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR (g='rqponml' AND f GLOB 'lmnop*')
OR ((a BETWEEN 0 AND 2) AND a!=1)
OR ((a BETWEEN 21 AND 23) AND a!=22);
SELECT a FROM t2
WHERE ((a BETWEEN 21 AND 23) AND a!=22)
OR a=2
OR b=784
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR b=850;
SELECT a FROM t3
WHERE ((a BETWEEN 21 AND 23) AND a!=22)
OR a=2
OR b=784
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (g='ihgfedc' AND f GLOB 'defgh*')
OR b=850;
SELECT a FROM t2
WHERE (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=748
OR b=209
OR a=100;
SELECT a FROM t3
WHERE (d>=51.0 AND d<52.0 AND d NOT NULL)
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=748
OR b=209
OR a=100;
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'zabcd*')
OR a=18
OR a=30
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR b=792
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR c=26026
OR (g='rqponml' AND f GLOB 'hijkl*');
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'zabcd*')
OR a=18
OR a=30
OR ((a BETWEEN 9 AND 11) AND a!=10)
OR ((a BETWEEN 84 AND 86) AND a!=85)
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR b=792
OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR c=26026
OR (g='rqponml' AND f GLOB 'hijkl*');
SELECT a FROM t2
WHERE (g='vutsrqp' AND f GLOB 'qrstu*')
OR b=968
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (d>=72.0 AND d<73.0 AND d NOT NULL)
OR a=78
OR ((a BETWEEN 90 AND 92) AND a!=91);
SELECT a FROM t3
WHERE (g='vutsrqp' AND f GLOB 'qrstu*')
OR b=968
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR (d>=72.0 AND d<73.0 AND d NOT NULL)
OR a=78
OR ((a BETWEEN 90 AND 92) AND a!=91);
SELECT a FROM t2
WHERE c=10010
OR f='pqrstuvwx';
SELECT a FROM t3
WHERE c=10010
OR f='pqrstuvwx';
SELECT a FROM t2
WHERE a=86
OR a=10
OR b=528
OR b=253
OR a=80
OR a=87
OR (d>=37.0 AND d<38.0 AND d NOT NULL);
SELECT a FROM t3
WHERE a=86
OR a=10
OR b=528
OR b=253
OR a=80
OR a=87
OR (d>=37.0 AND d<38.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=42.0 AND d<43.0 AND d NOT NULL)
OR b=825
OR a=100
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR a=60;
SELECT a FROM t3
WHERE (d>=42.0 AND d<43.0 AND d NOT NULL)
OR b=825
OR a=100
OR (d>=77.0 AND d<78.0 AND d NOT NULL)
OR a=60;
SELECT a FROM t2
WHERE (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=883
OR (d>=35.0 AND d<36.0 AND d NOT NULL)
OR (d>=3.0 AND d<4.0 AND d NOT NULL)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR a=81
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR f='mnopqrstu';
SELECT a FROM t3
WHERE (d>=94.0 AND d<95.0 AND d NOT NULL)
OR b=883
OR (d>=35.0 AND d<36.0 AND d NOT NULL)
OR (d>=3.0 AND d<4.0 AND d NOT NULL)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR a=81
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR f='mnopqrstu';
SELECT a FROM t2
WHERE b=443
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR b=663
OR b=905
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=883
OR c=22022
OR b=638;
SELECT a FROM t3
WHERE b=443
OR ((a BETWEEN 14 AND 16) AND a!=15)
OR b=663
OR b=905
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR b=883
OR c=22022
OR b=638;
SELECT a FROM t2
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR b=234
OR a=53
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR ((a BETWEEN 27 AND 29) AND a!=28)
OR b=319
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t3
WHERE ((a BETWEEN 84 AND 86) AND a!=85)
OR b=234
OR a=53
OR ((a BETWEEN 20 AND 22) AND a!=21)
OR ((a BETWEEN 27 AND 29) AND a!=28)
OR b=319
OR (g='qponmlk' AND f GLOB 'opqrs*')
OR ((a BETWEEN 14 AND 16) AND a!=15);
SELECT a FROM t2
WHERE b=179
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR a=46
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR a=25
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR f='opqrstuvw'
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR b=938;
SELECT a FROM t3
WHERE b=179
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR a=46
OR (g='kjihgfe' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 53 AND 55) AND a!=54)
OR a=25
OR (d>=5.0 AND d<6.0 AND d NOT NULL)
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR f='opqrstuvw'
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR b=938;
SELECT a FROM t2
WHERE (g='nmlkjih' AND f GLOB 'fghij*')
OR (d>=15.0 AND d<16.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='nmlkjih' AND f GLOB 'fghij*')
OR (d>=15.0 AND d<16.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=748
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR a=32
OR b=110
OR b=297
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR f='ghijklmno'
OR b=473
OR b=135;
SELECT a FROM t3
WHERE b=748
OR (g='utsrqpo' AND f GLOB 'wxyza*')
OR a=32
OR b=110
OR b=297
OR (d>=13.0 AND d<14.0 AND d NOT NULL)
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR f='ghijklmno'
OR b=473
OR b=135;
SELECT a FROM t2
WHERE (d>=33.0 AND d<34.0 AND d NOT NULL)
OR b=905
OR a=97
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR c=27027
OR f='bcdefghij'
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR (f GLOB '?fghi*' AND f GLOB 'efgh*');
SELECT a FROM t3
WHERE (d>=33.0 AND d<34.0 AND d NOT NULL)
OR b=905
OR a=97
OR (g='hgfedcb' AND f GLOB 'hijkl*')
OR c=27027
OR f='bcdefghij'
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR (d>=25.0 AND d<26.0 AND d NOT NULL)
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR (f GLOB '?fghi*' AND f GLOB 'efgh*');
SELECT a FROM t2
WHERE ((a BETWEEN 64 AND 66) AND a!=65)
OR ((a BETWEEN 90 AND 92) AND a!=91);
SELECT a FROM t3
WHERE ((a BETWEEN 64 AND 66) AND a!=65)
OR ((a BETWEEN 90 AND 92) AND a!=91);
SELECT a FROM t2
WHERE b=594
OR b=80
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR b=421
OR b=418
OR b=828
OR a=88
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR (d>=60.0 AND d<61.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=594
OR b=80
OR (g='tsrqpon' AND f GLOB 'bcdef*')
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR b=421
OR b=418
OR b=828
OR a=88
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR (d>=60.0 AND d<61.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR b=366
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR c=16016
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR c=9009;
SELECT a FROM t3
WHERE (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'xyzab*')
OR b=366
OR (d>=28.0 AND d<29.0 AND d NOT NULL)
OR c=16016
OR (g='edcbazy' AND f GLOB 'wxyza*')
OR c=9009;
SELECT a FROM t2
WHERE b=33
OR f='qrstuvwxy'
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR b=858;
SELECT a FROM t3
WHERE b=33
OR f='qrstuvwxy'
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR b=858;
SELECT a FROM t2
WHERE b=861
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR b=682
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR b=286;
SELECT a FROM t3
WHERE b=861
OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
OR (d>=29.0 AND d<30.0 AND d NOT NULL)
OR b=682
OR ((a BETWEEN 93 AND 95) AND a!=94)
OR b=286;
SELECT a FROM t2
WHERE b=740
OR ((a BETWEEN 27 AND 29) AND a!=28)
OR a=88;
SELECT a FROM t3
WHERE b=740
OR ((a BETWEEN 27 AND 29) AND a!=28)
OR a=88;
SELECT a FROM t2
WHERE f='abcdefghi'
OR c=9009
OR b=663
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR b=91;
SELECT a FROM t3
WHERE f='abcdefghi'
OR c=9009
OR b=663
OR (g='wvutsrq' AND f GLOB 'klmno*')
OR b=91;
SELECT a FROM t2
WHERE (g='kjihgfe' AND f GLOB 'qrstu*')
OR ((a BETWEEN 29 AND 31) AND a!=30)
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=1015
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR b=916
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR b=69
OR (g='hgfedcb' AND f GLOB 'fghij*');
SELECT a FROM t3
WHERE (g='kjihgfe' AND f GLOB 'qrstu*')
OR ((a BETWEEN 29 AND 31) AND a!=30)
OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
OR b=1015
OR (g='qponmlk' AND f GLOB 'qrstu*')
OR b=916
OR (d>=31.0 AND d<32.0 AND d NOT NULL)
OR b=69
OR (g='hgfedcb' AND f GLOB 'fghij*');
SELECT a FROM t2
WHERE a=88
OR a=1
OR f='uvwxyzabc'
OR b=498
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR a=63
OR f='mnopqrstu'
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR b=495
OR a=35
OR a=22;
SELECT a FROM t3
WHERE a=88
OR a=1
OR f='uvwxyzabc'
OR b=498
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR a=63
OR f='mnopqrstu'
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR b=495
OR a=35
OR a=22;
SELECT a FROM t2
WHERE b=869
OR (g='rqponml' AND f GLOB 'jklmn*')
OR b=289
OR a=62
OR ((a BETWEEN 9 AND 11) AND a!=10);
SELECT a FROM t3
WHERE b=869
OR (g='rqponml' AND f GLOB 'jklmn*')
OR b=289
OR a=62
OR ((a BETWEEN 9 AND 11) AND a!=10);
SELECT a FROM t2
WHERE ((a BETWEEN 22 AND 24) AND a!=23)
OR b=542
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR a=7
OR f='klmnopqrs';
SELECT a FROM t3
WHERE ((a BETWEEN 22 AND 24) AND a!=23)
OR b=542
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR a=7
OR f='klmnopqrs';
SELECT a FROM t2
WHERE ((a BETWEEN 57 AND 59) AND a!=58)
OR b=1078
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR b=429;
SELECT a FROM t3
WHERE ((a BETWEEN 57 AND 59) AND a!=58)
OR b=1078
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (g='mlkjihg' AND f GLOB 'ijklm*')
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR b=429;
SELECT a FROM t2
WHERE (d>=82.0 AND d<83.0 AND d NOT NULL)
OR b=264
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR b=1048
OR a=15;
SELECT a FROM t3
WHERE (d>=82.0 AND d<83.0 AND d NOT NULL)
OR b=264
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR b=1048
OR a=15;
SELECT a FROM t2
WHERE a=93
OR f='ijklmnopq'
OR f='mnopqrstu'
OR ((a BETWEEN 67 AND 69) AND a!=68);
SELECT a FROM t3
WHERE a=93
OR f='ijklmnopq'
OR f='mnopqrstu'
OR ((a BETWEEN 67 AND 69) AND a!=68);
SELECT a FROM t2
WHERE (d>=56.0 AND d<57.0 AND d NOT NULL)
OR b=858
OR a=58
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR c=21021
OR ((a BETWEEN 45 AND 47) AND a!=46)
OR b=616
OR b=784
OR b=55;
SELECT a FROM t3
WHERE (d>=56.0 AND d<57.0 AND d NOT NULL)
OR b=858
OR a=58
OR (g='onmlkji' AND f GLOB 'xyzab*')
OR c=21021
OR ((a BETWEEN 45 AND 47) AND a!=46)
OR b=616
OR b=784
OR b=55;
SELECT a FROM t2
WHERE b=682
OR b=99
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR b=531;
SELECT a FROM t3
WHERE b=682
OR b=99
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR b=531;
SELECT a FROM t2
WHERE ((a BETWEEN 56 AND 58) AND a!=57)
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR b=726
OR a=79
OR a=47
OR b=212
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR c=8008;
SELECT a FROM t3
WHERE ((a BETWEEN 56 AND 58) AND a!=57)
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
OR b=726
OR a=79
OR a=47
OR b=212
OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
OR c=8008;
SELECT a FROM t2
WHERE f='uvwxyzabc'
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR a=5
OR b=33
OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
OR a=59
OR b=44
OR (d>=14.0 AND d<15.0 AND d NOT NULL)
OR (d>=59.0 AND d<60.0 AND d NOT NULL);
SELECT a FROM t3
WHERE f='uvwxyzabc'
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR a=5
OR b=33
OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
OR a=59
OR b=44
OR (d>=14.0 AND d<15.0 AND d NOT NULL)
OR (d>=59.0 AND d<60.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=564
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR b=451
OR b=330
OR a=47
OR ((a BETWEEN 17 AND 19) AND a!=18);
SELECT a FROM t3
WHERE b=564
OR (d>=93.0 AND d<94.0 AND d NOT NULL)
OR b=451
OR b=330
OR a=47
OR ((a BETWEEN 17 AND 19) AND a!=18);
SELECT a FROM t2
WHERE a=40
OR b=333;
SELECT a FROM t3
WHERE a=40
OR b=333;
SELECT a FROM t2
WHERE b=924
OR ((a BETWEEN 6 AND 8) AND a!=7)
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR a=100
OR c=15015
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR (d>=2.0 AND d<3.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=924
OR ((a BETWEEN 6 AND 8) AND a!=7)
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR (d>=40.0 AND d<41.0 AND d NOT NULL)
OR a=100
OR c=15015
OR (d>=82.0 AND d<83.0 AND d NOT NULL)
OR (d>=2.0 AND d<3.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR (d>=36.0 AND d<37.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=63.0 AND d<64.0 AND d NOT NULL)
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR (d>=36.0 AND d<37.0 AND d NOT NULL);
SELECT a FROM t2
WHERE b=58
OR ((a BETWEEN 7 AND 9) AND a!=8)
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=31
OR f='tuvwxyzab'
OR b=341
OR b=47
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR a=49
OR b=223
OR f='qrstuvwxy';
SELECT a FROM t3
WHERE b=58
OR ((a BETWEEN 7 AND 9) AND a!=8)
OR ((a BETWEEN 63 AND 65) AND a!=64)
OR a=31
OR f='tuvwxyzab'
OR b=341
OR b=47
OR ((a BETWEEN 95 AND 97) AND a!=96)
OR a=49
OR b=223
OR f='qrstuvwxy';
SELECT a FROM t2
WHERE a=96
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR a=85
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR c=11011
OR b=641
OR f='vwxyzabcd'
OR b=286;
SELECT a FROM t3
WHERE a=96
OR (d>=23.0 AND d<24.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'vwxyz*')
OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
OR ((a BETWEEN 37 AND 39) AND a!=38)
OR a=85
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR c=11011
OR b=641
OR f='vwxyzabcd'
OR b=286;
SELECT a FROM t2
WHERE ((a BETWEEN 3 AND 5) AND a!=4)
OR b=1012
OR a=7
OR b=773
OR a=1
OR b=726
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR b=110;
SELECT a FROM t3
WHERE ((a BETWEEN 3 AND 5) AND a!=4)
OR b=1012
OR a=7
OR b=773
OR a=1
OR b=726
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR ((a BETWEEN 87 AND 89) AND a!=88)
OR b=110;
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'hijkl*')
OR a=60
OR a=4
OR b=520
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR a=44
OR a=36
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR b=715
OR (g='vutsrqp' AND f GLOB 'qrstu*');
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'hijkl*')
OR a=60
OR a=4
OR b=520
OR (g='ihgfedc' AND f GLOB 'bcdef*')
OR a=44
OR a=36
OR (d>=76.0 AND d<77.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR b=715
OR (g='vutsrqp' AND f GLOB 'qrstu*');
SELECT a FROM t2
WHERE ((a BETWEEN 3 AND 5) AND a!=4)
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR a=24
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR (f GLOB '?bcde*' AND f GLOB 'abcd*');
SELECT a FROM t3
WHERE ((a BETWEEN 3 AND 5) AND a!=4)
OR ((a BETWEEN 56 AND 58) AND a!=57)
OR (d>=15.0 AND d<16.0 AND d NOT NULL)
OR (d>=55.0 AND d<56.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'yzabc*')
OR a=24
OR (d>=99.0 AND d<100.0 AND d NOT NULL)
OR (f GLOB '?bcde*' AND f GLOB 'abcd*');
SELECT a FROM t2
WHERE (g='utsrqpo' AND f GLOB 'vwxyz*')
OR b=132
OR f='ghijklmno'
OR b=740
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=1059;
SELECT a FROM t3
WHERE (g='utsrqpo' AND f GLOB 'vwxyz*')
OR b=132
OR f='ghijklmno'
OR b=740
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=1059;
SELECT a FROM t2
WHERE a=28
OR b=927
OR b=520
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR b=638
OR f='vwxyzabcd';
SELECT a FROM t3
WHERE a=28
OR b=927
OR b=520
OR (d>=53.0 AND d<54.0 AND d NOT NULL)
OR b=638
OR f='vwxyzabcd';
SELECT a FROM t2
WHERE (g='nmlkjih' AND f GLOB 'cdefg*')
OR b=1026
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'lmnop*')
OR b=355
OR b=641
OR (d>=53.0 AND d<54.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='nmlkjih' AND f GLOB 'cdefg*')
OR b=1026
OR (d>=1.0 AND d<2.0 AND d NOT NULL)
OR (g='wvutsrq' AND f GLOB 'lmnop*')
OR b=355
OR b=641
OR (d>=53.0 AND d<54.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 46 AND 48) AND a!=47)
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR b=641
OR a=3
OR a=35
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR f='opqrstuvw'
OR a=41
OR a=83
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR b=751;
SELECT a FROM t3
WHERE ((a BETWEEN 46 AND 48) AND a!=47)
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR b=641
OR a=3
OR a=35
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR f='opqrstuvw'
OR a=41
OR a=83
OR (g='nmlkjih' AND f GLOB 'cdefg*')
OR b=751;
SELECT a FROM t2
WHERE ((a BETWEEN 3 AND 5) AND a!=4)
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR c=15015
OR b=146
OR b=1092
OR (d>=60.0 AND d<61.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 3 AND 5) AND a!=4)
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR c=15015
OR b=146
OR b=1092
OR (d>=60.0 AND d<61.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'qrstu*')
OR f='bcdefghij'
OR f='hijklmnop'
OR a=65
OR f='ijklmnopq'
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR g IS NULL
OR a=26
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR a=9
OR (d>=32.0 AND d<33.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'qrstu*')
OR f='bcdefghij'
OR f='hijklmnop'
OR a=65
OR f='ijklmnopq'
OR (d>=79.0 AND d<80.0 AND d NOT NULL)
OR g IS NULL
OR a=26
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR a=9
OR (d>=32.0 AND d<33.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (g='jihgfed' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR b=1100
OR c=6006
OR c=4004
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR c=33033;
SELECT a FROM t3
WHERE (g='jihgfed' AND f GLOB 'vwxyz*')
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR ((a BETWEEN 79 AND 81) AND a!=80)
OR (g='kjihgfe' AND f GLOB 'stuvw*')
OR (g='qponmlk' AND f GLOB 'pqrst*')
OR b=1100
OR c=6006
OR c=4004
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR c=33033;
SELECT a FROM t2
WHERE a=17
OR ((a BETWEEN 95 AND 97) AND a!=96);
SELECT a FROM t3
WHERE a=17
OR ((a BETWEEN 95 AND 97) AND a!=96);
SELECT a FROM t2
WHERE c=3003
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR a=93;
SELECT a FROM t3
WHERE c=3003
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR a=93;
SELECT a FROM t2
WHERE (d>=42.0 AND d<43.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=737;
SELECT a FROM t3
WHERE (d>=42.0 AND d<43.0 AND d NOT NULL)
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR ((a BETWEEN 21 AND 23) AND a!=22)
OR (d>=12.0 AND d<13.0 AND d NOT NULL)
OR b=737;
SELECT a FROM t2
WHERE (g='rqponml' AND f GLOB 'klmno*')
OR ((a BETWEEN 5 AND 7) AND a!=6);
SELECT a FROM t3
WHERE (g='rqponml' AND f GLOB 'klmno*')
OR ((a BETWEEN 5 AND 7) AND a!=6);
SELECT a FROM t2
WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
OR c=32032
OR f='opqrstuvw'
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR b=993;
SELECT a FROM t3
WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
OR c=32032
OR f='opqrstuvw'
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR ((a BETWEEN 49 AND 51) AND a!=50)
OR b=993;
SELECT a FROM t2
WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR b=245
OR b=528
OR b=366
OR a=73
OR a=49
OR b=421
OR a=58;
SELECT a FROM t3
WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
OR ((a BETWEEN 59 AND 61) AND a!=60)
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR b=245
OR b=528
OR b=366
OR a=73
OR a=49
OR b=421
OR a=58;
SELECT a FROM t2
WHERE (d>=100.0 AND d<101.0 AND d NOT NULL)
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR b=146
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR ((a BETWEEN 73 AND 75) AND a!=74)
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR b=704;
SELECT a FROM t3
WHERE (d>=100.0 AND d<101.0 AND d NOT NULL)
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR ((a BETWEEN 86 AND 88) AND a!=87)
OR b=146
OR (g='ponmlkj' AND f GLOB 'rstuv*')
OR ((a BETWEEN 73 AND 75) AND a!=74)
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR ((a BETWEEN 60 AND 62) AND a!=61)
OR (g='ihgfedc' AND f GLOB 'efghi*')
OR b=704;
SELECT a FROM t2
WHERE ((a BETWEEN 65 AND 67) AND a!=66)
OR b=14
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR a=49
OR b=333;
SELECT a FROM t3
WHERE ((a BETWEEN 65 AND 67) AND a!=66)
OR b=14
OR ((a BETWEEN 3 AND 5) AND a!=4)
OR a=49
OR b=333;
SELECT a FROM t2
WHERE c=17017
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR b=971
OR a=37
OR a=7
OR b=641
OR a=13
OR b=597;
SELECT a FROM t3
WHERE c=17017
OR (g='qponmlk' AND f GLOB 'mnopq*')
OR b=971
OR a=37
OR a=7
OR b=641
OR a=13
OR b=597;
SELECT a FROM t2
WHERE f='tuvwxyzab'
OR (f GLOB '?stuv*' AND f GLOB 'rstu*');
SELECT a FROM t3
WHERE f='tuvwxyzab'
OR (f GLOB '?stuv*' AND f GLOB 'rstu*');
SELECT a FROM t2
WHERE b=638
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR b=165
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR f='stuvwxyza'
OR b=652
OR b=66
OR b=770
OR b=91;
SELECT a FROM t3
WHERE b=638
OR (d>=44.0 AND d<45.0 AND d NOT NULL)
OR (g='gfedcba' AND f GLOB 'lmnop*')
OR b=165
OR ((a BETWEEN 10 AND 12) AND a!=11)
OR f='stuvwxyza'
OR b=652
OR b=66
OR b=770
OR b=91;
SELECT a FROM t2
WHERE (d>=52.0 AND d<53.0 AND d NOT NULL)
OR f='opqrstuvw'
OR a=83
OR a=93
OR b=858
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'vwxyz*');
SELECT a FROM t3
WHERE (d>=52.0 AND d<53.0 AND d NOT NULL)
OR f='opqrstuvw'
OR a=83
OR a=93
OR b=858
OR (d>=18.0 AND d<19.0 AND d NOT NULL)
OR (g='jihgfed' AND f GLOB 'vwxyz*');
SELECT a FROM t2
WHERE c=3003
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR a=38;
SELECT a FROM t3
WHERE c=3003
OR ((a BETWEEN 40 AND 42) AND a!=41)
OR a=38;
SELECT a FROM t2
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR ((a BETWEEN 50 AND 52) AND a!=51);
SELECT a FROM t3
WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
OR ((a BETWEEN 50 AND 52) AND a!=51);
SELECT a FROM t2
WHERE (g='qponmlk' AND f GLOB 'mnopq*')
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR a=5
OR b=396
OR a=13;
SELECT a FROM t3
WHERE (g='qponmlk' AND f GLOB 'mnopq*')
OR ((a BETWEEN 24 AND 26) AND a!=25)
OR a=5
OR b=396
OR a=13;
SELECT a FROM t2
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=748
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR b=531
OR b=1092
OR b=418;
SELECT a FROM t3
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR b=748
OR (d>=97.0 AND d<98.0 AND d NOT NULL)
OR ((a BETWEEN 69 AND 71) AND a!=70)
OR b=531
OR b=1092
OR b=418;
SELECT a FROM t2
WHERE (d>=30.0 AND d<31.0 AND d NOT NULL)
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR a=50
OR a=46
OR ((a BETWEEN 38 AND 40) AND a!=39);
SELECT a FROM t3
WHERE (d>=30.0 AND d<31.0 AND d NOT NULL)
OR ((a BETWEEN 8 AND 10) AND a!=9)
OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
OR a=50
OR a=46
OR ((a BETWEEN 38 AND 40) AND a!=39);
SELECT a FROM t2
WHERE a=24
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR b=487
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR b=132
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR b=795
OR b=737;
SELECT a FROM t3
WHERE a=24
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR b=487
OR (d>=96.0 AND d<97.0 AND d NOT NULL)
OR ((a BETWEEN 13 AND 15) AND a!=14)
OR b=132
OR (d>=54.0 AND d<55.0 AND d NOT NULL)
OR b=795
OR b=737;
SELECT a FROM t2
WHERE (d>=88.0 AND d<89.0 AND d NOT NULL)
OR a=34
OR c=16016
OR b=1078
OR b=960
OR (g='hgfedcb' AND f GLOB 'jklmn*');
SELECT a FROM t3
WHERE (d>=88.0 AND d<89.0 AND d NOT NULL)
OR a=34
OR c=16016
OR b=1078
OR b=960
OR (g='hgfedcb' AND f GLOB 'jklmn*');
SELECT a FROM t2
WHERE b=1081
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 73 AND 75) AND a!=74)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR a=6;
SELECT a FROM t3
WHERE b=1081
OR ((a BETWEEN 19 AND 21) AND a!=20)
OR (g='ponmlkj' AND f GLOB 'tuvwx*')
OR ((a BETWEEN 73 AND 75) AND a!=74)
OR (d>=38.0 AND d<39.0 AND d NOT NULL)
OR a=6;
SELECT a FROM t2
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR (g='rqponml' AND f GLOB 'lmnop*')
OR a=92
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR f='fghijklmn'
OR a=100
OR b=209
OR c=9009
OR ((a BETWEEN 52 AND 54) AND a!=53)
OR a=73
OR b=902;
SELECT a FROM t3
WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
OR (g='rqponml' AND f GLOB 'lmnop*')
OR a=92
OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
OR f='fghijklmn'
OR a=100
OR b=209
OR c=9009
OR ((a BETWEEN 52 AND 54) AND a!=53)
OR a=73
OR b=902;
SELECT a FROM t2
WHERE (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=110
OR f='ghijklmno'
OR (d>=21.0 AND d<22.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=40.0 AND d<41.0 AND d NOT NULL)
OR b=110
OR f='ghijklmno'
OR (d>=21.0 AND d<22.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 51 AND 53) AND a!=52)
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR b=91
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=77
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR (g='vutsrqp' AND f GLOB 'pqrst*');
SELECT a FROM t3
WHERE ((a BETWEEN 51 AND 53) AND a!=52)
OR (g='utsrqpo' AND f GLOB 'uvwxy*')
OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR b=91
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR b=77
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR (g='vutsrqp' AND f GLOB 'pqrst*');
SELECT a FROM t2
WHERE (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR b=693
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR a=52
OR b=377;
SELECT a FROM t3
WHERE (d>=56.0 AND d<57.0 AND d NOT NULL)
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR b=693
OR (d>=21.0 AND d<22.0 AND d NOT NULL)
OR (d>=26.0 AND d<27.0 AND d NOT NULL)
OR (d>=42.0 AND d<43.0 AND d NOT NULL)
OR a=52
OR b=377;
SELECT a FROM t2
WHERE a=99
OR a=36
OR b=297
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=1004
OR b=872
OR a=95
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR b=176
OR b=300;
SELECT a FROM t3
WHERE a=99
OR a=36
OR b=297
OR ((a BETWEEN 66 AND 68) AND a!=67)
OR b=1004
OR b=872
OR a=95
OR (d>=27.0 AND d<28.0 AND d NOT NULL)
OR b=176
OR b=300;
SELECT a FROM t2
WHERE b=737
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR a=40
OR f='uvwxyzabc'
OR b=311
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=927
OR (d>=50.0 AND d<51.0 AND d NOT NULL);
SELECT a FROM t3
WHERE b=737
OR (g='wvutsrq' AND f GLOB 'ijklm*')
OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
OR a=40
OR f='uvwxyzabc'
OR b=311
OR (g='nmlkjih' AND f GLOB 'bcdef*')
OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
OR b=927
OR (d>=50.0 AND d<51.0 AND d NOT NULL);
SELECT a FROM t2
WHERE f='fghijklmn'
OR b=1078
OR (d>=35.0 AND d<36.0 AND d NOT NULL)
OR f='fghijklmn';
SELECT a FROM t3
WHERE f='fghijklmn'
OR b=1078
OR (d>=35.0 AND d<36.0 AND d NOT NULL)
OR f='fghijklmn';
SELECT a FROM t2
WHERE (g='xwvutsr' AND f GLOB 'ghijk*')
OR b=487
OR f='tuvwxyzab'
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR b=971
OR c=19019
OR a=39
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR b=550
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=660;
SELECT a FROM t3
WHERE (g='xwvutsr' AND f GLOB 'ghijk*')
OR b=487
OR f='tuvwxyzab'
OR (g='onmlkji' AND f GLOB 'wxyza*')
OR b=971
OR c=19019
OR a=39
OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
OR b=550
OR (g='kjihgfe' AND f GLOB 'tuvwx*')
OR b=660;
SELECT a FROM t2
WHERE b=80
OR b=839;
SELECT a FROM t3
WHERE b=80
OR b=839;
SELECT a FROM t2
WHERE b=363
OR b=630
OR b=935
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'defgh*')
OR f='yzabcdefg'
OR ((a BETWEEN 37 AND 39) AND a!=38);
SELECT a FROM t3
WHERE b=363
OR b=630
OR b=935
OR (d>=20.0 AND d<21.0 AND d NOT NULL)
OR (g='srqponm' AND f GLOB 'defgh*')
OR f='yzabcdefg'
OR ((a BETWEEN 37 AND 39) AND a!=38);
SELECT a FROM t2
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR a=40
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR f='abcdefghi'
OR b=696
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR b=682
OR a=32
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR b=671
OR a=15;
SELECT a FROM t3
WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
OR a=40
OR (d>=86.0 AND d<87.0 AND d NOT NULL)
OR f='abcdefghi'
OR b=696
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR b=682
OR a=32
OR ((a BETWEEN 34 AND 36) AND a!=35)
OR b=671
OR a=15;
SELECT a FROM t2
WHERE (g='gfedcba' AND f GLOB 'lmnop*')
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR b=311;
SELECT a FROM t3
WHERE (g='gfedcba' AND f GLOB 'lmnop*')
OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
OR b=311;
SELECT a FROM t2
WHERE (d>=96.0 AND d<97.0 AND d NOT NULL)
OR a=73
OR b=729
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR a=32;
SELECT a FROM t3
WHERE (d>=96.0 AND d<97.0 AND d NOT NULL)
OR a=73
OR b=729
OR (d>=81.0 AND d<82.0 AND d NOT NULL)
OR (d>=67.0 AND d<68.0 AND d NOT NULL)
OR a=32;
SELECT a FROM t2
WHERE ((a BETWEEN 98 AND 100) AND a!=99)
OR b=110
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR b=484
OR (d>=82.0 AND d<83.0 AND d NOT NULL);
SELECT a FROM t3
WHERE ((a BETWEEN 98 AND 100) AND a!=99)
OR b=110
OR ((a BETWEEN 38 AND 40) AND a!=39)
OR (g='tsrqpon' AND f GLOB 'xyzab*')
OR b=484
OR (d>=82.0 AND d<83.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=99.0 AND d<100.0 AND d NOT NULL)
OR b=135
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=209
OR b=363
OR c=27027
OR b=1026
OR c=6006
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR (d>=73.0 AND d<74.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=99.0 AND d<100.0 AND d NOT NULL)
OR b=135
OR (d>=66.0 AND d<67.0 AND d NOT NULL)
OR b=209
OR b=363
OR c=27027
OR b=1026
OR c=6006
OR (g='ponmlkj' AND f GLOB 'uvwxy*')
OR (d>=73.0 AND d<74.0 AND d NOT NULL);
SELECT a FROM t2
WHERE (d>=79.0 AND d<80.0 AND d NOT NULL)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR a=97
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR b=674
OR c=14014
OR b=69;
SELECT a FROM t3
WHERE (d>=79.0 AND d<80.0 AND d NOT NULL)
OR ((a BETWEEN 18 AND 20) AND a!=19)
OR (g='qponmlk' AND f GLOB 'nopqr*')
OR a=97
OR (d>=45.0 AND d<46.0 AND d NOT NULL)
OR ((a BETWEEN 22 AND 24) AND a!=23)
OR (g='mlkjihg' AND f GLOB 'ghijk*')
OR b=674
OR c=14014
OR b=69;
SELECT a FROM t2
WHERE b=297
OR a=83
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR ((a BETWEEN 16 AND 18) AND a!=17);
SELECT a FROM t3
WHERE b=297
OR a=83
OR (d>=78.0 AND d<79.0 AND d NOT NULL)
OR ((a BETWEEN 16 AND 18) AND a!=17);
SELECT a FROM t2
WHERE b=451
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=539
OR a=26
OR (g='srqponm' AND f GLOB 'efghi*')
OR b=465
OR (g='jihgfed' AND f GLOB 'wxyza*');
SELECT a FROM t3
WHERE b=451
OR ((a BETWEEN 11 AND 13) AND a!=12)
OR (g='tsrqpon' AND f GLOB 'abcde*')
OR b=539
OR a=26
OR (g='srqponm' AND f GLOB 'efghi*')
OR b=465
OR (g='jihgfed' AND f GLOB 'wxyza*');
SELECT a FROM t2
WHERE (d>=45.0 AND d<46.0 AND d NOT NULL)
OR (d>=63.0 AND d<64.0 AND d NOT NULL);
SELECT a FROM t3
WHERE (d>=45.0 AND d<46.0 AND d NOT NULL)
OR (d>=63.0 AND d<64.0 AND d NOT NULL);
SELECT a FROM t2
WHERE ((a BETWEEN 16 AND 18) AND a!=17)
OR b=872
OR c=31031;
SELECT a FROM t3
WHERE ((a BETWEEN 16 AND 18) AND a!=17)
OR b=872
OR c=31031;
SELECT a FROM t2
WHERE (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR a=13
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR b=322
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR b=377
OR f='cdefghijk'
OR b=286
OR ((a BETWEEN 61 AND 63) AND a!=62);
SELECT a FROM t3
WHERE (f GLOB '?cdef*' AND f GLOB 'bcde*')
OR a=13
OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
OR b=322
OR ((a BETWEEN 33 AND 35) AND a!=34)
OR b=377
OR f='cdefghijk'
OR b=286
OR ((a BETWEEN 61 AND 63) AND a!=62);
SELECT a FROM t2
WHERE a=41
OR b=990
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR b=605
OR (g='srqponm' AND f GLOB 'cdefg*')
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR b=968
OR a=66;
SELECT a FROM t3
WHERE a=41
OR b=990
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR b=605
OR (g='srqponm' AND f GLOB 'cdefg*')
OR (d>=36.0 AND d<37.0 AND d NOT NULL)
OR (g='vutsrqp' AND f GLOB 'qrstu*')
OR b=968
OR a=66;
SELECT a FROM t2
WHERE b=1059
OR (g='srqponm' AND f GLOB 'ghijk*')
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR (g='onmlkji' AND f GLOB 'abcde*')
OR ((a BETWEEN 39 AND 41) AND a!=40);
SELECT a FROM t3
WHERE b=1059
OR (g='srqponm' AND f GLOB 'ghijk*')
OR (g='utsrqpo' AND f GLOB 'tuvwx*')
OR (g='nmlkjih' AND f GLOB 'fghij*')
OR (d>=17.0 AND d<18.0 AND d NOT NULL)
OR (d>=37.0 AND d<38.0 AND d NOT NULL)
OR (g='onmlkji' AND f GLOB 'abcde*')
OR ((a BETWEEN 39 AND 41) AND a!=40);
SELECT a FROM t2
WHERE ((a BETWEEN 41 AND 43) AND a!=42)
OR f='nopqrstuv'
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR a=42
OR b=729
OR b=297
OR a=77
OR b=781
OR ((a BETWEEN 36 AND 38) AND a!=37);
SELECT a FROM t3
WHERE ((a BETWEEN 41 AND 43) AND a!=42)
OR f='nopqrstuv'
OR (g='ponmlkj' AND f GLOB 'stuvw*')
OR a=42
OR b=729
OR b=297
OR a=77
OR b=781
OR ((a BETWEEN 36 AND 38) AND a!=37);
SELECT a FROM t2
WHERE a=12
OR f='qrstuvwxy'
OR a=47
OR b=135
OR a=25;
SELECT a FROM t3
WHERE a=12
OR f='qrstuvwxy'
OR a=47
OR b=135
OR a=25;
SELECT a FROM t2
WHERE b=451
OR b=660
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR b=781
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR b=198
OR b=1023
OR a=98
OR d<0.0
OR ((a BETWEEN 79 AND 81) AND a!=80);
SELECT a FROM t3
WHERE b=451
OR b=660
OR (g='onmlkji' AND f GLOB 'yzabc*')
OR b=781
OR (g='jihgfed' AND f GLOB 'wxyza*')
OR b=198
OR b=1023
OR a=98
OR d<0.0
OR ((a BETWEEN 79 AND 81) AND a!=80);
SELECT a FROM t2
WHERE b=685
OR a=86
OR c=17017
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR a=80
OR b=773;
SELECT a FROM t3
WHERE b=685
OR a=86
OR c=17017
OR ((a BETWEEN 85 AND 87) AND a!=86)
OR (g='gfedcba' AND f GLOB 'mnopq*')
OR a=80
OR b=773;
SELECT a FROM t2
WHERE b=1092
OR a=23
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR d<0.0
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR a=91;
SELECT a FROM t3
WHERE b=1092
OR a=23
OR (f GLOB '?defg*' AND f GLOB 'cdef*')
OR d<0.0
OR (d>=22.0 AND d<23.0 AND d NOT NULL)
OR a=91;
CREATE TABLE t301 (;
FOREIGN KEY (c4) REFERENCES series(c4);
CREATE INDEX t301_c6 on t301(c6);
CREATE INDEX t301_c4 on t301(c4);
CREATE INDEX t301_c7 on t301(c7);
CREATE TABLE t302 (;
FOREIGN KEY (c8) REFERENCES t301(c8);
CREATE INDEX t302_c3 on t302(c3);
CREATE INDEX t302_c8_c3 on t302(c8, c3);
CREATE INDEX t302_c5 on t302(c5);
EXPLAIN QUERY PLAN
SELECT t302.c1
FROM t302 JOIN t301 ON t302.c8 = +t301.c8
WHERE t302.c2 = 19571
AND t302.c3 > 1287603136
AND (t301.c4 = 1407449685622784
OR t301.c8 = 1407424651264000)
ORDER BY t302.c5 LIMIT 200;
