from robot.api import logger
from assertpy import assert_that


class ValidateContent:
    """Validates a request response"""
    def validate_content(self, content, response, **kwargs):
        """Validates that the content is included in the response of a request"""
        assert_that(response).contains(content)
        logger.info(f'Actual response is {response}, expect: {content}')
    
    def validate_string(self, actual, expected, **kwargs):
        """Validates that the expected string is contained on the actual string"""
        assert_that(actual).contains(expected)
        logger.info(f'Actual response is {actual}, expect: {expected}')
        
    def validate_string_not(self, actual, expected, **kwargs):
        """Validates that the expected string is not contained on the actual string"""
        assert_that(actual).does_not_contain(expected)
        logger.info(f'Actual response is {actual}, expect: {expected}')
        
    def validate_content_not(self, content, response, **kwargs):
        """Validates that the content is included in the response of a request"""
        assert_that(response).does_not_contain(content)
        logger.info(f'Actual response is {response}, expect: {content}')
    