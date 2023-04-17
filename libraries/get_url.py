#
# @get_url.py Copyright (c) 2023 Jalasoft.
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

import os


class GetUrl:
    """Gets the url"""

    def get_base_url(self):
        """Get the base url of the API from .env file"""
        return os.getenv("URL")

    def get_complete_url(self, path, id='', **kwargs):
        """Get the endpoint url"""
        url = '%s/%s/%s' % (GetUrl().get_base_url(), path, id)
        return url
