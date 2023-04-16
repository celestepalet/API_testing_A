class Validation:
    def __init__(self):
        pass

    def validate_response_status(self, response, exp_status=200, **kwargs):
        assert response.status_code == exp_status, 'Actual response is %s, expect: %s' % (response.status_code, int(exp_status))

    def validate_schema(self, response, exp_status=200, **kwargs):
        pass

    def validate_content(self, response, exp_status=200, **kwargs):
        pass
