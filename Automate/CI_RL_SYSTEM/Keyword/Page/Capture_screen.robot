*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot

*** Variables ***

# เอาไว้ตั้งชื่อ Screen_Name
${validate_field}    Validate Field
${Verify_error}    Verify Condition Error
${KeyInStep_1}    Key_In_Step_1
${KeyInStep_2}    Key_In_Step_2    
${Verify}    Verify    
${Kessai}    Kessai
${Condition}    Verify_condition

# System name
${SYS}    RL_SCREEN

# Set Global Variable
${stamp_date}
${stamp_time}
${Set_text_to_global_for_capture_screen}    # // สำหรับ TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN

*** Keywords ***
# Create PIC format : DDMMYYY_TIMEHHMM_SYSTEM_TCNUMBER_NAMESCREEN.png
CAPTURE SCREEN DATE AND TIME
    ${stamp_date}    Get Current Date    result_format=%Y-%m-%m
    ${stamp_time}    Get Current Date    result_format=%H.%M.%S

        Set Global Variable    ${stamp_date}
        Set Global Variable    ${stamp_time}


TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN
    [Arguments]    ${Set_text_for_print_to_capture}

    ${Set_text_to_global_for_capture_screen}    BuiltIn.Set Variable    ${Set_text_for_print_to_capture}
        BuiltIn.Set Global Variable    ${Set_text_to_global_for_capture_screen}


CAPTURE SCREEN INTRO PAGE
    # //สำหรับ Capture Screen หน้า Page นั้นๆ โดยจะเก็บภาพรวมทั้งหมด
    CAPTURE SCREEN DATE AND TIME
        BuiltIn.Run Keyword And Ignore Error    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date}_${stamp_time} - ${SYS} - ${Set_text_to_global_for_capture_screen}.png


CAPTURE SCREEN CURRENT PAGE OLD VERSION
    # //สำหรับ Capture Screen หน้า Page นั้นๆ โดยจะเก็บภาพรวมทั้งหมด
    CAPTURE SCREEN DATE AND TIME
        BuiltIn.Run Keyword And Ignore Error    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date}_${stamp_time} - ${SYS} - TestCase_No_@{TEST_TAGS} - ${Set_text_to_global_for_capture_screen}.png


CAPTURE SCREEN CURRENT PAGE
    # //สำหรับ Capture Screen หน้า Page นั้นๆ โดยจะเก็บภาพรวมทั้งหมด
    # result > PIC > full date > image.png
    CAPTURE SCREEN DATE AND TIME
    Capture Page Screenshot    ${OUTPUT DIR}${/}PIC${/}${stamp_date}${/}${stamp_date}_${stamp_time} - ${SYS} - TC_No@{TEST_TAGS} - ${Set_text_to_global_for_capture_screen}.png


CAPTURE SCREEN ON FAILED
    # //สำหรับ Capture Screen เมื่อ Case Fail
    BuiltIn.Log    !!--- Capture because case fail ---!!
    CAPTURE SCREEN DATE AND TIME
    Capture Page Screenshot    ${OUTPUT DIR}${/}PIC${/}${stamp_date}${/}FAIL${/}${stamp_date}_${stamp_time} - ${SYS} - TestCase_No_@{TEST_TAGS} - ${Set_text_to_global_for_capture_screen}.png

    
CAPTURE SCREEN VERIFY POPUP CONDITION 
    CAPTURE SCREEN DATE AND TIME
        BuiltIn.Run Keyword And Ignore Error    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC_${stamp_date} - {index:03}.png - @{TEST_TAGS} - ${KeyInStep_1} - ${Verify_error} - {index:04}.png


CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1
    CAPTURE SCREEN DATE AND TIME
        BuiltIn.Run Keyword And Ignore Error    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC_${stamp_date} - {index:03}.png - @{TEST_TAGS} - ${KeyInStep_1} - ${validate_field} - {index:04}.png


CAPTURE SCREEN KEY1
    CAPTURE SCREEN DATE AND TIME
        BuiltIn.Run Keyword And Ignore Error    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${KeyInStep_1} @{TEST_TAGS} - {index:01}.png


CAPTURE SCREEN KEY2
    CAPTURE SCREEN DATE AND TIME
        BuiltIn.Run Keyword And Ignore Error    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${KeyInStep_2} @{TEST_TAGS} - {index:01}.png


CAPTURE SCREEN VERIFY
    CAPTURE SCREEN DATE AND TIME
        BuiltIn.Run Keyword And Ignore Error    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${Verify} @{TEST_TAGS} - {index:01}.png


CAPTURE SCREEN KESSAI
    CAPTURE SCREEN DATE AND TIME
        BuiltIn.Run Keyword And Ignore Error    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} ${stamp_time} ${Kessai} @{TEST_TAGS} - {index:01}.png


CAPTURE SCREEN VERIFY CONDITION
    CAPTURE SCREEN DATE AND TIME
        BuiltIn.Run Keyword And Ignore Error    Capture Page Screenshot    ${OUTPUT DIR}${/}/PIC/${stamp_date} - {index:03}/${stamp_date} - ${stamp_time} - ${SYS} @{TEST_TAGS} - ${Condition} - {index:04}.png
