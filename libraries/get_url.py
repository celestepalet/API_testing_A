import os
from dotenv import load_dotenv
from requests.auth import HTTPBasicAuth
load_dotenv()


class GetUrl:
    def __init__(self):
        pass

    def get_base_url(self):
        return os.getenv("URL")

    def get_complete_url(self, path, id='', **kwargs):
        url = '%s/%s/%s' % (GetUrl().get_base_url(), path, id)
        return url 
