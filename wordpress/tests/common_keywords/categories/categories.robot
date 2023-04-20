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
    ${body}    Create dictionary    name=${name}    description=${description}
    ${response}   make_request_post    ${endpoint}   body=${body}   auth=${auth}
    validate_response_status  ${response}   exp_status=201
    ${response_with_format}   get_format_response  ${response}  format_json
    Log    ${response_with_format}
    ${id_category}    get_dictionary_value    id    ${response_with_format}
    [Return]    ${id_category}

Get All Categories
    ${auth}=    Get Credentials
    ${response}   make_request_get  ${endpoint}   auth=${auth}
    validate_response_status  ${response}   exp_status=200
    ${response_with_format}   get_format_response   ${response}   format_json
    Log    ${response_with_format}

Get Category Created With Id
    [Arguments]   ${id_category}
    ${auth}=    Get Credentials
    ${response}   make_request_get  ${endpoint}    id=${id_category}   auth=${auth}
    validate_response_status  ${response}   exp_status=200
    ${response_with_format}   get_format_response   ${response}   format_json
    Log    ${response_with_format}

Update Category Description
    [Arguments]   ${id_category}    ${description}  
    ${auth}=    Get Credentials
    ${body}    Create dictionary    description=${description}
    ${response}   make_request_put    ${endpoint}   body=${body}   id=${id_category}   auth=${auth}
    validate_response_status  ${response}   exp_status=200
    ${response_with_format}   get_format_response  ${response}  format_json
    Log   ${response_with_format}

Delete A Category
    [Arguments]   ${id_category}
    ${auth}=    Get Credentials
    ${params}    Create dictionary    force=true
    ${response}   make_request_delete    ${endpoint}   id=${id_category}   params=${params}    auth=${auth}
    validate_response_status  ${response}   exp_status=200
    ${response_with_format}   get_format_response  ${response}  format_json
    Log   ${response_with_format}