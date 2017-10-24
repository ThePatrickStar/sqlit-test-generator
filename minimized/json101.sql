SELECT json_array(1,2.5,null,'hello');
SELECT json_array(1,'{"abc":2.5,"def":null,"ghi":hello}',99);
SELECT json_array(1,json('{"abc":2.5,"def":null,"ghi":"hello"}'),99);
SELECT json_array(1,json_object('abc',2.5,'def',null,'ghi','hello'),99);
SELECT hex(json_array('String "\ Test'));
SELECT json_array(1,printf('%.1000c','x'),x'abcd',3);
SELECT json_array(-9223372036854775808,9223372036854775807,0,1,-1,;
SELECT json_object('a',1,'b',2.5,'c',null,'d','String Test');
SELECT json_object('a',printf('%.1000c','x'),2,2.5);
SELECT json_object('a',1,'b');
SELECT json_object('a',printf('%.1000c','x'),'b',x'abcd');
SELECT json_replace('{"a":1,"b":2}','$.a','[3,4,5]');
SELECT json_replace('{"a":1,"b":2}','$.a',json('[3,4,5]'));
SELECT json_type(json_set('{"a":1,"b":2}','$.b','{"x":3,"y":4}'),'$.b');
SELECT json_type(json_set('{"a":1,"b":2}','$.b',json('{"x":3,"y":4}')),'$.b');
SELECT fullkey, atom, '|' FROM json_tree(json_set('{}','$.x',123,'$.x',456));
CREATE TABLE j1(x);
INSERT INTO j1(x)
VALUES('true'),('false'),('null'),('123'),('-234'),('34.5e+6'),;
SELECT * FROM j1 WHERE NOT json_valid(x);
SELECT * FROM j1 WHERE NOT json_valid(char(0x20,0x09,0x0a,0x0d)||x);
SELECT * FROM j1 WHERE NOT json_valid(x||char(0x20,0x09,0x0a,0x0d));
SELECT json_valid(''), json_valid(char(0x20,0x09,0x0a,0x0d));
SELECT x FROM j1 WHERE json_remove(x)<>x;
SELECT x FROM j1 WHERE json_replace(x)<>x;
SELECT x FROM j1 WHERE json_set(x)<>x;
SELECT x FROM j1 WHERE json_insert(x)<>x;
SELECT count(*) FROM j1 WHERE json_type(x) IN ('object','array');
SELECT x FROM j1
WHERE json_extract(x,'$')<>x
AND json_type(x) IN ('object','array');
CREATE TABLE j2(id INTEGER PRIMARY KEY, json, src);
INSERT INTO j2(id,json,src)
VALUES(1,'{;
INSERT INTO j2(id,json,src)
VALUES(2, '{;
INSERT INTO j2(id,json,src)
VALUES(3,'[;
SELECT count(*) FROM j2;
SELECT id, json_valid(json), json_type(json), '|' FROM j2 ORDER BY id;
SELECT j2.rowid, jx.rowid, fullkey, path, key
FROM j2, json_tree(j2.json) AS jx
WHERE fullkey!=(path || CASE WHEN typeof(key)=='integer' THEN '['||key||']'
ELSE '.'||key END);
SELECT j2.rowid, jx.rowid, fullkey, path, key
FROM j2, json_each(j2.json) AS jx
WHERE fullkey!=(path || CASE WHEN typeof(key)=='integer' THEN '['||key||']'
ELSE '.'||key END);
SELECT j2.rowid, jx.rowid, fullkey, path, key
FROM j2, json_each(j2.json) AS jx
WHERE jx.json<>j2.json;
SELECT j2.rowid, jx.rowid, fullkey, path, key
FROM j2, json_tree(j2.json) AS jx
WHERE jx.json<>j2.json;
SELECT j2.rowid, jx.rowid, fullkey, path, key
FROM j2, json_each(j2.json) AS jx
WHERE jx.value<>jx.atom AND type NOT IN ('array','object');
SELECT j2.rowid, jx.rowid, fullkey, path, key
FROM j2, json_tree(j2.json) AS jx
WHERE jx.value<>jx.atom AND type NOT IN ('array','object');
SELECT json_valid('{"a":55,"b":72,}');
SELECT json_valid('{"a":55,"b":72}');
SELECT json_valid('["a",55,"b",72,]');
SELECT json_valid('["a",55,"b",72]');
DROP TABLE IF EXISTS t8;
CREATE TABLE t8(a,b);
INSERT INTO t8(a) VALUES('abc' || char(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35) || 'xyz');
UPDATE t8 SET b=json_array(a);
SELECT b FROM t8;
SELECT a=json_extract(b,'$[0]') FROM t8;
SELECT json_valid(char(0x22,0xe4,0x22));
SELECT unicode(json_extract(char(0x22,228,0x22),'$'));
SELECT json_quote('abc"xyz');
SELECT json_quote(3.14159);
SELECT json_quote(12345);
SELECT json_quote(null);
SELECT json_quote(x'30313233');
SELECT json_quote(123,456);
SELECT json_quote();
SELECT json_valid('" \  "');
SELECT json_valid('" \! "');
SELECT json_valid('" \" "');
SELECT json_valid('" \# "');
SELECT json_valid('" \$ "');
SELECT json_valid('" \% "');
SELECT json_valid('" \& "');
SELECT json_valid('" \'' "');
SELECT json_valid('" \( "');
SELECT json_valid('" \) "');
SELECT json_valid('" \* "');
SELECT json_valid('" \+ "');
SELECT json_valid('" \, "');
SELECT json_valid('" \- "');
SELECT json_valid('" \. "');
SELECT json_valid('" \/ "');
SELECT json_valid('" \0 "');
SELECT json_valid('" \1 "');
SELECT json_valid('" \2 "');
SELECT json_valid('" \3 "');
SELECT json_valid('" \4 "');
SELECT json_valid('" \5 "');
SELECT json_valid('" \6 "');
SELECT json_valid('" \7 "');
SELECT json_valid('" \8 "');
SELECT json_valid('" \9 "');
SELECT json_valid('" \: "');
SELECT json_valid('" \; "');
SELECT json_valid('" \< "');
SELECT json_valid('" \= "');
SELECT json_valid('" \> "');
SELECT json_valid('" \? "');
SELECT json_valid('" \@ "');
SELECT json_valid('" \A "');
SELECT json_valid('" \B "');
SELECT json_valid('" \C "');
SELECT json_valid('" \D "');
SELECT json_valid('" \E "');
SELECT json_valid('" \F "');
SELECT json_valid('" \G "');
SELECT json_valid('" \H "');
SELECT json_valid('" \I "');
SELECT json_valid('" \J "');
SELECT json_valid('" \K "');
SELECT json_valid('" \L "');
SELECT json_valid('" \M "');
SELECT json_valid('" \N "');
SELECT json_valid('" \O "');
SELECT json_valid('" \P "');
SELECT json_valid('" \Q "');
SELECT json_valid('" \R "');
SELECT json_valid('" \S "');
SELECT json_valid('" \T "');
SELECT json_valid('" \U "');
SELECT json_valid('" \V "');
SELECT json_valid('" \W "');
SELECT json_valid('" \X "');
SELECT json_valid('" \Y "');
SELECT json_valid('" \Z "');
SELECT json_valid('" \[ "');
SELECT json_valid('" \\ "');
SELECT json_valid('" \] "');
SELECT json_valid('" \^ "');
SELECT json_valid('" \_ "');
SELECT json_valid('" \` "');
SELECT json_valid('" \a "');
SELECT json_valid('" \b "');
SELECT json_valid('" \c "');
SELECT json_valid('" \d "');
SELECT json_valid('" \e "');
SELECT json_valid('" \f "');
SELECT json_valid('" \g "');
SELECT json_valid('" \h "');
SELECT json_valid('" \i "');
SELECT json_valid('" \j "');
SELECT json_valid('" \k "');
SELECT json_valid('" \l "');
SELECT json_valid('" \m "');
SELECT json_valid('" \n "');
SELECT json_valid('" \o "');
SELECT json_valid('" \p "');
SELECT json_valid('" \q "');
SELECT json_valid('" \r "');
SELECT json_valid('" \s "');
SELECT json_valid('" \t "');
SELECT json_valid('" \u "');
SELECT json_valid('" \ua "');
SELECT json_valid('" \uab "');
SELECT json_valid('" \uabc "');
SELECT json_valid('" \uabcd "');
SELECT json_valid('" \uFEDC "');
SELECT json_valid('" \u1234 "');
SELECT json_valid('" \v "');
SELECT json_valid('" \w "');
SELECT json_valid('" \x "');
SELECT json_valid('" \y "');
SELECT json_valid('" \z "');
SELECT json_valid('" \{ "');
SELECT json_valid('" \| "');
SELECT json_valid('" \} "');
SELECT json_valid('" \~ "');
SELECT json_valid(printf('%.2000c0%.2000c','[',']'));
SELECT json_valid(printf('%.2001c0%.2001c','[',']'));
SELECT json_valid(replace(printf('%.2000c0%.2000c','[','}'),'[','{"a":'));
SELECT json_valid(replace(printf('%.2001c0%.2001c','[','}'),'[','{"a":'));
