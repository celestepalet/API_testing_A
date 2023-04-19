*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Variables      ../../../resources/config/create_body.yaml

*** Variables ***
${endpoint}     contacts

*** Test Cases ***
Verify crud sendinblue
    Get credentials
    Create Contact   201
    Contact Details  200
    Update contact   204    ${contact_id}
    Delete contact   204    ${contact_id}

*** Keywords ***
Get credentials
    ${apikey}   Get apikey auth
    log  ${apikey}
    ${header}   Create Dictionary    api-key=${apikey}
    Set global variable  ${header}

Create contact
    [Arguments]   ${exp_status}
    ${response}   Make request post    ${endpoint}   body=${create_body}   header=${header}
    ${response_with_format_json}    Get format response    ${response}  format_json
    ${contact_id}   Get dictionary value   id  ${response_with_format_json}
    Set global variable  ${response}
    Set global variable  ${contact_id}
    Validate response status  ${response}   exp_status=${exp_status}
    Log    ${response_with_format_json}

Contact details
    [Arguments]   ${exp_status}
    ${response}   Make request get  ${endpoint}   id=${contact_id}   header=${header}
    Validate response status  ${response}   exp_status=${exp_status}
    ${response_with_format}   Get format response   ${response}   format_json

Update contact
    [Arguments]   ${exp_status}   ${id_page}
    ${body}    Create dictionary    FIRSTNAME=Fabio   LASTNAME=Ramirez  email=fabio_ramirez@gmail.com
    ${response}   Make request put    ${endpoint}   body=${body}   id=${id_page}   header=${header}
    Validate response status  ${response}   exp_status=${exp_status}
    #${response_with_format_json}    Get format response    ${response}  format_json
    #Log   ${response_with_format_json}

Delete contact
    [Arguments]   ${exp_status}   ${id_page}
    ${response}   Make request delete    ${endpoint}   id=${id_page}   header=${header}
    Validate response status  ${response}   exp_status=${exp_status}
    #${response_with_format}   Get format response  ${response}  format_json
    #Log   ${response_with_format}
