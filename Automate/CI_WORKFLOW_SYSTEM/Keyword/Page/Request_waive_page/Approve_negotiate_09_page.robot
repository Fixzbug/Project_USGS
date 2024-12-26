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

SET FORMAT DATA TYPE 09
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
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - SELECT MENU - REQUEST TYPE - PAGE INBOX  

                        # verify lable
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - VERIFY - REQUEST PAGE - PAGE INBOX   

                        # input data
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - INPUT CRITERIA SEARCH - PAGE INBOX 

                        # กดค้นหา
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - CLICK BTN SEARCH

                        # รอ page loading
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - WAIT - VERIFY - PAGE INBOX

                        # Verify title affter search
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - VERIFY - TITLE - PAGE INBOX

                        # Verify data 
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - VERIFY - DATA - PAGE INBOX

                        # click action 
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - CLICK LINK ACTION


                        # 09 : Negotiation Special discount (Fraud)
                        #  Verify Title - 09 : Negotiation Special discount (Fraud)
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - VERIFY - TITLE - STEP 2 - PAGE INBOX    

                        #  Verify data - 09 : Negotiation Special discount (Fraud)
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - VERIFY - DATA - STEP 2 - PAGE INBOX    


                        # Negotiate Detail
                        # 1. Entry negotiate discount detail
                        # Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
                        # Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]

            
                        # --------------------------------------------------------------------------
                        # WOScreen

                        # verify title                
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE - PAGE INBOX [NEGOTIATE DETAIL] - [WOSCREEN]
                        
                        # verify value
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - DATA VALUE - PAGE INBOX [NEGOTIATE DETAIL] - [WOSCREEN]

                        # --------------------------------------------------------------------------

                        # 3.2 Entry other ...
                        # Verify Title - 3.2 Entry other ...
                        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE - PAGE INBOX [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]

                        BuiltIn.Exit For LoopIn.Exit For Loop 
                   
                    END
    END

# add new
PAGE INBOX - TYPE 09 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE INBOX - TYPE 09 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE INBOX - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 0 row,col -> 3,4 -> P2503094
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE INBOX - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE INBOX - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503097
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE INBOX - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2109010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE INBOX - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE INBOX - TYPE 09 - SETTING LOGIN
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
PAGE INBOX - TYPE 09 - [CLICK] - LINK 
    ${link_system}=    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]    
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE INBOX - TYPE 09 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    

PAGE INBOX - TYPE 09 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    

PAGE INBOX - TYPE 09 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    

# เลือก iframe
PAGE INBOX - TYPE 09 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_locator}

# เลือก iframe
PAGE INBOX - TYPE 09 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# เลือก request type
PAGE INBOX - TYPE 09 - [SELCET] - [DROPDOWN] REQUEST TYPE
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_od_ibs_request_type}    ${group_user}[${keys_group_user}[1]]

#verify 
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] REQUEST TYPE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ibs_request_type}    ${group_data_label}[${keys_group_data_label}[1]] 

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] CUSTOMER ID
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ibs_customer_id}    ${group_data_label}[${keys_group_data_label}[2]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] CONTRACT
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data_label}[${keys_group_data_label}[4]]    option=${SPACE}
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ibs_contract}    ${list}[0]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] REQUEST NO
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ibs_request_no}    ${group_data_label}[${keys_group_data_label}[5]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] REQUESTER
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ibs_requester}    ${group_data_label}[${keys_group_data_label}[10]]


# input 
PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_od_ib_customer_id}    ${group_data}[${keys_group_data_label}[2]]   

PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] CONTRACT
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_od_ib_contract}    ${group_data}[${keys_group_data_label}[4]]   

PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] REQUEST NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_od_ib_request_no}    ${group_data}[${keys_group_data_label}[5]]   

PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_od_ib_requester}    ${group_data}[${keys_group_data_label}[8]]   

# click search button
PAGE INBOX - TYPE 09 - [CLICK] - [BTN] SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_search}    

# step 1 verify table title and data in table
# verify table
PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REQUEST TYPE
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[1]]     

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REQUEST DESC
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[1]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - CUSTOMER ID
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[2]]     

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - TEAM
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[13]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REASON
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[80]]           

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REQ NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[87]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - SENDER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[88]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - SEND DATE
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[89]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - CONTRACT NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[90]]    # contract no. have - / 3969-001-000255494

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - NAME
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[91]]     

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REQUEST BY
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[92]]  

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REQUEST AMT
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[93]]  

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - APPROVE USER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[94]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - STATUS
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_th_replace}    ${group_data_label}[${keys_group_data_label}[95]]        



# verify table
PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REQUEST TYPE
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data}[${keys_group_data_label}[1]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[1]    

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REQUEST DESC
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data}[${keys_group_data_label}[1]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[1] 

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - CUSTOMER ID
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[2]]     

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - TEAM
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[13]]     

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REASON
    BuiltIn.Log     ${group_data}[${keys_group_data_label}[80]]    WARN    
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION WITH SIGLE QUOTE    ${group_data}[${keys_group_data_label}[80]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[0]            

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REQ NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[5]] 

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - SENDER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[88]]   

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - SEND DATE
    ${con_date}=    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[89]]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${con_date}    

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - CONTRACT NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[90]]     # contract no. have - / 3969-001-000255494     

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - NAME
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[91]]     

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REQUEST BY
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[92]]  

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REQUEST AMT
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[93]]  

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - APPROVE USER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[94]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - STATUS
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[95]]    



# click link action for go to page approve type 01 
PAGE INBOX - TYPE 09 - [CLICK] - [LINK] ACTION
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${action_od_locator}


# step 2 change page old content new fields
#verify lable step 2 
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - REQUEST TYPE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_request_type}    ${group_data_label}[${keys_group_data_label}[1]] 
    
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - CUSTOMER ID
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_customer_id}    ${group_data_label}[${keys_group_data_label}[2]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - BUSINESS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_business}    ${group_data_label}[${keys_group_data_label}[3]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - CONTRACT NO
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_contract_no}    ${group_data_label}[${keys_group_data_label}[4]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - REQUEST NO
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_request_no}    ${group_data_label}[${keys_group_data_label}[5]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - CUSTOMER NAME
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_customer_name}    ${group_data_label}[${keys_group_data_label}[7]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - TOTAL O/S BALANCE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_total_os_balance}    ${group_data_label}[${keys_group_data_label}[8]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - REQUEST DATE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_request_date}    ${group_data_label}[${keys_group_data_label}[9]]   
    
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - REQUESTER
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_requester}    ${group_data_label}[${keys_group_data_label}[10]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - TEAM
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_team}    ${group_data_label}[${keys_group_data_label}[11]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - OD STATUS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_od_status}    ${group_data_label}[${keys_group_data_label}[12]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - CLOSING AMOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_closing_Amount}    ${group_data_label}[${keys_group_data_label}[13]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - WAIVE AMOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_waive_amount}    ${group_data_label}[${keys_group_data_label}[14]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - REASON
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_reason}    ${group_data_label}[${keys_group_data_label}[15]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - REASON NOTE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_reason_note}    ${group_data_label}[${keys_group_data_label}[16]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - NOTE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_note}    ${group_data_label}[${keys_group_data_label}[17]]

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - REQUEST STATUS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_request_status}    ${group_data_label}[${keys_group_data_label}[33]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] - STEP 2 - STATUS DATE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_od_ib_status_date}    ${group_data_label}[${keys_group_data_label}[34]]    



# step 2 change page old content new fields
#verify data step 2 
PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - REQUEST TYPE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_od_ib_request_type}    ${group_data}[${keys_group_data_label}[1]]        

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER ID
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_customer_id}     ${group_data}[${keys_group_data_label}[2]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - BUSINESS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_od_ib_business}    ${group_data}[${keys_group_data_label}[3]]     

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - CONTRACT NO
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_contract_no}     ${group_data}[${keys_group_data_label}[4]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - REQUEST NO
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_request_no}     ${group_data}[${keys_group_data_label}[5]]

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER NAME
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_customer_name}     ${group_data}[${keys_group_data_label}[7]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - TOTAL O/S BALANCE
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_total_os_balance}     ${group_data}[${keys_group_data_label}[8]]

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - REQUEST DATE
    ${con_date}=    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[9]]     
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_request_date}    ${con_date}   
    
PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - REQUESTER
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_requester}     ${group_data}[${keys_group_data_label}[10]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - TEAM
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR STRIP    ${txt_od_ib_team}    ${group_data}[${keys_group_data_label}[11]]   
    
PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - OD STATUS
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_od_status}    ${group_data}[${keys_group_data_label}[12]]

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - CLOSING AMOUNT
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_closing_Amount}     ${group_data}[${keys_group_data_label}[13]]

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - WAIVE AMOUNT
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_waive_amount}    ${group_data}[${keys_group_data_label}[14]]

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - REASON
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_od_ib_reason}    ${group_data}[${keys_group_data_label}[15]]       
      
PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - REASON NOTE
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_reason_note}     ${group_data}[${keys_group_data_label}[16]]

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - REQUEST STATUS
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_request_status}    ${group_data}[${keys_group_data_label}[33]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - STEP 2 - STATUS DATE 
    ${con_date}=    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[34]]    
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_od_ib_request_date}    ${con_date}   



#verify label 06 : Negotiation Special discount (Fraud)
PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUEST TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[1]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUEST NO. [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[5]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUESTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[8]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUEST DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[9]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CUSTOMER ID [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[2]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT NO [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[4]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CUSTOMER NAME [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[10]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CALL CENTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[11]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - AGE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[12]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TEAM [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[13]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - NUMBER OF CHILD [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[14]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - OD STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[16]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - LAST SALARY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[17]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[18]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CUSTOMER STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[19]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[20]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - BUSINESS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[3]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - WO DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[21]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[22]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TIME OF PAYMENT [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[23]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - DUE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[24]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TIMES OF PENALTY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[25]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUEST TIMES [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[26]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - LAST REQUEST NO [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[27]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - MINIMUM/INSTALL: [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[28]]



# Verify data 06 : Negotiation Special discount (Fraud)
PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUEST TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_09_nsd_request_type_locator}     ${group_data}[${keys_group_data_label}[1]]

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUEST NO. [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_09_nsd_request_no_locator}     ${group_data}[${keys_group_data_label}[5]]
    
PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUESTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_requester_locator}     ${group_data}[${keys_group_data_label}[8]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUEST DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    ${con_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[9]]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_request_date_locator}    ${con_date}

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CUSTOMER ID [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_cust_id_locator}     ${group_data}[${keys_group_data_label}[2]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT NO [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_contract_no_locator}     ${group_data}[${keys_group_data_label}[4]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CUSTOMER NAME [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_cust_name_locator}     ${group_data}[${keys_group_data_label}[10]]    
    
PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CALL CENTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_call_center_locator}     ${group_data}[${keys_group_data_label}[11]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - AGE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_age_locator}     ${group_data}[${keys_group_data_label}[12]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - TEAM [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_team2_locator}     ${group_data}[${keys_group_data_label}[13]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - OD STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_od_status2_locator}     ${group_data}[${keys_group_data_label}[16]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_contract_type_locator}     ${group_data}[${keys_group_data_label}[18]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]    
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_contract_date_locator}     ${group_data}[${keys_group_data_label}[20]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - BUSINESS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_09_nsd_biz_locator}     ${group_data}[${keys_group_data_label}[3]]

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - WO DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]    
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_wo_date_locator}     ${group_data}[${keys_group_data_label}[21]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_09_nsd_contract_status_locator}     ${group_data}[${keys_group_data_label}[22]]

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - TIME OF PAYMENT [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_time_of_payment_locator}     ${group_data}[${keys_group_data_label}[23]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - DUE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_due_locator}     ${group_data}[${keys_group_data_label}[24]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - TIMES OF PENALTY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_time_of_penalty_locator}     ${group_data}[${keys_group_data_label}[25]]    

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUEST TIMES [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_req_time_locator}     ${group_data}[${keys_group_data_label}[26]]    


### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[29]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[30]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[31]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[32]]


# --------------------------------------------------------------------------
# (OD screen)
# title 
PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : LOAN AMT OF CUSTOMER]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_loan_amt_of_customer}    ${group_data_label}[${keys_group_data_label}[33]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : LOAN AMT OF NEW CONTRACT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_loan_amt_of_new_contract}    ${group_data_label}[${keys_group_data_label}[34]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : CONTRACT AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_contract_amount}    ${group_data_label}[${keys_group_data_label}[35]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : PAID TERM]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_paid_term}    ${group_data_label}[${keys_group_data_label}[36]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : TOTAL PAID AMT (OLD CONTRACT)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_total_paid_amt_old_contract}    ${group_data_label}[${keys_group_data_label}[37]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : TOTAL PAID AMT (NEW CONTRACT)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_total_paid_amt_new_contract}    ${group_data_label}[${keys_group_data_label}[38]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : OS (AS OF CLOSING DATE)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_os_as_of_closing_date}    ${group_data_label}[${keys_group_data_label}[39]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : OD AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_od_amount}    ${group_data_label}[${keys_group_data_label}[40]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : PENALTY AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_penalty_amount}    ${group_data_label}[${keys_group_data_label}[41]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : CLOSING (SYD)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_closing_syd}    ${group_data_label}[${keys_group_data_label}[42]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : WO AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_wo_amount}    ${group_data_label}[${keys_group_data_label}[43]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : CUSTOMER WILL PAY]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_customer_will_pay}    ${group_data_label}[${keys_group_data_label}[44]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF. FROM CLOSING]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_closing}    ${group_data_label}[${keys_group_data_label}[45]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF. FROM WO (OD)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_wo_od}    ${group_data_label}[${keys_group_data_label}[46]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : TOTAL RECEIVED]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_total_received}    ${group_data_label}[${keys_group_data_label}[47]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF FROM LOAN AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_loan_amount}    ${group_data_label}[${keys_group_data_label}[48]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF FROM OS]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_os}    ${group_data_label}[${keys_group_data_label}[49]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF FROM WO]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_wo}    ${group_data_label}[${keys_group_data_label}[50]]


# value 
PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : LOAN AMT OF CUSTOMER]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_loan_amt_of_customer}    ${group_data}[${keys_group_data_label}[33]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_loan_amt_of_customer}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : LOAN AMT OF NEW CONTRACT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_loan_amt_of_new_contract}    ${group_data}[${keys_group_data_label}[34]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_loan_amt_of_new_contract}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : CONTRACT AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_contract_amount}    ${group_data}[${keys_group_data_label}[35]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_contract_amount}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : PAID TERM]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_paid_term}    ${group_data}[${keys_group_data_label}[36]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_paid_term}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : TOTAL PAID AMT (OLD CONTRACT)]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_total_paid_amt_old_contract}    ${group_data}[${keys_group_data_label}[37]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_total_paid_amt_old_contract}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : TOTAL PAID AMT (NEW CONTRACT)]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_total_paid_amt_new_contract}    ${group_data}[${keys_group_data_label}[38]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_total_paid_amt_new_contract}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : OS (AS OF CLOSING DATE)]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_os_as_of_closing_date}    ${group_data}[${keys_group_data_label}[39]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_os_as_of_closing_date}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : OD AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_od_amount}    ${group_data}[${keys_group_data_label}[40]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_od_amount}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : PENALTY AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_penalty_amount}    ${group_data}[${keys_group_data_label}[41]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_penalty_amount}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : CLOSING (SYD)]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_closing_syd}    ${group_data}[${keys_group_data_label}[42]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_closing_syd}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : WO AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_wo_amount}    ${group_data}[${keys_group_data_label}[43]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_wo_amount}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : CUSTOMER WILL PAY]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_customer_will_pay}    ${group_data}[${keys_group_data_label}[44]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_customer_will_pay}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : TOTAL RECEIVED]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_total_received}    ${group_data}[${keys_group_data_label}[47]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_total_received}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : DIFF FROM LOAN AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_diff_from_loan_amount}    ${group_data}[${keys_group_data_label}[48]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_diff_from_loan_amount}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : DIFF FROM OS]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_diff_from_os}    ${group_data}[${keys_group_data_label}[49]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_diff_from_os}    timeout=30s

PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : DIFF FROM WO]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_diff_from_wo}    ${group_data}[${keys_group_data_label}[50]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_diff_from_wo}    timeout=30s

# --------------------------------------------------------------------------


# Verify Title - 3.2 Entry other ...
PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[73]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[74]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[75]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[76]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[77]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[78]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[79]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[80]]

PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_od_approve_replace}    ${group_data_label}[${keys_group_data_label}[81]]


# verify
PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    ${date_last_cont_3_party}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[73]]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${input_09_nd_js_last_cont_3_party_locator}    ${date_last_cont_3_party}
   
PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    ${date_last_cont_cust}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[74]]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${input_09_nd_js_last_cont_cust_locator}    ${date_last_cont_cust}

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${select_09_nd_who_req_locator}    ${group_data}[${keys_group_data_label}[76]]

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS   ${select_09_nd_discount_camp_locator}    ${group_data}[${keys_group_data_label}[77]]    #error

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${select_09_nd_who_paid_locator}    ${group_data}[${keys_group_data_label}[78]]

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${select_09_nd_source_fund__locator}    ${group_data}[${keys_group_data_label}[79]]

PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS SIGLE QUOTE   ${select_09_nd_reason_locator}    ${group_data}[${keys_group_data_label}[80]]


# verify   
PAGE INBOX - TYPE 09 - [VERIFY] - [LABEL] SEND TO    
    [Arguments]    ${user_level}
    ${status}=    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_ib_sendto}    10s
   
    IF  '${status}' == 'True'    # ถ้ามี ปุ่ม send to
        BuiltIn.Log   SEND TO STATUS->${status}    WARN
        IF  '${user_level}' == '0'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_od_ib_sendto}    ${group_data}[${keys_group_data_label}[8]]    # Send to 1 = P2503094
            Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
        
        ELSE IF  '${user_level}' == '1'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_od_ib_sendto}    ${group_data}[${keys_group_data_label}[82]]    # Send to 2 = P2510033 
            Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
       
        ELSE IF  '${user_level}' == '2'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_od_ib_sendto}    ${group_data}[${keys_group_data_label}[83]]    # Send to 3 = P2503067 
            Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
       
        ELSE IF  '${user_level}' == '3'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_od_ib_sendto}    ${group_data}[${keys_group_data_label}[84]]    # Send to 4 = P2106010 
            Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
       
        ELSE IF  '${user_level}' == '4'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_od_ib_sendto}    ${group_data}[${keys_group_data_label}[85]]    # Send to 5 = KIMURA
            Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX     # click approve and write excel
        END
  
    ELSE IF  '${status}' == 'False'    # ถ้าไม่มี ปุ่ม send to
        BuiltIn.Log   SEND TO STATUS->${status}    WARN
        Approve_negotiate_09_feature.SET FEATURE - TYPE - 09 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX
    END   


# verify note 
PAGE INBOX - TYPE 09 - [VERIFY] - [LABEL] NOTE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_od_ib_note}       

# input data note
PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] NOTE
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_od_ib_note}    ${group_data}[${keys_group_data_label}[86]]   


# btn approve
PAGE INBOX - TYPE 09 - [CLICK] - [BTN] APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}        

# verify title popup
PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] APPROVE 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${verfiy_approve_popup}    

PAGE INBOX - TYPE 09 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_ok_approve_popup}    

PAGE INBOX - TYPE 09 - [VERIFY] - [POPUP] APPROVE - [CLICK] CANCEL
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_cancel_approve_popup}    

# loading 
PAGE INBOX - TYPE 09 - [WAIT] LOADING PAGE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}   

PAGE INBOX - TYPE 09 - [VERIFY] - [LOADING] 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS NOT VISIBLE BY LOCATOR    ${loading}
 
# logout
PAGE INBOX - TYPE 09 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    