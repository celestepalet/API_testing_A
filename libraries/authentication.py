from requests.auth import HTTPBasicAuth
from wordpress.resources.config.config import Config

config = Config.get_instance()


class Authentication:
    """Gets authentication to API for different types"""

    def get_basic_auth(self, username=config.username, password=config.password, **kwargs):
        """Gets basic authentication using username and password"""
        auth = HTTPBasicAuth(username, password)
        return auth
    
    def get_token_auth(self, token, key="token"):
        """Gets authentication using token"""
        header = {key : token}
        return header
    
    def get_apikey_auth(self, apikey, key="apikey"):
        """Gets authentication using apikey"""
        header = {key : apikey}
        return header
    
    def get_apikey_token(self, apikey, token, key="apikey", key_token="token"):
        """Gets authentication using apikey and token"""
        params = {key: apikey, key_token: token}
        return params
