*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot
Suite Setup    SET UP CHANGE PRIORITY

# // Project Doc No. 66060240

*** Keywords ***

SET UP CHANGE PRIORITY

    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]

    Sync_sheet_excel.GET ALL DATA FROM EXCEL MIGRATE APPLY PROCESS RL    ${excel}[Migrate_Apply_Process_RL]
    
        Login_page.SET LOGIN SSO TO RL MANUAL AND CHOOSE MENU INTERVIEW RL    Kessai    ${Icon_Menu_Change_Priority_Locator}


*** Test Cases ***

TS_21001_004 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_004
    [Documentation]
    ...   Condition: ตรวจสอบการใช้งานแถบปุ่มดำเนินการ >> ปุ่ม Cancel
    ...   Expected Result: สามารถกดเมื่อต้องการยกเลิกทำรายการ ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_004
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}[0][ID]
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_Page.CHANGE PRIORITY - CLICK HYPER LINK ID    ${group_value}

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY_BEFORE

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE
                                 
                            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON CANCEL

                                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY_AFTER

                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE


TS_21001_006 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_006
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> Branch
    ...   Expected Result: ระบบแสดงข้อมูลสาขา ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_006
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY FOR DATA FLOAT    ${set_tc_value}    Branch

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE


TS_21001_007 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_007
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> Application 
    ...   Expected Result: ระบบแสดงข้อมูลสาขา ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_007
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY FOR DATA FLOAT    ${set_tc_value}    Application

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE  


TS_21001_008 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_008
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> Type
    ...   Expected Result: ระบบแสดงช่องทางของใบสมัครว่าเป็น Mobile หรือสมัครตรงที่สาขา B ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_008
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY    ${set_tc_value}    Type

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE  


TS_21001_009 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_009
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> Name-Surname
    ...   Expected Result: ระบบแสดงชื่อและนามสกุลของลูกค้า ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_009
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY    ${set_tc_value}    Name_Surname

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE  


TS_21001_010 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_010
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> Name-Surname
    ...   Expected Result: ระบบแสดงเลขบัตรประจำตัวประชาชนของลูกค้า ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_010
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY FOR DATA FLOAT    ${set_tc_value}    ID_Number

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE  


TS_21001_011 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_011
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> Card No.
    ...   Expected Result: ระบบแสดงข้อมูล EBC Card no. ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_011
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY FOR DATA FLOAT    ${set_tc_value}    Card_No

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE  



TS_21001_012 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_012
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> App Date
    ...   Expected Result: ระบบแสดงวันที่สมัคร ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_012
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY    ${set_tc_value}    App_Date

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE  


TS_21001_013 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_013
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> App Time
    ...   Expected Result: ระบบแสดงวันที่สมัคร ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_013
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY    ${set_tc_value}    App_Time

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE  


TS_21001_014 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_014
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> Group Code
    ...   Expected Result: ระบบแสดงข้อมูล Group code กรณีที่เป็นการสมัครแบบ Group ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_014
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY    ${set_tc_value}    Group_Code

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE  


TS_21001_015 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_015
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> Step
    ...   Expected Result: ระบบแสดงข้อมูล Process step ปัจจุบันของใบสมัคร ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_015
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY    ${set_tc_value}    Step

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE  


TS_21001_016 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_016
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Change priority >> Last Update
    ...   Expected Result: ระบบแสดง User คนล่าสุดที่ทำการอัพเดทใบสมัคร ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_016
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_feature.VERIFY DATA TABLE CHANGE PRIORITY    ${set_tc_value}    Last_Update

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                        Capture_screen.CAPTURE SCREEN CURRENT PAGE 


TS_21001_017 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_017
    [Documentation]
    ...   Condition: ตรวจสอบขั้นตอนและวิธีการใช้งานเมนู >> คลิกที่ตัวเลขที่ต้องการ Change priority ในคอลัมน์ Seq 
    ...   Expected Result: ระบบจะแสดง Pop up Change priority ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_017
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_Page.CHANGE PRIORITY - CLICK HYPER LINK ID    ${group_value}

                    SeleniumLibrary.Wait Until Page Contains    Change Priority
                    Sleep    3s

                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                            Capture_screen.CAPTURE SCREEN CURRENT PAGE 


TS_21001_018 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_018
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Pop up Change priority >> From
    ...   Expected Result: ระบบจะแสดงชื่อ User ที่ทำรายการ Last update ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_018
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_Page.CHANGE PRIORITY - CLICK HYPER LINK ID    ${group_value}

                    SeleniumLibrary.Wait Until Page Contains    Change Priority
                    Sleep    3s

                        Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${lbl_last_user_change_priority_locator}    ${group_value}[0][From]

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE 


TS_21001_024 CHANGE PRIORITY - VERIFY DISPLAY
    [Tags]    TS_21001_024
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ Pop up Change priority >> From
    ...   Expected Result: ระบบจะแสดงชื่อ User ที่ทำรายการ Last update ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_21001_024
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0021}    $[?(@.TC=='${set_tc_value}')]

        Changepriority_Page.CHANGE PRIORITY - INPUT ID    ${group_value}
                        
            Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON SEARCH
                            
                Changepriority_Page.CHANGE PRIORITY - CLICK HYPER LINK ID    ${group_value}

                    SeleniumLibrary.Wait Until Page Contains    Change Priority
                    Sleep    3s

                        Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${lbl_send_case_change_priority_locator}    ${group_value}[0][Send_Case]

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    CHANGE_PRIORITY

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE 
