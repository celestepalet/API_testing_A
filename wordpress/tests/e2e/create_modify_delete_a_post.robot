*** Settings ***
Resource    ../../resources/imports/common_imports.robot


*** Test Cases ***
Verify that a post was deleted successfully
    Get credentials
    Post a post   201
    Get post id   200
    Update post title   200   ${id_post}

*** Keywords ***
Get credentials
    ${auth}   Get basic auth
    Set global variable  ${auth}

Post a post
    [Arguments]   ${exp_status}
    ${post_endpoint}    Get post endpoint
    ${body}    Create Dictionary    title=new post title 1   status=publish
    ${response}   Make Request Post    ${post_endpoint}   body=${body}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log    ${response_with_format}

Get post id
    [Arguments]   ${exp_status}
    ${post_endpoint}    Get post endpoint
    ${response}   Make Request Get  ${post_endpoint}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response   ${response}   format_json
    ${first_post}   Get list element    0   ${response_with_format}
    ${id_post}  Get dictionary value    id  ${first_post}
    Set global variable    ${id_post}

Update post title
    [Arguments]   ${exp_status}   ${id_post}
    ${post_endpoint}    Get post endpoint
    ${body}    Create dictionary    title=change test title   content=
    ${response}   Make request put    ${post_endpoint}   body=${body}   id=${id_post}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}
