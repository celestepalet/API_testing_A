*** Settings ***
Documentation  Tests to verify scenarios that creates more than one user
...            whit data repeted.
Resource       ../../../common_keywords/users/users_imports.robot

Test Teardown  Delete New User Created

*** Test Cases ***
Verify That Can Not Be Changed The Username Of An Administrator After Create It
    ${id_user}=   Get ID From New User   role=administrator
    ${message}=   Modify User With A Different Username   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${username_not_editable}

Verify That Can Be Changed The Email Of An Administrator User After Create It
    ${id_user}=   Get ID From New User   role=administrator
    ${email}    Get Different Email
    ${response}=   Modify User With A Different Email  ${email}    ${id_user}
    Verify Response   ${response}    element_to_verify=${email}

Verify That Can Not Be Changed The Email Of An Administrator User After Create It If The Email Bellow To Other User
    ${email_in_use}=   Get Email In Use
    ${id_user}=   Get ID From New User   role=administrator
    ${message}=   Modify User With A Different Email   ${email_in_use}    ${id_user}      status=400
    Verify Response Message    actual=${message}   expected=${invalid_email}

Verify That Can Not Be Changed The Email Of An Administrator For One Without Format (valid format: example@example.example)
    ${id_user}=   Get ID From New User   role=administrator
    ${message}=   Modify User With A Different Email  ${email_invalid_format}   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${invalid_parameter_email}

Verify That Can Not Be Changed The Username Of An Editor After Create It
    ${id_user}=   Get ID From New User   role=editor
    ${message}=   Modify User With A Different Username   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${username_not_editable}

Verify That Can Be Changed The Email Of An Editor User After Create It
    ${id_user}=   Get ID From New User   role=editor
    ${email}    Get Different Email
    ${response}=   Modify User With A Different Email  ${email}    ${id_user}
    Verify Response   ${response}    element_to_verify=${email}

Verify That Can Not Be Changed The Email Of An Editor User After Create It If The Email Bellow To Other User
    ${email_in_use}=   Get Email In Use
    ${id_user}=   Get ID From New User   role=subscriber
    ${message}=   Modify User With A Different Email   ${email_in_use}    ${id_user}      status=400
    Verify Response Message    actual=${message}   expected=${invalid_email}

Verify That Can Not Be Changed The Email Of An Editor For One Without Format (valid format: example@example.example)
    ${id_user}=   Get ID From New User   role=editor
    ${message}=   Modify User With A Different Email  ${email_invalid_format}   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${invalid_parameter_email}

Verify That Can Not Be Changed The Username Of A Subscriber After Create It
    ${id_user}=   Get ID From New User   role=subscriber
    ${message}=   Modify User With A Different Username   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${username_not_editable}

Verify That Can Be Changed The Email Of A Subscriber User After Create It
    ${id_user}=   Get ID From New User   role=subscriber
    ${email}    Get Different Email
    ${response}=   Modify User With A Different Email  ${email}    ${id_user}
    Verify Response   ${response}    element_to_verify=${email}

Verify That Can Not Be Changed The Email Of A Subscriber User After Create It If The Email Bellow To Other User
    ${email_in_use}=   Get Email In Use
    ${id_user}=   Get ID From New User   role=subscriber
    ${message}=   Modify User With A Different Email   ${email_in_use}    ${id_user}      status=400
    Verify Response Message    actual=${message}   expected=${invalid_email}

Verify That Can Not Be Changed The Email Of A Subscriber For One Without Format (valid format: example@example.example)
    ${id_user}=   Get ID From New User   role=subscriber
    ${message}=   Modify User With A Different Email  ${email_invalid_format}   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${invalid_parameter_email}

Verify That Can Not Be Changed The Username Of An Author After Create It
    ${id_user}=   Get ID From New User   role=author
    ${message}=   Modify User With A Different Username   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${username_not_editable}

Verify That Can Be Changed The Email Of An Author User After Create It
    ${id_user}=   Get ID From New User   role=author
    ${email}    Get Different Email
    ${response}=   Modify User With A Different Email  ${email}    ${id_user}
    Verify Response   ${response}    element_to_verify=${email}

Verify That Can Not Be Changed The Email Of An Author User After Create It If The Email Bellow To Other User
    ${email_in_use}=   Get Email In Use
    ${id_user}=   Get ID From New User   role=author
    ${message}=   Modify User With A Different Email   ${email_in_use}    ${id_user}      status=400
    Verify Response Message    actual=${message}   expected=${invalid_email}

Verify That Can Not Be Changed The Email Of An Author For One Without Format (valid format: example@example.example)
    ${id_user}=   Get ID From New User   role=author
    ${message}=   Modify User With A Different Email  ${email_invalid_format}   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${invalid_parameter_email}

Verify That Can Not Be Changed The Username Of A Contributor After Create It
    ${id_user}=   Get ID From New User   role=contributor
    ${message}=   Modify User With A Different Username   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${username_not_editable}

Verify That Can Be Changed The Email Of A Contributor User After Create It
    ${id_user}=   Get ID From New User   role=contributor
    ${email}    Get Different Email
    ${response}=   Modify User With A Different Email  ${email}    ${id_user}
    Verify Response   ${response}    element_to_verify=${email}

Verify That Can Not Be Changed The Email Of A Contributor User After Create It If The Email Bellow To Other User
    ${email_in_use}=   Get Email In Use
    ${id_user}=   Get ID From New User   role=contributor
    ${message}=   Modify User With A Different Email   ${email_in_use}    ${id_user}      status=400
    Verify Response Message    actual=${message}   expected=${invalid_email}

Verify That Can Not Be Changed The Email Of A Contributor For One Without Format (valid format: example@example.example)
    ${id_user}=   Get ID From New User   role=contributor
    ${message}=   Modify User With A Different Email  ${email_invalid_format}   ${id_user}   status=400
    Verify Response Message    actual=${message}   expected=${invalid_parameter_email}

*** Keywords ***
Modify User With A Different Username
    [Arguments]   ${id_user}   ${status}=200
    ${username}=   random_username
    Log   ${username}
    ${body}=   Create Dictionary   username=${username}
    ${response}   Modify User   ${id_user}   ${body}   ${status}
    [Return]   ${response}

Modify User With A Different Email
    [Arguments]   ${email}   ${id_user}   ${status}=200
    Log   ${email}
    ${body}=   Create Dictionary   email=${email}
    ${response}   Modify User   ${id_user}   ${body}   ${status}
    [Return]   ${response}

Get Different Email
    ${email}=   random_email
    [Return]   ${email}

Get Email In Use
    ${params}    Create Dictionary    orderby=id   context=edit
    ${response}   get_request_response   get   ${endpoint}/me   params=${params}
    ${email_in_use}  get_dictionary_value    email  ${response}
    [Return]  ${email_in_use}
