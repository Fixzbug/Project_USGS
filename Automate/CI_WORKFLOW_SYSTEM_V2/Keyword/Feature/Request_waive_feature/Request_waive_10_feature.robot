*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# Set global
${index_main}

*** Keywords ***

# Login web and select workflow user request
SET FEATURE - GO TO - PAGE REQUEST WAIVE - [USER REQUEST]
    Request_waive_10_page.PAGE REQUEST WAIVE - INPUT USENAME AND PASSWORD - [USER REQUEST]
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - LINK
    Request_waive_10_page.PAGE REQUEST WAIVE - [WAIT] - [VERIFY] - PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WAIVE_SYSTEM_HOME_PAGE


# Login web and select workflow user approve
SET FEATURE - GO TO - PAGE REQUEST WAIVE - [USER APPROVE]
    [Arguments]    ${user_level}
    Request_waive_10_page.PAGE REQUEST WAIVE - INPUT USENAME AND PASSWORD - [USER APPROVE] - [NEW]    ${user_level}
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - LINK
    Request_waive_10_page.PAGE REQUEST WAIVE - [WAIT] - [VERIFY] - PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WAIVE_SYSTEM_HOME_PAGE


# dropdown Work flow --> Request Waive
SET FEATURE - SELECT MENU - PAGE REQUEST WAIVE
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [MENU] - [WORK PROCESS] 
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [REQUEST WAIVE]


# dropdown Inquiry --> Inquiry Request 
SET FEATURE - SELECT MENU - PAGE INQUIRY
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [MENU] - [INQUIRY] 
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [INQUIRY REQUEST]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INQUIRY
    

# dropdown Inbox
SET FEATURE - SELECT MENU - PAGE INBOX
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [MENU] - [WORK PROCESS] 
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [INBOX]


# Get data from excel
SET - FORMAT DATA - ALL DATA AND INPUT DATA
    [Arguments]    ${excel_name}    ${sheet_name}    ${row}

    GET - DATA FROM EXCEL    excel_name=${excel_name}    sheet_name=${sheet_name}
        Request_waive_10_page.SET - FORMAT DATA - ALL DATA AND INPUT DATA   row=${row}
        # Request_waive_10_page.SET - FORMAT DATA - ALL DATA AND INPUT DATA [BACKUP]   row=${row}


### 10 : Negotiation Special discount (Nor-OD) ###
# Select - 10 : Negotiation Special discount (Nor-OD)
SET FEATURE - SELECT REQUEST TYPE - PAGE REQUEST WAIVE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [DROPDOWN] - [10 : Negotiation Special discount (Nor-OD)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST_TYPE
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE


# Request Waive - Step input id, business and contract no
SET FEATURE - INPUT REQUEST - PAGE REQUEST WAIVE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - ID CARD [10 : Negotiation Special discount (Nor-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - CONTRACT NO [10 : Negotiation Special discount (Nor-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [DROPDOWN] - BUSINESS [10 : Negotiation Special discount (Nor-OD)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE


# Input Data - 10 : Negotiation Special discount (Nor-OD)
SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - NUMBER OF CHILD [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - LAST SALARY [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [DROPDOWN] - CUSTOMER STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]


# Verify Value - 10 : Negotiation Special discount (Nor-OD)
VERIFY FEATURE - DATA VALUE - PAGE REQUEST WAIVE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TYPE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST NO. [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUESTER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER ID [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT NO [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER NAME [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CALL CENTER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - AGE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TEAM [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - OD STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT TYPE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - BUSINESS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - WO DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TIME OF PAYMENT [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - DUE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TIMES OF PENALTY [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TIMES [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    # Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - LAST REQUEST NO [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]    # ไม่มีปุ๋มให้กรอก
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - MINIMUM/INSTALL: [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]



# Verify Title - 10 : Negotiation Special discount (Nor-OD)
VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - HERDER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TYPE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST NO. [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUESTER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER ID [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER NO [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER NAME [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CALL CENTER [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - AGE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TEAM [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - NUMBER OF CHILD [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OD STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST SALARY [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT TYPE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - BUSINESS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WO DATE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT STATUS [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TIME OF PAYMENT [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DUE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TIMES OF PENALTY [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TIMES [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST REQUEST NO [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - MINIMUM/INSTALL: [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]



### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. Entry negotiate discount detail]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]


# Input Data - Negotiate Detail - 1. Entry negotiate discount detail
SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [DROPDOWN] - FIRST DUE DATE INDEX 2 [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - SUBMIT


# Get Text [Value] - OD Screen
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD SCREEN - [TYPE: 10]
    PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD SCREEN [1.1 PAYMENT HISTORY] - [TYPE: 10]
    PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD SCREEN [1.2 DISCOUNT DETAIL] - [TYPE: 10]
    PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD SCREEN [1.3 PROFIT DETAIL (AUTO CAL.)] - [TYPE: 10]

# Get Text [Value] - OD Screen [1.1 Payment History]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD SCREEN [1.1 PAYMENT HISTORY] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LOAN AMT OF CUSTOMER [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LOAN AMT OF NEW CONTRACT [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - CONTRACT AMOUNT [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - PAID TERM [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTAL PAID AMT (OLD CONTRACT) [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTAL PAID AMT (NEW CONTRACT) [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OS (AS OF CLOSING DATE) [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD AMOUNT [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - PENALTY AMOUNT [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - CLOSING (SYD) [OD SCREEN] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - WO AMOUNT [OD SCREEN] - [1.1 PAYMENT HISTORY]

# Get Text [Value] - OD Screen [1.2 Discount Detail]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD SCREEN [1.2 DISCOUNT DETAIL] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - CUSTOMER WILL PAY [OD SCREEN] - [1.2 DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM CLOSING AMOUNT [OD SCREEN] - [1.2 DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM CLOSING PERCENT [OD SCREEN] - [1.2 DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM WO (OD) AMOUNT [OD SCREEN] - [1.2 DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM WO (OD) PERCENT [OD SCREEN] - [1.2 DISCOUNT DETAIL]

# Get Text [Value] - OD Screen [1.3 Profit detail (Auto cal.)]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD SCREEN [1.3 PROFIT DETAIL (AUTO CAL.)] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTAL RECEIVED [OD SCREEN] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF FROM LOAN AMOUNT [OD SCREEN] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF FROM OS [OD SCREEN] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF FROM WO [OD SCREEN] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    10_NEGOTIATION_SPECIAL_DISCOUNT_(RE-FINANCE)_01



# Verify Title - 1.1 Payment History
VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LOAN AMT OF CUSTOMER [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LOAN AMT OF NEW CONTRACT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT AMOUNT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PAID TERM [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTAL PAID AMT (OLD CONTRACT) [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTAL PAID AMT (NEW CONTRACT) [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OS (AS OF CLOSING DATE) [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OD AMOUNT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PENALTY AMOUNT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CLOSING (SYD) [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WO AMOUNT [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY]


# Verify Title - 1.2 Discount Detail
VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1.2 DISCOUNT DETAIL] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER WILL PAY [NEGOTIATE DETAIL] - [1.2 DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM CLOSING [NEGOTIATE DETAIL] - [1.2 DISCOUNT DETAIL]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM WO (OD) [NEGOTIATE DETAIL] - [1.2 DISCOUNT DETAIL]


# Verify Title - 1.3 Profit detail (Auto cal.) 
VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTAL RECEIVED [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF FROM LOAN AMOUNT [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF FROM OS [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF FROM WO [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)]


# Verify Title - 2. Entry detail by Term#, Time#
VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]


# Input Data - Negotiate Detail - 2. Entry detail by Term#, Time#
SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - TERM# START - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - TERM# END - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - PAID DATE - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - PAID AMOUNT - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - ADD [2. ENTRY DETAIL BY TERM#, TIME#]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    10_NEGOTIATION_SPECIAL_DISCOUNT_(RE-FINANCE)_02


# Verify Title Table - 2. Entry detail by Term#, Time#
VERIFY FEATURE - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - MIN DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - MAX DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - TIME# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]


# Verify Value Table - 2. Entry detail by Term#, Time#
VERIFY FEATURE - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE][TABLE] - TOTAL TERM [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE][TABLE] - TOTAL PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    

# Verify Title - 3.1 Entry other debt
VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]


# Input Data - Negotiate Detail - 3.1 Entry other debt
SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - OTHER DEBT - [3.1 ENTRY OTHER DEBT]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - AMOUNT - [3.1 ENTRY OTHER DEBT]
    Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - ADD [3.1 ENTRY OTHER DEBT]


# Verify Title Table - 3.1 Entry other debt
VERIFY FEATURE - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]


# Verify Value Table - 3.1 Entry other debt
VERIFY FEATURE - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [VALUE][TABLE] - TOTAL AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]


# Verify Title - 3.2 Entry other ...
VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - SEND TO [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]


# Input Data - Negotiate Detail - 3.2 Entry other ...
SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER] - [TYPE: 10]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - SEND TO [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_10_page.PAGE REQUEST WAIVE - [INPUT] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    10_NEGOTIATION_SPECIAL_DISCOUNT_(RE-FINANCE)_03

# Verify title, value and input data [all]
PAGE REQUEST WAIVE - VERIFY TITLE VALUE AND INPUT DATA
    FOR    ${times}  IN RANGE    1    4    # 3 time 1,2,3
        Request_waive_10_page.PAGE REQUEST WAIVE - GET AND WRITE DATA - PAGE REQUEST [TYPE: 10]       # get and write data
        SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]    # input num child,last salary,cust status
        VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]    # verify title 10 
        VERIFY FEATURE - DATA VALUE - PAGE REQUEST WAIVE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]    # verify value 10 
        VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 10]    # verify title 10 - 1
        SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 10]    # input data 10 - 1

        PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OD SCREEN - [TYPE: 10]    # get all value : OD Screen     [capture]
        VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1.1 PAYMENT HISTORY] - [TYPE: 10]    # verify title 10 - OD Screen 1.1
        VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1.2 DISCOUNT DETAIL] - [TYPE: 10]    # verify title 10 - OD Screen 1.2
        VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1.3 PROFIT DETAIL (AUTO CAL.)] - [TYPE: 10]    # verify title 10 - OD Screen 1.3
        
        VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 10]    # verify title 10 - 2
        SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 10]    # input data 10 - 2    [capture]
        VERIFY FEATURE - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 10]    # verify title table 10 - 2
        VERIFY FEATURE - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 10]    # verify value table 10 - 2

        VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 10]    # verify title 10 - 3.1
        SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 10]    # input data 10 - 3.1
        VERIFY FEATURE - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 10]    # verify title table 10 - 3.1
        VERIFY FEATURE - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 10]    # verify value table 10 - 3.1

        VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER] - [TYPE: 10]    # verify title 10 - 3.2
        SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER] - [TYPE: 10]    # input data 10 - 3.2    [capture]
        
        Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE
        Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - OK

        ${next_page}    BuiltIn.Run Keyword And Return Status       SeleniumLibrary.Wait Until Element Is Visible   ${txt_red_value_10_nsd_request_no_locator}      150
        IF    '${next_page}' == 'True'
            BuiltIn.Log      Data completed!    WARN
            BuiltIn.Exit For Loop

        ELSE
            ${error_msg}    SeleniumLibrary.Get Text    ${txt_msg_10_error}
            BuiltIn.Log    Row: ${rowForWrite}    WARN
            BuiltIn.Log    Error message Round ${times} : ${error_msg}    WARN
            Common_keyword.WRITE DATA TO EXCEL    ${share_drive}${excel_file}[DATAFILE_WORKFLOW_TYPE_10]    10_Nego_RF    ${rowForWrite}    96    FAIL ${group_user}[${keys_group_user}[3]] : ${error_msg}

            IF     ${times} == 3
                BuiltIn.Log     Round : 1-${times} is FAIL!    WARN
                BuiltIn.FAIL    Round : 1-${times} is FAIL!
            END

            ${index_main}     BuiltIn.Evaluate    ${index_main}+1
            ${rowForWrite}    BuiltIn.Evaluate    ${rowForWrite}+1
            ${result_excel_test}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == 'TC_${index_main}')]
            ${group_data}    BuiltIn.Set Variable   ${result_excel_test}[0]
            BuiltIn.Set Global Variable    ${group_data}

            Request_waive_10_page.PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - BACK
            BuiltIn.Sleep    3s
            SET FEATURE - INPUT REQUEST - PAGE REQUEST WAIVE [10 : NEGOTIATION SPECIAL DISCOUNT (NOR-OD)]    # input idcard,biz,contract
        END
    END