*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
${Excel_name}

*** Keywords ***
SET FEATURE - TYPE - 06 - GO TO - PAGE INBOX - BY USER LEVEL
    [Arguments]    ${user_level}
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - INPUT USENAME AND PASSWORD BY USER LEVEL    ${user_level}      
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [CLICK] - LINK
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WELCOME - USER - ${user_level}


SET FEATURE - TYPE - 06 - SELECT MENU - PAGE INBOX
    [Arguments]    ${menu}    ${sub_menu}
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [CLICK] - [MENU]    ${menu} 
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [CLICK] - [SUB MENU]    ${sub_menu} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    MENU


SET FEATURE - TYPE - 06 - SELECT MENU - REQUEST TYPE - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [WAIT] - [VERIFY] PAGE
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [SELCET] - [FRAME] IFRAME
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [SELCET] - [DROPDOWN] REQUEST TYPE  
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE


# verify zone
SET FEATURE - TYPE - 06 - VERIFY - REQUEST PAGE - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [UNSELCET] - [FRAME] UNIFRAME
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [SELCET] - [FRAME] IFRAME
    # Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [LABELS] REQUEST TYPE
    # Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [LABELS] REQUESTER
    # Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [LABELS] REQUEST NO
    # Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [LABELS] CUSTOMER ID
    # Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [LABELS] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY - INBOX PAGE


# input zone step 2    
SET FEATURE - TYPE - 06 - INPUT CRITERIA SEARCH - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [INPUT] - [TEXT] REQUEST NO
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [INPUT] - [TEXT] REQUESTER
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [INPUT] - [TEXT] CUSTOMER ID
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [INPUT] - [TEXT] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INPUT DATA - INBOX PAGE


# click searh button
SET FEATURE - TYPE - 06 - CLICK BTN SEARCH
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [CLICK] - [BTN] SEARCH


# wait page display
SET FEATURE - TYPE - 06 - WAIT - VERIFY - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [WAIT] - [VERIFY] PAGE


# verify title
SET FEATURE - TYPE - 06 - VERIFY - TITLE - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - REQ NO
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - SENDER
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - SEND DATE
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - REQUEST TYPE
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - CUSTOMER ID   
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - CONTRACT NO
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - NAME
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - REQUEST BY
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - TEAM
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - REASON
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - REQUEST AMT
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - APPROVE USER
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - STEP 1 - STATUS
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TITLE


# verify data
SET FEATURE - TYPE - 06 - VERIFY - DATA - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - REQ NO
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - SENDER
    # Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - SEND DATE
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - REQUEST TYPE
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - CUSTOMER ID   
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - CONTRACT NO
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - NAME
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - REQUEST BY
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - TEAM
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - REASON
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - REQUEST AMT
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - APPROVE USER
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TEXT] - STEP 1 - STATUS
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA


# click action 
SET FEATURE - TYPE - 06 - CLICK LINK ACTION
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [CLICK] - [LINK] ACTION


#  Verify Title - 06 : Negotiation Special discount (WO)
SET FEATURE - TYPE - 06 - VERIFY - TITLE - STEP 2 - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [UNSELCET] - [FRAME] UNIFRAME
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [SELCET] - [FRAME] IFRAME
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - REQUEST TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - REQUEST NO. [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - REQUESTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - REQUEST DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER ID [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT NO [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER NAME [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CALL CENTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - AGE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - TEAM [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - NUMBER OF CHILD [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - OD STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - LAST SALARY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - BUSINESS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - WO DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - TIME OF PAYMENT [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - DUE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - TIMES OF PENALTY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - REQUEST TIMES [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - LAST REQUEST NO [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TITLE - REQUEST PAGE


#  Verify data - 06 : Negotiation Special discount (WO)
SET FEATURE - TYPE - 06 - VERIFY - DATA - STEP 2 - PAGE INBOX
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - REQUEST TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - REQUEST NO. [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - REQUESTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - REQUEST DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - CUSTOMER ID [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT NO [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - CUSTOMER NAME [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - CALL CENTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - AGE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - TEAM [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - OD STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - BUSINESS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - WO DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - TIME OF PAYMENT [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - DUE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - TIMES OF PENALTY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - REQUEST TIMES [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA - REQUEST PAGE


### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. Entry negotiate discount detail]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    DATA TITLE 1. - REQUEST PAGE

# --------------------------------------------------------------------------
# WOScreen
SET FEATURE - TYPE - 06 - DATA TITLE - PAGE INBOX [NEGOTIATE DETAIL] - [WOSCREEN]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - LOAN AMT OF CUSTOMER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - LOAN AMT OF NEW CONTRACT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - PAID TERM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - RECEIVE BF WO (OLD CONT)
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - RECEIVE BF WO (NEW CONT)
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - OS BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - OTHER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - WO BALANCE AS OF CLOSING
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - NEW WO BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER WILL PAY
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - RECEIVE AFTER WO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - DIFF AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - OA COM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - TOTALS RECEIVED
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - DIFF FROM LOAN AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - PERCENT DISCOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - AFTER WO PERCENT DISCOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - NET RECEIVE ONLY OA



SET FEATURE - TYPE - 06 - DATA VALUE - PAGE INBOX [NEGOTIATE DETAIL] - [WOSCREEN]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - LOAN AMT OF CUSTOMER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - LOAN AMT OF NEW CONTRACT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - PAID TERM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - RECEIVE BF WO OLD CONT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - RECEIVE BF WO NEW CONT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - OS BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - OTHER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - WO BALANCE AS OF CLOSING
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - NEW WO BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - CUSTOMER WILL PAY
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - RECEIVE AFTER WO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - DIFF AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - OA COM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - TOTALS RECEIVED
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - DIFF FROM LOAN AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - PERCENT DISCOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - AFTER WO PERCENT DISCOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [VALUE] - NET RECEIVE ONLY OA

# --------------------------------------------------------------------------

# Verify Title - 3.2 Entry other ...
SET FEATURE - TYPE - 06 - DATA TITLE - PAGE INBOX [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [DATA] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [DATA] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [DATA] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [DATA] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [DATA] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [DATA] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [DATA] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TABLE TABLE 3.2. - REQUEST PAGE


 
# verify send to
SET FEATURE - TYPE - 06 - VERIFY - SEND TO - PAGE INBOX
    [Arguments]    ${user_level}
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [LABEL] SEND TO    ${user_level} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   SEND TO  

# input data note
SET FEATURE - TYPE - 06 - INPUT - NOTE - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [INPUT] - [TEXT] NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   NOTE


# btn approve
SET FEATURE - TYPE - 06 - CLICK - APPROVE - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [CLICK] - [BTN] APPROVE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    CLICK - SEARCH


# popup approve
SET FEATURE - TYPE - 06 - VERIFY - APPROVE POPUP - PAGE INBOX
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [TITLE] APPROVE 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP


SET FEATURE - TYPE - 06 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP - CLICK OK
    Approve_negotiate_06_page.PAGE INBOX - TYPE 06 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK



# all featrue before send to 
SET FEATURE - TYPE - 06 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX 
    
    # input data note
    SET FEATURE - TYPE - 06 - INPUT - NOTE - PAGE INBOX

    # กด approve
    SET FEATURE - TYPE - 06 - CLICK - APPROVE - PAGE INBOX     

    # verify pop up
    SET FEATURE - TYPE - 06 - VERIFY - APPROVE POPUP - PAGE INBOX     

    # verify pop up
    SET FEATURE - TYPE - 06 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX  

    # เขียนข้อมูล row, column -> Request
    Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_06}    row=${Rows}    column=7    data=Approve    # Rows global ,colum fix ,data global

    # logout
    Common_keyword.UNSELECT IFRAME   
    Common_keyword.WAITING FOR DATA UPDATE    1s 
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}  

