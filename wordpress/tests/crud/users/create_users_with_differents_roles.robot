*** Settings ***
Documentation  Tests to verify that users with different roles can be created successfully
...            and the API returns a status code 201 and the user record.
Resource       ../../common_keywords/users/users_imports.robot

Test Teardown  Delete New User Created

*** Test Cases ***
Verify That New User Can Be Created Whit The Administrator Role
    Create New Administrator User
    Verify That New User Was Crated

Verify That New User Can Be Created Whit The Editor Role
    Create New Editor User
    Verify That New User Was Crated

Verify That New User Can Be Created Whit The Contributor Role
    Create New Contributor User
    Verify That New User Was Crated

Verify That New User Can Be Created Whit The Author Role
    Create New Author User
    Verify That New User Was Crated

Verify That New User Can Be Created Whit The Subscriber Role
    Create New Subscriber User
    Verify That New User Was Crated
