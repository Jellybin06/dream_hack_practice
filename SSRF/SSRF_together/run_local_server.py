import random
import http
import threading

local_host = "127.0.0.1"
local_port = random.randint(1500, 1800)
local_server = http.server.HTTPServer(
    (local_host, local_port), http.server.SimpleHTTPRequestHandler
)

def run_local_server():
    local_server.serve_forever()
    
threading._start_new_thread(run_local_server, ()) # 다른 쓰레드로 local_server 를 실행합니다.