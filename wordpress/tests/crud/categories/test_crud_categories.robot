*** Settings ***
Documentation    Tests to verify that a category can be created successfully 
...              and the API returns status code 201 whenever a category is 
...              generated.
Resource         ../../common_keywords/categories/categories.robot

*** Test Cases ***
Verify a category is created, updated and deleted successfully
    ${id_category}=    Create A Category    New category21    This is a new category21
    Get Category Created With Id    ${id_category}    
    Update Category Description    ${id_category}    This is a description updated21
    Delete A Category    ${id_category}

Verify all categories are listed successfully
    Get All Categories
