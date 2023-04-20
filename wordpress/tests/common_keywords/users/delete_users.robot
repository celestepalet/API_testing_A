*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Resource     get_users.robot

*** Variables ***
${endpoint}     users

*** Keywords ***
Delete New User Created
    ${auth}   get_basic_auth
    Get User For Reassign
    ${params}    Create Dictionary    reassign=${id_reassign}    force=true
    ${response}   make_request_delete    ${endpoint}   id=${id_user}   auth=${auth}   params=${params}
    validate_response_status   ${response}   exp_status=200
    ${response}   get_format_response  ${response}
    Set Test Variable  ${response}

Delete User By ID
    [Arguments]  ${id_user}
    Delete New User Created

Verify That User Is Not Displayed In Users List
    ${auth}   get_basic_auth
    ${response}   make_request_get    ${endpoint}   auth=${auth}
    validate_response_status  ${response}
    ${actual_result}   get_format_response   ${response}
    verify_not_contain_value    ${actual_result}    ${id_user}
