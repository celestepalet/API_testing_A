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
    Get post id  200
    Log     ${id_post}

*** Keywords ***
Get credentials
    ${auth}   Get Basic Auth
    set global variable  ${auth}

Get post id
    [Arguments]   ${exp_status}
    ${post_endpoint}    get post endpoint
    ${response}   Make Request Get  ${post_endpoint}   auth=${auth}
    validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   get format response   ${response}   format_json
    ${first_post}   Get List Element    0   ${response_with_format}
    ${id_post}  Get Dictionary Value    id  ${first_post}
    Set Global Variable    ${id_post}

