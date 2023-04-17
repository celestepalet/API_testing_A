import os
from dotenv import load_dotenv
load_dotenv()

username = os.getenv("USER")
password = os.getenv("PASSWORD")


def get_post_endpoint():
    return os.getenv("POST_ENDPOINT")

