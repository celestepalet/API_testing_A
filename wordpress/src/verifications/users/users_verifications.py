from robot.api import logger
from assertpy import assert_that


class UsersVerification:
    """Validates a request response"""

    def verify_actual_axpected_result(self, actual, expected, ignore=[]):
        """Verify that expected and actual results are equal"""
        assert_that(actual).is_equal_to(expected, ignore=ignore)
        logger.info(f'Actual result: {actual}')
        logger.info(f'Expected result: {expected}')
        if ignore != []:
            logger.info(f'Are ignored: {ignore}')
