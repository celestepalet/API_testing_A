*** Settings ***
Documentation  Tests to verify that the user information can be updated
...            and the API return a status code 200
Resource       ../../common_keywords/users/users_imports.robot

Test Teardown  Delete New User Created

*** Test Cases ***
Verify that a specific user record can be uploaded
    ${id_user}   Get ID From New User
    Modify User Name By ID   ${id_user}
    Verify The User Has Been Modified
