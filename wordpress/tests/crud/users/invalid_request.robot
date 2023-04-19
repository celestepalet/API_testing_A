*** Settings ***
Documentation  Tests to verify that send invalid data to the endpoint no returns a status code
...            2xx and returns differents messages
Resource       ../../common_keywords/users/users.robot
Resource       ../../common_keywords/get_credentials.robot
Library        wordpress.src.common_imports.CommonLibraries
Variables      ../../../resources/config/responses.yaml

*** Variables ***
${endpoint}     users
${email}   apitesters.at19@gmail.com
${password}     password
${second_email}   user.reassing@gmail.com

*** Test Cases ***
Verify that create a user without username returns a status code 400
    Create a user without username
    Verify the status code    400
    Verify response message   ${no_username_response}

Verify that create a user without email returns a status code 400
    Create a user without email
    Verify the status code    400
    Verify response message   ${no_email_response}

Verify taht create a user without password returns a status code 400
    Create a user without password
    Verify the status code    400
    Verify response message   ${no_password_response}

Verify that a invalid id in the endpoint returns a satus code 404
    Get a user  1!
    Verify the status code    404
    Verify response message   ${not_found}

Verify that create a user with username duplicated returns a status code 500
    Create a user with a duplicate username
    Verify the status code    500
    Verify response message   ${username_existing}


*** Keywords ***
Create a user without username
    Get credentials
    ${body}    Create dictionary   email=${email}   password=${password}
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    ${result}   Get format response  ${response}  format_json
    Set suite variable  ${response}
    Set suite variable  ${result}

Create a user without email
    Get credentials
    ${body}    Create dictionary   username=username   password=${password}
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    ${result}   Get format response  ${response}  format_json
    Set suite variable  ${response}
    Set suite variable  ${result}

Create a user without password
    Get credentials
    ${body}    Create dictionary   username=username   email=${email}
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    ${result}   Get format response  ${response}  format_json
    Set suite variable  ${response}
    Set suite variable  ${result}

Create a user with a duplicate username
    Get credentials
    Get a user  1
    ${username}  Get dictionary value    name  ${result}
    ${body}    Create dictionary    username=${username}   email=${email}   password=${password}
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    ${result}   Get format response  ${response}  format_json
    Set suite variable  ${response}
    Set suite variable  ${result}








