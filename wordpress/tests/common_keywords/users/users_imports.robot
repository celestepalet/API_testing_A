*** Settings ***
Library      wordpress.src.common_imports.CommonLibraries
Library      wordpress.src.verifications.users.users_verifications.UsersVerification
Library      wordpress.src.actions.users.random_elements.RandomElements
Resource     create_users.robot
Resource     delete_users.robot
Resource     get_users.robot
Resource     modify_users.robot
Variables    ../../../resources/config/responses.yaml

