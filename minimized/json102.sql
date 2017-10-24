SELECT json_object('ex','[52,3.14159]');
SELECT json_object('ex',json('[52,3.14159]'));
SELECT json_object('ex',json_array(52,3.14159));
SELECT json(' { "this" : "is", "a": [ "test" ] } ');
SELECT json_array(1,2,'3',4);
SELECT json_array('[1,2]');
SELECT json_array(json_array(1,2));
SELECT json_array(1,null,'3','[4,5]','{"six":7.7}');
SELECT json_array(1,null,'3',json('[4,5]'),json('{"six":7.7}'));
SELECT json_array_length('[1,2,3,4]');
SELECT json_array_length('[1,2,3,4]', '$');
SELECT json_array_length('[1,2,3,4]', '$[2]');
SELECT json_array_length('{"one":[1,2,3]}');
SELECT json_array_length('{"one":[1,2,3]}', '$.one');
SELECT json_array_length('{"one":[1,2,3]}', '$.two');
SELECT json_extract('{"a":2,"c":[4,5,{"f":7}]}', '$');
SELECT json_extract('{"a":2,"c":[4,5,{"f":7}]}', '$.c');
SELECT json_extract('{"a":2,"c":[4,5,{"f":7}]}', '$.c[2]');
SELECT json_extract('{"a":2,"c":[4,5,{"f":7}]}', '$.c[2].f');
SELECT json_extract('{"a":2,"c":[4,5],"f":7}','$.c','$.a');
SELECT json_extract('{"a":2,"c":[4,5,{"f":7}]}', '$.x');
SELECT json_extract('{"a":2,"c":[4,5,{"f":7}]}', '$.x', '$.a');
SELECT json_insert('{"a":2,"c":4}', '$.a', 99);
SELECT json_insert('{"a":2,"c":4}', '$.e', 99);
SELECT json_replace('{"a":2,"c":4}', '$.a', 99);
SELECT json_replace('{"a":2,"c":4}', '$.e', 99);
SELECT json_set('{"a":2,"c":4}', '$.a', 99);
SELECT json_set('{"a":2,"c":4}', '$.e', 99);
SELECT json_set('{"a":2,"c":4}', '$.c', '[97,96]');
SELECT json_set('{"a":2,"c":4}', '$.c', json('[97,96]'));
SELECT json_set('{"a":2,"c":4}', '$.c', json_array(97,96));
SELECT json_object('a',2,'c',4);
SELECT json_object('a',2,'c','{e:5}');
SELECT json_object('a',2,'c',json_object('e',5));
SELECT json_remove('[0,1,2,3,4]','$[2]');
SELECT json_remove('[0,1,2,3,4]','$[2]','$[0]');
SELECT json_remove('[0,1,2,3,4]','$[0]','$[2]');
SELECT json_remove('{"x":25,"y":42}');
SELECT json_remove('{"x":25,"y":42}','$.z');
SELECT json_remove('{"x":25,"y":42}','$.y');
SELECT json_remove('{"x":25,"y":42}','$');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}','$');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}','$.a');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}','$.a[0]');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}','$.a[1]');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}','$.a[2]');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}','$.a[3]');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}','$.a[4]');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}','$.a[5]');
SELECT json_type('{"a":[2,3.5,true,false,null,"x"]}','$.a[6]');
SELECT json_valid(char(123)||'"x":35'||char(125));
SELECT json_valid(char(123)||'"x":35');
CREATE TABLE user(name,phone);
INSERT INTO user(name,phone) VALUES;
SELECT DISTINCT user.name
FROM user, json_each(user.phone)
WHERE json_each.value LIKE '704-%'
ORDER BY 1;
UPDATE user
SET phone=json_extract(phone,'$[0]')
WHERE json_array_length(phone)<2;
SELECT name, substr(phone,1,5) FROM user ORDER BY name;
SELECT name FROM user WHERE phone LIKE '704-%'
UNION
SELECT user.name
FROM user, json_each(user.phone)
WHERE json_valid(user.phone)
AND json_each.value LIKE '704-%';
CREATE TABLE big(json JSON);
INSERT INTO big(json) VALUES('{;
INSERT INTO big(json) VALUES('{;
SELECT big.rowid, fullkey, value
FROM big, json_tree(big.json)
WHERE json_tree.type NOT IN ('object','array')
ORDER BY +big.rowid, +json_tree.id;
SELECT big.rowid, fullkey, atom
FROM big, json_tree(big.json)
WHERE atom IS NOT NULL
ORDER BY +big.rowid, +json_tree.id;
SELECT DISTINCT json_extract(big.json,'$.id')
FROM big, json_tree(big.json,'$.partlist')
WHERE json_tree.key='uuid'
AND json_tree.value='6fa5181e-5721-11e5-a04e-57f3d7b32808';
SELECT DISTINCT json_extract(big.json,'$.id')
FROM big, json_tree(big.json,'$')
WHERE json_tree.key='uuid'
AND json_tree.value='6fa5181e-5721-11e5-a04e-57f3d7b32808';
SELECT DISTINCT json_extract(big.json,'$.id')
FROM big, json_tree(big.json)
WHERE json_tree.key='uuid'
AND json_tree.value='6fa5181e-5721-11e5-a04e-57f3d7b32808';
WITH RECURSIVE c(x) AS (VALUES(1) UNION ALL SELECT x+1 FROM c WHERE x<0x20)
SELECT x FROM c WHERE json_valid(printf('{"a":"x%sz"}', char(x))) ORDER BY x;
WITH RECURSIVE c(x) AS (VALUES(1) UNION ALL SELECT x+1 FROM c WHERE x<0x1f)
SELECT sum(json_valid(json_quote('a'||char(x)||'z'))) FROM c ORDER BY x;
