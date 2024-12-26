*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***

CLICK MENU INQUIRY APPLICATION
    BuiltIn.Wait Until Keyword Succeeds   30x    1s    SeleniumLibrary.Scroll Element Into View    ${menu_inquiry_application_locator}
        BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${menu_inquiry_application_locator} 


CLICK SEARCH BUTTON
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_search_inquiry_locator} 


INPUT ID NUMBER  
    [Arguments]    ${id_number}
    
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_id_no_inquiry_locator}    ${id_number}

        ${Status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${lbl_please_input_data_before_search}

            BuiltIn.Run Keyword If    '${Status}'=='True'    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_id_no_inquiry_locator}    ${id_number}


SELECT DROPDOWN MODE WORK PROCESS
    SeleniumLibrary.Wait Until Element Is Visible    ${Mode_Process_Locator}    ${Timeout}
        BuiltIn.Wait Until Keyword Succeeds   20x    1s    Select From List By Label    ${Dropdown_Mode_Process}    Manual


CLICK BUTTON CONFIRM
    SeleniumLibrary.Wait Until Element Is Visible    ${Confirm_Locator}    15s
        BuiltIn.Wait Until Keyword Succeeds   20x    1s    Run Keyword And Continue On Failure    Click Element    ${Confirm_Locator}    
            Execute JavaScript    window.scrollTo(0,20);


SELECT DROPDOWN BRANCH
    [Arguments]    ${group_value_branch}

    ${Convert_done}    CONVERT DATA FLOAT TO STRING    ${group_value_branch}[0][BOTEN]
        BuiltIn.Wait Until Keyword Succeeds   10x    1s    SELECT CHANGE PRIORITY    ${Branch_Chosen_Locator}    ${Convert_done}     ${Dropdown_Branch_Loop}


CLICK SELECT BUTTON
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_select_locator}


GET APP NO
    ${text}    BuiltIn.Wait Until Keyword Succeeds   10x    1s    SeleniumLibrary.Get Text    ${lbl_app_no_inquiry_locator}
    ${value}    String.Split string    ${text}    -
    RETURN    ${value}[0]   ${value}[1] 


INPUT NAME  
    [Arguments]    ${name}
    
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_name_inquiry_locator}    ${name}

        ${Status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${lbl_please_input_data_before_search}

            BuiltIn.Run Keyword If    '${Status}'=='True'    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_name_inquiry_locator}    ${name}


INPUT SURNAME  
    [Arguments]    ${surname}
    
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_surname_inquiry_locator}    ${surname}

        ${Status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${lbl_please_input_data_before_search}

            BuiltIn.Run Keyword If    '${Status}'=='True'    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_surname_inquiry_locator}    ${surname}


CLICK CLEAR BUTTON
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_clear_inquiry_locator} 


CLICK SPEED TIME STEP BUTTON
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_speed_time_step_inquiry_locator} 