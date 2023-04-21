*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification

*** Variables ***
${endpoint}     users
${email}        apitesters.at19@apitesting.com
${username}     at19_teamA

*** Keywords ***
Create New User
    [Arguments]   ${role}
    ${body}   Create Dictionary   username=${username}   email=${email}   roles=${role}   password=password
    ${expected_result}   get_request_response   post   ${endpoint}   body=${body}   exp_status=201
    ${id_user}  get_dictionary_value   id   ${expected_result}
    Set Test Variable  ${expected_result}
    Set Test Variable  ${id_user}

Verify That New User Was Crated
    ${actual_result}   get_request_response   get   ${endpoint}   id=${id_user}
    ${ignore}    Create List    username   first_name   last_name   email   locale    nickname   roles   registered_date   capabilities   extra_capabilities   meta
    verify_actual_equal_expected   ${actual_result}   ${expected_result}   ${ignore}

Get ID From New User
    Create New Administrator User
    [Return]   ${id_user}

Create New Administrator User
    Create New User     administrator

Create New Editor User
    Create New User     editor

Create New Contributor User
    Create New User     contributor

Create New Author User
    Create New User     author

Create New Subscriber User
    Create New User     subscriber
