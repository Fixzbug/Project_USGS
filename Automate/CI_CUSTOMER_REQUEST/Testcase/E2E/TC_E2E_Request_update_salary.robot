*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore
Test Setup    Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel_file}[data_stock_update_salary_yaml]
Test Teardown    Common_keyword.CLOSE ALL BROWSERS TEARDOWN

*** Test cases ***

TC001 - REQUEST CUSTOMER REQUEST UPDATE SALARY
    [Tags]    TC001
    [Documentation]    for jenkins file only
    
    Common_feature.SET - LOGIN    excel_name=data_stock_update_salary_yaml    sheet_name=USER    row=request
    Request_update_salary_feature.SET FEATURE - GO TO - REQUEST UPDATE SALARY   # login web
    Request_update_salary_feature.SET FEATURE - SELECT MENU - REQUEST UPDATE SALARY    # select menu
    Common_feature.GET ID CARD FROM EXCEL DATA STOCK
    Common_feature.WRITE STATUS DATA STOCK ID CARD    data_stock_update_salary_yaml    PENDING
    Request_update_salary_feature.SET FEATURE - INPUT CRITIRIA SEARCH REQUEST - REQUEST UPDATE SALARY - CLICK SAVE    # click save
    Request_update_salary_feature.SET FEATURE - MODAL REQUEST - REQUEST UPDATE SALARY - CONFIRM
    Common_feature.WRITE STATUS DATA STOCK ID CARD    data_stock_re_issue_yaml    USE


TC002 - INTERVIEW CUSTOMER REQUEST UPDATE SALARY
    [Tags]    TC001
    [Documentation]    for jenkins file only

    Common_feature.SET - LOGIN    excel_name=data_stock_update_salary_yaml    sheet_name=USER    row=interview
    Request_update_salary_feature.SET FEATURE - GO TO - REQUEST UPDATE SALARY   # login web
    Request_update_salary_feature.SET FEATURE - SELECT MENU - REQUEST UPDATE SALARY    # select menu
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    Actual_result_update_salary_yaml    Results    PASS_Request    update-salary
    Request_update_salary_feature.SET FEATURE - INPUT CRITIRIA SEARCH INTERVIEW - REQUEST UPDATE SALARY - CLICK SAVE    # click save
    Request_update_salary_feature.SET FEATURE - MODAL INTERVIEW - REQUEST UPDATE SALARY - CONFIRM


TC003 - APPROVE CUSTOMER REQUEST UPDATE SALARY
    [Tags]    TC001
    [Documentation]    for jenkins file only
   
    Common_feature.SET - LOGIN    excel_name=data_stock_update_salary_yaml    sheet_name=USER    row=approve
    Request_update_salary_feature.SET FEATURE - GO TO - REQUEST UPDATE SALARY   # login web
    Request_update_salary_feature.SET FEATURE - SELECT MENU - REQUEST UPDATE SALARY    # select menu
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    Actual_result_update_salary_yaml    Results    PASS_Interview    update-salary
    Request_update_salary_feature.SET FEATURE - INPUT CRITIRIA SEARCH APPROVE - REQUEST UPDATE SALARY - CLICK SAVE    # click save
    Request_update_salary_feature.SET FEATURE - MODAL INTERVIEW - REQUEST UPDATE SALARY - CONFIRM
