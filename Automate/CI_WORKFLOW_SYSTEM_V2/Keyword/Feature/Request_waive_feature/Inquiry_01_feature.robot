*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Keywords ***
SET FEATURE - TYPE - 01 - GO TO - PAGE INQUIRY - BY USER LEVEL
    [Arguments]    ${user_level}
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - INPUT USENAME AND PASSWORD BY USER LEVEL    ${user_level}      
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [CLICK] - LINK
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WELCOME - USER - ${user_level}


SET FEATURE - TYPE - 01 - SELECT MENU - PAGE INQUIRY
    [Arguments]    ${menu}    ${sub_menu}
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [CLICK] - [MENU]    ${menu} 
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [CLICK] - [SUB MENU]    ${sub_menu} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    MENU


SET FEATURE - TYPE - 01 - SELECT MENU - REQUEST TYPE - PAGE INQUIRY
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [SELCET] - [FRAME] IFRAME
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [SELCET] - [DROPDOWN] REQUEST TYPE  
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE


# verify zone
SET FEATURE - TYPE - 01 - VERIFY - REQUEST PAGE - PAGE INQUIRY
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [UNSELCET] - [FRAME] UNIFRAME
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [SELCET] - [FRAME] IFRAME
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY - INBOX PAGE


# input zone step 2    
SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - PAGE INQUIRY 
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [INPUT] - [TEXT] REQUEST NO
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [INPUT] - [TEXT] REQUESTER
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [INPUT] - [TEXT] CUSTOMER ID
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [INPUT] - [TEXT] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    CONTRACT


# click searh button
SET FEATURE - TYPE - 01 - CLICK BTN SEARCH
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [CLICK] - [BTN] SEARCH


# wait page display
SET FEATURE - TYPE - 01 - WAIT - VERIFY - PAGE INQUIRY
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [WAIT] - [VERIFY] PAGE


# verify data
SET FEATURE - TYPE - 01 - VERIFY - DATA - PAGE INQUIRY
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQ NO
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - CUSTOMER ID   
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - CONTRACT NO    
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - NAME
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQUEST BY
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REASON
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQUEST AMT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA


# click action 
SET FEATURE - TYPE - 01 - CLICK LINK ACTION
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [CLICK] - [LINK] ACTION


# loading 
SET FEATURE - TYPE - 01 - WAIT - LOADING - PAGE INQUIRY
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [WAIT] LOADING PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    LOADING


# logout
SET FEATURE - TYPE - 01 - CLICK - LOGOUT - PAGE INQUIRY
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [UNSELCET] - [FRAME] UNIFRAME
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    LOGOUT
    Inquiry_01_page.PAGE INQUIRY - TYPE 01 - [CLICK] - [BTN] LOGOUT

