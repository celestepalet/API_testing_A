*** Settings ***
Documentation  Tests to verify scenarios that creates more than one user
...            whit differents roels and data repeted.
Resource       ../../common_keywords/users/users_imports.robot

Test Setup  Set Password Username And Email For Users Creation
Test Teardown  Delete New User Created

*** Test Cases ***
Verify That Can Not Be Created Two Administrator Users Whit Same Email
    Create User With Email  ${email}   role=administrator
    ${message}=   Create User With Email  ${email}   role=administrator   status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Administrator Users Whit Same Username
    Create User With Username  ${username}   role=administrator
    ${message}=   Create User With Username  ${username}   role=administrator   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

Verify That Can Not Be Created Two Editor Users Whit Same Email
    Create User With Email  ${email}   role=editor
    ${message}=   Create User With Email  ${email}   role=editor  status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Editor Users Whit Same Username
    Create User With Username  ${username}   role=editor
    ${message}=   Create User With Username  ${username}   role=editor   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

Verify That Can Not Be Created Two Subscriber Users Whit Same Email
    Create User With Email  ${email}   role=subscriber
    ${message}=   Create User With Email  ${email}   role=subscriber  status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Subscriber Users Whit Same Username
    Create User With Username  ${username}   role=subscriber
    ${message}=   Create User With Username  ${username}   role=subscriber   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

Verify That Can Not Be Created Two Author Users Whit Same Email
    Create User With Email  ${email}   role=author
    ${message}=   Create User With Email  ${email}   role=author   status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Author Users Whit Same Username
    Create User With Username  ${username}   role=author
    ${message}=   Create User With Username  ${username}   role=author   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

Verify That Can Not Be Created Two Contributor Users Whit Same Email
    Create User With Email  ${email}   role=contributor
    ${message}=   Create User With Email  ${email}   role=contributor   status=500
    Verify Response Message    actual=${message}    expected=${email_existing}

Verify That Can Not Be Created Two Contributor Users Whit Same Username
    Create User With Username  ${username}   role=contributor
    ${message}=   Create User With Username  ${username}   role=contributor   status=500
    Verify Response Message    actual=${message}    expected=${username_existing}

*** Keywords ***
Create User With Username
    [Arguments]  ${username}   ${role}   ${status}=201
    ${email}=  Select Random Email
    ${body}=   Create Dictionary   username=${username}   email=${email}   roles=${role}  password=${password}
    ${response}=   Create New User   ${body}   ${status}
    Run Keyword If  '${status}'=='201'  Verify That New User Was Created  ${response}
    [Return]  ${response}
