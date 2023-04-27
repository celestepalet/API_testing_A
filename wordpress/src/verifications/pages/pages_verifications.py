import json
import jsonschema
from robot.api import logger
from assertpy import assert_that, soft_assertions


class PagesVerification:
    """Validates a request response"""
    def verify_actual_equal_expected(self, actual_dictionary, expected_dictionary, ignore=[]):
        """Verify that expected and actual results are equal"""
        logger.info(f'Actual result: {actual_dictionary}')
        logger.info(f'Expected result: {expected_dictionary}')
        assert_that(actual_dictionary).is_equal_to(expected_dictionary, ignore=ignore)
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
        """Verify that a schema is the same that response"""
        with soft_assertions():
            with open(r'wordpress/resources/json/get_page_schema.json', 'r') as schema_file:
                expected_schema = json.load(schema_file)
            result = jsonschema.validate(response_json, expected_schema)
            logger.info(f'The schema is: {expected_schema}')
            logger.info(f'The response is: {response_json}')
            assert result is None
