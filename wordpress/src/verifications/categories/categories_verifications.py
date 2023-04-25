from robot.api import logger
from assertpy import assert_that
from jsonschema import validate
import json


class CategoriesVerification:
    """Validates a request response"""

    def verify_actual_equal_expected(self, actual, expected, ignore=[]):
        """Verify that expected and actual results are equal"""
        logger.info(f'Actual result: {actual}')
        logger.info(f'Expected result: {expected}')
        assert_that(actual).is_equal_to(expected, ignore=ignore)
        if ignore != []:
            logger.info(f'Are ignored: {ignore}')
