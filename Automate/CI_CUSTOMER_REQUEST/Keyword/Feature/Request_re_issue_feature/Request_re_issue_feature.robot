*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Keywords ***

SET FEATURE - GO TO - RE - ISSUE CONTRACT
    Request_re_issue_page.RE ISSUE PAGE - INPUT USENAME AND PASSWORD      
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - LINK
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - [SELECT] BRANCH
    Request_re_issue_page.RE ISSUE PAGE - [INPUT] - [TEXT] BRANCH  
    Request_re_issue_page.RE ISSUE PAGE - [PRESS KEY] - ENTER  
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - [BTN] OK
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    REQ    WELCOME


SET FEATURE - SELECT MENU - RE - ISSUE CONTRACT
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - [MENU] 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    REQ    MENU


SET FEATURE - INPUT CRITIRIA SEARCH REQUEST - RE - ISSUE - CLICK SAVE
    Request_re_issue_page.RE ISSUE PAGE - [INPUT] - [TEXT] ID NUMBER
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - [BTN] SEARCH
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    REQ    ID NUMBER
    Request_re_issue_page.RE ISSUE PAGE - [INPUT]- [VERIFY] - [MODAL] VERIFY CHECK QUESTION PASS THREE QUESTION SHOULD BE - [CLICK] PASS 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    REQ    CHECK QUESTION PASS
    Request_re_issue_page.RE ISSUE PAGE - [WAIT] - [VERIFY] PAGE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] CUSTOMER NAME
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] CONTRACT NO
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] STATUS
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] CARD TYPE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] CARD NO
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] DUE DATE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] CREDIT LIMIT
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] CREDIT AVAILABLE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] RL LIMIT
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] RL AVAILABLE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] OUTSTANDING BAL
    Request_re_issue_page.RE ISSUE PAGE - [INPUT] - [TEXT] SLIDE CARD
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] SLIDE CARD
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] RE ENTRY CARD NO
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE     REQ    VERIFY REQUEST PASS CLICK SAVE
    Request_re_issue_page.RE ISSUE PAGE - [WAIT] - [VERIFY] PAGE
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - [BTN] SAVE 


SET FEATURE - MODAL REQUEST - RE - ISSUE - CONFIRM
    Request_re_issue_page.RE ISSUE PAGE - [VERIFY] - [MODAL] CONFIRM
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE     REQ    VERIFY CONFIRM REQUEST - CLICK OK
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - [BTN] SAVE


SET FEATURE - INPUT CRITIRIA SEARCH APPROVE - RE - ISSUE - CLICK SAVE
    Request_re_issue_page.RE ISSUE PAGE - [INPUT] - [TEXT] APPROVE - ID NUMBER
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - [BTN] APPROVE SEARCH
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    REQ    APPROVE PAGE
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - [BTN] APPROVE SELECT
    Request_re_issue_page.RE ISSUE PAGE - [WAIT] - [VERIFY] PAGE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] ID NUMBER
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CUSTOMER NAME
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CONTRACT NO
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] STATUS
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CARD TYPE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CARD NO
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] DUE DATE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CREDIT LIMIT
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] CREDIT AVAILABLE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] RL LIMIT
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] RL AVAILABLE
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] OUTSTANDING BAL
    Request_re_issue_page.RE ISSUE PAGE - [GET] - [TEXT] - [VERIFY] RE ENTRY CARD NO



SET FEATURE - MODAL APPROVE - RE - ISSUE - CONFIRM
    Request_re_issue_page.RE ISSUE PAGE - [CLICK] - [BTN] APPROVE 
    Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE     REQ    VERIFY CONFIRM APPROVE - CLICK OK
    Request_re_issue_page.RE ISSUE PAGE - [VERIFY] - [MODAL] APPROVE CONFIRM
