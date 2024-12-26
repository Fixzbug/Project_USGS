*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***

KESSAI JUDMENT APPROVE - SELECT DROPDOWN DOCUMENT APPROVE
    [Arguments]    ${group_value}
    
    Execute JavaScript    document.body.style.transform = 'scale(1.0)'
        SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_Doc}    ${Timeout}
            BuiltIn.Sleep    03s

                BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_Doc}    ${group_value}[0][Doc_Approve]    ${Dropdown_Judment_Doc}
      
 
KESSAI JUDMENT APPROVE - INPUT NAME ENG
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Name_EN}    ${group_value}[0][Name_EN]            


KESSAI JUDMENT APPROVE - INPUT LAST NAME ENG
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_LastName_EN}    ${group_value}[0][LastName_EN]
        BuiltIn.Sleep    01s

        
KESSAI JUDMENT APPROVE - SELECT DROPDOWN BUILDIN
    [Arguments]    ${group_value}

    # BuiltIn.Wait Until Keyword Succeeds   20x    1s    Execute JavaScript    window.scrollTo(0,700);
    
        BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Approve_Buildin}    ${group_value}[0][Build_Approve]    ${Dropdown_Judment_BuildIn}


KESSAI JUDMENT APPROVE - INPUT BUILDIN 
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Buildin_textbox}    ${group_value}[0][BuildIn]    


KESSAI JUDMENT APPROVE - INPUT ADDRESS
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Address}    ${group_value}[0][AddreesNo] 


KESSAI JUDMENT APPROVE - INPUT MOO
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Moo}    ${group_value}[0][Moo] 


KESSAI JUDMENT APPROVE - INPUT ROAD
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Road}    ${group_value}[0][Road] 


KESSAI JUDMENT APPROVE - SELECT DROPDOWN PAYMENT TYPE
    [Arguments]    ${group_value}

    # BuiltIn.Wait Until Keyword Succeeds   50x    1s    Execute JavaScript    window.scrollTo(0,1400);

        BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Approve_PayType}    ${group_value}[0][Payment_type]   ${Dropdown_Judment_PayType} 


KESSAI JUDMENT APPROVE - SELECT DROPDOWN REC TYPE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Approve_recType}    ${group_value}[0][recType_Approve]    ${Dropdown_Judment_RecType}


KESSAI JUDMENT APPROVE - SELECT DROPDOWN FIRSTLOAN
    [Arguments]    ${group_value}

    # BuiltIn.Wait Until Keyword Succeeds   50x    1s    Execute JavaScript    window.scrollTo(0,1600);

        BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Approve_FirstLoanType}    ${group_value}[0][Firstloan_Apporve]    ${Dropdown_Judment_FirstloanType}


KESSAI JUDMENT APPROVE - CLICK BUTTON CONFIRM

    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Approve_ConfirmApprove}    ${Timeout}  
        BuiltIn.Wait Until Keyword Succeeds   20x    2s    SeleniumLibrary.Click Element    ${Locator_Verify_Approve_ConfirmApprove}


KESSAI JUDMENT APPROVE - CLICK BUTTON YES CONFIRM
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Execute JavaScript    window.scrollTo(0,0);
        SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Approve_Yes_Confirm}    ${Timeout}
            BuiltIn.Wait Until Keyword Succeeds   20x    2s    SeleniumLibrary.Click Element    ${Locator_Verify_Approve_Yes_Confirm}


KESSAI JUDMENT APPROVE - CAPTURE SCREEN
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Text_Contact}    ${Timeout}
        ${Contract}    SeleniumLibrary.Get Text    ${Locator_Text_Contact}
            BuiltIn.Log    ${Contract}    

                BuiltIn.Wait Until Keyword Succeeds   10x    1s    Capture_Screen.CAPTURE SCREEN KESSAI


SET EXCEL - KESSAI JUDMENT APPROVE
    [Arguments]    ${tc_value_excel}

    ${set_tc_value}    BuiltIn.Set Variable    ${tc_value_excel}
    ${group_value}    Get value from json    ${data_keyinstep2}    $[?(@.TC=='${set_tc_value}')]

        Kessai_judment_approve_feature.SET INPUT AND SELECT TO CLICK CONFIRM KESSAI APPROVE    ${group_value}