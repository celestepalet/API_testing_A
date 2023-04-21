*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries

*** Variables ***
${endpoint}     pages

*** Test Cases ***
Verify Crud Pages
    Verify Pages Can Be Listed
    Verify New Page Can Be Created
    Verify Page Can Be Retrieved
    Verify Page Can Be Updated      ${id_page}
    Verify Page Can Be Deleted      ${id_page}


*** Keywords ***
Verify New Page Can Be Created
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=new page 1    content=it is the new page    status=publish
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status  ${response}   exp_status=201
    ${response_with_format}   get_format_response  ${response}  format_json
    Log    ${response_with_format}

Verify Pages Can Be Listed
    ${auth}   Get basic auth
    ${response}   make_request_get  ${endpoint}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response   ${response}   format_json
    Log    ${response_with_format}

Verify Page Can Be Retrieved
    ${auth}   Get basic auth
    ${response}   make_request_get  ${endpoint}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response   ${response}   format_json
    Log    ${response_with_format}
    ${first_post}   get_list_element    0   ${response_with_format}
    ${id_page}  get_dictionary_value    id  ${first_post}
    Set Global Variable    ${id_page}

Verify Page Can Be Updated
    [Arguments]   ${id_page}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response  ${response}  format_json
    Log   ${response_with_format}

Verify Page Can Be Deleted
    [Arguments]   ${id_page}
    ${auth}   Get basic auth
    ${response}   make_request_delete    ${endpoint}   id=${id_page}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response  ${response}  format_json
    Log   ${response_with_format}
