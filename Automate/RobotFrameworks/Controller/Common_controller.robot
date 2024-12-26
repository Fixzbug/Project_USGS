*** Settings ***
Resource    ${CURDIR}/../Import/Path_import.robot    # robotcode: ignore

*** Keywords ***

SET - FORMAT DATA FORM EXCEL
    [Arguments]   ${column}    ${row}
    ${result_excel}   JSONLibrary.Get Value From Json    ${data}    $[?(@.'${column}' == '${row}')]
    ${group_data}    BuiltIn.Set Variable   ${result_excel}[0]         
    BuiltIn.Set Global Variable    ${group_data}


SET - WRITE EXCEL 
    [Arguments]     ${excel_name}    ${sheet_name}    ${row}    ${column}    ${data}
    Excel_Reader_model.SET - DATA FROM EXCEL BY SHEET   file_name=${excel_file}[${excel_name}]   sheet_name=${sheet_name}    row=${row}    column=${column}    data=${data}


GET - READ EXCEL
    [Arguments]    ${excel_name}    ${sheet_name}
    Excel_Reader_model.GET - DATA FROM EXCEL BY SHEET    file_name=${excel_file}[${excel_name}]    sheet_name=${sheet_name}

