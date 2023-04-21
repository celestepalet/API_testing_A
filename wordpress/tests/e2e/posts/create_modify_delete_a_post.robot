*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Resource     ../../common_keywords/get_credentials.robot

*** Variables ***
${endpoint}     posts

*** Test Cases ***
Verify that a post was deleted successfully
    Post a post   201
    Get post id   200
    Update post title   200   ${id_post}
    Move post to trash    200    ${id_post}

*** Keywords ***
Post a post
    [Arguments]   ${exp_status}
    ${auth}    Get Credentials
    ${body}    Create dictionary    title=new post title 1   status=publish
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}=   get_format_response  ${response}  format_json
    Log    ${response_with_format}

Get post id
    [Arguments]   ${exp_status}
    ${auth}    Get Credentials
    ${response}   Make request get  ${endpoint}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response   ${response}   format_json
    ${first_post}   Get list element    0   ${response_with_format}
    ${id_post}  Get dictionary value    id  ${first_post}
    set test variable    ${id_post}

Update post title
    [Arguments]   ${exp_status}   ${id_post}
    ${auth}    Get Credentials
    ${body}    Create dictionary    title=change test title   content=
    ${response}   Make request put    ${endpoint}   body=${body}   id=${id_post}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}

Move post to trash
    [Arguments]    ${exp_status}    ${id_post}
    ${auth}    Get Credentials
    ${response}    Make request delete    ${endpoint}    id=${id_post}    auth=${auth}
    Validate response status    ${response}    exp_status=${exp_status}
    ${response_with_format}    Get format response    ${response}    format_json
    Log   ${response_with_format}
