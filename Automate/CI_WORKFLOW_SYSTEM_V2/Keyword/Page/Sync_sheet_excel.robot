*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# add new
${excel_data_stock_id_card}
${group_data_stock}
${count_row_excel_id_card}
${excel_data_stock_card}
${data_stock_card}
${count_row_excel_card}

# data matrix
${data_matrix_test_case}

# data actual result
${excel_data_actual_result}         
${data_actual_result}   
${count_row_excel_data_actual_result}   

*** Keywords ***
    
GET ALL DATA FROM EXCEL MARTRIX
    [Arguments]    ${excel}
    
    ${data_excel}    Excel_reader.GET DATA FROM EXCEL BY SHEET    ${excel}     Matrix_test_case
    ${data_matrix}    BuiltIn.Set Variable      ${data_excel}[0]  
    ${data_matrix_test_case}    BuiltIn.Set Variable      ${data_matrix}  
    BuiltIn.Set global Variable      ${data_matrix_test_case}  


GET DATA STOCK FROM EXCEL
    [Arguments]     ${excel}

    ${excel_data_stock_id_card}    Excel_reader.GET DATA FROM EXCEL BY SHEET     ${excel}     Data_id_card
    ${group_data_stock}    BuiltIn.Set Variable      ${excel_data_stock_id_card}[0]
    BuiltIn.Set global Variable    ${group_data_stock}
    ${count_row_excel_id_card}    BuiltIn.Set Variable      ${excel_data_stock_id_card}[1]
    BuiltIn.Set global Variable    ${count_row_excel_id_card}


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

