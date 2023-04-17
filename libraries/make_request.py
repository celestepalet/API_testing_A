import requests
import os
from libraries.get_url import get_auth, GetUrl


class MakeRequest:
    def __init__(self):
        pass

    def make_request_put(self, path,  body=None, id='', header=None, params=None, user_name=os.getenv("USER"), \
                         password=os.getenv("PASSWORD"), **kwargs):
        auth = get_auth(user_name, password)
        url = GetUrl().get_complete_url(path, id)
        response = requests.put(url, json=body, auth=auth, headers=header, params=params)
        return response

    def make_request_post(self, path,  body=None, header=None, params=None, auth=None, **kwargs):        
        url = GetUrl().get_complete_url(path)
        response = requests.post(url, json=body, auth=auth, headers=header, params=params)
        return response

    def make_request_get(self):
        pass

    def make_request_delete(self):
        pass
