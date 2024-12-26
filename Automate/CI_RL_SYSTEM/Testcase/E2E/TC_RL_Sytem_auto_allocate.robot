*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL      ${excel}[ci_kay_in_step1_yaml]
...             AND    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]
# Suite Teardown    Common_keyword.INTRANET TEARDOWN

*** Test cases ***

TS-01001-01002 - KEY IN STEP 1 - WALK IN - (VIRUAL CARD)
    [Tags]    TS-01001-01002
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Login_page.SET LOGIN SSO TO RL    Key1

        Key_in_step_1_feature.SET SELECT BRANCH    Branch

            Key_in_step_1_page.SET FOR LOOP - KEY IN STEP 1 (VIRUAL CARD)    Walkin


TS-01003-01004 - KEY IN STEP 1 - WALK IN - (UAMY+ CARD)
    [Tags]    TS-01003-01004
    [Documentation]  
    ...    อ่านแถว Walkin_1.0 
    ...    Sheet Keyinstep_1_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23 
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Login_page.SET LOGIN SSO TO RL    Key1

        Key_in_step_1_feature.SET SELECT BRANCH    Branch

            Key_in_step_1_feature.CHOOSE MENU    KEY IN STEP 1

                Key_in_step_1_page.SET FOR LOOP - KEY IN STEP 1 (UMAY+ CARD)    Walkin        


TS-01003-01007 - KEY IN STEP 1 - SMART ENTY - (VIRUAL CARD)
    [Tags]    TS-01003-01007
    [Documentation]
    ...    อ่านแถว Smartenty_1.0 
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23 
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง

    Login_page.SET LOGIN SSO TO RL    Key1

        Key_in_step_1_feature.SET SELECT BRANCH    Branch

            Key_in_step_1_page.SET FOR LOOP - MANAGE APPLICATION TO KEY IN STEP 1 (VIRUAL CARD)    Smartenty


TS-01008-01011 - KEY IN STEP 1 - SMART ENTY - (UMAY+ CARD)
    [Tags]    TS-01008-01011
    [Documentation]
    ...    อ่านแถว Smartenty_1.0 
    ...    Sheet Keyinstep_1_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23 
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง

    Login_page.SET LOGIN SSO TO RL    Key1

        Key_in_step_1_feature.SET SELECT BRANCH    Branch

            Key_in_step_1_page.SET FOR LOOP - MANANGE APPLICATION TO KEY IN STEP 1 (UMAY+ CARD)    Smartenty


TS-01011-01013 - KEY IN STEP 1 - FULL FORM - (VIRUAL CARD)
    [Tags]    TS-01011-01013
    [Documentation]  
    ...    อ่านแถว Fullform_1.0 
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23 
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง

    Login_page.SET LOGIN SSO TO RL    Key1
    
        Key_in_step_1_feature.SET SELECT BRANCH    Branch
    
            Key_in_step_1_page.SET FOR LOOP - MANAGE APPLICATION TO KEY IN STEP 1 (VIRUAL CARD)    Fullform


TS-01013-01016 - KEY IN STEP 1 - FULL FORM - (UMAY+ CARD)
    [Tags]    TS-01013-01016
    [Documentation]  
    ...    อ่านแถว Fullform_1.0
    ...    Sheet Keyinstep_1_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23 
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Login_page.SET LOGIN SSO TO RL    Key1
    
        Key_in_step_1_feature.SET SELECT BRANCH    Branch
    
            Key_in_step_1_page.SET FOR LOOP - MANANGE APPLICATION TO KEY IN STEP 1 (UMAY+ CARD)    Fullform


KEY IN STEP 1 - CLOSING - (VIRUAL CARD)
    [Tags]    KEY IN STEP 1 - CLOSING - (VIRUAL CARD)
    [Documentation]  
    ...    อ่านแถว Closing_1.0 
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23 
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Login_page.SET LOGIN SSO TO RL    Key1

        Key_in_step_1_feature.SET SELECT BRANCH    Branch

            Key_in_step_1_feature.CHOOSE MENU    KEY IN STEP 1

                Key_in_step_1_page.SET FOR LOOP - KEY IN STEP 1 (VIRUAL CARD)    Closing


KEY IN STEP 1 - CLOSING - (UMAY+ CARD)
    [Tags]    KEY IN STEP 1 - CLOSING - (UMAY+ CARD)
    [Documentation]  
    ...    อ่านแถว Closing_1.0  
    ...    Sheet Keyinstep_1_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23 
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Login_page.SET LOGIN SSO TO RL    Key1

        Key_in_step_1_feature.SET SELECT BRANCH    Branch

            Key_in_step_1_feature.CHOOSE MENU    KEY IN STEP 1

                Key_in_step_1_page.SET FOR LOOP - KEY IN STEP 1 (UMAY+ CARD)    Closing


TS-02001-03001 - KEY IN STEP 2 - WALKIN
    [Tags]    TS-02001-03001
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Keyinstep 1
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - RECHECK KEY IN STEP 1 TO KEY IN STEP 2 (VIRUAL CARD)    Walkin


TS-02002-03002 - KEY IN STEP 2 - SMART ENTY
    [Tags]    TS-02002-03002
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Keyinstep 1
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - RECHECK KEY IN STEP 1 TO KEY IN STEP 2 (VIRUAL CARD)    Smartenty
    

TS-02003-03003 - KEY IN STEP 2 - FULL FORM
    [Tags]    TS-02003-03003 
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Keyinstep 1
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - RECHECK KEY IN STEP 1 TO KEY IN STEP 2 (VIRUAL CARD)    Fullform


TS-02004-03004 - KEY IN STEP 2 - MOBILE STAFF
    [Tags]    TS-02004-03004
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Keyinstep 1
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step
    ...    5. Sheet: KeyInStep1_Virtual_Card

    Common_Feature.SET FOR LOOP - RECHECK KEY IN STEP 1 TO KEY IN STEP 2 (VIRUAL CARD)    Mobile
    

TS-02005-03005 - KEY IN STEP 2 - NDID
    [Tags]    TS-02005-03005
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Keyinstep 1
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - RECHECK KEY IN STEP 1 TO KEY IN STEP 2 (VIRUAL CARD)    NDID
    

KEY IN STEP 2 - CLOSING
    [Tags]    KEY_IN_STEP_2_CLOSING
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Keyinstep 1
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - RECHECK KEY IN STEP 1 TO KEY IN STEP 2 (VIRUAL CARD)    Closing


TS-04001-04004 - VERIFY - WALKIN
    [Tags]    TS-04001-04004
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Verify
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step
    
    Common_Feature.SET FOR LOOP - VERIFY JUDMENT APPROVE (VIRUAL CARD)    Walkin


TS-04004-04008 - VERIFY - SMART ENTY
    [Tags]    TS-04004-04008
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Verify
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step
    
    Common_Feature.SET FOR LOOP - VERIFY JUDMENT APPROVE (VIRUAL CARD)    Smartenty


TS-04008-04012 - VERIFY - FULL FORM
    [Tags]    TS-04008-04012
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Verify
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step
    
    Common_Feature.SET FOR LOOP - VERIFY JUDMENT APPROVE (VIRUAL CARD)    Fullform


TS-04012-04016 - VERIFY - MOBILE STAFF
    [Tags]    TS-04012-04016
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Verify
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step
    
    Common_Feature.SET FOR LOOP - VERIFY JUDMENT APPROVE (VIRUAL CARD)    Mobile


TS-04016-04020 - VERIFY - NDID
    [Tags]    TS-04016-04020
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Verify
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step
    
    Common_Feature.SET FOR LOOP - VERIFY JUDMENT APPROVE (VIRUAL CARD)    NDID


VERIFY - CLOSING
    [Tags]    VERIFY_CLOSING
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Verify
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step
    
    Common_Feature.SET FOR LOOP - VERIFY JUDMENT APPROVE (VIRUAL CARD) (CLOSING)    Closing


TS-05001-05003 - KESSAI - WALKIN
    [Tags]    TS-05001-05003
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KESSAI APPROVE (VIRUAL CARD)    Walkin


TS-05004-05006 - KESSAI - SMART ENTY
    [Tags]    TS-05004-05006
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KESSAI APPROVE (VIRUAL CARD)    Smartenty


TS-05006-05009 - KESSAI - MOBILE STAFF
    [Tags]    TS-05006-05009
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KESSAI APPROVE (VIRUAL CARD)    Mobile


TS-05006-05009 - KESSAI - FULL FORM
    [Tags]    TS-05006-05009
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KESSAI APPROVE (VIRUAL CARD)    Fullform


TS-05012-05015 - KESSAI - NDID
    [Tags]    TS-05012-05015
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KESSAI APPROVE (VIRUAL CARD)    NDID


KESSAI - CLOSING
    [Tags]    KESSAI_CLOSING
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KESSAI APPROVE (VIRUAL CARD) (CLOSING)    Closing


KEY IN STEP 1 TO KEY IN STEP 2 - WALKIN - (VIRUAL CARD)
    [Tags]    KEYINSTEP1_TO_KEYINSTEP2_WALKIN_VIRUAL_CARD
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KEY IN STEP 2 - (VIRUAL CARD)     Walkin


KEY IN STEP 1 TO KEY IN STEP 2 - WALKIN - (UMAY+ CARD)
    [Tags]    KEYINSTEP1_TO_KEYINSTEP2_WALKIN_UMAY_CARD
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KEY IN STEP 2 - (UMAY+ CARD)     Walkin


KEY IN STEP 1 TO KESSAI - WALKIN - (VIRUAL CARD)
    [Tags]    KEYINSTEP1_TO_KESSAI_APPROVE_WALKIN_VIRUAL_CARD
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI (VIRUAL CARD)    Walkin


KEY IN STEP 1 TO KESSAI - WALKIN - (UMAY+ CARD)
    [Tags]    KEYINSTEP1_TO_KESSAI_APPROVE_WALKIN_UMAY_CARD
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI (UMAY+ CARD)    Walkin


RECHECK KEY IN STEP 1 TO KESSAI - MOBILE STAFF
    [Tags]    RECHECK_KEYINSTEP1_TO_KESSAI_APPROVE_MOBILE
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - RE CHECK KEY IN STEP 1 TO KESSAI (VIRUAL CARD)    Mobile


KEY IN STEP 1 TO KESSAI - SMART ENTY - (VIRUAL CARD)
    [Tags]    KEYINSTEP1_TO_KESSAI_APPROVE_SMARTENTY_VIRUAL_CARD
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - MANAGE APPLICATION TO KESSAI (VIRUAL CARD)    Smartenty


KEY IN STEP 1 TO KESSAI - SMART ENTY - (UMAY+ CARD)
    [Tags]    KEYINSTEP1_TO_KESSAI_APPROVE_SMARTENTY_UMAY_CARD
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - MANAGE APPLICATION TO KESSAI (UMAY+ CARD)    Smartenty


KEY IN STEP 1 TO KESSAI - FULL FORM - (VIRUAL CARD)
    [Tags]    FULL_VIRUAL
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - MANAGE APPLICATION TO KESSAI (VIRUAL CARD)     Fullform


KEY IN STEP 1 TO KESSAI - FULL FORM - (UMAY+ CARD)
    [Tags]    FULL_UMAY
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - MANAGE APPLICATION TO KESSAI (UMAY+ CARD)     Fullform


RECHECK KEY IN STEP 1 TO KESSAI - NDID
    [Tags]    RECHECK_KEYINSTEP1_TO_KESSAI_APPROVE_NDID_VIRUAL_CARD
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - RE CHECK KEY IN STEP 1 TO KESSAI (VIRUAL CARD)     NDID


KEY IN STEP 1 TO KESSAI - CLOSING - (VIRUAL CARD)
    [Tags]    KEYINSTEP1_TO_KESSAI_APPROVE_CLOSING_VIRUAL_CARD
    [Documentation]
    ...    1. Open the Browser
    ...    2. Login User Kesssai
    ...    3. Autoallocate รับเคส
    ...    4. กรอกข้อมลูกค้าจนจบ Step

    Common_Feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI - CLOSING - (VIRUAL CARD)    Closing



