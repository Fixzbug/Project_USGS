*** Settings ***
Resource    ${CURDIR}/../../../../Import/Path_import.robot    # robotcode: ignore

*** Keywords ***


REJECT PENDING PROCESS BY ID CARD NUMBER
    [Arguments]    ${ID_no}

    Home_menu_page.CHOOSE MENU RL    PENDING PROCESS
    Pending_process_page.INPUT ID NUMBER PENDING PORCESS    ${ID_no}
    Pending_process_page.CLICK BUTTON SEARCH PENDING PORCESS
    Pending_process_page.CLICK BUTTON REJECT PENDING PORCESS
    Pending_process_page.SELECT DROPDOW RESULT REJECT PENDING PORCESS    BL1
    Pending_process_page.INPUT DESCIPTION REJECT PENDING PORCESS    AUTOMATE_TEST
    Pending_process_page.CLICK BUTTON SAVE NOTE REJECT PENDING PORCESS
    Pending_process_page.CLICK BUTTON OK SEND SMS REJECT PENDING PORCESS


CANCEL PENDING PROCESS BY ID CARD NUMBER
    [Arguments]    ${ID_no}

    Home_menu_page.CHOOSE MENU RL    PENDING PROCESS
    Pending_process_page.INPUT ID NUMBER PENDING PORCESS    ${ID_no}
    Pending_process_page.CLICK BUTTON SEARCH PENDING PORCESS
    Pending_process_page.CLICK BUTTON CANCEL PENDING PORCESS
    Pending_process_page.SELECT DROPDOW RESULT REJECT PENDING PORCESS    SL18
    Pending_process_page.INPUT DESCIPTION REJECT PENDING PORCESS    AUTOMATE_TEST
    Pending_process_page.CLICK BUTTON SAVE NOTE REJECT PENDING PORCESS
    Pending_process_page.CLICK BUTTON OK SEND SMS REJECT PENDING PORCESS


SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE
    [Arguments]    ${tc_title}    ${card_type}    ${action_pending}=normal


    ${TC_no}    BuiltIn.Set Variable    ${tc_title} 
    BuiltIn.Set global Variable    ${TC_no}
    BuiltIn.Log    !! Get TC_no from case ->${TC_no}    WARN

    # Login SSO
    Login_page.SET LOGIN SSO TO RL    Key1
                
    IF  '${card_type}' == 'virual_umay_card'

        BuiltIn.Log    !! CASE>${card_type}!!    WARN
    
        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Header    ${data_keyinstep1_virual_umay_card}
        
        ${group_value}    JSONLibrary.Get value from json    ${data_keyinstep1_virual_umay_card}    $[?(@.TC=='${tc_title}')]
        # BuiltIn.Log    ${group_value}    WARN
        IF  ${group_value}
            # Action ในการ กรอกข้อมูลที่หน้า Keyinstep 1 แบบ Virual Card
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0001'    SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0002'    SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0003'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0004'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0005'    SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0006'    SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0007'    SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0008'    SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0009'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0010'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0011'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0012'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
        ELSE
            BuiltIn.fail    !! WRONG DATA IN EXCEL !!!
        END
        Common_keyword.INTRANET TEARDOWN

    ELSE IF  '${card_type}' == 'virual_premier_card'

        BuiltIn.Log    !! CASE>${card_type}!!    WARN

        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Header    ${data_keyinstep1_virual_premier_card}
    
        ${group_value}    JSONLibrary.Get value from json    ${data_keyinstep1_virual_premier_card}    $[?(@.TC=='${tc_title}')]
        # BuiltIn.Log    ${group_value}    WARN

        IF  ${group_value}
            # Action ในการ กรอกข้อมูลที่หน้า Keyinstep 1 แบบ Virual Card
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0001'    SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0002'    SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0003'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0004'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0005'    SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0006'    SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0007'    SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0008'    SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0009'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0010'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0011'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0012'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
        ELSE
            BuiltIn.fail    !! WRONG DATA IN EXCEL !!!
        END
        Common_keyword.INTRANET TEARDOWN

    ELSE IF  '${card_type}' == 'umay_card'

        BuiltIn.Log    !! CASE>${card_type}!!    WARN

        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Header    ${data_keyinstep1_umay_card}
    
        ${group_value}    JSONLibrary.Get value from json    ${data_keyinstep1_umay_card}    $[?(@.TC=='${tc_title}')]
        # BuiltIn.Log    ${group_value}    WARN
        IF  ${group_value}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0001'    SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0002'    SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0003'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0004'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0005'    SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0006'    SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0007'    SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0008'    SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0009'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0010'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0011'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0012'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
        ELSE
            BuiltIn.fail    !! WRONG DATA IN EXCEL !!!
        END
        Common_keyword.INTRANET TEARDOWN

    ELSE IF  '${card_type}' == 'premier_card'

        BuiltIn.Log    !! CASE>${card_type}!!    WARN

        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Header    ${data_keyinstep1_premier_card}
    
        ${group_value}    JSONLibrary.Get value from json    ${data_keyinstep1_premier_card}    $[?(@.TC=='${tc_title}')]
        # BuiltIn.Log    ${group_value}    WARN
        IF  ${group_value}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0001'    SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0002'    SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0003'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0004'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0005'    SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0006'    SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0007'    SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0008'    SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER    ${group_value}    ${card_type}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0009'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0010'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0011'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
            BuiltIn.Run Keyword If    '${tc_title}'=='TS0012'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value}    ${card_type}    ${action_pending}
        ELSE
            BuiltIn.fail    !! WRONG DATA IN EXCEL !!!
        END
        Common_keyword.INTRANET TEARDOWN
    END


SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE
    [Arguments]    ${card_type}    ${card_no}       
    
    BuiltIn.Log    !! Card Type ->${card_type}    WARN
    BuiltIn.Run Keyword If    '${card_type}' == 'virual_umay_card'    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
    BuiltIn.Run Keyword If    '${card_type}' == 'virual_umay_card'    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${card_type}    
    BuiltIn.Run Keyword If    '${card_type}' == 'virual_premier_card'    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
    BuiltIn.Run Keyword If    '${card_type}' == 'virual_premier_card'    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${card_type}
    BuiltIn.Run Keyword If    '${card_type}' == 'umay_card'    SET INPUT UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}' == 'umay_card'    SET INPUT CONFIRM UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}' == 'premier_card'    SET INPUT UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}' == 'premier_card'    SET INPUT CONFIRM UMAY+ CARD    ${card_no}    


PENDING STEP INPUT DATA 
    [Arguments]    ${TC_group_value}    ${card_type}
    
    SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE    ${TC_group_value}    ${card_type}
    Common_feature.GET ID CARD FROM EXCEL DATA STOCK
    Key_in_step_1_page.INPUT ID    ${ID_no}
    Key_in_step_1_page.INPUT CONFIRM ID    ${ID_no}  
    Key_in_step_1_page.CHCEK DOPA RESULT    ${TC_group_value}  
    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${TC_group_value}    
    Key_in_step_1_page.INPUT NAME    ${TC_group_value}    
    Key_in_step_1_page.INPUT SURNAME    ${TC_group_value}  
    SET INPUT BIRTHDATE    ${TC_group_value}    
    SET INPUT CONFIRM BIRTHDATE    ${TC_group_value}    
    SET INPUT EXPIRE DATE    ${TC_group_value}    
    Key_in_step_1_page.INPUT MOBILE NO    ${TC_group_value}  
    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${TC_group_value} 
    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${TC_group_value}    
    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${TC_group_value}   
    Key_in_step_1_page.SELECT DROPDOWN SALEAGENT    ${TC_group_value}  
    Key_in_step_1_page.SELECT DROPDOWN CAMPAIGN    ${TC_group_value}    
    Key_in_step_1_page.SELECT DROPDOWN ACTIVITY    ${TC_group_value}  
    Key_in_step_1_page.SELECT DROPDOWN SPECIAL    ${TC_group_value}    
    Key_in_step_1_page.SELECT DROPDOWN CAMPAIGN 2    ${TC_group_value}    

    
PENDING STEP CHECK DATA AND CONFIRM BUTTON
    [Arguments]    ${TC_group_value}    ${card_type}
    
    # เวลาตั้งต้น เริ่มที่รอ 1 นาที
    ${timeout_status}    BuiltIn.Set Variable    50s

    # กด check
    ${Status_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CHECK DATA    ${timeout_status}
    BuiltIn.Log    >Status Button Check Data->${Status_check_data}    WARN
    IF  '${Status_check_data}' == 'False'   
        Key_in_step_1_page.BUTTON CHECK DATA         # ให้กดซ้ำ
    END

    # คำนวนเวลาใหม่  60 / 2 เหลือ 30
    ${timeout_status}    Common_keyword.CALCULATE NEW TIME OUT    ${timeout_status}    2    
    BuiltIn.Log    >NEW TIME OUT->${timeout_status}    WARN

    # popup newcustomer
    ${popup_new_customer}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_new_customer}    ${timeout_status}     
    BuiltIn.Log    >Popup New Customer->${popup_new_customer}    WARN  
     
    # ถ้าผ่าน ให้กำหนดเวลา รอ error 5s
    IF  '${popup_new_customer}' == 'True'
        ${timeout_status}    BuiltIn.Set Variable    5s
    # ถ้าไม่ผ่านให้รอ error 30s
    ELSE
        ${timeout_status}    BuiltIn.Set Variable    30s
    END

    # popup have contanct pending
    ${popup_pending}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_pending_application}    ${timeout_status}    
    BuiltIn.Log    >Modal Pending Popup->${popup_pending}    WARN  

    # อ่านค่าเลขการ์ดมา
    IF  '${popup_new_customer}' == 'True' and '${popup_pending}' == 'False' and ('${card_type}' == 'virual_umay_card' or '${card_type}' == 'virual_premier_card')
        BuiltIn.Run Keyword And Ignore Error    Key_in_step_1_page.GET VIRTUAD CARD NUMBER     
        BuiltIn.Log    >Virual/umay/premier_>${data_virtuadcard_No}    WARN
    END

    # ถ้าไม่เจอ popup newcustomer ค่อยทำ และเจอ pending
    IF  '${popup_new_customer}' == 'False' and '${popup_pending}' == 'True'
        BuiltIn.Log    !! ERROR POPUP PENDING INPUT AGIAN!!    WARN
        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
        Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING
        Key_in_step_1_page.CLICK BUTTON CLEAR
        Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_yaml]     # ให้เลือกมาใหม่  
        Key_in_step_1_feature.SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    Pending    Normal

    ELSE
        BuiltIn.Log    !! NO ERROR POPUP PENDING INPUT AGIAN NEXT!!    WARN
        # modal ชื่อ eng
        ${Status_name_eng}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_confirm_name_eng}   10s 
        BuiltIn.Log    >Modal Name ENG->${Status_name_eng}    WARN  
        IF  '${Status_name_eng}' == 'True'    
            BuiltIn.Log    !!DO IT NAME ENG!!    WARN
            Key_in_step_1_page.IF ELSE NAME ENG
        END

        # กด confirm check data
        ${Status_confirm_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA    50s    
        BuiltIn.Log    >Status Button Confirm Data->${Status_confirm_data}    WARN  
        IF  '${Status_confirm_data}' == 'True'    
            BuiltIn.Log    !!STAMP PENDING TO EXCEL!!    WARN
            Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
            Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING
        END


        # ให้กด yes popup confirm
        ${Status_comfirm_data}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Step1}    50s    
        BuiltIn.Log    >Status Button Confirm Data->${Status_comfirm_data}    WARN  
        IF  '${Status_comfirm_data}' == 'False'
            BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
            BuiltIn.fail    Not Success : Key 1 longtime to wait
            Common_keyword.INTRANET TEARDOWN
        ELSE
            BuiltIn.Log    !!BUTTON YES CONFIRM CHECK DATA!!    WARN
            # กดปุ่ม yes confirm check data
            ${Status_confirm_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA    25s   
            BuiltIn.Log    >Status confirm check data->${Status_confirm_check_data}    WARN
        END
    END


SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    Key_in_step_1_feature.SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    Pending    Normal
    Key_in_step_1_page.SELECT DROPDOWN PREMIUM    ${TC_group_value}      
    Key_in_step_1_feature.SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN    ${TC_group_value}    ${card_type}    ${ID_no}    Pending    Normal       


SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    PENDING STEP INPUT DATA    ${TC_group_value}    ${card_type}
    Key_in_step_1_page.SELECT DROPDOWN PREMIUM    ${TC_group_value}    
    Key_in_step_1_feature.SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN    ${TC_group_value}    ${card_type}    none    Pending    Normal       


SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    PENDING STEP INPUT DATA    ${TC_group_value}    ${card_type}
    PENDING STEP CHECK DATA AND CONFIRM BUTTON    ${TC_group_value}    ${card_type}  

    Common_keyword.INTRANET TEARDOWN       

                                                                  
SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    Key_in_step_1_feature.SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    Pending    Normal
    PENDING STEP CHECK DATA AND CONFIRM BUTTON    ${TC_group_value}    ${card_type}
    
    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    No    150s 
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN  
    
    ${Status_NOTE}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    BuiltIn.Log    >Status Button Save Note->${Status_NOTE}    WARN  

    ${Status_PENDING}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING 
    BuiltIn.Log    >Status Button Pending->${Status_PENDING}    WARN  

    Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    USE

    Common_keyword.INTRANET TEARDOWN


SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    PENDING STEP INPUT DATA    ${TC_group_value}    ${card_type}
    PENDING STEP CHECK DATA AND CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    No    150s    
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN 
    
    ${Status_NOTE}    BuiltIn.Run Keyword And Return Status   Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    BuiltIn.Log    >Status Button Save Note->${Status_NOTE}    WARN  

    ${Status_PENDING}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING
    BuiltIn.Log    >Status Button Pending->${Status_PENDING}    WARN 

    Common_keyword.INTRANET TEARDOWN


SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    Key_in_step_1_feature.SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    Pending    Normal
    PENDING STEP CHECK DATA AND CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    Yes    150s 
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN  

    ${Status_SENDDOC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON SENDDOC    Yes
    BuiltIn.Log    >Status Button Send Doc->${Status_SENDDOC}    WARN 

    ${Status_CON_SENDDOC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM SENDDOC    No
    BuiltIn.Log    >Status Button Confirm Send Doc->${Status_CON_SENDDOC}    WARN

    ${Status_SMS}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK CHECKBOX OPTION SMS PENDING
    BuiltIn.Log    >Status Button SMS->${Status_SMS}    WARN

    ${Status_NOTE}    BuiltIn.Run Keyword And Return Status   Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    BuiltIn.Log    >Status Button Save Note->${Status_NOTE}    WARN  

    ${Status_PENDING}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING
    BuiltIn.Log    >Status Button Pending->${Status_PENDING}    WARN 

    IF  '${Status_NBC}' == 'True' and '${Status_SENDDOC}' == 'True' and '${Status_CON_SENDDOC}' == 'True' and '${Status_SMS}' == 'True' and '${Status_NOTE}' == 'True' and '${Status_PENDING}' == 'True'
        BuiltIn.Log    !! PASS ALL STEP WRITE EXCEL !!    WARN 
        Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING
        BuiltIn.Run Keyword If    '${card_type}' == 'umay_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    PENDING
        BuiltIn.Run Keyword If    '${card_type}' == 'premier_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    PENDING
    ELSE
        BuiltIn.fail    !! ERROR SOME CASE IN STEP BEFORE SAVE !!
    END

    Common_keyword.INTRANET TEARDOWN
                                                                            
SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}
    
    PENDING STEP INPUT DATA    ${TC_group_value}    ${card_type}
    PENDING STEP CHECK DATA AND CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    Yes    150s 
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN  

    ${Status_SENDDOC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON SENDDOC    Yes
    BuiltIn.Log    >Status Button Send Doc->${Status_SENDDOC}    WARN 

    ${Status_CON_SENDDOC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM SENDDOC    No
    BuiltIn.Log    >Status Button Confirm Send Doc->${Status_CON_SENDDOC}    WARN

    ${Status_SMS}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK CHECKBOX OPTION SMS PENDING
    BuiltIn.Log    >Status Button SMS->${Status_SMS}    WARN

    ${Status_NOTE}    BuiltIn.Run Keyword And Return Status   Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    BuiltIn.Log    >Status Button Save Note->${Status_NOTE}    WARN  

    ${Status_PENDING}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING
    BuiltIn.Log    >Status Button Pending->${Status_PENDING}    WARN 

    Common_keyword.INTRANET TEARDOWN


SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]
    [Arguments]    ${TC_group_value}    ${card_type}    ${action_pending}
    
    BuiltIn.Log    >${card_type}>${action_pending}    WARN  

    Key_in_step_1_feature.SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    Pending    Normal
    PENDING STEP CHECK DATA AND CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    No    150s 
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN  
    
    ${Status_NOTE}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    BuiltIn.Log    >Status Button Save Note->${Status_NOTE}    WARN  

    ${Status_}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING 
    BuiltIn.Log    >Status>${Status_}>Cardtype>${card_type}>ActionPending>${action_pending}    WARN

    IF  '${Status_NBC}' == 'True' and '${Status_NOTE}' == 'True' and '${Status_}' == 'True'

        BuiltIn.Log    !! PASS ALL STEP WRITE EXCEL WRITE EXCEL !!    WARN
        BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    PENDING
        BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    PENDING   

        IF  '${card_type}'=='umay_card'

            BuiltIn.Log    !! WRITE EXCEL CASE>${card_type}!!    WARN

            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    REJECT
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    CANCEL
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        ELSE IF  '${card_type}'=='premier_card'
            
            BuiltIn.Log    !! WRITE EXCEL CASE>${card_type}!!    WARN

            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    REJECT
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    CANCEL
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL
        
        ELSE IF  '${card_type}'=='virual_umay_card'
            
            BuiltIn.Log    !! WRITE EXCEL CASE>${card_type}!!    WARN

            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        ELSE IF  '${card_type}'=='virual_premier_card'
            
            BuiltIn.Log    !! WRITE EXCEL CASE>${card_type}!!    WARN

            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        END
    ELSE
        BuiltIn.fail    !! ERROR SOME CASE IN STEP BEFORE SAVE !!
    END

    Common_keyword.INTRANET TEARDOWN


SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]
    [Arguments]    ${TC_group_value}    ${card_type}    ${action_pending}

    Key_in_step_1_feature.SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    Pending    Normal
    PENDING STEP CHECK DATA AND CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    Yes    150s 
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN  
    
    ${Status_SENDDOC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON SENDDOC    Yes
    BuiltIn.Log    >Status Button Send Doc->${Status_SENDDOC}    WARN 

    ${Status_CON_SENDDOC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM SENDDOC    No
    BuiltIn.Log    >Status Button Confirm Send Doc->${Status_CON_SENDDOC}    WARN

    ${Status_SMS}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK CHECKBOX OPTION SMS PENDING
    BuiltIn.Log    >Status Button SMS->${Status_SMS}    WARN

    ${Status_NOTE}    BuiltIn.Run Keyword And Return Status   Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    BuiltIn.Log    >Status Button Save Note->${Status_NOTE}    WARN  

    ${Status_PENDING}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING
    BuiltIn.Log    >Status Button Pending->${Status_PENDING}    WARN 


    IF  '${Status_NBC}' == 'True' and '${Status_SENDDOC}' == 'True' and '${Status_CON_SENDDOC}' == 'True' and '${Status_SMS}' == 'True' and '${Status_NOTE}' == 'True' and '${Status_PENDING}' == 'True'

        BuiltIn.Log    !! PASS ALL STEP WRITE EXCEL WRITE EXCEL !!    WARN

        BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    PENDING
        BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    PENDING   

        IF  '${card_type}'=='umay_card'

            BuiltIn.Log    !! WRITE EXCEL CASE>${card_type}!!    WARN

            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    REJECT
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    CANCEL
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        ELSE IF  '${card_type}'=='premier_card'

            BuiltIn.Log    !! WRITE EXCEL CASE>${card_type}!!    WARN
        
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    REJECT
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    CANCEL
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        ELSE IF  '${card_type}'=='virual_umay_card'

            BuiltIn.Log    !! WRITE EXCEL CASE>${card_type}!!    WARN

            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        ELSE IF  '${card_type}'=='virual_premier_card'

            BuiltIn.Log    !! WRITE EXCEL CASE>${card_type}!!    WARN

            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        END
    ELSE
        BuiltIn.fail    !! ERROR SOME CASE IN STEP BEFORE SAVE !!
    END

    Common_keyword.INTRANET TEARDOWN

