*** Settings ***
Resource    ${CURDIR}/../../../../Import/Path_import.robot    # robotcode: ignore


*** Variables ***
${group_value_migrate_apply_RL}    # สำหรับ Set Sheet ของ Migrate Apply Process RL
${rows_id_card_data_stock}
${rows_barcode_data_stock}
${rows_card_umay+_data_stock}
${rows_card_umay+_premire_data_stock}
${branch}
${data_virtuadcard_No}

@{list_apply_chanal}
...    009 : สมาชิก แนะนำ สมาชิก-Taddy
...    058 : รับบัตรทันใจ-Taddy	
...    003 : ลูกค้า PRE APPROVE-Taddy 	
...    079 : central campaign-Taddy	
...    037 : Direct Mail-Taddy


*** Keywords ***

SELECT DROPDOWN BRANCH KEY IN STEP 1
    [Arguments]    ${group_value}
    
    ${branch}    BuiltIn.Set Variable    ${group_value}[0][Branch]      # for use anywhere 
    BuiltIn.Set global Variable    ${branch}                            # for use anywhere 
    
    # กรอกใหม่หากไม่มี branch
    Common_keyword.CHECK BRANCH BEFORE SELECT    ${branch}    
    

MGM ONLINE    
    [Arguments]    ${group_value}

    ${Text}    SeleniumLibrary.Get Text    ${Locator_Select_Applychannel}

    IF  '${Text}' == '009 : สมาชิก แนะนำ สมาชิก-Taddy'
        Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Select_SubApplyChannel}    ${group_value}[0][Sub Apply Channel]    ${SubApplyChannel}

        SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Introducer}    Timeout=30s  
        SeleniumLibrary.Input Text    ${Locator_Introducer}    ${group_value}[0][Introducer]  
        BuiltIn.Sleep    03s

        ${Name_Customer}    Get Text    ${Locator_Name_Customer} 

        SeleniumLibrary.Wait Until Page Contains    ${Name_Customer}    Timeout=20s
    ELSE
        BuiltIn.fail    !!! NOT MGM  !!
    END


CLICK BUTTON OK
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Ok}    ${Timeout}
    SeleniumLibrary.Click Element    ${Locator_Button_Ok}


CHOOSE MENU INTERVIEW RL
    [Arguments]    ${Name_Menu}
    
    ${locator_Menu}    String.Replace string    ${Locator_Menu}    ***replace***    ${Name_Menu}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator_Menu}   ${Timeout}
    SeleniumLibrary.Click Element    ${locator_Menu}


CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR   ${Locator_Radio_Virtualcard}    30s        


CHOOSE CHECKBOX CARD TYPE
    [Arguments]    ${card_type}    ${TC}=Header    

    IF  '${card_type}' == 'virual_umay_card' or '${card_type}' == 'virual_premier_card'
        ${CardType}    BuiltIn.Set Variable    13
    ELSE
        ${CardType}    BuiltIn.Set Variable    11
    END

    ${Convert_Complete}    String.Replace string    ${Cardtype_Locator}    ***replace***    ${CardType}
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Convert_Complete}    20s


INPUT ID
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_ID}    ${group_value} 


INPUT CONFIRM ID
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_Confirm_Id}    ${group_value} 


INPUT ID VIRTUAL UMAY+ CARD
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_ID}    ${group_value}[0][ID]   
    

INPUT CONFIRM ID INPUT ID VIRTUAL UMAY+ CARD
    [Arguments]    ${group_value}
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_Confirm_Id}    ${group_value}[0][ID]


INPUT CONFIRM ID VERIFY FIELD - TS3002_002
    [Arguments]    ${group_value}
    ${convert_complete}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value}[0][Confirm ID]
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_Confirm_Id}    ${convert_complete}


CHCEK DOPA RESULT
    [Arguments]    ${group_value}
    
    ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Page Contains    A : สถานะปกติทำรายการต่อได้    30s
        
    IF  '${status}' == 'True'   
        ${Dopa}    SeleniumLibrary.Get Text    ${Locator_Text_Doparesult}      
        BuiltIn.Should Be Equal    ${Dopa}    A : สถานะปกติทำรายการต่อได้
    ELSE         
        ${Dopa}    SeleniumLibrary.Get Text    ${Locator_Text_Doparesult}
        BuiltIn.Should Be Equal    ${Dopa}    ไม่พบข้อมูล
        BuiltIn.fail    !!!! ID NO DOPA RESULT !!!!    WARN    
    END


SELECT DROPDOWN TITLE
    [Arguments]    ${group_value}    
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Select_Title}    ${group_value}[0][KS1_Title]    ${Title}


INPUT NAME
    [Arguments]    ${group_value}    
    SeleniumLibrary.Clear Element Text    ${Locator_Field_Namethai}
    Common_keyword.GET TEXT AND PRESS KEYS    ${Locator_Field_Namethai}    ${group_value}[0][KS1_Surname]


INPUT SURNAME
    [Arguments]    ${group_value}    
    SeleniumLibrary.Clear Element Text    ${Locator_Field_Surnamethai}
    Common_keyword.GET TEXT AND PRESS KEYS    ${Locator_Field_Surnamethai}    ${group_value}[0][KS1_Lastname]  


INPUT BIRTHDATE DAY
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_BirthDate_D}    ${group_value}[0][KS1_Birth_Day]  


INPUT BIRTHDATE MONTH
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_BirthDate_M}    ${group_value}[0][KS1_Birth_Month]


INPUT BIRTHDATE YEAR
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_BirthDate_Y}    ${group_value}[0][KS1_Birth_Year] 
   
INPUT CONFIRM BIRTHDATE DAY
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_Re_BirthDate_D}    ${group_value}[0][KS1_Birth_Day]  


INPUT CONFIRM BIRTHDATE MONTH
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_Re_BirthDate_M}    ${group_value}[0][KS1_Birth_Month]


INPUT CONFIRM BIRTHDATE YEAR
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_Re_BirthDate_Y}    ${group_value}[0][KS1_Birth_Year] 


INPUT EXPIRE DATE DAY
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_ExpireDate_D}    ${group_value}[0][KS1_Expire_Day]


INPUT EXPIRE DATE MONTH
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_ExpireDate_M}    ${group_value}[0][KS1_Expire_Month]


INPUT EXPIRE DATE YEAR
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_ExpireDate_Y}    ${group_value}[0][KS1_Expire_Year]
 

INPUT MOBILE NO
    [Arguments]    ${group_value}    
     Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Field_Mobileno}     ${group_value}[0][KS1_Mobile_No]
 

SELECT DROPDOWN APPLY TYPE
    [Arguments]    ${group_value}    
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Select_Applytype}    ${group_value}[0][KS1_Apply_Type]    ${Applytype}


SELECT DROPDOWN APPLY VIA
    [Arguments]    ${group_value}    
    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Select_Applyvia}     ${group_value}[0][KS1_Apply_Via]     ${Applyvia}
        
        
SELECT DROPDOWN APPLY CHANNEL
    [Arguments]    ${group_value}    

    Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Select_Applychannel}    ${group_value}[0][KS1_Apply_Channel]    ${Applychannel}

    ${Text}    SeleniumLibrary.Get Text    ${Locator_Select_Applychannel}
      
    FOR    ${index}    ${data}    IN ENUMERATE    @{list_apply_chanal}    
        IF  '${Text}' == '${data}'
            Common_keyword.SELECT OPTION BY LABEL NAME    ${Locator_Select_SubApplyChannel}    ${group_value}[0][KS1_Sub_Apply_Channel]    ${SubApplyChannel}
            BuiltIn.Exit For Loop
        END
    END
    
    
SELECT DROPDOWN SALEAGENT
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword If    '${group_value}[0][KS1_SaleAgent]' != 'none'    Common_keyword.SELECT OPTION BY LABEL NAME PRESS KEYS    ${Locator_Label_Saleagent}     ${group_value}[0][KS1_SaleAgent]


SELECT DROPDOWN CAMPAIGN
    [Arguments]    ${group_value}    
    BuiltIn.Run Keyword If    '${group_value}[0][KS1_Campaign]' != 'none'    Common_keyword.SELECT OPTION BY LABEL NAME PRESS KEYS    ${Locator_Label_Campaign}      ${group_value}[0][KS1_Campaign]


SELECT DROPDOWN CAMPAIGN 2
    [Arguments]    ${group_value}    
    BuiltIn.Run Keyword If    '${group_value}[0][KS1_Campaign2]' != 'none'    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${campaign_2_locator}      ${group_value}[0][KS1_Campaign2]      ${Campaign2}
        
  
SELECT DROPDOWN CAMPAIGN 3
    [Arguments]    ${group_value}
    BuiltIn.Run Keyword If    '${group_value}[0][Campaign3]' != 'none'    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${campaign_3_locator}      ${group_value}[0][Campaign3]      ${Campaign3}
    

SELECT DROPDOWN ACTIVITY
    [Arguments]    ${group_value}    
    BuiltIn.Run Keyword If    '${group_value}[0][KS1_Activity_Code]' != 'none'    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Select_Activity}    ${group_value}[0][KS1_Activity_Code]    ${Activity}
 

SELECT DROPDOWN SPECIAL
    [Arguments]    ${group_value}    
    BuiltIn.Run Keyword If    '${group_value}[0][KS1_Special_Case]' != 'none'    Common_keyword.SELECT DROPDOWN FIELD NOT REQUIFIELD    ${Locator_Select_Specialcase}    ${group_value}[0][KS1_Special_Case]    ${Specialcase}
        

BUTTON CHECK DATA
    [Arguments]    ${timeouts}=150s
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Button_Checkdata}    ${timeouts} 


BUTTON CONFIRM CHECK DATA
    [Arguments]    ${timeouts}=150s
    # BuiltIn.Run Keyword And Ignore Error    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Confirm_Key1}    ${timeouts}
    BuiltIn.Wait Until Keyword Succeeds   3x    2s    Execute JavaScript    document.getElementById('btn_ConfirmStep1').click()


IF ELSE NAME ENG
    BuiltIn.Run Keyword And Ignore Error    INPUT NAME ENG
    BuiltIn.Run Keyword And Ignore Error    INPUT SURNAME ENG
    BuiltIn.Run Keyword And Ignore Error    CLICK BUTTON CONFIRM NAME ENG


BUTTON YES CONFIRM CHECK DATA   
    [Arguments]    ${timeouts}=150s
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Button_Step1}    ${timeouts}


BUTTON NCB
    [Arguments]    ${button}=Yes    ${timeouts}=150s
    [Documentation]    Modal HAVE CONSENT Yes/No

    IF  '${button}' == 'Yes'
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Button_NCB}    ${timeouts}    
    ELSE
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_no_ncb_key1_locator}    ${timeouts}
    END
    

BUTTON SENDDOC
    [Arguments]    ${button}=Yes    

    IF  '${button}' == 'Yes'
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Button_Senddoc}    ${Timeout}
    ELSE
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_no_send_doc_locator}
    END

BUTTON CONFIRM SENDDOC
    [Arguments]    ${button}=Yes

    IF  '${button}' == 'Yes'
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Button_Confirm_Senddoc}
    ELSE
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_no_send_doc_locator}
    END


INPUT BARCODE
    [Arguments]    ${group_value}    
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_textbox_Barcode}    30s
    SeleniumLibrary.Input Text    ${Locator_textbox_Barcode}    ${group_value}


BUTTON CONFIRM BARCODE
    [Arguments]    ${timeouts}=150s
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Button_Confime_Barcode}    ${timeouts}


BUTTON SEND BOTEN
    [Arguments]    ${timeouts}=150s
    BuiltIn.Run Keyword And Ignore Error    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_Button_Sendboten}    ${timeouts}
 

WAIT COMPLETE
    [Arguments]    ${timeouts}=150s
    SeleniumLibrary.Wait Until Element Is Not Visible    ${Locator_Button_Sendboten}    ${timeouts}


INPUT NAME ENG
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_name_eng}    CLOSING


INPUT SURNAME ENG
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_surname_eng}    AUTOMATE


CLICK BUTTON CONFIRM NAME ENG
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${Locator_confirm_name_eng}    ${Timeout}


CLICK BUTTON SEND SMS 
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${confirm_sms_locator}    240s


CLICK BUTTON CLEAR
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_clear_locator}    20s


CLICK CHECKBOX OPTION SMS PENDING
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${check_box_option_sms_pending_key1_locator}


CLICK SAVE NOTE BUTTON
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_save_note_pending_key1_locator}    


CLICK BUTTON OK TO CONFIRM PENDING    
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_ok_confirm_save_note_pending_key1_locator}

INPUT UMAY+ CARD 1
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Text_UmayCard1}    ${group_value}[0] 

INPUT UMAY+ CARD 2
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Text_UmayCard2}    ${group_value}[1]

INPUT UMAY+ CARD 3
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Text_UmayCard3}    ${group_value}[2]

INPUT UMAY+ CARD 4
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Text_UmayCard4}    ${group_value}[3]

INPUT CONFIRM UMAY+ CARD 1
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Text_CardRekey1}    ${group_value}[0]

INPUT CONFIRM UMAY+ CARD 2
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Text_CardRekey2}    ${group_value}[1]

INPUT CONFIRM UMAY+ CARD 3
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Text_CardRekey3}    ${group_value}[2]

INPUT CONFIRM UMAY+ CARD 4
    [Arguments]    ${group_value}    
    Common_keyword.GET TEXT AND INPUT TEXT    ${Locator_Text_CardRekey4}    ${group_value}[3]
    
VERIFY MESSAGE 
    [Arguments]    ${group_value_verify_condition}

    ${Status}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAIT UNTIL TEXT IS VISIBLE    ${group_value_verify_condition}    timeout=90s

    ${condition_key_2_locator}    BuiltIn.Run Keyword If    '${Status}'!='True'    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${lbl_condition_key_2_locator}    ${group_value_verify_condition}
    BuiltIn.Run Keyword If    '${Status}'!='True'    SeleniumLibrary.Wait Until Element Is Visible    ${condition_key_2_locator}    timeout=90s


INPUT DROPDOW FOR VERIFY
    [Arguments]    ${dropdown_locator}    ${input_locator}     ${text_for_input}

    SeleniumLibrary.Wait Until Element Is Visible    ${dropdown_locator}    20s
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    SeleniumLibrary.Click Element    ${dropdown_locator}
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    SeleniumLibrary.Input text    ${input_locator}    ${text_for_input}

    
SELECT DROPDOWN BY INDEX
    [Arguments]    ${dropwdown_locator}    ${dropwdown_for_relace}    ${index}

    BuiltIn.Wait Until Keyword Succeeds   15x    2s    SeleniumLibrary.Click Element    ${dropwdown_locator}
    ${locator_sel}    String.Replace string      ${dropwdown_for_relace}    ***replace***       ${index}
    BuiltIn.Wait Until Keyword Succeeds   15x    2s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
    SeleniumLibrary.Click Element    ${locator_sel}

# KEY 1
SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU
    [Arguments]    ${branch}    ${data_sheet_excel}

    ${group_value}    JSONLibrary.Get value from json    ${data_sheet_excel}    $[?(@.TC=='${branch}')]

    # เลือก Branch และ คลิก Menu Keyinstep 1
    Key_in_step_1_feature.SET SELECT BRANCH KEYINSTEP 1    ${group_value}

    # คลิก Button OK
    Key_in_step_1_feature.CHOOSE MENU    KEY IN STEP 1


GET APPLICATION NUMBER

    SeleniumLibrary.Wait Until Element Is Visible    ${lbl_app_no_key_1_locator}    30s
    ${data}     SeleniumLibrary.Get Text      ${lbl_app_no_key_1_locator} 
    RETURN    ${data}


SELECT DROPDOWN PREMIUM
    [Arguments]    ${group_value}

    ${data_result}    GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK     ${Locator_Label_Campaign}    :    Full
    BuiltIn.Log    >Get Dropdown Campaign->${data_result}[0]    WARN

    IF  '${data_result}[0]' == '${group_value}[0][KS1_Campaign]'
        ${Status_Campaign}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${dropdown_premiumdelivery_for_click_locator}    30s
        BuiltIn.Log    >Status Campaign->${Status_Campaign}    WARN
        IF  '${Status_Campaign}' == 'True'
            IF  '${group_value}[0][KS1_Premium_Delivery]' != 'none'
                BuiltIn.Log    >SELECT CAMPAIN    WARN
                Common_keyword.SELECT OPTION BY LABEL NAME PRESS KEYS    ${dropdown_premiumdelivery_for_click_locator}    ${group_value}[0][KS1_Premium_Delivery]
            END
        END
    ELSE
        BuiltIn.fail    !! ERROR SELECT CAMPAIN !!!
    END
        

GET VIRTUAD CARD NUMBER
    ${data_virtuadcard}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${txt_virtuadcard_No1_locator}    timeout=80s

    IF    '${data_virtuadcard}' == 'True'
        ${data_virtuadcard_No1}    SeleniumLibrary.Get Value      ${txt_virtuadcard_No1_locator}
        ${data_virtuadcard_No2}    SeleniumLibrary.Get Value      ${txt_virtuadcard_No2_locator}
        ${data_virtuadcard_No3}    SeleniumLibrary.Get Value      ${txt_virtuadcard_No3_locator}
        ${data_virtuadcard_No4}    SeleniumLibrary.Get Value      ${txt_virtuadcard_No4_locator}

        # ตรวจสอบว่าแต่ละตัวแปรเป็นค่าว่างหรือไม่ ถ้าเป็นค่าว่าง ให้เรียก Get Value ใหม่
        BuiltIn.Run Keyword If    '${data_virtuadcard_No1}' == ''    ${data_virtuadcard_No1}    SeleniumLibrary.Get Element Attribute    ${txt_virtuadcard_No1_locator}    value
        BuiltIn.Run Keyword If    '${data_virtuadcard_No2}' == ''    ${data_virtuadcard_No2}    SeleniumLibrary.Get Element Attribute    ${txt_virtuadcard_No2_locator}    value
        BuiltIn.Run Keyword If    '${data_virtuadcard_No3}' == ''    ${data_virtuadcard_No3}    SeleniumLibrary.Get Element Attribute    ${txt_virtuadcard_No3_locator}    value
        BuiltIn.Run Keyword If    '${data_virtuadcard_No4}' == ''    ${data_virtuadcard_No4}    SeleniumLibrary.Get Element Attribute    ${txt_virtuadcard_No4_locator}    value

        ${data_virtuadcard_No}    BuiltIn.Set Variable   ${data_virtuadcard_No1}-${data_virtuadcard_No2}-${data_virtuadcard_No3}-${data_virtuadcard_No4}
        BuiltIn.Log    VIRTUAD CARD :${data_virtuadcard_No}    WARN
    ELSE
        # กรณี get value ไม่ได้ให้ mock data เป็น 0000-0000-0000-0000
        ${data_virtuadcard_No}    BuiltIn.Set Variable    0000-0000-0000-0000
        BuiltIn.Log    MOCK VIRTUAD CARD :${data_virtuadcard_No}    WARN
    END

    BuiltIn.Set global Variable     ${data_virtuadcard_No}


GET APPLICATION DATE
    ${application_date}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    ${lbl_application_date_locator}    :
    RETURN    ${application_date}[1]
        