-- 문자열 검사 우회
select char(0x61);
select char(0x61)||char(0x62); -- ab

-- 공백 검사 우회
select
...> 1; -- 개행 이용

select/**/1; -- 주석 이용


-- 구문 검사 우회
select 구문을 사용하지 못하면 원라는 값을 반환할 수 있다
select 1 union values(2);
/*
1
2
*/


