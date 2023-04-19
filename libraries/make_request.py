import requests
from libraries.get_url import GetUrl
from robot.api import logger


class MakeRequest:
    """Makes request to a API endpoint"""

    def make_request_put(self, path, body=None, id='', header=None, params=None, auth=None, **kwargs):
        """Makes a PUT request to a API endpoint"""
        url = GetUrl().get_complete_url(path, id)
        logger.info("Method: PUT")
        logger.info(f"URL: {url}")
        print(body)
        response = requests.put(url, json=body, auth=auth, headers=header, params=params)
        return response

    def make_request_get(self, path, id='', header=None, params=None, auth=None, **kwargs):
        """Makes a GET request to a API endpoint"""
        url = GetUrl().get_complete_url(path, id)
        logger.info("Method: GET")
        logger.info(f"URL: {url}")
        response = requests.get(url, auth=auth, headers=header, params=params)
        return response

    def make_request_post(self, path, id='',  body=None, header=None, params=None, auth=None, **kwargs):
        """Makes a POST request to a API endpoint"""
        url = GetUrl().get_complete_url(path, id)
        logger.info("Method: POST")
        logger.info(f"URL: {url}")
        print(body)
        response = requests.post(url, json=body, auth=auth, headers=header, params=params)
        return response
    
    def make_request_delete(self, path, id='', header=None, params=None, auth=None, **kwargs):
        """Makes a DELETE request to a API endpoint"""
        url = GetUrl().get_complete_url(path, id)
        logger.info("Method: DELETE")
        logger.info(f"URL: {url}")
        response = requests.delete(url, auth=auth, headers=header, params=params)
        return response
