from lxml import html, etree
import json


class FormatResponse:
    def __init__(self):
        pass

    def format_json(self, response):
        response = json.loads(response.content)
        return response

    def format_str(self, response):
        response = response.text
        return response

    def format_xml(self, response):
        response = etree.fromstring(response.content)
        return etree.tostring(response, pretty_print=True)

    def format_html(self, response):
        response = html.fromstring(response.content)
        return html.tostring(response, pretty_print=True)

    def get_format_response(self, response, response_type='format_text', **kwargs):
        response_with_format = dic_response_type[response_type]
        return response_with_format(response)

dic_response_type = {
    "format_json": FormatResponse().format_json,
    "format_text": FormatResponse().format_str,
    "format_xml": FormatResponse().format_xml,
    "format_html": FormatResponse().format_html
}

#validation = Validation().validate_response_status(MakeRequest().make_request_put('wp-json/wp/v2/posts', {"id": 7, "title": "test_python_1", "content": ""}, id='7'), exp_status=200)
#print(FormatResponse().get_format_response(MakeRequest().make_request_put('wp-json/wp/v2/posts', {"id": 7, "title": "test_python_1", "content": ""}, id='7')))

#validation = Validation().validate_response_status(MakeRequest().make_request_post('wp-json/wp/v2/posts', {"title": "new title", "status": "publish"}), exp_status=201)
#print(FormatResponse().get_format_response(MakeRequest().make_request_post('wp-json/wp/v2/posts', {"title": "new title", "status": "publish"})))