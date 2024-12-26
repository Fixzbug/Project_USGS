*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***

SET VERIFY CALL INPUT TO NEXT STEP
    [Arguments]    ${group_value}

    Verify_call_page.VERIFY CALL - CLICK TAP VERIFY CALL
    BuiltIn.Wait Until Keyword Succeeds   2x    2s      SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_Companytype}    ${Timeout}
    ${Compayny}    Get Text    ${Locator_Verify_Verifycall_typecus}
    VERIFY - CHECK APP NO AND BRANCH    # get appno

    # ถ้าเลข appno ไม่ตรง
    IF    '${app_no}' != '${strip_result_appno}'
        VERIFY - PENDING CASE
        Common_keyword.INTRANET TEARDOWN
        Viewcustomer_feature.SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE VIEWCUSTOMER
    END

    # Type of Customer
    IF    '${Compayny}'!='O : ลูกค้าเก่า ทุกธุรกิจ'    
        Verify_call_page.VERIFY CALL - SELECT DROPDOWN COMPANY TYPE    ${group_value}
        BuiltIn.Run Keyword And Ignore Error    Verify_call_page.VERIFY CALL - SELECT DROPDOWN BOL    ${group_value}
        Verify_call_page.VERIFY CALL - CLICK BUTTON CUSTYPE

    ELSE
        Verify_call_page.VERIFY CALL - SELECT DROPDOWN COMPANY TYPE    ${group_value}
        Verify_call_page.VERIFY CALL - SELECT DROPDOWN SUBTYPE    ${group_value}
        # BuiltIn.Run Keyword And Ignore Error    Verify_call_page.VERIFY CALL - SELECT DROPDOWN BOL    ${group_value}
        Verify_call_page.VERIFY CALL - CLICK BUTTON CUSTYPE

    END
 
    # BuiltIn.Run Keyword And Ignore Error    Verify_call_page.VERIFY CALL - SELECT DROPDOWN INTRODUCER TO    ${group_value}

    # Verify TO
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN SALARY TYPE        ${group_value}
    Verify_call_page.VERIFY CALL - INPUT SALARY PER MONTH             ${group_value}
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN SSO TO             ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Verify_call_page.VERIFY CALL - SELECT DROPDOWN CHECK BOL          ${group_value}
    Verify_call_page.VERIFY CALL - INPUT TELOFFICE TO                 ${group_value}
    Verify_call_page.VERIFY CALL - INPUT TEL BRANCH TO                ${group_value}
    Verify_call_page.VERIFY CALL - INPUT MOBILE TO                    ${group_value}
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN CHECKNAME TO       ${group_value}    
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN ADDRESSE TO        ${group_value}
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN STATUS TO          ${group_value}                            
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN CONTACT TO         ${group_value}
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN INFORMANT TO       ${group_value}
    Verify_call_page.VERIFY CALL - INPUT INFORMANT TO                 ${group_value}
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN EMPLOYMENT TYPE    ${group_value}
    Verify_call_page.VERIFY CALL - INPUT CERTIFICATE TO               ${group_value}
    Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TO
    Verify_call_page.VERIFY CALL - VERIFY POPUP SUCCESS TO
    # ------------------------------------------------------------------------------

    # Verify TH
    Verify_call_page.VERIFY CALL - INPUT TEL TH                         ${group_value}
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN CHECK NAME TH        ${group_value}
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN CHECK ADDRESS TH     ${group_value}
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN CHECK TEL TYPE TH    ${group_value}                                
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN CONT TH              ${group_value}   
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN PERSON TH            ${group_value}  
    Verify_call_page.VERIFY CALL - INPUT PERSON TH                      ${group_value}
    Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TH
    Verify_call_page.VERIFY CALL - VERIFY POPUP SUCCESS TH
    # ------------------------------------------------------------------------------

    # Verify TH
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN PERSON TM    ${group_value}
    Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TM
    Verify_call_page.VERIFY CALL - VERIFY POPUP SUCCESS TM
    # ------------------------------------------------------------------------------

    # Verify TE
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN REL TE     ${group_value}                                          
    Verify_call_page.VERIFY CALL - SCROLL TO BUTTON SAVE TE                                                               

    ${Status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${Locator_Verify_Judment_Table_TE}    15s
    BuiltIn.Log     ${Status}    WARN

    IF    '${Status}' == 'True'                                                                                                                                                                                           
        ${Text_flag}    Get Text    ${Locator_Verify_Approve_Table_Flag}
        ${Flax_status}    Run Keyword And Return Status    Should Be Equal    ${Text_flag}    Y

        IF    '${Flax_status}' == 'True'
            Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TE
        ELSE
        Verify_call_page.VERIFY CALL - CLICK EDIT 
        Verify_call_page.VERIFY CALL - CLICK BUTTON FLAG Y TE
        Verify_call_page.VERIFY CALL - CLICK BUTTON SAVE TE
        Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TE
        END

    ELSE                                                                      

        Verify_call_page.VERIFY CALL - INPUT NAME TE             ${group_value}
        Verify_call_page.VERIFY CALL - INPUT SURNAME TE          ${group_value}
        Verify_call_page.VERIFY CALL - INPUT TEL TE              ${group_value}
        Verify_call_page.VERIFY CALL - INPUT OFFICE TE           ${group_value}
        Verify_call_page.VERIFY CALL - INPUT MOBILE TE           ${group_value}
        Verify_call_page.VERIFY CALL - CLICK BUTTON FLAG TE      ${group_value}
        Verify_call_page.VERIFY CALL - CLICK BUTTON SAVE TE
        Verify_call_page.VERIFY CALL - VERIFY TABLE IS FOUND
        Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TE

    END
    # ------------------------------------------------------------------------------
    BuiltIn.Sleep    5s
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_CALL_PAGE
    Capture_screen.CAPTURE SCREEN CURRENT PAGE
        

SET CONDITION FLAG NOT EQUAL Y 

    Verify_call_page.VERIFY CALL - CLICK EDIT     

    Verify_call_page.VERIFY CALL - CLICK BUTTON FLAG Y TE

    Verify_call_page.VERIFY CALL - CLICK BUTTON SAVE TE

    Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TE    


SET VERIFY CALL INPUT TO NEXT STEP (CLOSING)
    [Arguments]    ${group_value}

    Verify_call_page.VERIFY CALL - CLICK TAP VERIFY CALL
    Wait Until Element Is Visible    ${Locator_Verify_Verifycall_Companytype}    ${Timeout}
    ${Compayny}    Get Text    ${Locator_Verify_Verifycall_typecus}

    IF    '${Compayny}'!='O : ลูกค้าเก่า ทุกธุรกิจ'    
    
        Verify_call_page.VERIFY CALL - SELECT DROPDOWN COMPANY TYPE    ${group_value}
        Verify_call_page.VERIFY CALL - CLICK BUTTON CUSTYPE

    ELSE

        Verify_call_page.VERIFY CALL - SELECT DROPDOWN SUBTYPE    ${group_value}
        Verify_call_page.VERIFY CALL - SELECT DROPDOWN COMPANY TYPE    ${group_value}
        # Verify_call_page.VERIFY CALL - SELECT DROPDOWN BOL    ${group_value}
        Verify_call_page.VERIFY CALL - CLICK BUTTON CUSTYPE

    END
    
    Verify_call_page.VERIFY CALL - SELECT DROPDOWN PERSON TM    ${group_value}
                                                                                                                                    
    Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TM        

    Scroll Element Into View    ${Locator_Verify_Verifycall_Save_TE}

    ${Status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${Locator_Verify_Judment_Table_TE}    05s
                                                                        
    BuiltIn.Sleep    01s

    IF    '${Status}' == 'True'                                                                                                                                                                                           

        ${Text_flag}    Get Text    ${Locator_Verify_Approve_Table_Flag}
                                                                
        ${Flax_status}    Run Keyword And Return Status    Should Be Equal    ${Text_flag}    Y
                                                                
            IF    '${Flax_status}' == 'True'

                Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TE

            ELSE

                Verify_call_page.VERIFY CALL - CLICK EDIT 

                Verify_call_page.VERIFY CALL - CLICK BUTTON FLAG Y TE
            
                Verify_call_page.VERIFY CALL - CLICK BUTTON SAVE TE
        
                Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TE

            END
                                                            
    ELSE                                                                      

        Verify_call_page.VERIFY CALL - SCROLL TO BUTTON SAVE TE                                                               

        Verify_call_page.VERIFY CALL - SELECT DROPDOWN REL TE    ${group_value}

        Verify_call_page.VERIFY CALL - INPUT NAME TE    ${group_value} 

        Verify_call_page.VERIFY CALL - INPUT SURNAME TE    ${group_value}      

        Verify_call_page.VERIFY CALL - INPUT TEL TE    ${group_value} 

        Verify_call_page.VERIFY CALL - INPUT OFFICE TE    ${group_value}         

        Verify_call_page.VERIFY CALL - INPUT MOBILE TE    ${group_value} 

        Verify_call_page.VERIFY CALL - INPUT MOBILE 2 TE    ${group_value} 

        Verify_call_page.VERIFY CALL - INPUT MOBILE 3 TE    ${group_value} 

        Verify_call_page.VERIFY CALL - CLICK BUTTON FLAG Y TE

        Verify_call_page.VERIFY CALL - CLICK BUTTON SAVE TE

        Verify_call_page.VERIFY CALL - CLICK BUTTON CONFIRM TE
    END      


SEARCH AND SELECT CUTTOMER BY ID NUMBER    
    [Arguments]    ${set_tc_value_case}    ${data_sheet}

    ${set_tc_value}     BuiltIn.Set Variable      ${set_tc_value_case}
    ${group_value}     Get value from json      ${data_sheet}       $[?(@.TC=='${set_tc_value}')]

    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Verify_call_page.INPUT ID NUMBER    ${group_value}[0][ID]

        BuiltIn.Wait Until Keyword Succeeds   10x    1s    Verify_call_page.CLICK SEARCH BUTTON

            BuiltIn.Wait Until Keyword Succeeds   10x    1s    Verify_call_page.CLICK SELECT BUTTON


VERIFY - CHECK APP NO AND BRANCH
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


VERIFY - PENDING CASE
    BuiltIn.Log    !!! CHECK POPUP PENDING !!!    WARN
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_pending_key2}    60s
    BuiltIn.Sleep  2s
    BuiltIn.Wait Until Keyword Succeeds   2x    2s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_pending_key2}    60s
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_dropdown_pending_key2}    PD17
    BuiltIn.Sleep  2s
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    SeleniumLibrary.Press Keys    NONE    ENTER
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_note_pending_key2}    Automate Pending
    BuiltIn.Sleep  2s
    BuiltIn.Wait Until Keyword Succeeds   2x    2s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_addnote_pending_key2}    60s
    BuiltIn.Sleep  2s
    BuiltIn.Wait Until Keyword Succeeds   2x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${btn_ok_pending_key2}    30s

    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    //div[@id="modalSetStatus"]    20s

    # ${Found_modal}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    //div[@id="modalSetStatus"]    30s
    # BuiltIn.Wait Until Keyword Succeeds   2x    2s     BuiltIn.Run Keyword If    '${Found_modal}' == 'True'       BuiltIn.Sleep    15s

    # ${Found_popup_warning}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    (//h4[@class="ui-pnotify-title" and text()="warning"])[1]    10s
    # BuiltIn.Set global Variable     ${Found_popup_warning}
    # IF    '${Found_popup_warning}' == 'True'
    #     Common_keyword.INTRANET TEARDOWN
    #     BuiltIn.Fail    !! NOT FOUND TASK !!
    # END