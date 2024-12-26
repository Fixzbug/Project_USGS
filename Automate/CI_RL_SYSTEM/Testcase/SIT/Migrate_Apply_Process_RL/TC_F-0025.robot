*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot
Suite Setup    Common_feature.SET UP DELETE APPLICATION

# // Project Doc No. 66060240

*** Test Cases ***

TS_25001_003 DELETE APPLICATIONON ALLOCATE - VERIFY DISPLAY
    [Tags]    TS_25001_003
    [Documentation]
    ...   Condition: ตรวจสอบการใช้งานแถบปุ่มดำเนินการ >> ปุ่ม Clear
    ...   Expected Result: สามารถกดปุ่มเมื่อต้องการเคลียร์ค่าบนหน้าจอ ได้ถูกต้อง

    ${set_tc_value}    Set variable    TS_25001_003
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0025}    $[?(@.TC=='${set_tc_value}')]

        ${App_no}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value}[0][App_no]

            Delete_application_on_allowcate_page.INPUT BRANCH DELETE    ${group_value}[0][Branch_Delete]

                Delete_application_on_allowcate_page.INPUT APP NUMBER    ${App_no}

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    DELETE APPLICATIONON ALLOCATE BEFORE
                        Capture_screen.CAPTURE SCREEN CURRENT PAGE

                        Delete_application_on_allowcate_page.CLICK CLEAR BUTTON

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    DELETE APPLICATIONON ALLOCATE AFTER
                                Capture_screen.CAPTURE SCREEN CURRENT PAGE


TS-25001_006 DELETE APPLICATIONON ALLOCATE - VERIFY DISPLAY
    [Tags]    TS_25001_006
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ >> App No
    ...   Expected Result: ระบบแสดงข้อมูล Application No ได้ถูกต้อง

    ${set_tc_value}     Set variable      TS_25001_006
    ${group_value}     Get value from json      ${RL_migrate_apply_process_RL_F_0025}       $[?(@.TC=='${set_tc_value}')]

        ${App_no}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value}[0][App_no]

            Delete_application_on_allowcate_page.INPUT BRANCH DELETE    ${group_value}[0][Branch_Delete]

                Delete_application_on_allowcate_page.INPUT APP NUMBER    ${App_no}

                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    DELETE APPLICATIONON ALLOCATE
                        Capture_screen.CAPTURE SCREEN CURRENT PAGE

                        Delete_application_on_allowcate_page.CLICK CLEAR BUTTON


TS-25001_007 DELETE APPLICATIONON ALLOCATE - VERIFY DISPLAY
    [Tags]    TS_25001_007
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ >> Location
    ...   Expected Result: ระบบแสดงข้อมูล Location ปัจจุบัน ได้ถูกต้อง

    ${set_tc_value}     Set variable      TS_25001_007
    ${group_value}     Get value from json      ${RL_migrate_apply_process_RL_F_0025}       $[?(@.TC=='${set_tc_value}')]
        
        ${App_no}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value}[0][App_no]

            Delete_application_on_allowcate_page.INPUT BRANCH DELETE    ${group_value}[0][Branch_Delete]

                Delete_application_on_allowcate_page.INPUT APP NUMBER    ${App_no}

                    Delete_application_on_allowcate_page.CLICK SEARCH BUTTON

                        SeleniumLibrary.Wait Until Element Is Visible    ${btn_delete_application_locator}    10

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    DELETE APPLICATIONON ALLOCATE
                                Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                Delete_application_on_allowcate_page.CLICK CLEAR BUTTON


TS-25001_008 DELETE APPLICATIONON ALLOCATE - VERIFY DISPLAY
    [Tags]    TS_25001_008
    [Documentation]
    ...   Condition: ตรวจสอบรายละเอียดฟิวด์บนหน้าจอ >> Location (AutoAllocate)
    ...   Expected Result: ระบบแสดงข้อมูล Location ที่ระบบ Auto Allocate ได้ถูกต้อง

    ${set_tc_value}     Set variable      TS_25001_008
    ${group_value}     Get value from json      ${RL_migrate_apply_process_RL_F_0025}       $[?(@.TC=='${set_tc_value}')]

        ${App_no}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value}[0][App_no]

            Delete_application_on_allowcate_page.INPUT BRANCH DELETE    ${group_value}[0][Branch_Delete]

                Delete_application_on_allowcate_page.INPUT APP NUMBER    ${App_no}

                    Delete_application_on_allowcate_page.CLICK SEARCH BUTTON

                        SeleniumLibrary.Wait Until Element Is Visible    ${btn_delete_application_locator}    10

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    DELETE APPLICATIONON ALLOCATE
                                Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                Delete_application_on_allowcate_page.CLICK CLEAR BUTTON


TS-25002_001 DELETE APPLICATIONON ALLOCATE - VERIFY DISPLAY
    [Tags]    TS_25002_001
    [Documentation]
    ...   Condition: ตรวจสอบขั้นตอนการทำงานและเงื่อนไข >> กรณีค้นหาข้อมูล Application ที่ต้องการลบ
    ...   Expected Result: ระบบสามารถค้นหาข้อมูล Application ที่ต้องการลบข้อมูล Auto Allocate ได้ถูกต้อง

    ${set_tc_value}     Set variable      TS_25002_001
    ${group_value}     Get value from json      ${RL_migrate_apply_process_RL_F_0025}       $[?(@.TC=='${set_tc_value}')]
        
        ${App_no}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value}[0][App_no]

            Delete_application_on_allowcate_page.INPUT BRANCH DELETE    ${group_value}[0][Branch_Delete]

                Delete_application_on_allowcate_page.INPUT APP NUMBER    ${App_no}

                    Delete_application_on_allowcate_page.CLICK SEARCH BUTTON

                        SeleniumLibrary.Wait Until Element Is Visible    ${btn_delete_application_locator}    10

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    DELETE APPLICATIONON ALLOCATE
                                Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                Delete_application_on_allowcate_page.CLICK CLEAR BUTTON
        


TS-25002_002 DELETE APPLICATIONON ALLOCATE - VERIFY DISPLAY
    [Tags]    TS_25002_002
    [Documentation]
    ...   Condition: ตรวจสอบขั้นตอนการทำงานและเงื่อนไข >> กรณีค้นหาข้อมูล Application ที่ต้องการลบ
    ...   Expected Result: ระบบสามารถค้นหาข้อมูล Application ที่ต้องการลบข้อมูล Auto Allocate ได้ถูกต้อง

    ${set_tc_value}     Set variable      TS_25002_002
    ${group_value}     Get value from json      ${RL_migrate_apply_process_RL_F_0025}       $[?(@.TC=='${set_tc_value}')]
        
        ${App_no}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value}[0][App_no]

            Delete_application_on_allowcate_page.INPUT BRANCH DELETE    ${group_value}[0][Branch_Delete]

                Delete_application_on_allowcate_page.INPUT APP NUMBER    ${App_no}

                    Delete_application_on_allowcate_page.CLICK SEARCH BUTTON

                        Delete_application_on_allowcate_page.CLICK DELETE BUTTON

                            Delete_application_on_allowcate_page.VERIFY POPUP SUCCESS    ${group_value}[0][verify_popup]    #Delete data complete.

                                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    DELETE APPLICATIONON ALLOCATE
                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                    Delete_application_on_allowcate_page.CLICK CLEAR BUTTON

        
TS-25002_003 DELETE APPLICATIONON ALLOCATE - VERIFY DISPLAY
    [Tags]    TS_25002_003
    [Documentation]
    ...   Condition: ตรวจสอบขั้นตอนการทำงานและเงื่อนไข DELETE APPLICATIONON ALLOCATE
    ...   Expected Result: ข้อมูลต้องไม่ถูกนำไปจัดสรรแบบ Auto Allocate อีกได้ถูกต้อง

    ${set_tc_value}     Set variable      TS_25002_003
    ${group_value}     Get value from json      ${RL_migrate_apply_process_RL_F_0025}       $[?(@.TC=='${set_tc_value}')]

        ${App_no}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value}[0][App_no]

            Delete_application_on_allowcate_page.INPUT BRANCH DELETE    ${group_value}[0][Branch_Delete]

                Delete_application_on_allowcate_page.INPUT APP NUMBER    ${App_no}

                    Delete_application_on_allowcate_page.CLICK SEARCH BUTTON

                    SeleniumLibrary.Wait Until Element Is Not Visible    ${btn_delete_application_locator}    10

                        BuiltIn.Sleep    7

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    DELETE APPLICATIONON ALLOCATE
                                Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                Delete_application_on_allowcate_page.CLICK CLEAR BUTTON