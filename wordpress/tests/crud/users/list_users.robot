*** Settings ***
Documentation  Tests to verify that is possible to list one or all the users
Resource       ../../common_keywords/users/users.robot

*** Test Cases ***
Verify that lists all users returns a status code 200
    Get all user
    Verify the status code    200
    Show response

Verify that lists a user returns a status code 200
    Get a user  1
    Verify the status code    200
    Show response

*** Keywords ***
Show response
    Log   ${result}
