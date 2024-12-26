*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot


*** Keywords ***

SEARCH ID NUMBER 
    [Arguments]    ${set_tc_value}    ${sheet}

    ${set_tc_value_Walk1}     BuiltIn.Set Variable      ${set_tc_value}
    ${group_value_Walkin}     Get value from json      ${sheet}       $[?(@.TC=='${set_tc_value_Walk1}')]
    
        BuiltIn.Wait Until Keyword Succeeds   20x    1s    Inquiry_application_page.INPUT ID NUMBER    ${group_value_Walkin}[0][ID]
            
            BuiltIn.Wait Until Keyword Succeeds   20x    1s    Inquiry_application_page.CLICK SEARCH BUTTON

                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_ID_NUMBER

                    Capture_screen.CAPTURE SCREEN CURRENT PAGE

                        BuiltIn.Wait Until Keyword Succeeds   20x    1s    Inquiry_application_page.CLICK SELECT BUTTON


VERIFY DATA INQUIRY
    [Arguments]    ${TS_no}    ${field_name}

    ${set_tc_value}    Set variable    ${TS_no}
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

    ${set_tc_value}    Set variable    INDEX
    ${group_value_index}    Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

    ${index_data_page}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value_index}[0][${field_name}]
    
        BuiltIn.Sleep    03s
        ${group_data_inquiry}    Common_keyword.GET DATA TEXT BY LOCATOR AND SCROLL    ${lbl_application_detail_inquiry_locator}  

            BuiltIn.Run Keyword And Continue On Failure    Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL    ${field_name}    ${index_data_page}    ${group_value}   ${group_data_inquiry}


VERIFY DATA INQUIRY FOR DATA FLOAT
    [Arguments]    ${TS_no}    ${field_name}

    ${set_tc_value}    Set variable    ${TS_no}
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

    ${set_tc_value}    Set variable    INDEX
    ${group_value_index}    Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

    ${index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value_index}[0][${field_name}]

    ${data}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value}[0][${field_name}]
    
        BuiltIn.Sleep    03s
        ${group_data_inquiry}    Common_keyword.GET DATA TEXT BY LOCATOR AND SCROLL    ${lbl_application_detail_inquiry_locator}    

            BuiltIn.Run Keyword And Continue On Failure    BuiltIn.Should Be Equal    '${group_data_inquiry}[${index}]'    '${data}'



VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN
    [Arguments]    ${TS_no}    ${field_name}

    ${set_tc_value}    Set variable    ${TS_no}
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC == '${set_tc_value}')]

    ${set_tc_value}    Set variable    INDEX
    ${group_value_index}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC == '${set_tc_value}')]

    ${index_data_page}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value_index}[0][${field_name}]
    
        BuiltIn.Sleep    03s
        ${group_data_inquiry}    Common_keyword.GET DATA TEXT BY LOCATOR    ${lbl_speed_time_step_key_in_step_1_2_inquiry_locator}  

            BuiltIn.Run Keyword And Continue On Failure    Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL    ${field_name}    ${index_data_page}    ${group_value}    ${group_data_inquiry}


VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL
    [Arguments]    ${TS_no}    ${field_name}

    ${set_tc_value}    Set variable    ${TS_no}
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC == '${set_tc_value}')]

    ${set_tc_value}    Set variable    INDEX
    ${group_value_index}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC == '${set_tc_value}')]

    ${index_data_page}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value_index}[0][${field_name}]
    
        BuiltIn.Sleep    03s
        ${group_data_inquiry}    Common_keyword.GET DATA TEXT BY LOCATOR    ${lbl_speed_time_step_verify_call_inquiry_locator}  

            BuiltIn.Run Keyword And Continue On Failure    Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL    ${field_name}    ${index_data_page}    ${group_value}    ${group_data_inquiry}


VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT
    [Arguments]    ${TS_no}    ${field_name}

    ${set_tc_value}    Set variable    ${TS_no}
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC == '${set_tc_value}')]

    ${set_tc_value}    Set variable    INDEX
    ${group_value_index}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC == '${set_tc_value}')]

    ${index_data_page}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value_index}[0][${field_name}]
    
        BuiltIn.Sleep    03s
        ${group_data_inquiry}    Common_keyword.GET DATA TEXT BY LOCATOR    ${lbl_speed_time_step_judment_inquiry_locator}  

            BuiltIn.Run Keyword And Continue On Failure    Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL    ${field_name}    ${index_data_page}    ${group_value}    ${group_data_inquiry}
