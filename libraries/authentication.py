from requests.auth import HTTPBasicAuth
from wordpress.resources.config.config import username, password, apikey


class Authentication:
    """Gets authentication to API for different types"""

    def get_basic_auth(self, username=username, password=password, **kwargs):
        """Gets basic authentication using username and password"""
        auth = HTTPBasicAuth(username, password)
        return auth
    
    def get_token_auth(self, token):
        """Gets authentication using token"""
        header = token
        return header
    
    def get_apikey_auth(self, apikey=apikey):
        """Gets authentication using apikey"""
        auth = apikey
        return auth
    
    def get_apikey_token(self, apikey, token):
        """Gets authentication using apikey and token"""
        params = {"key": apikey, "token": token}
        return params
