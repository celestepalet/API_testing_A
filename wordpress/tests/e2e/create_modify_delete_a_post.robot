*** Settings ***
Library     libraries.validation.Validation
Library     libraries.format_response.FormatResponse
Library     libraries.make_request.MakeRequest
Library     libraries.authentication.Authentication
Library     wordpress.resources.config.config


*** Test Cases ***
Verify that a post was deleted successfully
    Get credentials
    Post a Post   201

*** Keywords ***
Get credentials
    ${auth}   Get Basic Auth
    set global variable  ${auth}

Post a Post
    [Arguments]   ${exp_status}
    ${post_endpoint}    Get post endpoint
    ${BODY}    Create Dictionary    title=new post title 1   status=publish
    ${response}   Make Request Post    ${post_endpoint}   body=${BODY}   auth=${auth}
    validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   get format response  ${response}  format_json
    log    ${response_with_format}
