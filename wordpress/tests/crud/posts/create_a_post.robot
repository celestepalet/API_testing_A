*** Settings ***
Resource    common_imports.robot

Suite Setup    Get credentials
*** Variables ***
${endpoint}    posts

*** Test Cases ***
Create a post
    Create a post    201
 