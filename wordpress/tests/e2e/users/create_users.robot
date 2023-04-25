*** Settings ***
Documentation  Tests to verify scenarios that creates more than one user
...            whit differents roels and data repeted.
Resource       ../../common_keywords/users/users_imports.robot

Test Setup  Set Password Username And Email For Users Creation
Test Teardown  Delete New User Created

*** Variables ***
${id_user}  None

*** Test Cases ***
Verify That When Creating A User Receives Subscriber Role By Default
    ${expected_result}   Create User Without Role
    Verify That New User Was Created   subscriber   ${expected_result}

Verify That Can Not Be Ceated An User Without Username, Email Or Password
    ${response_no_username}=   Create User Without A Element   ${body_no_username}   status=400
    Verify Response Message   ${response_no_username}   ${no_username_message}
    ${response_no_email}=   Create User Without A Element   ${body_no_email}   status=400
    Verify Response Message   ${response_no_email}    ${no_email_message}
    ${response_no_password}=   Create User Without A Element   ${body_no_password}   status=400
    Verify Response Message   ${response_no_password}    ${no_password_message}

Verify That Can Not Be Created An Administrator With Special Character "+" In Username
    ${message}=   Create User With Username  ${username_invalid_characters}   role=administrator   status=400
    Verify Response Message    actual=${message}    expected=${invalid_parameter_username}

Verify That Can Not Be Created Two Administrator Users With Same Email
    Create User With Email  ${email}   role=administrator
    ${message}=   Create User With Email  ${email}   role=administrator   status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Administrator Users With Same Username
    Create User With Username  ${username}   role=administrator
    ${message}=   Create User With Username  ${username}   role=administrator   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

Verify That Can Not Be Created An Editor User With More Than 60 Characters In Username
    ${message}=   Create User With Username  ${username_61_characters}   role=editor   status=500
    Verify Response Message    actual=${message}    expected=${username_to_long}

Verify That Can Not Be Created Two Editor Users With Same Email
    Create User With Email  ${email}   role=editor
    ${message}=   Create User With Email  ${email}   role=editor  status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Editor Users With Same Username
    Create User With Username  ${username}   role=editor
    ${message}=   Create User With Username  ${username}   role=editor   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

Verify That Can Not Be Created A Subscriber User With More Than 60 Characters In Username
    ${message}=   Create User With Username  ${username_61_characters}   role=subscriber   status=500
    Verify Response Message    actual=${message}    expected=${username_to_long}

Verify That Can Not Be Created Two Subscriber Users With Same Email
    Create User With Email  ${email}   role=subscriber
    ${message}=   Create User With Email  ${email}   role=subscriber  status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Subscriber Users With Same Username
    Create User With Username  ${username}   role=subscriber
    ${message}=   Create User With Username  ${username}   role=subscriber   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

Verify That Can Not Be Created An Author User With More Than 60 Characters In Username
    ${message}=   Create User With Username  ${username_61_characters}   role=author   status=500
    Verify Response Message    actual=${message}    expected=${username_to_long}

Verify That Can Not Be Created Two Author Users With Same Email
    Create User With Email  ${email}   role=author
    ${message}=   Create User With Email  ${email}   role=author   status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Author Users With Same Username
    Create User With Username  ${username}   role=author
    ${message}=   Create User With Username  ${username}   role=author   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

Verify That Can Not Be Created An Contributor User With More Than 60 Characters In Username
    ${message}=   Create User With Username  ${username_61_characters}   role=contributor   status=500
    Verify Response Message    actual=${message}    expected=${username_to_long}

Verify That Can Not Be Created Two Contributor Users With Same Email
    Create User With Email  ${email}   role=contributor
    ${message}=   Create User With Email  ${email}   role=contributor   status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Contributor Users With Same Username
    Create User With Username  ${username}   role=contributor
    ${message}=   Create User With Username  ${username}   role=contributor   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

*** Keywords ***
Create User Without Role
    ${body}=   Create Dictionary   username=${username}   email=${email}   password=${password}
    ${response}=   Create New User    ${body}
    [Return]  ${response}
