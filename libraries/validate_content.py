from robot.api import logger
from assertpy import assert_that
import json

class ValidateContent:
    """Validates a request response"""

    def validate_content(self, content, response, **kwargs):
        """Validates that the content is included in the response of a request"""
        assert_that(response).contains(content)
        logger.info(f'Actual response is {response}, expect: {content}')
        
    def validate_content_not(self, content, response, **kwargs):
        """Validates that the content is included in the response of a request"""
        assert_that(response).does_not_contain(content)
        logger.info(f'Actual response is {response}, expect: {content}')
    