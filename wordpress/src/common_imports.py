from libraries.validate_status_reponse import ValidateStatusReponse
from libraries.format_response import FormatResponse
from libraries.make_request import MakeRequest
from libraries.authentication import Authentication
from libraries.get_element import GetElement
from libraries.wordpress_api import WordPressApi
from libraries.random_names import RandomNames

class CommonLibraries(ValidateStatusReponse, FormatResponse, MakeRequest, Authentication, GetElement, RandomNames, WordPressApi):
    def __init__(self):
        pass
