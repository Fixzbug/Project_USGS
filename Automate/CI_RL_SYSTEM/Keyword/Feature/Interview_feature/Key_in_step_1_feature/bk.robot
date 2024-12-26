*** Settings ***
Resource    ${CURDIR}/../../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# set global to anywhere 
${run_option}
${group_value_data_matrix_test_case}
${TC_no}
${ID_no}
${date_app}
${branch}
${app_no}
${card}
${card_umay_data_stock}
${card_umay+}
${card_umay+_premire}

# tag time
${popup_pending}
${Status_send_boten}
${Status_comfirm_}
${Status_CreditModel}
${START_TIME}     None
${END_TIME}       None
${WAIT_TIME}      None

*** Keywords ***

SET SELECT BRANCH
    [Arguments]    ${TC_Index}
    Key_in_step_1_page.SELECT DROPDOWN BRANCH    ${TC_Index}
    Capture_Screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    SELECT_BRANCE
    Capture_Screen.CAPTURE SCREEN INTRO PAGE
    Key_in_step_1_page.CLICK BUTTON OK


SET SELECT BRANCH KEYINSTEP 1
    [Arguments]    ${TC_Index}
    Key_in_step_1_page.SELECT DROPDOWN BRANCH KEY IN STEP 1    ${TC_Index}
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


SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN (CLOSING)
    [Arguments]    ${group_value}    ${option}

    Key_in_step_1_page.BUTTON CHECK DATA

    Key_in_step_1_page.INPUT NAME ENG

    Key_in_step_1_page.INPUT SURNAME ENG

    Key_in_step_1_page.CLICK BUTTON CONFIRM NAME ENG

    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA

    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA

    Key_in_step_1_page.BUTTON NCB

    Key_in_step_1_page.BUTTON SENDDOC

    Key_in_step_1_page.BUTTON CONFIRM SENDDOC

    ${barcode}    ${rows_barcode}    Common_feature.GET BARCODE FROM EXCEL DATA STOCK

    Key_in_step_1_page.INPUT BARCODE    ${barcode}

    Key_in_step_1_page.BUTTON CONFIRM BARCODE

    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_barcode    ${rows_barcode}    2    USE

    Key_in_step_1_page.BUTTON SEND BOTEN

    Key_in_step_1_page.WAIT COMPLETE


# KEY 1
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
    # Key_in_step_1_page.SELECT DROPDOWN CAMPAIGN 3    ${group_value}


SET REGISTER KEY IN STEP 1 (VIRUAL CARD) FOR MIGRATE APPLY PROCESS RL
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID VIRTUAL UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID INPUT ID VIRTUAL UMAY+ CARD    ${group_value} 

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value} 

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}                 

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN SALEAGENT    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN CAMPAIGN    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN SPECIAL    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA


SET REGISTER KEY IN STEP 1 (UMAY+ CARD) FOR MIGRATE APPLY PROCESS RL
    [Arguments]    ${group_value}

    # SET INPUT UMAY+ CARD    ${group_value}

    # SET INPUT CONFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}


    Key_in_step_1_page.INPUT ID VIRTUAL UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID INPUT ID VIRTUAL UMAY+ CARD    ${group_value}    

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    SET SELECT DROPDOWN APPLY TYPE TO SPECIAL CASE    ${group_value}

    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP1_UMAY_PLUS_CARD

    Capture_screen.CAPTURE SCREEN CURRENT PAGE

    Key_in_step_1_page.BUTTON CHECK DATA

                               
SET AUTO REJECT
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}    

    Key_in_step_1_page.CHCEK DOPA RESULT    ${group_value}  

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value} 

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}  

    SET SELECT DROPDOWN APPLY TYPE TO SPECIAL CASE    ${group_value}                

    Key_in_step_1_page.BUTTON CHECK DATA

    Key_in_step_1_page.IF ELSE NAME ENG

    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA

    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA

    Key_in_step_1_page.VERIFY MESSAGE     ${group_value}[0][popup_error]

    CAPTURE SCREEN VERIFY POPUP CONDITION    

    Key_in_step_1_page.CLICK BUTTON SEND SMS

    Key_in_step_1_page.CLICK BUTTON CLEAR


SET AUTO REJECT HAVE POPUP NCB AND POPUP SENDDOCCVMENT
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}    

    Key_in_step_1_page.CHCEK DOPA RESULT    ${group_value}  

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value} 

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}  

    SET SELECT DROPDOWN APPLY TYPE TO SPECIAL CASE    ${group_value}                

    Key_in_step_1_page.BUTTON CHECK DATA

    Key_in_step_1_page.IF ELSE NAME ENG

    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA

    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA

    Key_in_step_1_page.VERIFY MESSAGE     ${group_value}[0][popup_error]    

    Key_in_step_1_page.CLICK BUTTON SEND SMS

    Key_in_step_1_page.CLICK BUTTON CLEAR


SET AUTO REJECT HAVE BUTTON NCB AND BUTTON SENDDOC
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}    

    Key_in_step_1_page.CHCEK DOPA RESULT    ${group_value}  

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}  

    SET SELECT DROPDOWN APPLY TYPE TO SPECIAL CASE    ${group_value}                

    Key_in_step_1_page.BUTTON CHECK DATA

    Key_in_step_1_page.IF ELSE NAME ENG

    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA

    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA

    Key_in_step_1_page.BUTTON NCB

    Key_in_step_1_page.VERIFY MESSAGE     ${group_value}[0][popup_error] 

    Key_in_step_1_page.CLICK BUTTON SEND SMS

    Key_in_step_1_page.BUTTON SENDDOC

    Common_keyword.CLOSE NEW WINDOW

    Common_keyword.SWITCH WINDOW TO ACTIVE

    Key_in_step_1_page.CLICK BUTTON CLEAR


SET AUTO REJECT HAVE BUTTON NCB AND BUTTON SENDDOC (UMAY CARD)
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD    ${group_value}

    SET INPUT CONFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}    

    Key_in_step_1_page.CHCEK DOPA RESULT    ${group_value}  

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value} 

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}  

    SET SELECT DROPDOWN APPLY TYPE TO SPECIAL CASE    ${group_value}                

    Key_in_step_1_page.BUTTON CHECK DATA

    Key_in_step_1_page.IF ELSE NAME ENG

    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA

    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA

    Key_in_step_1_page.BUTTON NCB

    Key_in_step_1_page.VERIFY MESSAGE     ${group_value}[0][popup_error] 

    Key_in_step_1_page.CLICK BUTTON SEND SMS

    Key_in_step_1_page.BUTTON SENDDOC 

    Key_in_step_1_page.CLICK BUTTON CLEAR

                                                                            
SET AUTO REJECT (UMAY CARD)
    [Arguments]    ${group_value}
                                                                               
    SET INPUT UMAY+ CARD    ${group_value}

    SET INPUT CONFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}    

    Key_in_step_1_page.CHCEK DOPA RESULT    ${group_value}  

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    SET SELECT DROPDOWN APPLY TYPE TO SPECIAL CASE    ${group_value}                

    Key_in_step_1_page.BUTTON CHECK DATA

    Key_in_step_1_page.IF ELSE NAME ENG

    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA

    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA

    Key_in_step_1_page.VERIFY MESSAGE     ${group_value}[0][popup_error]

    Capture_screen.CAPTURE SCREEN VERIFY POPUP CONDITION 

    Key_in_step_1_page.CLICK BUTTON SEND SMS

    Key_in_step_1_page.CLICK BUTTON CLEAR


VERIFY FIELD - TS1001_001
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}  

    Common_keyword.VERIFY ELEMENT NOT VISIBLE    ${Locator_Button_Checkdata}

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1001_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_id_locator}    ${group_data_value_for_verify}[0][Confirm ID]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1001_003
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.VERIFY MESSAGE     ${group_data_value_for_verify}[0][Confirm ID]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1001_004
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Common_keyword.WAIT UNTIL ELEMENT VISIBLE    ${Locator_Button_Checkdata}

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1
                              

VERIFY FIELD - TS1002_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Title]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1002_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Title}    ${title_input}    ${group_value}[0][Title]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Title]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1002_003
    [Arguments]    ${group_value}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Title] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
            Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Title}    ${title_index_locator}    ${convert_index}    

                Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1
                    
    END


VERIFY FIELD - TS1003_001
    [Arguments]    ${group_value}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    ${text}    Common_keyword.GET DATA VALUE BY LOCATOR AND SCROLL    ${Locator_Field_Namethai} 

    ${convert_complete}    CONVERT ARRAY TO STRING    ${text}

    ${count_complete}    Common_keyword.COUNT STRING    ${convert_complete}  

    Common_keyword.VERIFY DATA PAGE BY FILE INDEX    ${count_complete}    50

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1008_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Applytype}    ${ApplyType_input_locator}    ${group_value}[0][Apply Type]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Apply Type]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1008_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}                                                       

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_apply_type_locator}    ${group_data_value_for_verify}[0][Apply Type]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1008_003
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}
                
    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Repeat Keyword    2    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Click Element    ${Locator_Select_Applytype}
                
    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Apply Type] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
        Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Applytype}    ${ApplyType_index_locator}    ${convert_index} 

        Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1   
                    
    END    


VERIFY FIELD - TS1003_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_surname_locator}    ${group_data_value_for_verify}[0][Surname]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1004_001
    [Arguments]    ${group_value}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    ${text}    Common_keyword.GET DATA VALUE BY LOCATOR AND SCROLL    ${Locator_Field_Surnamethai} 

    ${convert_complete}    CONVERT ARRAY TO STRING    ${text}

    ${count_complete}    Common_keyword.COUNT STRING    ${convert_complete}  

    Common_keyword.VERIFY DATA PAGE BY FILE INDEX    ${count_complete}    50

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1004_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_lastname_locator}    ${group_data_value_for_verify}[0][Lastname]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1005_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_birthday_locator}    ${group_data_value_for_verify}[0][Birth Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1005_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_birthday_locator}    ${group_data_value_for_verify}[0][Birth Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1005_003
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_birthday_locator}    ${group_data_value_for_verify}[0][Birth Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1

                            
VERIFY FIELD - TS1006_001
    [Arguments]    ${group_value}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO   ${group_value}

    ${text}    Common_keyword.GET DATA VALUE BY LOCATOR AND SCROLL    ${Locator_Field_Mobileno} 

    ${convert_complete}    CONVERT ARRAY TO STRING    ${text}

    ${count_complete}    Common_keyword.COUNT STRING    ${convert_complete}  

    Common_keyword.VERIFY DATA PAGE BY FILE INDEX    ${count_complete}    10

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1

VERIFY FIELD - TS1007_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_expire_date_locator}    ${group_data_value_for_verify}[0][Expire Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1007_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE YEAR   ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_expire_date_locator}    ${group_data_value_for_verify}[0][Expire Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1009_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE YEAR   ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${dropdown_via_locator}    ${input_dropdown_via_locator}    ${group_value}[0][Apply Via]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Apply Via]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1009_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE YEAR   ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_apply_via_locator}    ${group_data_value_for_verify}[0][Apply Via]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1009_003
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}                                                        

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Apply Via] + 1

        FOR  ${index}    IN RANGE    1    ${tc_amount}    1

            ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
            Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Applyvia}    ${ApplyVia_index_locator}    ${convert_index}   

            Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1 

        END  


VERIFY FIELD - TS1010_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Applychannel}    ${ApplyChannel_input_locator}    ${group_value}[0][Apply Channal]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Apply Channal]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1010_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_apply_channal_locator}    ${group_data_value_for_verify}[0][Apply Channal]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1010_003
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Apply Channal] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
        Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Applychannel}    ${applychannel_index_locator}    ${convert_index} 

        Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1   

    END    


VERIFY FIELD - TS1011_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Label_Saleagent}    ${saleagent_input_locator}    ${group_value}[0][SaleAgent]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][SaleAgent]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1011_002
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][SaleAgent] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
        Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Label_Saleagent}    ${saleagent_index_locator}    ${convert_index} 

        Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1   

    END   


VERIFY FIELD - TS1012_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Label_Campaign}    ${campaign_1_input_locator}    ${group_value}[0][Campaign]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Campaign]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1012_002
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Campaign] + 1

        FOR  ${index}    IN RANGE    1    ${tc_amount}    1
        
            ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
                Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Label_Campaign}    ${capmaign_1_index_locator}    ${convert_index} 

                    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1   
                        
        END   


VERIFY FIELD - TS1013_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Activity}    ${Activity_input_locator}    ${group_value}[0][Activity Code]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Activity Code]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1013_002
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Activity Code] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
        Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Activity}    ${activity_index_locator}    ${convert_index}   

        Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1 

    END    


VERIFY FIELD - TS1014_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}                                                    

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Specialcase}    ${Specialcase_input_locator}    ${group_value}[0][Special Case]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Special Case]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS1014_002
    [Arguments]    ${group_value}

    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD

    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}
        
    SET INPUT CONFIRM BIRTHDATE    ${group_value}
                    
    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}  

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Special Case] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
            Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Specialcase}    ${special_Case_index_locator}    ${convert_index}  

                Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1  
                    
    END                                                                   


VERIFY FIELD - TS3001_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Umay_1]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3001_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value} 

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Umay_1]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3001_003
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}    

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3002_001
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}  

    Common_keyword.VERIFY ELEMENT NOT VISIBLE    ${Locator_Button_Checkdata}

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3002_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    
    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID VERIFY FIELD - TS3002_002    ${group_value}

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_id_locator}    ${group_data_value_for_verify}[0][Confirm ID]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3002_003
    [Arguments]    ${group_value}    ${group_data_value_for_verify}
    
    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.VERIFY MESSAGE     ${group_data_value_for_verify}[0][Confirm ID]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3002_004
    [Arguments]    ${group_value}
    
    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Common_keyword.WAIT UNTIL ELEMENT VISIBLE    ${Locator_Button_Checkdata}

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3003_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Title]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3003_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Title}    ${title_input}    ${group_value}[0][Title]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Title]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3003_003
    [Arguments]    ${group_value}
    
    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Title] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
            Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Title}    ${title_index_locator}    ${convert_index}   

                Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1 
                    
    END


VERIFY FIELD - TS3004_001
    [Arguments]    ${group_value}
    
    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    ${text}    Common_keyword.GET DATA VALUE BY LOCATOR AND SCROLL    ${Locator_Field_Namethai} 

    ${convert_complete}    CONVERT ARRAY TO STRING    ${text}

    ${count_complete}    Common_keyword.COUNT STRING    ${convert_complete}  

    Common_keyword.VERIFY DATA PAGE BY FILE INDEX    ${count_complete}    50

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3004_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Applytype}    ${ApplyType_input_locator}    ${group_value}[0][Apply Type]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Apply Type]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3005_001
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    ${text}    Common_keyword.GET DATA VALUE BY LOCATOR AND SCROLL    ${Locator_Field_Surnamethai} 

    ${convert_complete}    CONVERT ARRAY TO STRING    ${text}

    ${count_complete}    Common_keyword.COUNT STRING    ${convert_complete}  

    Common_keyword.VERIFY DATA PAGE BY FILE INDEX    ${count_complete}    50

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3005_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_lastname_locator}    ${group_data_value_for_verify}[0][Lastname]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3006_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_birthday_locator}    ${group_data_value_for_verify}[0][Birth Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3006_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_birthday_locator}    ${group_data_value_for_verify}[0][Birth Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3006_003
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_birthday_locator}    ${group_data_value_for_verify}[0][Birth Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3007_001
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO   ${group_value}

    ${text}    Common_keyword.GET DATA VALUE BY LOCATOR AND SCROLL    ${Locator_Field_Mobileno} 

    ${convert_complete}    CONVERT ARRAY TO STRING    ${text}

    ${count_complete}    Common_keyword.COUNT STRING    ${convert_complete}  

    Common_keyword.VERIFY DATA PAGE BY FILE INDEX    ${count_complete}    10

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1

                                                                                        
VERIFY FIELD - TS3008_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_expire_date_locator}    ${group_data_value_for_verify}[0][Expire Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1

VERIFY FIELD - TS3008_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE YEAR   ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_expire_date_locator}    ${group_data_value_for_verify}[0][Expire Day]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3009_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Applytype}    ${ApplyType_input_locator}    ${group_value}[0][Apply Type]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Apply Type]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3009_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Applytype}    ${ApplyType_input_locator}    ${group_value}[0][Apply Type]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Apply Type]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3009_003
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}
                
    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Repeat Keyword    2    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Click Element    ${Locator_Select_Applytype}
                
    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Apply Type] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
            Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Applytype}    ${ApplyType_index_locator}    ${convert_index}  

                Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1  
                    
    END   


VERIFY FIELD - TS3010_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE YEAR   ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${dropdown_via_locator}    ${input_dropdown_via_locator}    ${group_data_value_for_verify}[0][Apply Type]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Apply Type]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3010_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE DAY   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT BIRTHDATE YEAR   ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE DAY    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE MONTH    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM BIRTHDATE YEAR    ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE DAY   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE MONTH   ${group_value}

    Key_in_step_1_page.INPUT EXPIRE DATE YEAR   ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_apply_via_locator}    ${group_data_value_for_verify}[0][Apply Via]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3010_003
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}
            
    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}                                                        
            
    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Apply Via] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
        Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Applyvia}    ${ApplyVia_index_locator}    ${convert_index}    

        Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1
                    
    END  


VERIFY FIELD - TS3011_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}
            
    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}
        
    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}
            
    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Applychannel}    ${ApplyChannel_input_locator}    ${group_value}[0][Apply Channal]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Apply Channal]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3011_002
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.BUTTON CHECK DATA

    Common_keyword.GET TEXT AND SHOULD BE EQUAL    ${error_message_apply_channal_locator}    ${group_data_value_for_verify}[0][Apply Channal]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3011_003
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Apply Channal] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
        Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Applychannel}    ${applychannel_index_locator}    ${convert_index}  

        Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1  

    END    


VERIFY FIELD - TS3012_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Label_Saleagent}    ${saleagent_input_locator}    ${group_value}[0][SaleAgent]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][SaleAgent]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3012_002
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}
        
    SET INPUT CONFIRM BIRTHDATE    ${group_value}
                    
    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][SaleAgent] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
            Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Label_Saleagent}    ${saleagent_index_locator}    ${convert_index}  

                Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1  
                    
    END   


VERIFY FIELD - TS3013_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Label_Campaign}    ${campaign_1_input_locator}    ${group_value}[0][Campaign]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Campaign]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3013_002
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Campaign] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
        Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Label_Campaign}    ${capmaign_1_index_locator}    ${convert_index}   

        Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1 
                    
    END   


VERIFY FIELD - TS3014_001
    [Arguments]    ${group_value}    ${group_data_value_for_verify}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}

    SET INPUT CONFIRM BIRTHDATE    ${group_value}

    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_1_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}                                                    

    Key_in_step_1_page.INPUT DROPDOW FOR VERIFY    ${Locator_Select_Specialcase}    ${Specialcase_input_locator}    ${group_value}[0][Special Case]

    Key_in_step_1_page.VERIFY MESSAGE    ${group_data_value_for_verify}[0][Special Case]

    Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1


VERIFY FIELD - TS3014_002
    [Arguments]    ${group_value}

    SET INPUT UMAY+ CARD AND COMFIRM UMAY+ CARD    ${group_value}

    Key_in_step_1_page.INPUT ID    ${group_value}

    Key_in_step_1_page.INPUT CONFIRM ID    ${group_value}     

    Key_in_step_1_page.SELECT DROPDOWN TITLE    ${group_value}

    Key_in_step_1_page.INPUT NAME    ${group_value}

    Key_in_step_1_page.INPUT SURNAME    ${group_value}

    SET INPUT BIRTHDATE    ${group_value}
        
    SET INPUT CONFIRM BIRTHDATE    ${group_value}
                    
    SET INPUT EXPIRE DATE    ${group_value}

    Key_in_step_1_page.INPUT MOBILE NO    ${group_value}  

    ${tc_amount}    BuiltIn.Evaluate    ${group_value}[0][Special Case] + 1

    FOR  ${index}    IN RANGE    1    ${tc_amount}    1

        ${convert_index}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${index}
        Key_in_step_1_page.SELECT DROPDOWN BY INDEX    ${Locator_Select_Specialcase}    ${special_Case_index_locator}    ${convert_index}  

        Capture_screen.CAPTURE SCREEN VALIDATE FIELD KEY IN SYEP 1  
                    
    END


VERIFY TITLE AND BUTTON SELECT BRANCH
    [Arguments]    ${index}    ${data_excel}    ${data_value_page}

    IF  '${index}'=='User'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          User                       ${tbl_header_label_name_yaml}[subject_data_index][index_user]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Tab'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Tab                        ${tbl_header_label_name_yaml}[subject_data_index][index_logout]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Branch'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Branch                     ${tbl_header_label_name_yaml}[subject_data_index][index_branch]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='User main '
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          User main                  ${tbl_header_label_name_yaml}[subject_data_index][index_usermain]        ${data_excel}       ${data_value_page}  

    ELSE IF  '${index}'=='Title Page'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Title Page                 ${tbl_header_label_name_yaml}[subject_data_index][index_page_name]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Title Dropdown'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Title Dropdown             ${tbl_header_label_name_yaml}[subject_data_index][index_Select_name]        ${data_excel}       ${data_value_page}  
    
    END

VERIFY TITLE KEY IN STEP 1 UMAY CARD
    [Arguments]    ${index}    ${data_excel}    ${data_value_page}

    IF  '${index}'=='Umay+'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Umay+                   ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_umay]        ${data_excel}       ${data_value_page}  

    ELSE IF  '${index}'=='Re Key Umay+'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Re Key Umay+            ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_rekeyumay]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='ID No'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          ID No                   ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_idno]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Title_Thai'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Title_Thai              ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_title]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Name_Thai'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Name_Thai               ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_name]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Surname_Thai'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Surname_Thai            ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_surname]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Birth Date'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL         Birth Date               ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_birthday]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Expire Date'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL         Expire Date              ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_expiredate]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Mobile No'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL         Mobile No                ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_mobileno]        ${data_excel}       ${data_value_page}  
     
    ELSE IF  '${index}'=='Dopa Result'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL         Dopa Result              ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_doparesult]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Apply Type'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL         Apply Type               ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_applytype]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Apply Via'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL         Apply Via                ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_applyvia]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Apply Channel'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL         Apply Channel            ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_applychaanel]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Special Case'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL         Special Case             ${tbl_header_label_name_key1umaycard_yaml}[subject_data_index][index_specialcase]        ${data_excel}       ${data_value_page}  
    
    END

VERIFY TITLE KEY IN STEP 1 VIRUAL CARD
    [Arguments]    ${index}    ${data_excel}    ${data_value_page}

    IF  '${index}'=='Card Type'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Card Type                   ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_0]        ${data_excel}       ${data_value_page}  

    ELSE IF  '${index}'=='ID No'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          ID No            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_1]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Title Thai'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Title Thai                   ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_2]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Name Thai'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Name Thai              ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_3]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='SurnameThai'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          SurnameThai            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_4]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Birth Date'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Birth Date               ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_5]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Expire Date'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Expire Date              ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_6]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Mobile No'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Mobile No                ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_7]        ${data_excel}       ${data_value_page}  
     
    ELSE IF  '${index}'=='Dopa Result'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Dopa Result              ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_8]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Apply Type'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Apply Type               ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_9]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Apply Via'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Apply Via                ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_10]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Apply Channel'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Apply Channel            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_11]        ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Sub Apply Channel'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Sub Apply Channel            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_12]        ${data_excel}       ${data_value_page}  
     
    ELSE IF  '${index}'=='Activity Code'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Activity Code            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_13]        ${data_excel}       ${data_value_page}  
     
    ELSE IF  '${index}'=='Special Case'
        Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Special Case             ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_14]        ${data_excel}       ${data_value_page}  
    
    END


# PENDING --------------------------------------------------------------------------------
SET FOR LOOP - E2E KEYINSTEP 1 PENDING CASE
    [Arguments]    ${tc_title}    ${card_type}    ${action_pending}=normal

    # Login SSO
    Login_page.SET LOGIN SSO TO RL    Key1
                

    IF  '${card_type}'=='virual_umay_card'
    
        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Hearder    ${data_keyinstep1_virual_umay_card}
        
        ${group_value_virual_umay_card}    JSONLibrary.Get value from json    ${data_keyinstep1_virual_umay_card}    $[?(@.TC=='${tc_title}')]

        # Action ในการ กรอกข้อมูลที่หน้า Keyinstep 1 แบบ Virual Card
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0001'    SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER    ${group_value_virual_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0002'    SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER    ${group_value_virual_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0003'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value_virual_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0004'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value_virual_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0005'    SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER    ${group_value_virual_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0006'    SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER    ${group_value_virual_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0007'    SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER    ${group_value_virual_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0008'    SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER    ${group_value_virual_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0009'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0010'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0011'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0012'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}

    ELSE IF  '${card_type}'=='virual_premier_card'

        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Hearder    ${data_keyinstep1_virual_premier_card}
    
        ${group_value_virual_premier_card}    JSONLibrary.Get value from json    ${data_keyinstep1_virual_premier_card}    $[?(@.TC=='${tc_title}')]

        # Action ในการ กรอกข้อมูลที่หน้า Keyinstep 1 แบบ Virual Card
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0001'    SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER    ${group_value_virual_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0002'    SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER    ${group_value_virual_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0003'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value_virual_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0004'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value_virual_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0005'    SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER    ${group_value_virual_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0006'    SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER    ${group_value_virual_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0007'    SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER    ${group_value_virual_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0008'    SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER    ${group_value_virual_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0009'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_premier_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0010'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_premier_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0011'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0012'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}

    ELSE IF  '${card_type}'=='umay_card'

        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Hearder    ${data_keyinstep1_umay_card}
    
        ${group_value_sheet_umay_card}    JSONLibrary.Get value from json    ${data_keyinstep1_umay_card}    $[?(@.TC=='${tc_title}')]
        
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0001'    SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER    ${group_value_sheet_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0002'    SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER    ${group_value_sheet_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0003'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value_sheet_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0004'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value_sheet_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0005'    SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER    ${group_value_sheet_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0006'    SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER    ${group_value_sheet_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0007'    SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER    ${group_value_sheet_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0008'    SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER    ${group_value_sheet_umay_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0009'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_sheet_umay_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0010'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_sheet_umay_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0011'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0012'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}
    
    ELSE IF  '${card_type}'=='premier_card'

        # เลือก Branch และ คลิก Menu Keyinstep 1
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Hearder    ${data_keyinstep1_premier_card}
    
        ${group_value_sheet_premier_card}    JSONLibrary.Get value from json    ${data_keyinstep1_premier_card}    $[?(@.TC=='${tc_title}')]
        
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0001'    SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER    ${group_value_sheet_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0002'    SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER    ${group_value_sheet_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0003'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value_sheet_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0004'    SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER    ${group_value_sheet_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0005'    SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER    ${group_value_sheet_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0006'    SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER    ${group_value_sheet_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0007'    SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER    ${group_value_sheet_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0008'    SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER    ${group_value_sheet_premier_card}    ${card_type}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0009'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]        ${group_value_sheet_premier_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0010'    SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]        ${group_value_sheet_premier_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0011'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}
        BuiltIn.Run Keyword If    '${tc_title}'=='TS0012'    SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]    ${group_value_virual_umay_card}    ${card_type}    ${action_pending}
    
    END


SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE
    [Arguments]    ${card_no}    ${card_type}   

    BuiltIn.Run Keyword If    '${card_type}'=='virual_umay_card'    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
    BuiltIn.Run Keyword If    '${card_type}'=='virual_umay_card'    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${data_keyinstep1_virual_umay_card}    
    BuiltIn.Run Keyword If    '${card_type}'=='virual_premier_card'    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
    BuiltIn.Run Keyword If    '${card_type}'=='virual_premier_card'    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${data_keyinstep1_virual_premier_card}
    BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    SET INPUT UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    SET INPUT CONFIRM UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    SET INPUT UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    SET INPUT CONFIRM UMAY+ CARD    ${card_no}    


PENDING STEP 1
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
    SET SELECT DROPDOWN APPLY TYPE TO SPECIAL CASE    ${TC_group_value}    # check sale agen

    
PENDING STEP 1 CONFIRM BUTTON
    [Arguments]    ${TC_group_value}    ${card_type}
    
    # เวลาตั้งต้น เริ่มที่รอ 1 นาที
    ${timeout_status}    BuiltIn.Set Variable    60s

    # กด check
    ${Status_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CHECK DATA    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
    BuiltIn.Log    >Status Button Check Data->${Status_check_data}    WARN
     
    # ถ้ากดไม่ผ่าน
    IF  '${Status_check_data}' == 'False'    # need false condition
        # ให้กดซ้ำ
        Key_in_step_1_page.BUTTON CHECK DATA

    # ถ้ากดผ่าน  
    ELSE
        # set time task
        ${timeout_status}    BuiltIn.Set Variable    60s
        BuiltIn.Set global Variable   ${timeout_status}
        
    END

    # คำนวนเวลาใหม่  / 2 เหลือ 30
    ${timeout_status}    Common_keyword.CALCULATE NEW TIME OUT    ${timeout_status}    2    
    BuiltIn.Log    >NEW TIME OUT->${timeout_status}    WARN

    # popup newcustomer
    ${popup_new_customer}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_new_customer}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error     
    BuiltIn.Log    >Popup New Customer->${popup_new_customer}    WARN  
     
    # popup newcustomer ค่อยทำ
    IF  '${popup_new_customer}' == 'False'

        # popup have contanct pending
        ${popup_pending}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_pending_application}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error    
        BuiltIn.Set global Variable   ${popup_pending}
        BuiltIn.Log    >Modal Pending Popup->${popup_pending}    WARN  
         
        # ถ้า popup new customer ไม่ขึ้น แล้ว contract have pending ขึ้นมาแทน
        IF  '${popup_pending}' == 'True' 
            BuiltIn.Log    !! ERROR PENDING RE INPUT AGIAN!!    WARN

            # stamp PENDING ลงที่ excel 
            Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
            Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING
        
            Key_in_step_1_page.CLICK BUTTON CLEAR
            Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_yaml]     # ให้เลือกมาใหม่
            SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    ${TC_no}    Pending
             
        END
    END

    # อ่านค่าเลขการ์ดมา
    IF  '${card_type}'=='virual_umay_card' or '${card_type}'=='virual_premier_card'
        ${data_virtuadcard_No}    Key_in_step_1_page.GET VIRTUAD CARD NUMBER     
        BuiltIn.Log    CASE->Virual/umay/premier>${data_virtuadcard_No}    WARN  
    END
    

    # modal ชื่อ eng
    ${Status_name_eng}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_confirm_name_eng}   10s   
    BuiltIn.Log    >Modal Name ENG->${Status_name_eng}    WARN  
     
    
    # ถ้าเจอ modal name eng ให้กรอก ${Status_name_eng} = true
    IF  '${Status_name_eng}' == 'True'    # need true condition
        BuiltIn.Log    !!DO IT NAME ENG!!    WARN
        Key_in_step_1_page.IF ELSE NAME ENG

    ELSE
        # set time task
        ${timeout_status}    BuiltIn.Set Variable    50s
        BuiltIn.Set global Variable   ${timeout_status} 
        
    END

    # กด confirm check data ภายใน 50 วิ
    ${Status_confirm_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
    BuiltIn.Set global Variable   ${Status_confirm_data} 
    BuiltIn.Log    >Status Button Confirm Data->${Status_confirm_data}    WARN  
    

    # ถ้า popup new customer มา และ ปุ่ม comfirm check data จะตรวจสอบเคสนี้
    IF  '${popup_new_customer}' == 'True' and '${Status_confirm_data}' == 'True' and '${popup_pending}' != 'True'    # need true condition and true
        BuiltIn.Log    !!STAMP PENDING TO EXCEL!!    WARN

        # stamp PENDING ลงที่ excel 
        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
        Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING

        # set time task
        ${timeout_status}    BuiltIn.Set Variable    50s
        BuiltIn.Set global Variable   ${timeout_status} 
    
    END    

    # ถ้า error popup new customer ไม่มา และ ปุ่ม comfirm check data ไม่ขึ้นให้ รอ 2 นาที แล้วจะตรวจสอบเคสนี้
    IF  '${popup_new_customer}' == 'False' and '${Status_confirm_data}' == 'False' and '${popup_pending}' == 'False'    # need false condition and false
        BuiltIn.Log    !!ERROR API AND RE CLICK AGAIN!!    WARN

        # กดเช็คอีกครั้ง
        Key_in_step_1_page.BUTTON CHECK DATA

        # stamp PENDING ลงที่ excel 
        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
        Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING
        
    END


    ${Status_comfirm}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Step1}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
    BuiltIn.Log    >Status Button Confirm Data->${Status_comfirm}    WARN  
     
    IF  '${Status_comfirm}' == 'False'
        BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
        
        # กด popup save error
        # Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${popup_btn_save_locator}    150s

        # stamp ลงที่ excel 
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Key 1 longtime to wait 
        Common_keyword.INTRANET TEARDOWN
        BuiltIn.fail    Not Success : Key 1 longtime to wait
    
    ELSE

        BuiltIn.Log    !!BUTTON YES CONFIRM CHECK DATA!!    WARN
        # กดปุ่ม yes confirm check data
        ${Status_confirm_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA    25s     
        BuiltIn.Log    >Status confirm check data->${Status_confirm_check_data}    WARN
         
    END


SET TS0001 E2E REGISTER KEY IN STEP 1 NORMAL CASE NEW CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    none    Pending
    Key_in_step_1_page.SELECT DROPDOWN PREMIUM    ${TC_group_value}      
    SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN    ${TC_group_value}    ${card_type}    none    ${ID_no}    Pending       


SET TS0002 E2E REGISTER KEY IN STEP 1 NORMAL CASE OLD CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    PENDING STEP 1    ${TC_group_value}    ${card_type}
    Key_in_step_1_page.SELECT DROPDOWN PREMIUM    ${TC_group_value}    
    SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN    ${TC_group_value}    ${card_type}    none    none    Pending       


SET TS0003_4 E2E REGISTER KEY IN STEP 1 PENDING CASE ALL CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    PENDING STEP 1    ${TC_group_value}    ${card_type}
    PENDING STEP 1 CONFIRM BUTTON    ${TC_group_value}    ${card_type}         

                                                                  
SET TS0005 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    none    Pending
    PENDING STEP 1 CONFIRM BUTTON    ${TC_group_value}    ${card_type}
    
    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    No    150s 
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN  
    
    IF  '${Status_NBC}' == 'False'
        BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${popup_btn_save_locator}    150s
    END

    ${Status_NOTE}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    BuiltIn.Log    >Status Button Save Note->${Status_NOTE}    WARN  
    
    IF  '${Status_NOTE}' == 'False'
        BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${popup_btn_save_locator}    150s
    END

    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING 
    Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    USE


SET TS0006 E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE OLD CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    PENDING STEP 1    ${TC_group_value}    ${card_type}
    PENDING STEP 1 CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    Key_in_step_1_page.BUTTON NCB    No    150s    
    Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING 


SET TS0007 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE NEW CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}

    SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    none    Pending
    PENDING STEP 1 CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    Yes    150s 
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN  
    
    IF  '${Status_NBC}' == 'False'
        BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${popup_btn_save_locator}    150s
    END

    Key_in_step_1_page.BUTTON SENDDOC    Yes
    Key_in_step_1_page.BUTTON CONFIRM SENDDOC    No
    Key_in_step_1_page.CLICK CHECKBOX OPTION SMS PENDING
    Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING

    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING
    BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    PENDING
    BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    PENDING

                                                                            
SET TS0008 E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CONSENT CASE OLD CUSTOMER
    [Arguments]    ${TC_group_value}    ${card_type}
    
    PENDING STEP 1    ${TC_group_value}    ${card_type}
    PENDING STEP 1 CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    Key_in_step_1_page.BUTTON NCB    Yes    150s
    Key_in_step_1_page.BUTTON SENDDOC    Yes
    Key_in_step_1_page.BUTTON CONFIRM SENDDOC    No
    Key_in_step_1_page.CLICK CHECKBOX OPTION SMS PENDING
    Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING 

# 10
SET E2E REGISTER KEY IN STEP 1 PENDING HAVE CONSENT CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]
    [Arguments]    ${TC_group_value}    ${card_type}    ${action_pending}

    SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    none    Pending
    PENDING STEP 1 CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    No    150s 
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN  
    
    IF  '${Status_NBC}' == 'False'
        BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${popup_btn_save_locator}    150s
    END
    
    ${Status_NOTE}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    BuiltIn.Log    >Status Button Save Note->${Status_NOTE}    WARN  
    
    IF  '${Status_NOTE}' == 'False'
        BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${popup_btn_save_locator}    150s
    END

    ${Status_}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING 
    BuiltIn.Log    >Status ->${Status_}    WARN  
    BuiltIn.Log    !!${card_type},${action_pending}!!    WARN

    IF  '${Status_}' == 'True'

        BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    PENDING
        BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    PENDING   

        IF  '${card_type}'=='umay_card'
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Pending_process_feature.REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    REJECT
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Pending_process_feature.CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    CANCEL
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        ELSE IF  '${card_type}'=='premier_card'
        
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Pending_process_feature.REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    REJECT
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Pending_process_feature.CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    CANCEL
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL
        
        ELSE IF  '${card_type}'=='virual_umay_card'

            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Pending_process_feature.REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Pending_process_feature.CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        ELSE IF  '${card_type}'=='virual_premier_card'

            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Pending_process_feature.REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Pending_process_feature.CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
            BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

        END

    END


SET E2E REGISTER KEY IN STEP 1 PENDING SEND DOC CASE NEW CUSTOMER [PENDING PROCESS] [REJECT AND CANCEL]
    [Arguments]    ${TC_group_value}    ${card_type}    ${action_pending}

    SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${TC_group_value}    ${card_type}    none    Pending
    PENDING STEP 1 CONFIRM BUTTON    ${TC_group_value}    ${card_type}

    ${Status_NBC}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    Yes    150s 
    BuiltIn.Log    >Status Button Confirm Data->${Status_NBC}    WARN  
    
    IF  '${Status_NBC}' == 'False'
        BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${popup_btn_save_locator}    150s
    END
    
    Key_in_step_1_page.BUTTON SENDDOC    Yes
    Key_in_step_1_page.BUTTON CONFIRM SENDDOC    No
    Key_in_step_1_page.CLICK CHECKBOX OPTION SMS PENDING
    Key_in_step_1_page.CLICK SAVE NOTE BUTTON
    Key_in_step_1_page.CLICK BUTTON OK TO CONFIRM PENDING

    BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    PENDING
    BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    PENDING   

    IF  '${card_type}'=='umay_card'
        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Pending_process_feature.REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    REJECT
        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Pending_process_feature.CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    CANCEL
        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

    ELSE IF  '${card_type}'=='premier_card'
       
        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Pending_process_feature.REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    REJECT
        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Pending_process_feature.CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    CANCEL
        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

    ELSE IF  '${card_type}'=='virual_umay_card'

        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Pending_process_feature.REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Pending_process_feature.CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

    ELSE IF  '${card_type}'=='virual_premier_card'

        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Pending_process_feature.REJECT PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
        BuiltIn.Run Keyword If    '${action_pending}'=='reject'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    REJECT

        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Pending_process_feature.CANCEL PENDING PROCESS BY ID CARD NUMBER    ${ID_no}
        BuiltIn.Run Keyword If    '${action_pending}'=='cancel'    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}   2    CANCEL

    END

# PENDING --------------------------------------------------------------------------------

# KEY 1 ----------------------------------------------------------------------------------
SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE DATA MATRIX
    [Arguments]    ${card_no}    ${card_type}    ${TC}

    BuiltIn.Run Keyword If    '${card_type}'=='virual_umay_card'    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
    BuiltIn.Run Keyword If    '${card_type}'=='virual_umay_card'    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${data_matrix_test_case}    ${TC} 
    BuiltIn.Run Keyword If    '${card_type}'=='virual_premier_card'    Key_in_step_1_page.CHOOSE CHECKBOX UAMY+ VIRTUAL CARD
    BuiltIn.Run Keyword If    '${card_type}'=='virual_premier_card'    Key_in_step_1_page.CHOOSE CHECKBOX CARD TYPE    ${data_matrix_test_case}    ${TC}    
    BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    SET INPUT UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}'=='umay_card'    SET INPUT CONFIRM UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    SET INPUT UMAY+ CARD    ${card_no}    
    BuiltIn.Run Keyword If    '${card_type}'=='premier_card'    SET INPUT CONFIRM UMAY+ CARD    ${card_no}    


SET FEATURE - E2E KEYINSTEP 1 MATRIX CASE
    [Arguments]    ${tc_title}    ${card_type}    ${option}=Normal

    # Login SSO
    Login_page.SET LOGIN SSO TO RL    Key1
        
    # เลือก Branch และ คลิก Menu Keyinstep 1
    Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Branch    ${data_matrix_test_case}
    
    ${group_value_data_matrix_test_case}    JSONLibrary.Get Value From Json    ${data_matrix_test_case}    $[?(@.TC=='${tc_title}')]
    BuiltIn.Set global Variable    ${group_value_data_matrix_test_case}
    ${TC_no}    BuiltIn.Set Variable    ${tc_title} 
    BuiltIn.Set global Variable    ${TC_no}


    # Action ในการ กรอกข้อมูลที่หน้า Keyinstep 1
    IF  '${option}' == 'Normal'      # รันแบบเคสปกติ
        SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${group_value_data_matrix_test_case}    ${card_type}    ${TC_no}    Normal
    ELSE IF  '${option}' == 'GNO'    # รันแบบเคศ GNO
        SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${group_value_data_matrix_test_case}    ${card_type}    ${TC_no}    Normal    GNO
    END


SET E2E REGISTER KEY IN STEP 1 MATRIX CASE
    [Arguments]    ${TC_group_value}    ${card_type}    ${TC_no}    ${case}=Normal    ${option}=Normal

    # check card type
    BuiltIn.Log    >CARD TYPE->${card_type}    WARN  

    IF  '${card_type}' == 'umay_card' 
        Common_feature.GET CARD UMAY+ FROM EXCEL DATA STOCK
        BuiltIn.Log    !!Get New Card Again->${card_umay+}    WARN

    ELSE IF  '${card_type}' == 'premier_card' 
        Common_feature.GET CARD UMAY+ PREMIRE FROM EXCEL DATA STOCK
        BuiltIn.Log    !!Get New Card Again->${card_umay+_premire}    WARN
    END
    
    IF  '${case}' == 'Normal'
        ${Status_check_id_card}    BuiltIn.Run Keyword And Return Status    SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE DATA MATRIX    ${card_umay_data_stock}    ${card_type}    ${TC_no}
        BuiltIn.Set Variable   ${Status_check_id_card} 
        BuiltIn.Log    >Status Check Card->${Status_check_id_card}    WARN
    
    ELSE IF  '${case}' == 'Pending'
        ${Status_check_id_card}    BuiltIn.Run Keyword And Return Status    SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE    ${card_umay_data_stock}    ${card_type}
        BuiltIn.Set Variable   ${Status_check_id_card} 
        BuiltIn.Log    >Status Check Card->${Status_check_id_card}    WARN
    END

    ${alert_card_use}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${alert_this_card_is_use}    
    BuiltIn.Set Variable   ${alert_card_use}   
    BuiltIn.Log    >Popup Card this use->${alert_card_use}    WARN  

    # ถ้ารอกได้แต่ไม่ผ่าน  error ขึ้นมาให้วนกรอกใหม่
    WHILE  '${Status_check_id_card}' == 'True' and '${alert_card_use}' == 'True'    # need true condition and true

        # stamp PENDING ลงที่ excel 
        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING

        # ให้เลือกมาใหม่
        IF  '${option}' == 'Normal'
            Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_yaml]
        ELSE IF  '${option}' == 'GNO'
            Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_gno_yaml]
        END

        IF  '${card_type}' == 'umay_card' 
            Common_feature.GET CARD UMAY+ FROM EXCEL DATA STOCK
            BuiltIn.Log    !!Get New Card Again->${card_umay+}    WARN

        ELSE IF  '${card_type}' == 'premier_card' 
            Common_feature.GET CARD UMAY+ PREMIRE FROM EXCEL DATA STOCK
            BuiltIn.Log    !!Get New Card Again->${card_umay+_premire}    WARN
        END

        IF  '${case}' == 'Normal'
            ${Status_check_id_card}    BuiltIn.Run Keyword And Return Status    SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE DATA MATRIX    ${card_umay_data_stock}    ${card_type}    ${TC_no}
            BuiltIn.Set Variable   ${Status_check_id_card}
            BuiltIn.Log    >Status Check Card->${Status_check_id_card}    WARN

        ELSE IF  '${case}' == 'Pending'
            ${Status_check_id_card}    BuiltIn.Run Keyword And Return Status    SET CHOOSE CHECKBOX AND INPUT CARD BY CARD TYPE    ${card_umay_data_stock}    ${card_type}
            BuiltIn.Set Variable   ${Status_check_id_card}
            BuiltIn.Log    >Status Check Card->${Status_check_id_card}    WARN
        END

        # รอ popup อีกรอบเพื่อ reset loop while
        ${alert_card_use}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${alert_this_card_is_use}
        BuiltIn.Set global Variable   ${alert_card_use}   
        BuiltIn.Log    >Popup Card this use->${alert_card_use}    WARN

        IF  '${alert_card_use}' == 'False'
            BREAK
        END  

    END
    
    #  ถ้า data ทั้งหมดไม่ว่างให้ทำต่อ
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
    # Key_in_step_1_page.SELECT DROPDOWN CAMPAIGN 3    ${TC_group_value}

    # สำหรับ case ปกติตาม matrix
    IF  '${case}' == 'Normal'
        BuiltIn.Log    >Normal    WARN
        Key_in_step_1_page.SELECT DROPDOWN PREMIUM    ${TC_group_value}   

        IF  '${option}' == 'Normal'    
            ${run_option}    BuiltIn.Set Variable   ${option}
            BuiltIn.Set global Variable   ${run_option}
            SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN    ${TC_group_value}    ${card_type}    ${TC_no}    ${ID_no}    Normal
        ELSE IF  '${option}' == 'GNO'
            ${run_option}    BuiltIn.Set Variable   ${option}
            BuiltIn.Set global Variable   ${run_option}
            SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN GNO    ${TC_group_value}    ${card_type}    ${TC_no}    ${ID_no}
        END

        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP1_${card_type}
        Capture_screen.CAPTURE SCREEN CURRENT PAGE
    END

    # สำหรับ case pending
    IF  '${case}' == 'Pending'
        BuiltIn.Log    >Pending    WARN
        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    PENDING_${card_type}
        Capture_screen.CAPTURE SCREEN CURRENT PAGE
    END


# KEY 1
SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN
    [Arguments]    ${TC_group_value}    ${card_type}    ${TC_no}=none    ${ID_no}=none    ${case}=Normal

    # เวลาตั้งต้น เริ่มที่รอ 1 นาที
    ${timeout_status}    BuiltIn.Set Variable    60s

    # กด check
    ${Status_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CHECK DATA    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
    BuiltIn.Log    >Status Button Check Data->${Status_check_data}    WARN
     

    # ถ้ากดไม่ผ่าน 
    IF  '${Status_check_data}' == 'False'    # need false condition

        # ให้กดซ้ำ
        Key_in_step_1_page.BUTTON CHECK DATA
        
    # ถ้ากดผ่าน
    ELSE
        # set time task
        ${timeout_status}    BuiltIn.Set Variable    60s
        BuiltIn.Set global Variable   ${timeout_status}
    END

    # คำนวนเวลาใหม่  60 / 2 เหลือ 30
    ${timeout_status}    Common_keyword.CALCULATE NEW TIME OUT    ${timeout_status}    2    
    BuiltIn.Log    >NEW TIME OUT->${timeout_status}    WARN

    # popup newcustomer
    ${popup_new_customer}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_new_customer}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error     
    BuiltIn.Log    >Popup New Customer->${popup_new_customer}    WARN  
     
    # อ่านค่าเลขการ์ดมา
    IF  '${popup_new_customer}' == 'True' and ('${card_type}' == 'virual_umay_card' or '${card_type}' == 'virual_premier_card')
        ${data_virtuadcard_No}    Key_in_step_1_page.GET VIRTUAD CARD NUMBER     
        BuiltIn.Log    CASE->Virual/umay/premier>${data_virtuadcard_No}    WARN  
    END

    # กำหนด pending
    ${popup_pending}    BuiltIn.Set Variable   False

    # ถ้าไม่เจอ popup newcustomer ค่อยทำ
    IF  '${popup_new_customer}' == 'False' and '${popup_pending}' == 'False'

        # popup have contanct pending
        ${popup_pending}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_pending_application}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error    
        BuiltIn.Log    >Modal Pending Popup->${popup_pending}    WARN  
         
        # ถ้า popup new customer ไม่ขึ้น แล้ว contract have pending ขึ้นมาแทน
        IF  '${popup_pending}' == 'True' 
            BuiltIn.Log    !! ERROR PENDING RE INPUT AGIAN!!    WARN
            BuiltIn.Set global Variable   ${popup_pending}

            # stamp PENDING ลงที่ excel 
            Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
            Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING
        
            Key_in_step_1_page.CLICK BUTTON CLEAR
            Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_yaml]     # ให้เลือกมาใหม่

            SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${group_value_data_matrix_test_case}    ${card_type}    ${TC_no}    Normal

            ${popup_pending}    BuiltIn.Set Variable   False
            BuiltIn.Set global Variable   ${popup_pending} 
       
        ELSE
            BuiltIn.Log    !! RESET ERROR PENDING RE INPUT AGIAN!!    WARN
            ${popup_pending}    BuiltIn.Set Variable   False
            BuiltIn.Set global Variable   ${popup_pending}  
        END
    END

    # # อ่านค่าเลขการ์ดมา
    # IF  '${card_type}'=='virual_umay_card' or '${card_type}'=='virual_premier_card'
    #     ${data_virtuadcard_No}    Key_in_step_1_page.GET VIRTUAD CARD NUMBER     
    #     BuiltIn.Log    CASE->Virual/umay/premier>${data_virtuadcard_No}    WARN  
    # END
    

    # modal ชื่อ eng
    ${Status_name_eng}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_confirm_name_eng}   10s 
    BuiltIn.Log    >Modal Name ENG->${Status_name_eng}    WARN  
     
    
    # ถ้าเจอ modal name eng ให้กรอก 
    IF  '${Status_name_eng}' == 'True'    
        BuiltIn.Log    !!DO IT NAME ENG!!    WARN
        Key_in_step_1_page.IF ELSE NAME ENG

    ELSE
        # set time task
        ${timeout_status}    BuiltIn.Set Variable    50s
        BuiltIn.Set global Variable   ${timeout_status} 
        
    END

    # กด confirm check data
    ${Status_confirm_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
    BuiltIn.Set global Variable   ${Status_confirm_data} 
    BuiltIn.Log    >Status Button Confirm Data->${Status_confirm_data}    WARN  
    

    # ถ้า popup new customer มา และ ปุ่ม comfirm check data ขึ้น และ pending ไม่แสดง
    IF  '${popup_new_customer}' == 'True' and '${Status_confirm_data}' == 'True' and '${popup_pending}' == 'False'    # need true condition and true and False
        BuiltIn.Log    !!STAMP PENDING TO EXCEL!!    WARN

        # stamp PENDING ลงที่ excel 
        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
        Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING

        # set time task
        ${timeout_status}    BuiltIn.Set Variable    50s
        BuiltIn.Set global Variable   ${timeout_status} 
    
    END    

    # ถ้า error popup new customer ไม่มา และ ปุ่ม comfirm check data ขึ้น และ pending ไม่แสดง
    IF  '${popup_new_customer}' == 'False' and '${Status_confirm_data}' == 'False' and '${popup_pending}' == 'False'    # need false condition and false
        BuiltIn.Log    !!ERROR API AND RE CLICK AGAIN!!    WARN

        # กดเช็คอีกครั้ง
        Key_in_step_1_page.BUTTON CHECK DATA

        # stamp PENDING ลงที่ excel 
        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
        Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING

        # set time task
        ${timeout_status}    BuiltIn.Set Variable    50s
        BuiltIn.Set global Variable   ${timeout_status} 
        
    END

    # ให้กด yes popup confirm
    ${Status_comfirm_data}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Step1}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
    BuiltIn.Log    >Status Button Confirm Data->${Status_comfirm_data}    WARN  
     

    # ถ้ากดไม่ผ่าน
    IF  '${Status_comfirm_data}' == 'False'
        BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
        BuiltIn.Set global Variable   ${Status_comfirm_data}

        # กด popup save error
        # Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${popup_btn_save_locator}    150s

        # stamp ลงที่ excel 
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Key 1 longtime to wait 
        Common_keyword.INTRANET TEARDOWN
        BuiltIn.fail    Not Success : Key 1 longtime to wait
    
    # ถ้ากดผ่าน 
    ELSE IF  '${Status_comfirm_data}' == 'True'

        BuiltIn.Log    !!BUTTON YES CONFIRM CHECK DATA!!    WARN
        BuiltIn.Set global Variable   ${Status_comfirm_data}

        # กดปุ่ม yes confirm check data
        ${Status_confirm_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA    25s   
        BuiltIn.Log    >Status confirm check data->${Status_confirm_check_data}    WARN
         
        # popup ncb
        BuiltIn.Log    !!CLICK YES POP UP HAVE CONSENT YES/NO!!    WARN
        ${Status_ncb}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    Yes    150s  
        BuiltIn.Log    >Status modal have consend->${Status_ncb}    WARN  
         
        
        # ถ้ากดได้ confirm check data และ กด yes ได้
        IF  '${Status_confirm_check_data}' == 'True' and '${Status_ncb}' == 'True'    # need true condition and true
            BuiltIn.Log    !!PASS CLICK AND NEXT!!    WARN

            # set time task
            ${timeout_status}    BuiltIn.Set Variable    15s
            BuiltIn.Set global Variable   ${timeout_status} 
            
        # ถ้ากดไม่ได้ confirm check data และ กด yes ไม่ได้ ให้รอ ปุ่ม save
        ELSE
            BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN

            # กด popup save error
            # Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${popup_btn_save_locator}    150s

            # stamp ลงที่ excel 
            Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Key 1 longtime to wait 
            Common_keyword.INTRANET TEARDOWN
            BuiltIn.fail    Not Success : Key 1 longtime to wait
            
        END
    END

    # stamp check if error Digit of CSN Invalid
    ${Status_modal_NCB}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_modal_NCB}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
    BuiltIn.Log    >Status_modal_NCB->${Status_modal_NCB}    WARN  
    
    # popup csn error
    ${Status_CSN}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_csn_error}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error 
    BuiltIn.Log    >Status_CSN->${Status_CSN}    WARN  
    
    
    # ถ้า popup error CSN ให้ write excel แล้วออกเลย
    IF  '${Status_modal_NCB}' == 'True' and '${Status_CSN}' == 'True'    # need true condition and true
        BuiltIn.Log    !!Digit of CSN Invalid!!    WARN
        Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    CHECK
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Key 1 CSN 
        Common_keyword.INTRANET TEARDOWN
        BuiltIn.fail    !!Digit of CSN Invalid!!

    # ถ้าไม่ error ให้ตั้งเวลา ทำ task ถัดไป
    ELSE
        # set time task
        ${timeout_status}    BuiltIn.Set Variable    120s
        BuiltIn.Set global Variable   ${timeout_status} 
    END
    

    # modal creadit หายไป
    ${Status_CreditModel}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_modal_Creadit}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error 
    BuiltIn.Log    >Status_CreditModel->${Status_CreditModel}    WARN  
    

    # ถ้าไม่หายไปใน 1 นาที = False
    # ถ้าหายไปใน 1 นาที = True
    IF  '${Status_CreditModel}' == 'True'    # need true condition

        BuiltIn.Log    !!----------->Next Step<-----------!!    WARN
        Key_in_step_1_page.BUTTON SENDDOC
        Key_in_step_1_page.BUTTON CONFIRM SENDDOC

        # ดึง barcode
        ${barcode}    Common_feature.GET BARCODE FROM EXCEL DATA STOCK
        # ดึง application no
        ${app_no}    Key_in_step_1_page.GET APPLICATION NUMBER
        # ดึง date
        ${application_date}    Key_in_step_1_page.GET APPLICATION DATE    

        # stamp app_no at excel       
        Common_feature.WRITE APPLICATION NUMBER TO DATA STOCK    ${app_no}
        
        # คำนวนเวลาใหม่ 120  / 8 เหลือ 15
        ${timeout_status}    Common_keyword.CALCULATE NEW TIME OUT    ${timeout_status}    12   
        BuiltIn.Log    >NEW TIME OUT->${timeout_status}    WARN

        # กรอก barcode
        ${Status_key_barcode}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.INPUT BARCODE    ${barcode}
        BuiltIn.Log    Status_key_barcode->${Status_key_barcode}    WARN
        
        # กด confirm ได้
        ${Status_confirm_barcode}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM BARCODE
        BuiltIn.Log    Status_confirm_barcode->${Status_confirm_barcode}    WARN  

        # popup error
        ${popup_barcode}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_barcode_error}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error      
        BuiltIn.Log    Popup_barcode->${popup_barcode}    WARN
        
        # กรอก barcode ได้ และ กด confirm ได้ และ  popup error ไม่ขึ้น
        IF  '${Status_key_barcode}' == 'True' and '${Status_confirm_barcode}' == 'True' and '${popup_barcode}' == 'False'    # need false condition and true and false

            # รอ popup boten ขึ้นมา
            ${Status_send_boten}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Sendboten}    30s    #เวลาจะขึ้นอยู่กับ pass หรือ error
            BuiltIn.Set global Variable    ${Status_send_boten}
            BuiltIn.Log    Status_send_boten->${Status_send_boten}    WARN
            
            # ถ้าผ่านให้แล้วออก while
            IF  '${Status_send_boten}' == 'True'    # need true condition
                
                BuiltIn.Log    !!Boten popup show!!    WARN
                Key_in_step_1_page.BUTTON SEND BOTEN
                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP_1_${card_type}_BOTEN_COMPLETE    
                Capture_screen.CAPTURE SCREEN CURRENT PAGE
                Key_in_step_1_page.WAIT COMPLETE
                BuiltIn.Sleep    3s
                Common_keyword.INTRANET TEARDOWN
            END
        END

        # กรอก barcode ได้ และ กด confirm ได้ และ  popup error ขึ้น
        IF  '${Status_key_barcode}' == 'True' and '${Status_confirm_barcode}' == 'True' and '${popup_barcode}' == 'True'    # need true condition and true and true

            # ถ้า popup barcode ซ้ำขึ้น 
            WHILE  '${popup_barcode}' == 'True'    # need true condition

                # stamp อันเก่าก่อนที่ row นั้น
                Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    USE    
                Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_barcode    ${rows_barcode_data_stock}    2    USE

                # ให้เลือกมาใหม่
                Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_yaml]
                ${barcode}    Common_feature.GET BARCODE FROM EXCEL DATA STOCK
                BuiltIn.Log    !!Exist Barcode Get New Barcode Again->${barcode}    WARN
                
                # กรอกอีกครั้ง
                Key_in_step_1_page.INPUT BARCODE    ${barcode}
                Key_in_step_1_page.BUTTON CONFIRM BARCODE
                
                
                # รอ popup boten ขึ้นมา
                ${Status_send_boten}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Sendboten}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
                BuiltIn.Set global Variable    ${Status_send_boten}
                BuiltIn.Log    Status_send_boten->${Status_send_boten}    WARN
                
                # ถ้าผ่านให้แล้วออก while
                IF  '${Status_send_boten}' == 'True'    # need true condition
                    BuiltIn.Log    !!Boten popup show in case exits barcode!!    WARN
                    ${popup_barcode}    BuiltIn.Set Variable    False
                    BuiltIn.Set global Variable    ${popup_barcode}

                    Key_in_step_1_page.BUTTON SEND BOTEN
                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP_1_${card_type}_BOTEN_COMPLETE    
                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    Key_in_step_1_page.WAIT COMPLETE
                    BuiltIn.Sleep    3s
                    Common_keyword.INTRANET TEARDOWN
                    
                    # stamp USE ที่ row นั้น
                    Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    USE    
                    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_barcode    ${rows_barcode_data_stock}    2    USE
                    BREAK

                # ถ้าไม่ผ่านให้เช็คต่อ
                ELSE IF  '${Status_send_boten}' == 'False'
                    # รออ่าน popup ซ้ำอีกที
                    ${popup_barcode}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_barcode_error}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error  
                    BuiltIn.Set global Variable    ${popup_barcode}
                    BuiltIn.Log    Popup_barcode->${popup_barcode}    WARN
                    
                END

            END

        END    

        
        # ถ้าไม่ใช่ case pending ค่อยทำ
        IF  '${case}' != 'Pending'
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
                
            # ----------- Set data to next step -------------------------
            # set global to anywhere 
            BuiltIn.Set global Variable    ${TC_no}
            BuiltIn.Set global Variable    ${date_app}
            BuiltIn.Set global Variable    ${ID_no}
            BuiltIn.Set global Variable    ${branch}
            BuiltIn.Set global Variable    ${app_no}

            IF  '${card_type}'=='virual_umay_card' or '${card_type}'=='virual_premier_card'
                ${card}    BuiltIn.Set Variable    ${data_virtuadcard_No}
                BuiltIn.Set global Variable    ${card}   
            ELSE IF  '${card_type}'=='umay_card' 
                ${card}    BuiltIn.Set Variable    ${card_umay+}
                BuiltIn.Set global Variable    ${card}  
            ELSE IF  '${card_type}'== 'premier_card'
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
            
        END  # end pending  

    # กรอกแล้ว รอว่า popup error ขึ้นมั้ย
    ELSE
        BuiltIn.Log    !!Longtime to waiting!!!    WARN
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Key 1 
        Common_keyword.INTRANET TEARDOWN
        BuiltIn.fail    Not Success : Key 1
    END  

# KEY 1 ----------------------------------------------------------------------------------

# KEY 1 GNO ------------------------------------------------------------------------------
SET CLICK BUTTON CHECK DATA TO SEND TO BOTEN GNO
    [Arguments]    ${TC_group_value}    ${card_type}    ${TC_no}=none    ${ID_no}=none

    # เวลาตั้งต้น เริ่มที่รอ 1 นาที
    ${timeout_status}    BuiltIn.Set Variable    60s

    # กด check
    ${Status_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CHECK DATA    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
    BuiltIn.Log    >Status Button Check Data->${Status_check_data}    WARN
     
    # ถ้ากดไม่ผ่าน 
    IF  '${Status_check_data}' == 'False'   
        Key_in_step_1_page.BUTTON CHECK DATA         # ให้กดซ้ำ
    END

    # คำนวนเวลาใหม่  60 / 2 เหลือ 30
    ${timeout_status}    Common_keyword.CALCULATE NEW TIME OUT    ${timeout_status}    2    
    BuiltIn.Log    >NEW TIME OUT->${timeout_status}    WARN

    # popup newcustomer
    ${popup_new_customer}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_new_customer}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error     
    BuiltIn.Log    >Popup New Customer->${popup_new_customer}    WARN  
     
    # popup have contanct pending
    ${popup_pending}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_pending_application}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error    
    BuiltIn.Log    >Modal Pending Popup->${popup_pending}    WARN  

    # ถ้าไม่เจอ popup newcustomer ค่อยทำ และเจอ pending
    IF  '${popup_new_customer}' == 'False' and '${popup_pending}' == 'True'
         
        # ถ้า popup new customer ไม่ขึ้น แล้ว contract have pending ขึ้นมาแทน
        IF  '${popup_pending}' == 'True' 
            BuiltIn.Log    !! ERROR PENDING INPUT AGIAN!!    WARN

            # stamp PENDING ลงที่ excel 
            Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
            Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING
        
            Key_in_step_1_page.CLICK BUTTON CLEAR
            Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_gno_yaml]     # ให้เลือกมาใหม่
            SET E2E REGISTER KEY IN STEP 1 MATRIX CASE    ${group_value_data_matrix_test_case}    ${card_type}    ${TC_no}    Normal    GNO   
            
            # reset กันทำซ้ำ
            ${popup_pending}    BuiltIn.Set Variable   False
            BuiltIn.Set global Variable   ${popup_pending}   
        END
    END

    # อ่านค่าเลขการ์ดมา
    IF  '${popup_new_customer}' == 'True' and '${popup_pending}' == 'False' and ('${card_type}' == 'virual_umay_card' or '${card_type}' == 'virual_premier_card')

        BuiltIn.Run Keyword And Ignore Error    Key_in_step_1_page.GET VIRTUAD CARD NUMBER     
        BuiltIn.Log    >Virual/umay/premier_>${data_virtuadcard_No}    WARN

        # modal ชื่อ eng
        ${Status_name_eng}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_confirm_name_eng}   10s 
        BuiltIn.Log    >Modal Name ENG->${Status_name_eng}    WARN  
        
        # ถ้าเจอ modal name eng ให้กรอก 
        IF  '${Status_name_eng}' == 'True'    
            BuiltIn.Log    !!DO IT NAME ENG!!    WARN
            Key_in_step_1_page.IF ELSE NAME ENG
        END

        # set time task
        ${timeout_status}    BuiltIn.Set Variable    50s
        BuiltIn.Set global Variable   ${timeout_status} 

        # กด confirm check data
        ${Status_confirm_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM CHECK DATA    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
        BuiltIn.Log    >Status Button Confirm Data->${Status_confirm_data}    WARN  
    
        # ถ้า popup new customer มา และ ปุ่ม comfirm check data ขึ้น และ pending ไม่แสดง
        IF  '${Status_confirm_data}' == 'True'    
            BuiltIn.Log    !!STAMP PENDING TO EXCEL!!    WARN

            # stamp PENDING ลงที่ excel 
            Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    PENDING
            Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    2    PENDING

            # set time task
            ${timeout_status}    BuiltIn.Set Variable    50s
            BuiltIn.Set global Variable   ${timeout_status} 
            
        END

        # ให้กด yes popup confirm
        ${Status_comfirm_data}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Step1}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
        BuiltIn.Log    >Status Button Confirm Data->${Status_comfirm_data}    WARN  

        # ถ้ากดไม่ผ่าน
        IF  '${Status_comfirm_data}' == 'False'
            BuiltIn.Log    !!ERROR API AND SAVE POPUP!!    WARN
            BuiltIn.Set global Variable   ${Status_comfirm_data}
            Common_keyword.INTRANET TEARDOWN
            BuiltIn.fail    Not Success : Key 1 longtime to wait
        
        # ถ้ากดผ่าน 
        ELSE IF  '${Status_comfirm_data}' == 'True'

            BuiltIn.Log    !!BUTTON YES CONFIRM CHECK DATA!!    WARN
            BuiltIn.Set global Variable   ${Status_comfirm_data}

            # กดปุ่ม yes confirm check data
            ${Status_confirm_check_data}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON YES CONFIRM CHECK DATA    25s   
            BuiltIn.Log    >Status confirm check data->${Status_confirm_check_data}    WARN
            
            # popup ncb
            BuiltIn.Log    !!CLICK YES POP UP HAVE CONSENT YES/NO!!    WARN
            ${Status_ncb}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON NCB    Yes    150s  
            BuiltIn.Log    >Status modal have consend->${Status_ncb}    WARN  
            
            
            # ถ้ากดได้ confirm check data และ กด yes ได้
            IF  '${Status_confirm_check_data}' == 'True' and '${Status_ncb}' == 'True'    # need true condition and true
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
        ${Status_modal_NCB}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_modal_NCB}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
        BuiltIn.Log    >Status_modal_NCB->${Status_modal_NCB}    WARN  
        
        # popup csn error
        ${Status_CSN}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_csn_error}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error 
        BuiltIn.Log    >Status_CSN->${Status_CSN}    WARN  
        
        
        # ถ้า popup error CSN ให้ write excel แล้วออกเลย
        IF  '${Status_modal_NCB}' == 'True' and '${Status_CSN}' == 'True'    # need true condition and true
            BuiltIn.Log    !!Digit of CSN Invalid!!    WARN
            Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    CHECK
            Common_keyword.INTRANET TEARDOWN
            BuiltIn.fail    !!Digit of CSN Invalid!!

        # ถ้าไม่ error ให้ตั้งเวลา ทำ task ถัดไป
        ELSE
            # set time task
            ${timeout_status}    BuiltIn.Set Variable    120s
            BuiltIn.Set global Variable   ${timeout_status} 
        END
        

        # modal creadit หายไป
        ${Status_CreditModel}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_modal_Creadit}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error 
        BuiltIn.Log    >Status_CreditModel->${Status_CreditModel}    WARN  
        

    ELSE IF  ('${popup_new_customer}' == 'True' and '${popup_pending}' == 'False') and ('${card_type}' == 'umay_card' or '${card_type}' == 'premier_card')
        BuiltIn.Log    !!ESLE API AND SAVE POPUP!!    WARN

    END

    # ถ้าหายไปใน 1 นาที = True
    IF  '${Status_CreditModel}' == 'True'    # need true condition

        BuiltIn.Log    !!----------->Next Step<-----------!!    WARN
        Key_in_step_1_page.BUTTON SENDDOC
        Key_in_step_1_page.BUTTON CONFIRM SENDDOC

        # ดึง barcode # ดึง application no  # ดึง date
        ${barcode}    Common_feature.GET BARCODE FROM EXCEL DATA STOCK
        ${app_no}    Key_in_step_1_page.GET APPLICATION NUMBER
        ${application_date}    Key_in_step_1_page.GET APPLICATION DATE    

        # stamp app_no at excel       
        Common_feature.WRITE APPLICATION NUMBER TO DATA STOCK    ${app_no}
        
        # คำนวนเวลาใหม่ 120  / 8 เหลือ 15
        ${timeout_status}    Common_keyword.CALCULATE NEW TIME OUT    ${timeout_status}    12   
        BuiltIn.Log    >NEW TIME OUT->${timeout_status}    WARN

        # กรอก barcode
        ${Status_key_barcode}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.INPUT BARCODE    ${barcode}
        BuiltIn.Log    Status_key_barcode->${Status_key_barcode}    WARN
        
        # กด confirm ได้
        ${Status_confirm_barcode}    BuiltIn.Run Keyword And Return Status    Key_in_step_1_page.BUTTON CONFIRM BARCODE
        BuiltIn.Log    Status_confirm_barcode->${Status_confirm_barcode}    WARN  

        # popup error
        ${popup_barcode}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_barcode_error}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error      
        BuiltIn.Log    Popup_barcode->${popup_barcode}    WARN
        
        # กรอก barcode ได้ และ กด confirm ได้ และ  popup error ไม่ขึ้น
        IF  '${Status_key_barcode}' == 'True' and '${Status_confirm_barcode}' == 'True' and '${popup_barcode}' == 'False'    # need false condition and true and false

            # รอ popup boten ขึ้นมา
            ${Status_send_boten}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Sendboten}    30s    #เวลาจะขึ้นอยู่กับ pass หรือ error
            BuiltIn.Set global Variable    ${Status_send_boten}
            BuiltIn.Log    Status_send_boten->${Status_send_boten}    WARN
            
            # ถ้าผ่านให้แล้วออก while
            IF  '${Status_send_boten}' == 'True'    # need true condition
                
                BuiltIn.Log    !!Boten popup show!!    WARN
                Key_in_step_1_page.BUTTON SEND BOTEN
                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP_1_${card_type}_BOTEN_COMPLETE    
                Capture_screen.CAPTURE SCREEN CURRENT PAGE
                Key_in_step_1_page.WAIT COMPLETE
                BuiltIn.Sleep    3s
                Common_keyword.INTRANET TEARDOWN
            END
        END

        # กรอก barcode ได้ และ กด confirm ได้ และ  popup error ขึ้น
        IF  '${Status_key_barcode}' == 'True' and '${Status_confirm_barcode}' == 'True' and '${popup_barcode}' == 'True'    # need true condition and true and true

            # ถ้า popup barcode ซ้ำขึ้น 
            WHILE  '${popup_barcode}' == 'True'    # need true condition

                # stamp อันเก่าก่อนที่ row นั้น
                Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    USE    
                Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_barcode    ${rows_barcode_data_stock}    2    USE

                # ให้เลือกมาใหม่
                Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel}[RL_data_stock_gno_yaml]
                ${barcode}    Common_feature.GET BARCODE FROM EXCEL DATA STOCK
                BuiltIn.Log    !!Exist Barcode Get New Barcode Again->${barcode}    WARN
                
                # กรอกอีกครั้ง
                Key_in_step_1_page.INPUT BARCODE    ${barcode}
                Key_in_step_1_page.BUTTON CONFIRM BARCODE
                
                
                # รอ popup boten ขึ้นมา
                ${Status_send_boten}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Sendboten}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error
                BuiltIn.Set global Variable    ${Status_send_boten}
                BuiltIn.Log    Status_send_boten->${Status_send_boten}    WARN
                
                # ถ้าผ่านให้แล้วออก while
                IF  '${Status_send_boten}' == 'True'    # need true condition
                    BuiltIn.Log    !!Boten popup show in case exits barcode!!    WARN
                    ${popup_barcode}    BuiltIn.Set Variable    False
                    BuiltIn.Set global Variable    ${popup_barcode}

                    Key_in_step_1_page.BUTTON SEND BOTEN
                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP_1_${card_type}_BOTEN_COMPLETE    
                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    Key_in_step_1_page.WAIT COMPLETE
                    BuiltIn.Sleep    3s
                    Common_keyword.INTRANET TEARDOWN
                    
                    # stamp USE ที่ row นั้น
                    Common_feature.WRITE STATUS DATA STOCK ID NO AND CARD    ${card_type}    USE    
                    Common_feature.WRITE STATUS DATA STOCK TO EXCEL    Data_barcode    ${rows_barcode_data_stock}    2    USE
                    BREAK

                # ถ้าไม่ผ่านให้เช็คต่อ
                ELSE IF  '${Status_send_boten}' == 'False'
                    # รออ่าน popup ซ้ำอีกที
                    ${popup_barcode}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_barcode_error}    ${timeout_status}    #เวลาจะขึ้นอยู่กับ pass หรือ error  
                    BuiltIn.Set global Variable    ${popup_barcode}
                    BuiltIn.Log    Popup_barcode->${popup_barcode}    WARN
                    
                END

            END

        END    

        # strip value to use
        ${date_app}    BuiltIn.Set Variable    ${application_date}
        ${date_app}    String.Strip String    ${date_app}

        # set global to anywhere 
        BuiltIn.Set global Variable    ${TC_no}
        BuiltIn.Set global Variable    ${date_app}
        BuiltIn.Set global Variable    ${ID_no}
        BuiltIn.Set global Variable    ${branch}
        BuiltIn.Set global Variable    ${app_no}

        IF  '${card_type}'=='virual_umay_card' or '${card_type}'=='virual_premier_card'
            ${card}    BuiltIn.Set Variable    ${data_virtuadcard_No}
            BuiltIn.Set global Variable    ${card}   
        ELSE IF  '${card_type}'=='umay_card' 
            ${card}    BuiltIn.Set Variable    ${card_umay+}
            BuiltIn.Set global Variable    ${card}  
        ELSE IF  '${card_type}'== 'premier_card'
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

    END  

# KEY 1 GNO ----------------------------------------------------------------------------------