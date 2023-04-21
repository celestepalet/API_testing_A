from libraries.validate_status_reponse import ValidateStatusReponse
from libraries.validate_content import ValidateContent
from libraries.format_response import FormatResponse
from libraries.make_request import MakeRequest
from libraries.authentication import Authentication
from libraries.get_element import GetElement
from wordpress.src.actions.posts.random_names import RandomValues
from libraries.wordpress_api import WordPressApi

class CommonLibraries(ValidateStatusReponse, FormatResponse, MakeRequest, Authentication, GetElement, RandomValues, WordPressApi, ValidateContent):
    def __init__(self):
        pass
