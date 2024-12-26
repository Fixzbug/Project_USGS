*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore


*** Variables ***
${state_next_step}    Not Success : Key 2
${rank}

*** Keywords ***

SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE
    [Arguments]    ${group_value}

    Key_in_step_2_page.OFFICE - SELECT DROPDOWN TITLE COMPANY    ${group_value}
    Key_in_step_2_page.OFFICE - INPUT NAME COMPANY    ${group_value}
    Key_in_step_2_page.OFFICE - CLICK BUTTON CHECK OFFICE
    Key_in_step_2_page.OFFICE - CLICK BUTTON CONFIRM CHECK OFFICE


SET CLICK BUTTON VERIFY JUDMENT TO POPUP WORK PROCESS
    
    Key_in_step_2_page.CLICK BUTTON VERIFY JUDMENT
    Key_in_step_2_page.CLICK BUTTON CALCULATE
    Key_in_step_2_page.CLICK BUTTON CONFIRM JUDMENT
    Key_in_step_2_page.CLICK BUTTON YES CONFIRM JUDMENT


SET SELECT DROPDOWN BIRTHDAY
    [Arguments]    ${group_value}

    Key_in_step_2_page.INPUT BIRTHDATE DAY    ${group_value}
    Key_in_step_2_page.INPUT BIRTHDATE MONTH    ${group_value}
    Key_in_step_2_page.INPUT BIRTHDATE YEAR    ${group_value}


CONFIRM KEY IN STEP 2 - HAS POPUP SEND SMS

    Key_in_step_2_page.CLICK BUTTON SEND SMS
    Key_in_step_2_page.CLICK BUTTON GO TO MAIN
    Key_in_step_2_page.WAIT POPUP WORK PROCESS


CONFIRM KEY IN STEP 2 - NOT POPUP SEND SMS

    Key_in_step_2_page.CLICK BUTTON GO TO MAIN
    Key_in_step_2_page.WAIT POPUP WORK PROCESS

# KEY 2
SET KEY IN STEP 2 - JUDMENT
    [Arguments]    ${group_value}

    Key_in_step_2_page.WAIT SRCEEN KEY IN STEP 2 LOADING COMPLETE
    Key_in_step_2_page.SELECT DROPDOWN APPLY TYPE    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN APPLY VIA    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}    
    Key_in_step_2_page.SELECT DROPDOWN ACTIVITY    ${group_value}  
    Key_in_step_2_page.SELECT DROPDOWN SUB APPLY CHANNEL    ${group_value}  
    Key_in_step_2_page.SELECT DROPDOWN BIRTHDATE    ${group_value}
    IF    'TC000_RANK' in ${TEST TAGS} and '${rank}' == 'Rank0_round2'
        Key_in_step_2_page.INPUT BIRTHDATE DAY MONTH YEAR    ${group_value}
    END
    Key_in_step_2_page.SELECT DROPDOWN MARITAL    ${group_value}
    Key_in_step_2_page.INPUT CHILDREN    ${group_value}    
    Key_in_step_2_page.INPUT SEX    ${group_value}        
    Key_in_step_2_page.INPUT HOME LIFE    ${group_value}
    Key_in_step_2_page.INPUT HOME LIFE MONTH    ${group_value}
    Key_in_step_2_page.INPUT HOME PERSON    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN HOME TYPE    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN BUS TYPE    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN SUB BUS TYPE    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN OCC TYPE    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN SUB OCC TYPE    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN POSITION TYPE    ${group_value}
    Key_in_step_2_page.INPUT PERSON    ${group_value}
    Key_in_step_2_page.INPUT WORK YEAR    ${group_value}
    Key_in_step_2_page.INPUT WORK MONTH    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN EMPOYEE TYPE    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN SALARY TYPE    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CUSTOMER TYPE    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN SALARY DOCUMENT    ${group_value}
    Key_in_step_2_page.INPUT SALARY    ${group_value}
    Key_in_step_2_page.INPUT HOME TELEPHONE    ${group_value}
    Key_in_step_2_page.INPUT HOME MOBILE TELEPHONE    ${group_value}
    Key_in_step_2_page.INPUT HOME ZIPCODE HOME    ${group_value}
    Key_in_step_2_page.CLICK BUTTON SEARCH HOME
    Key_in_step_2_page.SELECT DROPDOWN HOME ADDRESS    ${group_value}
    Key_in_step_2_page.INPUT HOME ZIPCODE OFFICE    ${group_value}
    Key_in_step_2_page.CLICK BUTTON SEARCH OFFICE
    Key_in_step_2_page.SELECT DROPDOWN HOME OFFICE    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN AGENT CODE    ${group_value}
    Key_in_step_2_page.INPUT INTRODUCER CODE    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN VENDOR CODE    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 1    ${group_value}
    Key_in_step_2_page.SELECT DROPDOWN DELIVERY    ${group_value}
    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 2    ${group_value}
    Key_in_step_2_page.INPUT ZIPCODE CARD    ${group_value}
    Key_in_step_2_page.CLICK BUTTON SEARCH ZIPCODE CARD
    Key_in_step_2_page.SELECT DROPDOWN CARD ADDRESS    ${group_value}
    Key_in_step_2_page.CLICK LABEL
    Key_in_step_2_page.INPUT TT LOAN    ${group_value}
    Key_in_step_2_page.INPUT RCOFF TEL    ${group_value}
    Key_in_step_2_page.CLICK BUTTON VERIFY JUDMENT
    Key_in_step_2_page.CLICK BUTTON CALCULATE    600s
    Key_in_step_2_page.CLICK BUTTON CONFIRM JUDMENT    600s
    Key_in_step_2_page.CLICK BUTTON YES CONFIRM JUDMENT
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP2_JUDGMENT_PAGE
    Capture_screen.CAPTURE SCREEN CURRENT PAGE

                                                                                                                                                                            
SET KEY IN STEP 2 - JUDMENT MANUAL
    [Arguments]    ${group_value}
    
    Key_in_step_2_page.WAIT SRCEEN KEY IN STEP 2 LOADING COMPLETE

    Key_in_step_2_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}    

    Key_in_step_2_page.SELECT DROPDOWN BIRTHDATE    ${group_value}

    # SET SELECT DROPDOWN BIRTHDAY    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN MARITAL    ${group_value}

    Key_in_step_2_page.INPUT CHILDREN    ${group_value}        

    Key_in_step_2_page.INPUT HOME LIFE    ${group_value}

    Key_in_step_2_page.INPUT HOME PERSON    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN HOME TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN BUS TYPE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN SUB BUS TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN OCC TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SUB OCC TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN POSITION TYPE    ${group_value}

    Key_in_step_2_page.INPUT PERSON    ${group_value}

    Key_in_step_2_page.INPUT WORK YEAR    ${group_value}

    Key_in_step_2_page.INPUT WORK MONTH    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN EMPOYEE TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SALARY TYPE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CUSTOMER TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SALARY DOCUMENT    ${group_value}

    Key_in_step_2_page.INPUT SALARY    ${group_value}

    Key_in_step_2_page.INPUT HOME TELEPHONE    ${group_value}

    Key_in_step_2_page.INPUT HOME ZIPCODE HOME    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH HOME

    Key_in_step_2_page.SELECT DROPDOWN HOME ADDRESS    ${group_value}

    Key_in_step_2_page.INPUT HOME ZIPCODE OFFICE    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH OFFICE

    Key_in_step_2_page.SELECT DROPDOWN HOME OFFICE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN AGENT CODE    ${group_value}

    Key_in_step_2_page.INPUT INTRODUCER CODE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN VENDOR CODE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN DELIVERY    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 1    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 2    ${group_value}

    Key_in_step_2_page.INPUT ZIPCODE CARD    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH ZIPCODE CARD

    Key_in_step_2_page.SELECT DROPDOWN CARD ADDRESS    ${group_value}

    Key_in_step_2_page.CLICK LABEL

    Key_in_step_2_page.INPUT TT LOAN    ${group_value}

    Key_in_step_2_page.INPUT RCOFF TEL    ${group_value}

    Key_in_step_2_page.CLICK BUTTON VERIFY JUDMENT

    Key_in_step_2_page.CLICK BUTTON CALCULATE

    Key_in_step_2_page.CLICK BUTTON CONFIRM JUDMENT  

    Key_in_step_2_page.CLICK BUTTON YES CONFIRM JUDMENT

    Key_in_step_2_page.CLICK CANCEL BUTTON

    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP2_JUDGMENT_MANUAL_PAGE

    Capture_screen.CAPTURE SCREEN CURRENT PAGE

    # Key_in_step_2_page.CONFIRM KEY IN STEP 2 - CHECK CONDITION POPUP

    Common_keyword.INTRANET TEARDOWN


SET KEY IN STEP 2 - JUDMENT VERIFY POPUP CONDITION
    [Arguments]    ${group_value}    ${group_value_condition}
    
    Key_in_step_2_page.WAIT SRCEEN KEY IN STEP 2 LOADING COMPLETE

    Key_in_step_2_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}    

    Key_in_step_2_page.SELECT DROPDOWN BIRTHDATE    ${group_value}

    # SET SELECT DROPDOWN BIRTHDAY    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN MARITAL    ${group_value}

    Key_in_step_2_page.INPUT CHILDREN    ${group_value}        

    Key_in_step_2_page.INPUT HOME LIFE    ${group_value}

    Key_in_step_2_page.INPUT HOME PERSON    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN HOME TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN BUS TYPE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN SUB BUS TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN OCC TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SUB OCC TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN POSITION TYPE    ${group_value}

    Key_in_step_2_page.INPUT PERSON    ${group_value}

    Key_in_step_2_page.INPUT WORK YEAR    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN EMPOYEE TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SALARY TYPE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CUSTOMER TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SALARY DOCUMENT    ${group_value}

    Key_in_step_2_page.INPUT SALARY    ${group_value}

    Key_in_step_2_page.INPUT HOME TELEPHONE    ${group_value}

    Key_in_step_2_page.INPUT HOME ZIPCODE HOME    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH HOME

    Key_in_step_2_page.SELECT DROPDOWN HOME ADDRESS    ${group_value}

    Key_in_step_2_page.INPUT HOME ZIPCODE OFFICE    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH OFFICE

    Key_in_step_2_page.SELECT DROPDOWN HOME OFFICE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN AGENT CODE    ${group_value}

    Key_in_step_2_page.INPUT INTRODUCER CODE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error     Key_in_step_2_page.SELECT DROPDOWN VENDOR CODE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN DELIVERY    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 1    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 2    ${group_value}

    Key_in_step_2_page.INPUT ZIPCODE CARD    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH ZIPCODE CARD

    Key_in_step_2_page.SELECT DROPDOWN CARD ADDRESS    ${group_value}

    Key_in_step_2_page.CLICK LABEL

    Key_in_step_2_page.INPUT TT LOAN    ${group_value}

    Key_in_step_2_page.INPUT RCOFF TEL    ${group_value}

    Key_in_step_2_page.CLICK BUTTON VERIFY JUDMENT

    Key_in_step_2_page.VERIFY POPUP CONDITION    ${group_value_condition}

    Key_in_step_2_page.CLICK BUTTON CALCULATE

    Key_in_step_2_page.CLICK BUTTON CONFIRM JUDMENT  

    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERITY_CONDITION_KEY_NI_STEP_2

    Capture_screen.CAPTURE SCREEN CURRENT PAGE

    Key_in_step_2_page.CLICK BUTTON YES CONFIRM JUDMENT

    # Key_in_step_2_page.CONFIRM KEY IN STEP 2 - CHECK CONDITION POPUP

    Common_keyword.INTRANET TEARDOWN



RECHECK KEY IN STEP 2 - JUDMENT VERIFY POPUP CONDITION TCL = 0
    [Arguments]    ${group_value}
    
    Key_in_step_2_page.WAIT SRCEEN KEY IN STEP 2 LOADING COMPLETE

    Key_in_step_2_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}    

    Key_in_step_2_page.SELECT DROPDOWN BIRTHDATE    ${group_value}

    Key_in_step_2_page.INPUT BIRTHDATE DAY    ${group_value}

    Key_in_step_2_page.INPUT BIRTHDATE MONTH    ${group_value}

    Key_in_step_2_page.INPUT BIRTHDATE YEAR    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN MARITAL    ${group_value}

    Key_in_step_2_page.INPUT CHILDREN    ${group_value}        

    Key_in_step_2_page.INPUT HOME LIFE    ${group_value}

    Key_in_step_2_page.INPUT HOME PERSON    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN HOME TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN BUS TYPE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN SUB BUS TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN OCC TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SUB OCC TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN POSITION TYPE    ${group_value}

    Key_in_step_2_page.INPUT PERSON    ${group_value}

    Key_in_step_2_page.INPUT WORK YEAR    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN EMPOYEE TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SALARY TYPE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CUSTOMER TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SALARY DOCUMENT    ${group_value}

    Key_in_step_2_page.INPUT SALARY    ${group_value}

    Key_in_step_2_page.INPUT HOME TELEPHONE    ${group_value}

    Key_in_step_2_page.INPUT HOME ZIPCODE HOME    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH HOME

    Key_in_step_2_page.SELECT DROPDOWN HOME ADDRESS    ${group_value}

    Key_in_step_2_page.INPUT HOME ZIPCODE OFFICE    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH OFFICE

    Key_in_step_2_page.SELECT DROPDOWN HOME OFFICE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN AGENT CODE    ${group_value}

    Key_in_step_2_page.INPUT INTRODUCER CODE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error     Key_in_step_2_page.SELECT DROPDOWN VENDOR CODE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN DELIVERY    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 1    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 2    ${group_value}

    Key_in_step_2_page.INPUT ZIPCODE CARD    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH ZIPCODE CARD

    Key_in_step_2_page.SELECT DROPDOWN CARD ADDRESS    ${group_value}

    Key_in_step_2_page.CLICK LABEL

    Key_in_step_2_page.INPUT TT LOAN    ${group_value}

    Key_in_step_2_page.INPUT RCOFF TEL    ${group_value}

    Key_in_step_2_page.CLICK BUTTON VERIFY JUDMENT

    Key_in_step_2_page.CLICK BUTTON CALCULATE

    Key_in_step_2_page.CLICK BUTTON CONFIRM JUDMENT  

    Key_in_step_2_page.CLICK BUTTON YES CONFIRM JUDMENT

    Key_in_step_2_page.CLICK BUTTON SEND SMS

    Common_keyword.INTRANET TEARDOWN

                                                                                    
SET KEY IN STEP 2 - JUDMENT VERIFY POPUP CONDITION TCL = 0
    [Arguments]    ${group_value}    ${group_value_condition}
    
    Key_in_step_2_page.WAIT SRCEEN KEY IN STEP 2 LOADING COMPLETE

    Key_in_step_2_page.SELECT DROPDOWN APPLY TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN APPLY VIA    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN APPLY CHANNEL    ${group_value}    

    Key_in_step_2_page.SELECT DROPDOWN BIRTHDATE    ${group_value}

    # SET SELECT DROPDOWN BIRTHDAY    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN MARITAL    ${group_value}

    Key_in_step_2_page.INPUT CHILDREN    ${group_value}        

    Key_in_step_2_page.INPUT HOME LIFE    ${group_value}

    Key_in_step_2_page.INPUT HOME PERSON    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN HOME TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN BUS TYPE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN SUB BUS TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN OCC TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SUB OCC TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN POSITION TYPE    ${group_value}

    Key_in_step_2_page.INPUT PERSON    ${group_value}

    Key_in_step_2_page.INPUT WORK YEAR    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN EMPOYEE TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SALARY TYPE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CUSTOMER TYPE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN SALARY DOCUMENT    ${group_value}

    Key_in_step_2_page.INPUT SALARY    ${group_value}

    Key_in_step_2_page.INPUT HOME TELEPHONE    ${group_value}

    Key_in_step_2_page.INPUT HOME ZIPCODE HOME    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH HOME

    Key_in_step_2_page.SELECT DROPDOWN HOME ADDRESS    ${group_value}

    Key_in_step_2_page.INPUT HOME ZIPCODE OFFICE    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH OFFICE

    Key_in_step_2_page.SELECT DROPDOWN HOME OFFICE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN AGENT CODE    ${group_value}

    Key_in_step_2_page.INPUT INTRODUCER CODE    ${group_value}

    BuiltIn.Run Keyword And Ignore Error     Key_in_step_2_page.SELECT DROPDOWN VENDOR CODE    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN DELIVERY    ${group_value}

    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 1    ${group_value}

    BuiltIn.Run Keyword And Ignore Error    Key_in_step_2_page.SELECT DROPDOWN CAMPIANG CODE 2    ${group_value}

    Key_in_step_2_page.INPUT ZIPCODE CARD    ${group_value}

    Key_in_step_2_page.CLICK BUTTON SEARCH ZIPCODE CARD

    Key_in_step_2_page.SELECT DROPDOWN CARD ADDRESS    ${group_value}

    Key_in_step_2_page.CLICK LABEL

    Key_in_step_2_page.INPUT TT LOAN    ${group_value}

    Key_in_step_2_page.INPUT RCOFF TEL    ${group_value}

    Key_in_step_2_page.CLICK BUTTON VERIFY JUDMENT

    Key_in_step_2_page.CLICK BUTTON CALCULATE

    Key_in_step_2_page.CLICK BUTTON CONFIRM JUDMENT  

    Key_in_step_2_page.CLICK BUTTON YES CONFIRM JUDMENT


    Key_in_step_2_page.VERIFY POPUP CONDITION    ${group_value_condition}

    # Key_in_step_2_page.CONFIRM KEY IN STEP 2 - CHECK CONDITION POPUP

    Common_keyword.INTRANET TEARDOWN
                                                                                   
VERIFY KEY2 TITLE CHECK OFFICE     # สำหรับส่งไป Verify ค่า
    [Arguments]    ${index}    ${data_excel}    ${data_value_page}

    IF  '${index}'=='Application_No'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Application_No                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_0]            ${data_excel}       ${data_value_page}  

    ELSE IF  '${index}'=='Application_Date'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Application_Date                        ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_1]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Result_Bureau'
       COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL           Result_Bureau                           ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_2]            ${data_excel}       ${data_value_page}  

    ELSE IF  '${index}'=='ID_No'
       COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL           ID_No                                   ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_3]            ${data_excel}       ${data_value_page}  
 
    ELSE IF  '${index}'=='Name'
       COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL           Name                                    ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_4]            ${data_excel}       ${data_value_page}  

    ELSE IF  '${index}'=='Category'
       COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL           Category                                ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_5]            ${data_excel}       ${data_value_page}  

    ELSE IF  '${index}'=='Card_Type'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Card_Type                               ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_6]            ${data_excel}       ${data_value_page}  
    
    END

VERIFY KEY2 TITLE MAIN TITLE
    [Arguments]    ${index}    ${data_excel}    ${data_value_page}

    IF  '${index}'=='OFFICE'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          OFFICE	                                ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_0]            ${data_excel}       ${data_value_page}  
      
    ELSE IF  '${index}'=='JUDGMENT_ITEM'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          JUDGMENT_ITEM                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_1]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='ID_CARD_ADDRESS'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          ID_CARD_ADDRESS                        ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_2]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='RELATIONSHIP'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          RELATIONSHIP                           ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_3]            ${data_excel}       ${data_value_page}  
    
    END

VERIFY KEY2 TITLE
    [Arguments]    ${index}    ${data_excel}    ${data_value_page}

    IF  '${index}'=='Application_No'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Application_No	                           ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_0]            ${data_excel}       ${data_value_page}  
      
    ELSE IF  '${index}'=='Application_Date'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Application_Date                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_1]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Result_Bureau'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Result_Bureau                             ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_2]            ${data_excel}       ${data_value_page}  

    ELSE IF  '${index}'=='ID_No'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          ID_No                                     ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_3]            ${data_excel}       ${data_value_page}  
       
    ELSE IF  '${index}'=='Name'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Name                                      ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_4]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Category'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Category                                  ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_5]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Card_Type'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Card_Type                                 ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_6]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Apply_Via'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Apply_Via                                 ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_8]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Apply_Chanel'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Apply_Chanel                              ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_9]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Sub_Apply_Channel'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Sub_Apply_Channel                         ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_10]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Age'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Age                                       ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_11]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Brithday'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Brithday                                  ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_12]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Status'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Status                                    ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_13]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Children'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Children                                  ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_14]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Sex'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Sex                                       ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_15]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Period_of_residence'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Period_of_residence                       ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_16]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Number_of_people'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Number_of_people                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_17]            ${data_excel}       ${data_value_page}  

    ELSE IF  '${index}'=='Housing'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Housing                                   ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_18]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Business_type'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Business_type                             ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_19]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Sub_business_type'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Sub_business_type                         ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_20]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Occupation'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Occupation                                ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_21]             ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Sub_Occupation'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Sub_Occupation                            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_22]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Position'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Position                                  ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_23]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Number_of_employees'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Number_of_employees                       ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_24]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Year_of_work'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Year_of_work                              ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_25]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Employment_type'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Employment_type                           ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_26]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Receiving_salary'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Receiving_salary                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_27]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Customer_type'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Customer_type                             ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_28]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Documents_for_calculation'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Documents_for_calculation                 ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_29]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Salary'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Salary                                    ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_30]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Auto_Salary_Adjust'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Auto_Salary_Adjust                        ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_31]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Home_number'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Home_number                               ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_32]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Phone_number'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Phone_number                              ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_33]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Post_Code_Home'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Post_Code_Home                            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_34]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Post_Code_Office'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Post_Code_Office                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_35]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Salary_date'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Salary_date                               ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_36]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Sale_Agent_Code'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Sale_Agent_Code                           ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_37]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Sale_Agent_Code_Mobile'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Sale_Agent_Code_Mobile                    ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_38]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Account_Information'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Account_Information                       ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_39]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Search_Bank_code'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Search_Bank_code                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_40]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Bank_code'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Bank_code                                 ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_41]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Account_No.'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Account_No.                               ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_42]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Bank_code' 
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Bank_code                                 ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_43]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Account_No.'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Account_No.                               ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_44]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Introducer_ID_No.'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Introducer_ID_No.                         ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_45]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Vendor_Code'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Vendor_Code                               ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_46]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Premium_Delivery'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Premium_Delivery                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_47]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Campaign_Code'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Campaign_Code                             ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_48]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Post_Code_CARD'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Post_Code_CARD                            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_49]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Name_orther'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Name_orther                               ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_50]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Lastname_orther'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Lastname_orther                           ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_51]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Relation_orther'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Relation_orther                           ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_52]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Position_orther'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Position_orther                           ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_53]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Issuer'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Issuer                                    ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_54]            ${data_excel}       ${data_value_page}  
    
    END

VERIFY KEY2 TITLE ORTHER 
    [Arguments]    ${index}    ${data_excel}    ${data_value_page}

    IF  '${index}'=='Office_Title'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Office_Title	                     ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_0]            ${data_excel}       ${data_value_page}  
      
    ELSE IF  '${index}'=='Office_Name'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Office_Name                         ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_1]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Tambol_1'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Tambol_1                            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_2]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Province_1'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Province_1                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_3]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Tambol_2'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Tambol_2                            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_4]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Province_2'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Province_2                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_5]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Account_Type' 
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Account_Type                        ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_6]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Bank_branch_1'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Bank_branch                         ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_7]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Account_Information_Recheck'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Account_Information_Recheck         ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_8]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Account_Type'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Account_Type                        ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_9]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Bank_branch_2'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Bank_branch_2                       ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_10]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Tambol_3'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Tambol_3                            ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_13]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Province_3'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Province_3                          ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_14]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='HOME_Telephone'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          HOME_Telephone                      ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_15]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='OFFICE_Telephone'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          OFFICE_Telephone                    ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_16]            ${data_excel}       ${data_value_page}  
    
    ELSE IF  '${index}'=='Mobile'
        COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL          Mobile                              ${tbl_header_label_name_key1virual_card_yaml}[subject_data_index][index_17]            ${data_excel}       ${data_value_page}  
    
    END


SEARCH AND SELECT CUTTOMER BY ID NUMBER    
    [Arguments]    ${set_tc_value_case}    ${data_sheet}

    ${group_value}     JSONLibrary.Get value from json      ${data_sheet}       $[?(@.TC=='${set_tc_value_case}')]
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Key_in_step_2_page.INPUT ID NUMBER    ${group_value}[0][ID]
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Key_in_step_2_page.CLICK SEARCH BUTTON
    BuiltIn.Wait Until Keyword Succeeds   5x    2s    Key_in_step_2_page.CLICK SELECT BUTTON


# KEY 2 - MATRIX
SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
    
    # ต้อง change ผ่านเท่านั้นถึงจะทำ key2
    IF  '${state_next_step}' != 'Not Success : Changepriority_KS2'

        IF  '${TC_no}' != '' and '${ID_no}' != '' and '${branch}' != '' and '${app_no}' != '' and '${card}' != ''
            BuiltIn.Log    !!REDY TO KEY IN STEP 2!!
            BuiltIn.Set global Variable     ${state_next_step}

            BuiltIn.Log    TC_no->${TC_no}    WARN
            Common_feature.SET ACTUAL RESULT NAME
            Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel}[${Excel_Actual_Result}]    ${TC_no}

            ${group_value}    JSONLibrary.Get Value From Json    ${data_matrix_test_case}    $[?(@.TC=='${TC_no}')]

            FOR  ${index_data}   IN RANGE    0    ${count_row_excel_data_actual_result}
                ${result_app_no}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][App_no]
                ${result_state}     BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][State]

                # ถ้าเป็น TC000 (RANK 0) รอบแรก ให้ทำการ login ด้วย user Key2 ถ้าไม่ใช่ Kessai
                IF  'TC000_RANK' in ${TEST TAGS} and '${result_app_no}' == '${app_no}' and '${result_state}' == 'Change_to_KS2'
                    # Login SSO
                    ${rank}    BuiltIn.Set Variable    Rank0_round1
                    BuiltIn.Set global Variable     ${rank}
                    BuiltIn.Log    RANK->${rank}    WARN
                    BuiltIn.Log    APP_no->${result_app_no}    WARN
                    Login_page.SET LOGIN SSO TO RL    Key2
                    Common_keyword.WAIT STATE AUTOALLOWCATE OR MANUAL    AUTOALLOWCATE
                    BuiltIn.Exit For Loop
                ELSE IF    'TC000_RANK' in ${TEST TAGS} and '${result_app_no}' == '${app_no}' and '${result_state}' == 'Change_to_KES'
                    # Login SSO
                    ${rank}    BuiltIn.Set Variable    Rank0_round2
                    BuiltIn.Set global Variable     ${rank}
                    BuiltIn.Log    RANK->${rank}    WARN
                    BuiltIn.Log    APP_no->${result_app_no}    WARN
                    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Change_to_KS2
                    Login_page.SET LOGIN SSO TO RL    Kessai
                    Common_keyword.WAIT STATE AUTOALLOWCATE OR MANUAL    AUTOALLOWCATE
                    BuiltIn.Exit For Loop
                END
            END

            # ถ้าไม่เป็น TC000 (RANK 0)
            IF    'TC000_RANK' not in ${TEST TAGS}
                BuiltIn.Log    !!KEY 2 NOT RANK 0!!   WARN
                Login_page.SET LOGIN SSO TO RL    Key2
                Common_keyword.WAIT STATE AUTOALLOWCATE OR MANUAL    AUTOALLOWCATE
            END

            # Get data ใหม่
            Common_feature.SET ACTUAL RESULT NAME
            Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel}[${Excel_Actual_Result}]    ${TC_no}

            FOR  ${index_data}   IN RANGE    0    ${count_row_excel_data_actual_result}

                ${result_branch}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][Branch]
                ${result_app_no}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][App_no]
                ${result_state}     BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][State]

                IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'Change_to_KS2'

                    BuiltIn.Log    !!SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION>${result_state}!!    WARN 
                    BuiltIn.Log    EXCEL->${result_state} : ${result_app_no}    WARN
                    BuiltIn.Log    -------------------------------    WARN
                    
                    # get application no and branch
                    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.GET TEXT BY LOCATOR FOR DATA EQUAL NONE    ${txt_branch_appno}

                    ${result_application}    SeleniumLibrary.Get Text    ${txt_branch_appno}
                    ${cleaned}    BuiltIn.Evaluate    "${result_application}".replace(' ', '')  # ลบช่องว่างทั้งหมดออก

                    # ตรวจสอบว่าเจอ ':' หรือ ช่องว่าง
                    ${colon_index}    BuiltIn.Evaluate    "${cleaned}".find(':')
                    ${space_index}    BuiltIn.Evaluate    "${cleaned}".find(' ')

                    IF  ${colon_index} > 0 and ${space_index} < 0
                        BuiltIn.Log   CASE_>SEMICOLON    WARN
                        ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    ${txt_branch_appno}    :    Full
                        ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
                        ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
                    ELSE
                        BuiltIn.Log   CASE_>SPACE    WARN
                        ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    ${txt_branch_appno}    ${SPACE}    Full
                        ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
                        ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
                    END    
                    
                    BuiltIn.Set global Variable     ${strip_result_branch}
                    BuiltIn.Set global Variable     ${strip_result_appno}
                    BuiltIn.Log    Strip Branch->${strip_result_branch}->Strip App No->${strip_result_appno}    WARN
                    BuiltIn.Log    App No to use:${app_no}    WARN

                    IF  '${strip_result_branch}' == '${result_branch}'

                        # เข้ามาแล้ว appno ไม่ตรงกับหน้าเว็ย ให้ pending แล้ว get app_no หน้าเว็บ อีกรอบจนกว่าจะตรงโดยการ reload page ถ้า ตรงแล้วออก
                        WHILE  '${strip_result_appno}' != '${app_no}'

                            BuiltIn.Log    CONDITIONS ARE INCORRECT    WARN
                            BuiltIn.Log    !!! CHECK POPUP PENDING !!!    WARN
                            BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_pending_key2}    60s
                            BuiltIn.Sleep  2s
                            BuiltIn.Wait Until Keyword Succeeds   2x    2s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_pending_key2}    60s
                            BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_dropdown_pending_key2}    PD17
                            BuiltIn.Sleep  2s
                            BuiltIn.Wait Until Keyword Succeeds   3x    2s    SeleniumLibrary.Press Keys    NONE    ENTER
                            BuiltIn.Wait Until Keyword Succeeds   3x    2s    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_note_pending_key2}    Automate Pending
                            BuiltIn.Sleep  2s
                            BuiltIn.Wait Until Keyword Succeeds   2x    2s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_addnote_pending_key2}    60s
                            BuiltIn.Sleep  2s
                            BuiltIn.Wait Until Keyword Succeeds   2x    2s    SeleniumLibrary.Wait Until Element Is Visible    ${btn_ok_pending_key2}    30s

                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    AFTER_PENDING
                            Capture_screen.CAPTURE SCREEN CURRENT PAGE

                            BuiltIn.Wait Until Keyword Succeeds   2x    2s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_ok_pending_key2}    60s

                            # If found popup error
                            ${Found_modal}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    //div[@id="modalSetStatus"]    30s
                            ${Found_error_pending_key2}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_error_pending_key2}    30s
                            
                            IF  '${Found_modal}' == 'True' and '${Found_error_pending_key2}' == 'True'
                                Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    //input[@type="radio" and @value="L"]
                                Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    //button[@id="btn-confirm"]
                                Common_keyword.INTRANET TEARDOWN
                                BuiltIn.fail    !! ERROR PENDING POPUP !!
                                # SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION
                                BREAK
                            ELSE
                                SeleniumLibrary.Reload Page
                                BREAK
                            END

                            # get application no and branch
                            BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.GET TEXT BY LOCATOR FOR DATA EQUAL NONE    ${txt_branch_appno}

                            ${result_application}    SeleniumLibrary.Get Text    ${txt_branch_appno}
                            ${cleaned}    BuiltIn.Evaluate    "${result_application}".replace(' ', '')  # ลบช่องว่างทั้งหมดออก

                            # ตรวจสอบว่าเจอ ':' หรือ ช่องว่าง
                            ${colon_index}    BuiltIn.Evaluate    "${cleaned}".find(':')
                            ${space_index}    BuiltIn.Evaluate    "${cleaned}".find(' ')

                            IF  ${colon_index} > 0 and ${space_index} < 0
                                BuiltIn.Log   CASE_>SEMICOLON    WARN
                                ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    ${txt_branch_appno}    :    Full
                                ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
                                ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
                            ELSE
                                BuiltIn.Log   CASE_>SPACE    WARN
                                ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    ${txt_branch_appno}    ${SPACE}    Full
                                ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
                                ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
                            END    

                            BuiltIn.Set global Variable     ${strip_result_branch}
                            BuiltIn.Set global Variable     ${strip_result_appno}
                            BuiltIn.Log    Strip Branch->${strip_result_branch}->Strip App No->${strip_result_appno}    WARN
                            BuiltIn.Log    App No to use:${app_no}    WARN
                            
                        END

                        # ถ้า brach และ app_no ตรงให้ทำต่อ
                        IF  '${strip_result_appno}' == '${app_no}'

                            BuiltIn.Log    CONDITIONS ARE CORRECT    WARN
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP2
                            Capture_screen.CAPTURE SCREEN CURRENT PAGE
                            
                            ${status_ks2}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Comfirm}    30s

                            IF  '${status_ks2}' == 'True'   

                                BuiltIn.Log    !!SEE BUTTON COMFIRM!!   WARN
                                BuiltIn.Run Keyword And Ignore Error    Recheck_key_in_step_1_page.CLICK BUTTON CONFIRM
                                BuiltIn.Sleep    3s
                                
                                BuiltIn.Run Keyword And Ignore Error    Recheck_key_in_step_1_page.CLICK BUTTON YES CONFIRM
                                BuiltIn.Sleep    3s
                            END

                            ${status_check_office}    BuiltIn.Run Keyword And Return Status    SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE    ${group_value}
                            BuiltIn.Log    >status_check_office->${status_check_office}   WARN
                    
                            IF  '${status_check_office}' == 'True'
                                BuiltIn.Sleep    10s
                                ${status_check_brithday}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Key2_Brithday}    120s
                                BuiltIn.Log    >status_check_brithday->${status_check_brithday}   WARN
                            
                                IF  '${status_check_brithday}' == 'False' 
                                    # ถ้า popup api timeout
                                    ${popup_call_api}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    //h4[@class="ui-pnotify-title"]   150s
                                    # ถ้า popup api timeout ขึ้นมามีปุ่ม save
                                    BuiltIn.Run Keyword If    '${popup_call_api}' == 'True'    SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE    ${group_value}
                                END                    

                                ${status_check_judment}    BuiltIn.Run Keyword And Return Status   SET KEY IN STEP 2 - JUDMENT    ${group_value}
                                BuiltIn.Log    >status_check_judment->${status_check_judment}   WARN
                                IF  '${status_check_judment}' == 'True'
                                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP2
                                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                                    # ถ้าเจอ popup success ให้ทำการปิดเว็บ แต่ถ้าไม่เจอให้รอจนกว่าจะเจอ modal
                                    ${Found_popup_success}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_success_key2}    600s
                                    BuiltIn.Run Keyword If    '${Found_popup_success}' != 'True'    SeleniumLibrary.Wait Until Element Is Visible    //div[@id="modalSetStatus"]    30s
                                    
                                    # ถ้าเป็น TC000 (RANK 0) ให้ stamp data: Change_to_KES --> รอบแรก
                                    IF  'TC000_RANK' in ${TEST TAGS} and '${result_app_no}' == '${app_no}' and '${rank}' == 'Rank0_round1' 
                                        BuiltIn.Log    !!KEY 2 : REJECT ROUND 1!!   WARN
                                        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    INT
                                    END

                                    # ถ้าไม่เป็น TC000 (RANK 0)
                                    BuiltIn.Run Keyword If    'TC000_RANK' not in ${TEST TAGS}    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    KS2
                                    BuiltIn.Run Keyword If    'TC000_RANK' not in ${TEST TAGS}    BuiltIn.Log    !!KEY 2 PASS!!   WARN

                                    # ถ้าเป็น TC000 (RANK 0) เพื่อ reject --> รอบสอง
                                    IF  'TC000_RANK' in ${TEST TAGS} and '${result_app_no}' == '${app_no}' and '${rank}' == 'Rank0_round2'
                                        BuiltIn.Log    !!KEY 2 : RREJECT ROUND 2!!   WARN
                                        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR   //button[@id="btn_pop_mobile"]
                                        SeleniumLibrary.Wait Until Element Is Visible    ${popup_success_key2}    30s
                                        Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP2_REJECT
                                        Capture_screen.CAPTURE SCREEN CURRENT PAGE
                                        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Reject
                                        BuiltIn.Log    !!KEY 2 REJECT PASS!!   WARN
                                    END
            
                                    Common_keyword.INTRANET TEARDOWN    Time_key_in_step_2

                                ELSE
                                    BuiltIn.Log    Not Success : Key 2    WARN    
                                    BuiltIn.fail    Not Success : Key 2    
                                    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Key 2
                                    Common_keyword.INTRANET TEARDOWN
                                END

                            ELSE
                                BuiltIn.Log    Not Success : Key 2    WARN    
                                BuiltIn.fail    Not Success : Key 2    
                                Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    State    Not Success : Key 2
                                Common_keyword.INTRANET TEARDOWN
                            END
                        END
                    END
                END
            END
        ELSE
            BuiltIn.Log    !!NOT PASS CHANGE PRIORITY ERROR SOME STEP CHECK LOG AND EXCEL!!    WARN
            BuiltIn.fail    !!NOT PASS CHANGE PRIORITY ERROR SOME STEP CHECK LOG AND EXCEL!!
            Common_keyword.INTRANET TEARDOWN
        END
    ELSE
        BuiltIn.Log    !!NOT PASS CHANGE BEFORE MAKE KEY IN STEP 2!!    WARN
        BuiltIn.fail    !!NOT PASS CHANGE BEFORE MAKE KEY IN STEP 2!!
    END


# KEY 2 - MATRIX
SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION GNO
    
    # ต้อง change ผ่านเท่านั้นถึงจะทำ key2
    IF  '${state_next_step}' != 'Not Success : Changepriority_KS2'

        IF  '${TC_no}' != '' and '${ID_no}' != '' and '${branch}' != '' and '${app_no}' != '' and '${card}' != ''
            BuiltIn.Log    !!REDY TO KEY IN STEP 2!!
            
            BuiltIn.Set global Variable     ${state_next_step}

            # Login SSO
            Login_page.SET LOGIN SSO TO RL    Key2
            Common_keyword.WAIT STATE AUTOALLOWCATE OR MANUAL    AUTOALLOWCATE

            BuiltIn.Log    TC_no->${TC_no}    WARN
  
            ${group_value}    JSONLibrary.Get Value From Json    ${data_matrix_test_case}    $[?(@.TC=='${TC_no}')]

            BuiltIn.Log    !!SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION!!    WARN 
            BuiltIn.Log    EXCEL->${branch} : ${app_no}    WARN
            BuiltIn.Log    -------------------------------    WARN
            
            # get application no and branch
            BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.GET TEXT BY LOCATOR FOR DATA EQUAL NONE    ${txt_branch_appno}

            ${result_application}    SeleniumLibrary.Get Text    ${txt_branch_appno}
            ${cleaned}    BuiltIn.Evaluate    "${result_application}".replace(' ', '')  # ลบช่องว่างทั้งหมดออก

            # ตรวจสอบว่าเจอ ':' หรือ ช่องว่าง
            ${colon_index}    BuiltIn.Evaluate    "${cleaned}".find(':')
            ${space_index}    BuiltIn.Evaluate    "${cleaned}".find(' ')

            IF  ${colon_index} > 0 and ${space_index} < 0
                BuiltIn.Log   CASE_>SEMICOLON    WARN
                ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    ${txt_branch_appno}    :    Full
                ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
                ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
            ELSE
                BuiltIn.Log   CASE_>SPACE    WARN
                ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    ${txt_branch_appno}    ${SPACE}    Full
                ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
                ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
            END    
            
            BuiltIn.Set global Variable     ${strip_result_branch}
            BuiltIn.Set global Variable     ${strip_result_appno}
            BuiltIn.Log    Strip Branch->${strip_result_branch}->Strip App No->${strip_result_appno}    WARN
            BuiltIn.Log    App No to use:${app_no}    WARN

            IF  '${strip_result_branch}' == '${branch}'

                # เข้ามาแล้ว appno ไม่ตรงกับหน้าเว็ย ให้ pending แล้ว get app_no หน้าเว็บ อีกรอบจนกว่าจะตรงโดยการ reload page ถ้า ตรงแล้วออก
                WHILE  '${strip_result_appno}' != '${app_no}'

                    BuiltIn.Log    CONDITIONS ARE INCORRECT    WARN
                    BuiltIn.Log    !!! CHECK POPUP PENDING !!!    WARN
                    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_pending_key2}    60s
                    BuiltIn.Sleep  2s
                    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_pending_key2}
                    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${input_dropdown_pending_key2}    PD17
                    BuiltIn.Sleep  2s
                    SeleniumLibrary.Press Keys    NONE    ENTER
                    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_note_pending_key2}    Automate Pending
                    BuiltIn.Sleep  2s
                    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_addnote_pending_key2}    60s
                    BuiltIn.Sleep  2s
                    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${btn_ok_pending_key2}    60s

                    # If found popup error
                    ${Found_modal}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    //div[@id="modalSetStatus"]    30s
                    ${Found_error_pending_key2}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_error_pending_key2}    30s
                    
                    IF  '${Found_modal}' == 'True' and '${Found_error_pending_key2}' == 'True'
                        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    //input[@type="radio" and @value="L"]
                        Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    //button[@id="btn-confirm"]
                        Common_keyword.INTRANET TEARDOWN
                        # BuiltIn.fail    !! ERROR PENDING POPUP !! 
                        SET FEATURE - E2E KEYINSTEP 2 MATRIX CASE HAVE CODITION GNO
                        BREAK
                    ELSE
                        SeleniumLibrary.Reload Page
                        BREAK
                    END

                    # get application no and branch
                    BuiltIn.Wait Until Keyword Succeeds    10x    1s    Common_keyword.GET TEXT BY LOCATOR FOR DATA EQUAL NONE    ${txt_branch_appno}

                    ${result_application}    SeleniumLibrary.Get Text    ${txt_branch_appno}
                    ${cleaned}    BuiltIn.Evaluate    "${result_application}".replace(' ', '')  # ลบช่องว่างทั้งหมดออก

                    # ตรวจสอบว่าเจอ ':' หรือ ช่องว่าง
                    ${colon_index}    BuiltIn.Evaluate    "${cleaned}".find(':')
                    ${space_index}    BuiltIn.Evaluate    "${cleaned}".find(' ')

                    IF  ${colon_index} > 0 and ${space_index} < 0
                        BuiltIn.Log   CASE_>SEMICOLON    WARN
                        ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    ${txt_branch_appno}    :    Full
                        ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
                        ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
                    ELSE
                        BuiltIn.Log   CASE_>SPACE    WARN
                        ${result_application}    Common_keyword.GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK    ${txt_branch_appno}    ${SPACE}    Full
                        ${strip_result_branch}    BuiltIn.Set Variable     ${result_application}[0]
                        ${strip_result_appno}     BuiltIn.Set Variable     ${result_application}[1]
                    END    

                    BuiltIn.Set global Variable     ${strip_result_branch}
                    BuiltIn.Set global Variable     ${strip_result_appno}
                    BuiltIn.Log    Strip Branch->${strip_result_branch}->Strip App No->${strip_result_appno}    WARN
                    BuiltIn.Log    App No to use:${app_no}    WARN
                    
                END


                # ถ้า brach และ app_no ตรงให้ทำต่อ
                IF  '${strip_result_appno}' == '${app_no}'

                    BuiltIn.Log    CONDITIONS ARE CORRECT    WARN
                    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP2
                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
                    
                    ${status_ks2}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Comfirm}    30s

                    IF  '${status_ks2}' == 'True'   

                        BuiltIn.Log    !!SEE BUTTON COMFIRM!!   WARN
                        BuiltIn.Run Keyword And Ignore Error    Recheck_key_in_step_1_page.CLICK BUTTON CONFIRM
                        BuiltIn.Sleep    3s
                        
                        BuiltIn.Run Keyword And Ignore Error    Recheck_key_in_step_1_page.CLICK BUTTON YES CONFIRM
                        BuiltIn.Sleep    3s
                    END

                    ${status_check_office}    BuiltIn.Run Keyword And Return Status    SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE    ${group_value}
                    BuiltIn.Log    >status_check_office->${status_check_office}   WARN

                    IF  '${status_check_office}' == 'True'

                        ${status_check_brithday}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Key2_Brithday}    120s
                        BuiltIn.Log    >status_check_brithday->${status_check_brithday}   WARN
                    
                        IF  '${status_check_brithday}' == 'False' 
                            # ถ้า popup api timeout
                            ${popup_call_api}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    //h4[@class="ui-pnotify-title"]   150s
                            # ถ้า popup api timeout ขึ้นมามีปุ่ม save
                            BuiltIn.Run Keyword If    '${popup_call_api}' == 'True'    SET SELECT AND INPUT COMPANY TO CONFIRM CHECK OFFICE    ${group_value}
                        END                    

                        ${status_check_judment}    BuiltIn.Run Keyword And Return Status   SET KEY IN STEP 2 - JUDMENT    ${group_value}
                        BuiltIn.Log    >status_check_judment->${status_check_judment}   WARN
                        IF  '${status_check_judment}' == 'True'
                            Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KEY_IN_STEP2
                            Capture_screen.CAPTURE SCREEN CURRENT PAGE
                            # ถ้าเจอ popup success ให้ทำการปิดเว็บ แต่ถ้าไม่เจอให้รอจนกว่าจะเจอ modal
                            ${Found_popup_success}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${popup_success_key2}    600s
                            BuiltIn.Run Keyword If    '${Found_popup_success}' != 'True'    SeleniumLibrary.Wait Until Element Is Visible    //div[@id="modalSetStatus"]    30s
                            BuiltIn.Log    !!KEY 2 PASS!!   WARN
                            Common_keyword.INTRANET TEARDOWN
                        ELSE
                            BuiltIn.Log    Not Success : Key 2    WARN    
                            BuiltIn.fail    Not Success : Key 2    
                            Common_keyword.INTRANET TEARDOWN
                        END

                    ELSE
                        BuiltIn.Log    Not Success : Key 2    WARN    
                        BuiltIn.fail    Not Success : Key 2    
                        Common_keyword.INTRANET TEARDOWN
                    END
                END
            END
         
        
        ELSE
            BuiltIn.Log    !!NOT PASS CHANGE PRIORITY ERROR SOME STEP CHECK LOG AND EXCEL!!    WARN
            BuiltIn.fail    !!NOT PASS CHANGE PRIORITY ERROR SOME STEP CHECK LOG AND EXCEL!!
            Common_keyword.INTRANET TEARDOWN
        END
    ELSE
        BuiltIn.Log    !!NOT PASS CHANGE BEFORE MAKE KEY IN STEP 2!!    WARN
        BuiltIn.fail    !!NOT PASS CHANGE BEFORE MAKE KEY IN STEP 2!!
    END