*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Library      wordpress.src.actions.users.random_elements.RandomElements
Resource     get_users.robot
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

Create User With Email
    [Arguments]  ${email}   ${role}   ${status}=201
    Log  ${email}
    ${username}=  random_username
    ${body}=   Create Dictionary   username=${username}   email=${email}   roles=${role}  password=${password}
    ${response}=   Create New User   ${body}   ${status}
    Run Keyword If  '${status}'=='201'  Verify That New User Was Created  ${response}
    [Return]  ${response}

Create User With Username
    [Arguments]  ${username}   ${role}   ${status}=201
    Log  ${username}
    ${body}=   Create Dictionary   username=${username}   email=${email}   roles=${role}  password=${password}
    ${response}=   Create New User   ${body}   ${status}
    Run Keyword If  '${status}'=='201'  Verify That New User Was Created  ${response}
    [Return]  ${response}

Create User Without A Element
    [Arguments]   ${body}  ${status}=201
    ${actual_result}=   get_request_response   post   ${endpoint}   body=${body}   exp_status=${status}
    [Return]   ${actual_result}
