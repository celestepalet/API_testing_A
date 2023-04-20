*** Settings ***
Documentation  Tests to verify that send invalid data to the endpoint no returns a status code
...            2xx and returns differents messages
Library        wordpress.src.common_imports.CommonLibraries
Library        wordpress.src.verifications.users.users_verifications.UsersVerification
Variables      ../../../resources/config/responses.yaml
Resource       ../../common_keywords/users/get_users.robot

*** Variables ***
${endpoint}     users
${email}   apitesters.at19@apitesting.com
${password}     password
${invalid_id}   1!

*** Test Cases ***
Verify That Can Not Be Created User Without Username
    Create User Without Username
    Verify Response Message   ${no_username_response}

Verify That Can Not Be Created User Without Email
    Create User Without Email
    Verify Response Message    ${no_email_response}

Verify That Can Not Be Created User Without Passowrd
    Create User Without Password
    Verify Response Message    ${no_password_response}

Verify That Invalid Endpoint Returns Error Message
    Get User With Invalid ID    ${invalid_id}
    Verify Response Message    ${not_found}

Verify That Can Not Be Created User With Duplicate Username
    Create User With Duplicate Username
    Verify Response Message    ${username_existing}

*** Keywords ***
Create User Without Username
    ${auth}   get_basic_auth
    ${body}    Create Dictionary   email=${email}   password=${password}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status   ${response}   exp_status=400
    ${actual_result}   get_format_response  ${response}
    Set Test Variable  ${actual_result}

Create User Without Email
    ${auth}   get_basic_auth
    ${body}    Create Dictionary   username=username   password=${password}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status   ${response}   exp_status=400
    ${actual_result}   get_format_response  ${response}
    Set Test Variable  ${actual_result}

Create User Without Password
    ${auth}   get_basic_auth
    ${body}    Create Dictionary   username=username   email=${email}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status   ${response}   exp_status=400
    ${actual_result}   get_format_response  ${response}
    Set Test Variable  ${actual_result}

Create User With Duplicate Username
    ${auth}   get_basic_auth
    Get Administrator Username
    ${body}    Create Dictionary    username=${username}   email=${email}   password=${password}
    ${response}   make_request_post   ${endpoint}   body=${body}   auth=${auth}
    validate_response_status   ${response}   exp_status=500
    ${actual_result}   get_format_response  ${response}
    Set suite variable   ${actual_result}

Verify Response Message
    [Arguments]  ${expected_result}
    verify_actual_equal_expected   ${actual_result}  ${expected_result}
