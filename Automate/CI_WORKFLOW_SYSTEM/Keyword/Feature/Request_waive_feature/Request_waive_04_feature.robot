*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# Set global
${index_main}

*** Keywords ***

# Login web and select workflow user request
SET FEATURE - GO TO - PAGE REQUEST WAIVE - [USER REQUEST]
    Request_waive_04_page.PAGE REQUEST WAIVE - INPUT USENAME AND PASSWORD - [USER REQUEST]
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - LINK
    Request_waive_04_page.PAGE REQUEST WAIVE - [WAIT] - [VERIFY] - PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WAIVE_SYSTEM_HOME_PAGE


# Login web and select workflow user approve
SET FEATURE - GO TO - PAGE REQUEST WAIVE - [USER APPROVE]
    [Arguments]    ${user_level}
    Request_waive_04_page.PAGE REQUEST WAIVE - INPUT USENAME AND PASSWORD - [USER APPROVE] - [NEW]    ${user_level}
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - LINK
    Request_waive_04_page.PAGE REQUEST WAIVE - [WAIT] - [VERIFY] - PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WAIVE_SYSTEM_HOME_PAGE


# dropdown Work flow --> Request Waive
SET FEATURE - SELECT MENU - PAGE REQUEST WAIVE
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [MENU] - [WORK PROCESS] 
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [REQUEST WAIVE]


# dropdown Inquiry --> Inquiry Request 
SET FEATURE - SELECT MENU - PAGE INQUIRY
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [MENU] - [INQUIRY] 
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [INQUIRY REQUEST]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INQUIRY
    

# dropdown Inbox
SET FEATURE - SELECT MENU - PAGE INBOX
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [MENU] - [WORK PROCESS] 
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [INBOX]


# Get data from excel
SET - FORMAT DATA - ALL DATA AND INPUT DATA
    [Arguments]    ${excel_name}    ${sheet_name}    ${row}

    GET - DATA FROM EXCEL    excel_name=${excel_name}    sheet_name=${sheet_name}
        Request_waive_04_page.SET - FORMAT DATA - ALL DATA AND INPUT DATA   row=${row}
        # Request_waive_04_page.SET - FORMAT DATA - ALL DATA AND INPUT DATA [BACKUP]   row=${row}


### 04 : Negotiation Special Discount (LG) ###
# Select - 04 : Negotiation Special Discount (LG)
SET FEATURE - SELECT REQUEST TYPE - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [DROPDOWN] - [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST_TYPE
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE


# Request Waive - Step input id, business and contract no
SET FEATURE - INPUT REQUEST - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [INPUT] - ID CARD [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [INPUT] - CONTRACT NO [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [DROPDOWN] - BUSINESS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST
    Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE


# Input Data - 04 : Negotiation Special Discount (LG)
SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [INPUT] - WAIVE AMOUNT [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [INPUT] - REASON [NEGOTIATE DETAIL] - [TYPE: 04]
    Request_waive_04_page.PAGE REQUEST WAIVE - [INPUT] - REASON NOTE [NEGOTIATE DETAIL] - [TYPE: 04]
    Request_waive_04_page.PAGE REQUEST WAIVE - [INPUT] - SEND TO [NEGOTIATE DETAIL] - [TYPE: 04]
    Request_waive_04_page.PAGE REQUEST WAIVE - [INPUT] - NOTE [NEGOTIATE DETAIL] - [TYPE: 04]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    04_SPECIAL_DISE.W/O


# Verify Title - 04 : Negotiation Special Discount (LG)
VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - HERDER [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # Fix
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TYPE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST NO. [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER ID [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST DATE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER NAME [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUESTER [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - BUSINESS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TEAM [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT NO [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OD STATUS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTAL W/O BALANCE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TIMES [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WAIVE AMOUNT [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON NOTE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - SEND TO [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - NOTE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]


# Verify Value - 04 : Negotiation Special Discount (LG)
VERIFY FEATURE - DATA VALUE - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TYPE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST NO. [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER ID [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST DATE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER NAME [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUESTER [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - BUSINESS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TEAM [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT NO [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - OD STATUS [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TOTAL W/O BALANCE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_04_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TIMES [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    




# Verify title, value and input data [all]
PAGE REQUEST WAIVE - VERIFY TITLE VALUE AND INPUT DATA
    FOR    ${times}  IN RANGE    1    4    # 3 time 1,2,3
        Request_waive_04_page.PAGE REQUEST WAIVE - GET AND WRITE DATA - PAGE REQUEST [TYPE: 04]      # get and write data
        VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # verify title 04
        VERIFY FEATURE - DATA VALUE - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # verify value 04
        SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]       # input and dropdown [cap]
        
        Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE
        Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - OK

        ${next_page}    BuiltIn.Run Keyword And Return Status       SeleniumLibrary.Wait Until Element Is Visible   ${txt_red_value_04_nsd_request_no_locator}      150
        IF    '${next_page}' == 'True'
            BuiltIn.Log      Data completed!    WARN
            BuiltIn.Exit For Loop

        ELSE
            ${error_msg}    SeleniumLibrary.Get Text    ${txt_msg_04_error}
            BuiltIn.Log    Row: ${rowForWrite}    WARN
            BuiltIn.Log    Error message Round ${times} : ${error_msg}    WARN
            Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_04]    04_SD_WO    ${rowForWrite}    30    FAIL ${group_user}[${keys_group_user}[3]] : ${error_msg}

            IF     ${times} == 3
                BuiltIn.Log     Round : 1-${times} is FAIL!    WARN
                BuiltIn.FAIL    Round : 1-${times} is FAIL!
            END

            ${index_main}     BuiltIn.Evaluate    ${index_main}+1
            ${rowForWrite}    BuiltIn.Evaluate    ${rowForWrite}+1
            ${result_excel_test}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == 'TC_${index_main}')]
            ${group_data}    BuiltIn.Set Variable   ${result_excel_test}[0]
            BuiltIn.Set Global Variable    ${group_data}

            Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - BACK
            BuiltIn.Sleep    3s
            SET FEATURE - INPUT REQUEST - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # input idcard,biz,contract
        END
    END

