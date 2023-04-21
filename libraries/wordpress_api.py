from libraries.authentication import Authentication
from libraries.make_request import MakeRequest
from libraries.format_response import FormatResponse
from libraries.validate_status_reponse import ValidateStatusReponse


class WordPressApi:
    """Calls methods that WordPress API need get a request response"""

    def get_request_response(self, method, endpoint, body=None, id='', exp_status=200, params=None, **kwargs):
        """Calls to all the methods necessaries for get response to a request in json format"""
        auth = Authentication().get_basic_auth()
        if method == 'put':
            response = MakeRequest().make_request_put(endpoint, body=body, id=id, auth=auth)
        if method == 'get':
            response = MakeRequest().make_request_get(endpoint, id=id, auth=auth, params=params)
        if method == 'post':
            response = MakeRequest().make_request_post(endpoint, body=body, id=id, auth=auth)
        if method == 'delete':
            response = MakeRequest().make_request_delete(endpoint, body=body, id=id, auth=auth, params=params)
        ValidateStatusReponse().validate_response_status(response, exp_status=exp_status)
        response = FormatResponse().get_format_response(response)
        return response




