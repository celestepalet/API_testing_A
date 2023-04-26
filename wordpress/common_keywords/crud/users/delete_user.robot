*** Settings ***
Documentation  Tests to verify that the user can be deleted
...            and the API return a status code 200
Resource       ../../users/users_imports.robot
Force Tags       Crud

*** Test Cases ***
Verify That Specific User Can Be Deleted By ID
    ${id_user}=  Get ID From New User    role=administrator
    Delete User By ID  ${id_user}
    Verify That User Is Not Displayed In Users List
