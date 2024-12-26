*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot
Suite Setup    SET UP INQUIRY APPLICATION

# // Project Doc No. 66060240

*** Keywords ***

SET UP INQUIRY APPLICATION

    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]

    Sync_sheet_excel.GET ALL DATA FROM EXCEL MIGRATE APPLY PROCESS RL    ${excel}[Migrate_Apply_Process_RL]
    
        Login_page.SET LOGIN SSO TO RL MANUAL AND CHOOSE MENU INTERVIEW RL    Kessai    ${menu_inquiry_application_locator}


*** Test Cases ***

TS_16001_003 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_003
    [Documentation]
    ...   Condition: ตรวจสอบเงื่อนไขสำหรับค้นหาข้อมูล สามารถค้นหาข้อมูลได้จาก >> Name
    ...   Expected Result: สามารถระบุชื่อลูกค้าที่ต้องการค้นหาได้
    
    ${set_tc_file}     Set variable    TS_16001_003
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    2s    Inquiry_application_page.INPUT NAME    ${group_value}[0][${set_tc_file}]

            Inquiry_application_page.CLICK SEARCH BUTTON

                ${name_data_grid}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${lbl_name_in_data_gid_inquiry_locator}    ${group_value}[0][${set_tc_file}]

                    SeleniumLibrary.Wait Until Element Is Visible    ${name_data_grid}    10s

                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                            Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                Inquiry_application_page.CLICK CLEAR BUTTON


TS_16001_004 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_004
    [Documentation]
    ...   Condition: ตรวจสอบเงื่อนไขสำหรับค้นหาข้อมูล สามารถค้นหาข้อมูลได้จาก >> Surname
    ...   Expected Result: สามารถระบุนามสกุลที่ต้องการค้นหาได้

    ${set_tc_file}     Set variable    TS_16001_004
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT SURNAME    ${group_value}[0][${set_tc_file}]

            Inquiry_application_page.CLICK SEARCH BUTTON

                ${name_data_grid}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${lbl_name_in_data_gid_inquiry_locator}    ${group_value}[0][${set_tc_file}]

                    SeleniumLibrary.Wait Until Element Is Visible    ${name_data_grid}    10s

                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                            Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                Inquiry_application_page.CLICK CLEAR BUTTON


TS_16001_005 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_005
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Application No 
    ...   Expected Result: แสดงข้อมูล Application No. ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_005
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}


TS_16001_006 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_006
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Customer Type
    ...   Expected Result: แสดงข้อมูลประเภทลูกค้า New/Old. ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_006
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE     

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}  


TS_16001_007 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_007
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Loan Type
    ...   Expected Result: แสดงข้อมูลประเภทสินเชื่อ ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_007
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}  

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator} 


TS_16001_008 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_008
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Card
    ...   Expected Result: แสดงข้อมูล Card no. ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_008
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                      


TS_16001_009 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_009
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Card Type
    ...   Expected Result: แสดงข้อมูลประเภทบัตร ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_009
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                      
                                        

TS_16001_010 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_010
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Bureau result
    ...   Expected Result: แสดงผลการเช็ค NCB ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_010
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                      


TS_16001_011 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_011
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Pre-Doc no  
    ...   Expected Result: แสดงข้อมูลเลข Pre Document No. ก่อนได้เลข Application no. ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_011
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}    
                                                                      
                                    
TS_16001_012 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_012
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Date
    ...   Expected Result: แสดงข้อมูลวันที่ Pre Document Date ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_012
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                      


TS_16001_013 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_013
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Status
    ...   Expected Result: แสดงสถานะการตรวจสอบเอกสารเบื้องต้นได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_013
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_014 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_014
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Pre-App
    ...   Expected Result: แสดงข้อมูล Pre Application No.ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_014
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_015 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_015
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Pre Judgment
    ...   Expected Result: แสดงผลการ Judgment เบื้องต้น ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_015
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_016 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_016
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Pre-App No
    ...   Expected Result: แสดงข้อมูล Pre Application No.ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_016
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_017 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_017
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Date
    ...   Expected Result: แสดงข้อมูลวันที่คีย์สมัครเข้าระบบได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_017
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_018 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_018
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Result
    ...   Expected Result: แสดงผลการอนุมัติ ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_018
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_019 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_019
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Appoint To.
    ...   Expected Result: แสดงข้อมูลสาขาที่ระบบ Send case ไปให้ ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_019
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_020 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_020
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Date
    ...   Expected Result: แสดงข้อมูลวันที่คีย์สมัครเข้าระบบได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_020
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_022 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_022
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Hub
    ...   Expected Result: แสดงข้อมูล Hub no.ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_022
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_023 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_023
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Vendor Code
    ...   Expected Result: แสดงข้อมูล Vendor code ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_023
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_024 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_024
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ App. Type
    ...   Expected Result: แสดงข้อมูลช่องทางที่สมัครเข้ามา ซึ่งมี 4 ช่องทางได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_024
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_025 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_025
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Application
    ...   Expected Result: แสดงข้อมูลสาขาที่คีย์ใบสมัครเข้ามาได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_025
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_026 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_026
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Judgment
    ...   Expected Result: แสดงสถานการณ์บันทึกข้อมูล Judgment ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_026
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_027 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_027
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ App. No
    ...   Expected Result: แสดงข้อมูล Application No. ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_027
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_028 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_028
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ App. No
    ...   Expected Result: แสดงข้อมูล Application No. ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_028
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_029 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_029
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Credit Code
    ...   Expected Result: แสดงข้อมูล Credit Code ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_029
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    App_No    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_030 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_030
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Apply Via
    ...   Expected Result: แสดงข้อมูล Credit Code ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_030
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_031 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_031
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Authorize
    ...   Expected Result: แสดงข้อมูล Authorize ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_031
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY FOR DATA FLOAT    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_032 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_032
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Apply channel
    ...   Expected Result: แสดงข้อมูลช่องทางที่สมัครเข้ามาได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_032
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_033 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_033
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Branch
    ...   Expected Result: แสดงข้อมูลสาขาที่ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_033
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_034 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_034
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Cust No
    ...   Expected Result: แสดงข้อมูล Customer no.ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_034
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY FOR DATA FLOAT    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_035 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_035
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Contract No.
    ...   Expected Result: แสดงข้อมูล Contract no ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_035
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_036 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_036
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Date
    ...   Expected Result: แสดงข้อมูลวันที่อนุมัติออกสัญญาได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_036
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_037 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_037
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Status
    ...   Expected Result: แสดงสถานะของสัญญาได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_037
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_038 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_038
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Approve Amount
    ...   Expected Result: แสดงวงเงินที่อนุมัติได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_038
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}                                                                      


TS_16001_039 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_039
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Application Details >> ฟิวส์ Approve Amount
    ...   Expected Result: แสดงข้อมูล Campaign ได้ถูกต้อง

    ${set_tc_file}     Set variable    TS_16001_039
    ${set_tc_value}    Set variable    Data_F_0016
    ${group_value}     Get value from json    ${RL_migrate_apply_process_RL_F_0016}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_feature.VERIFY DATA INQUIRY    ${set_tc_value}    ${set_tc_file}    
                        
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                    Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}  


TS_16001_040 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_040
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Speed Time Step>> ตรวจสอบในส่วนของ Process: KeyIn step1 และ KeyIn Step2
    ...   Expected Result: ระบบแสดงรายละเอียดฟิวส์ ดังนี้ ได้ถูกต้อง (Start)Date: แสดงวันที่เริ่มทำรายการ, (Start)Time: แสดงเวลาที่เริ่มทำรายการ, (Start)User: แสดง User ที่ทำรายการ
    ...    (End)Date: แสดงวันที่ทำรายการสำเร็จ, (End)Time: แสดงเวลาที่ทำรายการสำเร็จ, (End)User: แสดง User ทำรายการสำเร็จ                 
                            
    ${set_tc_value}    Set variable    TS_16001_040-045
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_page.CLICK SPEED TIME STEP BUTTON

                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    Start_Date_Key1   
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    Start_Time_Key1 
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    Start_User_Key1 
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    End_Date_Key1
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    End_Time_Key1
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    End_User_Key1
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    Start_Date_Key2  
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    Start_Time_Key2
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    Start_User_Key2
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    End_Date_Key2
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    End_Time_Key2
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP KEY IN    ${set_tc_value}    End_User_Key2
                            
                                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                        Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}  


TS_16001_041 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_041
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Speed Time Step>> ตรวจสอบในส่วนของ Process Interview/Verify Call  คอลัม TO
    ...   Expected Result: ระบบแสดงรายละเอียดฟิวส์ ดังนี้ ได้ถูกต้อง (Start)Date: แสดงวันที่เริ่มทำรายการ (Start)Time: แสดงเวลาที่เริ่มทำรายการ (Start)User: แสดง User ที่ทำรายการ
    ...    (End)Date: แสดงวันที่ทำรายการสำเร็จ (End)Time: แสดงเวลาที่ทำรายการสำเร็จ (End)User: แสดง User ทำรายการสำเร็จ               
                            
    ${set_tc_value}    Set variable    TS_16001_040-045
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]
            BuiltIn.Sleep    03s

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_page.CLICK SPEED TIME STEP BUTTON

                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    Date-Time_Start_TO
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    User_Start_TO
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    Date-Time_End_TO
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    User_End_TO
                            
                                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                        Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}       


TS_16001_042 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_042
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Speed Time Step>> ตรวจสอบในส่วนของ Process Interview/Verify Call  คอลัม TH
    ...   Expected Result: ระบบแสดงรายละเอียดฟิวส์ ดังนี้ ได้ถูกต้อง (Start)Date: แสดงวันที่เริ่มทำรายการ (Start)Time: แสดงเวลาที่เริ่มทำรายการ (Start)User: แสดง User ที่ทำรายการ
    ...    (End)Date: แสดงวันที่ทำรายการสำเร็จ (End)Time: แสดงเวลาที่ทำรายการสำเร็จ (End)User: แสดง User ทำรายการสำเร็จ               
                            
    ${set_tc_value}    Set variable    TS_16001_040-045
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]
            BuiltIn.Sleep    03s

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_page.CLICK SPEED TIME STEP BUTTON

                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    Date-Time_Start_TH
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    User_Start_TH
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    Date-Time_End_TH
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    User_End_TH
                            
                                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                        Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}       


TS_16001_043 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_043
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Speed Time Step>> ตรวจสอบในส่วนของ Process Interview/Verify Call  คอลัม TM
    ...   Expected Result: ระบบแสดงรายละเอียดฟิวส์ ดังนี้ ได้ถูกต้อง (Start)Date: แสดงวันที่เริ่มทำรายการ (Start)Time: แสดงเวลาที่เริ่มทำรายการ (Start)User: แสดง User ที่ทำรายการ
    ...    (End)Date: แสดงวันที่ทำรายการสำเร็จ (End)Time: แสดงเวลาที่ทำรายการสำเร็จ (End)User: แสดง User ทำรายการสำเร็จ               
                            
    ${set_tc_value}    Set variable    TS_16001_040-045
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]
            BuiltIn.Sleep    03s

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_page.CLICK SPEED TIME STEP BUTTON

                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    Date-Time_Start_TM
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    User_Start_TM
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    Date-Time_End_TM
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    User_End_TM
                            
                                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                        Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}       


TS_16001_044 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_044
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Speed Time Step>> ตรวจสอบในส่วนของ Process Interview/Verify Call  คอลัม TE
    ...   Expected Result: ระบบแสดงรายละเอียดฟิวส์ ดังนี้ ได้ถูกต้อง (Start)Date: แสดงวันที่เริ่มทำรายการ (Start)Time: แสดงเวลาที่เริ่มทำรายการ (Start)User: แสดง User ที่ทำรายการ
    ...    (End)Date: แสดงวันที่ทำรายการสำเร็จ (End)Time: แสดงเวลาที่ทำรายการสำเร็จ (End)User: แสดง User ทำรายการสำเร็จ               
                            
    ${set_tc_value}    Set variable    TS_16001_040-045
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]
            BuiltIn.Sleep    03s

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_page.CLICK SPEED TIME STEP BUTTON

                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    Date-Time_Start_TE
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    User_Start_TE
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    Date-Time_End_TE
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP VERIFY CALL    ${set_tc_value}    User_End_TE
                            
                                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                        Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}       


TS_16001_045 INQUIRY APPLICATION - VERIFY DISPLAY
    [Tags]    TS_16001_045
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวส์ที่แสดงข้อมูล Tab Speed Time Step>> ตรวจสอบในส่วนของ Process Interview/Verify Call  คอลัม TE
    ...   Expected Result: ระบบแสดงรายละเอียดฟิวส์ ดังนี้ ได้ถูกต้อง (Start)Date: แสดงวันที่เริ่มทำรายการ (Start)Time: แสดงเวลาที่เริ่มทำรายการ (Start)User: แสดง User ที่ทำรายการ
    ...    (End)Date: แสดงวันที่ทำรายการสำเร็จ (End)Time: แสดงเวลาที่ทำรายการสำเร็จ (End)User: แสดง User ทำรายการสำเร็จ               
                            
    ${set_tc_value}    Set variable    TS_16001_040-045
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0016_speed_time}    $[?(@.TC=='${set_tc_value}')]

        BuiltIn.Wait Until Keyword Succeeds   5x    3s    Inquiry_application_page.INPUT ID NUMBER    ${group_value}[0][ID_No]
            BuiltIn.Sleep    03s

            Inquiry_application_page.CLICK SEARCH BUTTON

                Inquiry_application_page.CLICK SELECT BUTTON
                    BuiltIn.Sleep    03s

                    Inquiry_application_page.CLICK SELECT BUTTON

                        Inquiry_application_page.CLICK SPEED TIME STEP BUTTON

                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Date_Jud_Start
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Time_Jud_Start
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    User_Jud_Start
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Date_Jud_End
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Time_Jud_End
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    User_Jud_End
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Date_ReChkVer_Start
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Time_ReChkVer_Start
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    User_ReChkVer_Start
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Date_ReChkVer_End
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Time_ReChkVer_End
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    User_ReChkVer_End
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Date_ReChkJud_Start
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Time_ReChkJud_Start
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    User_ReChkJud_Start
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Date_ReChkJud_End
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    Time_ReChkJud_End
                            Inquiry_application_feature.VERIFY DATA INQUIRY TAP SPEED TIME STEP JUDGMENT    ${set_tc_value}    User_ReChkJud_End
                            
                            
                                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    INQUIRY_APPLICATION

                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE   

                                        Common_keyword.CHOOSE MENU BY LOCATOR    ${menu_inquiry_application_locator}       