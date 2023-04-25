*** Settings ***
Documentation    Tests to verify that a comment can be created successfully 
...              and it appears on the list of results when correct filters
...              are used.
Resource         ../../../common_keywords/comments/comments.robot
Suite Setup       Create A Post For A Comment
Suite Teardown    Delete Post Created For The Comment

*** Test Cases ***
Verify search string filter returns appropiate comments
    ${comment1_id}=    Create A New Comment    Comment 1: Elephant    ${post_id}
    ${comment2_id}=    Create A New Comment    Comment 2: Giraffe    ${post_id}
    ${comment3_id}=    Create A New Comment    Comment 3: Platypus    ${post_id}
    ${response}    Get Comments With Filter Search    Elephant
    Verify Comment Is In Results    ${comment1_id}    ${response}
    Verify Comment Is Not In Results    ${comment2_id}    ${response}
    Verify Comment Is Not In Results    ${comment3_id}    ${response}

Verify parent filter functionality returns appropiate comments
    ${comment1_id}=    Create A New Comment    Comment 1: This is a parent comment.    ${post_id}
    ${comment2_id}=    Create A New Comment From Parent    Comment 2: This is a child comment.    ${post_id}    ${comment1_id}
    ${comment3_id}=    Create A New Comment    Comment 3: This an orphan comment.    ${post_id}
    ${response}=    Get Comments With Filter Parent    ${comment1_id}
    Verify Comment Is In Results    ${comment2_id}    ${response}
    Verify Comment Is Not In Results    ${comment1_id}    ${response}
    Verify Comment Is Not In Results    ${comment3_id}    ${response}

Verify post filter functionality positive case
    ${post_2_id}=    Create A Different Post For A Comment
    ${comment1_id}=    Create A New Comment    Comment 1: This is a comment on post 1.    ${post_id}
    ${comment2_id}=    Create A New Comment    Comment 2: This is a comment on post 2.   ${post_2_id}
    ${response}=    Get Comments With Filter Post    ${post_id}
    Verify Comment Is In Results    ${comment1_id}    ${response}
    Verify Comment Is Not In Results    ${comment2_id}    ${response}
    Delete Post    ${post_2_id}
    