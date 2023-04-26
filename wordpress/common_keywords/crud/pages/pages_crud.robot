*** Settings ***
Resource    ../../pages/pages.robot
Force Tags       Crud

*** Test Cases ***
Verify Pages Can Be Listed
    List Pages

Verify Page Can Be Created
    Create Page
    Verify The Page Was Created

Verify Page Can Be Updated
    Update Page To Other Status       publish
    Verify Page

Verify Page Can Be Deleted
    Delete Page
    Verify Deleted Page
