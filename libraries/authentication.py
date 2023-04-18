from requests.auth import HTTPBasicAuth
from wordpress.resources.config.config import username, password

class Authentication:

    def get_basic_auth(username=username, password=password, **kwargs):
            auth = HTTPBasicAuth(username, password)
            return auth
    
    def get_token_auth(self, token):
            header = token
            return header
    
    def get_apikey_auth(self, apikey):
            auth = apikey
            return auth
    
    def get_apikey_token(self, apikey, token):
        params = {"key": apikey, "token": token}
        return params
