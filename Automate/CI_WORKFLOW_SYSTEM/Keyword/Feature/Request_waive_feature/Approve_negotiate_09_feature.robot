*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
${Excel_name}

*** Keywords ***
SET FEATURE - TYPE - 09 - GO TO - PAGE INBOX - BY USER LEVEL
    [Arguments]    ${user_level}
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - INPUT USENAME AND PASSWORD BY USER LEVEL    ${user_level}      
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [CLICK] - LINK
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WELCOME - USER - ${user_level}


SET FEATURE - TYPE - 09 - SELECT MENU - PAGE INBOX
    [Arguments]    ${menu}    ${sub_menu}
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [CLICK] - [MENU]    ${menu} 
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [CLICK] - [SUB MENU]    ${sub_menu} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    MENU


SET FEATURE - TYPE - 09 - SELECT MENU - REQUEST TYPE - PAGE INBOX
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [WAIT] - [VERIFY] PAGE
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [SELCET] - [FRAME] IFRAME
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [SELCET] - [DROPDOWN] REQUEST TYPE  
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE


# verify zone
SET FEATURE - TYPE - 09 - VERIFY - REQUEST PAGE - PAGE INBOX
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [UNSELCET] - [FRAME] UNIFRAME
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [SELCET] - [FRAME] IFRAME
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] REQUEST TYPE
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] REQUESTER
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] REQUEST NO
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] CUSTOMER ID
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [LABELS] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY - INBOX PAGE


# input zone step 2    
SET FEATURE - TYPE - 09 - INPUT CRITERIA SEARCH - PAGE INBOX
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] REQUEST NO
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] REQUESTER
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] CUSTOMER ID
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INPUT DATA - INBOX PAGE


# click searh button
SET FEATURE - TYPE - 09 - CLICK BTN SEARCH
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [CLICK] - [BTN] SEARCH


# wait page display
SET FEATURE - TYPE - 09 - WAIT - VERIFY - PAGE INBOX
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [WAIT] - [VERIFY] PAGE


# verify title
SET FEATURE - TYPE - 09 - VERIFY - TITLE - PAGE INBOX
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REQ NO
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - SENDER
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - SEND DATE
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REQUEST TYPE
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - CUSTOMER ID   
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - CONTRACT NO
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - NAME
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REQUEST BY
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - TEAM
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REASON
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - REQUEST AMT
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - APPROVE USER
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - STEP 1 - STATUS
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TITLE


# verify data
SET FEATURE - TYPE - 09 - VERIFY - DATA - PAGE INBOX
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REQ NO
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - SENDER
    # Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - SEND DATE
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REQUEST TYPE
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - CUSTOMER ID   
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - CONTRACT NO
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - NAME
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REQUEST BY
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - TEAM
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REASON
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - REQUEST AMT
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - APPROVE USER
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TEXT] - STEP 1 - STATUS
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA


# click action 
SET FEATURE - TYPE - 09 - CLICK LINK ACTION
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [CLICK] - [LINK] ACTION


#  Verify Title - 09 : Negotiation Special discount (WO)
SET FEATURE - TYPE - 09 - VERIFY - TITLE - STEP 2 - PAGE INBOX
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [UNSELCET] - [FRAME] UNIFRAME
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [SELCET] - [FRAME] IFRAME
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUEST TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUEST NO. [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUESTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUEST DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CUSTOMER ID [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT NO [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CUSTOMER NAME [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CALL CENTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - AGE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TEAM [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - NUMBER OF CHILD [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - OD STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - LAST SALARY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CUSTOMER STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - BUSINESS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - WO DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TIME OF PAYMENT [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - DUE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TIMES OF PENALTY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REQUEST TIMES [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - LAST REQUEST NO [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TITLE - REQUEST PAGE


#  Verify data - 09 : Negotiation Special discount (WO)
SET FEATURE - TYPE - 09 - VERIFY - DATA - STEP 2 - PAGE INBOX
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUEST TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUEST NO. [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUESTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUEST DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CUSTOMER ID [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT NO [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CUSTOMER NAME [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CALL CENTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - AGE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - TEAM [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - OD STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - BUSINESS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - WO DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - TIME OF PAYMENT [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - DUE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - TIMES OF PENALTY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - REQUEST TIMES [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA - REQUEST PAGE

### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
SET FEATURE - TYPE - 09 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. Entry negotiate discount detail]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    DATA TITLE 1. - REQUEST PAGE


# --------------------------------------------------------------------------
# OD Screen
SET FEATURE - TYPE - 09 - DATA TITLE - PAGE INBOX [NEGOTIATE DETAIL] - [WOSCREEN]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : LOAN AMT OF CUSTOMER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : LOAN AMT OF NEW CONTRACT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : CONTRACT AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : PAID TERM]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : TOTAL PAID AMT (OLD CONTRACT)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : TOTAL PAID AMT (NEW CONTRACT)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : OS (AS OF CLOSING DATE)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : OD AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : PENALTY AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : CLOSING (SYD)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : WO AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : CUSTOMER WILL PAY]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF. FROM CLOSING]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF. FROM WO (OD)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : TOTAL RECEIVED]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF FROM LOAN AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF FROM OS]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF FROM WO]



SET FEATURE - TYPE - 09 - DATA VALUE - PAGE INBOX [NEGOTIATE DETAIL] - [WOSCREEN]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : LOAN AMT OF CUSTOMER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : LOAN AMT OF NEW CONTRACT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : CONTRACT AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : PAID TERM]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : TOTAL PAID AMT (OLD CONTRACT)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : TOTAL PAID AMT (NEW CONTRACT)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : OS (AS OF CLOSING DATE)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : OD AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : PENALTY AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : CLOSING (SYD)]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : WO AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : CUSTOMER WILL PAY]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : TOTAL RECEIVED]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : DIFF FROM LOAN AMOUNT]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : DIFF FROM OS]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [VALUE] - [09 : DIFF FROM WO]

# --------------------------------------------------------------------------

# Verify Title - 3.2 Entry other ...
SET FEATURE - TYPE - 09 - DATA TITLE - PAGE INBOX [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    #BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [DATA] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TABLE TABLE 3.2. - REQUEST PAGE


 
# verify send to
SET FEATURE - TYPE - 09 - VERIFY - SEND TO - PAGE INBOX
    [Arguments]    ${user_level}
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [LABEL] SEND TO    ${user_level} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   SEND TO  

# input data note
SET FEATURE - TYPE - 09 - INPUT - NOTE - PAGE INBOX
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [INPUT] - [TEXT] NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   NOTE


# btn approve
SET FEATURE - TYPE - 09 - CLICK - APPROVE - PAGE INBOX
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [CLICK] - [BTN] APPROVE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    CLICK - SEARCH


# popup approve
SET FEATURE - TYPE - 09 - VERIFY - APPROVE POPUP - PAGE INBOX
    # Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [WAIT] - [VERIFY] PAGE
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [TITLE] APPROVE 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP


SET FEATURE - TYPE - 09 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX
    # Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP - CLICK OK
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK



# all featrue before send to 
SET FEATURE - TYPE - 09 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX 
    
    # input data note
    SET FEATURE - TYPE - 09 - INPUT - NOTE - PAGE INBOX

    # กด approve
    SET FEATURE - TYPE - 09 - CLICK - APPROVE - PAGE INBOX     

    # verify pop up
    SET FEATURE - TYPE - 09 - VERIFY - APPROVE POPUP - PAGE INBOX     

    # verify pop up
    SET FEATURE - TYPE - 09 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX  

    # # wait loading finish
    # Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [VERIFY] - [LOADING] 

    # เขียนข้อมูล row, column -> Request
    Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=7    data=Approve    # Rows global ,colum fix ,data global

    # logout
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [UNSELCET] - [FRAME] UNIFRAME
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    LOGOUT
    Approve_negotiate_09_page.PAGE INBOX - TYPE 09 - [CLICK] - [BTN] LOGOUT

