*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
${request_customer_salary_data}
${user_login_request_customer_salary_data}

# add new
${data_excel}
${data_user_rl}
${excel_data_stock_id_card}
${data_stock_id_card}
${count_row_excel_id_card}
${excel_data_stock_card}
${data_stock_card}
${count_row_excel_card}

# data actual result
${excel_data_actual_result}         
${data_actual_result}   
${count_row_excel_data_actual_result}   

*** Keywords ***
    
GET USER LOGIN DATA FROM EXCEL
    [Arguments]     ${excel}
    ${user_login_request_customer_salary_data}      Excel_reader.GET DATA FROM EXCEL BY SHEET     ${excel}     User_Authentication
    BuiltIn.Set global variable      ${user_login_request_customer_salary_data}


GET CUSTOMER REQUEST DATA FROM EXCEL
    [Arguments]     ${excel}
    ${request_customer_salary_data}      Excel_reader.GET DATA FROM EXCEL BY SHEET     ${excel}     CRS_Data_Sheet
    BuiltIn.Set global variable      ${request_customer_salary_data}


GET USER LOGIN
    [Arguments]     ${excel}
    ${data_excel}    Excel_reader.GET DATA FROM EXCEL BY SHEET     ${excel}     USER   
    ${data_user_rl}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable    ${data_user_rl}
    

GET DATA STOCK FROM EXCEL
    [Arguments]     ${excel}
    ${excel_data_stock_id_card}    Excel_reader.GET DATA FROM EXCEL BY SHEET     ${excel}     Data_id_card   
    ${data_stock_id_card}    BuiltIn.Set Variable      ${excel_data_stock_id_card}[0]
    BuiltIn.Set global Variable    ${data_stock_id_card}
    ${count_row_excel_id_card}    BuiltIn.Set Variable      ${excel_data_stock_id_card}[1]
    BuiltIn.Set global Variable    ${count_row_excel_id_card}

    ${excel_data_stock_card}      Excel_reader.GET DATA FROM EXCEL BY SHEET     ${excel}     Data_card 
    ${data_stock_card}    BuiltIn.Set Variable      ${excel_data_stock_card}[0]
    BuiltIn.Set global Variable    ${data_stock_card}
    ${count_row_excel_card}    BuiltIn.Set Variable      ${excel_data_stock_card}[1]
    BuiltIn.Set global Variable    ${count_row_excel_card}


GET DATA ACTUAL RESULT FROM EXCEL
    [Arguments]     ${excel}    ${case}
    ${excel_data_actual_result}    Excel_reader.GET DATA FROM EXCEL BY SHEET     ${excel}     ${case}

    IF  '${excel_data_actual_result}[1]' == '0'  
        ${data_actual_result}    BuiltIn.Set Variable      ${excel_data_actual_result}[0]
        BuiltIn.Set global Variable    ${data_actual_result}

        ${count_row_excel_data_actual_result}    BuiltIn.Set Variable    ${excel_data_actual_result}[1]
        BuiltIn.Set global Variable    ${count_row_excel_data_actual_result}
    
    ELSE
        ${data_actual_result}    BuiltIn.Set Variable      ${excel_data_actual_result}[0]
        BuiltIn.Set global Variable    ${data_actual_result}

        ${count_row_excel_data_actual_result}    BuiltIn.Set Variable    ${excel_data_actual_result}[1]
        BuiltIn.Set global Variable    ${count_row_excel_data_actual_result}
    END
