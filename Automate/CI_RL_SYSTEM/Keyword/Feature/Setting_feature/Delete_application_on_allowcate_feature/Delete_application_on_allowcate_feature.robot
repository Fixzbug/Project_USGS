*** Settings ***
Resource    ${CURDIR}/../../../../Import/Path_import.robot

*** Keywords ***

GO TO MENU DELETE APPLICATION
    Common_keyword.RELOAD PAGE AND SCROLL TO TOP

    # Delete_application_on_allowcate_page.CLICK SIDEBAR DOWN BUTTON

    BuiltIn.Wait Until Keyword Succeeds   15x    2s    Delete_application_on_allowcate_page.CLICK MENU DELETE APPLICATION

SEARCH AND DELETE APPLICATION BY BRANCH AND APP NUMBER 
    [Arguments]    ${value_branch_no}    ${value_app_no}

        Delete_application_on_allowcate_page.INPUT BRANCH DELETE    ${value_branch_no}

            Delete_application_on_allowcate_page.INPUT APP NUMBER    ${value_app_no}

                Delete_application_on_allowcate_page.CLICK SEARCH BUTTON

                    Delete_application_on_allowcate_page.CLICK DELETE BUTTON

                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    DELETE_APPLICATION_PAGE

                            Capture_screen.CAPTURE SCREEN CURRENT PAGE