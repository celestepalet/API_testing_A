from wordpress.resources.config.config import Config

config = Config.get_instance()


class GetApiUrl:
    """Gets the urlof the endpoint"""

    def get_complete_url(self, endpoint, id='', **kwargs):
        """Gets the endpoint url"""
        endpoint_url = '%s/%s/%s/%s' % (config.url, config.url_extension, endpoint, id)
        return endpoint_url
