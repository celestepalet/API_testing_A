*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.pages.pages_verifications.PagesVerification
Variables    ../../../wordpress/resources/data/pages/variables.py

*** Variables ***
${endpoint}     pages

*** Keywords ***
Update Author With Bad Info
    [Arguments]    ${author}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed   author=${author}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}   exp_status=400
    Set Test Variable  ${expected_result}

Verify Author Error Info
    Log    ${expected_result}
    Log    ${bad_author_response}
    verify_actual_equal_expected   ${expected_result}   ${bad_author_response}

Update Ping Status In Page With Bad Info
    [Arguments]    ${ping_status}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed   ping_status=${ping_status}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}   exp_status=400
    Set Test Variable  ${expected_result}

Verify Ping Status Error Info
    Log    ${expected_result}
    Log    ${bad_author_response}
    verify_actual_equal_expected   ${expected_result}   ${bad_ping_status_response}

Update Comment Status In Page With Bad Info
    [Arguments]    ${comment_status}
    ${auth}   Get basic auth
    ${body}    Create Dictionary    title=title changed    content=content changed   comment_status=${comment_status}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_page}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    validate_response_status  ${response}   exp_status=400
    Log   ${expected_result}
    Set Test Variable  ${expected_result}

Verify Comment Status Error Info
    Log    ${expected_result}
    Log    ${bad_author_response}
    verify_actual_equal_expected   ${expected_result}   ${bad_comment_status_response}

Verify Delete Error Info
    Log    ${expected_result}
    Log    ${bad_author_response}
    verify_actual_equal_expected   ${expected_result}   ${delete_same_page}
    