from robot.api import logger
from assertpy import assert_that
from jsonschema import validate
import json


class PostsVerification:
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
        logger.info(f'The deleted user id: {value}')
        for element in actual:
            assert_that(element).does_not_contain_value(value)

    def verify_value_edited(self, actual, actual_value, old, old_value):
        """Verify that the actual result does not have a specific value"""
        logger.info(f'The past email: {old_value}')
        logger.info(f'The actual email: {actual_value}')
        logger.info(f'Past result: {old}')
        logger.info(f'Actual result: {actual}')
        assert_that(actual).does_not_contain_value(old)
        assert_that(actual).contains_value(actual_value)

    def verify_delete_schema(self, role, response_json):
        """Verify that the json response has a valid schema when delete suer"""
        if role == 'administrator':
            with open(r'wordpress/resources/json/users/delete_administrator_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'contributor':
            with open(r'wordpress/resources/json/users/delete_contributor_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'author':
            with open(r'wordpress/resources/json/users/delete_author_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'editor':
            with open(r'wordpress/resources/json/users/delete_editor_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'subscriber':
            with open(r'wordpress/resources/json/users/delete_subscriber_schema.json') as f:
                expected_schema = json.load(f)
        assert validate(response_json, expected_schema) == None
        logger.info(f'Json schema: {expected_schema}')
        logger.info(f'Json response: {response_json}')

    def verify_create_schema(self, role, response_json):
        """Verify that the json response has a valid schema when create user"""
        if role == 'administrator':
            with open(r'wordpress/resources/json/users/create_administrator_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'contributor':
            with open(r'wordpress/resources/json/users/create_contributor_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'author':
            with open(r'wordpress/resources/json/users/create_author_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'editor':
            with open(r'wordpress/resources/json/users/create_editor_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'subscriber':
            with open(r'wordpress/resources/json/users/create_subscriber_schema.json') as f:
                expected_schema = json.load(f)
        assert validate(response_json, expected_schema) == None
        logger.info(f'Json schema: {expected_schema}')
        logger.info(f'Json response: {response_json}')

    def verify_modify_schema(self, role, response_json):
        """Verify that the json response has a valid schema when modify user data"""
        if role == 'administrator':
            with open(r'wordpress/resources/json/users/create_administrator_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'contributor':
            with open(r'wordpress/resources/json/users/create_contributor_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'author':
            with open(r'wordpress/resources/json/users/create_author_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'editor':
            with open(r'wordpress/resources/json/users/create_editor_schema.json') as f:
                expected_schema = json.load(f)
        if role == 'subscriber':
            with open(r'wordpress/resources/json/users/create_subscriber_schema.json') as f:
                expected_schema = json.load(f)
        assert validate(response_json, expected_schema) == None
        logger.info(f'Json schema: {expected_schema}')
        logger.info(f'Json response: {response_json}')
