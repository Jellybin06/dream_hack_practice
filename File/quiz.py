# 파일 다운로드 취약점이 발생하는 코드이다. "filename" 인자에 어떠한 값을 넣어야 현재 실행중인 프로세스의 메모리 정보를 볼 수 있는가?
from urllib import request


@app.route("/douwnload")
def download():
    filename = request.args.get("filename")
    content = open("/data/uploads" + filename, "rb").read()
    return content

#../../proc/self/maps
#../../../proc/self/maps