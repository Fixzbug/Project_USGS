*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Keywords ***
SET FEATURE - TYPE - 08 - GO TO - PAGE INBOX - BY USER LEVEL
    [Arguments]    ${user_level}
    Approve_negotiate_08_page.PAGE INBOX - TYPE 08 - INPUT USENAME AND PASSWORD BY USER LEVEL    ${user_level}      
    Approve_negotiate_08_page.PAGE INBOX - TYPE 08 - [CLICK] - LINK
    Approve_negotiate_08_page.PAGE INBOX - TYPE 08 - [WAIT] - [VERIFY] PAGE
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    WELCOME - USER - ${user_level}


SET FEATURE - TYPE - 08 - SELECT MENU - PAGE INBOX
    [Arguments]    ${menu}    ${sub_menu}
    Approve_negotiate_08_page.PAGE INBOX - TYPE 08 - [CLICK] - [MENU]    ${menu} 
    Approve_negotiate_08_page.PAGE INBOX - TYPE 08 - [CLICK] - [SUB MENU]    ${sub_menu} 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    MENU

# Verify title - page inbox
VERIFY FEATURE - DATA TITLE - PAGE INBOX - [TYPE: 08]
    Common_keyword.SELECT IFRAME     ${ifrmae_req_waive_locator}
    # Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE] - REQUEST TYPE
    # Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE] - REQUESTER
    # Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE] - REQUEST NO.
    # Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER ID


# Input req type, reqter, req no,cust id and cont no
SET FEATURE - INPUT DATA - PAGE INBOX - [TYPE: 08]
    Approve_negotiate_08_page.PAGE INBOX - [INPUT] - REQUEST TYPE
    Approve_negotiate_08_page.PAGE INBOX - [INPUT] - REQUESTER
    Approve_negotiate_08_page.PAGE INBOX - [INPUT] - REQUEST NO.
    Approve_negotiate_08_page.PAGE INBOX - [INPUT] - CUSTOMER ID
    Approve_negotiate_08_page.PAGE INBOX - [INPUT] - CONTRACT NO
    Approve_negotiate_08_page.PAGE INBOX - [CLICK] - [BUTTON] - SEARCH
    BuiltIn.Sleep   1s
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INBOX
    BuiltIn.Sleep   3s


# Verify title table - page inbox
VERIFY FEATURE - DATA TITLE TABLE - PAGE INBOX - [TYPE: 08]
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NO    #Fix Code
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQ NO.
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SENDER
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - SEND DATE
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE 2
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CUSTOMER ID
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - CONTRACT NO.
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - NAME
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST BY
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - TEAM
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REASON
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - REQUEST AMT
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - APPROVE USER
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - STATUS
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [TITLE][TABLE] - ACTION    #Fix Code


# Verify value table - page inbox
VERIFY FEATURE - DATA VALUE TABLE - PAGE INBOX - [TYPE: 08]
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NO    #Fix Code
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQ NO.
    # Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SENDER
    # Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - SEND DATE
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE 2
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CUSTOMER ID
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - CONTRACT NO.
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - NAME
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST BY
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - TEAM
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REASON
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - REQUEST AMT
    # Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - APPROVE USER
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - STATUS
    Approve_negotiate_08_page.PAGE INBOX - [VERIFY] - [VALUE][TABLE] - ACTION    #Fix Code
    Approve_negotiate_08_page.PAGE INBOX - [CLICK] - [TEXT] - ACTION


# Verify title - page approve negotiate
VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE - [TYPE: 08]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_head_approve_negotiate_locator}    10s    # Head
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST TYPE
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST NO.
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUESTER
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST DATE
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER ID
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST STATUS
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT NO
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - STATUS DATE    # Fix Code
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER NAME
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CALL CENTER
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - NUMBER OF CHILD
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TEAM
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - AGE
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - OD STATUS
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - LAST SALARY
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT TYPE
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CUSTOMER STATUS
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT DATE
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - BUSINESS
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - WO DATE
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - CONTRACT STATUS
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TIME OF PAYMENT
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - DUE
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TIMES OF PENALTY
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REQUEST TIMES
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - LAST REQUEST NO


# Verify value - page approve negotiate
VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE - [TYPE: 08]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST NO.
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUESTER
    # BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST DATE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER ID
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST STATUS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT NO
    # BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - STATUS DATE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER NAME
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CALL CENTER
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - NUMBER OF CHILD
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TEAM
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - AGE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - OD STATUS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST SALARY
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT TYPE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CUSTOMER STATUS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT DATE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - BUSINESS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - WO DATE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - CONTRACT STATUS
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TIME OF PAYMENT
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - DUE
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TIMES OF PENALTY
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REQUEST TIMES
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST REQUEST NO


# 1. Negotiate discount detail
# Verify title - page approve negotiate
VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 08]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]


# Verify value - page approve negotiate
VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 08]
    BuiltIn.Run Keyword And Continue On Failure        Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Run Keyword And Continue On Failure        Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    # BuiltIn.Run Keyword And Continue On Failure        Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Run Keyword And Continue On Failure        Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    INBOX    APPROVE_NEGOTIATE_01

# 3. Request detail
# Verify title - page approve negotiate
VERIFY FEATURE - DATA TITLE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 08]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - SEND TO [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - REJECT REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]


# Verify value - page approve negotiate
VERIFY FEATURE - DATA VALUE - PAGE APPROVE NEGOTIATE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL] - [TYPE: 08]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - HAVE JOB [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - WHO REQUEST [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - WHO PAID [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]
    BuiltIn.Run Keyword And Continue On Failure    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [VERIFY] - [VALUE] - REASON NOTE [NEGOTIATE DETAIL] - [3. REQUEST DETAIL]

# verify send to
SET FEATURE - TYPE - 08 - VERIFY - SEND TO - PAGE INBOX
    [Arguments]    ${user_level}
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - TYPE 08 - [VERIFY] - [LABEL] SEND TO    ${user_level} 
    # Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW   SEND TO  


# btn approve
SET FEATURE - TYPE - 08 - CLICK - APPROVE - PAGE INBOX
    Approve_negotiate_08_page.PAGE INBOX - TYPE 08 - [CLICK] - [BTN] APPROVE
    # Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    CLICK - SEARCH


# popup approve
SET FEATURE - TYPE - 08 - VERIFY - APPROVE POPUP - PAGE INBOX
    Approve_negotiate_08_page.PAGE INBOX - TYPE 08 - [VERIFY] - [TITLE] APPROVE 
    # Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP


SET FEATURE - TYPE - 08 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX
    # Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    APPROVE POPUP - CLICK OK
    Approve_negotiate_08_page.PAGE INBOX - TYPE 08 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK



# all featrue before send to 
SET FEATURE - TYPE - 08 - APPROVE POPUP AND SAVE DATA - APPROVE REQUEST PENALTY - PAGE INBOX 
    
    # input data note
    Approve_negotiate_08_page.PAGE APPROVE NEGOTIATE - [INPUT] - NOTE

    # กด approve
    SET FEATURE - TYPE - 08 - CLICK - APPROVE - PAGE INBOX     

    # verify pop up
    SET FEATURE - TYPE - 08 - VERIFY - APPROVE POPUP - PAGE INBOX     

    # verify pop up
    SET FEATURE - TYPE - 08 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX  
    
    # write data 
    Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_08}    row=${Rows}    column=107    data=Approve    # Rows global ,colum fix ,data global

    # logout
    Common_keyword.UNSELECT IFRAME   
    Common_keyword.WAITING FOR DATA UPDATE    1s 
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}  

 
