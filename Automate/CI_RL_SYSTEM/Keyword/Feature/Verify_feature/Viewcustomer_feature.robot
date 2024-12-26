*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore


*** Variables ***
${status}
${state_next_step}    Not Success : INTERVIEW


*** Keywords ***

SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    
    IF  '${state_next_step}' != 'Not Success : Changepriority_INT'

        IF  '${TC_no}' != '' and '${ID_no}' != '' and '${branch}' != '' and '${app_no}' != '' and '${card}' != ''

            BuiltIn.Set global Variable    ${state_next_step} 

            BuiltIn.Log    !!REDY TO VIEWCUSTOMER!!

            # Login SSO
            Login_page.SET LOGIN SSO TO RL    Verify

            BuiltIn.Log    TC_no->${TC_no}    WARN
            Common_feature.SET ACTUAL RESULT NAME
            Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel}[${Excel_Actual_Result}]    ${TC_no}
            ${group_value}    JSONLibrary.Get Value From Json    ${data_matrix_test_case}    $[?(@.TC=='${TC_no}')]

            FOR  ${index_data}   IN RANGE    0    ${count_row_excel_data_actual_result}   

                ${result_branch}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][Branch]
                ${result_app_no}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][App_no]
                ${result_state}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][State]

                IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'Change_to_INT'

                    BuiltIn.Log    !!SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER_>${result_state}!!    WARN 
                    BuiltIn.Log    result_appno->${result_state} : ${result_app_no}    WARN
                    BuiltIn.Log    -------------------------------    WARN

                    ${status_1}    BuiltIn.Run Keyword And Return Status    SET INPUT AND SELECT TO CLICK CONFIRM VIEWCUSTOMER     ${group_value}
                    BuiltIn.Log    >VIEWCUSTOMER->${status_1}    WARN  
                    ${status_2}    BuiltIn.Run Keyword And Return Status    Verify_call_feature.SET VERIFY CALL INPUT TO NEXT STEP    ${group_value}
                    BuiltIn.Log    >VERIFY CALL->${status_2}    WARN  
                    ${status_3}    BuiltIn.Run Keyword And Return Status    Verify_judment_feature.SET INPUT AND SELECT DROPDOWN TO CLICK CONFIRM    ${group_value} 
                    BuiltIn.Log    >VERIFY JUDGMENT->${status_3}    WARN
                    Common_keyword.INTRANET TEARDOWN    Time_verify
                    
                    IF  '${status_2}' == 'True' and '${status_3}' == 'True'
                        ${state_next_step}    BuiltIn.Set Variable    INT
                        BuiltIn.Set global Variable    ${state_next_step} 
                        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    INT
                        BuiltIn.Log    !!VERIFY PASS!!   WARN
                    ELSE
                        BuiltIn.Log     !!>VIEWCUSTOMER->${status_1} and >VERIFY CALL->${status_2} and >VERIFY JUDGMENT->${status_3}!!    WARN
                        BuiltIn.fail    !!>VIEWCUSTOMER->${status_1} and >VERIFY CALL->${status_2} and >VERIFY JUDGMENT->${status_3}!!
                    END

                    BuiltIn.Exit For Loop
                END
            END
        ELSE
            BuiltIn.Log     !!NOT PASS VIEWCUSTOMER ERROR SOME STEP CHECK LOG AND EXCEL!!    WARN
            BuiltIn.fail    !!NOT PASS VIEWCUSTOMER ERROR SOME STEP CHECK LOG AND EXCEL!!
            Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : INTERVIEW
        END
    ELSE
        BuiltIn.Log     !!NOT PASS CHANGE KS2 BEFORE MAKE INERTVIEW!!    WARN
        BuiltIn.fail    !!NOT PASS CHANGE KS2 BEFORE MAKE INERTVIEW!!
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : INTERVIEW
    END

   
SET INPUT AND SELECT TO CLICK CONFIRM VIEWCUSTOMER
    [Arguments]    ${group_value}

    Viewcustomer_page.VIEWCUSTOMER - INPUT E1    ${group_value}
    Viewcustomer_page.VIEWCUSTOMER - INPUT E2    ${group_value}
    Viewcustomer_page.VIEWCUSTOMER - INPUT E3    ${group_value}
    Viewcustomer_page.VIEWCUSTOMER - INPUT E4    ${group_value}
    Viewcustomer_page.VIEWCUSTOMER - INPUT E5    ${group_value}
    Viewcustomer_page.VIEWCUSTOMER - INPUT E6    ${group_value}
    # Viewcustomer_page.VIEWCUSTOMER - INPUT E7    ${group_value}
    Viewcustomer_page.VIEWCUSTOMER - SELECT DROPDOWN E8    ${group_value}        
    Viewcustomer_page.VIEWCUSTOMER - SELECT DROPDOWN E9    ${group_value}
    Viewcustomer_page.VIEWCUSTOMER - INPUT E10    ${group_value}
    Viewcustomer_page.VIEWCUSTOMER - SELECT DROPDOWN E11    ${group_value}
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VIEW_CUSTOMER_PAGE
    Capture_screen.CAPTURE SCREEN CURRENT PAGE
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Viewcustomer_page.VIEWCUSTOMER - CLICK BUTTON CONFIRM VIEWCUSTOMER