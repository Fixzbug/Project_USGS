*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore    

*** Variables ***
# Set Global Variable
${stamp_date}
${stamp_time}

# test tag
@{TEST_TAGS}

*** Keywords ***

CAPTURE SCREEN DATE AND TIME
    # Create PIC format : DDMMYYY_TIMEHHMM_SYSTEM_TCNUMBER_NAMESCREEN.png
    ${stamp_date}    Get Current Date    result_format=%Y.%m.%d
    ${stamp_time}    Get Current Date    result_format=%H.%M.%S

    Set Global Variable    ${stamp_date}
    Set Global Variable    ${stamp_time}


CUSTOM CAPTURE WITH SYSTEM AND CASE
    [Arguments]    ${system_name}    ${case}
    CAPTURE SCREEN DATE AND TIME
    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${system_name} @{TEST_TAGS} ${case}.png

