Command Injection은 명령어를 실행하는 함수에 이용자가 임의의 인자를 전달할 수 있을 때 발생한다.
파이썬에 입력한 임의 IP에 ping을 전송하고 싶다면 os.system("ping [user-input]*)을, 임의 파일을 읽고 싶다면 os.system("cat [user-input]*)등의 시스템 함수를 사용할 수 있다.
&&, ;, | 등을 사용하면 여러 개의 명령어를 연속으로 실행시킬 수 있다는 것입니다.


// 명령어 치환
$ echo `echo theori` theori 
// `` 안에 들어있는 명령어를 실행한 결과로 치환됩니다.


// 명령어 치환
$echo $(echo theori) theori
// $() 안에 들어있는 명령어를 실행한 결과로 치환합니다. 이 문자는 위와 다르게 중복 사용이 가능합니다. 
(echo &(echo &(echo theori)))


// 명령어 연속 실행
$echo hello && echo theori hello theori
// 한 줄에 여러 명령어를 사용하고 싶을 때 사용 합니다. 앞 명령어에서 에러가 발생하지 않아야 뒷 명령어를 실행합니다. (Logical And)


// 명령어 연속 실행
$cat / || echo theori cat: /: Is a directory theori
// 한 줄에 여러 명령어를 사용하고 싶을 때 사용 합니다. 앞 명령어에서 에러가 발생해야 뒷 명령어를 실행합니다. (Logical Or)


// 명령어 구분자
$echo hello ; echo theori hello theori
// 한 줄에 여러 명령어를 사용하고 싶을 때 사용 합니다. ; 은 단순히 명령어를 구분하기 위해 사용하며, 앞 명령어의 에러 유무와 관계 없이 뒷 명령어를 실행합니다.


// 파이프
$ echo id | /bin/sh uid=1001(theori) gid=1001(theori) groups=1001(theori)
// 앞 명령어의 결과가 뒷 명령어의 입력으로 들어갑니다.