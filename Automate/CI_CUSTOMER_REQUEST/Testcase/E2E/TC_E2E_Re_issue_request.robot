*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore
Suite Setup    Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel_file}[data_stock_re_issue_yaml]
Test Teardown    Common_keyword.CLOSE ALL BROWSERS TEARDOWN

# Readme
# ต้องเล่นยาว request ต่อ approve 
# ถ้าหาเล่น request ผ่าน status = PASS 
# ถ้าจะเล่น approve ต้อง เล่นต่อ id เก่าและต้องไม่ error ถึงจะเล่นซ่อมได้ 
# ถ้าเล่นยาว จะผ่านทั้งหมด
# ถ้าเล่นซ่อมก่อนหน้าต้องไม่ status = ERROR

*** Test cases ***

TC001 - FULL RE ISSUE - REQUEST
    [Tags]    TC001
    [Documentation]    for jenkins file only

    Common_feature.SET - LOGIN    excel_name=data_stock_re_issue_yaml    sheet_name=USER    row=request
    Request_re_issue_feature.SET FEATURE - GO TO - RE - ISSUE CONTRACT    # login web
    Request_re_issue_feature.SET FEATURE - SELECT MENU - RE - ISSUE CONTRACT    # select menu
    Common_feature.GET ID CARD FROM EXCEL DATA STOCK
    Common_feature.WRITE STATUS DATA STOCK ID CARD    data_stock_re_issue_yaml    PENDING
    Common_feature.GET CARD FROM EXCEL DATA STOCK
    Common_feature.WRITE STATUS DATA STOCK CARD    data_stock_re_issue_yaml     PENDING
    Request_re_issue_feature.SET FEATURE - INPUT CRITIRIA SEARCH REQUEST - RE - ISSUE - CLICK SAVE    # click save
    Request_re_issue_feature.SET FEATURE - MODAL REQUEST - RE - ISSUE - CONFIRM
    Common_feature.WRITE STATUS DATA STOCK ID CARD    data_stock_re_issue_yaml    USE
    Common_feature.WRITE STATUS DATA STOCK CARD    data_stock_re_issue_yaml     USE
    

TC002 - FULL RE ISSUE - APPROVE
    [Tags]    TC001
    [Documentation]    for jenkins file only

    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    Actual_result_re_issue_yaml    Results    PASS_Request    re-issue
    Common_feature.SET - LOGIN    excel_name=data_stock_re_issue_yaml    sheet_name=USER    row=approve
    Request_re_issue_feature.SET FEATURE - GO TO - RE - ISSUE CONTRACT    # login web
    Request_re_issue_feature.SET FEATURE - SELECT MENU - RE - ISSUE CONTRACT    # select menu
    Request_re_issue_feature.SET FEATURE - INPUT CRITIRIA SEARCH APPROVE - RE - ISSUE - CLICK SAVE    # click save
    Request_re_issue_feature.SET FEATURE - MODAL APPROVE - RE - ISSUE - CONFIRM
    

TC003 - FULL RE ISSUE - REQUEST
    [Tags]    TC003
    [Documentation]    for bat file only

    Common_feature.SET - LOGIN    excel_name=data_stock_re_issue_yaml    sheet_name=USER    row=request
    Request_re_issue_feature.SET FEATURE - GO TO - RE - ISSUE CONTRACT    # login web
    Request_re_issue_feature.SET FEATURE - SELECT MENU - RE - ISSUE CONTRACT    # select menu
    Common_feature.GET ID CARD FROM EXCEL DATA STOCK
    Common_feature.WRITE STATUS DATA STOCK ID CARD    data_stock_re_issue_yaml    PENDING
    Common_feature.GET CARD FROM EXCEL DATA STOCK
    Common_feature.WRITE STATUS DATA STOCK CARD    data_stock_re_issue_yaml     PENDING
    Request_re_issue_feature.SET FEATURE - INPUT CRITIRIA SEARCH REQUEST - RE - ISSUE - CLICK SAVE    # click save
    Request_re_issue_feature.SET FEATURE - MODAL REQUEST - RE - ISSUE - CONFIRM
    Common_feature.WRITE STATUS DATA STOCK ID CARD    data_stock_re_issue_yaml    USE
    Common_feature.WRITE STATUS DATA STOCK CARD    data_stock_re_issue_yaml     USE
 

TC004- FULL RE ISSUE - APPROVE
    [Tags]    TC004
    [Documentation]    for bat file only
    
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    Actual_result_re_issue_yaml    Results    PASS_Request    re-issue
    Common_feature.SET - LOGIN    excel_name=data_stock_re_issue_yaml    sheet_name=USER    row=approve
    Request_re_issue_feature.SET FEATURE - GO TO - RE - ISSUE CONTRACT    # login web
    Request_re_issue_feature.SET FEATURE - SELECT MENU - RE - ISSUE CONTRACT    # select menu
    Request_re_issue_feature.SET FEATURE - INPUT CRITIRIA SEARCH APPROVE - RE - ISSUE - CLICK SAVE    # click save
    Request_re_issue_feature.SET FEATURE - MODAL APPROVE - RE - ISSUE - CONFIRM

    