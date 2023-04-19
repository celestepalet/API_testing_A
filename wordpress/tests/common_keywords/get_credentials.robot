*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries

*** Keywords ***
Get Credentials
    ${auth}   get_basic_auth
    [Return]    ${auth}
