# Error based SQL Injection은 임의로 에러를 발생시켜 데이터베이스 및 운영체제의 정보를 획득하는 공격 기법이다.
# 게시물 알림과 같이 SQL 실행 결과를 출력하는 코드가 존재하지 않고 쿼리 실행 결과만을 판단
from turtle import pu
from flask import Flask, request
import pymysql

app = Flask(__name__)

def getConnection():
    return pymysql.connect(host='localhost', user='dream',
password='hack', db='dreamhack', charset='utf8')
    
@app.route('/', method=['GET'])
def index():
    username = request.args.get('username')
    sql = "select username from users where username='%s'"%username
    
    conn = getConnection()
    curs = conn.cursor(pymysql.cursors.DictCursor)
    curs.execute(sql)
    rows = curs.fetchall()
    conn.close()
    
    if(rows):
        return "True"
    else:
        return "False"
    
app.run(host='0.0.0.0', port=8000, debug=True)