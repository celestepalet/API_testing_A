*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Resource     get_users.robot

*** Variables ***
${endpoint}     users

*** Keywords ***
Delete New User Created
    Get User For Reassign
    ${params}    Create Dictionary    reassign=${id_reassign}    force=true
    ${response}   get_request_response   delete   ${endpoint}   params=${params}   id=${id_user}
    Set Test Variable  ${response}

Verify That User Is Not Displayed In Users List
    ${actual_result}   get_request_response   get   ${endpoint}
    verify_not_contain_value    ${actual_result}    ${id_user}

Delete User By ID
    [Arguments]  ${id_user}
    Get User For Reassign
    ${params}    Create Dictionary    reassign=${id_reassign}    force=true
    ${response}   get_request_response   delete   ${endpoint}   params=${params}   id=${id_user}
    Set Test Variable  ${response}
