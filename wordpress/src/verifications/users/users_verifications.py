from robot.api import logger
from assertpy import assert_that


class UsersVerification:
    """Validates a request response"""

    def verify_actual_equal_expected(self, actual, expected, ignore=[]):
        """Verify that expected and actual results are equal"""
        assert_that(actual).is_equal_to(expected, ignore=ignore)
        logger.info(f'Actual result: {actual}')
        logger.info(f'Expected result: {expected}')
        if ignore != []:
            logger.info(f'Are ignored: {ignore}')

    def verify_expected_subset_actual(self, actual, expected):
        """Verify that expected result is a subset of actual result"""
        assert_that(actual).is_subset_of(expected)
        logger.info(f'Actual result: {actual}')
        logger.info(f'Expected result: {expected}')

    def verify_not_contain_value(self, actual, value):
        """Verify that the actual result does not have a specific value"""
        for element in actual:
            assert_that(element).does_not_contain_value(value)
        logger.info(f'Actual result: {actual}')
        logger.info(f'The deleted user id: {value}')

    def verify_value_edited(self, actual, actual_value, old, old_value):
        """Verify that the actual result does not have a specific value"""
        logger.info(f'The past email: {old_value}')
        logger.info(f'The actual email: {old_value}')
        logger.info(f'Past result: {actual}')
        logger.info(f'Actual result: {actual}')
        assert_that(actual).does_not_contain_value(old)
        assert_that(actual).contains_value(actual_value)




