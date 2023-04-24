*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.actions.pages.random_methods.RandomMethods
Library      wordpress.src.verifications.pages.pages_verifications.PagesVerification
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
    ${body}    Create Dictionary   title=title page   status=publish
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_page}  get_dictionary_value   id   ${expected_result}
    validate_response_status  ${response}   exp_status=201
    Set Test Variable  ${expected_result}
    Set Suite Variable  ${id_page}
    Log  ${id_page}

Create Page With Desired Status
    [Arguments]    ${status}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    status=${status}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_page}  get_dictionary_value   id   ${expected_result}
    validate_response_status  ${response}   exp_status=201
    verify_schema   ${expected_result}
    Set Test Variable  ${expected_result}
    Set Test Variable  ${id_page}
    Log  ${id_page}

Create Page With Desired Ping Status
    [Arguments]    ${status}    ${ping_status}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    status=${status}    ping_status=${ping_status}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_page}  get_dictionary_value   id   ${expected_result}
    validate_response_status  ${response}   exp_status=201
    Set Test Variable  ${expected_result}
    Set Test Variable  ${id_page}
    Log  ${id_page}

Create Page With Desired Comment Status
    [Arguments]    ${status}    ${ping_status}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    status=${status}    comment_status=${ping_status}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_page}  get_dictionary_value   id   ${expected_result}
    validate_response_status  ${response}   exp_status=201
    Set Test Variable  ${expected_result}
    Set Test Variable  ${id_page}
    Log  ${id_page}

Verify Page
    ${auth}   Get basic auth
    ${response}   make_request_get  ${endpoint}  id=${id_page}  auth=${auth}
    ${actual_result}   get_format_response  ${response}
    validate_response_status  ${response}
    Log    ${expected_result}
    Log    ${actual_result}
    verify_actual_equal_expected   ${expected_result}   ${actual_result}   ${ignore}

Verify The Page Changes The Status
    Verify Page

Verify The Page Was Created
    Verify Page

Update Page To Other Status
    [Arguments]    ${status}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    status=${status}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}
    Set Test Variable  ${expected_result}

Update Title And Content In Page
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}
    Set Test Variable  ${expected_result}

Update Password In Page
    ${password}     random_password
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed   password=${password}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}
    Set Test Variable  ${expected_result}

Update Ping Status In Page
    [Arguments]    ${ping_status}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed   ping_status=${ping_status}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}
    Set Test Variable  ${expected_result}

Update Comment Status In Page
    [Arguments]    ${comment_status}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed   comment_status=${comment_status}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}
    Set Test Variable  ${expected_result}

Validate Update Password
    ${value}    get_dictionary_value    password    ${expected_result}
    verify_value_not_empty  ${value}

Update Author
    [Arguments]    ${author}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed   author=${author}
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

Delete Page Again
    ${auth}   Get basic auth
    ${response}   make_request_delete    ${endpoint}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}   exp_status=410
    Set Test Variable    ${expected_result}

Verify Deleted Page
    List Pages
    verify_not_contain_value    ${actual_result}    ${id_page}
