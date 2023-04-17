import requests
import os
from libraries.get_url import GetUrl


class MakeRequest:
    def make_request_get(self, path, id='', header=None, params=None, auth=None, **kwargs):
        url = GetUrl().get_complete_url(path, id)
        response = requests.get(url, auth=auth, headers=header, params=params)
        return response
