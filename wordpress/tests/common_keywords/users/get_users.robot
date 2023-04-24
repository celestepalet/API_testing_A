*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification

*** Variables ***
${endpoint}     users

*** Keywords ***
Get User For Reassign
    ${params}    Create Dictionary    orderby=id
    ${response}   get_request_response   get   ${endpoint}/me   params=${params}
    ${id_reassign}  get_dictionary_value    id  ${response}
    Set Suite variable  ${id_reassign}

Get User With Invalid ID
    [Arguments]  ${user_id}
    ${actual_result}   get_request_response   get   ${endpoint}   id=${user_id}   exp_status=404
    [Return]  ${actual_result}

Verify Response Message
    [Arguments]   ${actual}   ${expected}
    ${actual_message}=   get_dictionary_value   message   ${actual}
    verify_actual_equal_expected   ${actual_message}  ${expected}

Verify Response
    [Arguments]  ${expected_result}   ${element_to_verify}
    Log   ${element_to_verify}
    ${params}=   Create Dictionary   context=edit
    ${actual_result}=   get_request_response   get   ${endpoint}    params=${params}  id=${id_user}
    verify_actual_equal_expected   ${actual_result}   ${expected_result}

Get ID From User
    [Arguments]  ${response}
    ${id_user}=   get_dictionary_value  id   ${response}
    Set Test Variable   ${id_user}

Set Password Username And Email For Users Creation
    ${password}=   random_password
    ${email}=   random_email
    ${username}=   random_username
    Set Test Variable   ${password}
    Set Test Variable   ${email}
    Set Test Variable   ${username}

Get ID From New User
    [Arguments]   ${role}
    Set Password Username And Email For Users Creation
    ${body}=   Create Dictionary   username=${username}   email=${email}   roles=${role}  password=${password}
    ${response}=   Create New User   ${body}
    Verify That New User Was Created  ${response}
    [Return]   ${id_user}
