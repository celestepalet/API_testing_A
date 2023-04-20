*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification

*** Variables ***
${endpoint}     users
${email}        apitesters.at19@apitesting.com

*** Keywords ***
Create New Administrator User
    ${auth}   get_basic_auth
    ${body}   Create Dictionary   username=new administrator user   email=${email}   roles=administrator   password=password
    ${response}   make_request_post   ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_user}  get_dictionary_value   id   ${expected_result}
    validate_response_status   ${response}   exp_status=201
    Set Test Variable  ${expected_result}
    Set Test Variable  ${id_user}

Create New Editor User
    ${auth}   get_basic_auth
    ${body}   Create Dictionary   username=new editor user   email=${email}   roles=editor   password=password
    ${response}   make_request_post   ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_user}  get_dictionary_value   id   ${expected_result}
    validate_response_status   ${response}   exp_status=201
    Set Test Variable  ${expected_result}
    Set Test Variable  ${id_user}

Create New Contributor User
    ${auth}   get_basic_auth
    ${body}   Create Dictionary   username=new contributor user   email=${email}   roles=contributor   password=password
    ${response}   make_request_post   ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_user}  get_dictionary_value   id   ${expected_result}
    validate_response_status   ${response}   exp_status=201
    Set Test Variable  ${expected_result}
    Set Test Variable  ${id_user}

Create New Author User
    ${auth}   get_basic_auth
    ${body}   Create Dictionary   username=new author user   email=${email}   roles=author   password=password
    ${response}   make_request_post   ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_user}  get_dictionary_value   id   ${expected_result}
    validate_response_status   ${response}   exp_status=201
    Set Test Variable  ${expected_result}
    Set Test Variable  ${id_user}

Create New Subscriber User
    ${auth}   get_basic_auth
    ${body}   Create Dictionary   username=new subscriber user   email=${email}   roles=subscriber   password=password
    ${response}   make_request_post   ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   get_format_response  ${response}
    ${id_user}  get_dictionary_value   id   ${expected_result}
    validate_response_status   ${response}   exp_status=201
    Set Test Variable  ${expected_result}
    Set Test Variable  ${id_user}

Verify That New User Was Crated
    ${auth}   get_basic_auth
    ${response}   make_request_get   ${endpoint}   auth=${auth}   id=${id_user}
    validate_response_status    ${response}
    ${actual_result}   get_format_response   ${response}
    ${ignore}    Create List    username   first_name   last_name   email   locale    nickname   roles   registered_date   capabilities   extra_capabilities   meta
    verify_actual_equal_expected   ${actual_result}   ${expected_result}   ${ignore}

Get ID From New User
    Create New Administrator User
    [Return]   ${id_user}
