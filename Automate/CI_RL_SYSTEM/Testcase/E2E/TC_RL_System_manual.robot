*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL      ${excel}[ci_kay_in_step1_yaml]
...             AND    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]
# Suite Teardown    Common_keyword.INTRANET TEARDOWN

*** Test cases ***

#**** VIRUAL CARD ***
TS_01001 - KEY IN STEP 1 TO KESSAI - WALK IN - (VIRUAL CARD) MANUAL FLOW 
    [Tags]    TS_01001
    [Documentation]  
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI (VIRUAL CARD) MANUAL FLOW     Walkin    ${data_keyinstep1_virual}


TS_01002 - KEY IN STEP 1 - WALK IN - (VIRUAL CARD) MANUAL FLOW 
    [Tags]    TS_01002
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KEY IN STEP 1 (VIRUAL CARD) MANUAL FLOW      Walkin    ${data_keyinstep1_virual}

TS_01003 - CHANGE PRIORITY - WALK IN - (VIRUAL CARD) MANUAL FLOW 
    [Tags]    TS_01003
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - CHANGE PRIORITY (VIRUAL CARD) MANUAL FLOW      Walkin    ${data_keyinstep1_virual}


TS_01004 - GET CASE TO INQUIRY AND DELETE APPLICATION - WALK IN - (VIRUAL CARD) MANUAL FLOW 
    [Tags]    TS_01004
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - GET CASE TO INQUIRY AND DELETE APPLICATION (VIRUAL CARD) MANUAL FLOW       Walkin    ${data_keyinstep1_virual}


TS_01005 - KEY IN STEP 2 - WALK IN - (VIRUAL CARD) MANUAL FLOW 
    [Tags]    TS_01005
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KEY IN STEP 2 (VIRUAL CARD) MANUAL FLOW        Walkin    ${data_keyinstep1_virual}


TS_01006 - VERIFY CALL - WALK IN - (VIRUAL CARD) MANUAL FLOW 
    [Tags]    TS_01006
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - VERIFY CALL (VIRUAL CARD) MANUAL FLOW         Walkin    ${data_keyinstep1_virual}


TS_01007 - KESSAI VERIFY CALL - WALK IN - (VIRUAL CARD) MANUAL FLOW 
    [Tags]    TS_01007
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KESSAI VERIFY CALL (VIRUAL CARD) MANUAL FLOW          Walkin    ${data_keyinstep1_virual}


#**** VIRUAL UMAY CARD ***
TS_02001 - KEY IN STEP 1 - WALK IN - (VIRUAL UMAY CARD) MANUAL FLOW 
    [Tags]    TS_02001
    [Documentation]  
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KEY IN STEP 1 TO KESSAI (VIRUAL UMAY CARD) MANUAL FLOW      Walkin    ${data_keyinstep1_umay}

TS_02002 - KEY IN STEP 1 - WALK IN - (VIRUAL UMAY CARD) MANUAL FLOW 
    [Tags]    TS_02002
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KEY IN STEP 1 (VIRUAL UMAY CARD) MANUAL FLOW       Walkin    ${data_keyinstep1_virual}

TS_02003 - CHANGE PRIORITY - WALK IN - (VIRUAL UMAY CARD) MANUAL FLOW 
    [Tags]    TS_02003
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - CHANGE PRIORITY (VIRUAL UMAY CARD) MANUAL FLOW      Walkin    ${data_keyinstep1_virual}


TS_02004 - GET CASE TO INQUIRY AND DELETE APPLICATION - WALK IN - (VIRUAL UMAY CARD) MANUAL FLOW 
    [Tags]    TS_02004
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - GET CASE TO INQUIRY AND DELETE APPLICATION (VIRUAL UMAY CARD) MANUAL FLOW       Walkin    ${data_keyinstep1_virual}


TS_02005 - KEY IN STEP 2 - WALK IN - (VIRUAL UMAY CARD) MANUAL FLOW 
    [Tags]    TS_02005
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KEY IN STEP 2 (VIRUAL UMAY CARD) MANUAL FLOW        Walkin    ${data_keyinstep1_virual}


TS_02006 - VERIFY CALL - WALK IN - (VIRUAL UMAY CARD) MANUAL FLOW 
    [Tags]    TS_02006
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - VERIFY CALL (VIRUAL UMAY CARD) MANUAL FLOW         Walkin    ${data_keyinstep1_virual}


TS_02007 - KESSAI VERIFY CALL - WALK IN - (VIRUAL UMAY CARD) MANUAL FLOW 
    [Tags]    TS_02007
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KESSAI VERIFY CALL (VIRUAL UMAY CARD) MANUAL FLOW          Walkin    ${data_keyinstep1_virual}


#**** MOBILE STAFF ***
TS_03001 - RECHECK KEY IN STEP 1 TO KESSAI MOBILE STAFF MANUAL FLOW 
    [Tags]    TS_03001
    [Documentation]  
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ต้องทำ case mobile มาก่อน
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - RECHECK KEY IN STEP 1 TO KESSAI MANUAL FLOW      Mobile    ${data_keyinstep1_virual}

TS_03002 - CHANGE PRIORITY - WALK IN - (MOBILE STAFF) MANUAL FLOW
    [Tags]    TS_03002
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - CHANGE PRIORITY (MOBILE STAFF) MANUAL FLOW      Mobile    ${data_keyinstep1_virual}


TS_03003 - GET CASE TO INQUIRY AND DELETE APPLICATION - WALK IN - (MOBILE STAFF) MANUAL FLOW 
    [Tags]    TS_03003
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - GET CASE TO INQUIRY AND DELETE APPLICATION (MOBILE STAFF) MANUAL FLOW       Mobile    ${data_keyinstep1_virual}


TS_03004 - KEY IN STEP 2 - WALK IN - (MOBILE STAFF) MANUAL FLOW 
    [Tags]    TS_03004
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KEY IN STEP 2 (MOBILE STAFF) MANUAL FLOW        Mobile    ${data_keyinstep1_virual}


TS_03005 - VERIFY CALL - WALK IN - (MOBILE STAFF) MANUAL FLOW 
    [Tags]    TS_03005
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - VERIFY CALL (MOBILE STAFF) MANUAL FLOW         Mobile    ${data_keyinstep1_virual}


TS_03006 - KESSAI VERIFY CALL - WALK IN - (MOBILE STAFF) MANUAL FLOW 
    [Tags]    TS_03006
    [Documentation]
    ...    อ่านแถว Walkin_1.0
    ...    Sheet KeyInStep1_Virtual_Card
    ...    เอา ID ไปทำ Dopa ที่ CS SCREEN
    ...    Gen Barcode ที่เครื่อง 23
    ...    ก่อนเล่นต้องเปลี่ยน ID กับ Barcode ที่ Sheet Key in step 1 ทุกครั้ง
    
    Common_feature.SET FOR LOOP - KESSAI VERIFY CALL (MOBILE STAFF) MANUAL FLOW          Mobile    ${data_keyinstep1_virual}
