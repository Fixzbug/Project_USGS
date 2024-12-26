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

# set globle for debug
${DBUG}

*** Keywords ***

SET FORMAT DATA TYPE 03
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}
    ${countrow}=    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]    
            ${group_data}=    BuiltIn.Set Variable   ${result_excel}[0]
            BuiltIn.Set Global Variable    ${group_data}

                ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
                ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[6]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 

                    IF  ${Request_No} != 'none' and ${State} == 'Request' or ${Request_No} != 'none' and ${State} == 'Approve' 
                                            
                        ${Rows}    BuiltIn.Evaluate    ${index} + 2                    # +2 because add title at row 2 
                        BuiltIn.Set Global Variable    ${Rows}   

                        BuiltIn.Log    ----------------------------------------    WARN 
                        BuiltIn.Log    CONATRACT ->ROW->${Rows}:${row}_${index}:>RequestNO->${Request_No}    WARN
                        BuiltIn.Log    ----------------------------------------    WARN

                        # เลือก requst type
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - SELECT MENU - REQUEST TYPE - PAGE INBOX  

                        # verify lable
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - VERIFY - REQUEST PAGE - PAGE INBOX   

                        # input data
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - INPUT CRITERIA SEARCH - PAGE INBOX 

                        # กดค้นหา
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - CLICK BTN SEARCH

                        # รอ page loading
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - WAIT - VERIFY - PAGE INBOX

                        # Verify title affter search
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - VERIFY - TITLE - PAGE INBOX

                        # Verify data 
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - VERIFY - DATA - PAGE INBOX

                        # click action 
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - CLICK LINK ACTION

                        # verify title
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - VERIFY - LABELS - PAGE INBOX

                        # verify data
                        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - VERIFY - DATA STEP 2 - PAGE INBOX

                        BuiltIn.Exit For Loop 
                   
                    END
    END

# add new
PAGE INBOX - TYPE 03 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE INBOX - TYPE 03 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE INBOX - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 0 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE INBOX - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE INBOX - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE INBOX - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE INBOX - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE INBOX - TYPE 03 - SETTING LOGIN
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

# work
PAGE INBOX - TYPE 03 - [CLICK] - LINK 
    ${link_system}=    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]    
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE INBOX - TYPE 03 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    

PAGE INBOX - TYPE 03 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    

PAGE INBOX - TYPE 03 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    

# เลือก iframe
PAGE INBOX - TYPE 03 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_locator}

# เลือก iframe
PAGE INBOX - TYPE 03 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# เลือก request type
PAGE INBOX - TYPE 03 - [SELCET] - [DROPDOWN] REQUEST TYPE
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_loss_ibs_request_type}    ${group_user}[${keys_group_user}[1]]

#verify 
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] REQUEST TYPE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ibs_request_type}    ${group_data_label}[${keys_group_data_label}[1]] 

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] CUSTOMER ID
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ibs_customer_id}    ${group_data_label}[${keys_group_data_label}[2]]
    
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] CONTRACT
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data_label}[${keys_group_data_label}[4]]    option=${SPACE}
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ibs_contract}    ${list}[0]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] REQUEST NO
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ibs_request_no}    ${group_data_label}[${keys_group_data_label}[5]]
    
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] REQUESTER
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ibs_requester}    ${group_data_label}[${keys_group_data_label}[10]]


# input 
PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_loss_ib_customer_id}    ${group_data}[${keys_group_data_label}[2]]   

PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] CONTRACT
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_loss_ib_contract}    ${group_data}[${keys_group_data_label}[4]]   

PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] REQUEST NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_loss_ib_request_no}    ${group_data}[${keys_group_data_label}[5]]   

PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_loss_ib_requester}    ${group_data}[${keys_group_data_label}[10]]   

# click search button
PAGE INBOX - TYPE 03 - [CLICK] - [BTN] SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_search}    

# step 1 verify table title and data in table
# verify table
PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST TYPE
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[1]]    # request type page inbox title exists   

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST DESC
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[1]]    # request desc page inquiry title  

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - CUSTOMER ID
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[2]]     

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - TEAM
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[11]]    # move focus        

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REASON
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[15]]    # move focus        

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQ NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[24]]    

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - SENDER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[25]]    

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - SEND DATE
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[26]]    

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - CONTRACT NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[27]]    # contract no. have - / 3969-001-000255494

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - NAME
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[28]]     

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST BY
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[29]]  

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST AMT
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[30]]  

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - APPROVE USER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[31]]    # approve user page inbox and inquiry

PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - STATUS
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[32]]        



# verify table
PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST TYPE
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data}[${keys_group_data_label}[1]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[1]    

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST DESC
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data}[${keys_group_data_label}[1]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[1] 

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - CUSTOMER ID
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[2]]     

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - TEAM
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[11]]     

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REASON
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data}[${keys_group_data_label}[15]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[0]            

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQ NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[24]] 

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - SENDER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[25]]   

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - SEND DATE
    ${con_date}=    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[26]]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${con_date}    

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - CONTRACT NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[27]]     # contract no. have - / 3969-001-000255494     

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - NAME
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[28]]     

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST BY
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[29]]  

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST AMT
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[30]]  

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - APPROVE USER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[31]]    

PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - STATUS
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[32]]    



# click link action for go to page approve type 01 
PAGE INBOX - TYPE 03 - [CLICK] - [LINK] ACTION
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${action_loss_locator}


# step 2 change page old content new fields
#verify lable step 2 
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUEST TYPE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_request_type}    ${group_data_label}[${keys_group_data_label}[1]] 
    
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - CUSTOMER ID
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_customer_id}    ${group_data_label}[${keys_group_data_label}[2]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - BUSINESS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_business}    ${group_data_label}[${keys_group_data_label}[3]]
    
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - CONTRACT NO
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_contract_no}    ${group_data_label}[${keys_group_data_label}[4]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUEST NO
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_request_no}    ${group_data_label}[${keys_group_data_label}[5]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - CUSTOMER NAME
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_customer_name}    ${group_data_label}[${keys_group_data_label}[7]]
    
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - TOTAL O/S BALANCE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_total_os_balance}    ${group_data_label}[${keys_group_data_label}[8]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUEST DATE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_request_date}    ${group_data_label}[${keys_group_data_label}[9]]   
    
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUESTER
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_requester}    ${group_data_label}[${keys_group_data_label}[10]]
    
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - TEAM
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_team}    ${group_data_label}[${keys_group_data_label}[11]]
    
PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - OD STATUS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_od_status}    ${group_data_label}[${keys_group_data_label}[12]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - CLOSING AMOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_closing_Amount}    ${group_data_label}[${keys_group_data_label}[13]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - WAIVE AMOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_waive_amount}    ${group_data_label}[${keys_group_data_label}[14]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REASON
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_reason}    ${group_data_label}[${keys_group_data_label}[15]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REASON NOTE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_reason_note}    ${group_data_label}[${keys_group_data_label}[16]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - NOTE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_note}    ${group_data_label}[${keys_group_data_label}[17]]

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUEST STATUS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_request_status}    ${group_data_label}[${keys_group_data_label}[33]]    

PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - STATUS DATE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_loss_ib_status_date}    ${group_data_label}[${keys_group_data_label}[34]]    



# step 2 change page old content new fields
#verify data step 2 
PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUEST TYPE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_loss_ib_request_type}    ${group_data}[${keys_group_data_label}[1]]        

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER ID
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_customer_id}     ${group_data}[${keys_group_data_label}[2]]    

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - BUSINESS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_loss_ib_business}    ${group_data}[${keys_group_data_label}[3]]     

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - CONTRACT NO
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_contract_no}     ${group_data}[${keys_group_data_label}[4]]
    
PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUEST NO
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_request_no}     ${group_data}[${keys_group_data_label}[5]]

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER NAME
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_customer_name}     ${group_data}[${keys_group_data_label}[7]]
    
PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - TOTAL O/S BALANCE
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_total_os_balance}     ${group_data}[${keys_group_data_label}[8]]

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUEST DATE
    ${con_date}=    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[9]]     
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_request_date}    ${con_date}   
    
PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUESTER
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_requester}     ${group_data}[${keys_group_data_label}[10]]
    
PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - TEAM
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_team}    ${group_data}[${keys_group_data_label}[11]]   
    
PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - OD STATUS
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_od_status}    ${group_data}[${keys_group_data_label}[12]]

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - CLOSING AMOUNT
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_closing_Amount}     ${group_data}[${keys_group_data_label}[13]]

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - WAIVE AMOUNT
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_waive_amount}    ${group_data}[${keys_group_data_label}[14]]

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REASON
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_loss_ib_reason}    ${group_data}[${keys_group_data_label}[15]]       
      
PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REASON NOTE
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_reason_note}     ${group_data}[${keys_group_data_label}[16]]

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUEST STATUS
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_request_status}    ${group_data}[${keys_group_data_label}[33]]    

PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - STATUS DATE 
    ${con_date}=    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[34]]    
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_loss_ib_request_date}    ${con_date}   


# verify   
PAGE INBOX - TYPE 03 - [VERIFY] - [LABEL] SEND TO    
    [Arguments]    ${user_level}
    ${status}=    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_ib_sendto}    10s
   
    IF  '${status}' == 'True'    # ถ้ามี ปุ่ม send to
        BuiltIn.Log   SEND TO STATUS->${status}    WARN
        IF  '${user_level}' == '0'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_loss_ib_sendto}    ${group_data}[${keys_group_data_label}[10]]    # Send to 1 = P2503064
            Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
        
        ELSE IF  '${user_level}' == '1'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_loss_ib_sendto}    ${group_data}[${keys_group_data_label}[20]]    # Send to 2 = P2510033 
            Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
       
        ELSE IF  '${user_level}' == '2'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_loss_ib_sendto}    ${group_data}[${keys_group_data_label}[21]]    # Send to 3 = P2503067 
            Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
       
        ELSE IF  '${user_level}' == '3'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_loss_ib_sendto}    ${group_data}[${keys_group_data_label}[22]]    # Send to 4 = P2106010 
            Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
       
        ELSE IF  '${user_level}' == '4'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_loss_ib_sendto}    ${group_data}[${keys_group_data_label}[23]]    # Send to 5 = KIMURA
            Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
        END
  
    ELSE IF  '${status}' == 'False'    # ถ้าไม่มี ปุ่ม send to
        BuiltIn.Log   SEND TO STATUS->${status}    WARN
        Approve_negotiate_03_feature.SET FEATURE - TYPE - 03 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX
    END   


# verify note 
PAGE INBOX - TYPE 03 - [VERIFY] - [LABEL] NOTE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_loss_ib_note}       

# input data note
PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] NOTE
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_loss_ib_note}    ${group_data}[${keys_group_data_label}[17]]   


# btn approve
PAGE INBOX - TYPE 03 - [CLICK] - [BTN] APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}        

# verify title popup
PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] APPROVE 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${verfiy_approve_popup}    

PAGE INBOX - TYPE 03 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_ok_approve_popup}    

PAGE INBOX - TYPE 03 - [VERIFY] - [POPUP] APPROVE - [CLICK] CANCEL
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_cancel_approve_popup}    

# loading 
PAGE INBOX - TYPE 03 - [WAIT] LOADING PAGE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}    time_out=120s   

PAGE INBOX - TYPE 03 - [VERIFY] - [LOADING] 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS NOT VISIBLE BY LOCATOR    ${loading}    time_out=120s
 
# logout
PAGE INBOX - TYPE 03 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    