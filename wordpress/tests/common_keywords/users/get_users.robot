*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification

*** Variables ***
${endpoint}     users

*** Keywords ***
Get User For Reassign
    ${params}    Create Dictionary    orderby=id
    ${response}   get_request_response   get   ${endpoint}   params=${params}
    ${first_user}   get_list_element    0   ${response}
    ${id_reassign}  get_dictionary_value    id  ${first_user}
    Set Suite variable  ${id_reassign}

Get User With Invalid ID
    [Arguments]  ${user_id}
    ${actual_result}   get_request_response   get   ${endpoint}   id=${user_id}   exp_status=404
    Set Test Variable  ${actual_result}

Get User Data
    ${role}   random_role
    ${username}   random_username
    ${email}   random_email
    Set Test Variable   ${role}
    Set Test Variable   ${username}
    Set Test Variable   ${email}

Select random username
    ${username}   random_username
    [Return]  ${username}

Select random email
    ${email}   random_email
    [Return]  ${email}

Select random password
    ${password}   random_password
    [Return]  ${password}

Verify Response Message
    [Arguments]   ${actual}   ${expected}
    verify_actual_equal_expected   ${actual}  ${expected}
