from libraries.validate_status_reponse import ValidateStatusReponse
from libraries.format_response import FormatResponse
from libraries.make_request import MakeRequest
from libraries.authentication import Authentication
from libraries.get_element import GetElement
from libraries.wordpress_api import WordPressApi


class CommonLibraries(ValidateStatusReponse, FormatResponse, MakeRequest, Authentication, GetElement, WordPressApi):
    def __init__(self):
        pass
