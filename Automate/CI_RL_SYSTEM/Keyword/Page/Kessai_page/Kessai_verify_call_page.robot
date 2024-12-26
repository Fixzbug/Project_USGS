*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***
KESSAI VERIFY CALL - WAIT VIEW CUSTOMER VERIFY CALL JUDGMENT (KESSAI)
    SeleniumLibrary.Wait Until Element Is Visible    ${lbl_vcust_vcall_judg_kes}    ${Timeout} 


KESSAI VERIFY CALL - WAIT FILTER NOTE
    Execute JavaScript    document.body.style.transform = 'scale(1.0)'
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Execute JavaScript    window.scrollTo(0, 0);
    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    //table[@id="tableNote"]    30s


KESSAI VERIFY CALL - CHECK APP NO AND BRANCH
    ${result_application}    SeleniumLibrary.Get Text    //label[@id="lbl_BranchNo_ApplicationNo"]
    ${cleaned}    BuiltIn.Evaluate    "${result_application}".replace(' ', '')  # ลบช่องว่างทั้งหมดออก

    # ตรวจสอบว่าเจอ ':' หรือ ช่องว่าง
    ${colon_index}    BuiltIn.Evaluate    "${cleaned}".find(':')
    ${space_index}    BuiltIn.Evaluate    "${cleaned}".find(' ')

    IF  ${colon_index} > 0 and ${space_index} < 0
        BuiltIn.Log   CASE_>SEMICOLON    WARN
        ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    //label[@id="lbl_BranchNo_ApplicationNo"]    :    Full
        ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
        ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
    ELSE
        BuiltIn.Log   CASE_>SPACE    WARN
        ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    //label[@id="lbl_BranchNo_ApplicationNo"]    ${SPACE}    Full
        ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
        ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
    END    
    
    BuiltIn.Set global Variable     ${strip_result_branch}
    BuiltIn.Set global Variable     ${strip_result_appno}
    BuiltIn.Log    Strip Branch->${strip_result_branch}->Strip App No->${strip_result_appno}    WARN
    BuiltIn.Log    App No to use:${app_no}    WARN
    

KESSAI VERIFY CALL - CLICK TAB VERIFY CALL 
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Tap_Verifycall}    ${Timeout} 
    BuiltIn.Sleep    5s
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    SeleniumLibrary.Click Element    ${Locator_Tap_Verifycall} 


KESSAI VERIFY CALL - CLICK BUTTON CONFIRM CUSTTYPE
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_btn_custtype}
    BuiltIn.Sleep    10s
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_btn_custtype}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_btn_custtype}


KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TO
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_btn_TO}     
    BuiltIn.Sleep    01s
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_btn_TO}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_btn_TO}     


KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TH
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_btn_TH}      
    BuiltIn.Sleep    01s
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_btn_TH}    ${Timeout}              
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_btn_TH}


KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TM
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_btn_TM}    
    BuiltIn.Sleep    01s
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_btn_TM}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_btn_TM}


KESSAI VERIFY CALL - CLICK BUTTON CONFIRM TE
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Confirm_TE}       
    BuiltIn.Sleep    01s      
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_Confirm_TE}    ${Timeout}        
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_Confirm_TE}

#Popup
KESSAI VERIFY CALL - WAIT POPUP SUCCESS
    SeleniumLibrary.Wait Until Element Is Visible    ${popup_kes_verifycall_success}    ${Timeout}
    BuiltIn.Sleep    2s


KESSAI VERIFY CALL - WAIT POPUP SUCCESS TO
    SeleniumLibrary.Wait Until Element Is Visible    ${popup_kes_verifycall_success_TO}    ${Timeout}
    BuiltIn.Sleep    2s


KESSAI VERIFY CALL - WAIT POPUP SUCCESS TH
    SeleniumLibrary.Wait Until Element Is Visible    ${popup_kes_verifycall_success_TH}    ${Timeout}
    BuiltIn.Sleep    2s


KESSAI VERIFY CALL - WAIT POPUP SUCCESS TM
    SeleniumLibrary.Wait Until Element Is Visible    ${popup_kes_verifycall_success_TM}    ${Timeout}
    BuiltIn.Sleep    2s


KESSAI VERIFY CALL - WAIT POPUP SUCCESS TE
    SeleniumLibrary.Wait Until Element Is Visible    ${popup_kes_verifycall_success_TE}    ${Timeout}
    BuiltIn.Sleep    3s 


INPUT ID NUMBER  
    [Arguments]    ${id_number}
    
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_id_key2_locator}    ${id_number}


CLICK SEARCH BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_search_kessai_verifycall_locator} 


CLICK SELECT BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_sel_kessai_verifycall_locator}


# Retrun
KESSAI VERIFY CALL - RETURN TO VERIFY
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    SeleniumLibrary.Scroll Element Into View    //button[@id="btn_Return"]
    BuiltIn.Sleep    10s
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    //button[@id="btn_Return"]        30s
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    //button[@id="btn_return_INT"]    30s

    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    //div[@id="modalSetStatus"]    20s

    # ${Found_modal}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    //div[@id="modalSetStatus"]    30s
    # BuiltIn.Wait Until Keyword Succeeds   2x    2s     BuiltIn.Run Keyword If    '${Found_modal}' == 'True'       BuiltIn.Sleep    15s

    # ${Found_popup_warning}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    (//h4[@class="ui-pnotify-title" and text()="warning"])[1]    10s
    # BuiltIn.Set global Variable     ${Found_popup_warning}
    # IF    '${Found_popup_warning}' == 'True'
    #     Common_keyword.INTRANET TEARDOWN
    #     BuiltIn.Fail    !! NOT FOUND TASK !!
    # END