*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
${Excel_name}

*** Keywords ***
SET FEATURE - TYPE - 06 - GO TO - PAGE REQUEST WAIVE - BY USER LEVEL
    [Arguments]    ${user_level}
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - INPUT USENAME AND PASSWORD BY USER LEVEL    ${user_level}      
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - LINK
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WELCOME - USER - ${user_level}


SET FEATURE - TYPE - 06 - SELECT MENU - PAGE REQUEST WAIVE
    [Arguments]    ${menu}    ${sub_menu}
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [MENU]    ${menu} 
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [SUB MENU]    ${sub_menu} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    MENU


SET FEATURE - TYPE - 06 - SELECT MENU - REQUEST TYPE - PAGE REQUEST WAIVE
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [SELCET] - [FRAME] IFRAME
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [SELCET] - [DROPDOWN] REQUEST TYPE  
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE


# input zone step 1
SET FEATURE - TYPE - 06 - INPUT CRITERIA SEARCH - REQUEST TYPE - PAGE REQUEST WAIVE
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - [TEXT] CONTRACT NO
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [SELECT] - [DROPDOWN] BUSINESS
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - [TEXT] ID CARD
    # Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LABEL] CONTRACT NO 
    # Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LABEL] ID CARD
    # Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LABEL] BUSINESS  
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BTN] APPROVE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE



# Input Data - 06 : Negotiation Special discount (WO)
SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - NUMBER OF CHILD [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - LAST SALARY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [DROPDOWN] - CUSTOMER STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INPUT DATA


#  Verify Title - 06 : Negotiation Special discount (WO)
SET FEATURE - TYPE - 06 - VERIFY - REQUEST PAGE - PAGE REQUEST WAIVE
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [UNSELCET] - [FRAME] UNIFRAME
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [SELCET] - [FRAME] IFRAME
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - HERDER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUEST TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUEST NO. [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUESTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUEST DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER ID [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT NO [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER NAME [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CALL CENTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - AGE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TEAM [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - NUMBER OF CHILD [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OD STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LAST SALARY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - BUSINESS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - WO DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TIME OF PAYMENT [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - DUE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TIMES OF PENALTY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUEST TIMES [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LAST REQUEST NO [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - MINIMUM/INSTALL: [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TITLE - REQUEST PAGE


#  Verify data - 06 : Negotiation Special discount (WO)
SET FEATURE - TYPE - 06 - VERIFY - DATA REQUEST PAGE - PAGE REQUEST WAIVE
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUEST TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUEST NO. [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUESTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUEST DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]    # add new
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CUSTOMER ID [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT NO [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CUSTOMER NAME [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CALL CENTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - AGE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - TEAM [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - OD STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - BUSINESS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - WO DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - TIME OF PAYMENT [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - DUE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - TIMES OF PENALTY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUEST TIMES [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - MINIMUM/INSTALL: [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA - REQUEST PAGE



### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. Entry negotiate discount detail]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    DATA TITLE 1. - REQUEST PAGE


# Input Data - Negotiate Detail - 1. Entry negotiate discount detail
SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]   
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [DROPDOWN] - FIRST DUE DATE INDEX 2 [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INPUT DATA 1. - REQUEST PAGE

# Click
SET FEATURE - TYPE - 06 - SUBMIT - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BUTTON] - SUBMIT    # click


# --------------------------------------------------------------------------
# WOScreen
SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [WOSCREEN]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LOAN AMT OF CUSTOMER
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LOAN AMT OF NEW CONTRACT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - PAID TERM
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - RECEIVE BF WO (OLD CONT)
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - RECEIVE BF WO (NEW CONT)
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OS BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OTHER
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - WO BALANCE AS OF CLOSING
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - NEW WO BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER WILL PAY
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - RECEIVE AFTER WO
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - DIFF AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OA COM
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TOTALS RECEIVED
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - DIFF FROM LOAN AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - PERCENT DISCOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - AFTER WO PERCENT DISCOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - NET RECEIVE ONLY OA



SET FEATURE - TYPE - 06 - DATA VALUE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [WOSCREEN]
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - LOAN AMT OF CUSTOMER
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - LOAN AMT OF NEW CONTRACT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - PAID TERM
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - RECEIVE BF WO OLD CONT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - RECEIVE BF WO NEW CONT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - OS BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - OTHER
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - WO BALANCE AS OF CLOSING
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - NEW WO BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CUSTOMER WILL PAY
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - RECEIVE AFTER WO
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - DIFF AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - OA COM
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - TOTALS RECEIVED
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - DIFF FROM LOAN AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - PERCENT DISCOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - AFTER WO PERCENT DISCOUNT
    BuiltIn.Run Keyword And Continue On Failure    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - NET RECEIVE ONLY OA

# --------------------------------------------------------------------------


# Verify Title - 2. Entry detail by Term#, Time#
SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    DATA TITLE 2. - REQUEST PAGE


# Input Data - Negotiate Detail - 2. Entry detail by Term#, Time#
SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - TERM# START - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - TERM# END - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - PAID DATE - [2. ENTRY DETAIL BY TERM#, TIME#]    # add new
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - PAID AMOUNT - [2. ENTRY DETAIL BY TERM#, TIME#]
    # ** ต้องกรอกใน excel 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INPUT DATA 2. - REQUEST PAGE

# Click add
SET FEATURE - TYPE - 06 - ADD - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BUTTON] - ADD [2. ENTRY DETAIL BY TERM#, TIME#]    # click


# Verify Title Table - 2. Entry detail by Term#, Time#
SET FEATURE - TYPE - 06 - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - MIN DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - MAX DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - TIME# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TABLE TABLE 2. - REQUEST PAGE


# Verify Value Table - 2. Entry detail by Term#, Time#
SET FEATURE - TYPE - 06 - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE][TABLE] - TOTAL TERM [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE][TABLE] - TOTAL PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY VALUE TABLE 2. - REQUEST PAGE
    



# Verify Title - 3.1 Entry other debt
SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA TITLE 3.1 - REQUEST PAGE


# Input Data - Negotiate Detail - 3.1 Entry other debt
SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - OTHER DEBT - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - AMOUNT - [3.1 ENTRY OTHER DEBT]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INPUT DATA 3.1 - REQUEST PAGE


# Click add
SET FEATURE - TYPE - 06 - ADD - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BUTTON] - ADD [3.1 ENTRY OTHER DEBT]




# Verify Title Table - 3.1 Entry other debt
SET FEATURE - TYPE - 06 - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TABLE TABLE 3.1 - REQUEST PAGE


# Verify Value Table - 3.1 Entry other debt
SET FEATURE - TYPE - 06 - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE][TABLE] - TOTAL AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]


# Verify Title - 3.2 Entry other ...
SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    # Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    # Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TABLE TABLE 3.2. - REQUEST PAGE


# Input Data - Negotiate Detail - 3.2 Entry other ...
SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
   Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TABLE TABLE 3.2. - REQUEST PAGE


# verify table
SET FEATURE - TYPE - 06 - VERIFY - SEND TO - PAGE REQUEST WAIVE
    [Arguments]    ${user_level}
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [DROPDOWN] - SEND TO [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]    ${user_level}
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    SEND TO


# btn approve
SET FEATURE - TYPE - 06 - CLICK - APPROVE - PAGE REQUEST WAIVE
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BTN] APPROVE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    CLICK - SEARCH
    

# verify title popup
SET FEATURE - TYPE - 06 - VERIFY - APPROVE POPUP - PAGE REQUEST WAIVE
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] APPROVE 


SET FEATURE - TYPE - 06 - CLICK - APPROVE POPUP - CLICK OK - PAGE REQUEST WAIVE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP - CLICK OK
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK


# save data to excel zone
SET FEATURE - TYPE - 06 - SAVE DATA - REQUSET NO - PAGE REQUEST WAIVE
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [GET] - [DATA] REQUEST NO - [SAVE] EXCEL
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    SAVE DATA - REQUSET NO


# click back button
SET FEATURE - TYPE - 06 - CLICK BTN BACK
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BTN] BACK


# logout
SET FEATURE - TYPE - 06 - CLICK - LOGOUT - PAGE REQUEST WAIVE
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [UNSELCET] - [FRAME] UNIFRAME
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    LOGOUT
    Request_waive_06_page.PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BTN] LOGOUT


SET FEATURE - TYPE - 06 - SAVE DATA TO EXCEL - BY STATE
    [Documentation]    # check pass and fail pass 1 time / fail 3 time

    IF  '${point}' == '1'    # ทำได้จบ flow

        ${count}    BuiltIn.Evaluate    1    # fix 1 time
        BuiltIn.Set Global Variable    ${count}    
      
        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_06}    row=${Rows}    column=6    data=${result_request_no}    # Rows global ,colum fix ,data global

        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_06}    row=${Rows}    column=88    data=${result_request_no}    # req no.

        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_06}    row=${Rows}    column=7    data=Request    # Rows global ,colum fix ,data global

        # click logout button
        Common_keyword.UNSELECT IFRAME   
        Common_keyword.WAITING FOR DATA UPDATE    1s 
        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}  
        BuiltIn.Log    COUNT->${count}    WARN

    ELSE IF  '${point}' == '0'    # ทำผิด ให้ save error แล้วกดกลับ
        
        ${count}    BuiltIn.Evaluate    ${count} + 1    # counter 3 time for check fail 3 time process
        BuiltIn.Set Global Variable    ${count}        

        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_06}    row=${Rows}    column=6    data=${result_request_no}    # Rows global ,colum fix ,data global

        # write row, column -> Request
        Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_06}    row=${Rows}    column=7    data=FAIL    # Rows global ,colum fix ,data global
 
        # click back button
        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_back}    10s
        BuiltIn.Log    COUNT FAIL->${count}    WARN
 
        # IF  '${count}' == '3'       # counter fail 3 time just logout end process
        #     # click logout button
        #     Common_keyword.UNSELECT IFRAME   
        #     Common_keyword.WAITING FOR DATA UPDATE    1s 
        #     Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}  
        #     BuiltIn.Log    LOGOUT AT FAIL->${count}    WARN
        # END

        # click logout button
        Common_keyword.UNSELECT IFRAME   
        Common_keyword.WAITING FOR DATA UPDATE    1s 
        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}  
        BuiltIn.Log    LOGOUT AT FAIL->${count}    WARN

        ${nextcase}    BuiltIn.Set Variable    False
        BuiltIn.Set Global Variable    ${nextcase} 

    END