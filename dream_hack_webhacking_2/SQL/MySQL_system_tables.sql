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


