*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Resource     ../get_credentials.robot
Variables    ../../../resources/config/responses.yaml


*** Variables ***
${endpoint}     comments

*** Keywords ***

Create A New Comment
    [Arguments]    ${content}    ${post_id}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    author=1   content=${content}     post=${post_id}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status    ${response}   exp_status=201
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}
    ${comment_id}=    get_dictionary_value    id    ${response_with_format}
    [Return]    ${comment_id}

Create A New Comment From Parent
    [Arguments]    ${content}    ${post_id}    ${parent_id}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    author=1   content=${content}     post=${post_id}    parent=${parent_id}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status    ${response}   exp_status=201
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}
    ${comment_id}=    get_dictionary_value    id    ${response_with_format}
    [Return]    ${comment_id}

Create A New Comment Without Content
    [Arguments]    ${post_id}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    author=1     post=${post_id}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status    ${response}   exp_status=400
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}
    [Return]    ${response_with_format}

Create A New Comment Without Post
    [Arguments]    ${content}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    author=1     content=${content}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status    ${response}   exp_status=403
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}
    [Return]    ${response_with_format}

Get Comment With ID
    [Arguments]    ${comment_id}
    ${auth}=    Get Credentials
    ${response}    make_request_get    ${endpoint}    id=${comment_id}    auth=${auth}
    validate_response_status  ${response}   exp_status=200
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}
    [Return]    ${response_with_format}

Get Comments With Params
    [Arguments]    ${params}
    ${auth}=    Get Credentials
    ${response}    make_request_get    ${endpoint}    params=${params}    auth=${auth}
    validate_response_status  ${response}   exp_status=200
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}
    [Return]    ${response_with_format}

Verify Comment Exists
    [Arguments]    ${comment_id}
    ${auth}=    Get Credentials
    ${response}    make_request_get    ${endpoint}    id=${comment_id}    auth=${auth}
    validate_response_status  ${response}   exp_status=200
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}

Edit Comment
    [Arguments]    ${content}    ${comment_id}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    content=${content}
    ${response}   make_request_post    ${endpoint}   id=${comment_id}    body=${body}   auth=${auth}
    validate_response_status    ${response}   exp_status=200
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}

Delete Comment
    [Arguments]    ${comment_id}
    ${auth}=    Get Credentials
    ${response}    make_request_delete    comments    id=${comment_id}    auth=${auth}
    validate_response_status  ${response}   exp_status=200
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}

Delete Comment Already Deleted
    [Arguments]    ${comment_id}
    ${auth}=    Get Credentials
    ${response}    make_request_delete    comments    id=${comment_id}    auth=${auth}
    validate_response_status  ${response}   exp_status=410
    ${response_with_format}   get_format_response    ${response}    format_json
    Log    ${response_with_format}

Get Comments With Filter Search
    [Arguments]    ${search}
    ${params}    Create Dictionary    search=${search}
    ${response_with_format}=    Get Comments With Params    ${params}
    Log    ${response_with_format}
    [Return]    ${response_with_format}

Get Comments With Filter Parent
    [Arguments]    ${parent_id}
    ${params}    Create Dictionary    parent=${parent_id}
    ${response_with_format}=    Get Comments With Params    ${params}
    Log    ${response_with_format}
    [Return]    ${response_with_format}

Get Comments With Filter Post
    [Arguments]    ${post_id}
    ${params}    Create Dictionary    post=${post_id}
    ${response_with_format}=    Get Comments With Params    ${params}
    Log    ${response_with_format}
    [Return]    ${response_with_format}

Verify Comment Is In Results
    [Arguments]    ${comment_id}    ${response}
    ${comment}=    Get Comment With ID    ${comment_id}
    validate_content    ${comment}    ${response}

Verify Comment Is Not In Results
    [Arguments]    ${comment_id}    ${response}
    ${comment}=    Get Comment With ID    ${comment_id}
    validate_content_not   ${comment}    ${response}

Create A Post For A Comment
    ${auth}=       Get Credentials
    ${body}        Create Dictionary    title=Post to test comments    status=publish
    ${response}    make_request_post    posts    body=${body}    auth=${auth}
    validate_response_status    ${response}    exp_status=201
    ${response_with_format}    get_format_response    ${response}    format_json
    Log    ${response_with_format}
    ${post_id}    get_dictionary_value    id     ${response with format}
    Set Suite Variable  ${post_id}

Delete Post Created For The Comment
    ${auth}=       Get Credentials
    ${response}   make_request_delete    posts    id=${post_id}   auth=${auth}
    validate_response_status    ${response}    exp_status=200
    ${response_with_format}   get_format_response    ${response}    format_json
    Log   ${response_with_format}

Create A Different Post For A Comment
    ${auth}=       Get Credentials
    ${body}        Create Dictionary    title=A different post to test comments    status=publish
    ${response}    make_request_post    posts    body=${body}    auth=${auth}
    validate_response_status    ${response}    exp_status=201
    ${response_with_format}    get_format_response    ${response}    format_json
    Log    ${response_with_format}
    ${post_id}    get_dictionary_value    id     ${response with format}
    [Return]    ${post_id}

Delete Post
    [Arguments]    ${post_id}
    ${auth}=       Get Credentials
    ${response}   make_request_delete    posts    id=${post_id}   auth=${auth}
    validate_response_status    ${response}    exp_status=200
    ${response_with_format}   get_format_response    ${response}    format_json
    Log   ${response_with_format}

Verify Response Message
    [Arguments]  ${expected_result}    ${actual_result}
    verify_actual_equal_expected   ${actual_result}  ${expected_result}