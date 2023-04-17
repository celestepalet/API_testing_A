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
