*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Resource     get_users.robot

*** Variables ***
${endpoint}     users

*** Keywords ***
Delete New User Created
    Run Keyword If   '${id_user}'!='None'  Get User For Reassign
    ${params}=   Run Keyword If   '${id_user}'!='None'    Create Dictionary    reassign=${id_reassign}    force=true
    ${response}=   Run Keyword If   '${id_user}'!='None'   get_request_response   delete   ${endpoint}   params=${params}   id=${id_user}
    Run Keyword If   '${id_user}'!='None'   Set Test Variable  ${response}

Verify That User Is Not Displayed In Users List
    ${actual_result}   get_request_response   get   ${endpoint}
    verify_not_contain_value    ${actual_result}    ${id_user}
    ${expected_result}  get_list_element   0   ${actual_result}

Delete User By ID
    [Arguments]  ${id_user}   ${status}=200
    Get User For Reassign
    ${params}=   Run Keyword If   '${status}'=='200'   Create Dictionary   reassign=${id_reassign}    force=true
    ${response}=   get_request_response   delete   ${endpoint}   params=${params}   id=${id_user}   exp_status=${status}
    Set Test Variable  ${response}
    Run Keyword If   '${status}'=='200'   verify_schema   ${response}
