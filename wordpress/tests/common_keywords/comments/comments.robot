*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Resource     ../get_credentials.robot

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


Create A Post For A Comment
    ${auth}=       Get Credentials
    ${body}        Create Dictionary    title=post for test comments    status=publish
    ${response}    make_request_post    posts    body=${body}    auth=${auth}
    validate_response_status    ${response}    exp_status=201
    ${response_with_format}    get_format_response    ${response}    format_json
    Log    ${response_with_format}
    ${post_id}    get_dictionary_value    id     ${response with format}
    Set Suite Variable  ${post_id}

Deleted Post Created For The Comment
    ${auth}=       Get Credentials
    ${response}   make_request_delete    posts    id=${post_id}   auth=${auth}
    validate_response_status    ${response}    exp_status=200
    ${response_with_format}   get_format_response    ${response}    format_json
    Log   ${response_with_format}
    