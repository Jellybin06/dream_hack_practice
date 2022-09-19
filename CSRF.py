# 이용자가 /sendmoney에 접속했을때 이래와 같은 송금 기능을 웹 서비스가 실행함
from urllib import request


@app.route('/sendmoney')
def sendmoney(name):
    # 송금을 받는 사람과 금액을 입력받음
    to_user = 
request.args.get('to')
    amount = 
int(request.args.get('amount')
)

    # 송금 기능 실행 후, 결과 반환
    success_status = 
send_money(to_user, amount)

    # 송금이 성공했을 때,
    if success_status:
        # 성공 메시지 출력
        return "Send success."
    # 송금이 실패했을 때,
    else:
        # 실패 메시지 출력
        return "Send fail."
    


# CSRF 실습 = <img src="/sendmoney?to=dreamhack&amount=1000000">

# xss와 CSRF
# 공통점 : 두 개의 취약점은 모두 클라이언트를 대상으로 하는 공격이며, 이용자가 악성 스크립트가 포함된 페이지에 접속하도록 유도함
# 차이점 : XSS는 인증 정보인 세션 및 쿠키 탈취 목적, CSRF는 이용자가 임의 페이지에 HTTP요청을 보내는 것을 목적으로 하는 공격