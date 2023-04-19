*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries

*** Keywords ***
Get credentials
    ${auth}   Get basic auth
    Set suite variable  ${auth}
