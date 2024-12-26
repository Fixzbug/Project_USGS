*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

${ID_Number}
${name_cus}
${contact_cus}
${next_case}

${yaml_set_update_salary}    Actual_result_update_salary_yaml
${yaml_update_salary_title}    yaml_title_update_salary
${sheet_stamp}    Results


*** Keywords ***

REQUEST UPDATE SALARY PAGE - INPUT USENAME AND PASSWORD
    Common_keyword.SETTING LOGIN    REQ    ${group_user}[Username]    ${group_user}[Password]


REQUEST UPDATE SALARY PAGE - [CLICK] - LINK
    ${link_system}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[System]   
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${link_system}     
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   


REQUEST UPDATE SALARY PAGE - [CLICK] - [SELECT] BRANCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${sel_branch_for_click_locator}


REQUEST UPDATE SALARY PAGE - [INPUT] - [TEXT] BRANCH
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_sel_locator}   ${group_user}[BRANCH]


REQUEST UPDATE SALARY PAGE - [PRESS KEY] - ENTER
    Common_keyword.PRESS KEY    ${txt_sel_locator}    ENTER


REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_ok_cus_request_page_locator}
  

REQUEST UPDATE SALARY PAGE - [CLICK] - [MENU] 
    SeleniumLibrary.Execute Javascript    ${group_user}[Sub_menu]


# Input
REQUEST UPDATE SALARY PAGE - [INPUT] - [TEXT] ID NUMBER
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_clear_locator}    10s 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_txt_id_number_locator}    ${ID_card} 


REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_search}


REQUEST UPDATE SALARY PAGE - [INPUT]- [VERIFY] - [MODAL] VERIFY CHECK QUESTION PASS THREE QUESTION SHOULD BE - [CLICK] PASS 

    ${status_name}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_customer_name_locator}    15s    
    BuiltIn.Log    >Status:${status_name}    WARN
    
    IF  ${status_name}
        ${name_cus}    SeleniumLibrary.Get Text    ${txt_customer_name_locator}
        ${contact_cus}    SeleniumLibrary.Get Text    ${txt_contract_no_locator}
        BuiltIn.Log   >Name: ${name_cus}    WARN
        BuiltIn.Log   >ContactNo: ${contact_cus}    WARN
        BuiltIn.Set Global Variable    ${name_cus}
        BuiltIn.Set Global Variable    ${contact_cus}

        IF  '${name_cus}' != '' and '${contact_cus}' != ''

            BuiltIn.Log    !! QUESTION PASS    WARN
            ${status_modal}   BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_verify_customer}    10s   
            IF  ${status_modal}
                Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${chkbox1_true_xpath}
                ${status_table}   BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_table_chkbox}    10s
                IF  ${status_table} == True     
                    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${chkbox1_true_xpath}

                    FOR  ${index}  IN RANGE  1    9
                        ${locator}    String.Replace string    ${modal_table_chkbox_replace}    ***replace***    chkquestiontrue${index}
                        ${data}    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Get Element Attribute    ${locator}    disabled
                        IF  '${data}[1]' == 'None'
                            Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator}
                            ${count_chkbox}    BuiltIn.Evaluate    ${count_chkbox} + 1
                            IF  ${count_chkbox} == 3
                                Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_pass_question_popup_locator}
                                Common_keyword.WAITING FOR DATA UPDATE    3s
                                ${stats_}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_save_kyc_note_success_locator}    
                                BuiltIn.Log    >Status:${stats_}    WARN
                                IF  '${stats_}' == 'False'
                                    BuiltIn.Fail    !!! ERROR KYC !!!
                                END
                                BuiltIn.Exit For Loop
                            END
                        END
                    END
                END
                BuiltIn.Log    !!! MODAL QUESTION PASS DISPLAY !!!    WARN
                BuiltIn.Run Keyword And Ignore Error    REQUEST UPDATE SALARY PAGE - [CHECK] - [ALERT] 
                ${next_case}    BuiltIn.Set Variable    True
                BuiltIn.Set Global Variable    ${next_case}
            ELSE
                BuiltIn.Log    !!! MODAL QUESTION PASS NOT DISPLAY SKIP !!!    WARN
                # some id no modal
                BuiltIn.Run Keyword And Ignore Error    REQUEST UPDATE SALARY PAGE - [CHECK] - [ALERT] 
                ${next_case}    BuiltIn.Set Variable    True
                BuiltIn.Set Global Variable    ${next_case}
            END
        ELSE
            BuiltIn.Log    !!! NAME CUSTOMER NO DISPLAY !!!    WARN
        END
    ELSE
        BuiltIn.Log    !!! NAME CUSTOMER NO DISPLAY !!!    WARN
        Common_feature.WRITE STATUS DATA STOCK ID CARD    data_stock_update_salary_yaml    ERROR_PEDING_ID
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        ${next_case}    BuiltIn.Set Variable    False
        BuiltIn.Set Global Variable    ${next_case}
        BuiltIn.fail    !!! ERROR POPUP !!!
    END
    


REQUEST UPDATE SALARY PAGE - [CHECK] - [ALERT] 
    ${status_alert}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${header_alert}    5s     
    IF  ${status_alert}
        ${head_title}    SeleniumLibrary.Get Text    ${header_alert} 
        BuiltIn.Log    ----------------------------------------    WARN
        BuiltIn.Log    >HEAD TITLE:>${head_title}    WARN

        IF  '${head_title}' == 'Error'
            Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${title_alert}    5s
            ${text_title}    SeleniumLibrary.Get Text    ${title_alert}
            BuiltIn.Log    >TEXT TITLE:>${text_title}    WARN
            BuiltIn.Log    ----------------------------------------    WARN
            IF  "${text_title}" == "ไม่สามารถ Create Request Update Salary ได้กรุณาตรวจสอบ Update Salary Request Pending..!!"
                Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE     REQ    VERIFY REQUEST PASS CLICK SAVE
                BuiltIn.fail    !!!!!! ${text_title} !!!!!!!
            END
        END
    ELSE

        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${title_alert}    5s
        ${text_title}    SeleniumLibrary.Get Text    ${title_alert}
        BuiltIn.Log    >TEXT TITLE:>${text_title}    WARN

         IF  "${text_title}" == "Save Data Transection Complete."
            BuiltIn.Log    >NO ERROR ${text_title}    WARN
        END
    
    END


REQUEST UPDATE SALARY PAGE - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    2s    


REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] UPDATE SLARY
    ${locator}    BuiltIn.Set Variable    //button[@id='btn_upp_${ID_card}']
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${locator}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator}


REQUEST UPDATE SALARY PAGE - [GET] - [VERIFY] MODAL CONFIRM
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_comfirm}
    ${title_modal}    SeleniumLibrary.Get Text    ${modal_comfirm}
    BuiltIn.Log    ${title_modal}    WARN
    IF  '${title_modal}' != ''
        SeleniumLibrary.Execute Javascript    onSaveUpdateSalaryReqUPDModal()
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_save_kyc_save_locator} 
    ELSE    
        BuiltIn.Fail    !!! EEROR POPUP CONFRIM !!!        
    END
    

REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] SAVE
    SeleniumLibrary.Execute Javascript    fromBtnSummit()


REQUEST UPDATE SALARY PAGE - [MODAL] - [VERIFY] REQUEST REASON
    Common_keyword.SELCET OPTION    ${select_action_code}    ${input_action_code}    ADD : บันทึกข้อความทั่วไป
    SeleniumLibrary.Input Text    ${input_text_desc}    Automated Test Submit ID: ${ID_card}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_reason_ok}


REQUEST UPDATE SALARY PAGE - [VERIFY] - [MODAL] CONFIRM
    BuiltIn.Log    !! MODAL CONFIRM    WARN
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_confirm}    10s
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_confirmok}

    ${status_modal}    BuiltIn.Run Keyword And Return Status     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_requestno}    20s
    IF  ${status_modal}
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_txt_requestno}    10s
        ${requestno}    SeleniumLibrary.Get Text    ${modal_txt_requestno}    # Request No. : F67000243856
        BuiltIn.Log    >Request No FULL : ${requestno}    WARN
        
        ${parts}    String.Split String    ${requestno}    separator=:
        ${req}    String.Strip String   ${parts}[1]
        BuiltIn.Log    >Request No : ${req}    WARN

        ${rows_id_card_data_stock}    BuiltIn.Convert To String    ${rows_id_card_data_stock}    
    
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL INSERT ID NO    ${yaml_set_update_salary}    ${yaml_update_salary_title}     ${sheet_stamp}    TC    ${ID_card}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    ID_Number    ${ID_card}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    Customer_Name    ${name_cus}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    Contract_No    ${contact_cus}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    Request_No    ${req}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    Row_id_card    ${rows_id_card_data_stock}  
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    State    PASS_Request

        BuiltIn.Sleep    1s
        BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Execute Javascript    modalBtnOK()
    ELSE
        BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!! Fail_Request !!!!!!!!!!!!!!!!!!!!!!!!!!
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Request
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
    END



# Input interview
REQUEST UPDATE SALARY PAGE - [INPUT] - [TEXT] INTERVIEW - ID NUMBER 
    BuiltIn.Log    >ID_card:${ID_card}    WARN
    ${ID_card}    BuiltIn.Set Variable If    '${ID_card}' != 'none'    ${ID_card}    ${ID_Number}    # for case interview only       
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_approve_txt_id_number_locator}    ${ID_card}  


REQUEST UPDATE SALARY PAGE - [INPUT] - [DATE] INTERVIEW DATE FORM
    SeleniumLibrary.Execute Javascript    document.getElementById('txtDateFrom').value='01/01/2567'


REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] INTERVIEW SEARCH
    SeleniumLibrary.Execute Javascript    fromBtnSearch()


REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] INTERVIEW SELECT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${select_approve}


REQUEST UPDATE SALARY PAGE - [VERIFY] - [DATA] INTERVIEW DATA INFORMATION
 
    BuiltIn.Log   >Customer_Name: ${Customer_Name}    WARN
    ${status_name}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Page Contains    ${Customer_Name}    30s      
    BuiltIn.Log   >status_name: ${status_name}    WARN

    IF  ${status_name}
  
        ${name_cus}    SeleniumLibrary.Get Text    ${txt_customer_name_locator}
        BuiltIn.Log   >Name: ${name_cus}    WARN

        IF  '${name_cus}' != 'none'
        
            # ${birth_date}    SeleniumLibrary.Get Value    id=txtBirthdate 
            # ${age}    SeleniumLibrary.Get Text    id=txtBirthdate_Des 
            # BuiltIn.Log    >Birth_date:${birth_date}    WARN
            # BuiltIn.Log    >Age:${age}    WARN

            FILL ANSWER INTERVIEW PAGE    ${interview_matial_status_locator} 
            FILL ANSWER INTERVIEW PAGE    ${interview_gender_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_live_year_time_locator}    # 4 
            FILL ANSWER INTERVIEW PAGE    ${interview_live_month_time_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_occupant_amount_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_resident_type_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_business_type_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_career_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_children_amount_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_work_position_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_employee_amount_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_work_year_time_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_work_month_time_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_work_contract_type_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_salary_accept_type_locator}    # 03
            FILL ANSWER INTERVIEW PAGE    ${interview_customer_type_locator}
            
            Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_interview_salary_accept_type_locator}    5s    
            Common_keyword.CLICK ELEMENT BY LOCATOR    ${input_interview_salary_accept_type_locator}    
            SeleniumLibrary.Input Text    ${input_interview_salary_accept_type_locator}    03  
            SeleniumLibrary.Press Keys    NONE    TAB

            # FILL CALCULATED DOCUMENT
            Common_keyword.SELCET OPTION    ${select_salary_locator}    ${input_select_salary_locator}    01 : สลิปเงินเดือน/หนังสือรับรองเงินเดือน
            SeleniumLibrary.Input Text    ${interview_txt_new_salary_locator}    1000000
  
            # FILL ANSWER INTERVIEW PAGE    ${interview_province_locator}
            # FILL ANSWER INTERVIEW PAGE    ${interview_amphoe_locator}
            # FILL ANSWER INTERVIEW PAGE    ${interview_tambol_locator}
            # SeleniumLibrary.Input Text    ${interview_mobile_phone_locator}    0912345678

            ${next_case}    BuiltIn.Set Variable    True
            BuiltIn.Set Global Variable    ${next_case}
        END
    ELSE
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Interview
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        ${next_case}    BuiltIn.Set Variable    False
        BuiltIn.Set Global Variable    ${next_case}
        BuiltIn.Fail    !!!! ERROR NO DISPLAY NAME AND DATA INFOMATION !!!!
    END
   


REQUEST UPDATE SALARY PAGE - [VERIFY] - [MODAL] INTERVIEW CONFIRM
    BuiltIn.Log    !! MODAL INTERVIEW CONFIRM    WARN
    SeleniumLibrary.Execute javascript    ConfirmUPD()    #confirm
   

REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] INTERVIEW SAVE
    BuiltIn.Log    !! MODAL INTERVIEW SAVE    WARN
    SeleniumLibrary.Execute Javascript    fromBtnSummit()


REQUEST UPDATE SALARY PAGE - [MODAL] - [VERIFY] INTERVIEW REASON
    BuiltIn.Log    >ID_card:${ID_card}    WARN
    ${ID_card}    BuiltIn.Set Variable If    '${ID_card}' != 'none'    ${ID_card}    ${ID_Number}    # for case interview only      

    Common_keyword.SELCET OPTION    ${select_action_code}    ${input_action_code}    ADD : บันทึกข้อความทั่วไป
    SeleniumLibrary.Input Text    ${input_text_desc}    Automated Test Submit ID: ${ID_card}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_reason_ok}


REQUEST UPDATE SALARY PAGE - [VERIFY] - [MODAL] INTERVIEW SAVE CONFIRM
    BuiltIn.Log    >ID_card:${ID_card}    WARN
    ${ID_card}    BuiltIn.Set Variable If    '${ID_card}' != 'none'    ${ID_card}    ${ID_Number}     # for case interview only     

    BuiltIn.Log    !! MODAL CONFIRM    WARN
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_confirm}    20s
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_confirmok}

    ${status_modal}    BuiltIn.Run Keyword And Return Status     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_requestno}    20s
    IF  ${status_modal}
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_txt_requestno}    10s
        ${requestno}    SeleniumLibrary.Get Text    ${modal_txt_requestno}    # Request No. : F67000243856
        BuiltIn.Log    >Request No FULL : ${requestno}    WARN
        
        ${parts}    String.Split String    ${requestno}    separator=:
        ${req}    String.Strip String   ${parts}[1]
        BuiltIn.Log    >Request No : ${req}    WARN

        ${rows_id_card_data_stock}    BuiltIn.Convert To String    ${rows_id_card_data_stock}    
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    Request_No    ${req}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    State    PASS_Interview

        BuiltIn.Sleep    1s
        BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Execute Javascript    modalBtnOK()
    ELSE
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Interview
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!! Fail_Interview !!!!!!!!!!!!!!!!!!!!!!!!!!
    END


FILL ANSWER INTERVIEW PAGE
    [Arguments]    ${locator}
    SeleniumLibrary.Execute JavaScript    ${locator}.click();
    BuiltIn.Sleep  0.2s
    SeleniumLibrary.Press Keys    NONE    1
    BuiltIn.Sleep  0.2s
    SeleniumLibrary.Press Keys    NONE    ARROW_DOWN
    BuiltIn.Sleep  0.2s
    SeleniumLibrary.Press Keys    NONE    ENTER
    BuiltIn.Sleep  0.2s


PRESS KEY MUTIPLE TIMES
    [Arguments]    ${key}    ${times}
    FOR  ${index}  IN RANGE  ${times}
        SeleniumLibrary.Press Keys    NONE    ${key}
    END


FILL CALCULATED DOCUMENT
    Common_keyword.CLICK ELEMENT AND SCROLL INTO VIEW WHEN ELEMENT IS VISIBLE    ${interview_calculated_document_locator}
    # BuiltIn.Sleep  0.5s
    SeleniumLibrary.Press Keys    NONE    0
    # BuiltIn.Sleep  0.5s
    SeleniumLibrary.Press Keys    NONE    ARROW_DOWN
    SeleniumLibrary.Press Keys    NONE    ENTER


# Input Approve
REQUEST UPDATE SALARY PAGE - [INPUT] - [TEXT] APPROVE - ID NUMBER 
    BuiltIn.Log    >ID_card:${ID_card}    WARN
    ${ID_card}    BuiltIn.Set Variable If    '${ID_card}' != 'none'    ${ID_card}    ${ID_Number}    # for case interview only       
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_approve_txt_id_number_locator}    ${ID_card}  


REQUEST UPDATE SALARY PAGE - [INPUT] - [DATE] APPROVE DATE FORM
    SeleniumLibrary.Execute Javascript    document.getElementById('txtDateFrom').value='01/01/2567'


REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] APPROVE SEARCH
    SeleniumLibrary.Execute Javascript    fromBtnSearch()


REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] APPROVE SELECT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${select_approve}


REQUEST UPDATE SALARY PAGE - [VERIFY] - [DATA] APPROVE DATA INFORMATION
 
    BuiltIn.Log   >Customer_Name: ${Customer_Name}    WARN
    ${status_name}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Page Contains    ${Customer_Name}    15s      
    BuiltIn.Log   >status_name: ${status_name}    WARN

    IF  ${status_name}
  
        ${name_cus}    SeleniumLibrary.Get Text    ${txt_customer_name_locator}
        BuiltIn.Log   >Name: ${name_cus}    WARN

        IF  '${name_cus}' != 'none'
        
            # ${birth_date}    SeleniumLibrary.Get Value    id=txtBirthdate 
            # ${age}    SeleniumLibrary.Get Text    id=txtBirthdate_Des 
            # BuiltIn.Log    >Birth_date:${birth_date}    WARN
            # BuiltIn.Log    >Age:${age}    WARN

            FILL ANSWER INTERVIEW PAGE    ${interview_matial_status_locator} 
            FILL ANSWER INTERVIEW PAGE    ${interview_gender_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_live_year_time_locator}    # 4 
            FILL ANSWER INTERVIEW PAGE    ${interview_live_month_time_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_occupant_amount_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_resident_type_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_business_type_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_career_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_children_amount_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_work_position_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_employee_amount_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_work_year_time_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_work_month_time_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_work_contract_type_locator}
            FILL ANSWER INTERVIEW PAGE    ${interview_salary_accept_type_locator}    # 03
            FILL ANSWER INTERVIEW PAGE    ${interview_customer_type_locator}
            
            Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_interview_salary_accept_type_locator}    5s    
            Common_keyword.CLICK ELEMENT BY LOCATOR    ${input_interview_salary_accept_type_locator}    
            SeleniumLibrary.Input Text    ${input_interview_salary_accept_type_locator}    03  
            SeleniumLibrary.Press Keys    NONE    TAB

            # FILL CALCULATED DOCUMENT
            Common_keyword.SELCET OPTION    ${select_salary_locator}    ${input_select_salary_locator}    01 : สลิปเงินเดือน/หนังสือรับรองเงินเดือน
            SeleniumLibrary.Input Text    ${interview_txt_new_salary_locator}    1000000
  
            # FILL ANSWER INTERVIEW PAGE    ${interview_province_locator}
            # FILL ANSWER INTERVIEW PAGE    ${interview_amphoe_locator}
            # FILL ANSWER INTERVIEW PAGE    ${interview_tambol_locator}
            # SeleniumLibrary.Input Text    ${interview_mobile_phone_locator}    0912345678
            ${next_case}    BuiltIn.Set Variable    True
            BuiltIn.Set Global Variable    ${next_case}
        END
    ELSE
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Approve
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        ${next_case}    BuiltIn.Set Variable    False
        BuiltIn.Set Global Variable    ${next_case}
        BuiltIn.Fail    !!!! ERROR NO DISPLAY NAME AND DATA INFOMATION !!!!
    END
   


REQUEST UPDATE SALARY PAGE - [VERIFY] - [MODAL] APPROVE CONFIRM
    BuiltIn.Log    !! MODAL APPROVE CONFIRM    WARN
    SeleniumLibrary.Execute javascript    ConfirmUPD()    #confirm
   

REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] APPROVE
    BuiltIn.Log    !! MODAL BUTTON APPROVE    WARN
    SeleniumLibrary.Execute Javascript    fromBtnApprove()


REQUEST UPDATE SALARY PAGE - [MODAL] - [VERIFY] APPROVE
    BuiltIn.Log    !! MODAL APPROVE    WARN
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    id=ApproveConfirmModal    10s
    SeleniumLibrary.Execute Javascript    ApproveConfirm('Y')


REQUEST UPDATE SALARY PAGE - [VERIFY] - [MODAL] APPROVE SAVE CONFIRM
    BuiltIn.Log    >ID_card:${ID_card}    WARN
    ${ID_card}    BuiltIn.Set Variable If    '${ID_card}' != 'none'    ${ID_card}    ${ID_Number}     # for case interview only     

    BuiltIn.Log    !! MODAL CONFIRM    WARN
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_confirm}    10s
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_confirmok}

    ${status_modal}    BuiltIn.Run Keyword And Return Status     Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_requestno}    20s
    IF  ${status_modal}
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_txt_requestno}    10s
        ${requestno}    SeleniumLibrary.Get Text    ${modal_txt_requestno}    # Request No. : F67000243856
        BuiltIn.Log    >Request No FULL : ${requestno}    WARN
        
        ${parts}    String.Split String    ${requestno}    separator=:
        ${req}    String.Strip String   ${parts}[1]
        BuiltIn.Log    >Request No : ${req}    WARN

        ${rows_id_card_data_stock}    BuiltIn.Convert To String    ${rows_id_card_data_stock}    
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    Request_No    ${req}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    State    PASS_Approve

        BuiltIn.Sleep    1s
        BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Execute Javascript    modalBtnOK()
    ELSE
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_update_salary}    ${yaml_update_salary_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Approve
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!! Fail_Approve !!!!!!!!!!!!!!!!!!!!!!!!!!
    END


