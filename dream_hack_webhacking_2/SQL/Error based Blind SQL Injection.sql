-- Blind SQLI와 Error based SQLI를 동시에 활용
-- 이를 통해 임의로 에러를 발생하고 참/거짓을 판단해 데이터를 추출할 수 있다

-- Error Based SQLI 기법에서는 에러 메시지를 통해 출력된 데이터로 정보를 수집해 출력값에 영향을 받지만
-- Error Based SQLI을 이용하면 에러 발생 여부만을 필요로 하기 때문에 용이하게 이용 가능

select if(1=1, 9e307*2,0);
-- ERROR 1690 (22003): DOUBLE value is out of range in '(9e307 * 2)'

select if(1=0, 9e307*2,0);
+--------------------+
| if(1=0, 9e307*2,0) |
+--------------------+
|                  0 |
+--------------------+
1 row in set (0.00 sec)

