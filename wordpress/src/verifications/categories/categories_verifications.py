from robot.api import logger
from assertpy import assert_that
from jsonschema import validate
import json


class CategoriesVerification:
    """Validates a request response"""
    def verify_actual_equal_expected(self, actual_dictionary, expected_dictionary, ignore=[]):
        """Verify that expected and actual results are equal"""
        logger.info(f'Actual result: {actual_dictionary}')
        logger.info(f'Expected result: {expected_dictionary}')
        assert_that(actual_dictionary).is_equal_to(expected_dictionary, ignore=ignore)
        if ignore != []:
            logger.info(f'Are ignored: {ignore}')
