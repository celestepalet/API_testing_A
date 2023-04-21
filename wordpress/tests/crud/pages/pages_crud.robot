*** Settings ***
Resource    ../../common_keywords/pages/pages.robot

*** Test Cases ***
Verify Pages Can Be Listed
    List Pages

Verify Page Can Be Created
    Create Page With Desired Status    draft
    Verify The Page Was Created

Verify Page Can Be Updated
    Update Page To Other Status       publish
    Verify The Page Changes The Status

Verify Page Can Be Deleted
    Delete Page
    Verify Deleted Page
