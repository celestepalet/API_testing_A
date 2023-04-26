*** Settings ***
Documentation    Tests to verify that the comments endpoint responses to  
...              inappropiate requests are adequate.
Resource         ../../../common_keywords/comments/comments.robot
Suite Setup       Create A Post For A Comment
Suite Teardown    Delete Post Created For The Comment
Force Tags       Comments   Comments_invalid_request

*** Test Cases ***
Verify that no content returns error message
    ${response}=    Create A New Comment Without Content    ${post_id}
    Verify Response Message    ${no_content_comment}    ${response}

Verify that no post returns error message
    ${response}=    Create A New Comment Without Post    This is a comment with no post.
    Verify Response Message    ${no_post_comment}    ${response}

Verify error message when trying to delete a comment already deleted
    ${comment_id}=    Create A New Comment    This is a new comment.    ${post_id}
    Delete Comment    ${comment_id}
    Delete Comment Already Deleted    ${comment_id}
