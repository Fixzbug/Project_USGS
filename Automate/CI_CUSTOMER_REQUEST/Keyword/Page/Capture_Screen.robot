*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot   

*** Variables ***
# เอาไว้ตั้งชื่อ Screen_Name
${INQUIRY_AND_REPORT}    INQUIRY AND REPORT
${REQUEST_CLOSING_CONTRACT}    REQUEST CLOSING CONTRACT
${APPROVE_CLOSING_CONTRACT}    APPROVE CLOSING CONTRACT

# Set Global Variable
${stamp_date}
${stamp_time}

# test tag
@{TEST_TAGS}

*** Keywords ***
# Create PIC format : DDMMYYY_TIMEHHMM_SYSTEM_TCNUMBER_NAMESCREEN.png
CAPTURE SCREEN DATE AND TIME
    ${stamp_date}    Get Current Date    result_format=%d.%m.%Y
    ${stamp_time}    Get Current Date    result_format=%H.%M.%S

        Set Global Variable    ${stamp_date}
        Set Global Variable    ${stamp_time}

CUSTOM CAPTURE WITH SYSTEM AND CASE
    [Arguments]    ${system_name}    ${case}
    CAPTURE SCREEN DATE AND TIME
        Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${system_name} @{TEST_TAGS} ${case} - {index:01}.png

CAPTURE SCREEN INTRO PAGE
    CAPTURE SCREEN DATE AND TIME
        SeleniumLibrary.Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date}_${stamp_time} - ${SYS} - ${Set_text_to_global_for_capture_screen}.png
        
CAPTURE INQUIRY AND REPORT
    [Arguments]    ${case}
    CAPTURE SCREEN DATE AND TIME
        Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${INQUIRY_AND_REPORT} @{TEST_TAGS} ${case} - {index:01}.png

CAPTURE REQUEST CLOSING CONTRACT
    [Arguments]    ${case}
    CAPTURE SCREEN DATE AND TIME
        Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${REQUEST_CLOSING_CONTRACT} @{TEST_TAGS} ${case} - {index:01}.png

CAPTURE APPROVE CLOSING CONTRACT
    [Arguments]    ${case}
    CAPTURE SCREEN DATE AND TIME
        Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${APPROVE_CLOSING_CONTRACT} @{TEST_TAGS} ${case} - {index:01}.png

TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN
    [Arguments]    ${Set_text_for_print_to_capture}

    ${Set_text_to_global_for_capture_screen}    BuiltIn.Set Variable    ${Set_text_for_print_to_capture}
        BuiltIn.Set Global Variable    ${Set_text_to_global_for_capture_screen}

