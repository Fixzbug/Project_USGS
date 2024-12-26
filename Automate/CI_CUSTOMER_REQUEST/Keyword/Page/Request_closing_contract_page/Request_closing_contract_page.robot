*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

${yaml_set_closing}    Actual_result_closing_contract_yaml
${yaml_set_closing_title}    yaml_title_closing
${sheet_stamp}    Results

*** Keywords ***

SET FORMAT DATA - SHEET CLOSING CONTRACT FOR VERIFY
    [Arguments]    ${row}    
    ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]
    ${group_data}    BuiltIn.Set Variable   ${result_excel}[0]
    BuiltIn.Set Global Variable    ${group_data}
    ${CASE}    BuiltIn.Set Variable    '${group_data}[Case]'

 
REQUEST CLOSING CONTRACT PAGE - INPUT USENAME AND PASSWORD
    BuiltIn.Log    !! Login !!    WARN
    Common_keyword.SETTING LOGIN    REQ    ${group_user}[Username]    ${group_user}[Password]


REQUEST CLOSING CONTRACT PAGE - [CLICK] - LINK 
    ${link_system}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[System]   
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${link_system}     
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   


REQUEST CLOSING CONTRACT PAGE - [CLICK] - [SELECT] BRANCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${sel_branch_for_click_locator}


REQUEST CLOSING CONTRACT PAGE - [INPUT] - [TEXT] BRANCH
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_sel_locator}   ${group_user}[BRANCH]


REQUEST CLOSING CONTRACT PAGE - [PRESS KEY] - ENTER
    Common_keyword.PRESS KEY    ${txt_sel_locator}    ENTER


REQUEST CLOSING CONTRACT PAGE - [CLICK] - [BTN] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_ok_cus_request_page_locator}
  

REQUEST CLOSING CONTRACT PAGE - [CLICK] - [MENU] 
    Execute Javascript    ${group_user}[Sub_menu]
 
# get text
REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] CUSTOMER NAME

    BuiltIn.Set Global Variable    ${yaml_set_closing}
    BuiltIn.Set Global Variable    ${yaml_set_closing_title} 
    BuiltIn.Set Global Variable    ${sheet_stamp}

    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_customer_name_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL INSERT ID NO    ${yaml_set_closing}    ${yaml_set_closing_title}     ${sheet_stamp}    TC    ${ID_card}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    ID_Number    ${ID_card}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Customer_Name    ${data}



REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] CONTRACT NO
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_contract_no_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Contract_No    ${data}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] STATUS
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_status_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Status    ${data}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] CARD NO
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_card_no_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Card_No    ${data}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] DUE DATE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_due_date_locator} 
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Due_Date    ${data}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] CREDIT LIMIT
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_credit_limit_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Credit_Limit    ${data}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] CREDIT AVAILABLE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_credit_available_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Credite_Available    ${data} 


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] RL LIMIT
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_rl_limit_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    RL_Limit    ${data}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] RL AVAILABLE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_rl_available_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    RL_Available    ${data}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] OUTSTANDING BAL
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_outstanding_bal_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Outstanding_Bal    ${data}  


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] DUTY BUREAU
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_duty_bureau_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Duty_Bureau    ${data}  


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] PAYMENT FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_payment_fee_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Payment_Fee    ${data}  


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] RE-ISSUE FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_re_issue_fee_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Re_issue_Fee    ${data}  


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] HANDLING FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_handling_fee_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Handling_Fee    ${data}  


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] TRANSACTION FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_transaction_fee_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Transaction_Fee    ${data} 


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] TRANSACTION CHECKUP
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_transaction_checkup_locator}  
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Transaction_Check_up    ${data}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] AR2 FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_ar2_fee_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    AR2_Fee    ${data}  


# verify
REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] ID NUMBER  
    ${data_number}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${input_txt_id_number_locator}
    ${data_cusname}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_customer_name_locator}
    WHILE  '${data_number}' == 'None' and '${data_cusname}' == 'None'
        SeleniumLibrary.Reload Page
        ${data_number}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${input_txt_id_number_locator}
        ${data_cusname}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_customer_name_locator}
        IF  '${data_number}' != 'none' and '${data_cusname}' != 'None'
            Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data_number}    ${ID_card}
            BREAK
        END
    END


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] CUSTOMER NAME
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_customer_name_locator} 
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Customer_Name}    


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] CONTRACT NO
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_contract_no_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Contract_No}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] STATUS
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_status_locator}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Status}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] CARD NO
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_card_no_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Card_No}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] DUE DATE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_due_date_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Due_Date}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] CREDIT LIMIT
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_credit_limit_locator} 
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Credit_Limit}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] CREDIT AVAILABLE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_credit_available_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Credite_Available}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] RL LIMIT
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_rl_limit_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${RL_Limit}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] RL AVAILABLE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_rl_available_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${RL_Available}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] OUTSTANDING BAL
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_outstanding_bal_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Outstanding_Bal}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] DUTY BUREAU
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_duty_bureau_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Duty_Bureau}

REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] PAYMENT FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_payment_fee_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Payment_Fee}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] RE-ISSUE FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_re_issue_fee_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Re_issue_Fee}

REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] HANDLING FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_handling_fee_locator} 
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Handling_Fee}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] TRANSACTION FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_transaction_fee_locator} 
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Transaction_Fee}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] TRANSACTION CHECKUP
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_transaction_checkup_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Transaction_Check_up}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] AR2 FEE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_ar2_fee_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${AR2_Fee}


REQUEST CLOSING CONTRACT PAGE - [GET] - [TEXT] - [VERIFY] CLOSING REASON
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_closing_reason_locator} 
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Customer_Name}


# verify btn    
REQUEST CLOSING CONTRACT PAGE - [SELCET] - [SELCET] CLOSING REASON
    Common_keyword.SELECT OPTION BY LABEL NAME PRESS KEYS    ${select_closing_reason_locator}    ${group_user}[Closing_Reason]  


REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [BTN] SAVE 
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${btn_save_id}    Save
  

REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [BTN] CANCEL
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${btn_cancel_id}    Cancel


REQUEST CLOSING CONTRACT PAGE - [CLICK] - [BTN] SAVE 
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE   ${btn_save_id}    
  

REQUEST CLOSING CONTRACT PAGE - [CLICK] - [BTN] CANCEL
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_cancel_id}    


# verify welcome text
REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [TEXT] WELCOME CUSTOMER REQUEST SCREEN
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_welcome_customer_request_screen_locator}    60s


# wait update page 
REQUEST CLOSING CONTRACT PAGE - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    2s    


# Input
REQUEST CLOSING CONTRACT PAGE - [INPUT] - [TEXT] ID NUMBER
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_clear_locator}    10s 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_txt_id_number_locator}    ${ID_card}  


# Input
REQUEST CLOSING CONTRACT PAGE - [INPUT] - [TEXT] APPROVE - ID NUMBER 
    BuiltIn.Log    ${ID_card}    WARN
    IF  '${ID_card}' == 'none'
        Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_approve_txt_id_number_locator}    ${ID_Number}  
    ELSE    
        Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_approve_txt_id_number_locator}    ${ID_card}  
    END
    

# click search
REQUEST CLOSING CONTRACT PAGE - [CLICK] - [BTN] SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_search}
    

REQUEST CLOSING CONTRACT PAGE - [CLICK] - [BTN] APPROVE SEARCH
    Execute Javascript    fromBtnSearch()


REQUEST CLOSING CONTRACT PAGE - [CLICK] - [BTN] APPROVE SELECT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${select_approve}


REQUEST CLOSING CONTRACT PAGE - [INPUT] - [VERIFY] - [MODAL] VERIFY CHECK QUESTION PASS THREE QUESTION SHOULD BE - [CLICK] PASS 
    
    BuiltIn.Log    !! QUESTION PASS    WARN
    ${status_modal}   BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_verify_customer}    60s   
    IF  ${status_modal}
        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${chkbox1_true_xpath}
        ${status_table}   BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${modal_table_chkbox}    10s
        IF  ${status_table} == True     
            Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${chkbox1_true_xpath}
            FOR  ${index}  IN RANGE  1    9    # fix 8 dropdown check box
                ${locator}    String.Replace string    ${modal_table_chkbox_replace}    ***replace***    chkquestiontrue${index}
                ${data}    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Get Element Attribute    ${locator}    disabled
                IF  '${data}[1]' == 'None'
                    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator}
                    ${count_chkbox}    BuiltIn.Evaluate    ${count_chkbox} + 1
                    IF  ${count_chkbox} == 3
                        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_pass_question_popup_locator}
                        Common_keyword.WAITING FOR DATA UPDATE    3s
                        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_save_kyc_note_success_locator}    
                        BuiltIn.Exit For Loop
                    END
                END
            END
        END
    ELSE
        BuiltIn.fail    !!! ERROR MODAL QUESTION PASS NOT DISPLAY !!!
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
    END


REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [MODAL] CONFIRM REQUEST
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_verify_confirm_request}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_confirm_ok_id}
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_verify_save_complete}
    ${result_request_no}    Common_keyword.GET DATA PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_request_no_locator}

    BuiltIn.Set Global Variable    ${result_request_no}
    BuiltIn.Log    Request No. : ${result_request_no}    WARN

    ${rows_id_card_data_stock}    BuiltIn.Convert To String    ${rows_id_card_data_stock}    

    BuiltIn.Log    rows_id_card_data_stock : ${rows_id_card_data_stock}    WARN

    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Request_No    ${result_request_no}  
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    Row_id_card    ${rows_id_card_data_stock}  
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${ID_card}    TC    State    PASS_Request  

    Execute Javascript    modalBtnOK()


REQUEST CLOSING CONTRACT PAGE - [CLICK] - [BTN] APPROVE 
    BuiltIn.Log    !! APPROVE   WARN
    Execute Javascript    fromBtnApprove() 



REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [MODAL] APPROVE CONFIRM
    BuiltIn.Log    !! MODAL CONFIRM    WARN
    
    SeleniumLibrary.Wait Until Element Is Visible    ${modal_approve_confirm}    10s
    Execute Javascript    modalbtnConfirmApp('Y')
    SeleniumLibrary.Wait Until Element Is Visible    ${modal_requestno}    20s
    SeleniumLibrary.Wait Until Element Is Visible    ${modal_txt_requestno}    10s
    ${requestno}    SeleniumLibrary.Get Text    ${modal_txt_requestno}    # Request No. : F67000243409 Map Card Complete

    ${parts}    String.Split String    ${requestno}    :
    ${req_1}    Common_keyword.EXTRACT ALPHANUMERIC    ${parts[1]}
  
    ${req_1}    String.Split String    ${req_1}    separator=${SPACE}
    ${req_1}    String.Strip String    ${req_1}[0]

    BuiltIn.Log    Request No. : ${req_1}    WARN

    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${TC}    TC    Request_No_Approve    ${req_1}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${TC}    TC    State    SuccessApprove
        
    Execute Javascript    modalBtnOK()



REQUEST CLOSING CONTRACT PAGE - [CLICK] - [BTN] REJECT 
    BuiltIn.Log    !! REJECT   WARN
    Execute Javascript    fromBtnReject() 


REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [MODAL] REJECT CONFIRM
    BuiltIn.Log    !! MODAL CONFIRM    WARN
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_verify_rejct_reson_locator}
        

REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [MODAL] REJECT - [SELECT] ACTION CODE
    Common_keyword.SELCET OPTION    ${sel_action_rejct_reson_locator}    ${txt_action_rejct_reson_locator}    ${group_user}[Action_Code]
    

REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [MODAL] REJECT - [SELECT] REASON CODE
    Common_keyword.SELCET OPTION    ${sel_rejct_reson_locator}    ${txt_rejct_reson_locator}    ${group_user}[Reason_Code]
    

REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [MODAL] REJECT - [INPUT] - [TEXT] TEXTAREA 
   Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_area_reson_locator}     ${group_user}[Note]


REQUEST CLOSING CONTRACT PAGE - [VERIFY] - [MODAL] REJECT - [CLICK] - [BTN] OK 
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_reson_ok_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_closing}    ${yaml_set_closing_title}    ${sheet_stamp}    ${TC}    TC    State    SuccessReject