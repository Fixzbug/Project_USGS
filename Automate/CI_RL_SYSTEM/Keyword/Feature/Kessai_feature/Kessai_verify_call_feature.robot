*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot


*** Variables ***
${lbl_CustNo}
${lbl_ContNo}
${lbl_ContDate}

# Global
${app_no}
${strip_result_appno}

*** Keywords ***

SET CLICK CONFIRM KESSAI VERIFY CALL

    BuiltIn.Log    !!----------->Tab: Verify Call<-----------!!    WARN
    Kessai_verify_call_page.KESSAI VERIFY CALL - WAIT VIEW CUSTOMER VERIFY CALL JUDGMENT (KESSAI)
    Kessai_verify_call_page.KESSAI VERIFY CALL - WAIT FILTER NOTE
    Kessai_verify_call_page.KESSAI VERIFY CALL - CHECK APP NO AND BRANCH
    Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK TAB VERIFY CALL

    # ถ้าเลข appno ตรง
    IF    '${app_no}' == '${strip_result_appno}'
        Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK BUTTON CONFIRM CUSTTYPE
        Kessai_verify_call_page.KESSAI VERIFY CALL - WAIT POPUP SUCCESS
        
        Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TO
        Kessai_verify_call_page.KESSAI VERIFY CALL - WAIT POPUP SUCCESS TO

        Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TH
        Kessai_verify_call_page.KESSAI VERIFY CALL - WAIT POPUP SUCCESS TH

        Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TM
        Kessai_verify_call_page.KESSAI VERIFY CALL - WAIT POPUP SUCCESS TM

        Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TE
        Kessai_verify_call_page.KESSAI VERIFY CALL - WAIT POPUP SUCCESS TE

        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KESSAI_VERIFY_CALL_PAGE
        Capture_screen.CAPTURE SCREEN CURRENT PAGE
    ELSE
        Kessai_verify_call_page.KESSAI VERIFY CALL - RETURN TO VERIFY
        Common_keyword.INTRANET TEARDOWN
        SET FEATURE - E2E MATRIX CASE KESSAI
    END

SET CLICK CONFIRM KESSAI VERIFY CALL (CLOSING)

    Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK TAB VERIFY CALL
    Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK BUTTON CONFIRM CUSTTYPE
    Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TM
    Kessai_verify_call_page.KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TE



SEARCH AND SELECT CUTTOMER BY ID NUMBER    
    [Arguments]    ${set_tc_value_case}    ${data_sheet}

    ${set_tc_value}     BuiltIn.Set Variable      ${set_tc_value_case}
    ${group_value}     Get value from json      ${data_sheet}       $[?(@.TC=='${set_tc_value}')]

    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Verify_call_page.INPUT ID NUMBER    ${group_value}[0][ID]
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Verify_call_page.CLICK SEARCH BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Verify_call_page.CLICK SELECT BUTTON


SET FEATURE - E2E MATRIX CASE KESSAI

    IF  '${state_next_step}' != 'Not Success : Changepriority_KES'

        IF  '${TC_no}' != '' and '${ID_no}' != '' and '${branch}' != '' and '${app_no}' != '' and '${card}' != ''
            
            BuiltIn.Log    !!REDY TO KESSAI!!

            # Login SSO
            Login_page.SET LOGIN SSO TO RL    Kessai
            Common_keyword.WAIT STATE AUTOALLOWCATE OR MANUAL    AUTOALLOWCATE

            BuiltIn.Log    TC_no->${TC_no}    WARN
            Common_feature.SET ACTUAL RESULT NAME
            Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel}[${Excel_Actual_Result}]    ${TC_no}
            ${group_value}    JSONLibrary.Get Value From Json    ${data_matrix_test_case}    $[?(@.TC=='${TC_no}')]

            FOR  ${index_data}   IN RANGE    0    ${count_row_excel_data_actual_result}   

                ${result_branch}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][Branch]
                ${result_app_no}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][App_no]
                ${result_state}     BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][State]

                IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'Change_to_KES'

                    BuiltIn.Log    !!KESSAI_>${result_state}!!    WARN 
                    BuiltIn.Log    result_appno->${result_state} : ${result_app_no}    WARN
                    BuiltIn.Log    -------------------------------    WARN

                    ${status_1}    BuiltIn.Run Keyword And Return Status    SET CLICK CONFIRM KESSAI VERIFY CALL    # Tab verify call
                    BuiltIn.Log    >KESSAI CALL->${status_1}    WARN  
                    ${status_2}    BuiltIn.Run Keyword And Return Status    Kessai_judment_feature.SET INPUT AND SELECT DROPDOWN TO CLICK CONFIRM KESSAI JUDGMENT    ${group_value}    # Tab judgment
                    BuiltIn.Log    >KESSAI JUDGMENT->${status_2}    WARN

                    IF  '${status_1}' == 'True' and '${status_2}' == 'True'
                        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State          New_Contract
                        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    Contract_no    ${lbl_ContNo}
                        BuiltIn.Log    !!KESSAI PASS!!   WARN
                        BuiltIn.Log    ---------------------------------   WARN
                        Common_keyword.INTRANET TEARDOWN    Time_kessai
                    ELSE
                        BuiltIn.Log     !!>KESSAI CALL->${status_1} and >KESSAI JUDGMENT->${status_2}!!    WARN
                        BuiltIn.fail    !!>KESSAI CALL->${status_1} and >KESSAI JUDGMENT->${status_2}!!
                    END
                    
                    BuiltIn.Exit For Loop
                END
            END
        ELSE
            BuiltIn.Log     !!NOT PASS KESSAI ERROR SOME STEP CHECK LOG AND EXCEL!!    WARN
            BuiltIn.fail    !!NOT PASS KESSAI ERROR SOME STEP CHECK LOG AND EXCEL!!
            Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Kessai
        END
    ELSE
        BuiltIn.Log     !!NOT PASS CHANGE INERTVIEW BEFORE MAKE KESSAI!!    WARN
        BuiltIn.fail    !!NOT PASS CHANGE INERTVIEW BEFORE MAKE KESSAI!!
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Kessai
    END