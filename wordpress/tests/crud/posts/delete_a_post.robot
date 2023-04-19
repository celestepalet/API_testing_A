*** Settings ***
Resource    common_imports.robot

Suite Setup    Get a post id    200
Test Teardown    Create a post    201

*** Variables ***
${endpoint}    posts

*** Test Cases ***
Delete a post
    Delete a post    200    ${id_post}

*** Keywords ***
Delete a post
    [Arguments]    ${exp_status}    ${id_post}
    ${response}    Make request delete    ${endpoint}    ${id_post}    auth=${auth}
    Validate response status    ${response}    exp_status=${exp_status}
    ${response_with_format}    Get format response    ${response}    format_json
    Log    ${response_with_format} 