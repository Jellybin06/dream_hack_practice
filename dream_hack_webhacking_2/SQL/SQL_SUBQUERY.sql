--서브 쿼리 Subquery는 한 쿼리 내에 또 다른 쿼리를 사요하는 것을 의미
--SELECT 구문만 사용할 수 있다.
--공격자는 서브 쿼리를 통해 쿼리가 접근하는 테이블이 아닌 다른 테이블에 접근하거나 SELECT 구문을 사용하지 않는 쿼리문에서 SQL Injection 취약점이 발생할 때 SELECT 구문을 사용함

--서브 쿼리 사용 예시
mysql> SELECT 1,2,3,(SELECT 456);

--SELECT 구문의 컬럼 절에서 서브 쿼리를 사용할 때에는 단일 행과 단일 컬럼이 반환되도록 해야 함

--서브 쿼리 사용 예시 (복수 행 또는 컬럼을 반환하여 오류 뜸)
mysql> SELECT username, (SELECT "ABCD" UNION SEELCT 1234) FROM users;
--ERROR 1242 (21000): Subquery returns more than 1 row
mysql> SELECT username, (SELECT "ABCD", 1234) FROM users;
--ERROR 1241 (21000): Operand should contain 1 column(s)


--FROM 절에서 사용하는 서브 쿼리를 인라인 뷰 (Inline View)라 함
--이는 다중 행, 다중 컬럼 결과를 반환할 수 있다.
mysql> SELECT * FROM (SELECT *, 1234 FROM users) as u;


--WHERE 절에서 서브 쿼리를 사용하면 다중 행 결과를 반환하는 쿼리문을 실행할 수 있습니다.
--서브 쿼리 사용 예시 - where
mysql> SELECT * FROM users WHERE username IN (SELECT "admin" UNION SELECT "guest");