*** Settings ***
Documentation  Tests to verify that users with different roles can be created successfully
...            and the API returns a status code 200 and the user record.
Resource       ../../common_keywords/users/users.robot

Suite Setup  Get user for reassign

*** Test Cases ***
Verify that a administrator user can be created successfully
    Create a new user   administrator
    Verify the status code    201
    Verify that the user exists


Verify that a editor user can be created successfully
    Create a new user   editor
    Verify the status code    201
    Verify that the user exists

Verify that a contributor user can be created successfully
    Create a new user   contributor
    Verify the status code    201
    Verify that the user exists

Verify that a author user can be created successfully
    Create a new user   author
    Verify the status code    201
    Verify that the user exists

Verify that a subscriber user can be created successfully
    Create a new user   subscriber
    Verify the status code    201
    Verify that the user exists


