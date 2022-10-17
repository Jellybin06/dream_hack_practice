--PostgreSQL의 시스템 테이블에 대해서 소개합니다. 
--PostgreSQL 초기 설치 시 postgres template1 template0 데이터베이스가 있따.

postgres=$ select datname from pg_database; -- pg_database PostgreSQL 의 전체 테이블
/*
  datname  
-----------
 postgres
 template1
 template0
(3 rows)
*/

-- 주요 정보를 담고 있는 테이블을 포함한 스키마는 pg_catalog, information_schema 가 있다.
postgres=$ select nspname from pg_catalog.pg_namespace;
/*
      nspname       
--------------------
 pg_toast
 pg_temp_1
 pg_toast_temp_1
 pg_catalog
 public
 information_schema
(6 rows)
*/


-- infromation_schema를 통해 각 테이블의 정보를 조회할 수 있다
-- pg_catalog 의 table_name 와 infromation_schema 의 table_name 정보를 조회
postgres=$ select table_name from infromation_schema.tables where table_schema="pg_catalog"
/*
           table_name
---------------------------------
pg_shadow
pg_settings
pg_database
pg_stat_activity
...
*/
postgres=# select table_name from information_schema.tables where table_schema='information_schema';
/*
              table_name
---------------------------------------
schemata
tables
columns
...
*/


-- DBMS 계정 정보
-- pg_catalog.py_shadow 테이블을 통해 PostgreSQL 서버의 계정 정보를 조회할 수 있다
postgres=$ select usename, passwd from pg_catalog.pg_shadow;
/* 
 usename  |               passwd
----------+-------------------------------------
 postgres | md5df6802cb10f4000bf81de27261c1155f
(1 row)
*/


postgres=$ select name, setting from pg_catalog.pg_settings;
/*
                  name                  |                 setting
----------------------------------------+------------------------------------------
 allow_system_table_mods                | off
 application_name                       | psql
 ...
*/    

 
-- catalog (카탈로그)
-- pg_catalog.pg_stat_activity 테이블을 통해 실시간으로 실행되는 쿼리를 조회할 수 있다
postgres=$ select usename, query from pg_catalog.pg_stat_activity;
/*
 usename  |                          query                          
----------+---------------------------------------------------------
 postgres | select usename, query from pg_catalog.pg_stat_activity;
(1 row)
*/


-- information_schema.tables 테이블을 통해 데이터베이스의 스키마 및 테이블 정보등을 조회 가능
postgres=$ select table_schema, table_name from information_schema.tables;
/*
    table_schema    |              table_name
--------------------+---------------------------------------
 pg_catalog         | pg_statistic
...
 information_schema  | information_schema_catalog_name
...
*/


-- information_schema.columns 테이블을 통해 컬럼의 정보를 조회할 수 있다. 
postgres=$ select table_schema, table_name, column_name from information_schema.columns;
/*
    table_schema    |      table_name         |    column_name
--------------------+-------------------------+------------------
 pg_catalog         | pg_stat_user_indexes    | relid
...
 information_schema | view_routine_usage      | specific_name
...
*/









