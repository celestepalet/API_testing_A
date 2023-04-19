*** Settings ***
Documentation  Tests to verify that users whit differnts roles can be creadet succesfully
...            and the API return a status code 200 and the user record
Resource       ../../common_keywords/users/users.robot

Suite Setup  Get user for reassign

*** Test Cases ***
Verify that a administrator user can be crated successfully
    Create a new user   administrator
    Verify the status code    201
    Verify that the user exists


Verify that a editor user can be crated successfully
    Create a new user   editor
    Verify the status code    201
    Verify that the user exists

Verify that a contributor user successfully
    Create a new user   contributor
    Verify the status code    201
    Verify that the user exists

Verify that a author user can be crated successfully
    Create a new user   author
    Verify the status code    201
    Verify that the user exists

Verify that a subscriber user can be crated successfully
    Create a new user   subscriber
    Verify the status code    201
    Verify that the user exists


