from robot.api import logger
from assertpy import assert_that


class UsersVerification:
    """Validates a request response"""

    def verify_actual_expected_result_ok(self, actual, expected, ignore=[]):
        """Verify that expected and actual results are equal"""
        assert_that(actual).is_equal_to(expected, ignore=ignore)
        logger.info(f'Actual result: {actual}')
        logger.info(f'Expected result: {expected}')
        if ignore != []:
            logger.info(f'Are ignored: {ignore}')

    def verify_actual_expected_result_not_ok(self, actual, expected):
        """Verify that expected and actual results are equal"""
        assert_that(actual).is_not_equal_to(expected)
        logger.info(f'Actual result: {actual}')
        logger.info(f'Expected result: {expected}')
