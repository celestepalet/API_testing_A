*** Settings ***
Documentation  Tests to verify scenarios that creates more than one user
...            whit data repeted.
Resource       ../../common_keywords/users/users_imports.robot

Test Teardown  Delete New User Created

*** Test Cases ***
Verify That Can Not Be Created Two Users Whit Same Email
    Create Firts User
    Verify That New User Was Crated
    Create Second User With Same Email That Firts
    Verify Response Message    ${email_existing}

Verify That Can Not Be Created Two Users Whit Same Username
    Create Firts user
    Verify That New User Was Crated
    Create Second User With Same Username That Firts
    Verify Response Message    ${username_existing}

*** Keywords ***
Create Firts User
    ${role}   random_role
    Create New User   ${role}

Create Second User With Same Email That Firts
    ${email}   get_dictionary_value    email  ${expected_result}
    ${role}   random_role
    ${body}   Create Dictionary   username=other_username   email=${email}   roles=${role}   password=password
    ${error_message}   get_request_response   post   ${endpoint}   body=${body}   exp_status=500
    Set Test Variable  ${error_message}

Create Second User With Same Username That Firts
    ${username}   get_dictionary_value    username  ${expected_result}
    ${role}   random_role
    ${body}   Create Dictionary   username=${username}   email=api.at19@apitesting.com   roles=${role}   password=password
    ${error_message}   get_request_response   post   ${endpoint}   body=${body}   exp_status=500
    Set Test Variable  ${error_message}

Verify Response Message
    [Arguments]  ${expected_result}
    verify_actual_equal_expected   ${error_message}  ${expected_result}