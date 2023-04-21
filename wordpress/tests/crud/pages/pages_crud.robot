*** Settings ***
Resource    ../../common_keywords/pages/pages.robot

*** Test Cases ***
Verify Pages Can Be Listed
    List Pages

Verify Page Can Be Created
    Create Page
    Verify Page

Verify Page Can Be Updated
    Update Page
    Verify Page

Verify Page Can Be Deleted
    Delete Page
    Verify Deleted Page
