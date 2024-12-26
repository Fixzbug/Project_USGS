*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***   

SET INPUT AND SELECT DROPDOWN TO CLICK CONFIRM 
    [Arguments]    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - CLICK TAB JUDMENT

    # Input data
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN APPLY TYPE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN APPLY VIA    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN APPLY CHANNEL    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN ACTIVITY    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN SUB APPLY CHANNEL    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT BIRTHDATE DAY    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT BIRTHDATE MONTH    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT BIRTHDATE YEAR    ${tc_index}   
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN BIRTHDAY    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN MARITAL    ${tc_index}        
    Verify_judment_page.VERIFY JUDMENT - INPUT CHILDREN    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN SEX    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT TIME HOME YEAR    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT TIME HOME MONTH    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT PERSON    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN HOME TYPE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN BUSINESS TYPE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN SUB BUSINESS TYPE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN OCCUPATION TYPE    ${tc_index}
    BuiltIn.Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN SUB OCCUPATION TYPE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN POSITION    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT NUMBER EMPLOYEES    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT WORK EXP YEAR    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT WORK EXP MONTH    ${tc_index}
    BuiltIn.Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN EMPLOYEES TYPE    ${tc_index}
    BuiltIn.Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN SALARY TYPE    ${tc_index}
    BuiltIn.Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN CUSTOMER TYPE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN DOCUMENT FOR CALCULATE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT SALARY    ${tc_index}
    BuiltIn.Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN TEL TYPE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT HOME ZIPCODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN HOME AMPHUER    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN HOME PROVINCE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN HOME ZIPCODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT OFFICE ZIPCODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN OFFICE TAMBOL    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN OFFICE AMPHUER    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN OFFICE PROVINCE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN OFFICE ZIPCODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN SALDATE JUDMENT    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN SALE AGENT CODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN SEARCH BANK CODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT ACCOUNT TYPE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT BANK CODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT ACCOUNT NO    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN ACCOUNT TYPE RECHECK    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN SEARCH BANK CODE RECHECK    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT ACCOUNT NO RECHECK    ${tc_index}
    BuiltIn.Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN VENDOR CODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN CAMPAIGN CODE 1    ${tc_index}
    BuiltIn.Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN DELIVERY    ${tc_index}
    BuiltIn.Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN CAMPAIGN CODE 2    ${tc_index}
    BuiltIn.Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN CAMPAIGN CODE 3    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT CARD ZIPCODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN CARD TAMBOL    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN CARD AMPHUER    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN CARD PROVINCE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN CARD ZIPCODE    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT CHECKBOX HAVE RELATIONSHIP    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT ISSUER    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT OFFICE TELEPHONE    ${tc_index}

    # Click Button
    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON VERIFY JUDMENT
    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON CALCULATE JUDMENT
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN RESULT JUDMENT    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON CONFIRM JUDMENT
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_JUDGMENT_PAGE
    Capture_screen.CAPTURE SCREEN CURRENT PAGE
    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON YES CONFIRM JUDMENT

    # Input Data After Click Button
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN DOCUMENT DELIVERY    ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT NAME TH                        ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT SURNAME TH                     ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT NAME EN                        ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT SURNAME EN                     ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT NICKNAME                       ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT EMAIL                          ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT VILLAGE                        ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN BUILDING              ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT BUILDING                       ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT ADDRESS NO                     ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT ROOM                           ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT FLOOR                          ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT MOO                            ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT SOI                            ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT ROAD                           ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN PAYMENT TYPE         ${tc_index}
    # Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN DEBIT BANK CODE      ${tc_index}
    # Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN ACCOUNT TYPE         ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN RECEIVE TYPE         ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT CASH FROM                      ${tc_index}
    # Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN ACCOUNT TYPE 2       ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN TRANSFER MONEY       ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN TRANSFER TYPE        ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - INPUT AMOUNT                         ${tc_index}
    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON CONFIRM APPROVE
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_JUDGMENT_PAGE_2
    Capture_screen.CAPTURE SCREEN CURRENT PAGE
    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON YES APPROVE
    Verify_judment_page.VERIFY JUDMENT - WAIT POPUP SUCCESS APPROVE






SET INPUT AND SELECT DROPDOWN TO CLICK CONFIRM MANUAL
    [Arguments]    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - CLICK TAB JUDMENT

    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN APPLY TYPE    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN APPLY VIA    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN APPLY CHANNEL    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN ACTIVITY    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - INPUT BIRTHDATE DAY    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - INPUT BIRTHDATE MONTH    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - INPUT BIRTHDATE YEAR    ${tc_index}        

    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN BIRTHDAY    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDWN MARITAL    ${tc_index}        

    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN SALDATE JUDMENT    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - INPUT ACCOUNT TYPE    ${tc_index}

    Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN VENDOR CODE    ${tc_index}

    Run Keyword And Ignore Error    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN DELIVERY    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON VERIFY JUDMENT

    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON CALCULATE JUDMENT

    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN RESULT JUDMENT    ${tc_index}

    Verify_judment_page.VERIFY JUDMENT - SELECT DROPDOWN TO KESSAI

    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON CONFIRM JUDMENT

    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    VERIFY_JUDGMENT_MANUAL_PAGE

    Capture_screen.CAPTURE SCREEN CURRENT PAGE

    Verify_judment_page.VERIFY JUDMENT - CLICK BUTTON YES CONFIRM JUDMENT
    
