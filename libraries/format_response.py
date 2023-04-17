#
# @format_response.py Copyright (c) 2023 Jalasoft.
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

from lxml import html, etree
import json


class FormatResponse:
    """Gives format to a request response"""

    def format_json(self, response):
        """Gives json format to a request response"""
        response = json.loads(response.content)
        return response

    def format_str(self, response):
        """Gives text format to a request response"""
        response = response.text
        return response

    def format_xml(self, response):
        """Gives xml format to a request response"""
        response = etree.fromstring(response.content)
        return etree.tostring(response, pretty_print=True)

    def format_html(self, response):
        """Gives html format to a request response"""
        response = html.fromstring(response.content)
        return html.tostring(response, pretty_print=True)

    def get_format_response(self, response, response_type='format_text'):
        """Instances the method with tha required format"""
        response_with_format = dic_response_type[response_type]
        return response_with_format(response)


dic_response_type = {
    "format_json": FormatResponse().format_json,
    "format_text": FormatResponse().format_str,
    "format_xml": FormatResponse().format_xml,
    "format_html": FormatResponse().format_html
}
