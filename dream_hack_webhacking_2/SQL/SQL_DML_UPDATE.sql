--UPDATE는 데이터를 수정하는 구문
--UPDATE : 해당 문자열을 시작으로, 수정할 테이블을 정의
--SET : 수정할 컬럼과 데이터를 정의
--WHERE : 수정할 행의 조건을 정의

UPDATE board
    SET boardcontent = 
"update content 2"
    WHERE title = 'title';

-- boardcontent 컬럼을 update contnet2 라는 문자열로 수정
