*** Settings ***
Resource    common_imports.robot

Suite Setup   Get a post id    200
Test Teardown    Delete a post    200    ${id_post}
*** Variables ***
${endpoint}    posts

*** Test Cases ***
Update a the title in a post
    Update the title in a post    200    ${id_post}

*** Keywords ***
Update the title in a post
    [Arguments]    ${exp_status}    ${id_post}
    ${body}    Create dictionary    title=New title updated
    ${response}    Make request put    ${endpoint}    body=${body}    id=${id_post}    auth=${auth}
    Validate response status    ${response}    exp_status=${exp_status}
    ${response_with_format}    Get format response    ${response}    format_json
    Log    ${response_with_format}
