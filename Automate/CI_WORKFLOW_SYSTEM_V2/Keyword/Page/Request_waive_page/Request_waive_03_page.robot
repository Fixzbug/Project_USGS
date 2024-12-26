*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

# group data all
${group_data}
${keys_group_data}
${result_excel} 

# request no
${result_request_no}

# write data
${Rows}
${point}
${count}


# set globle for debug
${DBUG}

*** Keywords ***

SET FORMAT DATA TYPE 03 - WRITE
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}
    ${countrow}=    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1 

        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
            ${group_data}=    BuiltIn.Set Variable   ${result_excel}[0]
                BuiltIn.Set Global Variable    ${group_data}

                ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
                ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[6]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 
                    
                IF  ${Request_No} == 'none' and ${State} == 'none'             # none, none -> make
                                        
                    ${Rows}    BuiltIn.Evaluate    ${index} + 2                # +2 because add title at row 2 
                    BuiltIn.Set Global Variable    ${Rows}   
                    BuiltIn.Log    ----------------------------------------    WARN 
                    BuiltIn.Log    CONATRACT->ROW->${Rows}:${row}_${index}    WARN
                    BuiltIn.Log    ----------------------------------------    WARN

                    # input Contract no, ID card, business
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - INPUT CRITERIA SEARCH - REQUEST TYPE - PAGE REQUEST WAIVE

                    # click aprrove
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - CLICK - APPROVE - PAGE REQUEST WAIVE
                    
                    # get data from web before run
                    ${value_customer_name}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_loss_customer_name}
                    ${value_total_os_balance}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_loss_total_os_balance}
                    ${value_team}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_loss_team}
                    
                    IF  '${value_customer_name}' != 'none' and '${value_total_os_balance}' != 'none' and '${value_team}' != 'none' 
                        ${formatted_value_total_os_balance}=    Evaluate    "{:,.2f}".format(${value_total_os_balance})
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=8    data=${value_customer_name} 
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=9    data=${value_total_os_balance}  
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=12    data=${value_team}  
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=14    data=${value_total_os_balance}    
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=15    data=${value_total_os_balance}  
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=29    data=${value_customer_name}  
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=31    data=${formatted_value_total_os_balance}
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=11    data=${group_user}[${keys_group_user}[3]]    #P2503064  
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=26    data=${group_user}[${keys_group_user}[3]]    #P2503064  
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=30    data=${group_user}[${keys_group_user}[3]]    #P2503064

                    ELSE
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=9    data=FAIL  
                        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=10    data=FAIL  
                    END  

                    BuiltIn.Exit For Loop
                    
                END
              
    END

SET FORMAT DATA TYPE 03 - USING
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}    ${user_level}
    ${countrow}=    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    ${count}    BuiltIn.Evaluate    0    # set count error start at zero
    BuiltIn.Set Global Variable    ${count} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
            ${group_data}=    BuiltIn.Set Variable   ${result_excel}[0]
                BuiltIn.Set Global Variable    ${group_data}

                ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
                ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[6]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 
                    
                IF  '${point}' == '0' and '${count}' == '3'    # case point = 0 mean error and counter fail 3 time just Break
                    BuiltIn.Exit For Loop
                ELSE IF  '${point}' == '1' and '${count}' == '1'    # case point = 1 mean pass and counter fix 1 time just Break
                    BuiltIn.Exit For Loop
                END

                IF  ${Request_No} == 'none' and ${State} == 'none' and '${count}' <= '3'             # none, none -> make
                                    
                    ${Rows}    BuiltIn.Evaluate    ${index} + 2                                      # +2 because add title at row 2 
                    BuiltIn.Set Global Variable    ${Rows}   
                    BuiltIn.Log    ----------------------------------------    WARN 
                    BuiltIn.Log    CONATRACT ->ROW->${Rows}:${row}_${index}    WARN
                    BuiltIn.Log    ----------------------------------------    WARN
                
                    # input Contract no, ID card, business
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - INPUT CRITERIA SEARCH - REQUEST TYPE - PAGE REQUEST WAIVE

                    # click aprrove
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - CLICK - APPROVE - PAGE REQUEST WAIVE

                    # verify lable
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - VERIFY - REQUEST PAGE - PAGE REQUEST WAIVE    

                    # verify data
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - VERIFY - DATA REQUEST PAGE - PAGE REQUEST WAIVE     

                    # กรอก waive amount
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - INPUT CRITERIA SEARCH - WAIVE AMOUNT - PAGE REQUEST WAIVE

                    # เลือก reason
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - INPUT CRITERIA SEARCH - REASON - PAGE REQUEST WAIVE

                    # กรอก reason note
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - INPUT CRITERIA SEARCH - REASON NOTE - PAGE REQUEST WAIVE

                    # verify title -> send to , note ,  input send to , note 
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - VERIFY - SEND TO - PAGE REQUEST WAIVE    user_level=1   # Send to User_1 = P2510033

                    # verify note
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - VERIFY - NOTE - PAGE REQUEST WAIVE

                    # input data note
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - INPUT - NOTE - PAGE REQUEST WAIVE

                    # กด approve
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - CLICK - APPROVE - PAGE REQUEST WAIVE    

                    # verify pop up
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - VERIFY - APPROVE POPUP - PAGE REQUEST WAIVE    

                    # verify pop up
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - CLICK - APPROVE POPUP - CLICK OK - PAGE REQUEST WAIVE   

                    # get data at current page request no
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - SAVE DATA - REQUSET NO - PAGE REQUEST WAIVE  

                    # wait for check excel write
                    Request_waive_03_feature.SET FEATURE - TYPE - 03 - SAVE DATA TO EXCEL - BY STATE

                END    
    END

                
# add new
PAGE REQUEST WAIVE - TYPE 03 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE REQUEST WAIVE - TYPE 03 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE REQUEST WAIVE - TYPE 03 - SETTING LOGIN   WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${group_user}[${keys_group_user}[3]]    # 1 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE REQUEST WAIVE - TYPE 03 - SETTING LOGIN   WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${group_user}[${keys_group_user}[5]]    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE REQUEST WAIVE - TYPE 03 - SETTING LOGIN   WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${group_user}[${keys_group_user}[7]]     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE REQUEST WAIVE - TYPE 03 - SETTING LOGIN   WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${group_user}[${keys_group_user}[9]]     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE REQUEST WAIVE - TYPE 03 - SETTING LOGIN   WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${group_user}[${keys_group_user}[11]]     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE REQUEST WAIVE - TYPE 03 - SETTING LOGIN
    [Arguments]    ${system_name}    ${username}    ${password}    ${user_level}

    [Timeout]    180s
        # หน้า login #User Authentication
        #Verify
        SeleniumLibrary.Wait Until Element Is Visible    ${verify_header_locator}    timeout=60s    # User Authentication
        
        # Username
        SeleniumLibrary.Wait Until Element Is Visible    ${sso_username_text_area}
        SeleniumLibrary.Input Text    ${sso_username_text_area}   ${username}
        # Password
        SeleniumLibrary.Wait Until Element Is Visible    ${SSO_Password_text_area}
        SeleniumLibrary.Input Password    ${sso_password_text_area}    ${password}  
            
        # Click login button
        Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    ${system_name}    LOGIN - USER LEVEL - ${user_level} USER - ${username}
        SeleniumLibrary.Wait Until Element Is Visible    ${btn_login_on_user_authentication}
        SeleniumLibrary.Click Button    ${btn_login_on_user_authentication}


PAGE REQUEST WAIVE - TYPE 03 - [CLICK] - LINK 
    ${link_system}=    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]   
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${link_system}     
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE REQUEST WAIVE - TYPE 03 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    

PAGE REQUEST WAIVE - TYPE 03 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

PAGE REQUEST WAIVE - TYPE 03 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

# เลือก iframe
PAGE REQUEST WAIVE - TYPE 03 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_loss_locator}

# เลือก iframe
PAGE REQUEST WAIVE - TYPE 03 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# เลือก request type
PAGE REQUEST WAIVE - TYPE 03 - [SELCET] - [DROPDOWN] REQUEST TYPE
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_loss_request_type_locator}    ${group_user}[${keys_group_user}[1]]
    
PAGE REQUEST WAIVE - TYPE 03 - [CLICK] - [BTN] APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}    

#verify   
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABEL] BUSINESS
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_loss_req_business}    5s          

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABEL] CONTRACT NO 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_loss_contract_no}    5s          

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABEL] ID CARD 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_loss_id_card}    5s       

# input 
PAGE REQUEST WAIVE - TYPE 03 - [INPUT] - [TEXT] ID CARD 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_id_card}    ${group_data}[${keys_group_data_label}[2]]         

PAGE REQUEST WAIVE - TYPE 03 - [SELECT] - [DROPDOWN] BUSINESS
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_business}    ${group_data}[${keys_group_data_label}[3]]     
  
PAGE REQUEST WAIVE - TYPE 03 - [INPUT] - [TEXT] CONTRACT NO  
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_contract_no}    ${group_data}[${keys_group_data_label}[4]]       
  
#verify
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] REQUEST TYPE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_request_type}    ${group_data_label}[${keys_group_data_label}[1]]   
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] CUSTOMER ID
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_customer_id}    ${group_data_label}[${keys_group_data_label}[2]]

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] BUSINESS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_business}    ${group_data_label}[${keys_group_data_label}[3]]
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] CONTRACT NO
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_contract_no}    ${group_data_label}[${keys_group_data_label}[4]]

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] CUSTOMER NAME
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_customer_name}    ${group_data_label}[${keys_group_data_label}[7]]
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] TOTAL O/S BALANCE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_total_os_balance}    ${group_data_label}[${keys_group_data_label}[8]]

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] REQUEST DATE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_request_date}    ${group_data_label}[${keys_group_data_label}[9]]
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] REQUESTER
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_requester}    ${group_data_label}[${keys_group_data_label}[10]]
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] TEAM
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_team}    ${group_data_label}[${keys_group_data_label}[11]]
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] OD STATUS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_od_status}    ${group_data_label}[${keys_group_data_label}[12]]

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABELS] CLOSING AMOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_closing_Amount}    ${group_data_label}[${keys_group_data_label}[13]]

# verify loading
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LOADING]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}    time_out=180s


#verify data
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] REQUEST TYPE  
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_loss_request_type}    ${group_data}[${keys_group_data_label}[1]]    
      
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] CUSTOMER ID
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS   ${txt_loss_customer_id}    ${group_data}[${keys_group_data_label}[2]]    
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] BUSINESS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_loss_business}    ${group_data}[${keys_group_data_label}[3]]    
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] CONTRACT NO
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_contract_no}    ${group_data}[${keys_group_data_label}[4]]   
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] CUSTOMER NAME
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_customer_name}    ${group_data}[${keys_group_data_label}[7]]    

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] TOTAL O/S BALANCE
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_total_os_balance}    ${group_data}[${keys_group_data_label}[8]]    

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] REQUEST DATE
    ${con_date}=    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[9]]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_request_date}    ${con_date}    

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] REQUESTER
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_requester}    ${group_data}[${keys_group_data_label}[10]]    
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] TEAM
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_team}    ${group_data}[${keys_group_data_label}[11]]    
    
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] OD STATUS
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_od_status}    ${group_data}[${keys_group_data_label}[12]]    

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [DATA] CLOSING AMOUNT
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_closing_Amount}    ${group_data}[${keys_group_data_label}[13]]    
    

# verify   
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABEL] WAIVE AMOUNT
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_loss_waive_amount}   5s       


# input 
PAGE REQUEST WAIVE - TYPE 03 - [INPUT] - [TEXT] WAIVE AMOUNT
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_loss_waive_amount}    ${group_data}[${keys_group_data_label}[14]]   

#verify   
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABEL] REASON
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_loss_reason}    5s       

# input 
PAGE REQUEST WAIVE - TYPE 03 - [SELECT] - [SELECT] REASON
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_loss_reason}    ${group_data}[${keys_group_data_label}[15]]  

#verify   
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABEL] REASON NOTE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_loss_reason_note}    5s       

# input 
PAGE REQUEST WAIVE - TYPE 03 - [INPUT] - [TEXT] REASON NOTE
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_loss_reason_note}    ${group_data}[${keys_group_data_label}[16]]   


# verify   
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABEL] SEND TO
    [Arguments]    ${user_level}
    ${status}=    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_loss_send_to}    10s
    IF  '${status}' == 'True'
        IF  '${user_level}' == '0'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_loss_send_to}    ${group_data}[${keys_group_data_label}[10]]    # Send to 1 = P2503064
        ELSE IF  '${user_level}' == '1'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_loss_send_to}    ${group_data}[${keys_group_data_label}[20]]    # Send to 2 = P2510033 
        ELSE IF  '${user_level}' == '3'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_loss_send_to}    ${group_data}[${keys_group_data_label}[21]]    # Send to 3 = P2503067 
        ELSE IF  '${user_level}' == '4'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_loss_send_to}    ${group_data}[${keys_group_data_label}[22]]    # Send to 4 = P2106010 
        ELSE IF  '${user_level}' == '5'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_loss_send_to}    ${group_data}[${keys_group_data_label}[23]]    # Send to 5 = KIMURA 
        END
    END


# verify   
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LABEL] NOTE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_loss_note}       

# input 
PAGE REQUEST WAIVE - TYPE 03 - [INPUT] - [TEXT] NOTE
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_loss_note}    ${group_data}[${keys_group_data_label}[17]]   
    

# verify title popup
PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [TITLE] APPROVE 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${verfiy_approve_popup}    

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_ok_approve_popup}    

PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [POPUP] APPROVE - [CLICK] CANCEL
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_cancel_approve_popup}    


# get requst no save to excel
PAGE REQUEST WAIVE - TYPE 03 - [GET] - [DATA] REQUEST NO - [SAVE] EXCEL
    
    # wait finish loading..
    PAGE REQUEST WAIVE - TYPE 03 - [VERIFY] - [LOADING] 

    ${state}=    Common_keyword.RUN KEYWORD AND IGNORE ERROR WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${table_manager_locator}    30s
    BuiltIn.Log    STATE SAVE->${state}    WARN

    IF  '${state}' == 'True'    # ถ้าเจอ
        ${point}    BuiltIn.Evaluate    1
        BuiltIn.Set Global Variable    ${point}
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${title_system_cancel_req_locator}    5s        # makesure title is true
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_request_no}    5s                         # get req No to save
        ${result_request_no}=    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_request_no}
        BuiltIn.Log    REQ_NO_SAVE->${result_request_no}    WARN
        BuiltIn.Set Global Variable    ${result_request_no}

    ELSE IF  '${state}' == 'False'    # ถ้าไม่เจอ
        ${point}    BuiltIn.Evaluate    0
        BuiltIn.Set Global Variable    ${point}
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${title_system_req_locator}    5s               # verify table before title -> Request
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_error}    5s 
        ${msgerror}    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR NO SPLIT    ${txt_error}  
        BuiltIn.Log    MSG ERROR->${msgerror}    WARN
        ${result_request_no}    BuiltIn.Set Variable    ${msgerror}    
        BuiltIn.Set Global Variable    ${result_request_no}

    END

# wait for check excel write
PAGE REQUEST WAIVE - TYPE 03 - [WAIT] - WAIT MAKE REMARK NOTE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_request_no}    10s    # get req No to save
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_loss_note}    ${group_data}[${keys_group_data_label}[17]] 

# btn back 
PAGE REQUEST WAIVE - TYPE 03 - [CLICK] - [BTN] BACK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_back}    10s

# logout
PAGE REQUEST WAIVE - TYPE 03 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    10s    


