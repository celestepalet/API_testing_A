*** Settings ***
Documentation    Tests to verify that a category can be modified successfully 
...              and it verifies all the updated values.
Resource         ../../../common_keywords/categories/categories.robot
Variables        ../../../resources/config/responses.yaml
Suite Setup       Create A Category For Setup
Suite Teardown    Delete Setup Category

*** Test Cases ***
Verify That The Parent Parameter Of A Category Can Be Updated With A Valid Value
    Update Category Parent    1
    Verify Equal Response    1

Verify That The Parent Parameter Of A Category Cannot Be Updated With A Non-Existent Value
    Update Invalid Category Parent    987
    Verify Response Message    ${invalid_parent}

Verify That The Parent Parameter Of A Category Cannot Be Updated With An Empty Value
    Update Invalid Category Parent    ${EMPTY}  
    Verify Response Message    ${empty_parent}

Verify That The Slug Parameter Of A Category Cannot Be Updated With An Empty Value
    Update Category Slug    ${EMPTY}
    Verify Not Empty Response

Verify That The Description Parameter Of A Category Can Be Updated
    Update Category Description Without Id    This is a updated description
    Verify Response Message    This is a updated description

Verify That A Category Cannot Be Updated With A Non-Existent Id
    Update Category With Id    1234    Category with invalid id
    Verify Response Message    ${non_existent_id}

Verify That The Name Parameter Of A Category Cannot Be Updated With An Empty Value
    Update Name Category    ${EMPTY}
    Verify Response Message    ${empty_name}
