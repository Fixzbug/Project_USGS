*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***

SET INPUT AND SELECT DROPDOWN AND CLICK CONFIRM 
    [Arguments]    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - SELECT DROPDOWN DOC APPROVE    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - INPUT NAME ENG    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - INPUT LAST NAME ENG    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - SELECT DROPDOWN BUILDIN    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - INPUT BUILDIN NAME    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - INPUT ADDRESS NO    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - INPUT MOO    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - INPUT ROAD    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - SELECT DROPDOWN REC TYPE    ${tc_index}

    Judment_approve_page.JUDMENT APPROVE - SELECT DROPDOWN FIRST LOAN TYPE    ${tc_index}        

    Judment_approve_page.JUDMENT APPROVE - CLICK BUTTON CONFIRM APPROVE

    Judment_approve_page.JUDMENT APPROVE - CLICK BUTTON YES CONFIRM APPROVE

    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    JUDGMENT_APPROVE 

    Capture_screen.CAPTURE SCREEN CURRENT PAGE

    Judment_approve_page.JUDMENT APPROVE - CLICK BUTTON GO TO MAIN

    Common_keyword.INTRANET TEARDOWN                                        