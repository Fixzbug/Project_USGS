*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# Set Global
${inquiryStatusFinished}
${user_sender}
${user_approve_now}

*** Keywords ***
# Verify Title - Page Inquiry
PAGE INQUIRY - [VERIFY] - [TITLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]        # Request Type


PAGE INQUIRY - [VERIFY] - [TITLE] - REQUESTER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE INQUIRY - [VERIFY] - [TITLE] - REQUEST NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]


PAGE INQUIRY - [VERIFY] - [TITLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_10_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]



# Input Data - Inquiry
PAGE INQUIRY - [INPUT] - REQUEST TYPE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_10_inbox_req_type_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_10_inbox_req_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE INQUIRY - [INPUT] - REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_10_inbox_requester_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]


PAGE INQUIRY - [INPUT] - REQUEST NO.
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_10_inbox_request_no_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INQUIRY - [INPUT] - CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_10_inbox_cust_id_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INQUIRY - [INPUT] - CONTRACT NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_10_inbox_contract_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]


PAGE INQUIRY - [CLICK] - [BUTTON] - SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_10_inbox_search_locator}



# Verify Title Table - Page Inquiry
PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[83]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[84]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - SEND DATE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[85]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST DESC.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    Request Desc.


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[86]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[87]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - BIZ
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    Biz


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[88]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - TEAM
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[11]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REASON
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[79]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[89]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[90]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    ${group_data_label}[${keys_group_data_label}[91]]


PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - VIEW
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_table_10_inquiry_format_locator}    View



# Verify Value Table - Page Inquiry
PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQ NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}      ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - SENDER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_sender_inquiry_locator}     ${user_sender}    # P2106010


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - SEND DATE
    ${current_date_from_local}    Common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${current_date_from_local}
    # ${date_send_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${group_data_label}[${keys_group_data_label}[85]]]
    # Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${date_send_date}


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE
    ${result0}    Approve_negotiate_10_page.GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 10]    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    0

PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST DESC.
    ${result1}    Approve_negotiate_10_page.GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 10]    ${txt_value_table_req_type_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]    1


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - CUSTOMER ID
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - CONTRACT NO.
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[86]]]
    # ${cont_no}         BuiltIn.Set Variable    ${group_data}[${group_data_label}[${keys_group_data_label}[4]]] 
    # ${part1}           BuiltIn.Set Variable    ${cont_no[0:4]}
    # ${part2}           BuiltIn.Set Variable    ${cont_no[4:7]}
    # ${part3}           BuiltIn.Set Variable    ${cont_no[7:]}
    # ${cont_no_dash}    BuiltIn.Catenate        SEPARATOR=-    ${part1}    ${part2}    ${part3}


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - NAME
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[87]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - BIZ
    ${parts_biz}                Split String    ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]    :
    ${parts_biz_only_left}      Strip String    ${parts_biz}[0]    # RL
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${parts_biz_only_left}


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST BY
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[88]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - TEAM
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[11]]]

PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REASON
    ${result0}    Approve_negotiate_10_page.GET AND SPLIT TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE - [TYPE: 10]    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[79]]]    0   


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST AMT
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[89]]]


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - APPROVE USER
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_appr_user_10_inbox_locator}     ${user_approve_now}    # KIMURA


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - STATUS
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_10_inbox_format_locator}     ${inquiryStatusFinished}    # Finished


PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - VIEW
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_value_table_action_10_inbox_format_locator}    View



# Click link view in table
PAGE INQUIRY - [CLICK] - [TEXT] - VIEW
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${txt_herf_table_view_10_inbox_locator}



# Get text and write status
PAGE INQUIRY - WRITE DATA - STATUS FINISHED
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_table_10_inq_status_finish_locator}    180
    ${inquiryStatusFinished}    SeleniumLibrary.Get Text    ${txt_value_table_10_inq_status_finish_locator}
    BuiltIn.Set Global Variable    ${inquiryStatusFinished}
    # BuiltIn.Log To Console    \nStatus: ${inquiryStatusFinished}\n
    Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    96    ${inquiryStatusFinished}