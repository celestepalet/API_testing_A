*** Settings ***
Documentation    Verify scenarios in public, private and draft Post endpoints.
Library    wordpress.src.common_imports.CommonLibraries
Library    ../../../../venv/lib/site-packages/robot/libraries/XML.py
Resource    ../../common_keywords/get_credentials.robot
Resource    ../../common_keywords/posts/posts.robot

*** Variables ***
${endpoint}     posts

*** Test Cases ***
Verify that a post saved on drafts, updated and published returns a HTTP response 200
    Create A Post And Save It On Drafts
    Get The Post Id   ${post_id}
    Update The Post Status to Published    ${post_id}
    Move Post To Trash    ${post_id}

Verify that a published post can be unpublished and saved on drafts
    Create A Published Post
    Get The Post Id    ${post_id}
    Update The Post Status To Draft    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Server failed When The Title In A Post Receive More Than 65600
    Create A Published Post
    Update A Post With 65600 Characters    ${post_id}
    Move Post To Trash    ${post_id}

Verify That An Error 400 Is Displayed When The User Creates A Post With All Fields Empty
    Create A Post Without Title And Content

Verify That The Content Can Be Edited In A Published Post
    Create A Published Post 
    Get The Post Id    ${post_id}
    Update The Content In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Content Can Be Edited In A Private Post
    Create A Private Post
    Get The Post Id    ${post_id}
    Update The Content In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Content Can Be Edited In A Draft Post
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Update The Content In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Slug Identifier Can Be Edited In A Published Post
    Create A Published Post
    Get The Post Id    ${post_id}
    Update The Slug In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Slug Identifier Can Be Edited In A Private Post
    Create A Private Post
    Get The Post Id    ${post_id}
    Update The Slug In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Slug Identifier Can Be Edited In A Draft Post
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Update The Slug In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Title Is Updated In A Published Post
    Create A Published Post 
    Get The Post Id    ${post_id}
    Update The Title In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Title Can Be Edited In A Private Post
    Create A Private Post
    Get The Post Id    ${post_id}
    Update The Title In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Title Can Be Edited In A Draft Post
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Update The Title In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Date Can Be Changed In A Published Post
    Create A Published Post 
    Get The Post Id    ${post_id}
    Update The Date In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Date Can Be Changed In A Private Post
    Create A Private Post
    Get The Post Id    ${post_id}
    Update The Date In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Date Can Be Changed In A Draft Post
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Update The Date In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Author Of A Published Post Can Be Changed
    Create A Published Post
    Get The Post Id    ${post_id}
    Change The Author of a Post    ${post_id}
    Move Post To Trash    ${post_id}
    
Verify That The Author Of A Private Post Can Be Changed
    Create A Private Post
    Get The Post Id    ${post_id}
    Change The Author of a Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify That The Author Of A Draft Post Can Be Changed
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Change The Author of a Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify that The Comments In A Published Post Can Be Disabled
    Create A Published Post
    Get The Post Id    ${post_id}
    Disable The Comments In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify that The Comments In A Private Post Can Be Disabled
    Create A Private Post
    Get The Post Id    ${post_id}
    Disable The Comments In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify that The Comments In Draft Post Can Be Disabled
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Disable The Comments In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify that The Ping In A Published Post Can Be Disabled
    Create A Published Post
    Get The Post Id    ${post_id}
    Disable The Ping In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify that The Ping In A Private Post Can Be Disabled
    Create A Private Post
    Get The Post Id    ${post_id}
    Disable The Ping In A Post    ${post_id}
    Move Post To Trash    ${post_id}

Verify that The Ping In Draft Post Can Be Disabled
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Disable The Ping In A Post    ${post_id}
    Move Post To Trash    ${post_id}
