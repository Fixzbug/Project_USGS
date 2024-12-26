*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     BuiltIn.Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL MARTRIX    ${excel}[RL_matrix_step_yaml]
...             AND    Sync_sheet_excel.GET USER STEP BY STEP LOGIN    ${excel}[RL_User_Login_step]
...             AND    Sync_sheet_excel.GET DATA STOCK FROM EXCEL      ${excel}[RL_data_stock_step_yaml]

*** Test cases ***

TC011 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    STEP_KS1
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    ...                Only run just "Key in step 1"
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    STEP_KS1


TC012 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    STEP_KS2
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    ...                Only run just "Key in step 1 and Key in step 2"
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    STEP_KS2
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION


TC013 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    STEP_VERIFY
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    ...                Only run just "Key in step 1-2 and Verify"
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    STEP_VERIFY
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER


TC014 - CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    STEP_KESSAI
    [Documentation]    Normal Case เคส ลูกค้าใหม่ premier_card
    ...                Run e2e flow "Key in step 1-2, Verify and Kessai"
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    STEP_KESSAI
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI