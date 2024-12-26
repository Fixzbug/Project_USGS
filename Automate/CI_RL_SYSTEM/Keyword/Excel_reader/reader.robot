*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot

*** Variables ***
# Set global variable    
${data_config_list}


*** Keywords ***

Read and set value from excel new
    [Documentation]    read data from excel and set as global json
    [Arguments]    ${filepath}    ${sheet_name}
    ${data_sheet}    reader.Read_Excel_by_Sheet    ${filepath}    ${sheet_name}
    RETURN   ${data_sheet}

Write and set value from excel
    [Documentation]    read data from excel and set as global json
    [Arguments]    ${filepath}    ${sheet_name}    ${row}    ${column}    ${data}
    reader.Write_Excel_by_Sheet    ${filepath}    ${sheet_name}    ${row}    ${column}    ${data}
