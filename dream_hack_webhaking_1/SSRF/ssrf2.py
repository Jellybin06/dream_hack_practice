import re
from urllib import request, response


INTERNAL_API = "http://api.internal/"

@app.route("/v1/api/user/information")
def user_info():
    user_idx = request.args.get("user_idx", "")
    response = request.get(f"{INTERNAL_API}/user/{user_idx}")
    
@app.route("/v1/api/user/search")
def user_search():
    user_name = request.args.get("user_name", "")
    user_type = "public"
    response = request.get(f"{INTERNAL_API}/user/search?user_name={user_name}&user_type={user_type}")