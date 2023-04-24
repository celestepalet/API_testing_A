*** Settings ***
Library    wordpress.src.common_imports.CommonLibraries
Library    wordpress.src.verifications.users.users_verifications.UsersVerification
Resource   ../../common_keywords/get_credentials.robot 

*** Variables ***
${endpoint}     categories

*** Keywords ***

Create A Category
    [Arguments]   ${name}    ${description}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    name=${name}    description=${description}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status  ${response}   exp_status=201
    ${response_with_format}   get_format_response  ${response}
    Log    ${response_with_format}
    ${id_category}    get_dictionary_value    id    ${response_with_format}
    [Return]    ${id_category}

Create A Category For Setup
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    name=Setup Category    description=This is a category for setup
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status  ${response}   exp_status=201
    ${response_with_format}   get_format_response  ${response}
    Log    ${response_with_format}
    ${id_category}    get_dictionary_value    id    ${response_with_format}
    Set Suite Variable  ${id_category}

Create A Category With A Parent
    [Arguments]   ${name}    ${description}    ${parent}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    name=${name}    description=${description}    parent=${parent}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status  ${response}   exp_status=201
    ${response_with_format}   get_format_response  ${response}
    Log    ${response_with_format}
    ${id_category}    get_dictionary_value    id    ${response_with_format}
    [Return]    ${id_category}

Create A Category With Name
    [Arguments]   ${name}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    name=${name}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status  ${response}   exp_status=500
    ${response_with_format}   get_format_response    ${response}
    Log    ${response_with_format}
    ${actual_result}    get_dictionary_value    message    ${response_with_format}
    Set Suite Variable    ${actual_result}

Create A Category Without Name
    ${auth}=    Get Credentials
    ${response}   make_request_post    ${endpoint}   auth=${auth}
    validate_response_status  ${response}   exp_status=400
    ${response_with_format}   get_format_response    ${response}
    Log    ${response_with_format}
    ${actual_result}    get_dictionary_value    message    ${response_with_format}
    Set Suite Variable    ${actual_result}

Create A Category With Invalid Parent
    [Arguments]   ${parent}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    name=Category with invalid parent    parent=${parent}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status  ${response}   exp_status=400
    ${response_with_format}   get_format_response    ${response}
    Log    ${response_with_format}
    ${actual_result}    get_dictionary_value    message    ${response_with_format}
    Set Suite Variable    ${actual_result}

Get All Categories
    ${auth}=    Get Credentials
    ${response}   make_request_get  ${endpoint}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response   ${response}
    Log    ${response_with_format}

Get Category Created With Id
    [Arguments]   ${id_category}
    ${auth}=    Get Credentials
    ${response}   make_request_get  ${endpoint}    id=${id_category}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response   ${response}
    Log    ${response_with_format}

Update Category Description
    [Arguments]   ${id_category}    ${description}  
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    description=${description}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_category}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}

Update Category Parent
    [Arguments]   ${parent}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    parent=${parent}    
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_category}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}
    ${actual_result}    get_dictionary_value    parent    ${response_with_format}
    Set Suite Variable    ${actual_result}

Update Invalid Category Parent
    [Arguments]   ${parent}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    parent=${parent}
    ${response}    make_request_put    ${endpoint}   body=${body}   id=${id_category}   auth=${auth}
    validate_response_status  ${response}    exp_status=400
    ${response_with_format}    get_format_response    ${response}
    Log   ${response_with_format}
    ${actual_result}    get_dictionary_value    message    ${response_with_format}
    Set Suite Variable    ${actual_result}

Update Category Slug
    [Arguments]   ${slug}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    slug=${slug}    
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_category}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}
    ${actual_result}    get_dictionary_value    parent    ${response_with_format}
    Set Suite Variable    ${actual_result}

Update Category Description Without Id
    [Arguments]    ${description}  
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    description=${description}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_category}   auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}
    ${actual_result}    get_dictionary_value    description    ${response_with_format}
    Set Suite Variable    ${actual_result}

Update Category With Id
    [Arguments]   ${id_category}    ${name}  
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    name=${name}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_category}   auth=${auth}
    validate_response_status  ${response}    exp_status=404
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}
    ${actual_result}    get_dictionary_value    message    ${response_with_format}
    Set Suite Variable    ${actual_result}

Update Name Category
    [Arguments]   ${name}
    ${auth}=    Get Credentials
    ${body}    Create Dictionary    name=${name}    
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_category}   auth=${auth}
    validate_response_status  ${response}    exp_status=500
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}
    ${actual_result}    get_dictionary_value    message    ${response_with_format}
    Set Suite Variable    ${actual_result}

Delete A Category
    [Arguments]   ${id_category}
    ${auth}=    Get Credentials
    ${params}    Create Dictionary    force=true
    ${response}   make_request_delete    ${endpoint}   id=${id_category}   params=${params}    auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}

Delete A Category Without Force Parameter
    ${auth}=    Get Credentials
    ${response}   make_request_delete    ${endpoint}   id=${id_category}    auth=${auth}
    validate_response_status  ${response}    exp_status=501
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}    
    ${actual_result}    get_dictionary_value    message    ${response_with_format}
    Set Suite Variable    ${actual_result}

Delete Default Category
    ${auth}=    Get Credentials
    ${response}   make_request_delete    ${endpoint}   id=1    auth=${auth}
    validate_response_status  ${response}    exp_status=403
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}    
    ${actual_result}    get_dictionary_value    message    ${response_with_format}
    Set Suite Variable    ${actual_result}

Delete A Category With Id
    [Arguments]   ${id_category}
    ${auth}=    Get Credentials
    ${params}    Create Dictionary    force=true
    ${response}   make_request_delete    ${endpoint}   id=${id_category}   params=${params}    auth=${auth}
    validate_response_status  ${response}    exp_status=404
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}    
    ${actual_result}    get_dictionary_value    message    ${response_with_format}
    Set Suite Variable    ${actual_result}

Delete Setup Category
    ${auth}=    Get Credentials
    ${params}    Create Dictionary    force=true
    ${response}   make_request_delete    ${endpoint}   id=${id_category}   params=${params}    auth=${auth}
    validate_response_status  ${response}
    ${response_with_format}   get_format_response  ${response}
    Log   ${response_with_format}

Verify Response Message
    [Arguments]  ${expected_result}
    verify_actual_equal_expected    ${actual_result}  ${expected_result}