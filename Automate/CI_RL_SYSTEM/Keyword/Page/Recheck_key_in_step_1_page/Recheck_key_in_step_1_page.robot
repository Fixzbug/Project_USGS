*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot        # robotcode: ignore

*** Keywords ***

SELECT DROPDOWN TITLE NAME
    [Arguments]    ${group_value}
    Execute JavaScript    window.scrollTo(0, 0);
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Title}    ${group_value}[0][Title]     ${Dropdown_Title_Recheck}


CLICK BUTTON CONFIRM
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Comfirm}    ${Timeout}


CLICK BUTTON YES CONFIRM
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Yes}    ${Timeout}


INPUT LASER ID
    [Arguments]    ${group_value}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Dopa}    20s
    SeleniumLibrary.Input Text    ${Locator_LaserId}    ${group_value}[0][LaserID]


CLICK BUTTON DOPA
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Dopa}    ${Timeout} 


CLICK BUTTON YES DOPA
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Yes}    ${Timeout}    


CLICK BUTTON NCB
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR     ${Locator_Ncb}    ${Timeout}     


CLICK BUTTON SEND DOCUMENT
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Senddoc}    ${Timeout} 


RECHECK KEY IN STEP 1 - INPUT NAME ENG
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_name_eng}    CLOSING


RECHECK KEY IN STEP 1 - INPUT SURNAME ENG
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_surname_eng}    AUTOMATE


CICLK CONFIRM NAME ENG
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_confirm_name_eng}    ${Timeout}
 

SET EXCEL - RECHECK KEY IN STEP 1 
    [Arguments]    ${set_tc_value}
    ${group_value}    JSONLibrary.Get value from json    ${data_recheck_keyinstep1}    $[?(@.TC=='${set_tc_value}')]
    Recheck_key_in_step_1_feature.SET RECHECK KEY IN STEP 1    ${group_value}