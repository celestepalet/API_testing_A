*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries

Test Setup  Create a post for comment   201     posts

*** Variables ***
${endpoint}     comments

*** Test Cases ***
Test CRUD comments
    Get credentials
    Post a comment    201
    Get comment id    200
    Update comment content    200    ${id_comment}
    Move comment to trash    200    ${id_comment}

*** Keywords ***
Get credentials
    ${auth}   Get basic auth
    Set global variable  ${auth}

Post a comment
    [Arguments]   ${exp_status}
    ${body}    Create dictionary    author=1   content=This is a new comment on the post     post=${id_post}
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log    ${response_with_format}

Get comment id
    [Arguments]   ${exp_status}
    ${response}   Make request get  ${endpoint}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response   ${response}   format_json
    ${first_post}   Get list element    0   ${response_with_format}
    ${id_comment}  Get dictionary value    id  ${first_post}
    Set global variable    ${id_comment}

Update comment content
    [Arguments]   ${exp_status}   ${id_comment}
    ${body}    Create dictionary    post=${id_post}    content=content edited in the new comment
    ${response}   Make request post    ${endpoint}   body=${body}   id=${id_comment}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}

Move comment to trash
    [Arguments]   ${exp_status}   ${id_comment}
    ${response}   Make request delete    ${endpoint}   id=${id_comment}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}

Create a post for comment
    [Arguments]   ${exp_status}   ${endpoint}
    Get credentials
    ${body}    Create dictionary    title=post for test comments   status=publish
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log    ${response_with_format}
    ${id_post}  Get dictionary value    id  ${response with format}
    set suite variable  ${id_post}
