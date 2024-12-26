*** Settings ***
Resource    ${CURDIR}/../Import/Path_import.robot    # robotcode: ignore


*** Keywords ***

GET - DATA FROM EXCEL BY SHEET
  [Arguments]    ${file_name}    ${sheet_name}
  ${result}    Excel_reader.Read_Excel_by_Sheet    filepath=${share_drive}${file_name}    sheet_name=${sheet_name}
  ${data}    BuiltIn.Set Variable     ${result}[0] 
  ${row}     BuiltIn.Set Variable     ${result}[1]
  BuiltIn.Set global variable     ${data}  
  BuiltIn.Set global variable     ${row} 



SET - DATA FROM EXCEL BY SHEET
  [Arguments]     ${file_name}    ${sheet_name}    ${row}    ${column}    ${data}

  Excel_reader.Write_Excel_by_Sheet    filepath=${share_drive}${file_name}    sheet_name=${sheet_name}    row_expect=${row}    column_expect=${column}    data=${data}
