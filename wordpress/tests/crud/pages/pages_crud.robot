*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries

*** Variables ***
${endpoint}     pages

*** Test Cases ***
Verify crud pages
    Get credentials
    Verify pages can be listed   200
    Verify new page can be created   201
    Verify page can be retrieved   200
    Verify page can be updated     200    ${id_page}
    Verify page can be deleted  200   ${id_page}


*** Keywords ***
Get credentials
    ${auth}   Get basic auth
    Set global variable  ${auth}

Verify new page can be created
    [Arguments]   ${exp_status}
    ${body}    Create dictionary    title=new page 1    content=it is the new page    status=publish
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log    ${response_with_format}

Verify pages can be listed
    [Arguments]   ${exp_status}
    ${response}   Make request get  ${endpoint}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response   ${response}   format_json
    Log    ${response_with_format}

Verify page can be retrieved
    [Arguments]   ${exp_status}
    ${response}   Make request get  ${endpoint}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response   ${response}   format_json
    Log    ${response_with_format}
    ${first_post}   Get list element    0   ${response_with_format}
    ${id_page}  Get dictionary value    id  ${first_post}
    Set global variable    ${id_page}

Verify page can be updated
    [Arguments]   ${exp_status}   ${id_page}
    ${body}    Create dictionary    title=title changed    content=content changed
    ${response}   Make request put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}

Verify page can be deleted
    [Arguments]   ${exp_status}   ${id_page}
    ${response}   Make request delete    ${endpoint}   id=${id_page}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}
