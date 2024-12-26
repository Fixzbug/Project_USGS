*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
${yaml_set_re_issue}    Actual_result_re_issue_yaml
${yaml_set_re_issue_title}    yaml_title_re_issue
${sheet_stamp}    Results


*** Keywords ***
RE ISSUE PAGE - INPUT USENAME AND PASSWORD
    Common_keyword.SETTING LOGIN    Re-issue    ${group_user}[Username]    ${group_user}[Password]

RE ISSUE PAGE - [CLICK] - LINK
    ${link_system}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[System]   
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${link_system}     
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

RE ISSUE PAGE - [CLICK] - [SELECT] BRANCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${sel_branch_for_click_locator}

RE ISSUE PAGE - [INPUT] - [TEXT] BRANCH
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_sel_locator}   ${group_user}[BRANCH]

RE ISSUE PAGE - [PRESS KEY] - ENTER
    Common_keyword.PRESS KEY    ${txt_sel_locator}    ENTER

RE ISSUE PAGE - [CLICK] - [BTN] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_ok_cus_request_page_locator}
  
RE ISSUE PAGE - [CLICK] - [MENU] 
    SeleniumLibrary.Execute Javascript    ${group_user}[Sub_menu]


# Input
RE ISSUE PAGE - [INPUT] - [TEXT] ID NUMBER
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_clear_locator}    10s 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_txt_id_number_locator}    ${ID_card}  


# Input
RE ISSUE PAGE - [INPUT] - [TEXT] APPROVE - ID NUMBER 
    BuiltIn.Log    ${ID_card}    WARN
    IF  '${ID_card}' == 'none'
        Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_approve_txt_id_number_locator}    ${ID_Number}  
    ELSE    
        Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_approve_txt_id_number_locator}    ${ID_card}  
    END 


RE ISSUE PAGE - [INPUT] - [TEXT] SLIDE CARD
    BuiltIn.Log    !! CUT CARD FOR RE CARD> ${card_data_stock}    WARN
    ${card_split_new}    String.Split String    ${card_data_stock}[0]    separator=${SPACE}
    ${full_card}    BuiltIn.Set Variable    ${card_split_new}[0]${card_split_new}[1]${card_split_new}[2]${card_split_new}[3]
    ${full_cards}    BuiltIn.Set Variable    ${card_split_new}[0]-${card_split_new}[1]-${card_split_new}[2]-${card_split_new}[3]
    BuiltIn.Set Global Variable    ${full_card}    
    BuiltIn.Set Global Variable    ${full_cards}    
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_slide_card}    ${full_card} 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_re1_card}    ${card_split_new}[0]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_re2_card}    ${card_split_new}[1] 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_re3_card}    ${card_split_new}[2] 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_re4_card}    ${card_split_new}[3]


# click search
RE ISSUE PAGE - [CLICK] - [BTN] SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_search}

RE ISSUE PAGE - [CLICK] - [BTN] APPROVE SEARCH
    SeleniumLibrary.Wait Until Element Is Visible    id=btnSearch    10s
    BuiltIn.Wait Until Keyword Succeeds    10x    2s    SeleniumLibrary.Execute Javascript    fromBtnSearch()

RE ISSUE PAGE - [CLICK] - [BTN] APPROVE SELECT
    ${status_select}   BuiltIn.Run Keyword And Return Status    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${select_approve}    10s
    IF  '${status_select}' == 'False'
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Approve
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        BuiltIn.fail    !!! NO RESULT DATA TO SELECT !!!
    END

# wait update page 
RE ISSUE PAGE - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    2s    


RE ISSUE PAGE - [INPUT] - [VERIFY] - [MODAL] VERIFY CHECK QUESTION PASS THREE QUESTION SHOULD BE - [CLICK] PASS 

    BuiltIn.Log    !! QUESTION PASS    WARN
    ${status_modal}   BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${modal_verify_customer}    60s   
    IF  ${status_modal}
         Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${chkbox1_true_xpath}
        ${status_table}   BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${modal_table_chkbox}    10s
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
                        ${status_KYC}   BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_save_kyc_note_success_locator}   15s    
                        IF  '${status_KYC}' == 'False'
                            Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Approve
                            Common_keyword.CLOSE ALL BROWSERS TEARDOWN
                            BuiltIn.fail    !!! ERROR Save KYC Note Success !!!
                        END
                        BuiltIn.Exit For Loop
                    END
                END
            END
        END
    ELSE
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Approve
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        BuiltIn.fail    !!! ERROR MODAL QUESTION PASS NOT DISPLAY !!!
    END
    

# get data
RE ISSUE PAGE - [GET] - [TEXT] CUSTOMER NAME

    BuiltIn.Set Global Variable    ${yaml_set_re_issue}
    BuiltIn.Set Global Variable    ${yaml_set_re_issue_title} 
    BuiltIn.Set Global Variable    ${sheet_stamp}

    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_customer_name_locator} 
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL INSERT ID NO    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}     ${sheet_stamp}    TC    ${ID_card}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    ID_Number    ${ID_card}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Customer_Name    ${data}


RE ISSUE PAGE - [GET] - [TEXT] CONTRACT NO
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_contract_no_locator}  
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Contract_No    ${data}


RE ISSUE PAGE - [GET] - [TEXT] STATUS
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_status_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Status    ${data}
    

RE ISSUE PAGE - [GET] - [TEXT] CARD TYPE
    ${data}    BuiltIn.Run Keyword And Return Status    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_card_type_locator}
     IF  '${data}' == 'False'
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Card_Type    -
    ELSE    
        ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_card_type_locator}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Card_Type   ${data}
    END


RE ISSUE PAGE - [GET] - [TEXT] CARD NO
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_card_no_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Card_No    ${data}


RE ISSUE PAGE - [GET] - [TEXT] DUE DATE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_due_date_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Due_Date    ${data}


RE ISSUE PAGE - [GET] - [TEXT] PRINTER NAME
    ${data}    BuiltIn.Run Keyword And Return Status    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_printer_locator}
    IF  '${data}' == 'False'
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Printer_Name    -
    ELSE    
        ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_printer_locator}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Printer_Name   ${data}
    END
    

RE ISSUE PAGE - [GET] - [TEXT] CREDIT LIMIT
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_credit_limit_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Credit_Limit    ${data}


RE ISSUE PAGE - [GET] - [TEXT] CREDIT AVAILABLE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_credit_available_locator}
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Credite_Available    ${data}


RE ISSUE PAGE - [GET] - [TEXT] RL LIMIT
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_rl_limit_locator}  
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    RL_Limit    ${data}


RE ISSUE PAGE - [GET] - [TEXT] RL AVAILABLE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_rl_available_locator} 
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    RL_Available    ${data}


RE ISSUE PAGE - [GET] - [TEXT] OUTSTANDING BAL
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_outstanding_bal_locator} 
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Outstanding_Bal    ${data}


RE ISSUE PAGE - [GET] - [TEXT] SLIDE CARD
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Slide_Card    ${full_card}


RE ISSUE PAGE - [CLICK] - [BTN] REDIO YES
    SeleniumLibrary.Wait Until Page Contains Element    ${click_yes}    5s
    SeleniumLibrary.Click Element    ${click_yes}


RE ISSUE PAGE - [CLICK] - [BTN] REDIO NO
    SeleniumLibrary.Execute Javascript    ChknoClick()


RE ISSUE PAGE - [GET] - [TEXT] RE ENTRY CARD NO
    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Re_Entry_Crad_No    ${full_cards}
    
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
            IF  "${text_title}" == "Can't Found This Card in System"
                Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE     REQ    VERIFY REQUEST PASS CLICK SAVE
                Common_feature.WRITE STATUS DATA STOCK CARD    data_stock_re_issue_yaml     ERROR_CARD
                BuiltIn.fail    !!!!!! ${text_title} !!!!!!!
            END
        END
    ELSE
        BuiltIn.Log    >CLICK YES    WARN
        RE ISSUE PAGE - [CLICK] - [BTN] REDIO YES
    END


    
RE ISSUE PAGE - [CLICK] - [BTN] SAVE 
    BuiltIn.Log    !! SAVE   WARN
    SeleniumLibrary.Execute Javascript    fromBtnSummit() 


RE ISSUE PAGE - [VERIFY] - [MODAL] CONFIRM
    BuiltIn.Log    !! MODAL CONFIRM    WARN
    SeleniumLibrary.Wait Until Element Is Visible    ${modal_confirm}    10s
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${modal_save} 
    ${status_modal}    BuiltIn.Run Keyword And Return Status     SeleniumLibrary.Wait Until Element Is Visible    ${modal_requestno}    20s
    IF  ${status_modal}
        SeleniumLibrary.Wait Until Element Is Visible    ${modal_txt_requestno}    10s
        ${requestno}    SeleniumLibrary.Get Text    ${modal_txt_requestno}    # Request No. : F67000243392 And  Receive No. : W67000076772
        BuiltIn.Log    ${requestno}    WARN
        
        ${parts}    String.Split String    ${requestno}    And
        ${req_1}    Common_keyword.EXTRACT ALPHANUMERIC    ${parts[0]}
        ${req_2}    Common_keyword.EXTRACT ALPHANUMERIC   ${parts[1]}
        ${req_1}    String.Split String    ${req_1}    separator=${SPACE}
        ${req_2}    String.Split String    ${req_2}    separator=${SPACE}
        ${req_1}    String.Strip String    ${req_1}[1]
        ${req_2}    String.Strip String    ${req_2}[1]

        BuiltIn.Log    Request No. : ${req_1}    WARN
        BuiltIn.Log    Receive No. : ${req_2}    WARN

        ${rows_id_card_data_stock}    BuiltIn.Convert To String    ${rows_id_card_data_stock}    
        ${rows_card_data_stock}    BuiltIn.Convert To String    ${rows_card_data_stock}    

        # BuiltIn.Log    rows_id_card_data_stock : ${rows_id_card_data_stock}    WARN
        # BuiltIn.Log    rows_card_data_stock : ${rows_card_data_stock}    WARN

        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Request_No    ${req_1}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Receive_No    ${req_2}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Row_id_card    ${rows_id_card_data_stock}  
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Row_card    ${rows_card_data_stock}  
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    State    PASS_Request

        BuiltIn.Sleep    1s
        BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Execute Javascript    modalBtnOK()
    ELSE
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Request
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!! Fail_Request !!!!!!!!!!!!!!!!!!!!!!!!!!
    END




# get data
RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] ID NUMBER
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
    

RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CUSTOMER NAME
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_customer_name_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Customer_Name}


RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CONTRACT NO
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_contract_no_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Contract_No}
  

RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] STATUS
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_status_locator}
    ${status_card}    BuiltIn.Run Keyword And Return Status    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Status}
    IF  '${status_card}' == 'False'
        # ใช้ ID_number เพราะ ID_Card มันจะมีได้เฉพาะตอน เล่น E2E ถ้าเล่น อย่างเดียวต้องใช้ ID_number
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_Number}    TC    State    FAIL_CardStatus
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!! Fail_card status not Equal !!!!!!!!!!!!!!!!!!!!!!!!!!
    END
 

RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CARD TYPE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_card_type_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Card_Type}


RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CARD NO
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_card_no_locator}
    BuiltIn.Log    >(old)Web card No:${data}    WARN
    # BuiltIn.Log    >(new)Web card No:${data}    WARN
    BuiltIn.Log    >(new)Slide_Card:${Slide_Card}    WARN
    # Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${card_no}    # card_no(old card) 1st change to slide card(new card) 2th
   

RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] DUE DATE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_due_date_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Due_Date}


RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] PRINTER NAME
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_printer_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Printer_Name}

    
RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CREDIT LIMIT
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_credit_limit_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Credit_Limit}


RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CREDIT AVAILABLE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_credit_available_locator}
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Credite_Available}


RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] RL LIMIT
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_rl_limit_locator}  
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${RL_Limit}


RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] RL AVAILABLE
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_rl_available_locator} 
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${RL_Available}


RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] OUTSTANDING BAL
    ${data}    Common_keyword.GET TEXT WHEN ELEMENT IS VISIBLE    ${txt_outstanding_bal_locator} 
    Common_keyword.VERIFY DATA TEXT AND EXCEL    ${data}    ${Outstanding_Bal}


RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] RE ENTRY CARD NO
    ${data1}    Common_keyword.GET VALUE WHEN ELEMENT IS VISIBLE    ${re_cards1}
    ${data2}    Common_keyword.GET VALUE WHEN ELEMENT IS VISIBLE    ${re_cards2}
    ${data3}    Common_keyword.GET VALUE WHEN ELEMENT IS VISIBLE    ${re_cards3}
    ${data4}    Common_keyword.GET VALUE WHEN ELEMENT IS VISIBLE    ${re_cards4}

    ${rechecl_card}    BuiltIn.Set Variable    ${data1}${data2}${data3}${data4}
    BuiltIn.Log    >GET WEB CARD RECHECK>${rechecl_card}   WARN
    BuiltIn.Log    >GET EXCEL CARD RECHECK>${Slide_Card}   WARN
    BuiltIn.Should Be Equal As Strings    '${rechecl_card}'    '${Slide_Card}'


RE ISSUE PAGE - [CLICK] - [BTN] APPROVE 
    BuiltIn.Log    !! APPROVE   WARN
    SeleniumLibrary.Execute Javascript    fromBtnApprove() 


RE ISSUE PAGE - [VERIFY] - [MODAL] APPROVE CONFIRM
    BuiltIn.Log    !! MODAL CONFIRM    WARN
    
    SeleniumLibrary.Wait Until Element Is Visible    ${modal_approve_confirm}    10s
    SeleniumLibrary.Execute Javascript    modalbtnConfirmApp('Y')
    ${status_modal}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${modal_requestno}    60s
    IF  ${status_modal}
        SeleniumLibrary.Wait Until Element Is Visible    ${modal_txt_requestno}    10s
        ${requestno}    SeleniumLibrary.Get Text    ${modal_txt_requestno}    # Request No. : F67000243409 Map Card Complete
        ${requestno2}    SeleniumLibrary.Get Text    ${modal_txt_requestno2}    # Card No. 6273775553077950 Will Terminated.
        
        ${parts}    String.Split String    ${requestno}    :
        ${parts2}    String.Split String    ${requestno2}    .
        ${req_1}    Common_keyword.EXTRACT ALPHANUMERIC    ${parts[1]}
        ${req_2}    Common_keyword.EXTRACT ALPHANUMERIC    ${parts2[1]}
        
        ${req_1}    String.Split String    ${req_1}    separator=${SPACE}
        ${req_2}    String.Split String    ${req_2}    separator=${SPACE}

        ${req_1}    String.Strip String    ${req_1}[0]
        ${req_2}    String.Strip String    ${req_2}[0]

        BuiltIn.Log    Request No. : ${req_1}    WARN
        BuiltIn.Log    Card No. : ${req_2}    WARN

        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Request_No_Approve    ${req_1}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    Card_No_Approve    ${req_2}
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    State    PASS_Approve
            
        BuiltIn.Sleep   1s
        BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Execute Javascript    modalBtnOK()
    ELSE
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${yaml_set_re_issue}    ${yaml_set_re_issue_title}    ${sheet_stamp}    ${ID_card}    TC    State    FAIL_Approve
        Common_keyword.CLOSE ALL BROWSERS TEARDOWN
        BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!! Fail_Approve !!!!!!!!!!!!!!!!!!!!!!!!
    END


