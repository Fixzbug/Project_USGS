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
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_000    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION



TC001 - CARD UMAY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC001
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card  
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_001    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION



TC002 - CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC002
    [Documentation]    Normal Case เคส ลูกค้าใหม่ premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_002    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION



TC003 - VIRUAL CARD UAMY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC003
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_umay_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_003    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION



TC004 - VIRUAL CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC004
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_004    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION



TC005 - CARD UMAY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC005
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_005    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION



TC006 - CARD PREMIER - NORMAL CASE NEW CUSTOMER
    [Tags]    TC006
    [Documentation]    Normal Case เคส ลูกค้าใหม่ premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_006    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION



TC007 - VIRUAL CARD UAMY+ - NORMAL CASE NEW CUSTOMER
    [Tags]    TC007
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_umay_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_007    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION



TC008 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC008
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_008    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
 


TC009 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC009
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_009    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
 

 
TC010 - VIRUAL PREMIER CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TC010
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
    Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    TC_010    Change_to_KS2    
    Key_in_step_2_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
 