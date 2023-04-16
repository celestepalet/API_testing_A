*** Settings ***
Library  libraries.validation.Validation
Library  libraries.format_response.FormatResponse
Library  libraries.make_request.MakeRequest


*** Test Cases ***
PUT request valid endpoint
    Make Put Request   200   214

PUT request invalid endpoint
    Make Put Request   404   ''


*** Keywords ***
Make Put Request
    [Arguments]   ${exp_status}   ${id}
    ${BODY}    Create Dictionary    id=214   title=titulo de prueba   content=
    ${response}   Make Request Put  wp-json/wp/v2/posts   ${BODY}   id=${id}
    validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   get format response  ${response}  format_json
    log   ${response_with_format}
