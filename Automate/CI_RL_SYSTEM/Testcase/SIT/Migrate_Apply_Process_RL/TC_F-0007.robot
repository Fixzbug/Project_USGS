*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot
Suite Setup    SET UP MANGE APPLICATION ONLINE

# // Project Doc No. 66060240

*** Keywords ***

SET UP MANGE APPLICATION ONLINE 

    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]

    Sync_sheet_excel.GET ALL DATA FROM EXCEL MIGRATE APPLY PROCESS RL    ${excel}[Migrate_Apply_Process_RL]
    
        Manage_application_online_feature.SET LOGIN SSO TO CHOOSE MENU MANAGE APPLICATION ONLINE    Key1    ${Locator_Icon_ManageApp}


*** Test Cases ***

TS_07001_001 MANGE APPLICATION ONLINE - VERIFY DISPLAY
    [Tags]    TS_07001_001
    [Documentation]
    ...   Condition: ตรวจสอบการเข้าใช้งานหน้าเมนู Key in step1	
    ...   Expected Result: ระบบสามารถสามารถเข้าเมนู Mange Application Online  ได้ถูกต้อง
    
    ${set_tc_file}     Set variable    TS_07001_001
    ${set_tc_value}    Set variable    Data_F_0007
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0007}    $[?(@.TC=='${set_tc_value}')] 

        Common_keyword.WAIT UNTIL TEXT IS VISIBLE    MANAGE APPLICATION ONLINE    

        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE

            Capture_screen.CAPTURE SCREEN CURRENT PAGE


TS_07001_002-003 MANGE APPLICATION ONLINE - VERIFY DISPLAY
    [Tags]    TS_07001_002_003
    [Documentation]
    ...   Condition: ตรวจสอบแหล่งที่มาของเคสที่จะเข้ามาที่ Mange Application Online
    ...   Expected Result: เคสจากการสมัครผ่านช่องทาง Application Online www.umayplus.com เคสจากการสมัครผ่านช่องทาง Smart Entry ของพนักงานกลุ่ม CL

    ${set_tc_value}    Set variable    Data_F_0007
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0007}    $[?(@.TC=='${set_tc_value}')]     

        Manage_application_page.INPUT ID    ${group_value}

            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE_BEFORE_SEARCH

                Capture_screen.CAPTURE SCREEN CURRENT PAGE

                    Manage_application_page.CLICK SEARCH

                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE_AFTER_SEARCH

                            Capture_screen.CAPTURE SCREEN CURRENT PAGE


TS_07002_001 TO 008 MANGE APPLICATION ONLINE - VERIFY DISPLAY
    [Tags]    TS_07002_001_007
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์
    ...   Expected Result: แสดงข้อมูลได้ถูกต้อง

    ${set_tc_value}    Set variable    Data_F_0007
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0007}    $[?(@.TC=='${set_tc_value}')]     

        Manage_application_page.INPUT ID    ${group_value}

                Manage_application_page.CLICK SEARCH

                    Manage_application_online_feature.VERIFY DATA MANAGE APPLICATION ONLINE    ${set_tc_value}    TS_07002_001    # VERIFY_ID_NUMBER
                    Manage_application_online_feature.VERIFY DATA MANAGE APPLICATION ONLINE    ${set_tc_value}    TS_07002_002    # VERIFY_Key_date
                    Manage_application_online_feature.VERIFY DATA MANAGE APPLICATION ONLINE    ${set_tc_value}    TS_07002_003    # VERIFY_Via
                    Manage_application_online_feature.VERIFY DATA MANAGE APPLICATION ONLINE    ${set_tc_value}    TS_07002_004    # VERIFY_Time
                    Manage_application_online_feature.VERIFY DATA MANAGE APPLICATION ONLINE    ${set_tc_value}    TS_07002_005    # VERIFY_Consent_Credit_Model
                    Manage_application_online_feature.VERIFY DATA MANAGE APPLICATION ONLINE    ${set_tc_value}    TS_07002_006    # VERIFY_Automatic_Payment
                    Manage_application_online_feature.VERIFY DATA MANAGE APPLICATION ONLINE    ${set_tc_value}    TS_07002_007    # VERIFY_Action

                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE

                            Capture_screen.CAPTURE SCREEN CURRENT PAGE


TS_07002_009 MANGE APPLICATION ONLINE - VERIFY DISPLAY
    [Tags]    TS_07002_009
    [Documentation]
    ...   Condition: ตรวจสอบขั้นตอนและเงื่อนไขการทำงานของโปรแกรม >> กรณีค้นหาข้อมูลด้วย ID No จากนั้นกด Search	
    ...   Expected Result: ระบบจะแสดงรายละเอียดข้อมูลขึ้นมาให้ถูกต้อง

    ${set_tc_value}    Set variable    Data_F_0007
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0007}    $[?(@.TC=='${set_tc_value}')]     

        Manage_application_page.INPUT ID    ${group_value}

            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE_BEFORE_SEARCH

                Capture_screen.CAPTURE SCREEN CURRENT PAGE

                    Manage_application_page.CLICK SEARCH

                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE_AFTER_SEARCH

                            Capture_screen.CAPTURE SCREEN CURRENT PAGE


TS_07002_010 MANGE APPLICATION ONLINE - VERIFY DISPLAY
    [Tags]    TS_07002_010
    [Documentation]
    ...   Condition: ตรวจสอบขั้นตอนและเงื่อนไขการทำงานของโปรแกรม >> กรณีกดปุ่ม View ของคอลัมน์ Action 
    ...   Expected Result: ระบบจะแสดง Pop up สำหรับพิมพ์เอกสารการสมัคร โดยมีรายละเอียด ดังนี้
	...    ตรวจสอบ Key date แสดงข้อมูลวันที่ใบสมัคร ได้ถูกต้อง
	...    ตรวจสอบ Key time แสดงข้อมูลเวลาที่สมัคร ได้ถูกต้อง
	...    ตรวจสอบ Print time แสดงจำนวนครั้งที่พิมพ์เอกสาร ได้ถูกต้อง
	...    ตรวจสอบ Print by แสดงข้อมูลพนักงานที่พิมพ์เอกสาร ได้ถูกต้อง
	...    ตรวจสอบปุ่ม Print กดเพื่อพิมพ์เอกสารใบสมัคร ในรูปแบบ PDF File
	...    ตรวจสอบปุ่ม Close กดเพื่อปิด Pop up 

    ${set_tc_value}    Set variable    Data_F_0007
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0007}    $[?(@.TC=='${set_tc_value}')]     

        Manage_application_page.INPUT ID    ${group_value}

            Manage_application_page.CLICK SEARCH

                Manage_application_page.CLICK HYPER LINK VIEW

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE

                            Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                Manage_application_page.CLICK HYPER LINK PRINT

                                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE_AFTER_CLOSE

                                        Capture_screen.CAPTURE SCREEN CURRENT PAGE


TS_07002_008 AND 011 MANGE APPLICATION ONLINE - VERIFY DISPLAY
    [Tags]    TS_07002_008_011
    [Documentation]
    ...   Condition: ตรวจสอบขั้นตอนและเงื่อนไขการทำงานของโปรแกรม >> กรณีเมื่อพิมพ์เอกสารสำเร็จ
    ...   Expected Result: ระบบจะแสดง Link สำหรับกดไปที่เมนู Key in step1 หากยังไม่มีการพิมพ์เอกสาร ระบบจะไม่แสดง Link ให้กด

    ${set_tc_value}    Set variable    Data_F_0007
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0007}    $[?(@.TC=='${set_tc_value}')]     

        Manage_application_page.INPUT ID    ${group_value}

            Manage_application_page.CLICK SEARCH

                Manage_application_page.CLICK HYPER LINK VIEW

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE

                            Manage_application_page.CLICK HYPER LINK PRINT

                                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE_AFTER_PRINT

                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                    Manage_application_online_feature.VERIFY DATA MANAGE APPLICATION ONLINE    ${set_tc_value}    TS_07002_008    # VERIFY_KeyInStep1

                                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE_TS_07002_008

                                            Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                            Manage_application_page.CLICK HYPER LINK KEY IN STEP 1
                                                Sleep    5s

                                            Common_keyword.WAIT UNTIL TEXT IS VISIBLE    KEY IN STEP 1 
                                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    MANAGE_APPLICATION_ONLINE_AFTER_CLICK HYPER_LINK_KEY_IN_STEP_1

                                                Capture_screen.CAPTURE SCREEN CURRENT PAGE