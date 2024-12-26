*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore  

*** Variables ***
${DBUG}    FALSE

*** Test Cases *** 

TC_03 - REQUEST - RECEIPT NO - PAGE REQUEST WAIVE
    [Tags]    TC_03 

    # read data label
    Common_feature.SET - VERIFY - TITLE    excel_name=EXCELS    sheet_name=01_Waive_PNT    row=TITLE

    # read data sheet 
    Common_feature.GET - DATA FROM EXCEL    excel_name=EXCELS    sheet_name=01_Waive_PNT


    Request_waive_01_page.SET FORMAT DATA - ALL DATA AND INPUT DATA    row=TC    start_at_case=1   end_at_case=1    # TC_1 - TC_98

