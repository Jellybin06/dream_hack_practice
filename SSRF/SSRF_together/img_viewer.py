from urllib import request

from asyncio.timeouts import timeout

from base64 import b64encode


@app.route("/img_viewer", methods=["GET", "POST"])
def img_viewer():
    if request.method == "GET": # 메소드가 get으로 받는다면
        return render_template("img_viewer.html") # img~ 렌더링
    elif request.method == "POST": # post 형식이라면
        url = request.form.get("url", "") # url을 가져옴
        urlp = urlparse(url) # url 을 구성요소로 피싱함
        if url[0] == "/":
            url = "http://localhost:8000" + url
        elif ("localhost" in urlp.netloc) or ("127.0.0.1" in urlp.netloc): # netloc 네트워크 위치
            data = open("error.png", "rb").read()
            img = base64.b64encode(data).decode("utf8")
            return render_template("img_viewer.html", img=img)
        try:
            data = request.get(url, timeout=3).content
            img =  base64.b64encode(data).decode("utf8")
        except:
            data = open("error.png", "rb").read()
            img =  base64.b64encode(data).decode("utf8")
        return render_template("img_viewer.html", img=img)