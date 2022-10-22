<?php
    $db1 = new PDO('sqlite:test1.db');
    $db2 = new PDO('sqlite:test2.db');
    $query = 'select 1234;create table test(test int);';
    $db1->query($query);
    $db2->exec($query);
?>

$ php test.php
$ ls -al test1.db test2.db
-rw-r--r-- 1 test test    0 Apr 29 11:21 test1.db # create table이 실행되지 않음
-rw-r--r-- 1 test test 2048 Apr 29 11:20 test2.db # create table이 실행됨