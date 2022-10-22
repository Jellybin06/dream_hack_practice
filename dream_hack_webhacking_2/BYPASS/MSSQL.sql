-- 문자열 검사 우회
select char(0x61);
--a

select concat(char(0x61),char(0x62));
--ab

select substring(@@version,134,1);
--n


-- 공백 검사 우회
select -- 개행을 이용
1;
--1

select/**/1; -- 주석이용
-- 1
