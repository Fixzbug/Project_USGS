*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot
Suite Setup    SET UP ALL FOR MIGRATE RL CONTROL CHECK ID CARD WITH DOPA
# // Project Doc No. 66060240

*** Keywords ***

SET UP ALL FOR MIGRATE RL CONTROL CHECK ID CARD WITH DOPA
    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login]
    Sync_sheet_excel.GET ALL DATA FROM EXCEL MIGRATE APPLY PROCESS RL    ${excel}[Migrate_Apply_Process_RL]
        Login_page.SET LOGIN SSO TO RL    Kessai   
            Changepriority_page.CHANGE PRIORITY - SELECT DROPDOWN MODE WORK PROCESS    # เลือก Manual
                Key_in_step_1_feature.SET SELECT BRANCH    Branch
                    
                    # Scroll down ใช้สำหรับทำ Scroll Element Intro view ไปยัง menu ที่อยู่ล่างสุดก่อน
                    ${locator_scroll_down}    String.Replace string    ${Locator_Menu}    ***replace***    DELETE APPLICATIONON ALLOCATE
                        SeleniumLibrary.Wait Until Element Is Visible    ${locator_scroll_down}   timeout=30s
                        SeleniumLibrary.Scroll Element Into View    ${locator_scroll_down}
                    
                            # Click menu
                            Key_in_step_1_page.CHOOSE MENU INTERVIEW RL    CONTROL CHECK ID CARD WITH DOPA

*** Test Cases ***

TS_37001_001 CONTROL CHECK ID CARD WITH DOPA - VERIFY DISPLAY
    [Tags]    TS_37001_001
    [Documentation]
    ...    Condition: ตรวจสอบวิธีการเข้าใช้งานเมนู CONTROL CHECK ID CARD WITH DOPA ผ่าน SETTING
    ...    Expected Result: สามารถเข้าใช้งานเมนู CONTROL CHECK ID CARD WITH DOPA ได้
    
    SeleniumLibrary.Wait Until Element Is Visible    ${text_control_check_ID_card_with_DOPA_locator}    timeout=30s
 
        # Capture_Screen
        BuiltIn.Sleep    05s
        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
        Capture_screen.CAPTURE SCREEN CURRENT PAGE


TS_37001_002 CONTROL CHECK ID CARD WITH DOPA - VERIFY DISPLAY
    [Tags]    TS_37001_002
    [Documentation]
    ...    Condition: ตรวจสอบการใช้งานแถบปุ่มดำเนินการ >> ปุ่ม Confirm
    ...    Expected Result: สามารถกดปุ่มเมื่อต้องการยืนยันข้อมูลที่เลือก
    
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_confirm_control_check_ID_card_with_DOPA_locator}    timeout=30s
    SeleniumLibrary.Click Element    ${btn_confirm_control_check_ID_card_with_DOPA_locator}

        SeleniumLibrary.Wait Until Page Contains    Save Dopa Control Success    timeout=10s

        # Capture_Screen
        BuiltIn.Sleep    03s
        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DISPLAY
        Capture_screen.CAPTURE SCREEN CURRENT PAGE