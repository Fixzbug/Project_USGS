*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
${Excel_name}
${Customer_ID}


*** Keywords ***
SET FEATURE - TYPE - 01 - GO TO - PAGE INBOX - BY USER LEVEL
    [Arguments]    ${user_level}
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - INPUT USENAME AND PASSWORD BY USER LEVEL    ${user_level}      
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [CLICK] - LINK
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WELCOME - USER - ${user_level}


SET FEATURE - TYPE - 01 - SELECT MENU - PAGE INBOX
    [Arguments]    ${menu}    ${sub_menu}
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [CLICK] - [MENU]    ${menu} 
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [CLICK] - [SUB MENU]    ${sub_menu} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    MENU


SET FEATURE - TYPE - 01 - SELECT MENU - REQUEST TYPE - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [WAIT] - [VERIFY] PAGE
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [SELCET] - [FRAME] IFRAME
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [SELCET] - [DROPDOWN] REQUEST TYPE  
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE


# verify zone
SET FEATURE - TYPE - 01 - VERIFY - REQUEST PAGE - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [UNSELCET] - [FRAME] UNIFRAME
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [SELCET] - [FRAME] IFRAME
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY - INBOX PAGE


# input zone step 2    
SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] REQUEST NO
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] REQUESTER
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] CUSTOMER ID
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INPUT DATA - INBOX PAGE


# click searh button
SET FEATURE - TYPE - 01 - CLICK BTN SEARCH
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [CLICK] - [BTN] SEARCH


# wait page display
SET FEATURE - TYPE - 01 - WAIT - VERIFY - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [WAIT] - [VERIFY] PAGE


# verify data
SET FEATURE - TYPE - 01 - VERIFY STEP 1 - DATA - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQ NO
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQUEST TYPE
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - CUSTOMER ID   
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - CONTRACT NO
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - NAME
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQUEST BY
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REASON
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA


# click action 
SET FEATURE - TYPE - 01 - CLICK LINK ACTION
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [CLICK] - [LINK] ACTION


SET FEATURE - TYPE - 01 - VERIFY - DATA STEP 2 - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REQUEST TYPE
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER ID
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER NAME
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - BUSINESS
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - CONTRACT NO
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REQUEST NO
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REQUESTER
    # Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - TOTAL O/S BALANCE
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - TOTAL PENALTY
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - WAIVE AMOUNT
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REASON
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REASON NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA PAGE APPROVE REQUEST PENALTY


# verify note
SET FEATURE - TYPE - 01 - VERIFY - NOTE - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [LABEL] NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   NOTE


# input data note
SET FEATURE - TYPE - 01 - INPUT - NOTE - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   NOTE


# btn approve
SET FEATURE - TYPE - 01 - CLICK - APPROVE - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [CLICK] - [BTN] APPROVE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    CLICK - SEARCH


# popup approve
SET FEATURE - TYPE - 01 - VERIFY - APPROVE POPUP - PAGE INBOX
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [TITLE] APPROVE 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP


SET FEATURE - TYPE - 01 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP - CLICK OK
    Approve_negotiate_01_page.PAGE INBOX - TYPE 01 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
