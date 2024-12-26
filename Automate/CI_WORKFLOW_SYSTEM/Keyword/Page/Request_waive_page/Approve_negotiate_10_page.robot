*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# Set Global
${rowForWrite} 
${user_send_to}

*** Keywords ***
### INBOX ###
# Get text and write request no
PAGE INBOX - WRITE DATA - PAGE INBOX [REQUEST NO]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_red_value_10_nsd_request_no_locator}    180
    ${requestNo}    SeleniumLibrary.Get Element Attribute    ${txt_red_value_10_nsd_request_no_locator}    value
    BuiltIn.Log To Console    \nRequest No: ${requestNo}\n
    Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    6    ${requestNo}



# Login -  user approve
SETTING LOGIN - USER APPROVE
    [Arguments]    ${system_name}    ${username}    ${password}  
    [Timeout]    180s
    # หน้า login #User Authentication
    #Verify
    SeleniumLibrary.Wait Until Element Is Visible    ${verify_header_locator}    60    # User Authentication
    
    # LOG IN
    # User name
    SeleniumLibrary.Wait Until Element Is Visible    ${sso_username_text_area}
    SeleniumLibrary.Input Text    ${sso_username_text_area}   ${username}
    # Password
    SeleniumLibrary.Wait Until Element Is Visible    ${SSO_Password_text_area}
    SeleniumLibrary.Input Password    ${sso_password_text_area}    ${password}  
        
    # Click login button
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    ${system_name}    LOGIN
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_login_on_user_authentication}
    SeleniumLibrary.Click Button    ${btn_login_on_user_authentication}



# Click btn sign out
PAGE INBOX - [CLICK] - [BUTTON] - SIGN OUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_value_10_nsd_sign_out_locator}


PAGE INBOX - [CLICK] - [BUTTON] - SIGN OUT 2
    SeleniumLibrary.Unselect Frame
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_value_10_nsd_sign_out_locator}



# Verify Title - Page Inbox
PAGE INBOX - [VERIFY] - [TITLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUESTER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUEST NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]


PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]



# Input Data - Inbox
PAGE INBOX - [INPUT] - REQUEST TYPE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_10_inbox_req_type_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_10_inbox_req_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE INBOX - [INPUT] - REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_10_inbox_requester_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]


PAGE INBOX - [INPUT] - REQUEST NO.
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_10_inbox_request_no_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INBOX - [INPUT] - CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_10_inbox_cust_id_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INBOX - [INPUT] - CONTRACT NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_10_inbox_contract_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]


PAGE INBOX - [CLICK] - [BUTTON] - SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_10_inbox_search_locator}



# Verify Title Table - Page Inbox
PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    No


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[83]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[84]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SEND DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[85]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_req_type_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]

PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE 2
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_req_type2_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[86]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[87]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[88]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - TEAM
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[11]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REASON
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[79]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[89]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[90]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[91]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - ACTION
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inbox_format_locator}    Action



# Verify Value Table - Page Inbox
PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     1


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[84]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SEND DATE
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${current_date_from_local}
    # ${date_send_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[85]]]
    # Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${date_send_date}


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE
    ${result0}    GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 10]    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    0

PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE 2
    ${result1}    GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 10]    ${txt_value_table_req_type_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    1


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[86]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[87]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[88]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - TEAM
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[11]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REASON
    ${result0}    GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 10]    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[79]]]    0   


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[89]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value__appr_user_10_inbox_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[90]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[91]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - ACTION
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_action_10_inbox_format_locator}    Action



# Click link action in table
PAGE INBOX - [CLICK] - [TEXT] - ACTION
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_herf_table_action_10_inbox_locator}


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
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_request_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST NO.
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_request_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]    value
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUESTER
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_requester_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST DATE
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_request_date_locator}     ${current_date_from_local}    value
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA DATE FROM EXCEL    ${txt_value_10_nsd_request_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[7]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER ID
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_cust_id_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST STATUS
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_req_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[91]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT NO
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_contract_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - STATUS DATE
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_status_date_locator}     ${current_date_from_local}    value
    # ${status_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[85]]]
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_status_date_locator}      ${status_date}    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER NAME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_cust_name_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[8]]]    value
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CALL CENTER
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_call_center_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[9]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - NUMBER OF CHILD
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${input_10_nsd_num_of_child_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[12]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TEAM
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_team2_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[11]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - AGE
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_age_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[10]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - OD STATUS
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_od_status2_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[14]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST SALARY
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL AND REPLACE COMMA    ${input_10_nsd_last_salary_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[15]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT TYPE
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_contract_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[16]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_cust_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[17]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT DATE
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_contract_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[18]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - BUSINESS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_biz_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - WO DATE
    # IF    '${group_data}[${group_data_label}[${keys_group_data_label}[19]]]' == 'none'
    #     ${group_data}[${group_data_label}[${keys_group_data_label}[19]]]    Set Variable    0
    # END
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_wo_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[19]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING    ${txt_value_10_nsd_contract_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[20]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TIME OF PAYMENT
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_time_of_payment_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[21]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - DUE
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_due_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[22]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TIMES OF PENALTY
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_time_of_penalty_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[23]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST TIMES
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_req_time_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[24]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST REQUEST NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_last_req_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[25]]]



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


# PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${input_value_approve_negotiate_start_cal_date_locator}     ${current_date_from_local}    value
    # ${start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[30]]]
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${input_value_approve_negotiate_start_cal_date_locator}     ${start_cal_date}    value



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
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${input_10_nd_js_last_cont_3_party_locator}     ${current_date_from_local}    value
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA DATE FROM EXCEL    ${input_10_nd_js_last_cont_3_party_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[72]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${input_10_nd_js_last_cont_cust_locator}     ${current_date_from_local}    value
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA DATE FROM EXCEL       ${input_10_nd_js_last_cont_cust_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[73]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - HAVE JOB [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    IF    '${group_data}[${group_data_label}[${keys_group_data_label}[74]]]' == 'Yes'
        SeleniumLibrary.Wait Until Element Is Visible    ${input_value_approve_negotiate_have_job_check_y_locator}    15

    ELSE IF    '${group_data}[${group_data_label}[${keys_group_data_label}[74]]]' == 'No'
        SeleniumLibrary.Wait Until Element Is Visible    ${input_value_approve_negotiate_have_job_check_n_locator}    15
    END


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - WHO REQUEST [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_10_nd_who_req_locator}   15
    ${data_web}    SeleniumLibrary.Get Element Attribute    ${txt_10_nd_who_req_locator}    value
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
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING       ${select_10_nd_discount_camp_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[76]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - WHO PAID [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING       ${select_10_nd_who_paid_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[77]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING       ${select_10_nd_source_fund_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[78]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING       ${select_10_nd_reason_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[79]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL       ${input_10_nd_reason_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[80]]]    value



# Input data - page approve negotiate
PAGE APPROVE NEGOTIATE - [DROPDOWN] - SEND TO
    # check ว่าเจอ element send to ไหม ? ถ้าเจอจะเลือก send to
    ${result}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_value_approve_negotiate_send_to_locator}
    IF    '${result}' == 'True'
        SeleniumLibrary.Select From List By Label   ${dropdown_value_approve_negotiate_send_to_locator}     ${user_send_to}
    END


PAGE APPROVE NEGOTIATE - [INPUT] - NOTE
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[82]]]



### Keyword ###
# Split text - Request Type	[Inbox]
GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 10]
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


# Set User and Password
# PAGE INQUIRY - INPUT USENAME AND PASSWORD BY USER LEVEL
#     [Arguments]    ${user_level}

#     IF  '${user_level}' == '0'         # user approve user0 
#         PAGE INQUIRY - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 1 row,col -> 3,4 -> P2503064
#     ELSE IF  '${user_level}' == '1'    # user approve user1 
#         PAGE INQUIRY - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
#     ELSE IF  '${user_level}' == '2'    # user approve user2
#         PAGE INQUIRY - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
#     ELSE IF  '${user_level}' == '3'    # user approve user3
#         PAGE INQUIRY - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
#     ELSE IF  '${user_level}' == '4'    # user approve user4
#         PAGE INQUIRY - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
#     END

