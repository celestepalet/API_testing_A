*** Settings ***
Documentation  Tests to verify scenarios that creates more than one user
...            whit data repeted.
Resource       ../../common_keywords/users/users_imports.robot

Test Teardown  Delete New User Created

*** Test Cases ***
Verify That Can Not Be Changed The Username Of A Administrator After Create It
    ${id_user}=   Get ID From New User   role=administrator
    ${message}=   Modify User Whit A Different Username   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${username_not_editable}

Verify That Can Be Changed The Email Of A User After Create It
    Create User To Edit
    Change Email Of The Used Created
    Verify That Emial Has Been Modified

Verify That Can Not Be Changed The Email Of A User After Create It If The Email Bellow To Other User
    Create User To Edit
    Change Email Of The Used Created By One Already Used
    Verify The Response Message    ${invalid_email}

*** Keywords ***
Modify User Whit A Different Username
    [Arguments]   ${id_user}   ${status}
    ${username}=   random_username
    ${body}=   Create Dictionary   username=${username}
    ${response}   Modify User   ${id_user}   ${body}   ${status}
    [Return]   ${response}

Create User To Edit
    Set Password Username And Email For Users Creation
    ${body}=   Create Dictionary   username=${username}   email=${email}   roles=administrator  password=${password}
    Create New User   ${body}

Change Username Of The Used Created
    ${username}   random_username
    ${body}   Create Dictionary   username=${username}
    ${error_message}   get_request_response   put   ${endpoint}   body=${body}   id=${id_user}   exp_status=400
    Set Test Variable  ${error_message}

Change Email Of The Used Created
    ${new_email}   random_email
    ${body}   Create Dictionary   email=${new_email}
    ${actual_result}   Modify User  ${id_user}   ${body}
    Set Test Variable   ${new_email}
    Set Test Variable   ${actual_result}

Verify That Emial Has Been Modified
    verify_value_edited   ${actual_result}   ${new_email}   ${expected_result}   ${email}

Verify The Response Message
    [Arguments]  ${expected_result}
    verify_actual_equal_expected   ${error_message}  ${expected_result}

Change Email Of The Used Created By One Already Used
    Get Email In Use
    ${body}   Create Dictionary   email=${used_email}
    ${error_message}   get_request_response   put   ${endpoint}   body=${body}   id=${id_user}   exp_status=400
    Set Test Variable  ${error_message}
    Delete User By ID   ${used_id}

Get Email In Use
    Get User Data
    ${body}   Create Dictionary   username=${username}   email=${email}   roles=${role}   password=password
    ${expected_result}   get_request_response   post   ${endpoint}   body=${body}   exp_status=201
    ${used_id}  get_dictionary_value   id   ${expected_result}
    ${used_email}  get_dictionary_value   email   ${expected_result}
    Set Test Variable  ${used_id}
    Set Test Variable  ${used_email}
