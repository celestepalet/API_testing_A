*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Variables      ../../../resources/config/create_body.yaml

*** Variables ***
${endpoint}     contacts

*** Test Cases ***
Verify crud sendinblue
    Get credentials
    Create Contact   201

*** Keywords ***
Get credentials
    ${apikey}   Get apikey auth
    log  ${apikey}
    ${header}   Create Dictionary    api-key=${apikey}
    Set global variable  ${header}

Create contact
    [Arguments]   ${exp_status}
    Get Credentials
    ${response}   Make request post    ${endpoint}   body=${create_body}   header=${header}
    ${response_with_format_json}    Get format response    ${response}  format_json
    ${contact_id}   Get dictionary value   id  ${response_with_format_json}
    Set global variable  ${response}
    Set global variable  ${contact_id}
    Validate response status  ${response}   exp_status=${exp_status}
    Log    ${response_with_format_json}
