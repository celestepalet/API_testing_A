from robot.api import logger
from assertpy import assert_that
from jsonschema import validate
import json


class PagesVerification:
    """Validates a request response"""

    def verify_actual_equal_expected(self, actual, expected, ignore=[]):
        """Verify that expected and actual results are equal"""
        logger.info(f'Actual result: {actual}')
        logger.info(f'Expected result: {expected}')
        assert_that(actual).is_equal_to(expected, ignore=ignore)
        if ignore != []:
            logger.info(f'Are ignored: {ignore}')

    def verify_expected_subset_actual(self, actual, expected):
        """Verify that expected result is a subset of actual result"""
        logger.info(f'Actual result: {actual}')
        logger.info(f'Expected result: {expected}')
        assert_that(actual).is_subset_of(expected)

    def verify_not_contain_value(self, actual, value):
        """Verify that the actual result does not have a specific value"""
        logger.info(f'Actual result: {actual}')
        logger.info(f'The deleted page is: {value}')
        for element in actual:
            assert_that(element).does_not_contain_value(value)

    def verify_value_not_empty(self, value):
        """Verify that the actual result does not have a specific value"""
        logger.info(f'The password is: {value}')
        assert_that(value).is_not_empty()

    def verify_schema(self, response_json):
        """Verify that the json response has a valid schema"""
        with open(r'wordpress/resources/json/get_page_schema.json') as f:
            expected_schema = json.load(f)
        assert validate(expected_schema, response_json) is None
        logger.info(f'Json schema: {expected_schema}')
        logger.info(f'Json response: {response_json}')
