*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     BuiltIn.Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL MARTRIX    ${excel}[RL_matrix_yaml]
...             AND    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]
...             AND    Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_yaml]
Test Teardown    BuiltIn.Run Keyword If Test Failed    Capture_screen.CAPTURE SCREEN ON FAILED


*** Test cases ***

TC000 - CARD UMAY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC000_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_000
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION


TC001 - CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC001_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_001
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


TC002 - VIRUAL CARD UAMY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC002_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_umay_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_002
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


TC003 - VIRUAL CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC003_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_003
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


TC004 - CARD UMAY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC004_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_004
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


TC005 - CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC005_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_005
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


TC006 - VIRUAL CARD UAMY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC006_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_umay_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_006
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


TC007 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC007_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_007
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


TC008 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC008_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_008
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


TC009 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC009_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_009
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


TC010 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC010_RANK
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_010
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL
    Kessai_verify_call_feature.SET FEATURE - E2E MATRIX CASE KESSAI


# REPAIR CASE
#     BuiltIn.Set Global Variable    ${Excel_Actual_Result}    RL_Actual_result_rank_yaml
#     ${state_next_step}    BuiltIn.Set Variable    KS1
#     BuiltIn.Set global Variable     ${state_next_step}
#     Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_000    Change_to_KS2