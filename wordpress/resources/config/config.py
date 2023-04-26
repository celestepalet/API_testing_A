import os


class Config:
    _instance = None

    @classmethod
    def get_instance(cls):
        if not cls._instance:
            cls._instance = cls()
        return cls._instance

    def __init__(self):
        self.username = os.getenv("USER")
        self.password = os.getenv("PASSWORD")
        self.url = os.getenv("URL")
        self.url_extension = os.getenv("URL_EXTENSION")
