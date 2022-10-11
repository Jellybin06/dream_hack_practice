var lock = false;
function submit_check(f){
	if (lock) {
		alert("waiting..");
		return false;
	}
	lock = true;
	var key = f.key.value;
	if (key == "") {
		alert("please fill the input box.");
		lock = false;
		return false;
	}

	submit(key);

	return false;
}

function submit(key){
	$.ajax({
		type : "POST",
		async : false,
		url : "./index.php",
		data : {json:JSON.stringify({key: key})},
		dataType : 'json'
	}).done(function(result){
		if (result['code'] == true) {
			document.write("Congratulations! flag is " + result['flag']);
		} else {
			alert("nope...");
		}
		lock = false;
	});
}

// JS 파일에 왔다
// 여기서 data : {json:JSON.stringify({key: key})}, 가 눈에 보인다
// key: 에 값은 key 로 저장되어있다.
// key: true로 바꾸면 항상 true를 값으로 가진다.
// 이러고 비밀번호에 아무거나 입력하고 submit 누르면
// flag를 얻을 수 있다. !!!