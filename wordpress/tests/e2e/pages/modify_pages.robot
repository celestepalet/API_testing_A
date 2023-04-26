*** Settings ***
Resource    ../../../common_keywords/pages/pages.robot
Test Teardown   Delete Page
Force Tags       Pages   Pages_modify

*** Test Cases ***
Verify that is posible to change status page from draft to publish when it was created
    [Tags]    smoke
    Create Page With Desired Status    draft
    Update Page To Other Status       publish
    Verify The Page Changes The Status

Verify that is posible to change status page from publish to draft when it was created
    [Tags]    smoke
    Create Page With Desired Status   publish
    Update Page To Other Status       draft
    Verify The Page Changes The Status

Verify that the title and content can be edited in a publish page
    [Tags]    smoke
    Create Page With Desired Status    publish
    Update Title And Content In Page
    Verify Page

Verify that the title and content can be edited in a draft page
    [Tags]    smoke
    Create Page With Desired Status    draft
    Update Title And Content In Page
    Verify Page

Verify password can be change in a publish page
    [Tags]    smoke
    Create Page With Desired Status    publish
    Update Password In Page
    Validate Update Password

Verify password can be change in a draft page
    [Tags]    smoke
    Create Page With Desired Status    draft
    Update Password In Page
    Validate Update Password

Verify that ping_status can be updated from closed to open in a publish page
    [Tags]    smoke
    Create Page With Desired Ping Status   publish   closed
    Update Ping Status In Page  open
    Verify Page

Verify that ping_status can be updated from closed to open in a draft page
    [Tags]    smoke
    Create Page With Desired Ping Status   draft   closed
    Update Ping Status In Page  open
    Verify Page

Verify that ping_status can be updated from open to closed in a publish page
    [Tags]    smoke
    Create Page With Desired Ping Status   publish   open
    Update Ping Status In Page  closed
    Verify Page

Verify that ping_status can be updated from open to closed in a draft page
    [Tags]    smoke
    Create Page With Desired Ping Status   draft   open
    Update Ping Status In Page  closed
    Verify Page

Verify that comment_status can be updated from closed to open in a publish page
    [Tags]    smoke
    Create Page With Desired Comment Status   publish   closed
    Update Comment Status In Page  open
    Verify Page

Verify that comment_status can be updated from closed to open in a draft page
    [Tags]    smoke
    Create Page With Desired Comment Status   draft   closed
    Update Comment Status In Page  open
    Verify Page

Verify that comment_status can be updated from open to closed in a publish page
    [Tags]    smoke
    Create Page With Desired Comment Status   publish   open
    Update Comment Status In Page  closed
    Verify Page

Verify that comment_status can be updated from open to closed in a draft page
    [Tags]    smoke
    Create Page With Desired Comment Status   draft   open
    Update Comment Status In Page  closed
    Verify Page
