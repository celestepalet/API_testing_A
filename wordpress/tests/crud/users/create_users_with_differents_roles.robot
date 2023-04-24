*** Settings ***
Documentation  Tests to verify that users with different roles can be created successfully
...            and the API returns a status code 201 and the user record.
Resource       ../../common_keywords/users/users_imports.robot

Test Setup  Set Password Username And Email For Users Creation
Test Teardown  Delete New User Created

*** Test Cases ***
Verify That New User Can Be Created Whit The Administrator Role
    ${response}=   Create New User With role    administrator
    Verify That New User Was Created    expected_result=${response}

Verify That New User Can Be Created Whit The Editor Role
    ${response}=   Create New User With role    editor
    Verify That New User Was Created    expected_result=${response}

Verify That New User Can Be Created Whit The Contributor Role
    ${response}=   Create New User With role    contributor
    Verify That New User Was Created    expected_result=${response}

Verify That New User Can Be Created Whit The Author Role
    ${response}=   Create New User With role    author
    Verify That New User Was Created    expected_result=${response}

Verify That New User Can Be Created Whit The Subscriber Role
    ${response}=   Create New User With role    subscriber
    Verify That New User Was Created    expected_result=${response}

*** Keywords ***
Create New User With role
    [Arguments]  ${role}
    ${body}=   Create Dictionary   username=${username}   email=${email}   roles=${role}  password=${password}
    ${response}=   Create New User   ${body}
    [Return]  ${response}
