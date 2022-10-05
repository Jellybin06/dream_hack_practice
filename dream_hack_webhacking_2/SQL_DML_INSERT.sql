--INSERT는 데이터를 추가하는 구문이다.
--INSERT : 해당 문자열을 시작으로, 추가할 테이블과 데이터를 정의
--INTO : 데이터를 추가할 테이블의 이름과 컬럼을 정의
--VALUES : INTO 절에서 정의한 테이블의 컬럼에 명시한 데이터들을 추가

--Figure4
INSERT
    INTO board (title, boardcontent)
    VALUES ('title 1', 'content 1'), ('title 2', 'content 2');

--figure5
INSERT
    INTO board (title, boardcontent)
    VALUES ('title 1', (select upw from users where uid='admin'));