*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Variables    ../../../resources/config/responses.yaml

*** Variables ***
${endpoint}     users

*** Keywords ***
Create New User
    [Arguments]   ${body}   ${status}=201
    ${response}=   get_request_response   post   ${endpoint}   body=${body}   exp_status=${status}
    Run Keyword If  '${status}'=='201'   Get ID From User  ${response}
    Run Keyword If  '${status}'=='201'  Set Test Variable  ${id_user}
    [Return]   ${response}

Verify That New User Was Created
    [Arguments]  ${expected_result}
    ${actual_result}   get_request_response   get   ${endpoint}   id=${id_user}
    ${ignore}    Create List    username   first_name   last_name   email   locale    nickname   roles   registered_date   capabilities   extra_capabilities   meta
    verify_actual_equal_expected   ${actual_result}   ${expected_result}   ${ignore}

Get ID From User
    [Arguments]  ${response}
    ${id_user}   get_dictionary_value  id   ${response}
    Set test Variable   ${id_user}

Set Password Username And Email For Users Creation
    ${password}=  Select Random Password
    ${email}=   Select Random Email
    ${username}=   Select Random Username
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

Create User With Email
    [Arguments]  ${email}   ${role}   ${status}=201
    ${username}=  Select Random Username
    ${body}=   Create Dictionary   username=${username}   email=${email}   roles=${role}  password=${password}
    ${response}=   Create New User   ${body}   ${status}
    Run Keyword If  '${status}'=='201'  Verify That New User Was Created  ${response}
    [Return]  ${response}
