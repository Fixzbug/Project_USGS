*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Keywords ***
# Get text and write request no
SET FEATURE - WRITE DATA - PAGE INBOX [REQUEST NO]
    Approve_negotiate_04_page.PAGE INBOX - WRITE DATA - PAGE INBOX [REQUEST NO]
    SeleniumLibrary.Unselect Frame
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST_NO


# Verify title - page inbox
VERIFY FEATURE - DATA TITLE - PAGE INBOX - [TYPE: 04]
    SeleniumLibrary.Select Frame     ${ifrmae_req_waive_locator}
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE] - REQUEST TYPE
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE] - REQUESTER
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE] - REQUEST NO.
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER ID


# Input req type, reqter, req no,cust id and cont no
SET FEATURE - INPUT DATA - PAGE INBOX - [TYPE: 04]
    Approve_negotiate_04_page.PAGE INBOX - [INPUT] - REQUEST TYPE
    Approve_negotiate_04_page.PAGE INBOX - [INPUT] - REQUESTER
    Approve_negotiate_04_page.PAGE INBOX - [INPUT] - REQUEST NO.
    Approve_negotiate_04_page.PAGE INBOX - [INPUT] - CUSTOMER ID
    Approve_negotiate_04_page.PAGE INBOX - [INPUT] - CONTRACT NO
    Approve_negotiate_04_page.PAGE INBOX - [CLICK] - [BUTTON] - SEARCH
    BuiltIn.Sleep   1s
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INBOX
    BuiltIn.Sleep   3s


# Verify title table - page inbox
VERIFY FEATURE - DATA TITLE TABLE - PAGE INBOX - [TYPE: 04]
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NO    #Fix Code
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQ NO.
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SENDER
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SEND DATE
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE 2
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CUSTOMER ID
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CONTRACT NO.
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NAME
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST BY
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - TEAM
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REASON
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST AMT
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - APPROVE USER
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - STATUS
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - ACTION    #Fix Code


# Verify value table - page inbox
VERIFY FEATURE - DATA VALUE TABLE - PAGE INBOX - [TYPE: 04]
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NO    #Fix Code
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQ NO.
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SENDER
    # Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SEND DATE
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE 2
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CUSTOMER ID
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CONTRACT NO.
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NAME
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST BY
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - TEAM
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REASON
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST AMT
    # Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - APPROVE USER
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - STATUS
    Approve_negotiate_04_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - ACTION    #Fix Code
    Approve_negotiate_04_page.PAGE INBOX - [CLICK] - [TEXT] - ACTION


# Verify title - page approve negotiate
VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE - [TYPE: 04]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_head_approve_negotiate_locator}    150    # Head
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST TYPE
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST NO.
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUESTER
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST DATE
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER ID
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT NO
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER NAME
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TEAM
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - OD STATUS
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - BUSINESS
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST TIMES



# Verify value - page approve negotiate
VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE - [TYPE: 04]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST NO.
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUESTER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST DATE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER ID
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT NO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER NAME
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TEAM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - OD STATUS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - BUSINESS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST TIMES


# 1. Negotiate discount detail
# Verify title - page approve negotiate
VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 04]
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - SEND TO [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REJECT REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]


# Verify value - page approve negotiate
VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 04]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]


# Input data - page approve negotiate
VERIFY FEATURE - INPUT DATA - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 04]
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [DROPDOWN] - SEND TO
    Approve_negotiate_04_page.PAGE APPROVE NEGOTIATE - [INPUT] - NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    INBOX    APPROVE_NEGOTIATE


# Verify title, value and input data
PAGE APPROVE NEGOTIATE - VERIFY TITLE VALUE AND INPUT DATA
   FOR    ${user_level}    IN RANGE    ${index_start}    ${index_end}    # 1  5 = 4 round

        # Read data excel ใหม่เพราะมีการ write data มา
        Request_waive_04_feature.SET - FORMAT DATA - ALL DATA AND INPUT DATA    
        ...    excel_name=DATAFILE_WORKFLOW_TYPE_04     
        ...    sheet_name=04_SD_WO
        ...    row=TC_${index_start}    # ${group_data}

        Request_waive_04_feature.SET FEATURE - GO TO - PAGE REQUEST WAIVE - [USER APPROVE]    ${user_level}    # approve 1,4 and write data
        Request_waive_04_feature.SET FEATURE - SELECT MENU - PAGE INBOX

        VERIFY FEATURE - DATA TITLE - PAGE INBOX - [TYPE: 04]     # verify title 04 - inbox
        SET FEATURE - INPUT DATA - PAGE INBOX - [TYPE: 04]        # Input req type, reqter, req no,cust id and cont no
        VERIFY FEATURE - DATA TITLE TABLE - PAGE INBOX - [TYPE: 04]     # verify title table - inbox
        VERIFY FEATURE - DATA VALUE TABLE - PAGE INBOX - [TYPE: 04]     # verify value table - inbox

        # Approve Negotiate
        VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE - [TYPE: 04]    # verify title - approve negotiate blog 1
        VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE - [TYPE: 04]    # verify value - approve negotiate blog 1

        # 3. Request detail
        VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 04]    # verify title 04 - 3
        VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 04]    # verify value 04 - 3
        ${status_send_to}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${txt_title_approve_negotiate_send_to_locator}    30
        Log    Send to field found is ==> ${status_send_to}    WARN

        IF  ${status_send_to} == True    # ถ้าเจอ field "send to" ให้ส่งไปคนถัดไป
            VERIFY FEATURE - INPUT DATA - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 04]    # input value 04 - 3 [sendto, note]    [capture]
            Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE
            Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - OK
            Approve_negotiate_04_page.PAGE INBOX - [CLICK] - [BUTTON] - SIGN OUT 2
        ELSE
            Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE
            Request_waive_04_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - OK
            BuiltIn.Sleep   1s
            SeleniumLibrary.Close Browser
            BuiltIn.Exit For Loop
        END

    END