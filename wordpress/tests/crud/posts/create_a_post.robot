*** Settings ***
Documentation    Tests to verify that a post can be created successfully 
...              and the API returns status code.
Library    wordpress.src.common_imports.CommonLibraries
Resource    ../../common_keywords/posts/keywords.robot

*** Variables ***
${endpoint}    posts

*** Test Cases ***
Execute The CRUD For The Post Endpoint
    Create A Post In Wordpress And Verify Status Code 201    201
    Get The Post Id In Wordpress And Verify Status Code 200
    Update The Title In A Post And Verify Status Code 200    ${id_post}
    Delete A Post In Wordpress And Verify Status Code 200    ${id_post}
