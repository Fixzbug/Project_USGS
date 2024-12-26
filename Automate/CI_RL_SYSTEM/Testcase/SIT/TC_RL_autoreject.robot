*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL AUTO REJECT      ${excel}[auto_reject_condition_yaml]
...             AND    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]
# Suite Teardown    Common_keyword.INTRANET TEARDOWN

*** Test cases ***
TS0001 - VERIFY KEY IN STEP 1 CASE ID INCORRECT
    [Tags]    TS0001
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ID ลูกค้าไม่ถูกต้อง (3 Type)
            Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0001
        

TS0002 - VERIFY KEY IN STEP 1 CASE AGE CUSTOMER NOT PASS CONDITION < 20 TEAR OR AGE <= 55 YEAR
    [Tags]    TS0002
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี อายุลูกค้าไม่เข้าเงื่อนไข < 20 year or Age >= 55 year (3 Type)
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0002


TS0003 - VERIFY KEY IN STEP 1 CASE CUSTOMER AMLO
    [Tags]    TS0003
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ลูกค้า AMLO (3 Type)
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0003


TS0004 - VERIFY KEY IN STEP 1 CASE CUSTOMER BLACKLIST
    [Tags]    TS0004
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ลูกค้า Blacklist (3 Type)
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0004


TS0005 - VERIFY KEY IN STEP 1 CASE CUSTOMER SALES WRITE OFF
    [Tags]    TS0005
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ลูกค้า Sales Write off (3 Type)
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0005


TS0006 - VERIFY KEY IN STEP 1 CASE CUSTOMER WRITE OFF
    [Tags]    TS0006
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ลูกค้า Write off [Loan business] (3 Type)
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0006


TS0007 VERIFY KEY IN STEP 1 AUTO REJECT IL9
    [Tags]    TS0007
    [Documentation]
    ...    Condition: [Auto Reject] ตรวจสอบ Normal Criteria หากลูกค้าไม่ผ่านเงื่อนไข >> ลูกค้าเก่ามีการ Re-Finance หรือประนอมหนี้กับทางบริษัทแล้ว
    ...    Expected Result: ระบบจะต้อง Auto Reject ทันที โดยแสดง Message แจ้งเตือน Auto Reject IL9: Reject P-Part/Re-finance/Compromise customer ถูกต้อง

    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0007

   
TS0008 - VERIFY KEY IN STEP 1 CASE CUSTOMER FRAUD CUSTOMER
    [Tags]    TS0008
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ลูกค้า Fraud customer (3 Type)
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0008


TS0009 - VERIFY KEY IN STEP 1 CASE CUSTOMER NOT PASS CONDITION PAYMENT HISTORY
    [Tags]    TS0009
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ลูกค้า ลูกค้าไม่ผ่านเงื่อนไข Payment History (3 Type)
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0009


TS0010 - VERIFY KEY IN STEP 1 CASE CUSTOMER RL1 ACTIVE 
    [Tags]    TS0010
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ลูกค้า RL1 Active (3 Type)
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0010


TS0011 - VERIFY KEY IN STEP 1 CASE CUSTOMER REJECT & BLACKLIST
    [Tags]    TS0011
    [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ลูกค้า Reject & Blacklist (3 Type)
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT CASE HAVE POPUP NCB AND POPUP SENDDOC    TS0011


# TS0012 - VERIFY KEY IN STEP 1 CASE CUSTOMER NOT PASS CODITION PAYMENT HISTORY
#     [Tags]    TS0012
#     [Documentation]    [Auto Reject] ตรวจสอบ Key in Step-1 กรณี ลูกค้า ลูกค้าไม่ผ่านเงื่อนไข Payment History (3 Type)
#     Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0012


TS0012 - VERIFY KEY IN STEP 1 CASE CUSTOMER FOREIGNER
    [Tags]    TS0012
    [Documentation]    [Auto Reject] ตรวจสอบ Normal Criteria หากลูกค้าไม่ผ่านเงื่อนไข >> ชาวต่างชาติ 
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0012


TS0013 - VERIFY KEY IN STEP 1 CASE INCORRECT ID BY GOVERNMENT
    [Tags]    TS0013
    [Documentation]    [Auto Reject] ตรวจสอบ Normal Criteria หากลูกค้าไม่ผ่านเงื่อนไข >> Incorrect ID by Government
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0013


TS0014 - VERIFY KEY IN STEP 1 
    [Tags]    TS0014
    [Documentation]    [Auto Reject] 
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0014


TS0015 - VERIFY KEY IN STEP 1 
    [Tags]    TS0015
    [Documentation]    [Auto Reject] 
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0015


TS0016 - VERIFY KEY IN STEP 1 
    [Tags]    TS0016
    [Documentation]    [Auto Reject] 
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0016


TS0017 - VERIFY KEY IN STEP 1 
    [Tags]    TS0017
    [Documentation]    [Auto Reject] 
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0017

    
TS0018 - VERIFY KEY IN STEP 1 
    [Tags]    TS0018
    [Documentation]    [Auto Reject] 
    Key_in_step_1_page.SET FOR LOOP - KEYINSTEP 1 AUTO REJECT    TS0018