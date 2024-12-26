*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot   

*** Variables ***
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
        Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${system_name} @{TEST_TAGS} ${case}.png

