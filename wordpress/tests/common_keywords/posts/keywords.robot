*** Settings ***
Resource    ../get_credentials.robot
Library    wordpress.src.verifications.users.users_verifications.UsersVerification    
*** Variables ***
${endpoint}    posts

*** Keywords ***
Create A Post In Wordpress And Verify Status Code 201
    [Arguments]
    ${auth}    Get Credentials
    ${title}    generate_random_title
    ${body}    Create Dictionary    title=${title}    status=publish
    ${response}    make_request_post    ${endpoint}    body=${body}    auth=${auth}
    ${actual_result}    get_format_response    ${response}
    Set Test Variable  ${actual_result}
    ${post_id}    get_dictionary_value    id    ${actual_result}
    Set Suite Variable    ${post_id}
    validate_response_status    ${response}    exp_status=201

Get The Post Id In Wordpress And Verify Status Code 200
    [Arguments]    ${post_id}
    ${auth}    Get Credentials
    ${ignore}    generate_ignore
    ${response}    make_request_get    ${endpoint}    auth=${auth}    id=${post_id}
    ${expected_result}    get_format_response    ${response}
    validate_response_status    ${response}
    verify_actual_equal_expected    actual=${actual_result}    expected=${expected_result}    ignore=${ignore}

Update The Title In A Post And Verify Status Code 200
    [Arguments]    ${post_id}
    ${auth}    Get Credentials
    ${title}    generate_random_title
    ${ignore}    generate_ignore
    ${body}    Create Dictionary    title=${title}
    ${response_update}    make_request_put    ${endpoint}    body=${body}    id=${post_id}    auth=${auth}
    validate_response_status    ${response_update}
    ${actual_result}    get_format_response    ${response_update}
    ${response_get}    make_request_get    ${endpoint}    auth=${auth}    id=${post_id}
    ${expected_result}    get_format_response    ${response_get}
    verify_actual_equal_expected    actual=${actual_result}    expected=${expected_result}    ignore=${ignore}

Delete A Post In Wordpress And Verify Status Code 200
    [Arguments]    ${post_id}
    ${auth}    Get Credentials
    ${response}    make_request_delete    ${endpoint}    ${post_id}    auth=${auth}
    validate_response_status    ${response}
    Log    ${response} 

#E2E
Create A Post
    [Arguments]    ${body}
    ${auth}    Get Credentials
    ${response}    make_request_post    ${endpoint}    body=${body}    auth=${auth}
    validate_response_status    ${response}    exp_status=201
    ${actual_result}    get_format_response    ${response}
    Set Global Variable    ${actual_result}
    ${post_id}    get_dictionary_value    id     ${actual_result}
    Set Global Variable    ${post_id}
    validate_response_status    ${response}    exp_status=201

Create A Post And Save it on drafts
    ${title}    generate_random_title
    ${content}    generate_random_content
    ${body}    Create Dictionary    title=${title}    status=draft    content=${content}
    Create A Post    ${body} 

Create A Published Post
    ${title}    generate_random_title
    ${content}    generate_random_content
    ${body}    Create Dictionary    title=${title}    status=publish    content=${content}
    Create A Post    ${body} 

Create A Private Post
    ${title}    generate_random_title
    ${content}    generate_random_content
    ${body}    Create Dictionary    title=${title}    status=private    content=${content}
    Create A Post    ${body} 

Get The Post Id
    [Arguments]    ${post_id}
    ${auth}    Get Credentials
    ${ignore}    generate_ignore
    ${response}    make_request_get    ${endpoint}    auth=${auth}    id=${post_id}
    ${expected_result}    get_format_response    ${response}
    validate_response_status    ${response}
    verify_actual_equal_expected    actual=${actual_result}    expected=${expected_result}    ignore=${ignore}

Update A Post
    [Arguments]    ${post_id}    ${body}
    ${auth}    Get Credentials
    ${ignore}    generate_ignore
    ${response_update}    make_request_put    ${endpoint}    body=${body}    id=${post_id}    auth=${auth}
    validate_response_status    ${response_update}
    ${actual_result}    get_format_response    ${response_update}
    ${response_get}    make_request_get    ${endpoint}    auth=${auth}    id=${post_id}
    ${expected_result}    get_format_response    ${response_get}
    verify_actual_equal_expected    actual=${actual_result}    expected=${expected_result}    ignore=${ignore}

Update The Post Status To Published
    [Arguments]    ${post_id}
    ${title}    generate_random_title
    ${body}    Create Dictionary    title=${title}    status=publish
    Update A Post    ${post_id}    ${body}    

Update The Post Status to Draft
    [Arguments]    ${post_id}
    ${title}    generate_random_title
    ${body}    Create Dictionary    title=${title}    status=draft
    Update A Post    ${post_id}    ${body}

Update The Post Status to Private
    [Arguments]    ${post_id}
    ${title}    generate_random_title
    ${body}    Create Dictionary    title=${title}    status=private
    Update A Post    ${post_id}    ${body}

Update The Content In A Post
    [Arguments]    ${post_id}
    ${content}    generate_random_content
    ${body}    Create Dictionary    content=${content}
    Update A Post    ${post_id}    ${body}

Update The Slug In A Post
    [Arguments]    ${post_id}
    ${slug}    generate_random_slug
    ${body}    Create Dictionary    slug=${slug}
    Update A Post    ${post_id}    ${body}

Update The Title In A Post
    [Arguments]    ${post_id}
    ${title}    generate_random_title
    ${body}    Create Dictionary    title=${title}
    Update A Post    ${post_id}    ${body}

Update A Post With 5000 Characters
    [Arguments]    ${post_id}
    ${chars}    generate_random_chars
    ${body}    Create Dictionary    title=${chars}
    Update A Post    ${post_id}    ${body}

