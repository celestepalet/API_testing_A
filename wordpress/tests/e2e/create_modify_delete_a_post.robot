*** Settings ***
Library     libraries.validation.Validation
Library     libraries.format_response.FormatResponse
Library     libraries.make_request.MakeRequest
Library     libraries.authentication.Authentication
Library     wordpress.resources.config.config
Library     libraries.get_element.GetElement


*** Test Cases ***
Verify that a post was deleted successfully
    Get credentials
    Update post title   200   ${id_post}

*** Keywords ***
Get credentials
    ${auth}   Get basic auth
    Set global variable  ${auth}

Update post title
    [Arguments]   ${exp_status}   ${id_post}
    ${post_endpoint}    Get post endpoint
    ${body}    Create dictionary    title=titulo de prueba   content=
    ${response}   Make request put    ${post_endpoint}   body=${body}   id=${id_post}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}

Get post id
    [Arguments]   ${exp_status}
    ${post_endpoint}    get post endpoint
    ${response}   Make Request Get  ${post_endpoint}   auth=${auth}
    validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   get format response   ${response}   format_json
    ${first_post}   Get List Element    0   ${response_with_format}
    ${id_post}  Get Dictionary Value    id  ${first_post}
    Set Global Variable    ${id_post}
