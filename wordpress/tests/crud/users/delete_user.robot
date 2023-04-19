*** Settings ***
Documentation  Tests to verify that the user can be deleted
...            and the API return a status code 200
Resource       ../../common_keywords/users/users.robot
Variables      ../../../resources/config/responses.yaml

Suite Setup  Create a new user   administrator

*** Test Cases ***
Verify that a specific user can be deleted and returns a status code 200
    Delete user  ${id_user}
    Verify the status code    200
    Get a user   ${id_user}
    Verify response message   ${invalid_id_message}



