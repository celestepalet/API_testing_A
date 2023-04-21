*** Settings ***
Resource    ../get_credentials.robot

*** Variables ***
${endpoint}    posts

*** Keywords ***
Create A Post In Wordpress And Verify Status Code 201

    [Arguments]
    ${auth}    Get Credentials
    ${body}    Create Dictionary    title=new post title3    status=publish
    ${response}    make_request_post    ${endpoint}    body=${body}    auth=${auth}
    validate_response_status    ${response}    exp_status=201
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
    Set Suite Variable    ${post_id}
    Log    ${actual_result}

Update The Title In A Post And Verify Status Code 200
    [Arguments]    ${post_id}
    ${auth}    Get Credentials
    ${body}    Create Dictionary    title=New title updated
    ${response}    make_request_put    ${endpoint}    body=${body}    id=${post_id}    auth=${auth}
    validate_response_status    ${response}
    Log    ${response}

Delete A Post In Wordpress And Verify Status Code 200
    [Arguments]    ${post_id}
    ${auth}    Get Credentials
    ${response}    make_request_delete    ${endpoint}    ${post_id}    auth=${auth}
    validate_response_status    ${response}
    Log    ${response} 

#
Create A Post
    [Arguments]    ${body}
    ${auth}    Get Credentials
    ${response}    make_request_post    ${endpoint}    body=${body}    auth=${auth}
    ${response_with_format_json}    get_format_response    ${response}    format_json
    ${post_id}    Get Dictionary Value    id     ${response_with_format_json}
    Set Global Variable    ${post_id}
    validate_response_status    ${response}    exp_status=201

Create A Post And Save it on drafts
    ${body}    Create Dictionary    title=new post title3    status=draft    content=Content added
    Create A Post    ${body} 

Get The Post Id
    [Arguments]    ${post_id}
    ${auth}    Get Credentials
    ${response}    make_request_get    ${endpoint}    auth=${auth}
    validate_response_status    ${response}

Create A Published Post
    ${body}    Create Dictionary    title=new post title3    status=publish    content=Content added
    Create A Post    ${body} 

Create A Private Post
    ${body}    Create Dictionary    title=new post title3    status=private    content=Content added
    Create A Post    ${body}    

Update A Post
    [Arguments]    ${post_id}    ${body}
    ${auth}    Get Credentials
    ${response}    make_request_put    ${endpoint}    body=${body}    id=${post_id}    auth=${auth}
    validate_response_status    ${response}

Update The Post Status To Published
    [Arguments]    ${post_id}
    ${body}    Create Dictionary    title=new post title3    status=publish
    Update A Post    ${post_id}    ${body}    

Update The Post Status to Draft
    [Arguments]    ${post_id}
    ${body}    Create Dictionary    title=new post title3    status=draft
    Update A Post    ${post_id}    ${body}

Update The Post Status to Private
    [Arguments]    ${post_id}
    ${body}    Create Dictionary    title=new post title3    status=private
    Update A Post    ${post_id}    ${body}

Update The Content In A Post
    [Arguments]    ${post_id}
    ${body}    Create Dictionary    title=new post title3    content=content updated
    Update A Post    ${post_id}    ${body}

Update The Slug In A Post
    [Arguments]    ${post_id}
    ${body}    Create Dictionary    title=new post title3    slug=gfjri245
    Update A Post    ${post_id}    ${body}

Verify The Updated Post
    [Arguments]    ${post_id}
    ${auth}    Get credentials
    ${response}    make_request_get    ${endpoint}    id=${post_id}    auth=${auth}
    validate_response_status    ${response}

Update A Post With Any Character
    [Arguments]    ${post_id}
    ${body_name}    generate_random_string
    ${body}    Create Dictionary    title=${body_name}
    Update A Post    ${post_id}    ${body}
