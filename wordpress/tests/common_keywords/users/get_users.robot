*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Resource     ../get_credentials.robot

*** Variables ***
${endpoint}     users

*** Keywords ***
Get User For Reassign
    ${auth}=    get_basic_auth
    ${response}   make_request_get    ${endpoint}   auth=${auth}
    validate_response_status   ${response}
    ${response}   get_format_response  ${response}
    ${first_user}   get_list_element    0   ${response}
    ${id_reassign}  get_dictionary_value    id  ${first_user}
    Set Suite variable  ${id_reassign}

Get User With Invalid ID
    [Arguments]  ${user_id}
    ${auth}=    get_basic_auth
    ${response}   make_request_get    ${endpoint}   auth=${auth}   id=${user_id}
    validate_response_status   ${response}   exp_status=404
    ${actual_result}   get_format_response  ${response}
    Set Test Variable  ${actual_result}

Get Administrator Username
    ${auth}=    get_basic_auth
    ${response}   make_request_get    ${endpoint}   auth=${auth}
    validate_response_status   ${response}
    ${response}   get_format_response  ${response}
    ${first_user}   get_list_element    0   ${response}
    ${username}  get_dictionary_value    name  ${first_user}
    Set Test variable  ${username}
