*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***    

VERIFY CALL - CLICK TAP VERIFY CALL
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    Execute JavaScript    document.body.style.transform = 'scale(1.0)'
    BuiltIn.Wait Until Keyword Succeeds    20x    2s     SeleniumLibrary.Scroll Element Into View    ${Locator_Tap_Verifycall}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Tap_Verifycall}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds     20x    1s    SeleniumLibrary.Click Element   ${Locator_Tap_Verifycall}   


VERIFY CALL - SELECT DROPDOWN COMPANY TYPE
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds     20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Companytype}
    BuiltIn.Wait Until Keyword Succeeds    30x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_Companytype}    ${group_value}[0][INT_Verify_Call_Company_Type]    ${Dropdown_Verifycall_Companytype}
        

VERIFY CALL - CLICK BUTTON CUSTYPE
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_btn_custtype}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_btn_custtype}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_btn_custtype}  


VERIFY CALL - SELECT DROPDOWN SUBTYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Subtype}
    BuiltIn.Wait Until Keyword Succeeds    3x    1s     Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Verify_Verifycall_Subtype}    ${group_value}[0][INT_Verify_Call_Sub_Customer_Type]    ${Dropdown_Verifycall_Subtype}  


VERIFY CALL - SELECT DROPDOWN BOL
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    3x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_BOL}
    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Verify_Verifycall_BOL}    ${group_value}[0][INT_Verify_Call_BOL]    ${Dropdown_Verifycall_BOL}


# Verify TO
VERIFY CALL - SELECT DROPDOWN SALARY TYPE
    [Arguments]    ${group_value}

    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_verify_verifycall_recSal_TO}    60s 
    IF  '${Status}' != 'True'
        VERIFY CALL - CLICK BUTTON CUSTYPE
        SeleniumLibrary.Wait Until Element Is Visible    ${Locator_verify_verifycall_recSal_TO}    60s 
    END
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_verify_verifycall_recSal_TO}
    BuiltIn.Wait Until Keyword Succeeds    3x    1s     Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_verify_verifycall_recSal_TO}    ${group_value}[0][INT_Verify_Call_Salary_Type]    ${Dropdown_Verifycall_recSal_TO}


VERIFY CALL - INPUT SALARY PER MONTH
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View     ${input_Verifycall_sal_TO}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_Verifycall_sal_TO}    ${group_value}[0][INT_Verify_Call_Salary_TO]


VERIFY CALL - SELECT DROPDOWN SSO TO
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_SSO_TO}
    BuiltIn.Wait Until Keyword Succeeds    3x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_SSO_TO}    ${group_value}[0][INT_Verify_Call_SSO_TO]    ${Dropdown_Verifycall_SSO_To}


VERIFY CALL - SELECT DROPDOWN CHECK BOL
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    3x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_verify_verifycall_check_bol_TO}
    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_verify_verifycall_check_bol_TO}    ${group_value}[0][INT_Verify_Call_BOL_TH]    ${Dropdown_Verifycall_check_bol_TO}


VERIFY CALL - INPUT TELOFFICE TO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View     ${Locator_Verify_Verifycall_TelOffice_TO}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Verify_Verifycall_TelOffice_TO}    ${group_value}[0][INT_Verify_Call_TelOffice_TO]


VERIFY CALL - INPUT TEL BRANCH TO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View     ${input_Verifycall_telbrn_TO}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_Verifycall_telbrn_TO}    ${group_value}[0][INT_Verify_Call_TelBranch_TO]


VERIFY CALL - INPUT MOBILE TO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View     ${input_Verifycall_mobOff1_TO}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_Verifycall_mobOff1_TO}    ${group_value}[0][INT_Verify_Call_MobOffice_TO]


VERIFY CALL - SELECT DROPDOWN CHECKNAME TO
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_ChkName_TO}
    BuiltIn.Wait Until Keyword Succeeds   5x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_ChkName_TO}    ${group_value}[0][INT_Verify_Call_ChkName_TO]    ${Dropdown_Verifycall_Name_To}  


VERIFY CALL - SELECT DROPDOWN ADDRESSE TO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Address_TO}
    BuiltIn.Wait Until Keyword Succeeds   5x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_Address_TO}    ${group_value}[0][INT_Verify_Call_Address_TO]    ${Dropdown_Verifycall_Address_To}


VERIFY CALL - SELECT DROPDOWN STATUS TO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Status_TO}
    BuiltIn.Wait Until Keyword Succeeds   5x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_Status_TO}    ${group_value}[0][INT_Verify_Call_Status_TO]    ${Dropdown_Verifycall_Statusofstff_To}


VERIFY CALL - SELECT DROPDOWN CONTACT TO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Contect}
    BuiltIn.Wait Until Keyword Succeeds   5x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_Contect}    ${group_value}[0][INT_Verify_Call_Contact_TO]    ${Dropdown_Verifycall_Contect_To}


VERIFY CALL - SELECT DROPDOWN INFORMANT TO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Informant}
    BuiltIn.Wait Until Keyword Succeeds   5x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_Informant}    ${group_value}[0][INT_Verify_Call_Informant_TO]    ${Dropdown_Verifycall_Informant_To}


VERIFY CALL - INPUT INFORMANT TO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View     ${input_Verifycall_Informant_TO}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_Verifycall_Informant_TO}    ${group_value}[0][INT_Verify_Call_txtInformant_TO]


VERIFY CALL - SELECT DROPDOWN EMPLOYMENT TYPE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_verify_verifycall_EmploymentType_TO}
    BuiltIn.Wait Until Keyword Succeeds    3x    1s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_verify_verifycall_EmploymentType_TO}    ${group_value}[0][INT_Verify_Call_Contract_Type]    ${Dropdown_Verifycall_EmploymentType_TO}


VERIFY CALL - INPUT CERTIFICATE TO
    [Arguments]    ${group_value}
    		
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${input_Verifycall_cerSpec_TO}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_Verifycall_cerSpec_TO}      ${group_value}[0][INT_Verify_Call_SpecName_TO]
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_Verifycall_cerPos_TO}       ${group_value}[0][INT_Verify_Call_Position_TO]
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_Verifycall_cerDepart_TO}    ${group_value}[0][INT_Verify_Call_Department_TO]


VERIFY CALL - CLICK BUTTON CONFIRM TO
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_btn_TO}
    BuiltIn.Wait Until Keyword Succeeds   2x    2s      SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_btn_TO}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_btn_TO}


VERIFY CALL - VERIFY POPUP SUCCESS TO
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Popup_Verifycall_success}    15s
    IF  '${Status}' != 'True'
        VERIFY CALL - CLICK BUTTON CONFIRM TO
        BuiltIn.Wait Until Keyword Succeeds   5x    2s      SeleniumLibrary.Wait Until Element Is Visible    ${Popup_Verifycall_success}    15s
    END


VERIFY CALL - SELECT DROPDOWN INTRODUCER TO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_verify_verifycall_introducer_TO}
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_verify_verifycall_introducer_TO}    ${group_value}[0][Introducer]    ${Dropdown_Verifycall_introducer_To}


# Verify TH
VERIFY CALL - INPUT TEL TH
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Verify_Verifycall_tel_TH}
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Verify_Verifycall_person_txt_TH}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Verify_Verifycall_tel_TH}      ${group_value}[0][INT_Verify_Call_Mobile_TH]


VERIFY CALL - SELECT DROPDOWN CHECK NAME TH
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_chkName_TH}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_chkName_TH}    ${group_value}[0][INT_Verify_Call_chkName_TH]    ${Dropdown_Verifycall_Name_TH}


VERIFY CALL - SELECT DROPDOWN CHECK ADDRESS TH
    [Arguments]    ${group_value}

    BuiltIn.Log    ${group_value}[0][INT_Verify_Call_chkAddr_TH]    WARN
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_chkAddr_TH}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_chkAddr_TH}    ${group_value}[0][INT_Verify_Call_chkAddr_TH]    ${Dropdown_Verifycall_Addrees_TH}


VERIFY CALL - SELECT DROPDOWN CHECK TEL TYPE TH
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_telType_TH}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_telType_TH}    ${group_value}[0][INT_Verify_Call_telType_TH]    ${Dropdown_Verifycall_Teltype_TH}


VERIFY CALL - SELECT DROPDOWN CONT TH
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_cont_TH}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_cont_TH}    ${group_value}[0][INT_Verify_Call_cont_TH]    ${Dropdown_Verifycall_Cont_TH}
    

VERIFY CALL - SELECT DROPDOWN PERSON TH
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_person_TH}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_person_TH}    ${group_value}[0][INT_Verify_Call_Person_TH]    ${Dropdown_Verifycall_Person_TH}


VERIFY CALL - INPUT PERSON TH
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Verify_Verifycall_person_txt_TH}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s      Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Verify_Verifycall_person_txt_TH}      ${group_value}[0][INT_Verify_Call_txtPerson_TH]


VERIFY CALL - CLICK BUTTON CONFIRM TH
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_btn_TH}
    BuiltIn.Wait Until Keyword Succeeds    2x    2s      SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_btn_TH}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_btn_TH}


VERIFY CALL - VERIFY POPUP SUCCESS TH
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Popup_Verifycall_success}    15s
    IF  '${Status}' != 'True'
        VERIFY CALL - CLICK BUTTON CONFIRM TH
        BuiltIn.Wait Until Keyword Succeeds   5x    2s      SeleniumLibrary.Wait Until Element Is Visible    ${Popup_Verifycall_success}    15s
    END


# Verify TH
VERIFY CALL - SELECT DROPDOWN PERSON TM
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_person_TM}
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_person_TM}    ${group_value}[0][INT_Verify_Call_Person_TM]    ${Dropdown_Verifycall_Person_TM}  


VERIFY CALL - CLICK BUTTON CONFIRM TM
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_btn_TM}
    BuiltIn.Wait Until Keyword Succeeds   2x    2s      SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_btn_TM}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_btn_TM}


VERIFY CALL - VERIFY POPUP SUCCESS TM
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Popup_Verifycall_success}    15s
    IF  '${Status}' != 'True'
        VERIFY CALL - CLICK BUTTON CONFIRM TM
        BuiltIn.Wait Until Keyword Succeeds   5x    2s      SeleniumLibrary.Wait Until Element Is Visible    ${Popup_Verifycall_success}    15s
    END


# Verify TE
VERIFY CALL - SCROLL TO BUTTON SAVE TE
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Save_TE} 


VERIFY CALL - SELECT DROPDOWN REL TE
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_rel_TE}     
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Verifycall_rel_TE}    ${group_value}[0][INT_Verify_Call_Rel_TE]    ${Dropdown_Verifycall_Rel_TE}
    

VERIFY CALL - INPUT NAME TE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Verify_Verifycall_Name_TE}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Execute JavaScript    document.querySelector('input[id="txt_Name_TE"]').value = '${group_value}[0][INT_Verify_Call_NameTH_TE]';
    

VERIFY CALL - INPUT SURNAME TE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Verify_Verifycall_Surname_TE}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Execute JavaScript    document.querySelector('input[id="txt_SurName_TE"]').value = '${group_value}[0][INT_Verify_Call_SurNameTH_TE]';
    

VERIFY CALL - INPUT TEL TE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Verify_Verifycall_telHome_TE}    ${group_value}[0][INT_Verify_Call_TelHome_TE]
    

VERIFY CALL - INPUT OFFICE TE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Verify_Verifycall_Office_TE}    ${group_value}[0][INT_Verify_Call_TelOffice_TE]
    

VERIFY CALL - INPUT MOBILE TE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Verify_Verifycall_mobile1_TE}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Verify_Verifycall_mobile1_TE}       ${group_value}[0][INT_Verify_Call_TelMobile_TE]
    

VERIFY CALL - INPUT MOBILE 2 TE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Verifycall_mobile2_TE}    ${group_value}[0][Mobile2_TE]
    

VERIFY CALL - INPUT MOBILE 3 TE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Verifycall_mobile3_TE}    ${group_value}[0][Mobile3_TE]
    

VERIFY CALL - CLICK BUTTON FLAG TE
    [Arguments]    ${group_value}

    ${data_flag}    BuiltIn.Set Variable    ${group_value}[0][INT_Verify_Call_Flag_TE]
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_flag_Y_TE}
    BuiltIn.Wait Until Keyword Succeeds    2x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_flag_Y_TE}    ${Timeout}

    IF    '${data_flag}' == 'No'
        BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_flag_N_TE}

    ELSE IF  '${data_flag}' == 'Yes'
        BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_flag_Y_TE}
        
    ELSE IF  '${data_flag}' == 'Yes(CL Staff)'
        BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_flag_Y_CL_TE}

    ELSE IF  '${data_flag}' == 'Yes(Not Require)'
        BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_flag_Y_Not_Req_TE}
    
    END


VERIFY CALL - CLICK BUTTON FLAG Y TE
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_flag_Y_TE}
    BuiltIn.Wait Until Keyword Succeeds    2x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_flag_Y_TE}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds    30x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_flag_Y_TE}  


VERIFY CALL - CLICK BUTTON SAVE TE   
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Save_TE}
    BuiltIn.Wait Until Keyword Succeeds    2x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_Save_TE}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds    30x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_Save_TE} 


VERIFY CALL - VERIFY TABLE IS FOUND
    BuiltIn.Wait Until Keyword Succeeds    2x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${Table_Verifycall_TE}    ${Timeout}


VERIFY CALL - CLICK BUTTON CONFIRM TE
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Verifycall_Confirm_TE}
    BuiltIn.Wait Until Keyword Succeeds    2x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Verifycall_Confirm_TE}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds    30x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Verifycall_Confirm_TE}


VERIFY CALL - CLICK EDIT  
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Te_Edit}    10s
    BuiltIn.Wait Until Keyword Succeeds    30x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Te_Edit}


SET EXCEL - VERIFY CALL
    [Arguments]    ${tc_index} 

    ${set_tc_value}    BuiltIn.Set Variable    ${tc_index} 
    ${group_value}    Get value from json    ${data_step_verify_call}    $[?(@.TC=='${set_tc_value}')]   

        Verify_call_feature.SET VERIFY CALL INPUT TO NEXT STEP    ${group_value}


SET EXCEL - VERIFY CALL (CLOSING)
    [Arguments]    ${tc_index} 

    ${set_tc_value}    BuiltIn.Set Variable    ${tc_index} 
    ${group_value}    Get value from json    ${data_step_verify_call}    $[?(@.TC=='${set_tc_value}')]   

        Verify_call_feature.SET VERIFY CALL INPUT TO NEXT STEP (CLOSING)    ${group_value}


INPUT ID NUMBER  
    [Arguments]    ${id_number}
    
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_id_key2_locator}    ${id_number}


CLICK SEARCH BUTTON
        BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_search_kessai_verifycall_locator} 


CLICK SELECT BUTTON
        BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_sel_kessai_verifycall_locator}