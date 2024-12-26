*** Settings ***    
Resource    ${CURDIR}/../../../Import/Path_import.robot        # robotcode: ignore

*** Keywords ***

OFFICE - SELECT DROPDOWN TITLE COMPANY
    [Arguments]    ${group_value}

    Execute JavaScript    document.body.style.transform = 'scale(1.0)'
    BuiltIn.Log    ${group_value}[0][KS2_Office_Title]    WARN

    IF  '${group_value}[0][KS2_Office_Title]' != 'none'

        SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Company_Title}    ${Timeout}

        ${result_}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Get Text    ${select_branch_locator}
        BuiltIn.Log    >result_get_branch->${result_}    WARN

        IF  '${result_}' == 'True'
            ${result_}    BuiltIn.Run Keyword And Return Status    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Company_Title}    ${group_value}[0][KS2_Office_Title]    ${Dropdown_Title_Office}
            BuiltIn.Log    >result_->${result_}    WARN
        ELSE
            SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Company_Title}    
            SeleniumLibrary.Click Element    ${Locator_Company_Title} 
            ${result_}    BuiltIn.Run Keyword And Return Status    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Company_Title}    ${group_value}[0][KS2_Office_Title]    ${Dropdown_Title_Office}
            BuiltIn.Log    >result_->${result_}    WARN
        END
    END


OFFICE - INPUT NAME COMPANY
    [Arguments]    ${group_value}
    Execute JavaScript    document.body.style.transform = 'scale(1.0)'
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Textbox_NameCompany}
    SeleniumLibrary.Input Text    ${Locator_Textbox_NameCompany}    ${group_value}[0][KS2_Office_Name] 


OFFICE - CLICK BUTTON CHECK OFFICE
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Btn_CheckOffice}    ${Timeout}


OFFICE - CLICK BUTTON CONFIRM CHECK OFFICE
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_btn_Confirm}    ${Timeout}


WAIT SRCEEN KEY IN STEP 2 LOADING COMPLETE 
    # Execute JavaScript    document.body.style.transform = 'scale(1.0)'
    BuiltIn.Wait Until Keyword Succeeds   3x    2s   Execute JavaScript    window.scrollTo(0, 400);
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_Brithday}    ${Timeout}   


SELECT DROPDOWN APPLY TYPE
    [Arguments]    ${group_value}
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Applytype}    ${group_value}[0][KS2_ApplyType]    ${Dropdown_ApplyType}


SELECT DROPDOWN APPLY VIA
    [Arguments]    ${group_value}
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Via}    ${group_value}[0][KS2_ApplyVia]    ${Dropdown_ApplyVia}


SELECT DROPDOWN APPLY CHANNEL
    [Arguments]    ${group_value}
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Apllychanel}    ${group_value}[0][KS2_ApplyChannel]    ${Dropdown_ApplyChannel}


SELECT DROPDOWN ACTIVITY
    [Arguments]    ${group_value}
    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_Activity}    ${group_value}[0][KS2_Activity]    ${Dropdown_Activity}    


SELECT DROPDOWN SUB APPLY CHANNEL
    [Arguments]    ${group_value}
    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_SubApplyChanel}    ${group_value}[0][KS2_SubApplyChannel]    ${Dropdown_SubApplyChanel}


SELECT DROPDOWN BIRTHDATE
    [Arguments]    ${group_value}
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Brithday}    ${group_value}[0][KS2_Birthday]    ${Dropdown_Birthday} 
    

INPUT BIRTHDATE DAY MONTH YEAR
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_D}    ${group_value}[0][KS2_BirthDay_Judment_D]
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_M}    ${group_value}[0][KS2_BirthDay_Judment_M]
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_Y}    ${group_value}[0][KS2_BirthDay_Judment_Y]
    
INPUT BIRTHDATE DAY
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_D}    ${group_value}[0][KS2_BirthDay_Judment_D] 


INPUT BIRTHDATE MONTH
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_M}    ${group_value}[0][KS2_BirthDay_Judment_M]


INPUT BIRTHDATE YEAR
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Verify_Judment_BD_Y}    ${group_value}[0][KS2_BirthDay_Judment_Y]  


SELECT DROPDOWN MARITAL
    [Arguments]    ${group_value}
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Marital}    ${group_value}[0][KS2_Marital]    ${Dropdown_Marital}


INPUT CHILDREN
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Child}    ${group_value}[0][KS2_Children]  


INPUT SEX
    [Arguments]    ${group_value}
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Sex}    ${group_value}[0][KS2_Sex]    ${Dropdown_Sex} 
    

INPUT HOME LIFE
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_HomeY}    ${group_value}[0][KS2_Time_Home]


INPUT HOME LIFE MONTH
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_HomeM}    ${group_value}[0][KS2_Time_Home_M]


INPUT HOME PERSON
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Homeperson}    ${group_value}[0][KS2_Person]


SELECT DROPDOWN HOME TYPE
    [Arguments]    ${group_value}
    BuiltIn.Sleep    3s
    BuiltIn.Run Keyword And Ignore Error    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Hometype}    ${group_value}[0][KS2_HomeType]    ${Dropdown_HomeType}    
    

SELECT DROPDOWN BUS TYPE
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Bustype}    ${group_value}[0][KS2_BusType]    ${Dropdown_BusType}


SELECT DROPDOWN SUB BUS TYPE
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_SubBustype}    ${group_value}[0][KS2_SubBusType]    ${Dropdown_SubBusType}


SELECT DROPDOWN OCC TYPE
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_OccType}    ${group_value}[0][KS2_OccType]    ${Dropdown_OccType}     


SELECT DROPDOWN SUB OCC TYPE
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_SubOccType}     ${group_value}[0][KS2_SubOccType]     ${Dropdown_SubOccType} 


SELECT DROPDOWN POSITION TYPE
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_PosType}    ${group_value}[0][KS2_PosType]    ${Dropdown_PosType}        
 

INPUT PERSON
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_OffPerson}    ${group_value}[0][KS2_Person]


INPUT WORK YEAR
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_WorkYear}    ${group_value}[0][KS2_WorkYear]


INPUT WORK MONTH
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_WorkMonth}    ${group_value}[0][KS2_WorkMonth]


SELECT DROPDOWN EMPOYEE TYPE
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_EmpoyeeType}    ${group_value}[0][KS2_EmpType]     ${Dropdown_EmpType} 


SELECT DROPDOWN SALARY TYPE
    [Arguments]    ${group_value}
    # Execute JavaScript    window.scrollTo(0, 900);           
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Saltype}    ${group_value}[0][KS2_SalType]    ${Dropdown_SalType} 


SELECT DROPDOWN CUSTOMER TYPE
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CusType}    ${group_value}[0][KS2_CusType]    ${Dropdown_CusType}                  


SELECT DROPDOWN SALARY DOCUMENT
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_SalDoc}    ${group_value}[0][KS2_SalDoc]    ${Dopdown_salDoc}        


INPUT SALARY
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_TextSal}    ${group_value}[0][KS2_Sal]


INPUT HOME TELEPHONE
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_TelHome}    ${group_value}[0][KS2_Htel]


INPUT HOME MOBILE TELEPHONE
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_MobileTel}    ${group_value}[0][KS2_Tel]


INPUT HOME ZIPCODE HOME
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_ZipcodeHome}    ${group_value}[0][KS2_Zipcode_Home]


CLICK BUTTON SEARCH HOME
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_SearchHome}


SELECT DROPDOWN HOME ADDRESS
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_HomeAddress}    ${group_value}[0][KS2_Home_Address]    ${Drowdown_Home_Address}   
       

INPUT HOME ZIPCODE OFFICE
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_ZipcodeOffice}    ${group_value}[0][KS2_Zipcode_Off] 


CLICK BUTTON SEARCH OFFICE
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_SearchOffice}       


SELECT DROPDOWN HOME OFFICE
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_OfficeAddress}    ${group_value}[0][KS2_Off_Address]    ${Dropdown_Off_Addres}  


SELECT DROPDOWN AGENT CODE
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_AgCode}    ${group_value}[0][KS2_AgCode]    ${Dropdown_AgCode}       
    

INPUT INTRODUCER CODE
    [Arguments]    ${group_value}
    # Execute JavaScript    window.scrollTo(0, 2000);
    Common_keyword.INPUT TEXT FIELD NOT REQUIFIELD    ${Locator_Key2_Intro}    ${group_value}[0][KS2_Introducer]  


SELECT DROPDOWN VENDOR CODE
    [Arguments]    ${group_value}

    IF  '${group_value}[0][KS2_VendorCode]' != 'none'
        SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Verify_Judment_Vendorcode}    5s    
        SeleniumLibrary.Click Element    ${Locator_Verify_Judment_Vendorcode}
        ${Replace_complete}    String.Replace string    ${Dropdown_Judment_Vendorcode}    ***replace***    ${group_value}[0][KS2_VendorCode]
        SeleniumLibrary.Wait Until Element Is Visible    ${Replace_complete}    10s
        SeleniumLibrary.Scroll Element Into View    ${Replace_complete}
        SeleniumLibrary.Click Element    ${Replace_complete}
    ELSE
        BuiltIn.Log    Skip    WARN
    END


SELECT DROPDOWN DELIVERY
    [Arguments]    ${group_value}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Key2_Delivery}    10s
    BuiltIn.Run Keyword And Ignore Error    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_Delivery}    ${group_value}[0][KS2_Deliver]    ${Dropdown_Deliver}  


SELECT DROPDOWN CAMPIANG CODE 1
    [Arguments]    ${group_value}
    IF  '${group_value}[0][KS2_CampCode1]' != 'none'
        # Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CampaingCode1}    ${group_value}[0][KS2_CampCode1]    ${Dropdown_CampCode} 
        BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CampaingCode1}    ${group_value}[0][KS2_CampCode1]    ${Dropdown_CampCode} 
    ELSE
        BuiltIn.Log    Skip    WARN
    END


SELECT DROPDOWN CAMPIANG CODE 2
    [Arguments]    ${group_value}
    IF  '${group_value}[0][KS2_CampCode2]' != 'none'
        BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Key2_CampaingCode2}    ${group_value}[0][KS2_CampCode2]    ${Dropdown_CampCode2}   
    ELSE
        BuiltIn.Log    Skip    WARN
    END
    

INPUT ZIPCODE CARD
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Zipcode_Card}    ${group_value}[0][KS2_Zipcode_Card]


CLICK BUTTON SEARCH ZIPCODE CARD
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_Search_Card}    ${Timeout}


SELECT DROPDOWN CARD ADDRESS
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Key2_CardAddress}    ${group_value}[0][KS2_Card_Address]    ${Dropdown_Card_Address}        


CLICK LABEL
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_Label}    ${Timeout}


INPUT TT LOAN
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_Txt_tt_loan}    ${group_value}[0][KS2_Tt_Loan]  


INPUT RCOFF TEL
    [Arguments]    ${group_value}   
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Key2_txt_RcOfficeTel}    ${group_value}[0][KS2_RCOffTel1]     


CLICK BUTTON VERIFY JUDMENT
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_btn_VerifyJudg}    ${Timeout}
    # บางครั้งมี popup ให้กด yes/no แต่มองไม่เห็นต้อง zoom out ออกเยอะๆถึงเห็น popup - ยืนยันการว่างงาน
    BuiltIn.Run Keyword If    'TC000_RANK' in ${TEST TAGS}     CLICK BUTTON CONFIRM NO WORK


CLICK BUTTON CONFIRM NO WORK
    Execute JavaScript  document.body.style.zoom = '0.2'
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    NO_WORK_ZOOM_OUT
    Capture_screen.CAPTURE SCREEN CURRENT PAGE
    Execute JavaScript  document.body.style.zoom = '1.0'
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    NO_WORK_ZOOM_IN
    Capture_screen.CAPTURE SCREEN CURRENT PAGE
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    //button[@onclick="Check_UnEmployment('Y')"]    10s


CLICK BUTTON CALCULATE
    [Arguments]    ${timeout}=180s
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_btn_Calculate}    ${timeout}


CLICK BUTTON CONFIRM JUDMENT     
    [Arguments]    ${timeout}=180s  
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR   ${Locator_Key2_btn_ConfirmJudg}    ${timeout}


CLICK BUTTON YES CONFIRM JUDMENT

    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_btn_Yes_ConfirmJudg}    ${Timeout}


CLICK BUTTON GO TO MAIN
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_btn_Gotomain}    ${Timeout}


WAIT POPUP WORK PROCESS
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Key2_WorkProcess}    ${Timeout}


CLICK BUTTON SEND SMS
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Key2_btn_SendSMS}    25s


CONFIRM KEY IN STEP 2 - CHECK CONDITION POPUP
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Key2_btn_SendSMS}    60s
   
    IF  '${Status}' == 'True'
        Key_in_step_2_feature.CONFIRM KEY IN STEP 2 - HAS POPUP SEND SMS
    ELSE   
        Key_in_step_2_feature.CONFIRM KEY IN STEP 2 - NOT POPUP SEND SMS
    END


SET EXCEL - CHECK OFFICE TO KEY IN STEP 2 JUDMENT 
    [Arguments]    ${tc_title}
                    
    ${set_tc_value_Case_Key2}    BuiltIn.Set Variable    ${tc_title}
    ${group_value_Keyinstep2}    JSONLibrary.Get value from json    ${data_keyinstep2}    $[?(@.TC=='${set_tc_value_Case_Key2}')]

    Key_in_step_2_feature.SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE    ${group_value_Keyinstep2}
    Key_in_step_2_feature.SET KEY IN STEP 2 - JUDMENT    ${group_value_Keyinstep2}


SET EXCEL - CHECK OFFICE TO KEY IN STEP 2 JUDMENT MANUAL
    [Arguments]    ${tc_title}
                    
    ${set_tc_value_Case_Key2}    BuiltIn.Set Variable    ${tc_title}
    ${group_value_Keyinstep2}    JSONLibrary.Get value from json    ${data_keyinstep2}    $[?(@.TC=='${set_tc_value_Case_Key2}')]
                
    Key_in_step_2_feature.SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE    ${group_value_Keyinstep2}
    Key_in_step_2_feature.SET KEY IN STEP 2 - JUDMENT MANUAL    ${group_value_Keyinstep2}


SET EXCEL - CHECK OFFICE TO KEY IN STEP 2 JUDMENT VERIFY CONDITION
    [Arguments]    ${tc_title}
                    
    ${set_tc_value_Case_Key2}    BuiltIn.Set Variable    ${tc_title}
    ${group_value_Keyinstep2}    JSONLibrary.Get value from json    ${data_keyinstep2}    $[?(@.TC=='${set_tc_value_Case_Key2}')]

    ${set_tc_value_case_condition}    BuiltIn.Set Variable    ${tc_title}
    ${group_value_verify_condition}    JSONLibrary.Get value from json    ${data_verify_condition}    $[?(@.TC=='${set_tc_value_case_condition}')]
                
    Key_in_step_2_feature.SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE    ${group_value_Keyinstep2}
    Key_in_step_2_feature.SET KEY IN STEP 2 - JUDMENT VERIFY POPUP CONDITION    ${group_value_Keyinstep2}    ${group_value_verify_condition}


SET EXCEL - CHECK OFFICE TO KEY IN STEP 2 JUDMENT VERIFY CONDITION TCL = 0
    [Arguments]    ${tc_title}
                    
    ${set_tc_value_Case_Key2}    BuiltIn.Set Variable    ${tc_title}
    ${group_value_Keyinstep2}    JSONLibrary.Get value from json    ${data_keyinstep2}    $[?(@.TC=='${set_tc_value_Case_Key2}')]

    ${set_tc_value_case_condition}    BuiltIn.Set Variable    ${tc_title}
    ${group_value_verify_condition}    JSONLibrary.Get value from json    ${data_verify_condition}    $[?(@.TC=='${set_tc_value_case_condition}')]
                
    Key_in_step_2_feature.SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE    ${group_value_Keyinstep2}
    Key_in_step_2_feature.SET KEY IN STEP 2 - JUDMENT VERIFY POPUP CONDITION TCL = 0    ${group_value_Keyinstep2}    ${group_value_verify_condition}


SET EXCEL - RECHECK OFFICE TO KEY IN STEP 2 JUDMENT VERIFY CONDITION TCL = 0
    [Arguments]    ${tc_title}
                    
    ${set_tc_value_Case_Key2}    BuiltIn.Set Variable    ${tc_title}
    ${group_value_Keyinstep2}    JSONLibrary.Get value from json    ${data_keyinstep2}    $[?(@.TC=='${set_tc_value_Case_Key2}')]

    ${set_tc_value_case_condition}    BuiltIn.Set Variable    ${tc_title}
    ${group_value_verify_condition}    JSONLibrary.Get value from json    ${data_verify_condition}    $[?(@.TC=='${set_tc_value_case_condition}')]

    ${condition_recheck_key_2_locator}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${lbl_condition_recheck_key_2_locator}    ${group_value_verify_condition}[0][verify_text]

    BuiltIn.Wait Until Keyword Succeeds   10x    1s    SeleniumLibrary.Wait Until Element Is Visible    ${condition_recheck_key_2_locator}

    Capture_screen.CAPTURE SCREEN VERIFY CONDITION

    Key_in_step_2_feature.SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE    ${group_value_Keyinstep2}

    Key_in_step_2_feature.RECHECK KEY IN STEP 2 - JUDMENT VERIFY POPUP CONDITION TCL = 0    ${group_value_Keyinstep2} 


VERIFY POPUP CONDITION
    [Arguments]    ${group_value_verify_condition}

    ${condition_key_2_locator}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${lbl_condition_key_2_locator}    ${group_value_verify_condition}[0][error_popup_key_2]

    BuiltIn.Wait Until Keyword Succeeds   10x    1s    SeleniumLibrary.Wait Until Element Is Visible    ${condition_key_2_locator}
    ${text_condition_key_2}    SeleniumLibrary.Get Text    ${condition_key_2_locator}

    Capture_screen.CAPTURE SCREEN VERIFY CONDITION

    BuiltIn.Should Be Equal    ${group_value_verify_condition}[0][error_popup_key_2]   ${text_condition_key_2}


INPUT ID NUMBER  
    [Arguments]    ${id_number}
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_id_key2_locator}    ${id_number}


CLICK SEARCH BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_search_key2_locator} 


CLICK SELECT BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_btn_sel_key2_locator} 


CLICK CANCEL BUTTON
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_cancel_key2_locator} 


CLICK CONFIRM TO SEND SMS
    BuiltIn.Wait Until Keyword Succeeds   10x    2s    SeleniumLibrary.Click Element    ${Locator_Key2_btn_SendSMS_company_blacklist}


        