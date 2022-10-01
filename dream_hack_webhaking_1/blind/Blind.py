# GET
from urllib import request
import requests
url = 'https://dreamhack.io/'
headers = {
    'Content-Type':
        'application/x-www-form-urlencoded',
    'User-Agent':
        'DREAMHACK_REQUEST'
}
params = {
    'test': 1,
}
for i in range(1,5):
    c = requests.get(url + str(i), headers=headers,params=params)
    print(c.request.url)
    print(c.text)
    
    
#POST
import requests
url = 'https://dreamhack.io/'
headers = {
    'Content-Type':
        'spplication/x-www-form-urlencoded',
    'User-Agent':
        'DERAMHACK_REQUEST'
}

data = {
    'test':1,
}
for i in range(1,5):
    c = requests.post(url+str(i), headers=headers, data = data)
    print(c.text)