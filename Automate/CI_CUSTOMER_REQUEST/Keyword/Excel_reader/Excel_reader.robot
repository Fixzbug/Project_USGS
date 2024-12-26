*** Settings ***
Library    ${CURDIR}/../../Resources/Library/Excel_reader.py
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

${data}
${data_sheet}
${data_from_excel_by_sheet}
${data_count_row}
${data_count_column} 

*** Keywords ***

GET DATA FROM EXCEL BY SHEET
   [Arguments]    ${file_name}    ${sheet_name}
   
   ${data}    Excel_reader.Read_Excel_by_Sheet    filepath=${share_drive}${file_name}    sheet_name=${sheet_name}
   ${data_from_excel_by_sheet}    BuiltIn.Set Variable     ${data}[0] 
   ${data_count_row}    BuiltIn.Set Variable     ${data}[1]
   ${data_count_column}    BuiltIn.Set Variable     ${data}[2]
   BuiltIn.Set global variable     ${data_from_excel_by_sheet}  
   BuiltIn.Set global variable     ${data_count_row} 
   BuiltIn.Set global variable     ${data_count_column} 
   RETURN   ${data}


SET DATA FROM EXCEL BY SHEET
   [Arguments]     ${file_name}    ${sheet_name}    ${row}    ${column}    ${data} 
   Excel_reader.Write_Excel_by_Sheet    ${share_drive}${file_name}    sheet_name=${sheet_name}    row_expect=${row}    column_expect=${column}    data=${data}

