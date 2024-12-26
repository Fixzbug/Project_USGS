*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot


*** Variables ***


*** Keywords ***

SELECT BRANCH
    [Arguments]    ${branch}    ${sheet_excel}

    ${set_tc_value_Case}    BuiltIn.Set Variable    ${branch}
        ${group_value}    Get value from json    ${sheet_excel}    $[?(@.TC=='${set_tc_value_Case}')]

        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_feature.SET SELECT BRANCH KEYINSTEP 1    ${group_value}

CHOOSE MENU RL
    [Arguments]    ${Name_Menu}
    
    ${locator_Menu}    String.Replace string    ${Locator_Menu}    ***replace***    ${Name_Menu}

        SeleniumLibrary.Wait Until Element Is Visible    ${locator_Menu}   ${Timeout}
            BuiltIn.Wait Until Keyword Succeeds   10x    2s    SeleniumLibrary.Click Element    ${locator_Menu}