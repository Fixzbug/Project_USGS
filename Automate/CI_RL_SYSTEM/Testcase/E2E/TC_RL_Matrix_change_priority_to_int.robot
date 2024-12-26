*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     BuiltIn.Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL MARTRIX    ${excel}[RL_matrix_yaml]
...             AND    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]
...             AND    Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_yaml]

*** Variables ***
${state_next_step}    True

*** Test cases ***

TC000 - CARD UMAY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC000
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_000    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC001 - CARD UMAY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC001
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_001    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC002 - CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC002
    [Documentation]    Normal Case เคส ลูกค้าใหม่ premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_002    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC003 - VIRUAL CARD UAMY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC003
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_umay_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_003    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC004 - VIRUAL CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC004
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_004    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC005 - CARD UMAY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC005
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_005    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC006 - CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC006
    [Documentation]    Normal Case เคส ลูกค้าใหม่ premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_006    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC007 - VIRUAL CARD UAMY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC007
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_umay_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_007    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC008 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC008
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_008    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC009 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC009
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_009    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL


TC010 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC010
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_010    KS2  
    Changepriority_feature.SET FEATURE - CHANGE PRIORITY    MANUAL