from libraries.validate_status_reponse import ValidateStatusReponse
from libraries.format_response import FormatResponse
from libraries.make_request import MakeRequest
from libraries.authentication import Authentication
from libraries.get_element import GetElement
from wordpress.src.actions.posts.random_names import RandomValues

class CommonLibraries(ValidateStatusReponse, FormatResponse, MakeRequest, Authentication, GetElement, RandomValues):
    def __init__(self):
        pass
