import requests
from libraries.get_url import GetUrl
from libraries.authentication import Authentication

class MakeRequest:
    """Makes request to a API endpoint"""

    def make_request_put(self, path, body=None, id='', header=None, params=None, auth=None, **kwargs):
        """Makes a PUT request to a API endpoint"""
        url = GetUrl().get_complete_url(path, id)
        response = requests.put(url, json=body, auth=auth, headers=header, params=params)
        return response
    
    def make_request_post_id(self, path, body=None, id='', header=None, params=None, auth=None, **kwargs):
        """Makes a POST request to a API endpoint using id to edit information"""
        url = GetUrl().get_complete_url(path, id)
        response = requests.post(url, json=body, auth=auth, headers=header, params=params)
        return response

    def make_request_get(self, path, id='', header=None, params=None, auth=None, **kwargs):
        """Makes a GET request to a API endpoint"""
        url = GetUrl().get_complete_url(path, id)
        response = requests.get(url, auth=auth, headers=header, params=params)
        return response

    def make_request_post(self, path,  body=None, header=None, params=None, auth=None, **kwargs):
        """Makes a POST request to a API endpoint"""
        url = GetUrl().get_complete_url(path)
        response = requests.post(url, json=body, auth=auth, headers=header, params=params)
        return response
    
    def make_request_delete(self, path, id='', header=None, params=None, auth=None, **kwargs):
        """Makes a DELETE request to a API endpoint"""
        url = GetUrl().get_complete_url(path, id)
        response = requests.delete(url, auth=auth, headers=header, params=params)
        return response
