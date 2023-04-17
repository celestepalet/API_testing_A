#
# @make_request.py Copyright (c) 2023 Jalasoft.
# 2643 Av Melchor Perez de Olguin, Colquiri Sud, Cochabamba, Bolivia.
#
# All rights reserved.
#
# This software is the confidential and proprietary information of
# Jalasoft, ("Confidential Information"). You shall not
# disclose such Confidential Information and shall use it only in
# accordance with the terms of the license agreement you entered into
# with Jalasoft.
#

import requests
from libraries.get_url import GetUrl


class MakeRequest:
    """Makes request to a API endpoint"""

    def make_request_put(self, path, body=None, id='', header=None, params=None, auth=None, **kwargs):
        """Makes a PUT request to a API endpoint"""
        url = GetUrl().get_complete_url(path, id)
        response = requests.put(url, json=body, auth=auth, headers=header, params=params)
        return response

    def make_request_get(self, path, id='', header=None, params=None, auth=None, **kwargs):
        """Makes a GET request to a API endpoint"""
        url = GetUrl().get_complete_url(path, id)
        response = requests.get(url, auth=auth, headers=header, params=params)
        return response
