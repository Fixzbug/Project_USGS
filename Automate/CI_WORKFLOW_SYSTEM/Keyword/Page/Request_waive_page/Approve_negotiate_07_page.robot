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

SET FORMAT DATA TYPE 07
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}
    ${countrow}    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]    
        ${group_data}    BuiltIn.Set Variable   ${result_excel}[0]
        BuiltIn.Set Global Variable    ${group_data}

        ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
        ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[95]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 

        IF  ${Request_No} != 'none' and ${State} == 'Request' or ${Request_No} != 'none' and ${State} == 'Approve' 
                                
            ${Rows}    BuiltIn.Evaluate    ${index} + 2                    # +2 because add title at row 2 
            BuiltIn.Set Global Variable    ${Rows}   

            BuiltIn.Log    ----------------------------------------    WARN 
            BuiltIn.Log    CONATRACT ROW>${Rows}:${row}_${index}:>RequestNO>${Request_No}    WARN
            BuiltIn.Log    ----------------------------------------    WARN

            Approve_negotiate_07_feature.VERIFY FEATURE - DATA TITLE - PAGE INBOX - [TYPE: 07]     # verify title 07 - inbox
            Approve_negotiate_07_feature.SET FEATURE - INPUT DATA - PAGE INBOX - [TYPE: 07]        # Input req type, reqter, req no,cust id and cont no
            # Approve_negotiate_07_feature.VERIFY FEATURE - DATA TITLE TABLE - PAGE INBOX - [TYPE: 07]     # verify title table - inbox
            Approve_negotiate_07_feature.VERIFY FEATURE - DATA VALUE TABLE - PAGE INBOX - [TYPE: 07]     # verify value table - inbox

            Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_ib_request_date}    50s
            ${request_date}    SeleniumLibrary.Get Value    ${txt_ib_request_date}
            BuiltIn.Log    >Request Date From Web>${request_date}    WARN

            ${date_current}    Common_keyword.GET DATE IN FORMATTED DATE TIME

            IF  '${request_date}' == '${date_current}'
                # ถ้าวันที่ ปัจุบันบนเครื่อง jenkins ตรงกับ request date ให้เอาวันที่ ${date_current} ไปเล่น
                ${date_start_cal_date}    BuiltIn.Set Variable    ${date_current}
                BuiltIn.Set Global Variable    ${date_start_cal_date}    

                # ${date_paid_date}    Common_keyword.GET DATE IN FORMATTED DATE TIME PLUS    # + 1 สำหรับเล่นวันถัดไป
                # BuiltIn.Set Global Variable    ${date_paid_date}    

                ${date_paid_date}    BuiltIn.Set Variable    ${date_current}    # ใช้วันปัจุบันบนเครื่องเลย
                BuiltIn.Set Global Variable    ${date_paid_date}

            ELSE IF  '${request_date}' != '${date_current}'
                # ถ้าวันที่ ปัจุบันบนเครื่อง jenkins ไม่ตรงกับ request date ให้เอาวันที่ ${request_date} ไปเล่น
                ${date_start_cal_date}    BuiltIn.Set Variable    ${request_date}
                BuiltIn.Set Global Variable    ${date_start_cal_date}    

                # ${date_paid_date}    Common_keyword.CONVERT GET DATE IN FORMATTED DATE TIME PLUS    ${request_date}     # + 1 สำหรับเล่นวันถัดไป
                # BuiltIn.Set Global Variable    ${date_paid_date} 

                ${date_paid_date}    BuiltIn.Set Variable    ${request_date}    # ใช้วันปัจุบันบนเว็บเลย
                BuiltIn.Set Global Variable    ${date_paid_date}

            ELSE
                BuiltIn.fail    !!!!!!!!!!!!! ERROR DATE !!!!!!!!!!!!!  
            END

            # Approve Negotiate
            # Approve_negotiate_07_feature.VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE - [TYPE: 07]   # verify title - approve negotiate blog 1
            Approve_negotiate_07_feature.VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE - [TYPE: 07]    # verify value - approve negotiate blog 1

            # 1. Negotiate discount detail
            # Approve_negotiate_07_feature.VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 07]    # verify title 07 - 1
            Approve_negotiate_07_feature.VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 07]    # verify value 07 - 1    [capture]

            # 3. Request detail
            # Approve_negotiate_07_feature.VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 07]    # verify title 07 - 3
            Approve_negotiate_07_feature.VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 07]    # verify value 07 - 3

            
            BuiltIn.Exit For Loop
        
        END
    END


# add new
PAGE INBOX - TYPE 07 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE INBOX - TYPE 07 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE INBOX - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 0 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE INBOX - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE INBOX - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE INBOX - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE INBOX - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE INBOX - TYPE 07 - SETTING LOGIN
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
PAGE INBOX - TYPE 07 - [CLICK] - LINK 
    ${link_system}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]    
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE INBOX - TYPE 07 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    

PAGE INBOX - TYPE 07 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    

PAGE INBOX - TYPE 07 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    

# เลือก iframe
PAGE INBOX - TYPE 07 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_locator}

# เลือก iframe
PAGE INBOX - TYPE 07 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME


# Click btn sign out
PAGE INBOX - [CLICK] - [BUTTON] - SIGN OUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_value_07_nsd_sign_out_locator}


PAGE INBOX - [CLICK] - [BUTTON] - SIGN OUT 2
    SeleniumLibrary.Unselect Frame
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_value_07_nsd_sign_out_locator}



# Verify Title - Page Inbox
PAGE INBOX - [VERIFY] - [TITLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_07_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUESTER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_07_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUEST NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_07_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]


PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_07_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]



# Input Data - Inbox
PAGE INBOX - [INPUT] - REQUEST TYPE
    Log    ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    WARN
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_07_inbox_req_type_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_07_inbox_req_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE INBOX - [INPUT] - REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_07_inbox_requester_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]


PAGE INBOX - [INPUT] - REQUEST NO.
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_07_inbox_request_no_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INBOX - [INPUT] - CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_07_inbox_cust_id_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INBOX - [INPUT] - CONTRACT NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_07_inbox_contract_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]


PAGE INBOX - [CLICK] - [BUTTON] - SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_07_inbox_search_locator}



# Verify Title Table - Page Inbox
PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    No


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[83]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[84]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SEND DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[85]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_req_type_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]

PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE 2
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_req_type2_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[86]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[87]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[88]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - TEAM
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[11]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REASON
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[79]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[89]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[90]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[91]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - ACTION
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inbox_format_locator}    Action



# Verify Value Table - Page Inbox
PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     1


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[84]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SEND DATE
    ${current_date_from_local}    common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${current_date_from_local}
    # ${date_send_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[85]]]
    # Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${date_send_date}


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE
    ${result0}    GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 07]    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    0

PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE 2
    ${result1}    GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 07]    ${txt_value_table_req_type_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    1


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[86]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[87]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[88]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - TEAM
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[11]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REASON
    ${result0}    GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 07]    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[79]]]    0   


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[89]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value__appr_user_07_inbox_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[90]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[91]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - ACTION
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_action_07_inbox_format_locator}    Action



# Click link action in table
PAGE INBOX - [CLICK] - [TEXT] - ACTION
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_herf_table_action_07_inbox_locator}


# Verify Title - page approve negotiate
PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_req_type_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_req_no_locator}    ${group_data_label}[${keys_group_data_label}[5]]
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUESTER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_requester_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_req_date_locator}    ${group_data_label}[${keys_group_data_label}[7]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_cust_id_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_req_status_locator}    Request Status


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_cont_no_locator}    ${group_data_label}[${keys_group_data_label}[4]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - STATUS DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_status_date_locator}    Status Date


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_cust_name_locator}    ${group_data_label}[${keys_group_data_label}[8]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CALL CENTER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_call_center_locator}    ${group_data_label}[${keys_group_data_label}[9]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - NUMBER OF CHILD
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_num_of_child_locator}    ${group_data_label}[${keys_group_data_label}[12]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TEAM
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_team_locator}    ${group_data_label}[${keys_group_data_label}[11]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - AGE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_age_locator}    ${group_data_label}[${keys_group_data_label}[10]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - OD STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_od_status_locator}    ${group_data_label}[${keys_group_data_label}[14]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - LAST SALARY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_last_salary_locator}    ${group_data_label}[${keys_group_data_label}[15]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_cont_type_locator}    ${group_data_label}[${keys_group_data_label}[16]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_cust_status_locator}    ${group_data_label}[${keys_group_data_label}[17]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_cont_date_locator}    ${group_data_label}[${keys_group_data_label}[18]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - BUSINESS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_biz_locator}    ${group_data_label}[${keys_group_data_label}[3]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - WO DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_wo_date_locator}    ${group_data_label}[${keys_group_data_label}[19]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_cont_status_locator}    ${group_data_label}[${keys_group_data_label}[20]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TIME OF PAYMENT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_time_payment_locator}    ${group_data_label}[${keys_group_data_label}[21]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - DUE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_due_locator}    ${group_data_label}[${keys_group_data_label}[22]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TIMES OF PENALTY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_time_penalty_locator}    ${group_data_label}[${keys_group_data_label}[23]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST TIMES
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_req_time_locator}    ${group_data_label}[${keys_group_data_label}[24]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - LAST REQUEST NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_last_req_no_locator}    ${group_data_label}[${keys_group_data_label}[25]]



# Verify Value - page approve negotiate
PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST TYPE
    SeleniumLibrary.Unselect Frame
    SeleniumLibrary.Select Frame    ${ifrmae_req_waive_locator}
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_request_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST NO.
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_request_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]    value
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUESTER
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_requester_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST DATE
    ${current_date_from_local}    common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_request_date_locator}     ${current_date_from_local}    value
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA DATE FROM EXCEL    ${txt_value_07_nsd_request_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[7]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER ID
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_cust_id_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST STATUS
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_req_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[91]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT NO
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_contract_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - STATUS DATE
    ${current_date_from_local}    common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_status_date_locator}     ${current_date_from_local}    value
    # ${status_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[85]]]
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_status_date_locator}      ${status_date}    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER NAME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_cust_name_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[8]]]    value
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CALL CENTER
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_call_center_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[9]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - NUMBER OF CHILD
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${input_07_nsd_num_of_child_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[12]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TEAM
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_team2_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[11]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - AGE
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_age_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[10]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - OD STATUS
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_od_status2_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[14]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST SALARY
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL AND REPLACE COMMA    ${input_07_nsd_last_salary_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[15]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT TYPE
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_contract_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[16]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_cust_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[17]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT DATE
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_contract_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[18]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - BUSINESS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_biz_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - WO DATE
    # IF    '${group_data}[${group_data_label}[${keys_group_data_label}[19]]]' == 'none'
    #     ${group_data}[${group_data_label}[${keys_group_data_label}[19]]]    Set Variable    0
    # END
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_wo_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[19]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING    ${txt_value_07_nsd_contract_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[20]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TIME OF PAYMENT
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_time_of_payment_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[21]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - DUE
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_due_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[22]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TIMES OF PENALTY
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_time_of_penalty_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[23]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST TIMES
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_req_time_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[24]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST REQUEST NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_07_nsd_last_req_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[25]]]



### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_total_term_locator}    Total term


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_total_paid_amut_locator}    Total paid amount


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_first_due_date_locator}    ${group_data_label}[${keys_group_data_label}[29]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING    ${txt_title_approve_negotiate_start_cal_date_locator}    ${group_data_label}[${keys_group_data_label}[30]]    right


# Verify Value - Negotiate Detail - 1. Entry negotiate discount detail
PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${input_value_approve_negotiate_totals_term_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[27]]]    value
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL AND REPLACE COMMA    ${input_value_approve_negotiate_totals_paid_amt_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[28]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    # BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[30]]    WARN
    # IF  '${group_data}[${keys_group_data_label}[30]]' == 'none'
    #     BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
    #     SeleniumLibrary.Execute JavaScript    document.getElementById('${input_07_nd_js_start_cal_date_id}').value='${date_start_cal_date}';
    # ELSE
    #     BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
    #     ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[30]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_07_nd_js_start_cal_date_id}').value='${date_start_cal_date}';
    # END


# 3. Request detail
# Verify title - page approve negotiate
PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_last_cont_3_party_locator}    ${group_data_label}[${keys_group_data_label}[72]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_last_cont_cust_locator}    ${group_data_label}[${keys_group_data_label}[73]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_have_job_locator}    ${group_data_label}[${keys_group_data_label}[74]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_who_req_locator}    ${group_data_label}[${keys_group_data_label}[75]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_disc_campaign_locator}    ${group_data_label}[${keys_group_data_label}[76]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_who_paid_locator}    ${group_data_label}[${keys_group_data_label}[77]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_source_fund_locator}    ${group_data_label}[${keys_group_data_label}[78]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_reason_locator}    ${group_data_label}[${keys_group_data_label}[79]]
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_reason_note_locator}    ${group_data_label}[${keys_group_data_label}[80]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - SEND TO [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    # check ว่าเจอ element send to ไหม ? ถ้าเจอจะเลือก send to
    ${result}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_title_approve_negotiate_send_to_locator}
    IF    '${result}' == 'True'
        Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_send_to_locator}    ${group_data_label}[${keys_group_data_label}[81]]
    END


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REJECT REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_rej_reason_locator}    ${group_data_label}[${keys_group_data_label}[92]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REJECT NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_rej_note_locator}    ${group_data_label}[${keys_group_data_label}[93]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_note_locator}    ${group_data_label}[${keys_group_data_label}[82]]



# Verify value - page approve negotiate
PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    # BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[72]]    WARN
    # IF  '${group_data}[${keys_group_data_label}[72]]' == 'none'
    #     BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
    #     SeleniumLibrary.Execute JavaScript    document.getElementById('${input_07_nd_js_last_cont_3_party_id}').value='${date_start_cal_date}';
    # ELSE
    #     BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
    #     ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[72]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_07_nd_js_last_cont_3_party_id}').value='${date_start_cal_date}';
    # END


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    # BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[73]]    WARN
    # IF  '${group_data}[${keys_group_data_label}[73]]' == 'none'
    #     BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
    #     SeleniumLibrary.Execute JavaScript    document.getElementById('${input_07_nd_js_last_cont_cust_id}').value='${date_start_cal_date}';
    # ELSE
    #     BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
    #     ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[73]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_07_nd_js_last_cont_cust_id}').value='${date_start_cal_date}';
    # END


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - HAVE JOB [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    IF    '${group_data}[${group_data_label}[${keys_group_data_label}[74]]]' == 'Yes'
        SeleniumLibrary.Wait Until Element Is Visible    ${input_value_approve_negotiate_have_job_check_y_locator}    15

    ELSE IF    '${group_data}[${group_data_label}[${keys_group_data_label}[74]]]' == 'No'
        SeleniumLibrary.Wait Until Element Is Visible    ${input_value_approve_negotiate_have_job_check_n_locator}    15
    END


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - WHO REQUEST [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_07_nd_who_req_locator}   15
    ${data_web}    SeleniumLibrary.Get Element Attribute    ${txt_07_nd_who_req_locator}    value
    ${parts}    String.Split String    ${data_web}    :
    ${modified_data_web}    Collections.Get From List   ${parts}    0
    ${modified_data_web}    String.Strip String    ${modified_data_web}
    ${data_excel}    BuiltIn.Set Variable If      "${group_data}[${group_data_label}[${keys_group_data_label}[75]]]" == "none"      Data is empty    ${modified_data_web}
    ${data_web}      BuiltIn.Set Variable If      "${data_web}" == "${EMPTY}"    Data is empty    ${data_web}
    IF    "${data_web}"=="${data_excel}"
         BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
         BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}
    ELSE
        Fail     Data compare is not equal\nData Web: ${data_web} / Data Excel: ${data_excel}
    END


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING       ${select_07_nd_discount_camp_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[76]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - WHO PAID [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING       ${select_07_nd_who_paid_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[77]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING       ${select_07_nd_source_fund_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[78]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING       ${select_07_nd_reason_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[79]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL       ${input_07_nd_reason_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[80]]]    value


# verify   
PAGE APPROVE NEGOTIATE - TYPE 07 - [VERIFY] - [LABEL] SEND TO
    [Arguments]    ${user_level}
    ${status}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_value_approve_negotiate_send_to_locator}    5s
   
    IF  '${status}' == 'True'    # ถ้ามี ปุ่ม send to
        BuiltIn.Log   SEND TO STATUS->${status}    WARN
        IF  '${user_level}' == '0'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${dropdown_value_approve_negotiate_send_to_locator}    ${group_user}[${keys_group_user}[3]]    # Send to 1 = P2503064
        
        ELSE IF  '${user_level}' == '1'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${dropdown_value_approve_negotiate_send_to_locator}    ${group_user}[${keys_group_user}[5]]    # Send to 2 = P2510033 
       
        ELSE IF  '${user_level}' == '2'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${dropdown_value_approve_negotiate_send_to_locator}    ${group_user}[${keys_group_user}[7]]    # Send to 3 = P2503067 
       
        ELSE IF  '${user_level}' == '3'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${dropdown_value_approve_negotiate_send_to_locator}    ${group_user}[${keys_group_user}[9]]    # Send to 4 = P2106010 
       
        ELSE IF  '${user_level}' == '4'
            BuiltIn.Log   CASE SEND TO->${user_level}    WARN
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${dropdown_value_approve_negotiate_send_to_locator}    ${group_user}[${keys_group_user}[11]]    # Send to 5 = KIMURA
        END

        Approve_negotiate_07_feature.SET FEATURE - TYPE - 07 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX
        ${finish_send_to}    BuiltIn.Set Variable    True
        BuiltIn.Set Global Variable    ${finish_send_to}
  
    ELSE IF  '${status}' == 'False'    # ถ้าไม่มี ปุ่ม send to
        BuiltIn.Log   SEND TO STATUS->${status}    WARN
        Approve_negotiate_07_feature.SET FEATURE - TYPE - 07 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX
        ${finish_send_to}    BuiltIn.Set Variable    False
        BuiltIn.Set Global Variable    ${finish_send_to}
    END   



PAGE APPROVE NEGOTIATE - [INPUT] - NOTE
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_07_nd_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[82]]]


# btn approve
PAGE INBOX - TYPE 07 - [CLICK] - [BTN] APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}        

# verify title popup
PAGE INBOX - TYPE 07 - [VERIFY] - [TITLE] APPROVE 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${verfiy_approve_popup}    

PAGE INBOX - TYPE 07 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_ok_approve_popup}    

PAGE INBOX - TYPE 07 - [VERIFY] - [POPUP] APPROVE - [CLICK] CANCEL
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_cancel_approve_popup}    

# loading 
PAGE INBOX - TYPE 07 - [WAIT] LOADING PAGE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}   

PAGE INBOX - TYPE 07 - [VERIFY] - [LOADING] 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS NOT VISIBLE BY LOCATOR    ${loading}
 
# logout
PAGE INBOX - TYPE 07 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}   




### Keyword ###
# Split text - Request Type	[Inbox]
GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 07]
    [Arguments]    ${locator}    ${data_excel}    ${index}
    # Web
    ${result}      Split String    ${data_excel}    ${SPACE}:${SPACE}
    ${replace_locator}    String.Replace String    ${locator}    ***replace***    ${result[${index}]}
    # SeleniumLibrary.Wait Until Element Is Visible    ${replace_locator}    15
    ${data_web}    SeleniumLibrary.Get Text    ${replace_locator}
    ${data_web}    BuiltIn.Set Variable If      "${data_web}" == "${EMPTY}"    Data is empty    ${data_web}

    # Excel
    ${result_excel}    Split String    ${data_excel}    ${SPACE}:${SPACE}
    ${data_excel}      Set Variable    ${result_excel[${index}]}

    ${data_excel}    BuiltIn.Set Variable If    "${data_excel}" == "none"    Data is empty    ${data_excel}

    IF    "${data_web}" == "${data_excel}"
        BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
        BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}
    ELSE
        Fail    Data compare is not equal
    END
    
    RETURN    ${data_web}



# Replace dash(-) Contract No. [Inbox]
GET TEXT REPLACE DASH AND VERIFY DATA FROM EXCEL
    [Arguments]    ${locator}    ${data_excel}
    SeleniumLibrary.Wait Until Element Is Visible    ${data_excel}   15
    ${replace_locator}    String.Replace String    ${locator}    ***replace***    ${data_excel}
    ${data_web}    SeleniumLibrary.Get Text    ${replace_locator}

    ${data}    Replace String    ${data_excel}    -    ${EMPTY}

    ${data_excel}    BuiltIn.Set Variable If      "${data_excel}" == "none"      Data is empty    ${data_excel}
    ${data_web}      BuiltIn.Set Variable If      "${data_web}" == "${EMPTY}"    Data is empty    ${data_web}
    IF    "${data_web}"=="${data_excel}"
         BuiltIn.Should Be Equal    ${data_web}    ${data_excel}
         BuiltIn.Log    Data Web: ${data_web} / Data Excel: ${data_excel}
    ELSE
       Fail     Data compare is not equal
    END

