*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***

KESSAI JUDMENT - CLICK TAB JUDMENT
    Execute JavaScript    document.body.style.transform = 'scale(1.0)'
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    Execute JavaScript    window.scrollTo(0, 0);
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_Tab}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds    50x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_Tab}



KESSAI JUDMENT - WAIT DATA IN TAB JUDMENT

    # รอจนกว่าไม่เจอ icon load
    BuiltIn.Wait Until Keyword Succeeds    5x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${lbl_kes_judgment_item}    30s
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${icon_load_judgment}    3s
    IF  '${Status}' == 'False'
       BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    ${lbl_kes_judgment_item}   15s
    END



KESSAI JUDMENT - SELECT DROPDOWN APPLY TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    5x    1s    Execute JavaScript    window.scrollTo(0,100);
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Applytype}    ${group_value}[0][KES_Judgment_ApplyType]    ${Dropdown_ApplyType}


KESSAI JUDMENT - SELECT DROPDOWN APPLY VIA
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Via}    ${group_value}[0][KES_Judgment_ApplyVia]    ${Dropdown_ApplyVia}


KESSAI JUDMENT - SELECT DROPDOWN APPLY CHANNEL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Apllychanel}    ${group_value}[0][KES_Judgment_ApplyChanel]    ${Dropdown_ApplyChannel}


KESSAI JUDMENT - SELECT DROPDOWN ACTIVITY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_Activity}    ${group_value}[0][Activity]    ${Dropdown_Activity}     


KESSAI JUDMENT - INPUT BIRTHDATE DAY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_BD_D}    15s
    SeleniumLibrary.Input Text    ${Locator_Verify_Judment_BD_D}    ${group_value}[0][KES_Judgment_Birthday_D] 


KESSAI JUDMENT - INPUT BIRTHDATE MOUNTH
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_M}    ${group_value}[0][KES_Judgment_Birthday_M]


KESSAI JUDMENT - INPUT BIRTHDATE YEAR
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_Y}    ${group_value}[0][KES_Judgment_Birthday_Y]  


KESSAI JUDMENT - SELECT DROPDOWN BIRTHDAY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_BD}    ${group_value}[0][KES_Judgment_Birthday]    ${Dropdown_Judment_Bd}


KESSAI JUDMENT - SELECT DROPDOWN MARITAL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Marital}    ${group_value}[0][KES_Judgment_Marital]    ${Dropdown_Marital}


KESSAI JUDMENT - INPUT CHILDREN
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Child}    ${group_value}[0][KES_Judgment_Children]


KESSAI JUDMENT - SELECT DROPDWN SEX
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Sex}    ${group_value}[0][KES_Judgment_Sex]    ${Dropdown_Sex}


KESSAI JUDMENT - INPUT TIME HOME YEAR
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_HomeY}    ${group_value}[0][KES_Judgment_Time_Home_Y]


KESSAI JUDMENT - INPUT TIME HOME MONTH
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_HomeM}    ${group_value}[0][KES_Judgment_Time_Home_M]


KESSAI JUDMENT - INPUT PERSON
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Homeperson}    ${group_value}[0][KES_Judgment_Person]


KESSAI JUDMENT - SELECT DROPDWN HOME TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Hometype}    ${group_value}[0][KES_Judgment_HomeType]    ${Dropdown_HomeType}


KESSAI JUDMENT - SELECT DROPDWN BUSINESS TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Bustype}    ${group_value}[0][KES_Judgment_BusType]    ${Dropdown_BusType}


KESSAI JUDMENT - SELECT DROPDWN SUB BUSINESS TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_SubBustype}    ${group_value}[0][KES_Judgment_SubBusType]    ${Dropdown_SubBusType}


KESSAI JUDMENT - SELECT DROPDWN OCCUPATION TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_OccType}    ${group_value}[0][KES_Judgment_OccType]    ${Dropdown_OccType}


KESSAI JUDMENT - SELECT DROPDWN SUB OCCUPATION TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_SubOccType}    ${group_value}[0][KES_Judgment_SubOccType]    ${Dropdown_SubOccType}


KESSAI JUDMENT - SELECT DROPDWN POSITION
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_PosType}    ${group_value}[0][KES_Judgment_PosType]    ${Dropdown_PosType}


KESSAI JUDMENT - INPUT NUMBER EMPLOYEES
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_EmpoyeeType}    ${group_value}[0][KES_Judgment_Employees]


KESSAI JUDMENT - INPUT WORK EXP YEAR
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_WorkYear}    ${group_value}[0][KES_Judgment_Work_Y]


KESSAI JUDMENT - INPUT WORK EXP MONTH
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_WorkMonth}    ${group_value}[0][KES_Judgment_Work_M]


KESSAI JUDMENT - SELECT DROPDWN EMPLOYEES TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_EmpoyeeType}    ${group_value}[0][KES_Judgment_EmpType]    ${Dropdown_EmpType}


KESSAI JUDMENT - SELECT DROPDWN SALARY TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Saltype}    ${group_value}[0][KES_Judgment_SalType]    ${Dropdown_SalType}


KESSAI JUDMENT - SELECT DROPDWN CUSTOMER TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CusType}    ${group_value}[0][KES_Judgment_CusType]    ${Dropdown_CusType}


KESSAI JUDMENT - SELECT DROPDWN DOCUMENT FOR CALCULATE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_SalDoc}    ${group_value}[0][KES_Judgment_SalDoc]    ${Dopdown_salDoc}


KESSAI JUDMENT - INPUT SALARY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND PRESS KEYS     ${Locator_Key2_TextSal}    ${group_value}[0][KES_Judgment_Sal]


# Home
KESSAI JUDMENT - INPUT HOME ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_ZipcodeHome}    ${group_value}[0][KES_Judgment_Home_Address]


KESSAI JUDMENT - SELECT DROPDWN HOME TAMBOL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_HomeTambol}    ${group_value}[0][KES_Judgment_Home_Tambol]    ${Drowdown_Home_Tambol}


KESSAI JUDMENT - SELECT DROPDWN HOME AMPHUER
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_HomeAmphuer}    ${group_value}[0][KES_Judgment_Home_Amphuer]    ${Drowdown_Home_Amphuer}


KESSAI JUDMENT - SELECT DROPDWN HOME PROVINCE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_HomeProvince}    ${group_value}[0][KES_Judgment_Home_Province]    ${Drowdown_Home_Province}


KESSAI JUDMENT - SELECT DROPDWN HOME ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_HomeZipcode}    ${group_value}[0][KES_Judgment_Home_Zipcode]    ${Drowdown_Home_Zipcode}


# Office
KESSAI JUDMENT - INPUT OFFICE ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_ZipcodeOffice}    ${group_value}[0][KES_Judgment_Office_Address]


KESSAI JUDMENT - SELECT DROPDWN OFFICE TAMBOL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_OfficeTambol}    ${group_value}[0][KES_Judgment_Office_Tambol]    ${Drowdown_Office_Tambol}


KESSAI JUDMENT - SELECT DROPDWN OFFICE AMPHUER
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_OfficeAmphuer}    ${group_value}[0][KES_Judgment_Office_Amphuer]    ${Drowdown_Office_Amphuer}


KESSAI JUDMENT - SELECT DROPDWN OFFICE PROVINCE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_OfficeProvince}    ${group_value}[0][KES_Judgment_Office_Province]    ${Drowdown_Office_Province}


KESSAI JUDMENT - SELECT DROPDWN OFFICE ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_OfficeZipcode}    ${group_value}[0][KES_Judgment_Office_Zipcode]    ${Drowdown_Office_Zipcode}
# ---


KESSAI JUDMENT - SELECT DROPDOWN SALARY DATE
    [Arguments]    ${group_value}
    ${Convert_done}     CONVERT DATA FLOAT TO STRING     ${group_value}[0][KES_Judgment_SalDate]
    BuiltIn.Wait Until Keyword Succeeds    3x    1s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_salDate}    ${Convert_done}    ${Dropdown_Judment_Saldate}


KESSAI JUDMENT - SELECT DROPDOWN SALE AGENT CODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_AgCode}    ${group_value}[0][KES_Judgment_AgCode]    ${Dropdown_AgCode}


KESSAI JUDMENT - SELECT DROPDOWN ACCOUNT TYPE
    [Arguments]    ${group_value}
    # BuiltIn.Wait Until Keyword Succeeds    10x    1s    Execute JavaScript    window.scrollTo(0,1700);
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_accType_Dropdown}    ${group_value}[0][KES_Judgment_Account_Type_Recheck]    ${Dropdown_Judment_Acctype}


VERIFY JUDMENT - SELECT DROPDWN SEARCH BANK CODE RECHECK
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_SearchBankCodeRe}    ${group_value}[0][KES_Judgment_Bank_Code_Recheck]    ${Dropdown_SearchBankCodeRe}


KESSAI JUDMENT - INPUT ACCOUNT NO RECHECK
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_AccNoRe}    ${group_value}[0][KES_Judgment_Account_No_Recheck]


KESSAI JUDMENT - SELECT DROPDWN CAMPAIGN CODE 1
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CampaingCode1}    ${group_value}[0][KES_Judgment_CampCode1]    ${Dropdown_CampCode}


KESSAI JUDMENT - SELECT DROPDWN CAMPAIGN CODE 2
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CampaingCode2}    ${group_value}[0][KES_Judgment_CampCode2]    ${Dropdown_CampCode2}


KESSAI JUDMENT - SELECT DROPDWN CAMPAIGN CODE 3
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CampaingCode3}    ${group_value}[0][KES_Judgment_CampCode3]    ${Dropdown_CampCode3}


# ID CARD ADDRESS
KESSAI JUDMENT - INPUT CARD ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Zipcode_Card}    ${group_value}[0][KES_Judgment_Card_Address]


KESSAI JUDMENT - SELECT DROPDWN CARD TAMBOL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CardTambol}    ${group_value}[0][KES_Judgment_Tambol_Card]    ${Dropdown_Card_Tambol}


KESSAI JUDMENT - SELECT DROPDWN CARD AMPHUER
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CardAmphuer}    ${group_value}[0][KES_Judgment_Amphuer_Card]    ${Dropdown_Card_Amphuer}


KESSAI JUDMENT - SELECT DROPDWN CARD PROVINCE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CardProvince}    ${group_value}[0][KES_Judgment_Province_Card]    ${Dropdown_Card_Province}


KESSAI JUDMENT - SELECT DROPDWN CARD ZIPCODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CardZipcode}    ${group_value}[0][KES_Judgment_Zipcode_Card]    ${Dropdown_Card_Zipcode}


# Have Relationship
KESSAI JUDMENT - SELECT CHECKBOX HAVE RELATIONSHIP
    [Arguments]    ${group_value}
    # Excel = ไม่
    IF    '${group_value}[0][KES_Judgment_Have_High_Level_Relationship]' == 'ไม่'
        BuiltIn.Run Keyword And Ignore Error    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR   ${Locator_Key2_Relationship_N}
    END

    # Excel = มี
    IF    '${group_value}[0][KES_Judgment_Have_High_Level_Relationship]' == 'มี'
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR   ${Locator_Key2_Relationship_Y}
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Relationship_Y_Name}    ${group_value}[0][KES_Judgment_Government_Name]
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Relationship_Y_Sur}    ${group_value}[0][KES_Judgment_Government_Surname]
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Relationship_Y_Rel}    ${group_value}[0][KES_Judgment_Government_Relationship]    ${Dropdown_Relationship_Y_Rel}
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Relationship_Y_Pos}    ${group_value}[0][KES_Judgment_Government_Position]
    END


KESSAI JUDMENT - INPUT TT LOAN
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    1s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Txt_tt_loan}    ${group_value}[0][KES_Judgment_Issuer]


KESSAI JUDMENT - CLICK BUTTON VERIFY JUDMENT
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_VerifyJud}    ${Timeout}  
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_VerifyJud}


KESSAI JUDMENT - CLICK BUTTON CALCULATE
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_CalculateJud}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_CalculateJud}


KESSAI JUDMENT - CLICK BUTTON CONFIRM JUDMENT
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_ConfirmJudgment}    ${Timeout}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_ConfirmJudgment}


KESSAI JUDMENT - CLICK BUTTON CALCULATE JUDMENT
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_CalJudgment}    600s
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_CalJudgment}


KESSAI JUDMENT - SELECT DROPDOWN RESULT JUDMENT
    [Arguments]    ${group_value}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_ResultJudment}    60s
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_ResultJudment}    ${group_value}[0][KES_Judgment_Result_Jud]    ${Dropdown_Judment_Result_Judment}


KESSAI JUDMENT - CLICK BUTTON CONFIRM JUDMENT AFTER CALCULATE
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_ConfirmJud}    600s
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_ConfirmJud}


KESSAI JUDMENT - CLICK BUTTON YES CALCULATE
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Execute JavaScript    window.scrollTo(0,0);
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_ConmfirmJud_Y}    600s
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_ConmfirmJud_Y}
    KESSAI JUDMENT - RECLICK BUTTON YES CALCULATE


KESSAI JUDMENT - RECLICK BUTTON YES CALCULATE
    BuiltIn.Wait Until Keyword Succeeds     10x    1s    Execute JavaScript    window.scrollTo(0,0);
    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_ConmfirmJud_Y}
    

## Lest Step - Judgment
KESSAI JUDMENT - SELECT DROPDOWN DOCUMENT DELIVERY
    [Arguments]    ${group_value}

    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Judgment_App_DocDelivery}    600s
    BuiltIn.Log    Step Judgment: After click button Yes    WARN
    BuiltIn.Sleep    10s
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_App_DocDelivery}    ${group_value}[0][KES_Judgment_Approve_Doc_Delivery]    ${Dropdown_Judgment_App_DocDelivery}
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    JUDGMENT_DOCUMENT_DELIVERY_PAGE
    Capture_screen.CAPTURE SCREEN CURRENT PAGE


# Adress
KESSAI JUDMENT - INPUT NAME TH
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Judgment_Addr_NameTH}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s     Execute JavaScript    document.querySelector('input[id="txt_name_th_in"]').value = '${group_value}[0][KES_Judgment_Address_Name_TH]';
    # Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_NameTH}    ${group_value}[0][INT_Judgment_Address_Name_TH]


KESSAI JUDMENT - INPUT SURNAME TH
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    20x    1s    SeleniumLibrary.Scroll Element Into View        ${Locator_Judgment_Addr_SurnameTH}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s     Execute JavaScript    document.querySelector('input[id="txt_Lname_th_in"]').value = '${group_value}[0][KES_Judgment_Address_Surname_TH]';
    # Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_SurnameTH}    ${group_value}[0][INT_Judgment_Address_Surname_TH]


KESSAI JUDMENT - INPUT NAME EN
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_NameEN}    ${group_value}[0][KES_Judgment_Address_Name_EN]


KESSAI JUDMENT - INPUT SURNAME EN
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_SurnameEN}    ${group_value}[0][KES_Judgment_Address_Surname_EN]


KESSAI JUDMENT - INPUT NICKNAME
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Nickname}    ${group_value}[0][KES_Judgment_Address_Nickname]


KESSAI JUDMENT - INPUT EMAIL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Email}    ${group_value}[0][KES_Judgment_Address_Email]
    

# Document Delivery ==> Current Address (H)
KESSAI JUDMENT - INPUT VILLAGE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Village}    ${group_value}[0][KES_Judgment_Address_Village]


KESSAI JUDMENT - SELECT DROPDWN BUILDING
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Judgment_Addr_Building}    ${group_value}[0][KES_Judgment_Address_Building_Dropdown]    ${Dropdown_Judgment_Addr_Building}


KESSAI JUDMENT - INPUT BUILDING
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Building_txt}    ${group_value}[0][KES_Judgment_Address_Building]


KESSAI JUDMENT - INPUT ADDRESS NO
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_AdressNo}    ${group_value}[0][KES_Judgment_Address_Addr_No]


KESSAI JUDMENT - INPUT ROOM
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Room}    ${group_value}[0][KES_Judgment_Address_Room]


KESSAI JUDMENT - INPUT FLOOR
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Floor}    ${group_value}[0][KES_Judgment_Address_Floor]


KESSAI JUDMENT - INPUT MOO
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Moo}    ${group_value}[0][KES_Judgment_Address_Moo]


KESSAI JUDMENT - INPUT SOI
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Soi}    ${group_value}[0][KES_Judgment_Address_Soi]


KESSAI JUDMENT - INPUT ROAD
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Addr_Road}    ${group_value}[0][KES_Judgment_Address_Road]


######################
KESSAI JUDMENT - SELECT DROPDOWN PAYMENT TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_PaymentType}    ${group_value}[0][KES_Judgment_Financial_Payment_Type]    ${Dropdown_Judgment_Fin_PaymentType}


KESSAI JUDMENT - SELECT DROPDOWN DEBIT BANK CODE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_DebitBank}    ${group_value}[0][KES_Judgment_Financial_Debit_Bank]    ${Dropdown_Judgment_Fin_DebitBank}


KESSAI JUDMENT - SELECT DROPDOWN ACCOUNT TYPE FINANCIAL
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_AccountType}    ${group_value}[0][KES_Judgment_Financial_Account_Type]    ${Dropdown_Judgment_Fin_AccountType}


KESSAI JUDMENT - SELECT DROPDOWN RECEIVE TYPE
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_ReceiveType}    ${group_value}[0][KES_Judgment_Financial_Receive_Type]    ${Dropdown_Judgment_Fin_ReceiveType}


KESSAI JUDMENT - INPUT CASH FROM
    [Arguments]    ${group_value}

    IF    '${group_value}[0][KES_Judgment_Financial_Cash_From]' != 'none'
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Fin_CashFrom}    ${group_value}[0][KES_Judgment_Financial_Cash_From]
    END

KESSAI JUDMENT - SELECT DROPDOWN ACCOUNT TYPE 2
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_AccountType2}    ${group_value}[0][KES_Judgment_Financial_Account_Type_2]    ${Dropdown_Judgment_Fin_AccountType2}


KESSAI JUDMENT - SELECT DROPDOWN TRANSFER MONEY
    [Arguments]    ${group_value}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_TransferMoney}    ${group_value}[0][KES_Judgment_Financial_Transfer_Money]    ${Dropdown_Judgment_Fin_TransferMoney}


KESSAI JUDMENT - SELECT DROPDOWN TRANSFER TYPE
    [Arguments]    ${group_value}

    IF    '${group_value}[0][KES_Judgment_Financial_Transfer_Money]' == 'Yes'    
        BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Judgment_Fin_TransferType}    ${group_value}[0][KES_Judgment_Financial_Transfer_Type]    ${Dropdown_Judgment_Fin_TransferType}
    END


KESSAI JUDMENT - INPUT AMOUNT
    [Arguments]    ${group_value}

    IF    '${group_value}[0][KES_Judgment_Financial_Transfer_Money]' == 'Yes' and '${group_value}[0][KES_Judgment_Financial_Transfer_Type]' == 'Amount'
        BuiltIn.Wait Until Keyword Succeeds    3x    2s    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Judgment_Fin_Amount}    ${group_value}[0][KES_Judgment_Financial_Amount]
    END
######################













SET EXCEL - KESSAI JUDMENT
    [Arguments]    ${tc_value_excel}
    ${set_tc_value}    BuiltIn.Set Variable    ${tc_value_excel}
    ${group_value}    Get value from json    ${data_keyinstep2}    $[?(@.TC=='${set_tc_value}')]
    Kessai_judment_feature.SET INPUT AND SELECT TO CLICK CONFIRM KESSAI JUDMENT    ${group_value}


# data ขึ้น popup error กรณี data กรอกแล้วโหลดละ data หลุด
KESSAI JUDMENT - RE INPUT BIRTHDATE DAY MONTH AND YEAR
    [Arguments]    ${group_value}

    ${data}    SeleniumLibrary.Get Text    ${alert_judgment_bd_d}
    IF  '${data}' != ''
        SeleniumLibrary.Scroll Element Into View    ${Locator_Verify_Judment_BD_D}
        SeleniumLibrary.Input Text    ${Locator_Verify_Judment_BD_D}    ${group_value}[0][KES_Judgment_Birthday_D] 
        SeleniumLibrary.Input Text    ${Locator_Verify_Judment_BD_M}    ${group_value}[0][KES_Judgment_Birthday_M] 
        SeleniumLibrary.Input Text    ${Locator_Verify_Judment_BD_Y}    ${group_value}[0][KES_Judgment_Birthday_Y] 
    END


KESSAI JUDMENT - RE SELECT DROPDOWN BIRTHDAY
    [Arguments]    ${group_value}

    ${data}    SeleniumLibrary.Get Text    ${alert_judgment_bd}
    IF  '${data}' != ''
        SeleniumLibrary.Scroll Element Into View      ${Locator_Verify_Judment_BD}
        Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Verify_Judment_BD}    ${group_value}[0][KES_Judgment_Birthday]    ${Dropdown_Judment_Bd}
    END


KESSAI JUDMENT - RE SELECT DROPDOWN SALARY DOCUMENT
    [Arguments]    ${group_value}

    ${data}    SeleniumLibrary.Get Text    ${alert_judgment_SalDoc}
    IF  '${data}' != ''
        SeleniumLibrary.Scroll Element Into View      ${Locator_Key2_SalDoc}
        Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_SalDoc}    ${group_value}[0][KES_Judgment_SalDoc]    ${Dopdown_salDoc}
    END


KESSAI JUDMENT - RE INPUT SALARY
    [Arguments]    ${group_value}

    ${data}    SeleniumLibrary.Get Text    ${alert_judgment_Sal}
        IF  '${data}' != ''
        SeleniumLibrary.Scroll Element Into View      ${Locator_Key2_TextSal}
        Common_keyword.GET TEXT AND PRESS KEYS    ${Locator_Key2_TextSal}    ${group_value}[0][KES_Judgment_Sal]
    END


KESSAI JUDMENT - RE INPUT TT LOAN
    [Arguments]    ${group_value}

    ${data}    SeleniumLibrary.Get Text    ${alert_judgment_Issue}
        IF  '${data}' != ''
        SeleniumLibrary.Scroll Element Into View      ${Locator_Key2_Txt_tt_loan}
        Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Txt_tt_loan}    ${group_value}[0][KES_Judgment_Issuer]
    END


KESSAI JUDMENT - WAIT POPUP SUCCESS
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.WAIT UNTIL ELEMENT VISIBLE    ${Locator_Verify_Judment_Popup_Success}    600s


KESSAI JUDMENT - CLICK BUTTON CONFIRM
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_ConmfirmJud_after_Y}    600s
    BuiltIn.Sleep    2s
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_ConmfirmJud_after_Y}


KESSAI JUDMENT - CLICK BUTTON APPROVE YES
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Execute JavaScript    window.scrollTo(0,100);
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_Approve_Y}    600s
    BuiltIn.Sleep    2s
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    SeleniumLibrary.Click Element    ${Locator_Verify_Judment_Approve_Y}


KESSAI JUDMENT - GET TEXT NEW CONTRACT
    [Arguments]    ${locator}
    BuiltIn.Wait Until Keyword Succeeds   2x    2s    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    5s
    ${label_data}    SeleniumLibrary.Get Text    ${locator}
    BuiltIn.Log     Data is :${label_data}    WARN
    RETURN    ${label_data}