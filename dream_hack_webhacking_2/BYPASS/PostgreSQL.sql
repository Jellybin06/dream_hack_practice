-- 문자열 검사 우회
postgres=> select chr(65);
/*
chr
-----
A
*/

postgres=> select concat(chr(65), chr(66));
/*
 concat
--------
 AB
*/

--가젯이용
postgres=> select substring(version(),23,1);
/*
substring
------------
n
*/


-- 공백 검사 우회
postgres=> select -- 개행을 이용
1;
/*
 ?column?
----------
        1
*/

postgres=> select/**/1; -- 주석 이용
/*
 ?column?
----------
        1
*/


