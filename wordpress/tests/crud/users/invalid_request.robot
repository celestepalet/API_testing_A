*** Settings ***
Documentation  Tests to verify that send invalid data to the endpoint no returns a status code
...            2xx and returns differents messages
Resource       ../../common_keywords/users/users_imports.robot

*** Variables ***
${endpoint}     users
${email}   apitesters.at19@apitesting.com
${password}     password
${invalid_id}   1!

*** Test Cases ***
Verify That Can Not Be Created User Without Username
    ${response}=   Create User Without A Element   ${body_no_username}   status=400
    Verify Response Message   ${response}   ${no_username_message}

Verify That Can Not Be Created User Without Email
    ${response}=   Create User Without A Element   ${body_no_email}   status=400
    Verify Response Message   ${response}    ${no_email_message}

Verify That Can Not Be Created User Without Passowrd
    ${response}=   Create User Without A Element   ${body_no_password}   status=400
    Verify Response Message   ${response}    ${no_password_message}

Verify That Invalid Endpoint Returns Error Message
    ${response}=   Get User With Invalid ID    ${invalid_id}
    Verify Response Message   ${response}    ${not_found}
