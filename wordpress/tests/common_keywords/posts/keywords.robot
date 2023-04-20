*** Settings ***
Resource     ../get_credentials.robot

*** Variables ***
${endpoint}    posts

*** Keywords ***
Create a post
    [Arguments]    ${exp_status}
    ${auth}=    Get Credentials
    ${body}    Create dictionary    title=new post title3    status=publish
    ${response}    Make request post    ${endpoint}    body=${body}    auth=${auth}
    Validate response status    ${response}    exp_status=${exp_status}
    ${response_with_format}    Get format response    ${response}    format_text
    Log    ${response_with_format}
    
Get a post id
    [Arguments]    ${exp_status}
    ${auth}=    Get Credentials
    ${response}    Make request get    ${endpoint}    auth=${auth}
    Validate response status    ${response}    exp_status=${exp_status}
    ${response_with_format}    Get format response    ${response}    format_json
    ${post_created}    Get list element    0    ${response_with_format}
    ${id_post}    Get dictionary value    id    ${post_created}
    Set suite variable    ${id_post}
    Log    ${response_with_format}

Delete a post
    [Arguments]    ${exp_status}    ${id_post}
    ${auth}=    Get Credentials
    ${response}    Make request delete    ${endpoint}    ${id_post}    auth=${auth}
    Validate response status    ${response}    exp_status=${exp_status}
    ${response_with_format}    Get format response    ${response}    format_json
    Log    ${response_with_format} 
