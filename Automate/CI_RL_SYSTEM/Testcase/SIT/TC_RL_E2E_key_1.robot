*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL PENDING      ${excel}[RL_E2E_key_1_yaml]
...             AND    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]
...             AND    Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_yaml]
# Suite Teardown    Common_keyword.INTRANET TEARDOWN

*** Test cases ***

# *** VIRUAL_UMAY_CARD ***

TS0001_VIRUAL_UMAY_CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TS0001_virual_umay_card
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0001    virual_umay_card
        

TS0002_VIRUAL_UMAY_CARD - NORMAL CASE OLD CUSTOMER
    [Tags]    TS0002_virual_umay_card
    [Documentation]    Normal Case เคส ลูกค้าเก่า virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0002    virual_umay_card


TS0003_VIRUAL_UMAY_CARD - PENDING CASE NEW CUSTOMER
    [Tags]    TS0003_virual_umay_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0003    virual_umay_card


TS0004_VIRUAL_UMAY_CARD - PENDING CASE OLD CUSTOMER
    [Tags]    TS0004_virual_umay_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0004    virual_umay_card


TS0005_VIRUAL_UMAY_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER
    [Tags]    TS0005_virual_umay_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0005    virual_umay_card


TS0006_VIRUAL_UMAY_CARD - PENDING HAVE CONSENT CASE OLD CUSTOMER
    [Tags]    TS0006_virual_umay_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0006    virual_umay_card


TS0007_VIRUAL_UMAY_CARD - PENDING SEND DOC CASE NEW CUSTOMER
    [Tags]    TS0007_virual_umay_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0007    virual_umay_card


TS0008_VIRUAL_UMAY_CARD - PENDING SEND DOC CASE OLD CUSTOMER
    [Tags]    TS0008_virual_umay_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0008    virual_umay_card


TS0009_VIRUAL_UMAY_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT]
    [Tags]    TS0009_VUC_HC_RJ
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0009    virual_umay_card    reject
        

TS0010_VIRUAL_UMAY_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [CANCEL]
    [Tags]    TS0010_VUC_HC_CC
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0010    virual_umay_card    cancel


TS0011_VIRUAL_UMAY_CARD - PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT]
    [Tags]    TS0011_VUC_SD_RJ
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0011    virual_umay_card    reject


TS0012_VIRUAL_UMAY_CARD - PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [CANCEL]
    [Tags]    TS0012_VUC_SD_CC
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0012    virual_umay_card    cancel


# *** VIRUAL_PREMIER_CARD ***

TS0001_VIRUAL_PREMIER_CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TS0001_virual_premier_card
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0001    virual_premier_card
        

TS0002_VIRUAL_PREMIER_CARD - NORMAL CASE OLD CUSTOMER
    [Tags]    TS0002_virual_premier_card
    [Documentation]    Normal Case เคส ลูกค้าเก่า virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0002    virual_premier_card


TS0003_VIRUAL_PREMIER_CARD - PENDING CASE NEW CUSTOMER
    [Tags]    TS0003_virual_premier_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0003    virual_premier_card


TS0004_VIRUAL_PREMIER_CARD - PENDING CASE OLD CUSTOMER
    [Tags]    TS0004_virual_premier_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0004    virual_premier_card


TS0005_VIRUAL_PREMIER_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER
    [Tags]    TS0005_virual_premier_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0005    virual_premier_card


TS0006_VIRUAL_PREMIER_CARD - PENDING HAVE CONSENT CASE OLD CUSTOMER
    [Tags]    TS0006_virual_premier_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0006    virual_premier_card


TS0007_VIRUAL_PREMIER_CARD - PENDING SEND DOC CASE NEW CUSTOMER
    [Tags]    TS0007_virual_premier_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0007    virual_premier_card


TS0008_VIRUAL_PREMIER_CARD - PENDING SEND DOC CASE OLD CUSTOMER
    [Tags]    TS0008_virual_premier_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0008    virual_premier_card


TS0009_VIRUAL_PREMIER_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT]
    [Tags]    TS0009_VPC_HC_RJ
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0009    virual_premier_card    reject


TS0010_VIRUAL_PREMIER_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [CANCEL]
    [Tags]    TS0010_VPC_HC_CC
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0010    virual_premier_card    cancel


TS0011_VIRUAL_PREMIER_CARD - PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT]
    [Tags]    TS0011_VPC_SD_RJ
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0011    virual_premier_card    reject


TS0012_VIRUAL_PREMIER_CARD - PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [CANCEL]
    [Tags]    TS0012_VPC_SD_CC
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0012    virual_premier_card    cancel


# *** UMAY_CARD ***

TS0001_UMAY_CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TS0001_umay_card
    [Documentation]    Normal Case เคส ลูกค้าใหม่ umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0001    umay_card
        

TS0002_UMAY_CARD - NORMAL CASE OLD CUSTOMER
    [Tags]    TS0002_umay_card
    [Documentation]    Normal Case เคส ลูกค้าเก่า umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0002    umay_card


TS0003_UMAY_CARD - PENDING CASE NEW CUSTOMER
    [Tags]    TS0003_umay_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0003    umay_card


TS0004_UMAY_CARD - PENDING CASE OLD CUSTOMER
    [Tags]    TS0004_umay_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0004    umay_card


TS0005_UMAY_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER
    [Tags]    TS0005_umay_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0005    umay_card


TS0006_UMAY_CARD - PENDING HAVE CONSENT CASE OLD CUSTOMER
    [Tags]    TS0006_umay_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0006    umay_card


TS0007_UMAY_CARD - PENDING SEND DOC CASE NEW CUSTOMER
    [Tags]    TS0007_umay_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0007    umay_card


TS0008_UMAY_CARD - PENDING SEND DOC CASE OLD CUSTOMER
    [Tags]    TS0008_umay_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0008    umay_card


TS0009_UMAY_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT]
    [Tags]    TS0009_UC_HC_RJ
    [Documentation]    Pending Case เคส ลูกค้าใหม่ umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0009    umay_card    reject


TS0010_UMAY_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [CANCEL]
    [Tags]    TS0010_UC_HC_CC
    [Documentation]    Pending Case เคส ลูกค้าใหม่ umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0010    umay_card    cancel


TS0011_UMAY_CARD - PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT]
    [Tags]    TS0011_UC_SD_RJ
    [Documentation]    Pending Case เคส ลูกค้าใหม่ umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0011    umay_card    reject


TS0012_UMAY_CARD - PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [CANCEL]
    [Tags]    TS0012_UC_SD_CC
    [Documentation]    Pending Case เคส ลูกค้าใหม่ umay_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0012    umay_card    cancel


# *** PREMIER_CARD ***

TS0001_PREMIER_CARD - NORMAL CASE NEW CUSTOMER
    [Tags]    TS0001_premier_card
    [Documentation]    Normal Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0001    premier_card
        

TS0002_PREMIER_CARD - NORMAL CASE OLD CUSTOMER
    [Tags]    TS0002_premier_card
    [Documentation]    Normal Case เคส ลูกค้าเก่า virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0002    premier_card


TS0003_PREMIER_CARD - PENDING CASE NEW CUSTOMER
    [Tags]    TS0003_premier_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0003    premier_card


TS0004_PREMIER_CARD - PENDING CASE OLD CUSTOMER
    [Tags]    TS0004_premier_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0004    premier_card


TS0005_PREMIER_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER
    [Tags]    TS0005_premier_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0005    premier_card


TS0006_PREMIER_CARD - PENDING HAVE CONSENT CASE OLD CUSTOMER
    [Tags]    TS0006_premier_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0006    premier_card


TS0007_PREMIER_CARD - PENDING SEND DOC CASE NEW CUSTOMER
    [Tags]    TS0007_premier_card
    [Documentation]    Pending Case เคส ลูกค้าใหม่ virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0007    premier_card


TS0008_PREMIER_CARD - PENDING SEND DOC CASE OLD CUSTOMER
    [Tags]    TS0008_premier_card
    [Documentation]    Pending Case เคส ลูกค้าเก่า virual_premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0008    premier_card


TS0009_PREMIER_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT]
    [Tags]    TS0009_PC_HC_RJ
    [Documentation]    Pending Case เคส ลูกค้าใหม่ premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0009    premier_card    reject


TS0010_PREMIER_CARD - PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [CANCEL]
    [Tags]    TS0010_PC_HC_CC
    [Documentation]    Pending Case เคส ลูกค้าใหม่ premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0010    premier_card    cancel


TS0011_PREMIER_CARD - PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT]
    [Tags]    TS0011_PC_SD_RJ
    [Documentation]    Pending Case เคส ลูกค้าใหม่ premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0011    premier_card    reject


TS0012_PREMIER_CARD - PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [CANCEL]
    [Tags]    TS0012_PC_SD_CC
    [Documentation]    Pending Case เคส ลูกค้าใหม่ premier_card
        Pending_process_feature.SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE    TS0012    premier_card    cancel