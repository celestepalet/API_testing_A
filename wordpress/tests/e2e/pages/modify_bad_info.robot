*** Settings ***
Resource    ../../../common_keywords/pages/pages.robot
Resource    ../../../common_keywords/pages/bad_info.robot
Test Teardown   Delete Page
Force Tags       Pages   Pages_modify_bad_info    Regression

*** Test Cases ***
Verify that if a page is updated with invalid author it gives an error in a publish page
    [Tags]    uat
    Create Page With Desired Status   publish
    Update Author With Bad Info   3
    Verify Author Error Info

Verify that if a page is updated with invalid author it gives an error in a draft page
    [Tags]    uat
    Create Page With Desired Status   draft
    Update Author With Bad Info   4
    Verify Author Error Info

Verify that if a page is updated with invalid ping_status it gives an error in a publish page
    Create Page With Desired Ping Status   publish   open
    Update Ping Status In Page With Bad Info    invalid_info
    Verify Ping Status Error Info

Verify that if a page is updated with invalid ping_status it gives an error in a draft page
    Create Page With Desired Ping Status   draft   closed
    Update Ping Status In Page With Bad Info    wrong_info
    Verify Ping Status Error Info

Verify that if a page is updated with invalid comment_status it gives an error in a publish page
    Create Page With Desired Comment Status   publish   closed
    Update Comment Status In Page With Bad Info   close
    Verify Comment Status Error Info

Verify that if a page is updated with invalid comment_status it gives an error in a draft page
    Create Page With Desired Comment Status   draft   open
    Update Comment Status In Page With Bad Info   bad
    Verify Comment Status Error Info
