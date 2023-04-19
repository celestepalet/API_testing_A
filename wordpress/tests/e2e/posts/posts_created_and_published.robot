*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries

*** Variables ***
${endpoint}     posts

*** Test Cases ***
Verify that a post was deleted successfully
    Get credentials
    Create and publish a post   201

*** Keywords ***
Get credentials
    ${auth}   Get basic auth
    Set global variable  ${auth}

Create and publish a post
    [Arguments]   ${exp_status}
    ${body}    Create dictionary    title=new post title    status=publish
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}
    Log    ${response_with_format}

