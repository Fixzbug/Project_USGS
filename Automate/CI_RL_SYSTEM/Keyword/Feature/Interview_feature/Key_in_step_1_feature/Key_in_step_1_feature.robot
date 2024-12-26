*** Settings ***
Resource    ${CURDIR}/../../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# set global to anywhere 
${run_option}
${group_value_data_matrix}
${TC_no}
${ID_no}
${date_app}
${branch}
${app_no}
${card}
${card_umay_data_stock}
${card_umay+}
${card_umay+_premire}
${Excel_Data_Stock_YAML}

# tag time
${popup_pending}
${Status_send_boten}
${Status_comfirm_}
${Status_CreditModel}
${state_next_step}    Not Success : Key 1

*** Keywords ***

SET SELECT BRANCH KEYINSTEP 1
    [Arguments]    ${TC_Index}
    Key_in_step_1_page.SELECT DROPDOWN BRANCH KEY IN STEP 1    ${TC_Index}
    Capture_Screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    SELECT_BRANCE
    Capture_Screen.CAPTURE SCREEN INTRO PAGE
    Key_in_step_1_page.CLICK BUTTON OK


CHOOSE MENU
    [Arguments]    ${TC_Index}
    Key_in_step_1_page.CHOOSE MENU INTERVIEW RL    ${TC_Index}
    

SET INPUT BIRTHDATE 
    [Arguments]    ${group_value}
    Key_in_step_1_page.INPUT BIRTHDATE DAY    ${group_value}
    Key_in_step_1_page.INPUT BIRTHDATE MONTH    ${group_value}
    Key_in_step_1_page.INPUT BIRTHDATE YEAR    ${group_value}


SET INPUT CONFIRM BIRTHDATE
    [Arguments]    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}


SET INPUT EXPIRE DATE
    [Arguments]    ${group_value}
    Key_in_step_1_page.INPUT EXPIRE DATE DAY    ${group_value}                                   
    Key_in_step_1_page.INPUT EXPIRE DATE MONTH    ${group_value}                                                    
    Key_in_step_1_page.INPUT EXPIRE DATE YEAR    ${group_value}


SET INPUT UMAY+ CARD
    [Arguments]    ${group_value}
    Key_in_step_1_page.INPUT UMAY+ CARD 1    ${group_value}
    Key_in_step_1_page.INPUT UMAY+ CARD 2    ${group_value}
    Key_in_step_1_page.INPUT UMAY+ CARD 3    ${group_value}
    Key_in_step_1_page.INPUT UMAY+ CARD 4    ${group_value}


SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD
    [Arguments]    ${group_value}
    Key_in_step_1_page.INPUT UMAY+ CARD 1    ${group_value}
    Key_in_step_1_page.INPUT UMAY+ CARD 2    ${group_value}
    Key_in_step_1_page.INPUT UMAY+ CARD 3    ${group_value}
    Key_in_step_1_page.INPUT UMAY+ CARD 4    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM UMAY+ CARD 1    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM UMAY+ CARD 2    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM UMAY+ CARD 3    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM UMAY+ CARD 4    ${group_value}
        

SET INPUT CONFIRM UMAY+ CARD
    [Arguments]    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM UMAY+ CARD 1    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM UMAY+ CARD 2    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM UMAY+ CARD 3    ${group_value}
    Key_in_step_1_page.INPUT CONFIRM UMAY+ CARD 4    ${group_value}


SET SELECT DROPDOWN APPLY TYPE TO SPECIAL CASE
    [Arguments]    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value} 
    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}    
    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}   
    Key_in_step_1_page.SELECT DROPDOWN SALEAGENT    ${group_value}  
    Key_in_step_1_page.SELECT DROPDOWN CAMPAIGN    ${group_value}    
    Key_in_step_1_page.SELECT DROPDOWN ACTIVITY    ${group_value}  
    Key_in_step_1_page.SELECT DROPDOWN SPECIAL    ${group_value}    
    Key_in_step_1_page.SELECT DROPDOWN CAMPAIGN 2    ${group_value}    


SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE DATA MATRIX
    [Arguments]    ${card_type}    ${card_no}
    
    BuiltIn.Log    !! Card Type ->${card_type}    WARN
    BuiltIn.Run Keyword If    '${card_type}' == 'virual_umay_card'    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
    BuiltIn.Run Keyword If    '${card_type}' == 'virual_umay_card'    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${card_type}    ${TC_no}    #  TC_no  from  global
    BuiltIn.Run Keyword If    '${card_type}' == 'virual_premier_card'    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
    BuiltIn.Run Keyword If    '${card_type}' == 'virual_premier_card'    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${card_type}    ${TC_no}    #  TC_no  from  global  
    BuiltIn.Run Keyword If    '${card_type}' == 'umay_card'    SET INPUT UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}' == 'umay_card'    SET INPUT CONFIRM UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}' == 'premier_card'    SET INPUT UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}' == 'premier_card'    SET INPUT CONFIRM UMAY+ CARD    ${card_no}    
    

SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE
    [Arguments]    ${tc_title}    ${option}=Normal
    
    ${TC_no}    BuiltIn.Set Variable    ${tc_title} 
    BuiltIn.Set global Variable    ${TC_no}
    BuiltIn.Log    !! Get TC_no from case ->${TC_no}    WARN
    BuiltIn.Log    !! Get option from case ->${option}    WARN
    
    # ถ้า มี data ใน excel ให้ทำต่อ
    IF  ${data_matrix_test_case}    

        ${group_value_data_matrix}    JSONLibrary.Get Value From Json    ${data_matrix_test_case}    $[?(@.TC=='${tc_title}')]
        BuiltIn.Set global Variable    ${group_value_data_matrix}

        ${card_type}    BuiltIn.Set Variable    ${group_value_data_matrix}[0][Card_type]
        BuiltIn.Set global Variable    ${card_type}
        BuiltIn.Log    !! Get card type from excel ->${card_type}    WARN

        # Login SSO
        Login_page.SET LOGIN SSO TO RL    Key1

        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Branch    ${data_matrix_test_case}

        # Action ในการ กรอกข้อมูลที่หน้า Keyinstep 1
        SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${group_value_data_matrix}    ${card_type}    Normal    ${option}
  
    ELSE
        BuiltIn.fail    !! NO DATA IN EXCEL !!
    END


SET E2E REGISTER KEY IN STEP 1 MATRIX CASE
    [Arguments]    ${TC_group_value}    ${card_type}    ${case}=Normal    ${option}=Normal

    BuiltIn.Log    >CARD TYPE->${card_type}>CASE->${case}>Option->${option}    WARN  

    IF  '${card_type}' == 'umay_card' 
        Common_feature.GET CARD UMAY+ FROM EXCEL DATA STOCK
        BuiltIn.Log    !!1st Umay_card Get New Card Again->${card_umay+}    WARN

    ELSE IF  '${card_type}' == 'premier_card' 
        Common_feature.GET CARD UMAY+ PREMIRE FROM EXCEL DATA STOCK
        BuiltIn.Log    !!1st Premier_card Get New Card Again->${card_umay+_premire}    WARN
    END
    
    IF  '${case}' == 'Normal'
        ${Status_check_id_card}    BuiltIn.Run Keyword And Return Status    SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE DATA MATRIX    ${card_type}    ${card_umay_data_stock}
        BuiltIn.Set Variable   ${Status_check_id_card} 
        BuiltIn.Log    >Status Check Card->${Status_check_id_card}    WARN
    
    ELSE IF  '${case}' == 'Pending'
        ${Status_check_id_card}    BuiltIn.Run Keyword And Return Status    SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE    ${card_type}    ${card_umay_data_stock}
        BuiltIn.Set Variable   ${Status_check_id_card} 
        BuiltIn.Log    >Status Check Card->${Status_check_id_card}    WARN
    END

    ${alert_card_use}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${alert_this_card_is_use}    
    BuiltIn.Set Variable   ${alert_card_use}   
    BuiltIn.Log    >Popup Card this use->${alert_card_use}    WARN  

    # ถ้ารอกได้แต่ไม่ผ่าน  error ขึ้นมาให้วนกรอกใหม่
    WHILE  '${Status_check_id_card}' == 'True' and '${alert_card_use}' == 'True'
        
        # สำหรับเช็คก่อน write ว่าเป็นเคส ไหน
        ${run_option}    BuiltIn.Set Variable   ${option}
        BuiltIn.Set global Variable   ${run_option}
        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING

        # get name data stock
        Common_feature.SET DATA STOCK YAML NAME
        # ให้เลือกมาใหม่
        IF  '${option}' == 'Normal'
            Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[${Excel_Data_Stock_YAML}]
        ELSE IF  '${option}' == 'GNO'
            Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[${Excel_Data_Stock_YAML}]
        END

        IF  '${card_type}' == 'umay_card' 
            Common_feature.GET CARD UMAY+ FROM EXCEL DATA STOCK
            BuiltIn.Log    !!2th Umay_card Get New Card Again->${card_umay+}    WARN

        ELSE IF  '${card_type}' == 'premier_card' 
            Common_feature.GET CARD UMAY+ PREMIRE FROM EXCEL DATA STOCK
            BuiltIn.Log    !!2th Premier_card Get New Card Again->${card_umay+_premire}    WARN
        END

        IF  '${case}' == 'Normal'
            ${Status_check_id_card}    BuiltIn.Run Keyword And Return Status    SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE DATA MATRIX    ${card_type}    ${card_umay_data_stock}
            BuiltIn.Set Variable   ${Status_check_id_card}
            BuiltIn.Log    >Status Check Card->${Status_check_id_card}    WARN

        ELSE IF  '${case}' == 'Pending'
            ${Status_check_id_card}    BuiltIn.Run Keyword And Return Status    SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE    ${card_type}    ${card_umay_data_stock}
            BuiltIn.Set Variable   ${Status_check_id_card}
            BuiltIn.Log    >Status Check Card->${Status_check_id_card}    WARN
        END

        # รอ popup อีกรอบเพื่อ reset loop while
        ${alert_card_use}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${alert_this_card_is_use}
        BuiltIn.Set global Variable   ${alert_card_use}   
        BuiltIn.Log    >Popup Card this use->${alert_card_use}    WARN

        IF  '${alert_card_use}' == 'False'
            BuiltIn.Log    !! BREAK WHILE LOOP !!    WARN
            BREAK
        END  

    END
    
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

    # สำหรับ case ปกติตาม matrix
    IF  '${case}' == 'Normal'
        Key_in_step_1_page.SELECT DROPDOWN PREMIUM    ${TC_group_value}   

        ${run_option}    BuiltIn.Set Variable   ${option}
        BuiltIn.Set global Variable   ${run_option}
        SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN    ${TC_group_value}    ${card_type}    ${ID_no}    Normal    ${option}
        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP1_${card_type}
        Capture_screen.CAPTURE SCREEN CURRENT PAGE
    END

    # สำหรับ case pending
    IF  '${case}' == 'Pending'
        BuiltIn.Log    >Pending    WARN
        ${run_option}    BuiltIn.Set Variable   ${option}
        BuiltIn.Set global Variable   ${run_option}
        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    PENDING_${card_type}
        Capture_screen.CAPTURE SCREEN CURRENT PAGE
    END



SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN
    [Arguments]    ${TC_group_value}    ${card_type}    ${ID_no}=none    ${case}=Normal    ${option}=Normal
    
    BuiltIn.Set global Variable    ${state_next_step} 
    ${timeout_status}    BuiltIn.Set Variable    50s

    # กด check
    ${Status_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CHECK DATA    ${timeout_status}
    BuiltIn.Log    >Status Button Check Data->${Status_check_data}    WARN
    IF  '${Status_check_data}' == 'False'   
        Key_in_step_1_page.BUTTON CHECK DATA         # ให้กดซ้ำ
    END

    # คำนวนเวลาใหม่ 50 / 2 เหลือ 25
    ${timeout_status}    Common_keyword.CALCULATE NEW TIME OUT    ${timeout_status}    2    
    BuiltIn.Log    >NEW TIME OUT->${timeout_status}    WARN

    # popup newcustomer
    ${popup_new_customer}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_new_customer}    ${timeout_status}     
    BuiltIn.Log    >Popup New Customer->${popup_new_customer}    WARN  
    
    # ถ้าผ่าน ให้กำหนดเวลา รอ error 3s เพื่อ skip
    IF  '${popup_new_customer}' == 'True'
        ${timeout_status}    BuiltIn.Set Variable    3s
    # ถ้าไม่ผ่านให้รอ error 30s
    ELSE
        ${timeout_status}    BuiltIn.Set Variable    30s
    END
     
    # popup have contanct pending
    ${popup_pending}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_pending_application}    ${timeout_status}    
    BuiltIn.Log    >Modal Pending Popup->${popup_pending}    WARN 

    # อ่านค่าเลขการ์ดมา
    BuiltIn.Run Keyword And Ignore Error    Key_in_step_1_page.GET VIRTUAD CARD NUMBER
    BuiltIn.Log    >Virual/umay/premier_>${data_virtuadcard_No}    WARN

    # # อ่านค่าเลขการ์ดมา
    # IF  '${popup_new_customer}' == 'True' and '${popup_pending}' == 'False' and ('${card_type}' == 'virual_umay_card' or '${card_type}' == 'virual_premier_card')
    #     BuiltIn.Run Keyword And Ignore Error    Key_in_step_1_page.GET VIRTUAD CARD NUMBER     
    #     BuiltIn.Log    >Virual/umay/premier_>${data_virtuadcard_No}    WARN
    # END

    # ถ้าไม่เจอ popup newcustomer ค่อยทำ และเจอ pending
    IF  '${popup_new_customer}' == 'False' and '${popup_pending}' == 'True'
        BuiltIn.Log    !! ERROR POPUP PENDING INPUT AGIAN!!    WARN
        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
        Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING
        Key_in_step_1_page.CLICK BUTTON CLEAR

        IF  '${option}' == 'Normal'
            BuiltIn.Log    !!DO IT ${option}!!    WARN
            Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[${Excel_Data_Stock_YAML}]     # ให้เลือกมาใหม่
            SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${group_value_data_matrix}    ${card_type}    Normal    ${option}   
        ELSE IF  '${option}' == 'GNO'
            BuiltIn.Log    !!DO IT ${option}!!    WARN
            Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[${Excel_Data_Stock_YAML}]  # ให้เลือกมาใหม่
            SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${group_value_data_matrix}    ${card_type}    Normal    ${option}   
        END

    ELSE
        BuiltIn.Log    !! NO ERROR POPUP NEXT!!    WARN
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
            BuiltIn.Set global Variable   ${Status_comfirm_data}
            Common_keyword.INTRANET TEARDOWN
            BuiltIn.fail    Not Success : Key 1 longtime to wait
        ELSE
        
            BuiltIn.Log    !!BUTTON YES CONFIRM CHECK DATA!!    WARN
            # กดปุ่ม yes confirm check data
            ${Status_confirm_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA    25s   
            BuiltIn.Log    >Status confirm check data->${Status_confirm_check_data}    WARN
            
            # popup ncb
            BuiltIn.Log    !!CLICK YES POP UP HAVE CONSENT YES/NO!!    WARN
            ${Status_ncb}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    Yes    150s  
            BuiltIn.Log    >Status modal have consend->${Status_ncb}    WARN  
            
            # ถ้ากดได้ confirm check data และ กด yes ได้
            IF  '${Status_confirm_check_data}' == 'True' and '${Status_ncb}' == 'True'    
                BuiltIn.Log    !!PASS CLICK AND NEXT!!    WARN

                # set time task
                ${timeout_status}    BuiltIn.Set Variable    15s
                BuiltIn.Set global Variable   ${timeout_status} 
                
            # ถ้ากดไม่ได้ confirm check data และ กด yes ไม่ได้ ให้รอ ปุ่ม save
            ELSE
                BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
                Common_keyword.INTRANET TEARDOWN
                BuiltIn.fail    Not Success : Key 1 longtime to wait
                
            END
        END

        # stamp check if error Digit of CSN Invalid
        ${Status_modal_NCB}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_modal_NCB}    ${timeout_status}
        BuiltIn.Log    >Status_modal_NCB->${Status_modal_NCB}    WARN  
        
        # popup csn error
        ${Status_CSN}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_csn_error}    ${timeout_status} 
        BuiltIn.Log    >Status_CSN->${Status_CSN}    WARN  
        
        
        # ถ้า popup error CSN ให้ write excel แล้วออกเลย
        IF  '${Status_modal_NCB}' == 'True' and '${Status_CSN}' == 'True'    
            Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    CHECK
            Common_keyword.INTRANET TEARDOWN
            BuiltIn.fail    !!Digit of CSN Invalid!!
        END
        
        # modal creadit หายไป
        ${Status_CreditModel}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_modal_Creadit}    120s 
        BuiltIn.Log    >Status_CreditModel->${Status_CreditModel}    WARN  
        IF  '${Status_CreditModel}' == 'True'    

            Key_in_step_1_page.BUTTON SENDDOC
            Key_in_step_1_page.BUTTON CONFIRM SENDDOC
        
            # ดึง barcode # ดึง application no  # ดึง date
            ${barcode}    Common_feature.GET BARCODE FROM EXCEL DATA STOCK
            ${app_no}    Key_in_step_1_page.GET APPLICATION NUMBER
            ${application_date}    Key_in_step_1_page.GET APPLICATION DATE    

            # stamp app_no at excel       
            Common_feature.WRITE APPLICATION NUMBER TO DATA STOCK    ${app_no}
            
            # กรอก barcode
            ${Status_key_barcode}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.INPUT BARCODE    ${barcode}
            BuiltIn.Log    Status_key_barcode->${Status_key_barcode}    WARN
            
            # กด confirm ได้
            ${Status_confirm_barcode}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM BARCODE    30s
            BuiltIn.Log    Status_confirm_barcode->${Status_confirm_barcode}    WARN  
            
            # popup error
            IF  '${Status_confirm_barcode}' == 'True'
                ${popup_barcode}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_barcode_error}    5s      
                BuiltIn.Set global Variable    ${popup_barcode}
                BuiltIn.Log    Popup_barcode->${popup_barcode}    WARN
            END
            
            # กรอก barcode ได้ และ กด confirm ได้ และ  popup error ไม่ขึ้น
            IF  '${Status_key_barcode}' == 'True' and '${Status_confirm_barcode}' == 'True' and '${popup_barcode}' == 'False'    

                # รอ popup boten ขึ้นมา
                ${Status_send_boten}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Sendboten}    30s
                BuiltIn.Set global Variable    ${Status_send_boten}
                BuiltIn.Log    Status_send_boten->${Status_send_boten}    WARN
                
                # ถ้าผ่านให้แล้วออก while
                IF  '${Status_send_boten}' == 'True'    
                    
                    BuiltIn.Log    !!Boten popup show!!    WARN
                    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_modal_sendboten}    10s
                    Key_in_step_1_page.BUTTON SEND BOTEN    10s
                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP_1_${card_type}_BOTEN_COMPLETE    
                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    Key_in_step_1_page.WAIT COMPLETE    20s

                    # # ตรวจสอบว่ามี popup error ไหม
                    # ${Status_popup_error}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_error_pending_key2}    5s
                    # IF  '${Status_popup_error}' == 'True'
                    #     Common_keyword.INTRANET TEARDOWN
                    #     BuiltIn.Fail    Popup error : Key 1 
                    # END

                END
            END

            # กรอก barcode ได้ และ กด confirm ได้ และ  popup error ขึ้น
            IF  '${Status_key_barcode}' == 'True' and '${Status_confirm_barcode}' == 'True' and '${popup_barcode}' == 'True'

                # ถ้า popup barcode ซ้ำขึ้น 
                WHILE  '${popup_barcode}' == 'True'

                    # stamp อันเก่าก่อนที่ row นั้น
                    Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    USE    
                    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_barcode    ${rows_barcode_data_stock}    2    USE

                    # ให้เลือกมาใหม่
                    IF  '${option}' == 'Normal'
                        BuiltIn.Log    !!DO IT ${option}!!    WARN
                        Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[${Excel_Data_Stock_YAML}]     # ให้เลือกมาใหม่
                    ELSE IF  '${option}' == 'GNO'
                        BuiltIn.Log    !!DO IT ${option}!!    WARN
                        Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[${Excel_Data_Stock_YAML}]  # ให้เลือกมาใหม่
                    END

                    ${barcode}    Common_feature.GET BARCODE FROM EXCEL DATA STOCK
                    BuiltIn.Log    !!Exist Barcode Get New Barcode Again->${barcode}    WARN
                    
                    # กรอกอีกครั้ง
                    ${Status_key_barcode}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.INPUT BARCODE    ${barcode}
                    BuiltIn.Log    Status_key_barcode->${Status_key_barcode}    WARN
                    
                    # กด confirm ได้
                    ${Status_confirm_barcode}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM BARCODE    30s
                    BuiltIn.Log    Status_confirm_barcode->${Status_confirm_barcode}    WARN  

                    # รอ popup boten ขึ้นมา
                    IF  '${Status_confirm_barcode}' == 'True'
                        ${Status_send_boten}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Sendboten}    30s
                        # BuiltIn.Set global Variable    ${Status_send_boten}
                        BuiltIn.Log    Status_send_boten->${Status_send_boten}    WARN
                    END
                    
                    # ถ้าผ่านให้แล้วออก while
                    IF  '${Status_key_barcode}' == 'True' and '${Status_confirm_barcode}' == 'True' and '${Status_send_boten}' == 'True'    

                        BuiltIn.Log    !!Boten popup show in case exits barcode!!    WARN
                        SeleniumLibrary.Wait Until Element Is Visible    ${Locator_modal_sendboten}    10s
                        Key_in_step_1_page.BUTTON SEND BOTEN    10s
                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP_1_${card_type}_BOTEN_COMPLETE    
                        Capture_screen.CAPTURE SCREEN CURRENT PAGE
                        Key_in_step_1_page.WAIT COMPLETE    20s
                        
                        # stamp USE ที่ row นั้น
                        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    USE    
                        Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_barcode    ${rows_barcode_data_stock}    2    USE

                        # กันทำอีกรอบ
                        ${popup_barcode}    BuiltIn.Set Variable    False
                        BuiltIn.Set global Variable    ${popup_barcode}
                        BREAK

                    # ถ้าไม่ผ่านให้เช็คต่อ
                    ELSE IF  '${Status_send_boten}' == 'False'
                        # รออ่าน popup ซ้ำอีกที
                        ${popup_barcode}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_barcode_error}    5s  
                        BuiltIn.Set global Variable    ${popup_barcode}
                        BuiltIn.Log    Popup_barcode->${popup_barcode}    WARN
                        
                    END

                END

            END    

        
            # ถ้าไม่ใช่ case pending ค่อยทำ
            IF  '${case}' == 'Normal'
                
                IF  '${option}' == 'Normal' or '${option}' == 'GNO'
                    BuiltIn.Log    !!DO IT ${option} WRITE EXCEL LAST STEP!!    WARN

                    # strip value to use
                    ${date_app}    BuiltIn.Set Variable    ${application_date}
                    ${date_app}    String.Strip String    ${date_app}

                    # stamp USE ที่ row นั้น
                    Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    USE    
                    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_barcode    ${rows_barcode_data_stock}    2    USE
                    
                    # stamp actual resilt
                    Common_feature.SET DATA ACTUAL RESULT ON EXCEL INSERT ID NO    ${TC_no}    ID_no    ${ID_no}      # insert 1st before update at ID_no
                    
                    # stamp actual result
                    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    Branch    ${branch}     
                    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    Date    ${date_app}    
                    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    App_no    ${app_no}      
                    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    Campaign    ${TC_group_value}[0][KS1_Campaign]
                
                    BuiltIn.Run Keyword If    '${card_type}'=='virual_umay_card'    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    Card    ${data_virtuadcard_No}     
                    BuiltIn.Run Keyword If    '${card_type}'=='virual_premier_card'    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    Card    ${data_virtuadcard_No}    
                    BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    Card    ${card_umay+}     
                    BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    Card    ${card_umay+_premire}     

                    # stamp state
                    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    KS1  
                   
                END                 

                ${state_next_step}    BuiltIn.Set Variable    KS1
                BuiltIn.Set global Variable    ${state_next_step}  

                # set global to anywhere 
                BuiltIn.Set global Variable    ${TC_no}
                BuiltIn.Set global Variable    ${date_app}
                BuiltIn.Set global Variable    ${ID_no}
                BuiltIn.Set global Variable    ${branch}
                BuiltIn.Set global Variable    ${app_no}

                IF  '${card_type}' == 'virual_umay_card' or '${card_type}' == 'virual_premier_card'
                    ${card}    BuiltIn.Set Variable    ${data_virtuadcard_No}
                    BuiltIn.Set global Variable    ${card}   
                ELSE IF  '${card_type}' == 'umay_card' 
                    ${card}    BuiltIn.Set Variable    ${card_umay+}
                    BuiltIn.Set global Variable    ${card}  
                ELSE IF  '${card_type}' == 'premier_card'
                    ${card}    BuiltIn.Set Variable    ${card_umay+_premire}
                    BuiltIn.Set global Variable    ${card}    
                END
                
                BuiltIn.Log    PASS_>${TC_no}    WARN    
                BuiltIn.Log    PASS_>${ID_no}    WARN        
                BuiltIn.Log    PASS_>${date_app}    WARN    	
                BuiltIn.Log    PASS_>${branch}    WARN    
                BuiltIn.Log    PASS_>${app_no}    WARN    	
                BuiltIn.Log    PASS_>${card}    WARN   
                BuiltIn.Log    ---------------------    WARN
                Common_keyword.INTRANET TEARDOWN    Time_key_in_step_1

            END  # end pending  

        # กรอกแล้ว รอว่า popup error ขึ้นมั้ย
        ELSE
            BuiltIn.Log    !!Longtime to waiting!!!    WARN
            Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Key 1 
            Common_keyword.INTRANET TEARDOWN
            BuiltIn.fail    Not Success : Key 1 
        END
    END  

