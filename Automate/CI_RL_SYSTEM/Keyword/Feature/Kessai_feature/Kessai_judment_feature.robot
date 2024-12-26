*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***

SET INPUT AND SELECT TO CLICK CONFIRM KESSAI JUDMENT
    [Arguments]    ${tc_index}

    Kessai_judment_page.KESSAI JUDMENT - CLICK TAB JUDMENT
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN APPLY TYPE    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN APPLY VIA    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN APPLY CHANNEL    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN ACTIVITY    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN MARITAL    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN BIRTHDAY    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT BIRTHDATE DAY    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT BIRTHDATE MOUNTH    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT BIRTHDATE YEAR    ${tc_index}
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN SALARY DOCUMENT    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT SALARY    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN SALARY DATE    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN ACCOUNT TYPE    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT TT LOAN    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON VERIFY JUDMENT
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON CALCULATE
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN RESULT JUDMENT    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON CONFIRM JUDMENT
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON YES CALCULATE
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KESSAI_JUDMENT_PAGE
    Capture_screen.CAPTURE SCREEN CURRENT PAGE


SET INPUT AND SELECT DROPDOWN TO CLICK CONFIRM KESSAI JUDGMENT
    [Arguments]    ${tc_index}

    BuiltIn.Log    !!----------->Tab: Judgment<-----------!!    WARN
    Kessai_judment_page.KESSAI JUDMENT - CLICK TAB JUDMENT
    Kessai_judment_page.KESSAI JUDMENT - WAIT DATA IN TAB JUDMENT
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN APPLY TYPE                 ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN APPLY VIA                  ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN APPLY CHANNEL              ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT BIRTHDATE DAY                        ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT BIRTHDATE MOUNTH                     ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT BIRTHDATE YEAR                       ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN BIRTHDAY                   ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN MARITAL                    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT CHILDREN                             ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN SEX                         ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT TIME HOME YEAR                       ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT TIME HOME MONTH                      ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT PERSON                               ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN HOME TYPE                   ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN BUSINESS TYPE               ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN SUB BUSINESS TYPE           ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN OCCUPATION TYPE             ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT NUMBER EMPLOYEES                     ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT WORK EXP YEAR                        ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT WORK EXP MONTH                       ${tc_index}
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN EMPLOYEES TYPE              ${tc_index}    # Can't select
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN SALARY TYPE                 ${tc_index}    # Can't select
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN CUSTOMER TYPE               ${tc_index}    # Can't select
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN DOCUMENT FOR CALCULATE      ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT SALARY                               ${tc_index}
    # Kessai_judment_page.KESSAI JUDMENT - INPUT HOME ZIPCODE                         ${tc_index}    # Home
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN HOME TAMBOL                 ${tc_index}    # Home
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN HOME AMPHUER                ${tc_index}    # Home
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN HOME PROVINCE               ${tc_index}    # Home
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN HOME ZIPCODE                ${tc_index}    # Home
    # Kessai_judment_page.KESSAI JUDMENT - INPUT OFFICE ZIPCODE                       ${tc_index}    # Office
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN OFFICE TAMBOL               ${tc_index}    # Office
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN OFFICE AMPHUER              ${tc_index}    # Office
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN OFFICE PROVINCE             ${tc_index}    # Office
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN OFFICE ZIPCODE              ${tc_index}    # Office
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN SALARY DATE                ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN SALE AGENT CODE            ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN ACCOUNT TYPE               ${tc_index}
    # Kessai_judment_page.VERIFY JUDMENT - SELECT DROPDWN SEARCH BANK CODE RECHECK    ${tc_index}    # if input found popup error
    # Kessai_judment_page.KESSAI JUDMENT - INPUT ACCOUNT NO RECHECK                   ${tc_index}    # if input found popup error
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN CAMPAIGN CODE 1             ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN CAMPAIGN CODE 2             ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN CAMPAIGN CODE 3             ${tc_index}
    # Kessai_judment_page.KESSAI JUDMENT - INPUT CARD ZIPCODE                         ${tc_index}    # ID CARD ADDRESS
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN CARD TAMBOL                 ${tc_index}    # ID CARD ADDRESS
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN CARD AMPHUER                ${tc_index}    # ID CARD ADDRESS
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN CARD PROVINCE               ${tc_index}    # ID CARD ADDRESS
    # Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN CARD ZIPCODE                ${tc_index}    # ID CARD ADDRESS
    Kessai_judment_page.KESSAI JUDMENT - SELECT CHECKBOX HAVE RELATIONSHIP          ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT TT LOAN                              ${tc_index}

    # ตรวจสอบว่าถ้ามี Popup error ให้กรอกใหม่
    Kessai_judment_page.KESSAI JUDMENT - RE INPUT BIRTHDATE DAY MONTH AND YEAR    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - RE SELECT DROPDOWN BIRTHDAY              ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - RE SELECT DROPDOWN SALARY DOCUMENT       ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - RE INPUT SALARY                          ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - RE INPUT TT LOAN                         ${tc_index}

    # Click button
    BuiltIn.Log    !!----------->Tab: Last Judgment<-----------!!    WARN
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON CONFIRM JUDMENT
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON CALCULATE JUDMENT
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN RESULT JUDMENT       ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON CONFIRM JUDMENT AFTER CALCULATE
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON YES CALCULATE
    Kessai_judment_page.KESSAI JUDMENT - WAIT POPUP SUCCESS
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN DOCUMENT DELIVERY    ${tc_index}

    # Adress
    Kessai_judment_page.KESSAI JUDMENT - INPUT NAME TH       ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT SURNAME TH    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT NAME EN       ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT SURNAME EN    ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT NICKNAME      ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT EMAIL         ${tc_index}

    # Document Delivery ==> Current Address (H)
    Kessai_judment_page.KESSAI JUDMENT - INPUT VILLAGE               ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDWN BUILDING     ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT BUILDING              ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT ADDRESS NO            ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT ROOM                  ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT FLOOR                 ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT MOO                   ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT SOI                   ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT ROAD                  ${tc_index}

    # Financial Information
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN PAYMENT TYPE               ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN DEBIT BANK CODE            ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN ACCOUNT TYPE FINANCIAL     ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN RECEIVE TYPE               ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT CASH FROM                            ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN ACCOUNT TYPE 2             ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN TRANSFER MONEY             ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - SELECT DROPDOWN TRANSFER TYPE              ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - INPUT AMOUNT                               ${tc_index}
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON CONFIRM
    Kessai_judment_page.KESSAI JUDMENT - CLICK BUTTON APPROVE YES
    Kessai_judment_page.KESSAI JUDMENT - WAIT POPUP SUCCESS

    # Get Text when succeeds
    ${lbl_CustNo}      Kessai_judment_page.KESSAI JUDMENT - GET TEXT NEW CONTRACT    ${lbl_kessai_CustomerNo_locator}
    ${lbl_ContNo}      Kessai_judment_page.KESSAI JUDMENT - GET TEXT NEW CONTRACT    ${lbl_kessai_ContractNo_locator}
    ${lbl_ContDate}    Kessai_judment_page.KESSAI JUDMENT - GET TEXT NEW CONTRACT    ${lbl_kessai_ContractDate_locator}
    BuiltIn.Set Global Variable    ${lbl_CustNo}
    BuiltIn.Set Global Variable    ${lbl_ContNo}
    BuiltIn.Set Global Variable    ${lbl_ContDate}
    BuiltIn.Log     Customer No :${lbl_CustNo}        WARN
    BuiltIn.Log     Contract No :${lbl_ContNo}        WARN
    BuiltIn.Log     Contract Date :${lbl_ContDate}    WARN
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    KESSAI_JUDMENT_PAGE
    Capture_screen.CAPTURE SCREEN CURRENT PAGE