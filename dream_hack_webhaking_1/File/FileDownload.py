from urllib import request


Secret = os.environ("Secret")


@app.route("/download")
def download():
    filename = request.args.get("filename")
    content = open("./uploads/" + filename, "rb").read()
    return content


#Path > ../../../home/dreamhack/.bash_history