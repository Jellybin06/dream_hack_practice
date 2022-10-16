MySQL의 시스템 테이블에 대해서 소개합니다. 가장 먼저, MySQL은 
스키마와 데이터베이스가 같으며 초기 설치 시 Figure1과 같이 information_schema와 mysql, performance_schema 그리고 sys 데이터베이스가 있습니다.

-- 초기 데이터 베이스
mysql> show databases;
/*
+--------------------+
| Database           |
+--------------------+
| information_schema |
| DREAMHACK          | # 이용자 정의 데이터베이스
| mysql              |
| performance_schema |
| sys                |
+--------------------+
*/


-- TABLES 테이블을 통해 스키마의 정보를 조회할 수 있다
-- MySQL 스키마 정보 조회
mysql> select TABLE_SCHMA FROM information_schema.tables group by TABLE_SCHMA;
/*
+--------------------+
| TABLE_SCHEMA       |
+--------------------+
| information_schema |
| DREAMHACK          |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)
*/


-- COLUMNS 테이블을 통해 컬럼의 정보를 조회할 수 있습니다. Figure4를 살펴보면, COLUMNS 테이블의 내용 중 TABLE_SCHEMA , TABLE_NAME 그리고 COLUMN_NAME 을 모두 조회합니다.
-- 쿼리 결과에 이름이 출력된 것을 확인할 수 있습니다. 공격자는 이 모든 정보를 조합해 계정 정보를 탈취할 수 있습니다. 

select TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME from information_schema.COLUMNS;
/*
+--------------------+----------------+--------------------+
| TABLE_SCHEMA       | TABLE_NAME     | COLUMN_NAME        |
+--------------------+----------------+--------------------+
| information_schema | CHARACTER_SETS | CHARACTER_SET_NAME |
...
| DREAMHACK          | users          | uid                |
| DREAMHACK          | users          | upw                |
...
| mysql              | db             | Db                 |
| mysql              | db             | User               |
...
+--------------------+----------------+--------------------+
3132 rows in set (0.07 sec)
*/


-- 실시간 실행 쿼리 정보
-- PROCESSLIST 테이블을 통해 실시간으로 실행되는 쿼리를 조회할 수 있다.
-- SYS 데이터베이스의 SESSION 테이블을 통해 실행 중인 계정과 함께 조회하는 방법도 있다.

-- MySQL 실시간 실행 쿼리 조회
select * from information_schema.PROCESSLIST;
/*
+-------------------------------------------------+
| info                                            |
+-------------------------------------------------+
| select info from information_schema.PROCESSLIST |
+-------------------------------------------------+
1 row in set (0.00 sec)
*/


-- MySQL 계정 및 실시간 실행 쿼리 조회
select user,current_statement from sys.session;
/*
+----------------+------------------------------------------------+
| user           | current_statement                              |
+----------------+------------------------------------------------+
| root@localhost | select user,current_statement from sys.session |
+----------------+------------------------------------------------+
1 row in set (0.05 sec)
*/


-- USER_PRIVILEGES 테이블을 통해 MySQL 서버의 계정 정보를 조회할 수 있다
-- USER_PRIVILEGES 테이블의 GRANTEE, PRIVILEGE_TYPE 그리고 IS_GRANTABLE을 조회하여 결과에 계정 정보와 각 권한에 대한 내용이 포함되게 할 수 있다.
select GRANTEE,PRIVILEGE_TYPE,IS_GRANTABLE from information_schema.USER_PRIVILEGES; -- from 뒤로 -> infromation_schema 에있는 서버 계정 정보
-- GRANTEE(수혜자? 계정 정보) PRIVILEGE_TYPE(특권) IS_GRANTABLE(부여 가능?)
/*
+-------------------------+-------------------------+--------------+
| GRANTEE                 | PRIVILEGE_TYPE          | IS_GRANTABLE |
+-------------------------+-------------------------+--------------+
| 'root'@'localhost'      | SELECT                  | YES          |
...
| 'root'@'localhost'      | SUPER                   | YES          |
...
| 'user_test'@'localhost' | USAGE                   | NO           |
+-------------------------+-------------------------+--------------+
58 rows in set (0.00 sec)
*/


select User, authentication_string from mysql.user;
/*
+------------------+-------------------------------------------+
| User             | authentication_string                     |
+------------------+-------------------------------------------+
| root             | *...                                      |
| mysql.sys        | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| mysql.session    | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE |
| user_test        | *...                                      |
+------------------+-------------------------------------------+
4 rows in set (0.00 sec)
*/




