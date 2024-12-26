*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL VERIFY CONDITION      ${excel}[verify_condition_key_2_yaml]
...             AND    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]

# Suite Teardown    Common_keyword.INTRANET TEARDOWN

*** Test cases ***
Suite Setup
TS0013 - VERIFY SALARY CONDITION KEY IN STEP 2
    [Tags]    TS0013
    [Documentation]    ตรวจสอบ Key in Step-2 กรณี ลูกค้าเงินเดือน < 7,000
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI (VIRUAL CARD) VERIFY CONDITION AUTO REJECT      Walkin    Walkin_TS0013


TS0014 - VERIFY CONDITION TCL = 0 KEY IN STEP 1 TO KESSAI
    [Tags]    TS0014
    [Documentation]    ตรวจสอบ Key in Step-2 กรณี ลูกค้า เข้าเงื่อนไข TCL = 0 : อาชีพ :  011 : เจ้าของธุรกิจ-จดทะเบียน
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI (VIRUAL CARD) VERIFY CONDITION TCL = 0      Walkin    Walkin_TS0014


TS0015 - VERIFY CONDITION TCL = 0 KEY IN STEP 1 TO KESSAI
    [Tags]    TS0015
    [Documentation]    ตรวจสอบ Key in Step-2 กรณี ลูกค้า เข้าเงื่อนไข TCL = 0 : อาชีพ :  012 : เจ้าของธุรกิจ-ไม่จดทะเบียน
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI (VIRUAL CARD) VERIFY CONDITION TCL = 0      Walkin    Walkin_TS0015


TS0016 - VERIFY CONDITION TCL = 0 KEY IN STEP 1 TO KESSAI
    [Tags]    TS0016
    [Documentation]    ตรวจสอบ Key in Step-2 กรณี ลูกค้า เข้าเงื่อนไข TCL = 0 : อาชีพ :  060 : ว่างงาน
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI (VIRUAL CARD) VERIFY CONDITION TCL = 0      Walkin    Walkin_TS0016


TS0017 - VERIFY CONDITION COMPANY BLACKLIST
    [Tags]    TS0017
    [Documentation]    ตรวจสอบ Key in Step-2 กรณี Permanent Company Blacklist
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI (VIRUAL CARD) VERIFY CONDITION COMPANY BLACKLIST AUTO REJECT      Walkin    Walkin_TS0017
