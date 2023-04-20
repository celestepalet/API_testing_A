*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
#Variables      ../../../resources/config/create_body.yaml
Variables      ../../../resources/config/create_body_data.py

*** Variables ***
${endpoint}     contacts

*** Test Cases ***
Verify crud sendinblue
    Get credentials
    Create Contact   201
    Verify Created User     ${create_body}
    Update contact   204    ${contact_id}
    Verify updated User     ${create_body}
    Delete contact   204    ${contact_id}
    Verify delete user

*** Keywords ***
Get credentials
    ${apikey}   Get apikey auth
    ${header}   Create Dictionary    api-key=${apikey}
    Set global variable  ${header}

Create contact
    [Arguments]   ${exp_status}
    ${response}   Make request post    ${endpoint}   body=${create_body}   header=${header}
    ${response_with_format_json}    Get format response    ${response}  format_json
    log     ${response_with_format_json}
    ${contact_id}   Get dictionary value   id  ${response_with_format_json}
    Set global variable  ${contact_id}
    Validate response status  ${response}   exp_status=${exp_status}
    Log    ${response_with_format_json}

Verify Created User
    [Arguments]    ${expected_result}
    ${response}  Make Request Get    ${endpoint}     id=${contact_id}    header=${header}
    Validate response status  ${response}   exp_status=200
    ${actual_result}    Get format response    ${response}  format_json
    Log    ${expected_result}
    Log    ${actual_result}
    ${ignore}   Create List    ext_id   id  createdAt   modifiedAt   statistics   listIds   updateEnabled
    verify_actual_expected_result_ok   ${actual_result}    ${expected_result}   ${ignore}


Update contact
    [Arguments]   ${exp_status}   ${id_page}
    ${response}   Make request put    ${endpoint}   body=${change_data}   id=${id_page}   header=${header}
    Validate response status  ${response}   exp_status=${exp_status}

Verify updated User
    [Arguments]    ${expected_result}
    ${expected_result}   Get dictionary value   attributes  ${expected_result}
    ${response}  Make Request Get    ${endpoint}     id=${contact_id}    header=${header}
    Validate response status  ${response}   exp_status=200
    ${actual_result}    Get format response    ${response}  format_json
    ${actual_result}   Get dictionary value   attributes  ${actual_result}
    Log    ${expected_result}
    Log    ${actual_result}
    verify_actual_expected_result_not_ok   ${actual_result}    ${expected_result}


Delete contact
    [Arguments]   ${exp_status}   ${id_page}
    ${response}   Make request delete    ${endpoint}   id=${id_page}   header=${header}
    Validate response status  ${response}   exp_status=${exp_status}

Verify delete user
    ${response}  Make Request Get    ${endpoint}     id=${contact_id}    header=${header}
    Validate response status  ${response}   exp_status=404
