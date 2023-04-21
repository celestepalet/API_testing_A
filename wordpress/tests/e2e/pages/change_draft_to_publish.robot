*** Settings ***
Resource    ../../common_keywords/pages/pages.robot
Suite Teardown   Delete Page

*** Test Cases ***
Verify that is posible to change status page from draft to publish when it was created
    Create Page With Desired Status    draft
    Update Page To Other Status       publish
    Verify The Page Changes The Status

Verify that is posible to change status page from publish to draft when it was created
    Update Page To Other Status       draft
    Verify The Page Changes The Status
