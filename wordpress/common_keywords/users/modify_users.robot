*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Resource     get_users.robot

*** Variables ***
${endpoint}     users

*** Keywords ***
Modify User
    [Arguments]  ${id_user}   ${body}   ${status}=200
    ${expected_result}   get_request_response   put   ${endpoint}   body=${body}   id=${id_user}   exp_status=${status}
    ${role}   Run Keyword If   '${status}'=='200'   get_dictionary_value   roles   ${expected_result}
    ${role}   Run Keyword If   '${status}'=='200'   get_list_element  0   ${role}
    Run Keyword If   '${status}'=='200'   verify_modify_schema   ${role}   ${expected_result}
    [Return]   ${expected_result}

Verify The User Has Been Modified
    [Arguments]  ${expected_result}
    ${actual_result}   get_request_response   get   ${endpoint}   id=${id_user}
    ${ignore}    Create List    username   first_name   last_name   email   locale    nickname   roles   registered_date   capabilities   extra_capabilities   meta
    verify_actual_equal_expected   ${actual_result}   ${expected_result}   ${ignore}

Modify User Name By ID
    [Arguments]  ${id_user}
    ${body}   Create Dictionary   name=modify username
    ${expected_result}=   Modify User   ${id_user}   ${body}
    [Return]   ${expected_result}
