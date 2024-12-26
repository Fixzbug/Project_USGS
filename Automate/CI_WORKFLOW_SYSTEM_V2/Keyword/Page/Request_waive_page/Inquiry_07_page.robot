*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# excel name
${Excel_name}

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

        ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'       #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
        ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[95]]'            #'${group_data}[State]'           # get case   สำหรับเช็ค 

        IF  ${Request_No} != 'none' and ${State} == 'Approve'
                                
            ${Rows}    BuiltIn.Evaluate    ${index} + 2    # +2 because add title at row 2 
            BuiltIn.Set Global Variable    ${Rows}   

            BuiltIn.Log    ----------------------------------------    WARN 
            BuiltIn.Log    CONATRACT ->ROW->${Rows}:${row}_${index}:>RequestNO->${Request_No}    WARN
            BuiltIn.Log    ----------------------------------------    WARN

            # verify title 07 - Inquiry
            Inquiry_07_feature.VERIFY FEATURE - DATA TITLE - PAGE INQUIRY  

            # Input req type, reqter, req no,cust id and cont no - Inquiry
            Inquiry_07_feature.SET FEATURE - INPUT DATA - PAGE INQUIRY        

            # verify title table - Inquiry
            # Inquiry_07_feature.VERIFY FEATURE - DATA TITLE TABLE - PAGE INQUIRY  

            # verify value table - Inquiry
            Inquiry_07_feature.VERIFY FEATURE - DATA VALUE TABLE - PAGE INQUIRY     

            ${status_}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_table_inq_status_finish_locator}
            IF  ${status_}

                # เขียนข้อมูล row, column -> Request
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_07}    row=${Rows}    column=96    data=Finished    # Rows global ,colum fix ,data global
                
                # ออกจากระบบ
                Inquiry_07_feature.SET FEATURE - TYPE - 07 - CLICK - LOGOUT - PAGE INQUIRY
            ELSE
                
                # เขียนข้อมูล row, column -> Request
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_07}    row=${Rows}    column=96    data=Pending    # Rows global ,colum fix ,data global
                
                # ออกจากระบบ
                Inquiry_07_feature.SET FEATURE - TYPE - 07 - CLICK - LOGOUT - PAGE INQUIRY
            END

            BuiltIn.Exit For Loop 
        END
    END

# add new
PAGE INQUIRY - TYPE 07 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE INQUIRY - TYPE 07 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE INQUIRY - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 1 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE INQUIRY - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE INQUIRY - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE INQUIRY - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE INQUIRY - TYPE 07 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE INQUIRY - TYPE 07 - SETTING LOGIN
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
PAGE INQUIRY - TYPE 07 - [CLICK] - LINK 
    ${link_system}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]    
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE INQUIRY - TYPE 07 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    


PAGE INQUIRY - TYPE 07 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    


PAGE INQUIRY - TYPE 07 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    


# เลือก iframe
PAGE INQUIRY - TYPE 07 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_locator}

# เลือก iframe
PAGE INQUIRY - TYPE 07 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# Verify Title - Page Inquiry
PAGE INQUIRY - [VERIFY] - [TITLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_07_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]        # Request Type


PAGE INQUIRY - [VERIFY] - [TITLE] - REQUESTER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_07_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE INQUIRY - [VERIFY] - [TITLE] - REQUEST NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_07_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]


PAGE INQUIRY - [VERIFY] - [TITLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_07_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]



# Input Data - Inquiry
PAGE INQUIRY - [INPUT] - REQUEST TYPE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_07_inbox_req_type_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_07_inbox_req_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE INQUIRY - [INPUT] - REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_07_inbox_requester_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]


PAGE INQUIRY - [INPUT] - REQUEST NO.
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_07_inbox_request_no_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INQUIRY - [INPUT] - CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_07_inbox_cust_id_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INQUIRY - [INPUT] - CONTRACT NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_07_inbox_contract_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]


PAGE INQUIRY - [CLICK] - [BUTTON] - SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_07_inbox_search_locator}



# Verify Title Table - Page Inquiry
PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[83]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[84]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - SEND DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[85]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST DESC.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    Request Desc.


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[86]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[87]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - BIZ
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    Biz


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[88]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - TEAM
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[11]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REASON
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[79]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[89]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[90]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[91]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - VIEW
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_07_inquiry_format_locator}    View



# Verify Value Table - Page Inquiry
PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}      ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_sender_inquiry_locator}     ${user_sender}    # P2106010


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - SEND DATE
    ${current_date_from_local}    common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${current_date_from_local}
    # ${date_send_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[85]]]
    # Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${date_send_date}


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE
    ${result0}    Approve_negotiate_07_page.GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 07]    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    0

PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST DESC.
    ${result1}    Approve_negotiate_07_page.GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 07]    ${txt_value_table_req_type_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    1


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[86]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[87]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - BIZ
    ${parts_biz}                Split String    ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]    :
    ${parts_biz_only_left}      Strip String    ${parts_biz}[0]    # RL
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${parts_biz_only_left}


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[88]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - TEAM
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[11]]]

PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REASON
    ${result0}    Approve_negotiate_07_page.GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 07]    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[79]]]    0   


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[89]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_appr_user_07_inbox_locator}     ${user_approve_now}    # KIMURA


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_07_inbox_format_locator}     ${inquiryStatusFinished}    # Finished


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - VIEW
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_action_07_inbox_format_locator}    View


# Click link view in table
PAGE INQUIRY - [CLICK] - [TEXT] - VIEW
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_herf_table_view_07_inbox_locator}


 # loading 
PAGE INQUIRY - TYPE 07 - [WAIT] LOADING PAGE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}    


# logout
PAGE INQUIRY - TYPE 07 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    

