*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
${Excel_name}

*** Keywords ***
SET FEATURE - TYPE - 03 - GO TO - PAGE INBOX - BY USER LEVEL
    [Arguments]    ${user_level}
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - INPUT USENAME AND PASSWORD BY USER LEVEL    ${user_level}      
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [CLICK] - LINK
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WELCOME - USER - ${user_level}


SET FEATURE - TYPE - 03 - SELECT MENU - PAGE INBOX
    [Arguments]    ${menu}    ${sub_menu}
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [CLICK] - [MENU]    ${menu} 
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [CLICK] - [SUB MENU]    ${sub_menu} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    MENU


SET FEATURE - TYPE - 03 - SELECT MENU - REQUEST TYPE - PAGE INBOX
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [WAIT] - [VERIFY] PAGE
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [SELCET] - [FRAME] IFRAME
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [SELCET] - [DROPDOWN] REQUEST TYPE  
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    REQUEST TYPE


# verify zone
SET FEATURE - TYPE - 03 - VERIFY - REQUEST PAGE - PAGE INBOX
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [UNSELCET] - [FRAME] UNIFRAME
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [SELCET] - [FRAME] IFRAME
    # Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] REQUEST TYPE
    # Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] REQUESTER
    # Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] REQUEST NO
    # Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] CUSTOMER ID
    # Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY - INBOX PAGE


# input zone step 2    
SET FEATURE - TYPE - 03 - INPUT CRITERIA SEARCH - PAGE INBOX
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] REQUEST NO
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] REQUESTER
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] CUSTOMER ID
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] CONTRACT
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INPUT DATA - INBOX PAGE


# click searh button
SET FEATURE - TYPE - 03 - CLICK BTN SEARCH
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [CLICK] - [BTN] SEARCH


# wait page display
SET FEATURE - TYPE - 03 - WAIT - VERIFY - PAGE INBOX
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [WAIT] - [VERIFY] PAGE


# verify title
SET FEATURE - TYPE - 03 - VERIFY - TITLE - PAGE INBOX
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQ NO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - SENDER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - SEND DATE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - CUSTOMER ID   
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - CONTRACT NO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - NAME
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST BY
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - TEAM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REASON
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST AMT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - APPROVE USER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - STATUS
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY TITLE


# verify data
SET FEATURE - TYPE - 03 - VERIFY - DATA - PAGE INBOX
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQ NO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - SENDER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - SEND DATE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - CUSTOMER ID   
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - CONTRACT NO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - NAME
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST BY
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - TEAM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REASON
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST AMT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - APPROVE USER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - STATUS
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA


# click action 
SET FEATURE - TYPE - 03 - CLICK LINK ACTION
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [CLICK] - [LINK] ACTION


# verify lable
SET FEATURE - TYPE - 03 - VERIFY - LABELS - PAGE INBOX
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LOADING]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - CUSTOMER ID
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - CUSTOMER NAME
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - BUSINESS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - CONTRACT NO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUEST NO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUEST STATUS    
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - STATUS DATE    
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUEST DATE 
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REQUESTER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - TEAM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - OD STATUS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - TOTAL O/S BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - CLOSING AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - WAIVE AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REASON
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - REASON NOTE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABELS] - STEP 2 - NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY LABEL PAGE APPROVE REQUEST PENALTY


SET FEATURE - TYPE - 03 - VERIFY - DATA STEP 2 - PAGE INBOX
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER ID
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER NAME
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - BUSINESS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - CONTRACT NO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUEST NO
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUEST STATUS    
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - STATUS DATE    
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUEST DATE 
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REQUESTER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - TEAM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - OD STATUS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - TOTAL O/S BALANCE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - CLOSING AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - WAIVE AMOUNT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REASON
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [DATA] - STEP 2 - REASON NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    VERIFY DATA PAGE APPROVE REQUEST PENALTY
 
# verify send to
SET FEATURE - TYPE - 03 - VERIFY - SEND TO - PAGE INBOX
    [Arguments]    ${user_level}
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABEL] SEND TO    ${user_level} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   SEND TO  


# verify note
SET FEATURE - TYPE - 03 - VERIFY - NOTE - PAGE INBOX
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LABEL] NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   NOTE


# input data note
SET FEATURE - TYPE - 03 - INPUT - NOTE - PAGE INBOX
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [INPUT] - [TEXT] NOTE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   NOTE


# btn approve
SET FEATURE - TYPE - 03 - CLICK - APPROVE - PAGE INBOX
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [CLICK] - [BTN] APPROVE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    CLICK - SEARCH


# popup approve
SET FEATURE - TYPE - 03 - VERIFY - APPROVE POPUP - PAGE INBOX
    # Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [WAIT] - [VERIFY] PAGE
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [TITLE] APPROVE 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP


SET FEATURE - TYPE - 03 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX
    # Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP - CLICK OK
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK


# all featrue before send to 
SET FEATURE - TYPE - 03 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX 
    
    # input data note
    SET FEATURE - TYPE - 03 - INPUT - NOTE - PAGE INBOX

    # กด approve
    SET FEATURE - TYPE - 03 - CLICK - APPROVE - PAGE INBOX     

    # verify pop up
    SET FEATURE - TYPE - 03 - VERIFY - APPROVE POPUP - PAGE INBOX     

    # verify pop up
    SET FEATURE - TYPE - 03 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX  

    # wait loading finish
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [VERIFY] - [LOADING] 

    # เขียนข้อมูล row, column -> Request
    Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=7    data=Approve    # Rows global ,colum fix ,data global

    # logout
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [UNSELCET] - [FRAME] UNIFRAME
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    LOGOUT
    Approve_negotiate_03_page.PAGE INBOX - TYPE 03 - [CLICK] - [BTN] LOGOUT