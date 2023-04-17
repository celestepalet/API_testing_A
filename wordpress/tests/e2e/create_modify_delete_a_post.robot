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
    Update post title   200   ${id_post}

*** Keywords ***
Get credentials
    ${auth}   Get Basic Auth
    set global variable  ${auth}

Post a Post
    [Arguments]   ${exp_status}
    ${post_endpoint}    Get post endpoint
    ${body}    Create Dictionary    title=new post title 1   status=publish
    ${response}   Make Request Post    ${post_endpoint}   body=${body}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log    ${response_with_format}

Update post title
    [Arguments]   ${exp_status}   ${id_post}
    ${post_endpoint}    Get post endpoint
    ${body}    Create dictionary    title=titulo de prueba   content=
    ${response}   Make request put    ${post_endpoint}   body=${body}   id=${id_post}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}
