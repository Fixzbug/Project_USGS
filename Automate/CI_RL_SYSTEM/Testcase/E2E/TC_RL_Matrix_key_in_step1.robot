*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     BuiltIn.Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL MARTRIX    ${excel}[RL_matrix_yaml]
...             AND    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]
...             AND    Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_yaml]


*** Test cases ***


TC000 - CARD UMAY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC000
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_000    virual_umay_card


TC001 - CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC001
    [Documentation]    Normal Case เคส ลูกค้าใหม่ premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_001    virual_umay_card


TC002 - VIRUAL CARD UAMY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC002
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_umay_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_002    virual_umay_card


TC003 - VIRUAL CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC003
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_003    virual_umay_card


TC004 - CARD UMAY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC004
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_004    virual_umay_card


TC005 - CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC005
    [Documentation]    Normal Case เคส ลูกค้าใหม่ premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_005    virual_umay_card


TC006 - VIRUAL CARD UAMY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC006
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_umay_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_006    virual_umay_card


TC007 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC007
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_007    virual_umay_card


TC008 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC008
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_008    virual_umay_card


TC009 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC009
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_009    virual_umay_card


TC010 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC010
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Key_in_step_1_feature.SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE    TC_010    virual_umay_card

