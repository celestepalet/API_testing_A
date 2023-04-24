*** Settings ***
Resource    ../../../common_keywords/pages/pages.robot
Resource    ../../../common_keywords/pages/bad_info.robot

*** Test Cases ***
Verify if a page was deleted and try to delete again it is not possible in a publish page
    Create Page With Desired Status   publish
    Delete Page
    Verify Deleted Page
    Delete Page Again
    Verify Delete Error Info

Verify if a page was deleted and try to delete again it is not possible in a draft page
    Create Page With Desired Status   draft
    Delete Page
    Verify Deleted Page
    Delete Page Again
    Verify Delete Error Info
