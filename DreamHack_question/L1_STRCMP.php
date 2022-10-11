<?php
    require("./lib.php"); // for FLAG

    $password = sha1(md5(rand().rand().rand()).rand());

    if (isset($_GET['view-source'])) {
        show_source(__FILE__);
        exit();
    }else if(isset($_POST['password'])){
        sleep(1); // do not brute force!
        if (strcmp($_POST['password'], $password) == 0) {
            echo "Congratulations! Flag is <b>" . $FLAG ."</b>";
            exit();
        } else {
            echo "Wrong password..";
        }
    }

?>
<br />
<br />
<form method="POST">
    password : <input type="text" name="password" /> <input type="submit" value="chk">
</form>
<br />
<a href="?view-source">view-source</a>


소스코드를 보자 
랜덤한 값을 가져와서 password와 같다면 풀린다
이것을 찾는 것은 매우 귀찮다
if (strcmp($_POST['password'], $password) == 0) 이 소스코드를 보면 strcmp라는 단어가 눈에 들어온다
strcmp의 취약점 중에는 배열과 문자열을 비교하면 0을 반환하는 취약점이있다. 


Wrong password..<br />
<br />
<form method="POST">
	password : <input type="text" name="password" /> <input type="submit" value="chk">
</form>
<br />
<a href="?view-source">view-source</a>
여기서 password가 전달되는데
이 값을 
password : <input type="text" name="password[]"/>
로 바꿔주면 배열이 전달되어 0을 반환한다

그리고 아무 비밀번호 입력하고 확인누르면 flag를 얻을 수 있다.


strcmp 의 취약점을 알았다 !