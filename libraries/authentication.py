#
# @authentication.py Copyright (c) 2023 Jalasoft.
# 2643 Av Melchor Perez de Olguin, Colquiri Sud, Cochabamba, Bolivia.
# All rights reserved.
#
# This software is the confidential and proprietary information of
# Jalasoft, ("Confidential Information"). You shall not
# disclose such Confidential Information and shall use it only in
# accordance with the terms of the license agreement you entered into
# with Jalasoft.
#


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
