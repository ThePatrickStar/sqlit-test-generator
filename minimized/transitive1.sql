CREATE TABLE t1(a TEXT, b TEXT, c TEXT COLLATE NOCASE);
INSERT INTO t1 VALUES('abc','abc','Abc');
INSERT INTO t1 VALUES('def','def','def');
INSERT INTO t1 VALUES('ghi','ghi','GHI');
CREATE INDEX t1a1 ON t1(a);
CREATE INDEX t1a2 ON t1(a COLLATE nocase);
SELECT * FROM t1 WHERE a=b AND c=b AND c='DEF';
SELECT * FROM t1 WHERE a=b AND c=b AND c>='DEF' ORDER BY +a;
SELECT * FROM t1 WHERE a=b AND c=b AND c<='DEF' ORDER BY +a;
CREATE TABLE t2(a INTEGER, b INTEGER, c TEXT);
INSERT INTO t2 VALUES(100,100,100);
INSERT INTO t2 VALUES(20,20,20);
INSERT INTO t2 VALUES(3,3,3);
SELECT * FROM t2 WHERE a=b AND c=b AND c=20;
SELECT * FROM t2 WHERE a=b AND c=b AND c>=20 ORDER BY +a;
SELECT * FROM t2 WHERE a=b AND c=b AND c<=20 ORDER BY +a;
CREATE TABLE t301(w INTEGER PRIMARY KEY, x);
CREATE TABLE t302(y INTEGER UNIQUE, z);
INSERT INTO t301 VALUES(1,2),(3,4),(5,6);
INSERT INTO t302 VALUES(1,3),(3,6),(5,7);
SELECT *
FROM t301 CROSS JOIN t302
WHERE w=y AND y IS NOT NULL
ORDER BY +w;
SELECT *
FROM t301 CROSS JOIN t302
WHERE w=y AND y IS NOT NULL
ORDER BY w;
SELECT *
FROM t301 CROSS JOIN t302
WHERE w IS y AND y IS NOT NULL
ORDER BY w;
SELECT *
FROM t301 CROSS JOIN t302 ON w=y
WHERE y>1
ORDER BY +w;
SELECT *
FROM t301 CROSS JOIN t302 ON w=y
WHERE y>1
ORDER BY w;
SELECT *
FROM t301 CROSS JOIN t302 ON w=y
WHERE y>1
ORDER BY w DESC;
SELECT *
FROM t301 CROSS JOIN t302 ON w=y
WHERE y BETWEEN 2 AND 4;
SELECT *
FROM t301 CROSS JOIN t302 ON w=y
WHERE y BETWEEN 1 AND 4
ORDER BY w;
SELECT *
FROM t301 CROSS JOIN t302 ON w=y
WHERE y BETWEEN 1 AND 4
ORDER BY w DESC;
CREATE TABLE t401(a);
CREATE TABLE t402(b);
CREATE TABLE t403(c INTEGER PRIMARY KEY);
INSERT INTO t401 VALUES(1);
INSERT INTO t403 VALUES(1);
SELECT '1-row' FROM t401 LEFT JOIN t402 ON b=a JOIN t403 ON c=a;
SELECT '1-row' FROM t401 LEFT JOIN t402 ON b IS a JOIN t403 ON c=a;
SELECT '1-row' FROM t401 LEFT JOIN t402 ON b=a JOIN t403 ON c IS a;
SELECT '1-row' FROM t401 LEFT JOIN t402 ON b IS a JOIN t403 ON c IS a;
CREATE TABLE bookmark ( idBookmark integer primary key, idFile integer, timeInSeconds double, totalTimeInSeconds double, thumbNailImage text, player text, playerState text, type integer);
CREATE TABLE path ( idPath integer primary key, strPath text, strContent text, strScraper text, strHash text, scanRecursive integer, useFolderNames bool, strSettings text, noUpdate bool, exclude bool, dateAdded text);
INSERT INTO "path" VALUES(1,'/tmp/tvshows/','tvshows','metadata.tvdb.com','989B1CE5680A14F5F86123F751169B49',0,0,'<settings><setting id="absolutenumber" value="false" /><setting id="dvdorder" value="false" /><setting id="fanart" value="true" /><setting id="language" value="en" /></settings>',0,0,NULL);
INSERT INTO "path" VALUES(2,'/tmp/tvshows/The.Big.Bang.Theory/','','','85E1DAAB2F5FF6EAE8AEDF1B5C882D1E',NULL,NULL,NULL,NULL,NULL,'2013-10-23 18:58:43');
CREATE TABLE files ( idFile integer primary key, idPath integer, strFilename text, playCount integer, lastPlayed text, dateAdded text);
INSERT INTO "files" VALUES(1,2,'The.Big.Bang.Theory.S01E01.WEB-DL.AAC2.0.H264.mkv',NULL,NULL,'2013-10-23 18:57:36');
CREATE TABLE tvshow ( idShow integer primary key,c00 text,c01 text,c02 text,c03 text,c04 text,c05 text,c06 text,c07 text,c08 text,c09 text,c10 text,c11 text,c12 text,c13 text,c14 text,c15 text,c16 text,c17 text,c18 text,c19 text,c20 text,c21 text,c22 text,c23 text);
INSERT INTO "tvshow" VALUES(1,'The Big Bang Theory','Leonard Hofstadter and Sheldon Cooper are brilliant physicists, the kind of "beautiful minds" that understand how the universe works. But none of that genius helps them interact with people, especially women. All this begins to change when a free-spirited beauty named Penny moves in next door. Sheldon, Leonard''s roommate, is quite content spending his nights playing Klingon Boggle with their socially dysfunctional friends, fellow CalTech scientists Howard Wolowitz and Raj Koothrappali. However, Leonard sees in Penny a whole new universe of possibilities... including love.','','','9.200000','2007-09-24','<thumb aspect="banner">http://thetvdb.com/banners/graphical/80379-g13.jpg</thumb><thumb aspect="banner">http://thetvdb.com/banners/graphical/80379-g23.jpg</thumb><thumb aspect="banner">http://thetvdb.com/banners/graphical/80379-g18.jpg</thumb><thumb aspect="banner">http://thetvdb.com/banners/graphical/80379-g17.jpg</thumb><thumb aspect="banner">http://;
CREATE TABLE episode ( idEpisode integer primary key, idFile integer,c00 text,c01 text,c02 text,c03 text,c04 text,c05 text,c06 text,c07 text,c08 text,c09 text,c10 text,c11 text,c12 varchar(24),c13 varchar(24),c14 text,c15 text,c16 text,c17 varchar(24),c18 text,c19 text,c20 text,c21 text,c22 text,c23 text, idShow integer);
INSERT INTO "episode" VALUES(1,1,'Pilot','Brilliant physicist roommates Leonard and Sheldon meet their new neighbor Penny, who begins showing them that as much as they know about science, they know little about actual living.','','7.700000','Chuck Lorre / Bill Prady','2007-09-24','<thumb>http://thetvdb.com/banners/episodes/80379/332484.jpg</thumb>','',NULL,'1800','James Burrows','','1','1','','-1','-1','-1','/tmp/tvshows/The.Big.Bang.Theory/The.Big.Bang.Theory.S01E01.WEB-DL.AAC2.0.H264.mkv','2','332484',NULL,NULL,NULL,1);
CREATE TABLE tvshowlinkpath (idShow integer, idPath integer);
INSERT INTO "tvshowlinkpath" VALUES(1,2);
CREATE TABLE seasons ( idSeason integer primary key, idShow integer, season integer);
INSERT INTO "seasons" VALUES(1,1,-1);
INSERT INTO "seasons" VALUES(2,1,0);
INSERT INTO "seasons" VALUES(3,1,1);
INSERT INTO "seasons" VALUES(4,1,2);
INSERT INTO "seasons" VALUES(5,1,3);
INSERT INTO "seasons" VALUES(6,1,4);
INSERT INTO "seasons" VALUES(7,1,5);
INSERT INTO "seasons" VALUES(8,1,6);
INSERT INTO "seasons" VALUES(9,1,7);
CREATE TABLE art(art_id INTEGER PRIMARY KEY, media_id INTEGER, media_type TEXT, type TEXT, url TEXT);
INSERT INTO "art" VALUES(1,1,'actor','thumb','http://thetvdb.com/banners/actors/73597.jpg');
INSERT INTO "art" VALUES(2,2,'actor','thumb','http://thetvdb.com/banners/actors/73596.jpg');
INSERT INTO "art" VALUES(3,3,'actor','thumb','http://thetvdb.com/banners/actors/73595.jpg');
INSERT INTO "art" VALUES(4,4,'actor','thumb','http://thetvdb.com/banners/actors/73599.jpg');
INSERT INTO "art" VALUES(5,5,'actor','thumb','http://thetvdb.com/banners/actors/73598.jpg');
INSERT INTO "art" VALUES(6,6,'actor','thumb','http://thetvdb.com/banners/actors/283158.jpg');
INSERT INTO "art" VALUES(7,7,'actor','thumb','http://thetvdb.com/banners/actors/283157.jpg');
INSERT INTO "art" VALUES(8,8,'actor','thumb','http://thetvdb.com/banners/actors/91271.jpg');
INSERT INTO "art" VALUES(9,9,'actor','thumb','http://thetvdb.com/banners/actors/294178.jpg');
INSERT INTO "art" VALUES(10,10,'actor','thumb','http://thetvdb.com/banners/actors/283159.jpg');
INSERT INTO "art" VALUES(11,1,'tvshow','banner','http://thetvdb.com/banners/graphical/80379-g13.jpg');
INSERT INTO "art" VALUES(12,1,'tvshow','fanart','http://thetvdb.com/banners/fanart/original/80379-2.jpg');
INSERT INTO "art" VALUES(13,1,'tvshow','poster','http://thetvdb.com/banners/posters/80379-22.jpg');
INSERT INTO "art" VALUES(14,1,'season','poster','http://thetvdb.com/banners/posters/80379-22.jpg');
INSERT INTO "art" VALUES(15,2,'season','banner','http://thetvdb.com/banners/seasonswide/80379-0.jpg');
INSERT INTO "art" VALUES(16,2,'season','poster','http://thetvdb.com/banners/seasons/80379-0-4.jpg');
INSERT INTO "art" VALUES(17,3,'season','banner','http://thetvdb.com/banners/seasonswide/80379-1-2.jpg');
INSERT INTO "art" VALUES(18,3,'season','poster','http://thetvdb.com/banners/seasons/80379-1-12.jpg');
INSERT INTO "art" VALUES(19,4,'season','banner','http://thetvdb.com/banners/seasonswide/80379-2-2.jpg');
INSERT INTO "art" VALUES(20,4,'season','poster','http://thetvdb.com/banners/seasons/80379-2-11.jpg');
INSERT INTO "art" VALUES(21,5,'season','banner','http://thetvdb.com/banners/seasonswide/80379-3-2.jpg');
INSERT INTO "art" VALUES(22,5,'season','poster','http://thetvdb.com/banners/seasons/80379-3-9.jpg');
INSERT INTO "art" VALUES(23,6,'season','banner','http://thetvdb.com/banners/seasonswide/80379-4-2.jpg');
INSERT INTO "art" VALUES(24,6,'season','poster','http://thetvdb.com/banners/seasons/80379-4-8.jpg');
INSERT INTO "art" VALUES(25,7,'season','banner','http://thetvdb.com/banners/seasonswide/80379-5.jpg');
INSERT INTO "art" VALUES(26,7,'season','poster','http://thetvdb.com/banners/seasons/80379-5-9.jpg');
INSERT INTO "art" VALUES(27,8,'season','poster','http://thetvdb.com/banners/seasons/80379-6-8.jpg');
INSERT INTO "art" VALUES(28,9,'season','poster','http://thetvdb.com/banners/seasons/80379-7-3.jpg');
INSERT INTO "art" VALUES(29,1,'episode','thumb','http://thetvdb.com/banners/episodes/80379/332484.jpg');
CREATE INDEX ix_bookmark ON bookmark (idFile, type);
CREATE INDEX ix_path ON path ( strPath );
CREATE INDEX ix_files ON files ( idPath, strFilename );
CREATE UNIQUE INDEX ix_episode_file_1 on episode (idEpisode, idFile);
CREATE UNIQUE INDEX id_episode_file_2 on episode (idFile, idEpisode);
CREATE INDEX ix_episode_season_episode on episode (c12, c13);
CREATE INDEX ix_episode_bookmark on episode (c17);
CREATE INDEX ix_episode_show1 on episode(idEpisode,idShow);
CREATE INDEX ix_episode_show2 on episode(idShow,idEpisode);
CREATE UNIQUE INDEX ix_tvshowlinkpath_1 ON tvshowlinkpath ( idShow, idPath );
CREATE UNIQUE INDEX ix_tvshowlinkpath_2 ON tvshowlinkpath ( idPath, idShow );
CREATE INDEX ixEpisodeBasePath ON episode ( c19 );
CREATE INDEX ixTVShowBasePath on tvshow ( c17 );
CREATE INDEX ix_seasons ON seasons (idShow, season);
CREATE INDEX ix_art ON art(media_id, media_type, type);
CREATE VIEW episodeview
AS
SELECT episode.*,;
FROM   episode
JOIN files
ON files.idfile = episode.idfile
JOIN tvshow
ON tvshow.idshow = episode.idshow
LEFT JOIN seasons
ON seasons.idshow = episode.idshow
AND seasons.season = episode.c12
JOIN path
ON files.idpath = path.idpath
LEFT JOIN bookmark
ON bookmark.idfile = episode.idfile
AND bookmark.type = 1;
CREATE VIEW tvshowview
AS
SELECT tvshow.*,;
Max(files.lastplayed)                     AS lastPlayed,
NULLIF(Count(episode.c12), 0)             AS totalCount,
Count(files.playcount)                    AS watchedcount,
NULLIF(Count(DISTINCT( episode.c12 )), 0) AS totalSeasons
FROM   tvshow
LEFT JOIN tvshowlinkpath
ON tvshowlinkpath.idshow = tvshow.idshow
LEFT JOIN path
ON path.idpath = tvshowlinkpath.idpath
LEFT JOIN episode
ON episode.idshow = tvshow.idshow
LEFT JOIN files
ON files.idfile = episode.idfile
GROUP  BY tvshow.idshow;
SELECT;
FROM episodeview
JOIN tvshowview ON tvshowview.idShow = episodeview.idShow
JOIN seasons ON (seasons.idShow = tvshowview.idShow
AND seasons.season = episodeview.c12)
JOIN files ON files.idFile = episodeview.idFile
JOIN tvshowlinkpath ON tvshowlinkpath.idShow = tvshowview.idShow
JOIN path ON path.idPath = tvshowlinkpath.idPath
WHERE tvshowview.idShow = 1
GROUP BY episodeview.c12;
CREATE TABLE x(i INTEGER PRIMARY KEY, y TEXT);
INSERT INTO x VALUES(10, '10');
SELECT * FROM x WHERE x.y>='1' AND x.y<'2' AND x.i=x.y;
CREATE TABLE t1(x TEXT);
CREATE TABLE t2(y TEXT);
INSERT INTO t1 VALUES('abc');
INSERT INTO t2 VALUES('ABC');
SELECT * FROM t1 CROSS JOIN t2 WHERE (x=y COLLATE nocase) AND y='ABC';
CREATE TABLE t3(i INTEGER PRIMARY KEY, t TEXT);
INSERT INTO t3 VALUES(10, '10');
SELECT * FROM t3 WHERE i=t AND t = '10 ';
CREATE TABLE u1(x TEXT, y INTEGER, z TEXT);
CREATE INDEX i1 ON u1(x);
INSERT INTO u1 VALUES('00013', 13, '013');
SELECT * FROM u1 WHERE x=y AND y=z AND z='013';
CREATE TABLE b1(x, y);
INSERT INTO b1 VALUES('abc', 'ABC');
CREATE INDEX b1x ON b1(x);
SELECT * FROM b1 WHERE (x=y COLLATE nocase) AND y='ABC';
CREATE TABLE c1(x, y COLLATE nocase, z);
INSERT INTO c1 VALUES('ABC', 'ABC', 'abc');
SELECT * FROM c1 WHERE x=y AND y=z AND z='abc';
CREATE INDEX c1x ON c1(x);
SELECT * FROM c1 WHERE x=y AND y=z AND z='abc';
EXPLAIN QUERY PLAN
SELECT * FROM c1 WHERE x=y AND y=z AND z='abc';
SELECT * FROM c1 WHERE x=y AND z=y AND z='abc';
EXPLAIN QUERY PLAN
SELECT * FROM c1 WHERE x=y AND z=y AND z='abc';
