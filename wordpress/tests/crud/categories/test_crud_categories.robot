*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries

*** Variables ***
${endpoint}     categories

*** Test Cases ***
Verify CRUD categories
    Get credentials
    Get all categories    200
    Create a category   201
    Get a category with id   200
    Update category description   200    ${id_category}
#    Delete a category   200    ${id_category}

*** Keywords ***
Get credentials
    ${auth}   Get basic auth
    Set global variable  ${auth}

Create a category
    [Arguments]   ${exp_status}
    ${body}    Create dictionary    name=random category
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log    ${response_with_format}
    ${id_category}=  Get dictionary value    id  ${response_with_format}
    Set global variable    ${id_category}

Get all categories
    [Arguments]   ${exp_status}
    ${response}   Make request get  ${endpoint}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response   ${response}   format_json

Get a category with id
    [Arguments]   ${exp_status}
    ${response}   Make request get  ${endpoint}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response   ${response}   format_json
    ${first_category}   Get list element    0   ${response_with_format}
    ${id_category}  Get dictionary value    id  ${first_category}
    Set global variable    ${id_category}

Update category description
    [Arguments]   ${exp_status}   ${id_category}
    ${body}    Create dictionary    description=description updated
    ${response}   Make request put    ${endpoint}   body=${body}   id=${id_category}   auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}

Delete a category
    [Arguments]   ${exp_status}   ${id_category}
    ${params}    Create dictionary    force=true
    ${response}   Make request delete    ${endpoint}   id=${id_category}   params=${params}    auth=${auth}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response  ${response}  format_json
    Log   ${response_with_format}