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
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_red_value_04_nsd_request_no_locator}    180
    ${requestNo}    SeleniumLibrary.Get Element Attribute    ${txt_red_value_04_nsd_request_no_locator}    value
    BuiltIn.Log To Console    \nRequest No: ${requestNo}\n
    Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    6    ${requestNo}



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
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_value_04_nsd_sign_out_locator}


PAGE INBOX - [CLICK] - [BUTTON] - SIGN OUT 2
    SeleniumLibrary.Unselect Frame
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_value_04_nsd_sign_out_locator}



# Verify Title - Page Inbox
PAGE INBOX - [VERIFY] - [TITLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUESTER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUEST NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]


PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]



# Input Data - Inbox
PAGE INBOX - [INPUT] - REQUEST TYPE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_04_inbox_req_type_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_04_inbox_req_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE INBOX - [INPUT] - REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_04_inbox_requester_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]


PAGE INBOX - [INPUT] - REQUEST NO.
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_04_inbox_request_no_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INBOX - [INPUT] - CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_04_inbox_cust_id_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INBOX - [INPUT] - CONTRACT NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_04_inbox_contract_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]


PAGE INBOX - [CLICK] - [BUTTON] - SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_04_inbox_search_locator}



# Verify Title Table - Page Inbox
PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    No


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[18]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[19]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SEND DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[20]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_req_type_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]

PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE 2
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_req_type2_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[21]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[22]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[23]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - TEAM
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[9]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REASON
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[14]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[24]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[25]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    ${group_data_label}[${keys_group_data_label}[26]]


PAGE INBOX - [VERIFY] - [TITLE][TABLE] - ACTION
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_04_inbox_format_locator}    Action



# Verify Value Table - Page Inbox
PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     1


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[19]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SEND DATE
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${current_date_from_local}
    # ${date_send_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[20]]]
    # Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${date_send_date}


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE
    ${result0}    GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 04]    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    0

PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE 2
    ${result1}    GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 04]    ${txt_value_table_req_type_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    1


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[21]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[22]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[23]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - TEAM
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[9]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REASON
    ${result0}    GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 04]    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[14]]]    0   


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[24]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value__appr_user_04_inbox_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[25]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_04_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[26]]]


PAGE INBOX - [VERIFY] - [VALUE][TABLE] - ACTION
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_action_04_inbox_format_locator}    Action



# Click link action in table
PAGE INBOX - [CLICK] - [TEXT] - ACTION
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_herf_table_action_04_inbox_locator}


# Verify Title - page approve negotiate
PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_req_type_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_04_approve_negotiate_req_no_locator}    ${group_data_label}[${keys_group_data_label}[5]]
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUESTER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_04_approve_negotiate_requester_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_04_approve_negotiate_req_date_locator}    ${group_data_label}[${keys_group_data_label}[7]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_approve_negotiate_cust_id_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT NO
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_04_approve_negotiate_cont_no_locator}    ${group_data_label}[${keys_group_data_label}[4]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_04_approve_negotiate_cust_name_locator}    ${group_data_label}[${keys_group_data_label}[8]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TEAM
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_04_approve_negotiate_team_locator}    ${group_data_label}[${keys_group_data_label}[9]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - OD STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_04_approve_negotiate_od_status_locator}    ${group_data_label}[${keys_group_data_label}[10]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - BUSINESS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_04_approve_negotiate_biz_locator}    ${group_data_label}[${keys_group_data_label}[3]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST TIMES
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_title_04_approve_negotiate_req_time_locator}    ${group_data_label}[${keys_group_data_label}[12]]




# Verify Value - page approve negotiate
PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST TYPE
    SeleniumLibrary.Unselect Frame
    SeleniumLibrary.Select Frame    ${ifrmae_req_waive_locator}
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_request_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST NO.
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_request_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]    value
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUESTER
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_requester_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST DATE
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_request_date_locator}     ${current_date_from_local}    value
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA DATE FROM EXCEL    ${txt_value_04_nsd_request_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[7]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER ID
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_cust_id_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT NO
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_contract_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER NAME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_cust_name_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[8]]]    value
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TEAM
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_team_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[9]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - OD STATUS
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_od_status2_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[10]]]    value


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - BUSINESS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_biz_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST TIMES
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_req_time_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[12]]]    value



### Negotiate Detail ###
# Verify title - page approve negotiate
PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_approve_negotiate_reason_locator}    ${group_data_label}[${keys_group_data_label}[14]]
    

PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_approve_negotiate_reason_note_locator}    ${group_data_label}[${keys_group_data_label}[15]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - SEND TO [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    # check ว่าเจอ element send to ไหม ? ถ้าเจอจะเลือก send to
    ${result}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_title_approve_negotiate_send_to_locator}
    IF    '${result}' == 'True'
        Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_approve_negotiate_send_to_locator}    ${group_data_label}[${keys_group_data_label}[16]]
    END


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REJECT REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_approve_negotiate_rej_reason_locator}    ${group_data_label}[${keys_group_data_label}[27]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REJECT NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_approve_negotiate_rej_note_locator}    ${group_data_label}[${keys_group_data_label}[28]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_approve_negotiate_note_locator}    ${group_data_label}[${keys_group_data_label}[17]]



# Verify value - page approve negotiate
PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING       ${select_04_nd_reason_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[14]]]


PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL       ${input_04_nd_reason_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[15]]]    value



# Input data - page approve negotiate
PAGE APPROVE NEGOTIATE - [DROPDOWN] - SEND TO
    # check ว่าเจอ element send to ไหม ? ถ้าเจอจะเลือก send to
    ${result}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_value_approve_negotiate_send_to_locator}
    IF    '${result}' == 'True'
        SeleniumLibrary.Select From List By Label   ${dropdown_value_approve_negotiate_send_to_locator}     ${user_send_to}
    END


PAGE APPROVE NEGOTIATE - [INPUT] - NOTE
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_04_nd_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[17]]]



### Keyword ###
# Split text - Request Type	[Inbox]
GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 04]
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

