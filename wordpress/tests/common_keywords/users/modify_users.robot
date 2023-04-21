*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Resource     get_users.robot

*** Variables ***
${endpoint}     users

*** Keywords ***
Modify User Name By ID
    [Arguments]  ${id_user}
    ${auth}   get_basic_auth
    ${body}   Create Dictionary   name=modify username
    ${response}   make_request_put  ${endpoint}   body=${body}   id=${id_user}   auth=${auth}
    validate_response_status   ${response}
    ${expected_result}   get_format_response  ${response}
    Set Test Variable  ${expected_result}

Verify The Contact Has Been Modified
    ${auth}   get_basic_auth
    ${response}   make_request_get   ${endpoint}   auth=${auth}    id=${id_user}
    validate_response_status    ${response}
    ${actual_result}   get_format_response   ${response}
    ${ignore}    Create List    username   first_name   last_name   email   locale    nickname   roles   registered_date   capabilities   extra_capabilities   meta
    verify_actual_equal_expected   ${actual_result}   ${expected_result}   ${ignore}
