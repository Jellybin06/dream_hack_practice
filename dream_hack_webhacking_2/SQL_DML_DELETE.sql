--DELETE는 데이터를 삭제하는 구문
--DELETE : 해당 문자열을 시작으로, 이후에 삭제할 테이블을 정의
--FROM : 삭제할 테이블을 정의
--WHERE : 삭제할 행의 조건을 정의

--board 테이블의 title 컬럼이 title1인 행을 삭제
DELETE FROM board
    WHERE title = 'title 1';