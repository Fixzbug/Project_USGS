*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Keywords ***
SET FEATURE - TYPE - 03 - GO TO - PAGE INQUIRY - BY USER LEVEL
    [Arguments]    ${user_level}
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - INPUT USENAME AND PASSWORD BY USER LEVEL    ${user_level}      
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [CLICK] - LINK
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WELCOME - USER - ${user_level}


SET FEATURE - TYPE - 03 - SELECT MENU - PAGE INQUIRY
    [Arguments]    ${menu}    ${sub_menu}
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [CLICK] - [MENU]    ${menu} 
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [CLICK] - [SUB MENU]    ${sub_menu} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    MENU


SET FEATURE - TYPE - 03 - SELECT MENU - REQUEST TYPE - PAGE INQUIRY
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [SELCET] - [FRAME] IFRAME
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [SELCET] - [DROPDOWN] REQUEST TYPE  
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE


# verify zone
SET FEATURE - TYPE - 03 - VERIFY - REQUEST PAGE - PAGE INQUIRY
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [UNSELCET] - [FRAME] UNIFRAME
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [SELCET] - [FRAME] IFRAME
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] REQUESTER
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] REQUEST NO
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] CUSTOMER ID
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY - INBOX PAGE


# input zone step 2    
SET FEATURE - TYPE - 03 - INPUT CRITERIA SEARCH - PAGE INQUIRY 
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [INPUT] - [TEXT] REQUEST NO
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [INPUT] - [TEXT] REQUESTER
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [INPUT] - [TEXT] CUSTOMER ID
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [INPUT] - [TEXT] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    CONTRACT


# click searh button
SET FEATURE - TYPE - 03 - CLICK BTN SEARCH
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [CLICK] - [BTN] SEARCH


# wait page display
SET FEATURE - TYPE - 03 - WAIT - VERIFY - PAGE INQUIRY
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [WAIT] - [VERIFY] PAGE


# verify title
SET FEATURE - TYPE - 03 - VERIFY - TITLE - PAGE INQUIRY
    # BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [WAIT] LOADING PAGE    
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQ NO
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - SENDER
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - SEND DATE
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST DESC
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - CUSTOMER ID   
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - CONTRACT NO
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - NAME
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST BY
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - TEAM
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REASON
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST AMT
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - APPROVE USER
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - BIZ
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - STATUS
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TITLE


# verify data
SET FEATURE - TYPE - 03 - VERIFY - DATA - PAGE INQUIRY
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQ NO
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - SENDER
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - SEND DATE    
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST DESC
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - CUSTOMER ID   
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - CONTRACT NO    
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - NAME
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST BY
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - TEAM
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REASON
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST AMT
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - APPROVE USER
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - BIZ
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - STATUS
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA


# click action 
SET FEATURE - TYPE - 03 - CLICK LINK ACTION
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [CLICK] - [LINK] ACTION


# loading 
SET FEATURE - TYPE - 03 - WAIT - LOADING - PAGE INQUIRY
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [WAIT] LOADING PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    LOADING


# logout
SET FEATURE - TYPE - 03 - CLICK - LOGOUT - PAGE INQUIRY
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [UNSELCET] - [FRAME] UNIFRAME
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    LOGOUT
    Inquiry_03_page.PAGE INQUIRY - TYPE 03 - [CLICK] - [BTN] LOGOUT

