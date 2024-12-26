*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***

JUDMENT APPROVE - SELECT DROPDOWN DOC APPROVE
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Execute JavaScript    window.scrollTo(0,300);
        SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_Doc}    ${Timeout}
            BuiltIn.Sleep    03s
                BuiltIn.Wait Until Keyword Succeeds   50x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_Doc}    ${group_value}[0][Doc_Approve]    ${Dropdown_Judment_Doc}


JUDMENT APPROVE - INPUT NAME ENG
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Name_EN}    ${group_value}[0][Name_EN]  
        BuiltIn.Sleep    01s


JUDMENT APPROVE - INPUT LAST NAME ENG
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_LastName_EN}    ${group_value}[0][LastName_EN]
        BuiltIn.Sleep    01s


JUDMENT APPROVE - SELECT DROPDOWN BUILDIN
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Execute JavaScript    window.scrollTo(0,700);
        BuiltIn.Wait Until Keyword Succeeds   20x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Approve_Buildin}    ${group_value}[0][Build_Approve]    ${Dropdown_Judment_BuildIn}


JUDMENT APPROVE - INPUT BUILDIN NAME
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Buildin_textbox}    ${group_value}[0][BuildIn]    


JUDMENT APPROVE - INPUT ADDRESS NO
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Address}    ${group_value}[0][AddreesNo] 


JUDMENT APPROVE - INPUT MOO
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   20x    1s     Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Moo}    ${group_value}[0][Moo] 


JUDMENT APPROVE - INPUT ROAD
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Approve_Road}    ${group_value}[0][Road] 
        BuiltIn.Sleep    02s


JUDMENT APPROVE - SELECT DROPDOWN REC TYPE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Execute JavaScript    window.scrollTo(0,1400);
        BuiltIn.Wait Until Keyword Succeeds   20x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Approve_recType}    ${group_value}[0][recType_Approve]    ${Dropdown_Judment_RecType}
                BuiltIn.Sleep    02s


JUDMENT APPROVE - SELECT DROPDOWN FIRST LOAN TYPE
    [Arguments]    ${group_value}

    Execute JavaScript    window.scrollTo(0,1600);
        BuiltIn.Wait Until Keyword Succeeds   20x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Approve_FirstLoanType}    ${group_value}[0][Firstloan_Apporve]    ${Dropdown_Judment_FirstloanType}


JUDMENT APPROVE - CLICK BUTTON CONFIRM APPROVE
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Approve_ConfirmApprove}    ${Timeout}
        BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Approve_ConfirmApprove}


JUDMENT APPROVE - CLICK BUTTON YES CONFIRM APPROVE
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Execute JavaScript    window.scrollTo(0,0);
        SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Approve_Yes_Confirm}    ${Timeout}
            BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Approve_Yes_Confirm}


JUDMENT APPROVE - CLICK BUTTON GO TO MAIN
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Key2_btn_Gotomain}    ${Timeout}
        BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Click Element    ${Locator_Key2_btn_Gotomain}


# SET EXCEL - JUDMENT APPROVE 
#     [Arguments]    ${tc_value_excel}

#     ${group_value}    Get value from json    ${data_keyinstep2}    $[?(@.TC=='${tc_value_excel}')]
#     Judment_approve_feature.SET INPUT AND SELECT DROPDOWN AND CLICK CONFIRM    ${group_value} 