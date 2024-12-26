*** Settings ***
Resource    ${CURDIR}/../../../../Import/Path_import.robot


*** Keywords ***

VERIFY TITLE
    ${index_Title_TC}    BuiltIn.Set Variable    Manage
    ${data_excel_menu}    Get value from json    ${data_keyinstep1_verify_title_manage}     $[?(@.TC == '${index_Title_TC}')]
        
        ${title_value_page_manage}    Common_keyword.GET DATA TEXT BY LOCATOR    ${Loop_Verify_Title_Manageapp}
            BuiltIn.Should Be Equal As Strings    ${title_value_page_manage}    ${data_excel_menu}[0][Title] 


INPUT ID
    [Arguments]    ${group_value}

    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_SmartEnty_MangeApp_Textbox_ID}    ${Timeout}
        BuiltIn.Wait Until Keyword Succeeds   30x    1s    SeleniumLibrary.Input Text    ${Locator_SmartEnty_MangeApp_Textbox_ID}    ${group_value}[0][ID]


CLICK SEARCH
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_SmartEnty_MangeApp_Button_Search}    ${Timeout} 
        BuiltIn.Wait Until Keyword Succeeds   30x    1s    SeleniumLibrary.Click Element    ${Locator_SmartEnty_MangeApp_Button_Search}


CLICK HYPER LINK VIEW
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_SmartEnty_MangeApp_Hyperlink_View}    ${Timeout} 
        BuiltIn.Wait Until Keyword Succeeds   30x    1s    SeleniumLibrary.Click Element    ${Locator_SmartEnty_MangeApp_Hyperlink_View}


CLICK HYPER LINK PRINT
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_SmartEnty_MangeApp_Hyperlink_Print}    ${Timeout}
        BuiltIn.Wait Until Keyword Succeeds   30x    1s    SeleniumLibrary.Click Element    ${Locator_SmartEnty_MangeApp_Hyperlink_Print}


CLICK HYPER LINK KEY IN STEP 1
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_SmartEnty_MangeApp_Hyperlink_Key1}    ${Timeout}
        BuiltIn.Wait Until Keyword Succeeds   30x    1s    SeleniumLibrary.Click Element    ${Locator_SmartEnty_MangeApp_Hyperlink_Key1}