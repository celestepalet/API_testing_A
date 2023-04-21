*** Settings ***
Documentation  Tests to verify that send invalid data to the endpoint no returns a status code
...            2xx and returns differents messages
Resource       ../../common_keywords/users/users_imports.robot

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

*** Keywords ***
Create User Without Username
    ${body}=    Create Dictionary   email=${email}   password=${password}
    ${actual_result}=   get_request_response   post   ${endpoint}   body=${body}   exp_status=400
    Set Test Variable  ${actual_result}

Create User Without Email
    ${body}=    Create Dictionary   username=username   password=${password}
    ${actual_result}=   get_request_response   post   ${endpoint}   body=${body}   exp_status=400
    Set Test Variable  ${actual_result}

Create User Without Password
    ${body}=    Create Dictionary   username=username   email=${email}
    ${actual_result}=   get_request_response   post   ${endpoint}   body=${body}   exp_status=400
    Set Test Variable  ${actual_result}

Verify Response Message
    [Arguments]  ${expected_result}=
    verify_actual_equal_expected   ${actual_result}  ${expected_result}
