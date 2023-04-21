*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Variables    ../../../wordpress/resources/data/pages/variables.py

*** Variables ***
${endpoint}     pages

*** Keywords ***
List Pages
    ${auth}   Get basic auth
    ${response}   make_request_get  ${endpoint}   auth=${auth}
    ${actual_result}   get_format_response   ${response}
    validate_response_status  ${response}
    Set Test Variable  ${actual_result}

Create Page
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=new page 1    content=it is the new page    status=publish
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_page}  get_dictionary_value   id   ${expected_result}
    validate_response_status  ${response}   exp_status=201
    Set Test Variable  ${expected_result}
    Set Suite Variable  ${id_page}
    Log  ${id_page}

Verify Page
    ${auth}   Get basic auth
    ${response}   make_request_get  ${endpoint}  id=${id_page}  auth=${auth}
    ${actual_result}   get_format_response  ${response}
    validate_response_status  ${response}
    Log    ${expected_result}
    Log    ${actual_result}
    verify_actual_equal_expected   ${expected_result}   ${actual_result}   ${ignore}

Update Page
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}
    Set Test Variable  ${expected_result}

Delete Page
    ${auth}   Get basic auth
    ${response}   make_request_delete    ${endpoint}   id=${id_page}   auth=${auth}
    ${response_with_format}   get_format_response  ${response}
    validate_response_status  ${response}
    Log   ${response_with_format}

Verify Deleted Page
    List Pages
    verify_not_contain_value    ${actual_result}    ${id_page}
