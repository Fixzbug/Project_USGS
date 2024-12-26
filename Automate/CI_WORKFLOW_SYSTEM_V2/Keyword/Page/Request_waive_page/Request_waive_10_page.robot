*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# Set global
${index_user}
${index_password}
${index_start}
${index_end} 

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
    Approve_negotiate_10_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[${index_user}]]    ${group_user}[${keys_group_user}[${index_password}]]
    BuiltIn.Log    User Approve: ${group_user}[${keys_group_user}[${index_user}]]    WARN


PAGE REQUEST WAIVE - INPUT USENAME AND PASSWORD - [USER APPROVE] - [NEW]
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        Approve_negotiate_10_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]       # 0 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        Approve_negotiate_10_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]       # 1 row,col -> 5,6 -> P2510033
        ${user_approve_now}    BuiltIn.Set Variable    ${group_user}[${keys_group_user}[5]]
        ${user_send_to}        BuiltIn.Set Variable    ${group_user}[${keys_group_user}[7]]
        BuiltIn.Set Global Variable    ${user_approve_now}
        BuiltIn.Set Global Variable    ${user_send_to}
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    96    In progress: ${user_approve_now}
    ELSE IF  '${user_level}' == '2'    # user approve user2
        Approve_negotiate_10_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]       # 2 row,col -> 7,8  -> P2503067
        ${user_approve_now}    BuiltIn.Set Variable    ${group_user}[${keys_group_user}[7]]user_sender
        ${user_send_to}        BuiltIn.Set Variable    ${group_user}[${keys_group_user}[9]]
        BuiltIn.Set Global Variable    ${user_approve_now}
        BuiltIn.Set Global Variable    ${user_send_to}
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    96    In progress: ${user_approve_now}
    ELSE IF  '${user_level}' == '3'    # user approve user3
        Approve_negotiate_10_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]      # 3 row,col -> 9,10 -> P2106010 
        ${user_approve_now}    BuiltIn.Set Variable    ${group_user}[${keys_group_user}[9]]
        ${user_send_to}        BuiltIn.Set Variable    ${group_user}[${keys_group_user}[11]]
        BuiltIn.Set Global Variable    ${user_approve_now}
        BuiltIn.Set Global Variable    ${user_send_to}
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    96    In progress: ${user_approve_now}
    ELSE IF  '${user_level}' == '4'    # user approve user4
        Approve_negotiate_10_page.SETTING LOGIN - USER APPROVE    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]     # 4 row,col -> 11,12 -> KIMURA
        ${user_approve_now}    BuiltIn.Set Variable    ${group_user}[${keys_group_user}[11]]
        ${user_sender}         BuiltIn.Set Variable    ${group_user}[${keys_group_user}[9]]
        BuiltIn.Set Global Variable    ${user_approve_now}
        BuiltIn.Set Global Variable    ${user_sender}
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    96    In progress: ${user_approve_now}
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
    FOR    ${index_main}  IN RANGE    1    999    # วนหา TC_X จน กว่าจะเจอ req no != none และ state != finished

        ${result_excel_test}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == 'TC_${index_main}')]
        
        ${group_data}    BuiltIn.Set Variable   ${result_excel_test}[0]
        BuiltIn.Set Global Variable    ${group_data}
        BuiltIn.Log    ${group_data}

        ${Request_No}    BuiltIn.Set Variable    ${group_data}[${keys_group_data_label}[5]]
        ${State}    BuiltIn.Set Variable    ${group_data}[${keys_group_data_label}[95]]

        ${rowForWrite}    BuiltIn.Evaluate    ${index_main} + 2    # +2 because add title at row 2 
        BuiltIn.Set Global Variable    ${rowForWrite}  
        # IF  '${Request_No}' != 'none' and '${State}' == 'none'
        #     BuiltIn.Exit For LoopIn.Exit For Loop
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
    

### 10 : Negotiation Special discount (Nor-OD) ###
PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_req_waive_approve_locator}    60


# Select - 10 : Negotiation Special discount (Nor-OD)
PAGE REQUEST WAIVE - [CLICK] - [DROPDOWN] - [10 : Negotiation Special discount (Nor-OD)]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${ifrmae_req_waive_locator}    150
    SeleniumLibrary.Select Frame     ${ifrmae_req_waive_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_req_waive_select_req_type_locator}     ${group_user}[${keys_group_user}[1]]


# Request Waive - Step input id, business and contract no
PAGE REQUEST WAIVE - [INPUT] - ID CARD [10 : Negotiation Special discount (Nor-OD)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_req_waive_id_card_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]    30


PAGE REQUEST WAIVE - [INPUT] - CONTRACT NO [10 : Negotiation Special discount (Nor-OD)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_req_waive_contract_no_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]    15


PAGE REQUEST WAIVE - [DROPDOWN] - BUSINESS [10 : Negotiation Special discount (Nor-OD)]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_req_waive_biz_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_req_waive_biz_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]



# Input data form 10 : Negotiation Special discount (Nor-OD)
PAGE REQUEST WAIVE - [INPUT] - NUMBER OF CHILD [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nsd_num_of_child_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[12]]]


PAGE REQUEST WAIVE - [INPUT] - LAST SALARY [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nsd_last_salary_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[15]]]


PAGE REQUEST WAIVE - [CLICK] - [DROPDOWN] - CUSTOMER STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_10_nsd_cust_status_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_10_nsd_cust_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[17]]]



# Verify Herder
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - HERDER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_header_10_header_locator}    ${group_user}[${keys_group_user}[1]]


    
# Verify Title - 10 : Negotiation Special discount (Nor-OD)
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TYPE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST NO. [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]
    

PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUESTER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[7]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER ID [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER NO [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[4]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER NAME [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[8]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CALL CENTER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[9]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - AGE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[10]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TEAM [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[11]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - NUMBER OF CHILD [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[12]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OD STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[14]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST SALARY [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[15]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT TYPE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[16]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[17]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[18]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - BUSINESS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[3]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WO DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[19]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[20]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TIME OF PAYMENT [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[21]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DUE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[22]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TIMES OF PENALTY [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[23]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TIMES [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[24]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST REQUEST NO [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[25]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - MINIMUM/INSTALL: [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[26]]



# Verify Value - 10 : Negotiation Special discount (Nor-OD)
PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TYPE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    SeleniumLibrary.Unselect Frame
    SeleniumLibrary.Select Frame    ${ifrmae_req_waive_locator}
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_request_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST NO. [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_request_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]
    

PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUESTER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_requester_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_request_date_locator}     ${current_date_from_local}    value
    # Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA DATE FROM EXCEL    ${txt_value_10_nsd_request_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[7]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER ID [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_cust_id_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT NO [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_contract_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER NAME [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_cust_name_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[8]]]    value
    

PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CALL CENTER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_call_center_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[9]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - AGE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_age_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[10]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TEAM [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_team_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[11]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - OD STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_od_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[14]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT TYPE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_contract_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[16]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_contract_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[18]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - BUSINESS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_biz_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - WO DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_wo_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[19]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_contract_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[20]]]
    # Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING    ${txt_value_10_nsd_contract_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[20]]]


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TIME OF PAYMENT [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_time_of_payment_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[21]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - DUE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_due_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[22]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TIMES OF PENALTY [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_time_of_penalty_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[23]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TIMES [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_req_time_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[24]]]    value


# PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - LAST REQUEST NO [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - MINIMUM/INSTALL: [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_10_nsd_min_install_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[26]]]    value



### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[27]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[28]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[29]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[30]]



# Input Data - Negotiate Detail - 1. Entry negotiate discount detail
PAGE REQUEST WAIVE - [INPUT] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_totals_term_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[27]]]


PAGE REQUEST WAIVE - [INPUT] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_totals_paid_amt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[28]]]


PAGE REQUEST WAIVE - [DROPDOWN] - FIRST DUE DATE INDEX 2 [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    SeleniumLibrary.Click Element    ${dropdown_10_nd_f_due_date_locator}
    SeleniumLibrary.Click Element    ${dropdown_10_nd_f_due_date_index2_locator}
    SeleniumLibrary.Click Element    ${dropdown_10_nd_f_due_date_locator}


PAGE REQUEST WAIVE - [INPUT] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    SeleniumLibrary.Execute JavaScript    document.getElementById('${input_10_nd_js_start_cal_date_id}').value='${current_date_from_local}';
    # ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[30]]]
    # SeleniumLibrary.Execute JavaScript    document.getElementById('${input_10_nd_js_start_cal_date_id}').value='${date_start_cal_date}';


PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - SUBMIT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_10_nd_submit_locator}    15


# Get Text [Value] - OD Screen [1.1 Payment History]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LOAN AMT OF CUSTOMER [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_loan_amt_cust_locator}    120
    ${loan_amt_cust}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_loan_amt_cust_locator}    value 
    BuiltIn.Log To Console    \n
    BuiltIn.Log To Console    1.1 Payment History
    BuiltIn.Log To Console    Loan Amt of Customer: ${loan_amt_cust}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LOAN AMT OF NEW CONTRACT [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_loan_amt_new_cont_locator}    30
    ${loan_amt_cust}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_loan_amt_new_cont_locator}    value 
    BuiltIn.Log To Console    Loan Amt Of New Contract: ${loan_amt_cust}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - CONTRACT AMOUNT [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_cont_amt_locator}    30
    ${cont_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_cont_amt_locator}    value 
    BuiltIn.Log To Console    Contract Amount: ${cont_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - PAID TERM [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_paid_term_locator}    30
    ${paid_term}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_paid_term_locator}    value 
    BuiltIn.Log To Console    Paid Term: ${paid_term}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTAL PAID AMT (OLD CONTRACT) [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_total_paid_amt_old_locator}    30
    ${total_paid_amt_old}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_total_paid_amt_old_locator}    value 
    BuiltIn.Log To Console    Total Paid Amt (Old Contract): ${total_paid_amt_old}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTAL PAID AMT (NEW CONTRACT) [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_total_paid_amt_new_locator}    30
    ${total_paid_amt_new}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_total_paid_amt_new_locator}    value 
    BuiltIn.Log To Console    Total Paid Amt (New Contract): ${total_paid_amt_new}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OS (AS OF CLOSING DATE) [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_os_closing_data_locator}    30
    ${closing_data}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_os_closing_data_locator}    value 
    BuiltIn.Log To Console    Os (As Of Closing Date): ${closing_data}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD AMOUNT [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_os_amt_locator}    30
    ${os_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_os_amt_locator}    value 
    BuiltIn.Log To Console    Od Amount: ${os_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - PENALTY AMOUNT [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_penaly_amt_locator}    30
    ${penaly_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_penaly_amt_locator}    value 
    BuiltIn.Log To Console    Penalty Amount: ${penaly_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - CLOSING (SYD) [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_closing_syd_locator}    30
    ${closing_syd}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_closing_syd_locator}    value 
    BuiltIn.Log To Console    Closing (SYD): ${closing_syd}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - WO AMOUNT [OD SCREEN] - [1.1 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_wo_amt_locator}    30
    ${wo_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_wo_amt_locator}    value 
    BuiltIn.Log To Console    Wo Amount: ${wo_amt}



# Get Text [Value] - OD Screen [1.2 Discount Detail]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - CUSTOMER WILL PAY [OD SCREEN] - [1.2 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_cust_will_pay_locator}    30
    ${cust_will_pay}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_cust_will_pay_locator}    value 
    BuiltIn.Log To Console    \n
    BuiltIn.Log To Console    1.2 Discount Detail
    BuiltIn.Log To Console    Customer Will Pay: ${cust_will_pay}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM CLOSING AMOUNT [OD SCREEN] - [1.2 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_diff_closing_amt_locator}    30
    ${diff_closing_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_diff_closing_amt_locator}    value 
    BuiltIn.Log To Console    Customer Will Pay Amount: ${diff_closing_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM CLOSING PERCENT [OD SCREEN] - [1.2 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_diff_closing_per_locator}    30
    ${diff_closing_per}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_diff_closing_per_locator}    value 
    BuiltIn.Log To Console    Customer Will Pay Percent: ${diff_closing_per}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM WO (OD) AMOUNT [OD SCREEN] - [1.2 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_diff_wo_od_amt_locator}    30
    ${wo_od_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_diff_wo_od_amt_locator}    value 
    BuiltIn.Log To Console    Diff. From Wo (OD) Amount: ${wo_od_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM WO (OD) PERCENT [OD SCREEN] - [1.2 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_diff_wo_od_per_locator}    30
    ${wo_od_per}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_diff_wo_od_per_locator}    value 
    BuiltIn.Log To Console    Diff. From Wo (OD) Percent: ${wo_od_per}



# Get Text [Value] - OD Screen [1.3 Profit detail (Auto cal.)]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTAL RECEIVED [OD SCREEN] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_total_received_locator}    30
    ${total_received}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_total_received_locator}    value 
    BuiltIn.Log To Console    \n
    BuiltIn.Log To Console    1.3 Profit detail (Auto cal.)  
    BuiltIn.Log To Console    Total Received: ${total_received}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF FROM LOAN AMOUNT [OD SCREEN] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_diff_loan_amt_locator}    30
    ${diff_loan_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_diff_loan_amt_locator}    value 
    BuiltIn.Log To Console    Diff From Loan Amount: ${diff_loan_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF FROM OS [OD SCREEN] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_diff_os_locator}    30
    ${diff_os}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_diff_os_locator}    value 
    BuiltIn.Log To Console    Diff From OS: ${diff_os}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF FROM WO [OD SCREEN] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_odscreen_ph_diff_wo_locator}    30
    ${diff_wo}    SeleniumLibrary.Get Element Attribute    ${txt_value_odscreen_ph_diff_wo_locator}    value 
    BuiltIn.Log To Console    Diff From WO: ${diff_wo}



# Verify Title - 1.1 Payment History
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LOAN AMT OF CUSTOMER [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[31]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LOAN AMT OF NEW CONTRACT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[32]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT AMOUNT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[33]]
    

PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PAID TERM [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[34]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTAL PAID AMT (OLD CONTRACT) [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[35]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTAL PAID AMT (NEW CONTRACT) [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[36]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OS (AS OF CLOSING DATE) [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[37]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OD AMOUNT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[38]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PENALTY AMOUNT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[39]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CLOSING (SYD) [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[40]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WO AMOUNT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[41]]



# Verify Title - 1.2 Discount Detail
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER WILL PAY [NEGOTIATE DETAIL] - [1.2 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[42]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM CLOSING [NEGOTIATE DETAIL] - [1.2 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[43]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM WO (OD) [NEGOTIATE DETAIL] - [1.2 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[45]]



# Verify Title - 1.3 Profit detail (Auto cal.) 
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTAL RECEIVED [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[47]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF FROM LOAN AMOUNT [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[48]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF FROM OS [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[49]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF FROM WO [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_1_1_format_locator}    ${group_data_label}[${keys_group_data_label}[50]]



# Verify Title - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[51]]
    

PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[53]]
    

PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[54]]



# Input Data - Negotiate Detail - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - [INPUT] - TERM# START - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_start_term_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[51]]]


PAGE REQUEST WAIVE - [INPUT] - TERM# END - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_end_term_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[52]]]


PAGE REQUEST WAIVE - [INPUT] - PAID DATE - [2. ENTRY DETAIL BY TERM#, TIME#]
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    SeleniumLibrary.Execute JavaScript    document.getElementById('${input_10_nd_js_paid_date_id}').value='${current_date_from_local}';
    # ${date_paid_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[53]]]
    # SeleniumLibrary.Execute JavaScript    document.getElementById('${input_10_nd_js_paid_date_id}').value='${date_paid_date}';

    
PAGE REQUEST WAIVE - [INPUT] - PAID AMOUNT - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_paid_amt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[54]]]


PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - ADD [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_10_nd_2_add_locator}    15



# Verify Title Table - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[55]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[56]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - MIN DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[57]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - MAX DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[58]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - TIME# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[59]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[60]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[61]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[62]]



# Verify Value Table - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - [VERIFY] - [VALUE][TABLE] - TOTAL TERM [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nd_2_total_team_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[63]]]

PAGE REQUEST WAIVE - [VERIFY] - [VALUE][TABLE] - TOTAL PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nd_2_total_paid_amount_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[64]]]



# Verify Title - 3.1 Entry other debt
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[65]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[66]]



# Input Data - Negotiate Detail - 3.1 Entry other debt
PAGE REQUEST WAIVE - [INPUT] - OTHER DEBT - [3.1 ENTRY OTHER DEBT]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_other_debt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[65]]]


PAGE REQUEST WAIVE - [INPUT] - AMOUNT - [3.1 ENTRY OTHER DEBT]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_amt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[66]]]


PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - ADD [3.1 ENTRY OTHER DEBT]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_10_nd_3_1_add_locator}    15



# Verify Title Table - 3.1 Entry other debt
PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[67]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[68]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[69]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[70]]



# Verify Value Table - 3.1 Entry other debt
PAGE REQUEST WAIVE - [VERIFY] - [VALUE][TABLE] - TOTAL AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_10_nd_3_1_total_amount_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[71]]]



# Verify Title - 3.2 Entry other ...
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[72]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[73]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[74]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[75]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[76]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[77]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[78]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[79]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[80]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - SEND TO [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[81]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[82]]



# Input Data - Negotiate Detail - 3.2 Entry other ...
PAGE REQUEST WAIVE - [INPUT] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    SeleniumLibrary.Execute JavaScript    document.getElementById('${input_10_nd_js_last_cont_3_party_id}').value='${current_date_from_local}';
    # ${date_last_cont_3_party}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[72]]]
    # SeleniumLibrary.Execute JavaScript    document.getElementById('${input_10_nd_js_last_cont_3_party_id}').value='${date_last_cont_3_party}';


PAGE REQUEST WAIVE - [INPUT] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    SeleniumLibrary.Execute JavaScript    document.getElementById('${input_10_nd_js_last_cont_cust_id}').value='${current_date_from_local}';
    # ${date_last_cont_cust}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[73]]]
    # SeleniumLibrary.Execute JavaScript    document.getElementById('${input_10_nd_js_last_cont_cust_id}').value='${date_last_cont_cust}';


PAGE REQUEST WAIVE - [INPUT] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    IF   "${group_data}[${group_data_label}[${keys_group_data_label}[74]]]" == "Yes"
        CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${input_10_nd_have_job_yes_locator}
    ELSE IF    "${group_data}[${group_data_label}[${keys_group_data_label}[74]]]" == "No"
        CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${input_10_nd_have_job_no_locator}
    ELSE
        BuiltIn.Log    Please input field Have job in excel as "Yes" or "No" only.
    END


PAGE REQUEST WAIVE - [INPUT] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_10_nd_who_req_locator}
    SeleniumLibrary.Select From List By Label   ${select_10_nd_who_req_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[75]]]


PAGE REQUEST WAIVE - [INPUT] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_10_nd_discount_camp_locator}
    SeleniumLibrary.Select From List By Label   ${select_10_nd_discount_camp_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[76]]]


PAGE REQUEST WAIVE - [INPUT] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_10_nd_who_paid_locator}
    SeleniumLibrary.Select From List By Label   ${select_10_nd_who_paid_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[77]]]


PAGE REQUEST WAIVE - [INPUT] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_10_nd_source_fund__locator}
    SeleniumLibrary.Select From List By Label   ${select_10_nd_source_fund__locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[78]]]


PAGE REQUEST WAIVE - [INPUT] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_10_nd_reason_locator}
    SeleniumLibrary.Select From List By Label   ${select_10_nd_reason_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[79]]]


PAGE REQUEST WAIVE - [INPUT] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_reason_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[80]]]


PAGE REQUEST WAIVE - [INPUT] - SEND TO [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_10_nd_send_to_locator}
    SeleniumLibrary.Select From List By Label   ${select_10_nd_send_to_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[81]]]    # ${group_user}[${keys_group_user}[5]]
    

PAGE REQUEST WAIVE - [INPUT] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_10_nd_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[82]]]



# Do you want to Approve?
PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - OK
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_10_nsd_ok_locator}    15    # รอจนกว่าจะเจอ popup แล้ว capture 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    POPUP_APPROVE
    BuiltIn.Sleep    1s
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_10_nsd_ok_locator}    15


# Click Button back
PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - BACK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_10_back}    15
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    ERROR_MESSAGE



### INBOX ###
# Verify Title - 10 : Negotiation Special discount (Nor-OD) [Inbox]
PAGE INBOX - [VERIFY] - [TITLE] - REQUEST TYPE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUESTER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUEST NO. [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]


PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER ID [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER NO [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[4]]


# Write data cc, age, team, cont type, cont date, wo date, cont status,  due, time penalty, req time, last req no, min install
PAGE REQUEST WAIVE - GET AND WRITE DATA - PAGE REQUEST [TYPE: 10]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_08_nsd_call_center_locator}    150

    # Get data
    ${value_call_center}        SeleniumLibrary.Get Value     ${txt_value_10_nsd_call_center_locator}
    ${value_age}                SeleniumLibrary.Get Value     ${txt_value_10_nsd_age_locator}
    ${value_team}               SeleniumLibrary.Get Value     ${txt_value_10_nsd_team_locator}
    ${value_od_status}          SeleniumLibrary.Get Value     ${txt_value_10_nsd_od_status_locator}
    ${value_contract_type}      SeleniumLibrary.Get Value     ${txt_value_10_nsd_contract_type_locator}
    ${value_contract_date}      SeleniumLibrary.Get Value     ${txt_value_10_nsd_contract_date_locator}
    ${value_wo_date}            SeleniumLibrary.Get Value     ${txt_value_10_nsd_wo_date_locator}
    ${value_contract_status}    SeleniumLibrary.Get Text      ${txt_value_10_nsd_contract_status_locator}
    ${value_time_of_payment}    SeleniumLibrary.Get Value     ${txt_value_10_nsd_time_of_payment_locator}
    ${value_due}                SeleniumLibrary.Get Value     ${txt_value_10_nsd_due_locator}
    ${value_time_of_penalty}    SeleniumLibrary.Get Value     ${txt_value_10_nsd_time_of_penalty_locator}
    ${value_req_time}           SeleniumLibrary.Get Value     ${txt_value_10_nsd_req_time_locator}
    ${value_last_req_no}        SeleniumLibrary.Get Text      ${txt_value_10_nsd_last_req_no_locator}
    ${value_min_install}        SeleniumLibrary.Get Value     ${txt_value_10_nsd_min_install_locator}


    # If the data is empty change the data to be none
    ${value_call_center}            BuiltIn.Set Variable If      '${value_call_center}' == '${EMPTY}'              none        ${value_call_center}
    ${value_age}                    BuiltIn.Set Variable If      '${value_age}' == '${EMPTY}'                      none        ${value_age}
    ${value_team}                   BuiltIn.Set Variable If      '${value_team}' == '${EMPTY}'                     none        ${value_team}
    ${value_od_status}              BuiltIn.Set Variable If      '${value_od_status}' == '${EMPTY}'                none        ${value_od_status}
    ${value_contract_type}          BuiltIn.Set Variable If      '${value_contract_type}' == '${EMPTY}'            none        ${value_contract_type}
    ${value_contract_date}          BuiltIn.Set Variable If      '${value_contract_date}' == '${EMPTY}'            none        ${value_contract_date}
    ${value_wo_date}                BuiltIn.Set Variable If      '${value_wo_date}' == '${EMPTY}'                  none        ${value_wo_date}
    ${value_contract_status}        BuiltIn.Set Variable If      '${value_contract_status}' == '${EMPTY}'          none        ${value_contract_status}
    ${value_time_of_payment}        BuiltIn.Set Variable If      '${value_time_of_payment}' == '${EMPTY}'          none        ${value_time_of_payment}
    ${value_due}                    BuiltIn.Set Variable If      '${value_due}' == '${EMPTY}'                      none        ${value_due}
    ${value_time_of_penalty}        BuiltIn.Set Variable If      '${value_time_of_penalty}' == '${EMPTY}'          none        ${value_time_of_penalty}
    ${value_req_time}               BuiltIn.Set Variable If      '${value_req_time}' == '${EMPTY}'                 none        ${value_req_time}
    ${value_last_req_no}            BuiltIn.Set Variable If      '${value_last_req_no}' == '${EMPTY}'              none        ${value_last_req_no}
    ${value_min_install}            BuiltIn.Set Variable If      '${value_min_install}' == '${EMPTY}'              none        ${value_min_install}
 

    BuiltIn.Log    Call Center: ${value_call_center}             WARN
    BuiltIn.Log    Age: ${value_age}                             WARN
    BuiltIn.Log    Team: ${value_team}                           WARN
    BuiltIn.Log    OD Status: ${value_od_status}                 WARN
    BuiltIn.Log    Contract Type: ${value_contract_type}         WARN
    BuiltIn.Log    Contract Date: ${value_contract_date}         WARN
    BuiltIn.Log    WO Date: ${value_wo_date}                     WARN
    BuiltIn.Log    Contract Status: ${value_contract_status}     WARN
    BuiltIn.Log    Time of payment: ${value_time_of_payment}     WARN
    BuiltIn.Log    Due: ${value_due}                             WARN
    BuiltIn.Log    Times of penalty: ${value_time_of_penalty}    WARN
    BuiltIn.Log    Request times: ${value_req_time}              WARN
    BuiltIn.Log    Last request No: ${value_last_req_no}         WARN
    BuiltIn.Log    Minimum/Install: ${value_min_install}         WARN


    # Write data if get text not equal none
    IF    '${value_call_center}' != 'none'
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    10    ${value_call_center}            # Call Center
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    11    ${value_age}                    # Age
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    12    ${value_team}                   # Team
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    15    ${value_od_status}              # OD Status
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    17    ${value_contract_type}          # Contract Type
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    19    ${value_contract_date}          # Contract Date
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    20    ${value_wo_date}                # WO Date
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    21    ${value_contract_status}        # Contract Status
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    22    ${value_time_of_payment}        # Time of payment
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    23    ${value_due}                    # Due
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    24    ${value_time_of_penalty}        # Times of penalty
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    25    ${value_req_time}               # Request times
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    26    ${value_last_req_no}            # Last request No
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    27    ${value_min_install}            # Minimum/Install
    ELSE
        Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    96    Api Response error
    END

    # Read data excel ใหม่เพราะมีการ write data มา
    Request_waive_10_feature.SET - FORMAT DATA - ALL DATA AND INPUT DATA
    ...    excel_name=DATAFILE_WORKFLOW_TYPE_10
    ...    sheet_name=10_Nego_RF
    ...    row=TC_${index_start}    # ${group_data}