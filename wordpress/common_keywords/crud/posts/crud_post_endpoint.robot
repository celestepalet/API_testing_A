*** Settings ***
Documentation    Tests to verify that a post can be created successfully 
...              and the API returns status code.
Library    wordpress.src.common_imports.CommonLibraries
Resource    ../../posts/posts.robot
Force Tags       Crud

*** Variables ***
${endpoint}    posts

*** Test Cases ***
Execute The CRUD For The Post Endpoint
    Create A Post In Wordpress And Verify Status Code 201
    Get The Post Id In Wordpress And Verify Status Code 200    ${post_id}
    Update The Title In A Post And Verify Status Code 200    ${post_id}
    Delete A Post In Wordpress And Verify Status Code 200    ${post_id}
