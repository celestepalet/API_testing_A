import os


class GetUrl:
    """Gets the url"""

    def get_base_url(self):
        """Gets the base url from .env file"""
        return os.getenv("URL")

    def get_extension_url(self):
        """Gets the extension of url from .env file"""
        return os.getenv("URL_EXTENSION")

    def get_complete_url(self, endpoint, id='', **kwargs):
        """Gets the endpoint url"""
        url = '%s/%s/%s/%s' % (GetUrl().get_base_url(), GetUrl().get_extension_url(), endpoint, id)
        return url
