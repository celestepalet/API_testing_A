*** Keywords ***
Verify the status code
    [Arguments]  ${expected_status}
    Validate response status  ${response}   exp_status=${expected_status}