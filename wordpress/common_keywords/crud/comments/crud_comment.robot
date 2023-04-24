*** Settings ***
Documentation    Tests to verify that a comment can be created successfully 
...              and the API returns status code 201 whenever a comment is 
...              generated.
Resource         ../../comments/comments.robot
Suite Setup       Create A Post For A Comment
Suite Teardown    Delete Post Created For The Comment

*** Test Cases ***
Verify that a comment can be created edited and deleted successfully
    ${comment_id}=    Create A New Comment    This is the content of the new comment    ${post_id}
    Verify Comment Exists    ${comment_id}
    Edit Comment    This is edited content on a comment    ${comment_id}
    Delete Comment    ${comment_id}
