*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Keywords ***
# Verify title - page Inquiry
VERIFY FEATURE - DATA TITLE - PAGE INQUIRY
    SeleniumLibrary.Select Frame     ${ifrmae_req_waive_locator}
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE] - REQUEST TYPE
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE] - REQUESTER
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE] - REQUEST NO.
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE] - CUSTOMER ID


# Input req type, reqter, req no,cust id and cont no
SET FEATURE - INPUT DATA - PAGE INQUIRY
    Inquiry_10_page.PAGE INQUIRY - [INPUT] - REQUEST TYPE
    Inquiry_10_page.PAGE INQUIRY - [INPUT] - REQUESTER
    Inquiry_10_page.PAGE INQUIRY - [INPUT] - REQUEST NO.
    Inquiry_10_page.PAGE INQUIRY - [INPUT] - CUSTOMER ID
    Inquiry_10_page.PAGE INQUIRY - [INPUT] - CONTRACT NO
    Inquiry_10_page.PAGE INQUIRY - [CLICK] - [BUTTON] - SEARCH
    BuiltIn.Sleep   3s


# Verify title table - page inbox
VERIFY FEATURE - DATA TITLE TABLE - PAGE INQUIRY
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQ NO.
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - SENDER
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - SEND DATE
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST TYPE
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST DESC.    #Fix Code
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - CUSTOMER ID
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - CONTRACT NO.
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - NAME
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - BIZ    #Fix Code
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST BY
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - TEAM
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REASON
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - REQUEST AMT
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - APPROVE USER
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - STATUS
    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [TITLE][TABLE] - VIEW    #Fix Code


# Verify value table - page Inquiry
VERIFY FEATURE - DATA VALUE TABLE - PAGE INQUIRY
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQ NO.
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - SENDER
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - SEND DATE
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST TYPE
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST DESC.
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - CUSTOMER ID
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - CONTRACT NO.    # Dash Ex. 3969-001-000643689
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - NAME
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - BIZ    # Only RL
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST BY
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - TEAM
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REASON
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - REQUEST AMT
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - APPROVE USER
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - STATUS    #Fix Code
    BuiltIn.Run Keyword And Continue On Failure    Inquiry_10_page.PAGE INQUIRY - [VERIFY] - [VALUE][TABLE] - VIEW    #Fix Code
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    WORKFLOW    INQUIRY



# Write status (finished)
SET FEATURE - WRITE DATA - PAGE INQUIRY [STATUS]
    Inquiry_10_page.PAGE INQUIRY - WRITE DATA - STATUS FINISHED