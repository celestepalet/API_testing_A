*** Settings ***
Resource    ../../../common_keywords/pages/pages.robot
Resource    ../../../common_keywords/pages/bad_info.robot
Force Tags       Pages   Pages_delete    Regression

*** Test Cases ***
Verify if a page was deleted and try to delete again it is not possible in a publish page
    [Tags]    uat
    Create Page With Desired Status   publish
    Delete Page
    Verify Deleted Page
    Delete Page Again
    Verify Delete Error Info

Verify if a page was deleted and try to delete again it is not possible in a draft page
    [Tags]    uat
    Create Page With Desired Status   draft
    Delete Page
    Verify Deleted Page
    Delete Page Again
    Verify Delete Error Info
