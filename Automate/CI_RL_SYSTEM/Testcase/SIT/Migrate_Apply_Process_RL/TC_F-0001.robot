*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot
Suite Setup    Common_feature.SET UP ALL FOR MIGRATE RL    Key1    Branch    KEY IN STEP 1    # ลำดับการส่ง:    ${user_sso}    ${select_branch}    ${choose_menu}

# // Project Doc No. 66060240

*** Test Cases ***

TS_01001_010 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01001_010
    [Documentation]
    ...   Condition: "ตรวจสอบการแสดงรายละเอียดและเงื่อนไขของฟิวด์บนหน้าจอ กรณีเลือก Umay+ Card (Re Key Umay+) กรณีสถานะของการ์ดเป็น Card off line "
    ...   Expected Result: ระบบฟ้อง “NOT CARD OFFLINE, PLEASE CHECK..!!” ถูกต้อง 

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01001_010    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Input Card
        Key_in_step_1_feature.SET INPUT UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global
        Key_in_step_1_feature.SET INPUT CONFRIM UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Globals
                
            # Should Be Equal
            BuiltIn.Run Keyword And Continue On Failure    BuiltIn.Wait Until Keyword Succeeds   10x    1s    GET TEXT AND SHOULD BE EQUAL    ${validate_field_umay_plus_card_locator}    ${group_value_migrate_apply_RL}[0][Validate_field_Text]    # //ลำดับการส่ง:    Locator    excel    

                # Capture_Screen
                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    
                    # Clear page
                    Key_in_step_1_page.CLICK BUTTON CLEAR


TS_01001_011 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01001_011
    [Documentation]
    ...   Condition: ตรวจสอบการแสดงรายละเอียดและเงื่อนไขของฟิวด์บนหน้าจอ กรณีเลือก Umay+ Card (Re Key Umay+) กรณีสถานะของการ์ดเป็น  Not Card in use
    ...   Expected Result: ระบบฟ้อง “THIS CARD IN USE...!!” ถูกต้อง 

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01001_011    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Input Card
        Key_in_step_1_feature.SET INPUT UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global
        Key_in_step_1_feature.SET INPUT CONFRIM UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Globals
                
            # Should Be Equal
            BuiltIn.Run Keyword And Continue On Failure    BuiltIn.Wait Until Keyword Succeeds   2x    1s    GET TEXT AND SHOULD BE EQUAL    ${validate_field_umay_plus_card_locator}    ${group_value_migrate_apply_RL}[0][Validate_field_Text]    # //ลำดับการส่ง:    Locator    excel    

                # Capture_Screen
                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    
                    # Clear page
                    Key_in_step_1_page.CLICK BUTTON CLEAR


TS_01001_012 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01001_012
    [Documentation]
    ...    Condition: ตรวจสอบการแสดงรายละเอียดและเงื่อนไขของฟิวด์บนหน้าจอกรณีเลือก Umay+ Card (Re Key Umay+) กรณีสถานะของการ์ดเป็น Card Branch
    ...    Expected Result: ระบบฟ้อง “NOT CARD BRN:...” ถูกต้อง 

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01001_012    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Input Card
        Key_in_step_1_feature.SET INPUT UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global
        Key_in_step_1_feature.SET INPUT CONFRIM UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Globals
                
            # Should Be Equal
            BuiltIn.Run Keyword And Continue On Failure    BuiltIn.Wait Until Keyword Succeeds   2x    1s    GET TEXT AND SHOULD BE EQUAL    ${validate_field_umay_plus_card_locator}    ${group_value_migrate_apply_RL}[0][Validate_field_Text]    # //ลำดับการส่ง:    Locator    excel    

                # Capture_Screen
                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    
                    # Clear page
                    Key_in_step_1_page.CLICK BUTTON CLEAR


TS_01001_029 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01001_029
    [Documentation]
    ...    Condition: ตรวจสอบการแสดงรายละเอียดและเงื่อนไขของฟิวด์บนหน้าจอในส่วนของฟิวด์ Dopa Result กรณี Dopa Result B: บัตรสถานะไม่ปกติ แนะนำลูกค้าติดต่อ สำนักทะเบียนที่อำเภอ/เขต ทุกแห่งที่สะดวก
    ...    Expected Result: ระบบสามารถแสดงผลการตรวจสอบสถานะบัตรประชาชนจากกรมการปกครอง ได้ถูกต้อง

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01001_029    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Select: Umay+ Virtual Card
        Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
        Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value_migrate_apply_RL}

            # Input Card
            Key_in_step_1_page.INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global
                Key_in_step_1_page.INPUT CONFRIM ID INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global 
                    
                # Should Be Equal
                BuiltIn.Sleep    02s
                BuiltIn.Run Keyword And Continue On Failure    BuiltIn.Wait Until Keyword Succeeds   20x    1s    GET TEXT AND SHOULD BE EQUAL    ${validate_field_dopa_result_locator}    ${group_value_migrate_apply_RL}[0][Validate_field_Text]    # //ลำดับการส่ง:    Locator    excel    

                    # Capture_Screen
                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                        
                        # Clear page
                        Key_in_step_1_page.CLICK BUTTON CLEAR


TS_01001_030 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01001_030
    [Documentation]
    ...    Condition: "ตรวจสอบการแสดงรายละเอียดและเงื่อนไขของฟิวด์บนหน้าจอในส่วนของฟิวด์ Dopa Result กรณี Dopa Result C: บัตรสิ้นสภาพการใช้งาน แนะนำลูกค้าติดต่อ สำนักทะเบียนที่อำเภอ/เขต ทุกแห่งที่สะดวก"
    ...    Expected Result: ระบบสามารถแสดงผลการตรวจสอบสถานะบัตรประชาชนจากกรมการปกครอง ได้ถูกต้อง

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01001_030    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Select: Umay+ Virtual Card
        Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
        Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value_migrate_apply_RL}

            # Input Card
            Key_in_step_1_page.INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global
                Key_in_step_1_page.INPUT CONFRIM ID INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global 
                    
                # Should Be Equal
                BuiltIn.Run Keyword And Continue On Failure    BuiltIn.Wait Until Keyword Succeeds   20x    1s    GET TEXT AND SHOULD BE EQUAL    ${validate_field_dopa_result_locator}    ${group_value_migrate_apply_RL}[0][Validate_field_Text]    # //ลำดับการส่ง:    Locator    excel    

                    # Capture_Screen
                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                        
                        # Clear page
                        Key_in_step_1_page.CLICK BUTTON CLEAR


TS_01001_031 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01001_031
    [Documentation]
    ...    Condition: "ตรวจสอบการแสดงรายละเอียดและเงื่อนไขของฟิวด์บนหน้าจอในส่วนของฟิวด์ Dopa Result กรณี Dopa Result D: ขออภัยค่ะ ไม่สามารถทำการตรวจสอบข้อมูลได้ กรุณาติดต่อ Helpdesk"
    ...    Expected Result: ระบบสามารถแสดงผลการตรวจสอบสถานะบัตรประชาชนจากกรมการปกครอง ได้ถูกต้อง

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01001_031    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Select: Umay+ Virtual Card
        Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
        Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value_migrate_apply_RL}

            # Input Card
            Key_in_step_1_page.INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global
            Key_in_step_1_page.INPUT CONFRIM ID INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global 
                    
                # Should Be Equal
                BuiltIn.Run Keyword And Continue On Failure    BuiltIn.Wait Until Keyword Succeeds   20x    1s    GET TEXT AND SHOULD BE EQUAL    ${validate_field_dopa_result_locator}    ${group_value_migrate_apply_RL}[0][Validate_field_Text]    # //ลำดับการส่ง:    Locator    excel    

                    # Capture_Screen
                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                        
                        # Clear page
                        Key_in_step_1_page.CLICK BUTTON CLEAR


TS_01001_040 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01001_040
    [Documentation]
    ...    Condition: "ตรวจสอบการแสดงรายละเอียดและเงื่อนไขของฟิวด์บนหน้าจอในส่วนของฟิวด์ Dopa Result กรณี Dopa Result 99: ขออภัยค่ะ ไม่สามารถเชื่อมต่อ DOPA ได้ กรุณาตรวจสอบใหม่อีกครั้ง"
    ...    Expected Result: ระบบสามารถแสดงผลการตรวจสอบสถานะบัตรประชาชนจากกรมการปกครอง ได้ถูกต้อง

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01001_040    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Select: Umay+ Virtual Card
        Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
        Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value_migrate_apply_RL}

            # Input
            Key_in_step_1_page.INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global
            Key_in_step_1_page.INPUT CONFRIM ID INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global 
            Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value_migrate_apply_RL}    # Variable Global
            Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value_migrate_apply_RL}    # Variable Global
            Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value_migrate_apply_RL}    # Variable Global
 
                # Should Be Equal
                BuiltIn.Run Keyword And Continue On Failure    BuiltIn.Wait Until Keyword Succeeds   20x    1s    GET TEXT AND SHOULD BE EQUAL    ${Locator_Select_SubApplyChannel}    ${group_value_migrate_apply_RL}[0][Validate_field_Text]    # //ลำดับการส่ง:    Locator    excel    

                    # Capture_Screen
                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                        
                        # Clear page
                        Key_in_step_1_page.CLICK BUTTON CLEAR

TS_01001_043 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01001_043
    [Documentation]
    ...    Condition: "ตรวจสอบการแสดงรายละเอียดและเงื่อนไขของฟิวด์บนหน้าจอในส่วนของฟิวด์ Introducer"
    ...    Expected Result: สามารถระบุเป็น CSN No. ได้ และสามารถแสดงชื่อผู้แนะนำ ได้ถูกต้อง

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01001_043    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Select: Umay+ Virtual Card
        Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
        Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value_migrate_apply_RL}

            # Input
            Key_in_step_1_page.INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global
            Key_in_step_1_page.INPUT CONFRIM ID INPUT ID VIRTUAL UMAY+ CARD    ${group_value_migrate_apply_RL}    # Variable Global 
            Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value_migrate_apply_RL}    # Variable Global
            Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value_migrate_apply_RL}    # Variable Global
            Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value_migrate_apply_RL}    # Variable Global
                Press Keys    none    TAB    # ใช้เพื่อเร่งการ loading ของ introducer เนื่องจากต้องมี Action ถัดไปร่วมด้วย ระบบไม่ auto validate field
                
                # Should Be Equal
                BuiltIn.Run Keyword And Continue On Failure    SeleniumLibrary.Wait Until Element Is Not Visible    ${validate_field_introducer_locator}    timeout=120s

                    # Capture_Screen
                    BuiltIn.Run Keyword And Continue On Failure    SeleniumLibrary.Wait Until Element Is Visible    ${validate_field_introducer_name_locator}    timeout=10s
                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                        
                        # Clear page
                        Key_in_step_1_page.CLICK BUTTON CLEAR


TS_01002_006 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01002_006
    [Documentation]
    ...    Condition: [Auto Reject] ตรวจสอบ Normal Criteria หากลูกค้าไม่ผ่านเงื่อนไข >> ชาวต่างชาติ 
    ...    Expected Result: ระบบจะต้อง Auto Reject ทันที โดยแสดง Message แจ้งเตือน Auto Reject LL5: Reject Foreigner ถูกต้อง 

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01002_006    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Input data
        Key_in_step_1_feature.SET REGISTER KEY IN STEP 1 (VIRUAL CARD) FOR MIGRATE APPLY PROCESS RL    ${group_value_migrate_apply_RL}
                
            # Validate
            BuiltIn.Run Keyword And Continue On Failure    SeleniumLibrary.Wait Until Page Contains    ${group_value_migrate_apply_RL}[0][Validate_field_Text]   timeout=60s

                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    
                    # Clear page
                    Key_in_step_1_feature.CHOOSE MENU    KEY IN STEP 1
                    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
                    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value_migrate_apply_RL}


TS_01002_007 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01002_007
    [Documentation]
    ...    Condition: [Auto Reject] ตรวจสอบ Normal Criteria หากลูกค้าไม่ผ่านเงื่อนไข >> Incorrect ID by Government
    ...    Expected Result: ระบบจะต้อง Auto Reject ทันที โดยแสดง Message แจ้งเตือน Auto Reject SL35: Reject Incorrect ID by Government ถูกต้อง

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01002_007    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Input data
        Key_in_step_1_feature.SET REGISTER KEY IN STEP 1 (VIRUAL CARD) FOR MIGRATE APPLY PROCESS RL    ${group_value_migrate_apply_RL}
            
            # Confirm
            Key_in_step_1_page.BUTTON CONFRIM CHECK DATA
            Key_in_step_1_page.BUTTON YES CONFRIM CHECK DATA
            Key_in_step_1_page.CLICK BUTTON SEND SMS 

            # Validate
            BuiltIn.Run Keyword And Continue On Failure    SeleniumLibrary.Wait Until Page Contains    ${group_value_migrate_apply_RL}[0][Validate_field_Text]   timeout=60s

                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    
                    # Clear page
                    Key_in_step_1_feature.CHOOSE MENU    KEY IN STEP 1
                    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
                    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value_migrate_apply_RL}


TS_01002_015 KEY IN STEP 1 - VERIFY DISPLAY
    [Tags]    TS_01002_015
    [Documentation]
    ...    Condition: [Auto Reject] ตรวจสอบ Normal Criteria หากลูกค้าไม่ผ่านเงื่อนไข >> ลูกค้าเก่ามีการ Re-Finance หรือประนอมหนี้กับทางบริษัทแล้ว
    ...    Expected Result: ระบบจะต้อง Auto Reject ทันที โดยแสดง Message แจ้งเตือน Auto Reject IL9: Reject P-Part/Re-finance/Compromise customer ถูกต้อง

    Common_feature.SET EXCEL FOR MIGRATE APPLY PROCESS RL    ${RL_migrate_apply_process_RL_F_0001}    TS_01002_015    # //ลำดับการส่ง:    ชื่อ Sheet    TC      
        
        # Input data
        Key_in_step_1_feature.SET REGISTER KEY IN STEP 1 (VIRUAL CARD) FOR MIGRATE APPLY PROCESS RL    ${group_value_migrate_apply_RL}
            
            # Confirm
            Key_in_step_1_page.IF ELSE NAME ENG
            Key_in_step_1_page.BUTTON CONFRIM CHECK DATA
            Key_in_step_1_page.BUTTON YES CONFRIM CHECK DATA
            Key_in_step_1_page.CLICK BUTTON SEND SMS

            # Validate
            BuiltIn.Run Keyword And Continue On Failure    SeleniumLibrary.Wait Until Page Contains    ${group_value_migrate_apply_RL}[0][Validate_field_Text]   timeout=60s

                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
                Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    
                    # Clear page
                    Key_in_step_1_feature.CHOOSE MENU    KEY IN STEP 1
                    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
                    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value_migrate_apply_RL}