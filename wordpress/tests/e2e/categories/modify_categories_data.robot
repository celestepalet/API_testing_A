*** Settings ***
Documentation    Tests to verify that a comment can be created successfully 
...              and it appears on the list of results when correct filters
...              are used.
Resource         ../../common_keywords/categories/categories.robot
Variables        ../../../resources/config/responses.yaml
 
*** Test Cases ***
Verify That The Parent Category Parameter Of A Category Can Be Updated With An Allowed Value
    ${id_category}    Create A Category with a parent    category with a parent    category description    40
    Delete A Category    ${id_category}

Verify That The Parent Category Parameter Of A Category Can Be Updated With A Non-Existent Value
    Create A Category with a non-existent parent    category with a parent    category description    987
    Verify Response Message    ${invalid_parent}

*** Keywords ***
Create A Category With A Non-Existent Parent
    [Arguments]   ${name}    ${description}    ${parent}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    name=${name}    description=${description}    parent=${parent}
    ${error_message}   get_request_response    post    ${endpoint}   body=${body}   exp_status=400    
    Log    ${error_message}
    Set Test Variable  ${error_message}

Verify Response Message
    [Arguments]  ${expected_result}
    verify_actual_equal_expected   ${error_message}  ${expected_result}
