*** Settings ***
Documentation  Tests to verify that the user information can be updated
...            and the API return a status code 200
Resource       ../../common_keywords/users/users.robot

Suite Setup  Create a new user   administrator
Test Teardown  Delete user  ${id_user}

*** Test Cases ***
Verify that a specific user record can be upload and returns a status code 200
    Set information to modify
    Modify user information  ${id_user}  ${body}
    Verify the status code    200
    Verify that the user was updated   ${id_user}   ${result}

*** Keywords ***
Set information to modify
    ${body}    Create dictionary    name=name_modificated
    Set suite variable   ${body}
