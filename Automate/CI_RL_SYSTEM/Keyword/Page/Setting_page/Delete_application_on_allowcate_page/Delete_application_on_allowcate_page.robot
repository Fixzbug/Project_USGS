*** Settings ***
Resource    ${CURDIR}/../../../../Import/Path_import.robot

*** Keywords ***

CLICK MENU DELETE APPLICATION
    
        Execute JavaScript  window.scrollTo(0, 5000);
        
            SeleniumLibrary.Scroll Element Into View    ${menu_delete_application_on_allowcate_locator}

            Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${menu_delete_application_on_allowcate_locator} 


INPUT BRANCH DELETE 
    [Arguments]    ${branch_number}
    
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_branch_delete_application_locator}    ${branch_number}


INPUT APP NUMBER  
    [Arguments]    ${app_number}
    
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_application_delete_application_locator}    ${app_number}


CLICK SEARCH BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_search_application_delete_locator} 


CLICK DELETE BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_delete_application_locator} 


CLICK SIDEBAR DOWN BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_sidebar_down_locator} 


CLICK CLEAR BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_clear_delete_application_page_locator} 


VERIFY POPUP SUCCESS
    [Arguments]    ${data_excel}

    ${locator}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${lbl_success_verify_delete_application_page}    ${data_excel}
    
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    20