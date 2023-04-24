*** Settings ***
Documentation    Tests to verify that a category can be created successfully 
...              and it verifies all the created values.
Resource         ../../common_keywords/categories/categories.robot
Variables        ../../../resources/config/responses.yaml
#Suite Teardown    Delete Setup Category

*** Test Cases ***
Verify That The Name Parameter Of A Category Cannot Be Created With An Empty Value
    Create A Category With Name    ${EMPTY}
    Verify Response Message    ${empty_name}

Verify That A Category Cannot Be Created Without A Name
    Create A Category Without Name
    Verify Response Message    ${category_without_name}

Verify That The Parent Parameter Of A Category Cannot Be Created With A Non-Existent Value
    Create A Category With Invalid Parent    2134
    Verify Response Message    ${invalid_parent}

Verify That The Parent Parameter Of A Category Cannot Be Created With An Empty Value
    Create A Category With Invalid Parent    ${EMPTY}
    Verify Response Message    ${empty_parent}
    