*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# Set global
${index_user}
${index_password}
${index_start}
${index_end} 
${data_count_row}

*** Keywords ***

# Set global variable --> Start-case and End-case
SET GLOBAL VARIABLE START AND END [USER APPROVE]
    ${index_start}    BuiltIn.Set Variable    1
    BuiltIn.Set Global Variable    ${index_start}

    ${index_end}    BuiltIn.Set Variable    5
    BuiltIn.Set Global Variable    ${index_end}

# Login web and select workflow
PAGE REQUEST WAIVE - INPUT USENAME AND PASSWORD - [USER REQUEST]
    Common_keyword.SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]
    BuiltIn.Log    User Request: ${group_user}[${keys_group_user}[3]]    WARN


PAGE REQUEST WAIVE - INPUT USENAME AND PASSWORD - [USER APPROVE]
    Approve_negotiate_04_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[${index_user}]]    ${group_user}[${keys_group_user}[${index_password}]]
    BuiltIn.Log    User Approve: ${group_user}[${keys_group_user}[${index_user}]]    WARN


PAGE REQUEST WAIVE - INPUT USENAME AND PASSWORD - [USER APPROVE] - [NEW]
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        Approve_negotiate_04_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]       # 0 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        Approve_negotiate_04_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]       # 1 row,col -> 5,6 -> P2510033
        ${user_approve_now}    BuiltIn.Set Variable    ${group_user}[${keys_group_user}[5]]
        ${user_send_to}        BuiltIn.Set Variable    ${group_user}[${keys_group_user}[7]]
        BuiltIn.Set Global Variable    ${user_approve_now}
        BuiltIn.Set Global Variable    ${user_send_to}
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    30    In progress: ${user_approve_now}
    ELSE IF  '${user_level}' == '2'    # user approve user2
        Approve_negotiate_04_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]       # 2 row,col -> 7,8  -> P2503067
        ${user_approve_now}    BuiltIn.Set Variable    ${group_user}[${keys_group_user}[7]]
        ${user_send_to}        BuiltIn.Set Variable    ${group_user}[${keys_group_user}[9]]
        BuiltIn.Set Global Variable    ${user_approve_now}
        BuiltIn.Set Global Variable    ${user_send_to}
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    30    In progress: ${user_approve_now}
    ELSE IF  '${user_level}' == '3'    # user approve user3
        Approve_negotiate_04_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]      # 3 row,col -> 9,10 -> P2106010 
        ${user_approve_now}    BuiltIn.Set Variable    ${group_user}[${keys_group_user}[9]]
        ${user_send_to}        BuiltIn.Set Variable    ${group_user}[${keys_group_user}[11]]
        BuiltIn.Set Global Variable    ${user_approve_now}
        BuiltIn.Set Global Variable    ${user_send_to}
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    30    In progress: ${user_approve_now}
    ELSE IF  '${user_level}' == '4'    # user approve user4
        Approve_negotiate_04_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]     # 4 row,col -> 11,12 -> KIMURA
        ${user_approve_now}    BuiltIn.Set Variable    ${group_user}[${keys_group_user}[11]]
        ${user_sender}         BuiltIn.Set Variable    ${group_user}[${keys_group_user}[9]]
        BuiltIn.Set Global Variable    ${user_approve_now}
        BuiltIn.Set Global Variable    ${user_sender}
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    30    In progress: ${user_approve_now}
    END


PAGE REQUEST WAIVE - [CLICK] - LINK
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    PORTAL_PAGE
    ${link_system}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID       ${link_system}     ${group_user}[${keys_group_user}[2]]
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}


PAGE REQUEST WAIVE - [WAIT] - [VERIFY] - PAGE
    Common_keyword.WAITING FOR DATA UPDATE    5s


# Dropdown Request Waive
PAGE REQUEST WAIVE - [CLICK] - [MENU] - [WORK PROCESS]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_menu_dropdown_locator}


PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [REQUEST WAIVE]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_sub_menu_req_waive_dropdown_locator}


PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [INBOX]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_sub_menu_inbox_dropdown_locator}


PAGE REQUEST WAIVE - [CLICK] - [MENU] - [INQUIRY]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_menu_dropdown_inquiry_locator}

    
PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [INQUIRY REQUEST]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_sub_dropdown_inquiry_req_locator}



# Get data from excel
SET - FORMAT DATA - ALL DATA AND INPUT DATA [BACKUP]
    [Arguments]   ${row}

    ${result_excel_test}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]
    
        ${group_data}=    BuiltIn.Set Variable   ${result_excel_test}[0]         # แปลง data 
        BuiltIn.Set Global Variable    ${group_data}

            BuiltIn.Log    ${group_data}



# Get data from excel
SET - FORMAT DATA - ALL DATA AND INPUT DATA
    [Arguments]   ${row}

    # FOR    ${index}  IN RANGE    ${index_start}    ${index_end} 
    FOR    ${index_main}  IN RANGE    1    ${data_count_row}    # วนหา TC_X จน กว่าจะเจอ req no != none และ state != finished

        ${result_excel_test}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == 'TC_${index_main}')]
        
        ${group_data}    BuiltIn.Set Variable   ${result_excel_test}[0]
        BuiltIn.Set Global Variable    ${group_data}
        BuiltIn.Log    ${group_data}

        ${Request_No}    BuiltIn.Set Variable    ${group_data}[${keys_group_data_label}[5]]
        ${State}    BuiltIn.Set Variable    ${group_data}[${keys_group_data_label}[29]]

        ${rowForWrite}    BuiltIn.Evaluate    ${index_main} + 2    # +2 because add title at row 2 
        BuiltIn.Set Global Variable    ${rowForWrite}  
        # IF  '${Request_No}' != 'none' and '${State}' == 'none'
        #     BuiltIn.Exit For Loop
        # END
        
        IF  '${Request_No}' != 'none' and '${State}' != 'Finished'
            BuiltIn.Exit For Loop
        END

        IF  '${Request_No}' == 'none' and '${State}' == 'none'
            BuiltIn.Exit For Loop
        END

        # IF  '${Request_No}' == 'none' and '${State}' == 'Finished'
        #     BuiltIn.Exit For Loop
        # END
    END
            BuiltIn.Set Global Variable    ${index_main}
            BuiltIn.Log    Row for write --> ${rowForWrite} ,TC_${index_main}, Request No --> ${Request_No}    WARN

    

### 04 : Negotiation Special Discount (LG) ###
PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_req_waive_approve_locator}    15


# Select - 04 : Negotiation Special Discount (LG)
PAGE REQUEST WAIVE - [CLICK] - [DROPDOWN] - [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${ifrmae_req_waive_locator}    15
    SeleniumLibrary.Select Frame     ${ifrmae_req_waive_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_req_waive_select_req_type_locator}     ${group_user}[${keys_group_user}[1]]


# Request Waive - Step input id, business and contract no
PAGE REQUEST WAIVE - [INPUT] - ID CARD [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_req_waive_id_card_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]    150


PAGE REQUEST WAIVE - [INPUT] - CONTRACT NO [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_req_waive_contract_no_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]    15


PAGE REQUEST WAIVE - [DROPDOWN] - BUSINESS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_req_waive_biz_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_req_waive_biz_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]



# Input data form 04 : Negotiation Special Discount (LG)
PAGE REQUEST WAIVE - [INPUT] - WAIVE AMOUNT [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_04_nsd_qaive_amt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[13]]]


PAGE REQUEST WAIVE - [INPUT] - REASON [NEGOTIATE DETAIL] - [TYPE: 04]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_04_nd_reason_locator}
    SeleniumLibrary.Select From List By Label   ${select_04_nd_reason_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[14]]]


PAGE REQUEST WAIVE - [INPUT] - REASON NOTE [NEGOTIATE DETAIL] - [TYPE: 04]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_04_nd_reason_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[15]]]


PAGE REQUEST WAIVE - [INPUT] - SEND TO [NEGOTIATE DETAIL] - [TYPE: 04]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_04_nd_send_to_locator}
    SeleniumLibrary.Select From List By Label   ${select_04_nd_send_to_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[16]]]


PAGE REQUEST WAIVE - [INPUT] - NOTE [NEGOTIATE DETAIL] - [TYPE: 04]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_04_nd_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[17]]]


# Verify Herder
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - HERDER [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_header_04_header_locator}    Request    #${group_user}[${keys_group_user}[1]]


    
# Verify Title - 04 : Negotiation Special Discount (LG)
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TYPE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST NO. [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_req_no_locator}    ${group_data_label}[${keys_group_data_label}[5]]
    

PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER ID [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST DATE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_req_date_locator}    ${group_data_label}[${keys_group_data_label}[7]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER NAME [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[8]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUESTER [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - BUSINESS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[3]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TEAM [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[9]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT NO [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_cont_no_locator}    ${group_data_label}[${keys_group_data_label}[4]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OD STATUS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_od_status_locator}    ${group_data_label}[${keys_group_data_label}[10]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTAL W/O BALANCE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_total_wo_bal_locator}    ${group_data_label}[${keys_group_data_label}[11]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TIMES [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_req_time_locator}    ${group_data_label}[${keys_group_data_label}[12]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WAIVE AMOUNT [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_waive_amt_locator}    ${group_data_label}[${keys_group_data_label}[13]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[14]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON NOTE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_reason_note_locator}    ${group_data_label}[${keys_group_data_label}[15]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - SEND TO [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_send_to_locator}    ${group_data_label}[${keys_group_data_label}[16]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - NOTE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[17]]



# Verify Value - 04 : Negotiation Special Discount (LG)
PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TYPE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    SeleniumLibrary.Unselect Frame
    SeleniumLibrary.Select Frame    ${ifrmae_req_waive_locator}
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_request_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST NO. [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_request_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]

    
PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER ID [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_cust_id_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]    value
    

PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST DATE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_request_date_locator}     ${current_date_from_local}    value
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA DATE FROM EXCEL    ${txt_value_04_nsd_request_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[7]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER NAME [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_cust_name_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[8]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUESTER [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_requester_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - BUSINESS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_biz_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TEAM [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_team_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[9]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT NO [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_contract_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - OD STATUS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_od_status2_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[10]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TOTAL W/O BALANCE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_ttl_waive_wo_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[11]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TIMES [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_04_nsd_req_time_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[12]]]    value






    


# Do you want to Approve?
PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - OK
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_04_nsd_ok_locator}    15    # รอจนกว่าจะเจอ popup แล้ว capture 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    POPUP_APPROVE
    BuiltIn.Sleep    1s
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_04_nsd_ok_locator}    15


# Click Button back
PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - BACK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_04_back}    15
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    ERROR_MESSAGE


### INBOX ###
# Verify Title - 04 : Negotiation Special Discount (LG) [Inbox]
PAGE INBOX - [VERIFY] - [TITLE] - REQUEST TYPE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUESTER [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUEST NO. [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]


PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER ID [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER NO [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_04_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[4]]


# Write data team, req time, totol W/O
PAGE REQUEST WAIVE - GET AND WRITE DATA - PAGE REQUEST [TYPE: 04]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_04_nsd_team_locator}    150

    # Get data
    ${value_team}            SeleniumLibrary.Get Value     ${txt_value_04_nsd_team_locator}
    ${value_od_status}       SeleniumLibrary.Get Value     ${txt_value_04_nsd_od_status2_locator}
    ${value_ttl_waive_wo}    SeleniumLibrary.Get Value     ${txt_value_04_nsd_ttl_waive_wo_locator}
    ${value_req_times}       SeleniumLibrary.Get Value     ${txt_value_04_nsd_req_time_locator}
    ${value_req_amt}         BuiltIn.Evaluate              "{:,.2f}".format(${value_ttl_waive_wo})

    # If the data is empty change the data to be none
    ${value_team}            BuiltIn.Set Variable If      '${value_team}' == '${EMPTY}'              none        ${value_team}
    ${value_od_status}       BuiltIn.Set Variable If      '${value_od_status}' == '${EMPTY}'         none        ${value_od_status}
    ${value_ttl_waive_wo}    BuiltIn.Set Variable If      '${value_ttl_waive_wo}' == '${EMPTY}'      none        ${value_ttl_waive_wo}
    ${value_req_times}      BuiltIn.Set Variable If      '${value_req_times}' == '${EMPTY}'          none        ${value_req_times}
    ${value_req_amt}        BuiltIn.Set Variable If      '${value_req_amt}' == '${EMPTY}'            none        ${value_req_amt}

    BuiltIn.Log    Team: ${value_team}                         WARN
    BuiltIn.Log    OD Status: ${value_od_status}               WARN
    BuiltIn.Log    Total W/O Balance: ${value_ttl_waive_wo}    WARN
    BuiltIn.Log    Request Times: ${value_req_times}           WARN
    BuiltIn.Log    Request Amount: ${value_req_amt}            WARN

    # Write data if get text not equal none
    IF    '${value_ttl_waive_wo}' != 'none'
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    10    ${value_team}            # Team
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    11    ${value_od_status}       # OD Status
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    12    ${value_ttl_waive_wo}    # Total W/O Balance
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    13    ${value_req_times}       # Request Times
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    14    ${value_ttl_waive_wo}    # Waive Amount
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    25    ${value_req_amt}         # Request Amt
    ELSE
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    30    Api Response error
    END

    # Read data excel ใหม่เพราะมีการ write data มา
    Request_waive_04_feature.SET - FORMAT DATA - ALL DATA AND INPUT DATA
    ...    excel_name=DATAFILE_WORKFLOW_TYPE_04     
    ...    sheet_name=04_SD_WO
    ...    row=TC_${index_start}    # ${group_data}