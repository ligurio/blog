#!/usr/bin/python

# https://www.googleapis.com/pagespeedonline/v3beta1/mobileReady?url=http://blog.bronevichok.ru

import requests
import sys

url_to_test = 'http://blog.bronevichok.ru'

if len(sys.argv) > 1:
   url_to_test = sys.argv[1]
else:
   print("URL is required.")
   sys.exit(1)

params = {
    'key': 'AIzaSyDkEX-f1JNLQLC164SZaobALqFv4PHV-kA',
    'url': url_to_test,
}
api_url = 'https://www.googleapis.com/pagespeedonline/v3beta1/mobileReady'
response = requests.get(api_url, params=params)
data = response.json()
passed = all(rule['pass'] for rule in data['ruleGroups'].values())

print('{} is {}'.format(url_to_test, 'mobile friendly' if passed else 'not mobile friendly'))
