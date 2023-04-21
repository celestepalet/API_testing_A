*** Settings ***
Documentation    Verify that a post saved on drafts, updated 
...              and published returns a HTTP response.
Library    wordpress.src.common_imports.CommonLibraries
Resource    ../../common_keywords/get_credentials.robot
Resource    ../../common_keywords/posts/keywords.robot


*** Variables ***
${endpoint}     posts

*** Test Cases ***
Verify that a post saved on drafts, updated and published returns a HTTP response 200
    Create A Post And Save It On Drafts
    Get The Post Id   ${post_id}
    Update The Post Status to Published    ${post_id} 

Verify that a published post can be unpublished and saved on drafts
    Create A Published Post
    Get The Post Id    ${post_id}
    Update The Post Status To Draft    ${post_id}

Verify That More Than 5000 Characters are Accepted In The Title Field
    Create A Published Post
    Update A Post With 5000 Characters    ${post_id}

Verify That The Content Can Be Edited In A Published Post
    Create A Published Post 
    Get The Post Id    ${post_id}
    Update The Content In A Post    ${post_id}

Verify That The Content Can Be Edited In A Private Post
    Create A Private Post
    Get The Post Id    ${post_id}
    Update The Content In A Post    ${post_id}

Verify That The Content Can Be Edited In A Draft Post
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Update The Content In A Post    ${post_id}

Verify That The Slug Identifier Can Be Edited In A Published Post
    Create A Published Post
    Get The Post Id    ${post_id}
    Update The Slug In A Post    ${post_id}

Verify That The Slug Identifier Can Be Edited In A Private Post
    Create A Private Post
    Get The Post Id    ${post_id}
    Update The Slug In A Post    ${post_id}

Verify That The Slug Identifier Can Be Edited In A Draft Post
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Update The Slug In A Post    ${post_id}


Verify That The title Is Updated In A Published Post
    Create A Published Post 
    Get The Post Id    ${post_id}
    Update The Title In A Post    ${post_id}

Verify That The Title Can Be Edited In A Private Post
    Create A Private Post
    Get The Post Id    ${post_id}
    Update The Title In A Post    ${post_id}

Verify That The Title Can Be Edited In A Draft Post
    Create A Post And Save it on drafts
    Get The Post Id    ${post_id}
    Update The Title In A Post    ${post_id}