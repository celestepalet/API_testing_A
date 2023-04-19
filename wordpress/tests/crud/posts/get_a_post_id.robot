*** Settings ***
Resource    common_imports.robot

Suite Setup    Get credentials

*** Variables ***
${endpoint}    posts

*** Test Cases ***
Get a post id
    Get a post id    200
 