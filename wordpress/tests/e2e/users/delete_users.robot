*** Settings ***
Documentation  Tests to verify scenarios that deleted users
...            whit differents roels and data.
Resource       ../../common_keywords/users/users_imports.robot

Test Setup  Set Password Username And Email For Users Creation

*** Variables ***
${username_allow_characters}   user_name.with-characters

*** Test Cases ***
Verify That An Administartor Can Not Be Deleted An User If There Is Not Other User For Reasign
     ${id_user}=   Get ID From New User  role=administrator
     Delete User By ID   ${id_user}  status=400
     Verify Response Message   ${response}  ${no_reassign_user}
     Delete New User Created

Verify That Can Be Deleted An Administrator User With Allowed Special Characters In Username (“.“ “_“ and “-“)
    ${response}=   Create User With Username  username=${username_allow_characters}  role=administrator
    Get ID From User   ${response}
    Delete User By ID   ${id_user}
    Verify That User Is Not Displayed In Users List

Verify That An Editor Can Not Be Deleted An User If There Is Not Other User For Reasign
     ${id_user}=   Get ID From New User  role=editor
     Delete User By ID   ${id_user}   status=400
     Verify Response Message   ${response}    ${no_reassign_user}
     Delete New User Created

Verify That Can Be Deleted An Editor User With Allowed Special Characters In Username (“.“ “_“ and “-“)
    ${response}=   Create User With Username  username=${username_allow_characters}   role=editor
    Get ID From User   ${response}
    Delete User By ID   ${id_user}
    Verify That User Is Not Displayed In Users List

Verify That A Subscriber Can Not Be Deleted An User If There Is Not Other User For Reasign
     ${id_user}=   Get ID From New User  role=subscriber
     Delete User By ID   ${id_user}   status=400
     Verify Response Message   ${response}    ${no_reassign_user}
     Delete New User Created

Verify That Can Be Deleted A Subscriber User With Allowed Special Characters In Username (“.“ “_“ and “-“)
    ${response}=   Create User With Username  username=${username_allow_characters}   role=subscriber
    Get ID From User   ${response}
    Delete User By ID   ${id_user}
    Verify That User Is Not Displayed In Users List

Verify That An Author Can Not Be Deleted An User If There Is Not Other User For Reasign
     ${id_user}=   Get ID From New User  role=author
     Delete User By ID   ${id_user}   status=400
     Verify Response Message   ${response}    ${no_reassign_user}
     Delete New User Created

Verify That Can Be Deleted An Author User With Allowed Special Characters In Username (“.“ “_“ and “-“)
    ${response}=   Create User With Username  username=${username_allow_characters}   role=author
    Get ID From User   ${response}
    Delete User By ID   ${id_user}
    Verify That User Is Not Displayed In Users List

Verify That A Contributor Can Not Be Deleted An User If There Is Not Other User For Reasign
     ${id_user}=   Get ID From New User  role=contributor
     Delete User By ID   ${id_user}   status=400
     Verify Response Message   ${response}    ${no_reassign_user}
     Delete New User Created

Verify That Can Be Deleted A Contributor User With Allowed Special Characters In Username (“.“ “_“ and “-“)
    ${response}=   Create User With Username  username=${username_allow_characters}   role=contributor
    Get ID From User   ${response}
    Delete User By ID   ${id_user}
    Verify That User Is Not Displayed In Users List
