*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Resource     ../get_credentials.robot

*** Variables ***
${endpoint}     users
${email}   apitesters.at19@gmail.com
${password}     password
${reassign_email}   user.reassing@gmail.com

*** Keywords ***
Create body
    [Arguments]   ${role}
    ${body}    Create dictionary    username=new ${role} user   email=${email}   roles=${role}   password=${password}
    Set suite variable  ${body}

Create a new user
    [Arguments]   ${role}
    Get credentials
    Create body   ${role}
    ${response}   Make request post    ${endpoint}   body=${body}   auth=${auth}
    ${expected_result}   Get format response  ${response}  format_json
    ${id_user}  Get dictionary value    id  ${expected_result}
    Set suite variable  ${response}
    Set suite variable  ${expected_result}
    Set suite variable  ${id_user}

Verify the status code
    [Arguments]  ${expected_status}
    Validate response status  ${response}   exp_status=${expected_status}

Verify that the user exists
    ${ignore}    Create list    username   first_name   last_name   email   locale    nickname   roles   registered_date   capabilities   extra_capabilities   meta
    ${response}   Make request get    ${endpoint}   auth=${auth}   id=${id_user}
    ${actual_result}   Get format response   ${response}   format_json
    Verify actual axpected result   ${actual_result}  ${expected_result}   ${ignore}
    Delete user   ${id_user}

Verify that the user was updated
    [Arguments]  ${id_user}   ${expected_result}
    Get credentials
    ${ignore}    Create list    username   first_name   last_name   email   locale    nickname   roles   registered_date   capabilities   extra_capabilities   meta
    ${response}   Make request get    ${endpoint}   auth=${auth}   id=${id_user}
    ${result}   Get format response   ${response}   format_json
    Verify actual axpected result   ${result}  ${expected_result}   ${ignore}


Delete user
    [Arguments]  ${id_user}
    Get credentials
    Get user for reassign
    ${params}    Create dictionary    reassign=${id_reassign}    force=true
    ${response}   Make request delete    ${endpoint}   id=${id_user}   auth=${auth}   params=${params}
    ${result}   Get format response  ${response}  format_json
    Set suite variable  ${response}
    Set suite variable  ${result}

Get user for reassign
    Get credentials
    ${response}   Make request get    ${endpoint}   auth=${auth}
    ${expected_result}   Get format response  ${response}  format_json
    ${first_user}   Get list element    0   ${expected_result}
    ${id_reassign}  Get dictionary value    id  ${first_user}
    Set suite variable  ${id_reassign}

Get a user
    [Arguments]   ${id_user}
    Get credentials
    ${response}   Make request get    ${endpoint}   id=${id_user}   auth=${auth}
    ${result}   Get format response  ${response}  format_json
    Set suite variable  ${response}
    Set suite variable  ${result}

Get all user
    Get credentials
    ${response}   Make request get    ${endpoint}   auth=${auth}
    ${result}   Get format response  ${response}  format_json
    Set suite variable  ${response}
    Set suite variable  ${result}

Modify user information
    [Arguments]  ${id_user}   ${body}
    Get credentials
    ${response}   Make request put    ${endpoint}   body=${body}   id=${id_user}   auth=${auth}
    ${response_with_format}   Get format response  ${response}  format_json
    ${result}   Get format response  ${response}  format_json
    Set suite variable  ${response}
    Set suite variable  ${result}

Verify response message
    [Arguments]  ${expected_result}
    Verify actual axpected result   ${result}  ${expected_result}












