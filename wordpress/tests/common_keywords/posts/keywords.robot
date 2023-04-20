*** Settings ***
Resource    ../get_credentials.robot

*** Variables ***
${endpoint}    posts

*** Keywords ***
Create A Post In Wordpress And Verify Status Code 201
    [Arguments]    ${exp_status}
    ${auth}    Get Credentials
    ${body}    Create Dictionary    title=new post title3    status=publish
    ${response}    make_request_post    ${endpoint}    body=${body}    auth=${auth}
    validate_response_status    ${response}    exp_status=${exp_status}
    ${expected_result}    get_format_response    ${response}    format_json
    Set Test Variable  ${expected_result}
    Log    ${expected_result}
    
Get The Post Id In Wordpress And Verify Status Code 200
    [Arguments]
    ${auth}    Get Credentials
    ${response}    make_request_get    ${endpoint}    auth=${auth}
    validate_response_status    ${response}
    ${actual_result}    get_format_response    ${response}    format_json
    ${post_created}    get_list_element    0    ${actual_result}
    ${id_post}    get_dictionary_value    id    ${post_created}
    Set Suite Variable    ${id_post}
    Log    ${actual_result}

Update The Title In A Post And Verify Status Code 200
    [Arguments]    ${id_post}
    ${auth}    Get Credentials
    ${body}    Create Dictionary    title=New title updated
    ${response}    make_request_put    ${endpoint}    body=${body}    id=${id_post}    auth=${auth}
    validate_response_status    ${response}
    ${response_with_format}    get_format_response    ${response}    format_json
    Log    ${response_with_format}

Delete A Post In Wordpress And Verify Status Code 200
    [Arguments]    ${id_post}
    ${auth}    Get Credentials
    ${response}    make_request_delete    ${endpoint}    ${id_post}    auth=${auth}
    validate_response_status    ${response}
    ${response_with_format}    get_format_response    ${response}    format_json
    Log    ${response_with_format} 
