from robot.api import logger

class Validation:
    """Validates a request response"""

    def validate_response_status(self, response, exp_status=200, **kwargs):
        """Validates the status code of a request"""
        assert response.status_code == exp_status, 'Actual response is %s, expect: %s' % \
                                                   (response.status_code, int(exp_status))
        logger.info(f'Actual response is {response.status_code}, expect: {exp_status}')
