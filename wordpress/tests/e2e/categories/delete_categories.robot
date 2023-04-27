*** Settings ***
Documentation    Tests to verify that a category can be deleted successfully 
...              and it verifies the scenarios where it should not be deleted.
Resource         ../../../common_keywords/categories/categories.robot
Variables        ../../../resources/data/responses.yaml
Suite Setup       Create A Category For Setup
Suite Teardown    Delete Setup Category
Force Tags       Categories   Categories_delete   Regression

*** Test Cases ***
Verify That A Category Cannot Be Deleted Without Provide The Force Parameter
    [Tags]    uat
    Delete A Category Without Force Parameter
    Verify Response Message    ${delete_without_force}

Verify That Default Category Cannot Be Deleted
    [Tags]    uat
    Delete Default Category
    Verify Response Message    ${default_category}

Verify That A Category Cannot Be Deleted With A Non-Existent Id
    Delete A Category With Id    1234
    Verify Response Message    ${non_existent_id}
