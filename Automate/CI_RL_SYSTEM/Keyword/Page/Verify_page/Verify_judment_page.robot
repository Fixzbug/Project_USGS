*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***    

VERIFY JUDMENT - CLICK TAB JUDMENT
    # Execute JavaScript    document.body.style.transform = 'scale(1.0)'
    # BuiltIn.Wait Until Keyword Succeeds   20x    1s    Execute JavaScript    window.scrollTo(0, 0);
    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Judment_Tab}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_Tab}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds   50x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_Tab}


VERIFY JUDMENT - SELECT DROPDWN APPLY TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Execute JavaScript    window.scrollTo(0,100);
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Key2_Applytype}    10s
    BuiltIn.Sleep    10s
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Applytype}    ${group_value}[0][INT_Judgment_ApplyType]    ${Dropdown_ApplyType}


VERIFY JUDMENT - SELECT DROPDWN APPLY VIA
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Via}    ${group_value}[0][INT_Judgment_ApplyVia]    ${Dropdown_ApplyVia}


VERIFY JUDMENT - SELECT DROPDWN APPLY CHANNEL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Apllychanel}    ${group_value}[0][INT_Judgment_ApplyChanel]    ${Dropdown_ApplyChannel}


VERIFY JUDMENT - SELECT DROPDWN ACTIVITY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_Activity}    ${group_value}[0][INT_Judgment_Activity]    ${Dropdown_Activity}    


VERIFY JUDMENT - SELECT DROPDWN SUB APPLY CHANNEL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_SubApplyChanel}    ${group_value}[0][INT_Judgment_SubApplyChannel]    ${Dropdown_SubApplyChanel}   


VERIFY JUDMENT - INPUT BIRTHDATE DAY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_D}    ${group_value}[0][INT_Judgment_Birthday_D] 


VERIFY JUDMENT - INPUT BIRTHDATE MONTH
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_M}    ${group_value}[0][INT_Judgment_Birthday_M]


VERIFY JUDMENT - INPUT BIRTHDATE YEAR
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_Y}    ${group_value}[0][INT_Judgment_Birthday_Y] 


VERIFY JUDMENT - SELECT DROPDOWN BIRTHDAY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Execute JavaScript    window.scrollTo(0,200);
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Brithday}    ${group_value}[0][INT_Judgment_Birthday]    ${Dropdown_Birthday}
    

VERIFY JUDMENT - SELECT DROPDWN MARITAL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Marital}    ${group_value}[0][INT_Judgment_Marital]    ${Dropdown_Marital}


VERIFY JUDMENT - INPUT CHILDREN
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Child}    ${group_value}[0][INT_Judgment_Children]


VERIFY JUDMENT - SELECT DROPDWN SEX
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_Sex}    ${group_value}[0][INT_Judgment_Sex]    ${Dropdown_Sex}   


VERIFY JUDMENT - INPUT TIME HOME YEAR
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_HomeY}    ${group_value}[0][INT_Judgment_Time_Home_Y]


VERIFY JUDMENT - INPUT TIME HOME MONTH
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_HomeM}    ${group_value}[0][INT_Judgment_Time_Home_M]


VERIFY JUDMENT - INPUT PERSON
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Homeperson}    ${group_value}[0][INT_Judgment_Person]


VERIFY JUDMENT - SELECT DROPDWN HOME TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Hometype}    ${group_value}[0][INT_Judgment_HomeType]    ${Dropdown_HomeType}


VERIFY JUDMENT - SELECT DROPDWN BUSINESS TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Bustype}    ${group_value}[0][INT_Judgment_BusType]    ${Dropdown_BusType}


VERIFY JUDMENT - SELECT DROPDWN SUB BUSINESS TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_SubBustype}    ${group_value}[0][INT_Judgment_SubBusType]    ${Dropdown_SubBusType}


VERIFY JUDMENT - SELECT DROPDWN OCCUPATION TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_OccType}    ${group_value}[0][INT_Judgment_OccType]    ${Dropdown_OccType}


VERIFY JUDMENT - SELECT DROPDWN SUB OCCUPATION TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_SubOccType}    ${group_value}[0][INT_Judgment_SubOccType]    ${Dropdown_SubOccType}


VERIFY JUDMENT - SELECT DROPDWN POSITION
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_PosType}    ${group_value}[0][INT_Judgment_PosType]    ${Dropdown_PosType}


VERIFY JUDMENT - INPUT NUMBER EMPLOYEES
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_EmpoyeeType}    ${group_value}[0][INT_Judgment_Employees]


VERIFY JUDMENT - INPUT WORK EXP YEAR
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_WorkYear}    ${group_value}[0][INT_Judgment_Work_Y]


VERIFY JUDMENT - INPUT WORK EXP MONTH
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_WorkMonth}    ${group_value}[0][INT_Judgment_Work_M]


VERIFY JUDMENT - SELECT DROPDWN EMPLOYEES TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_EmpoyeeType}    ${group_value}[0][INT_Judgment_EmpType]    ${Dropdown_EmpType}


VERIFY JUDMENT - SELECT DROPDWN SALARY TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Saltype}    ${group_value}[0][INT_Judgment_SalType]    ${Dropdown_SalType}


VERIFY JUDMENT - SELECT DROPDWN CUSTOMER TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Execute JavaScript    window.scrollTo(0,900);
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CusType}    ${group_value}[0][INT_Judgment_CusType]    ${Dropdown_CusType}


VERIFY JUDMENT - SELECT DROPDWN DOCUMENT FOR CALCULATE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_SalDoc}    ${group_value}[0][INT_Judgment_SalDoc]    ${Dopdown_salDoc}


VERIFY JUDMENT - INPUT SALARY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_TextSal}    ${group_value}[0][INT_Judgment_Sal]


VERIFY JUDMENT - SELECT DROPDWN TEL TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_TelType}    ${group_value}[0][INT_Judgment_TelType]    ${Dopdown_TelType}

# Home
VERIFY JUDMENT - INPUT HOME ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_ZipcodeHome}    ${group_value}[0][INT_Judgment_Home_Address]


VERIFY JUDMENT - SELECT DROPDWN HOME TAMBOL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_HomeTambol}    ${group_value}[0][INT_Judgment_Home_Tambol]    ${Drowdown_Home_Tambol}


VERIFY JUDMENT - SELECT DROPDWN HOME AMPHUER
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_HomeAmphuer}    ${group_value}[0][INT_Judgment_Home_Amphuer]    ${Drowdown_Home_Amphuer}


VERIFY JUDMENT - SELECT DROPDWN HOME PROVINCE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_HomeProvince}    ${group_value}[0][INT_Judgment_Home_Province]    ${Drowdown_Home_Province}


VERIFY JUDMENT - SELECT DROPDWN HOME ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_HomeZipcode}    ${group_value}[0][INT_Judgment_Home_Zipcode]    ${Drowdown_Home_Zipcode}

# Office
VERIFY JUDMENT - INPUT OFFICE ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_ZipcodeOffice}    ${group_value}[0][INT_Judgment_Office_Address]


VERIFY JUDMENT - SELECT DROPDWN OFFICE TAMBOL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_OfficeTambol}    ${group_value}[0][INT_Judgment_Office_Tambol]    ${Drowdown_Office_Tambol}


VERIFY JUDMENT - SELECT DROPDWN OFFICE AMPHUER
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_OfficeAmphuer}    ${group_value}[0][INT_Judgment_Office_Amphuer]    ${Drowdown_Office_Amphuer}


VERIFY JUDMENT - SELECT DROPDWN OFFICE PROVINCE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_OfficeProvince}    ${group_value}[0][INT_Judgment_Office_Province]    ${Drowdown_Office_Province}


VERIFY JUDMENT - SELECT DROPDWN OFFICE ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_OfficeZipcode}    ${group_value}[0][INT_Judgment_Office_Zipcode]    ${Drowdown_Office_Zipcode}


VERIFY JUDMENT - SELECT DROPDOWN SALDATE JUDMENT
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Execute JavaScript    window.scrollTo(0,1400);
    BuiltIn.Wait Until Keyword Succeeds    3x    2s     Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_salDate}    ${group_value}[0][INT_Judgment_SalDate]    ${Dropdown_Judment_Saldate}


VERIFY JUDMENT - SELECT DROPDWN SALE AGENT CODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_AgCode}    ${group_value}[0][INT_Judgment_AgCode]    ${Dropdown_AgCode}


VERIFY JUDMENT - SELECT DROPDWN SEARCH BANK CODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_SearchBankCode}    ${group_value}[0][INT_Judgment_Search_Bank_Code]    ${Dropdown_SearchBankCode}


VERIFY JUDMENT - INPUT ACCOUNT TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_accType}    ${group_value}[0][INT_Judgment_Account_Type]


VERIFY JUDMENT - INPUT BANK CODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_BankCode}    ${group_value}[0][INT_Judgment_Bank_Code]


VERIFY JUDMENT - INPUT ACCOUNT NO
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_AccNo}    ${group_value}[0][INT_Judgment_Account_No]


VERIFY JUDMENT - SELECT DROPDWN ACCOUNT TYPE RECHECK
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_AccTypeRe}    ${group_value}[0][INT_Judgment_Account_Type_Recheck]    ${Dropdown_AccTypeRe}


VERIFY JUDMENT - SELECT DROPDWN SEARCH BANK CODE RECHECK
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_SearchBankCodeRe}    ${group_value}[0][INT_Judgment_Bank_Code_Recheck]    ${Dropdown_SearchBankCodeRe}


VERIFY JUDMENT - INPUT ACCOUNT NO RECHECK
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_AccNoRe}    ${group_value}[0][INT_Judgment_Account_No_Recheck]


VERIFY JUDMENT - SELECT DROPDOWN VENDOR CODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_Vendorcode}    ${group_value}[0][INT_Judgment_VendorCode]    ${Dropdown_Judment_Vendorcode}


VERIFY JUDMENT - SELECT DROPDOWN DELIVERY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Delivery}    ${group_value}[0][INT_Judgment_Premium_Delivery]    ${Dropdown_Deliver}     


VERIFY JUDMENT - SELECT DROPDWN CAMPAIGN CODE 1
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CampaingCode1}    ${group_value}[0][INT_Judgment_CampCode1]    ${Dropdown_CampCode}


VERIFY JUDMENT - SELECT DROPDWN CAMPAIGN CODE 2
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CampaingCode2}    ${group_value}[0][INT_Judgment_CampCode2]    ${Dropdown_CampCode2}


VERIFY JUDMENT - SELECT DROPDWN CAMPAIGN CODE 3
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CampaingCode3}    ${group_value}[0][INT_Judgment_CampCode3]    ${Dropdown_CampCode3}


VERIFY JUDMENT - INPUT CARD ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Zipcode_Card}    ${group_value}[0][INT_Judgment_Card_Address]


VERIFY JUDMENT - SELECT DROPDWN CARD TAMBOL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CardTambol}    ${group_value}[0][INT_Judgment_Tambol_Card]    ${Dropdown_Card_Tambol}


VERIFY JUDMENT - SELECT DROPDWN CARD AMPHUER
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CardAmphuer}    ${group_value}[0][INT_Judgment_Amphuer_Card]    ${Dropdown_Card_Amphuer}


VERIFY JUDMENT - SELECT DROPDWN CARD PROVINCE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CardProvince}    ${group_value}[0][INT_Judgment_Province_Card]    ${Dropdown_Card_Province}


VERIFY JUDMENT - SELECT DROPDWN CARD ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CardZipcode}    ${group_value}[0][INT_Judgment_Zipcode_Card]    ${Dropdown_Card_Zipcode}


# Have Relationship
VERIFY JUDMENT - SELECT CHECKBOX HAVE RELATIONSHIP
    [Arguments]    ${group_value}
    # Excel = ไม่
    IF    '${group_value}[0][INT_Judgment_Have_High_Level_Relationship]' == 'ไม่'
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR   ${Locator_Key2_Relationship_N}
    END

    # Excel = มี
    IF    '${group_value}[0][INT_Judgment_Have_High_Level_Relationship]' == 'มี'
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR   ${Locator_Key2_Relationship_Y}
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Relationship_Y_Name}    ${group_value}[0][INT_Judgment_Government_Name]
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Relationship_Y_Sur}    ${group_value}[0][INT_Judgment_Government_Surname]
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_Relationship_Y_Rel}    ${group_value}[0][INT_Judgment_Government_Relationship]    ${Dropdown_Relationship_Y_Rel}
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Relationship_Y_Pos}    ${group_value}[0][INT_Judgment_Government_Position]
    END


VERIFY JUDMENT - INPUT ISSUER
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Txt_tt_loan}    ${group_value}[0][INT_Judgment_Issuer]


VERIFY JUDMENT - INPUT OFFICE TELEPHONE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_txt_RcOfficeTel}    ${group_value}[0][INT_Judgment_Office_Telephone_1]


VERIFY JUDMENT - CLICK BUTTON VERIFY JUDMENT
    BuiltIn.Wait Until Keyword Succeeds   20x    2s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Judment_VerifyJud}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_VerifyJud}    ${Timeout}
    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_VerifyJud}


VERIFY JUDMENT - CLICK BUTTON CALCULATE JUDMENT
    BuiltIn.Wait Until Keyword Succeeds   20x    2s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Judment_CalculateJud}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_CalculateJud}    300s
    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_CalculateJud}


VERIFY JUDMENT - SELECT DROPDOWN RESULT JUDMENT
    [Arguments]    ${group_value}

    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_ResultJudment}    600s
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_ResultJudment}    ${group_value}[0][INT_Judgment_Result_Jud]    ${Dropdown_Judment_Result_Judment}


VERIFY JUDMENT - CLICK BUTTON CONFIRM JUDMENT
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_ConfirmJud}    ${Timeout}
    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_ConfirmJud}
    

VERIFY JUDMENT - CLICK BUTTON YES CONFIRM JUDMENT
    Execute JavaScript    window.scrollTo(0, 0);
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_ConmfirmJud_Y}    300s
    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_ConmfirmJud_Y}


SET EXCEL - VERIFY JUDMENT
    [Arguments]    ${tc_value_excel}
    ${set_tc_value}    BuiltIn.Set Variable     ${tc_value_excel}
    ${group_value}    Get value from json    ${data_keyinstep2}    $[?(@.TC=='${set_tc_value}')]
    Verify_judment_feature.SET INPUT AND SELECT DROPDOWN TO CLICK CONFIRM    ${group_value}     


SET EXCEL - VERIFY JUDMENT MANUAL
    [Arguments]    ${tc_value_excel}
    ${set_tc_value}    BuiltIn.Set Variable     ${tc_value_excel}
    ${group_value}    Get value from json    ${data_keyinstep2}    $[?(@.TC=='${set_tc_value}')]
    Verify_judment_feature.SET INPUT AND SELECT DROPDOWN TO CLICK CONFIRM MANUAL    ${group_value}    


VERIFY JUDMENT - SELECT DROPDOWN TO KESSAI
    ${set_tc_value}    BuiltIn.Set Variable     Kessai
    ${group_value}    Get value from json    ${data_user_rl}    $[?(@.TC=='${set_tc_value}')]
    Common_keyword.SELECT OPTION BY LABEL NAME    ${dropdown_verifycall_to_kessai_locator}    ${group_value}[0][ID]    ${txt_dropdown_verifycall_to_kessai_locator}


SET FEATURE - VERIFY JUDMENT
    ${group_value}    JSONLibrary.Get Value From Json    ${data_matrix_test_case}    $[?(@.TC=='${TC_no}')]
    Verify_judment_feature.SET INPUT AND SELECT DROPDOWN TO CLICK CONFIRM    ${group_value} 
        

## After click button Yes
VERIFY JUDMENT - SELECT DROPDOWN DOCUMENT DELIVERY
    [Arguments]    ${group_value}

    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Judgment_App_DocDelivery}    600s
    BuiltIn.Log    Step Verify: After click button Yes    WARN
    BuiltIn.Sleep    10s
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_App_DocDelivery}    ${group_value}[0][INT_Judgment_Approve_Doc_Delivery]    ${Dropdown_Judgment_App_DocDelivery}
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_DOCUMENT_DELIVERY_PAGE
    Capture_screen.CAPTURE SCREEN CURRENT PAGE
    

VERIFY JUDMENT - INPUT NAME TH
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Judgment_Addr_NameTH}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s     Execute JavaScript    document.querySelector('input[id="txt_name_th_in"]').value = '${group_value}[0][INT_Judgment_Address_Name_TH]';

    # Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_NameTH}    ${group_value}[0][INT_Judgment_Address_Name_TH]


VERIFY JUDMENT - INPUT SURNAME TH
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Judgment_Addr_SurnameTH}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s     Execute JavaScript    document.querySelector('input[id="txt_Lname_th_in"]').value = '${group_value}[0][INT_Judgment_Address_Surname_TH]';

    # Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_SurnameTH}    ${group_value}[0][INT_Judgment_Address_Surname_TH]


VERIFY JUDMENT - INPUT NAME EN
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_NameEN}    ${group_value}[0][INT_Judgment_Address_Name_EN]


VERIFY JUDMENT - INPUT SURNAME EN
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_SurnameEN}    ${group_value}[0][INT_Judgment_Address_Surname_EN]


VERIFY JUDMENT - INPUT NICKNAME
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Nickname}    ${group_value}[0][INT_Judgment_Address_Nickname]


VERIFY JUDMENT - INPUT EMAIL
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Email}    ${group_value}[0][INT_Judgment_Address_Email]
    

VERIFY JUDMENT - INPUT VILLAGE
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Village}    ${group_value}[0][INT_Judgment_Address_Village]


VERIFY JUDMENT - SELECT DROPDWN BUILDING
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Judgment_Addr_Building}    ${group_value}[0][INT_Judgment_Address_Building_Dropdown]    ${Dropdown_Judgment_Addr_Building}


VERIFY JUDMENT - INPUT BUILDING
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Building_txt}    ${group_value}[0][INT_Judgment_Address_Building]


VERIFY JUDMENT - INPUT ADDRESS NO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_AdressNo}    ${group_value}[0][INT_Judgment_Address_Addr_No]


VERIFY JUDMENT - INPUT ROOM
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Room}    ${group_value}[0][INT_Judgment_Address_Room]


VERIFY JUDMENT - INPUT FLOOR
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Floor}    ${group_value}[0][INT_Judgment_Address_Floor]


VERIFY JUDMENT - INPUT MOO
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Moo}    ${group_value}[0][INT_Judgment_Address_Moo]


VERIFY JUDMENT - INPUT SOI
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Soi}    ${group_value}[0][INT_Judgment_Address_Soi]


VERIFY JUDMENT - INPUT ROAD
    [Arguments]    ${group_value}
    
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Road}    ${group_value}[0][INT_Judgment_Address_Road]


VERIFY JUDMENT - SELECT DROPDOWN PAYMENT TYPE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_PaymentType}    ${group_value}[0][INT_Judgment_Financial_Payment_Type]    ${Dropdown_Judgment_Fin_PaymentType}


VERIFY JUDMENT - SELECT DROPDOWN DEBIT BANK CODE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   3x    2s    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_DebitBank}    ${group_value}[0][INT_Judgment_Financial_Debit_Bank]    ${Dropdown_Judgment_Fin_DebitBank}


VERIFY JUDMENT - SELECT DROPDOWN ACCOUNT TYPE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   3x    2s    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_AccountType}    ${group_value}[0][INT_Judgment_Financial_Account_Type]    ${Dropdown_Judgment_Fin_AccountType}


VERIFY JUDMENT - SELECT DROPDOWN RECEIVE TYPE
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Judgment_Fin_ReceiveType}    ${group_value}[0][INT_Judgment_Financial_Receive_Type]    ${Dropdown_Judgment_Fin_ReceiveType}


VERIFY JUDMENT - INPUT CASH FROM
    [Arguments]    ${group_value}

    IF    '${group_value}[0][INT_Judgment_Financial_Cash_From]' != 'none'
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Fin_CashFrom}    ${group_value}[0][INT_Judgment_Financial_Cash_From]
    END

VERIFY JUDMENT - SELECT DROPDOWN ACCOUNT TYPE 2
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   3x    2s    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_AccountType2}    ${group_value}[0][INT_Judgment_Financial_Account_Type_2]    ${Dropdown_Judgment_Fin_AccountType2}


VERIFY JUDMENT - SELECT DROPDOWN TRANSFER MONEY
    [Arguments]    ${group_value}

    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_TransferMoney}    ${group_value}[0][INT_Judgment_Financial_Transfer_Money]    ${Dropdown_Judgment_Fin_TransferMoney}


VERIFY JUDMENT - SELECT DROPDOWN TRANSFER TYPE
    [Arguments]    ${group_value}

    IF    '${group_value}[0][INT_Judgment_Financial_Transfer_Money]' == 'Yes'    
        BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_TransferType}    ${group_value}[0][INT_Judgment_Financial_Transfer_Type]    ${Dropdown_Judgment_Fin_TransferType}
    END


VERIFY JUDMENT - INPUT AMOUNT
    [Arguments]    ${group_value}

    IF    '${group_value}[0][INT_Judgment_Financial_Transfer_Money]' == 'Yes' and '${group_value}[0][INT_Judgment_Financial_Transfer_Type]' == 'Amount'
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Fin_Amount}    ${group_value}[0][INT_Judgment_Financial_Amount]
    END

    
VERIFY JUDMENT - CLICK BUTTON CONFIRM APPROVE
    BuiltIn.Wait Until Keyword Succeeds   20x    2s    SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Judment_ConmfirmJud_after_Y}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_ConmfirmJud_after_Y}    ${Timeout}
    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_ConmfirmJud_after_Y}


VERIFY JUDMENT - CLICK BUTTON YES APPROVE
    BuiltIn.Sleep    2s
    BuiltIn.Wait Until Keyword Succeeds   20x    1s    Execute JavaScript    window.scrollTo(0,0);
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_Approve_Y}    600s
    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_Approve_Y}


VERIFY JUDMENT - WAIT POPUP SUCCESS APPROVE
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_Popup_Success}    600s
    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_Popup_Success}