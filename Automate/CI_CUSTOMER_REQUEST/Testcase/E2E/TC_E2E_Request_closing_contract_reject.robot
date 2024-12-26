*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore
Suite Setup    Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel_file}[data_stock_closing_contract_yaml]
Test Teardown    Common_keyword.CLOSE ALL BROWSERS TEARDOWN

# Readme
# ต้องเล่นยาว request ต่อ approve 
# ถ้าหาเล่น request ผ่าน status = PASS 
# ถ้าจะเล่น approve ต้อง เล่นต่อ id เก่าและต้องไม่ error ถึงจะเล่นซ่อมได้ 
# ถ้าเล่นยาว จะผ่านทั้งหมด
# ถ้าเล่นซ่อมก่อนหน้าต้องไม่ status = ERROR

*** Test Cases *** 

TC001 - REQUEST CLOSING CONTRACT PAGE      
    [Tags]    TC002

    Common_feature.SET - LOGIN    excel_name=data_stock_closing_contract_yaml    sheet_name=USER    row=request
    Request_closing_contract_feature.SET FEATURE - GO TO - PAGE REQUEST CLOSING CONTRACT    # login web
    Request_closing_contract_feature.SET FEATURE - SELECT MENU - PAGE REQUEST CLOSING CONTRACT    # select menu
    Common_feature.GET ID CARD FROM EXCEL DATA STOCK
    Common_feature.WRITE STATUS DATA STOCK ID CARD    data_stock_closing_contract_yaml    PENDING
    Request_closing_contract_feature.SET FEATURE - INPUT CRITIRIA SEARCH REQUEST - PAGE REQUEST CLOSING - CLICK SAVE    # click save
    Request_closing_contract_feature.SET FEATURE - MODAL REQUEST - PAGE REQUEST CLOSING CONTRACT - CONFIRM
    Common_feature.WRITE STATUS DATA STOCK ID CARD    data_stock_closing_contract_yaml    USE


TC002 - REJECT CLOSING CONTRACT PAGE      
    [Tags]    TC002

    Common_feature.SET - LOGIN    excel_name=data_stock_closing_contract_yaml    sheet_name=USER    row=approve
    Request_closing_contract_feature.SET FEATURE - GO TO - PAGE REQUEST CLOSING CONTRACT    # login web
    Request_closing_contract_feature.SET FEATURE - SELECT MENU - PAGE REQUEST CLOSING CONTRACT    # select menu
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    Actual_result_closing_contract_yaml    Results    PASS_Request    closing
    Request_closing_contract_feature.SET FEATURE - INPUT CRITIRIA SEARCH APPROVE - PAGE REQUEST CLOSING - CLICK SAVE    # click save
    Request_closing_contract_feature.SET FEATURE - MODAL REJECT - PAGE REQUEST CLOSING CONTRACT - CONFIRM
  


