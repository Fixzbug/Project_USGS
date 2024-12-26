*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

# group user
${group_user}
${keys_group_user}
${result_excel_user}

# group label
${group_data_label}
${keys_group_data_label}
${result_excel_data_label}

# group data all
${group_data_stock}
${group_data}
${keys_group_data}
${result_excel} 

# data stock
${ID_card}    none
${card_data_stock}    none
${rows_id_card_data_stock}    none
${rows_card_data_stock}    none
${last_index}    none
${Now_row}    none    
${RowStamp_by_case_idcard}    none             
${RowStamp_by_case_card}    none  

${Excel_Actual_Result}


*** Keywords ***

SET - FORMAT DATA EXCEL - SHEET USER FOR LOGIN
    [Arguments]   ${row}   
    ${result_excel_user}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]
    ${group_user}    BuiltIn.Set Variable   ${result_excel_user}[0]         # แปลง data 
    BuiltIn.Set Global Variable    ${group_user}
    ${keys_group_user}    Common_keyword.GET DATA JSON GET ONLY KEY    ${group_user}    # ส่ง data ไปแปลง เอาแค่ key ออกมาใช้   
    BuiltIn.Set Global Variable    ${keys_group_user}


SET - FORMAT DATA EXCEL - SHEET TITLE TABLE FOR VERIFY
    [Arguments]    ${row}
    ${result_excel_data_label}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]
    ${group_data_label}    BuiltIn.Set Variable   ${result_excel_data_label}[0]    # แปลง data
    BuiltIn.Set Global Variable    ${group_data_label}
    ${keys_group_data_label}    Common_keyword.GET DATA JSON GET ONLY KEY    ${group_data_label}    # ส่ง data ไปแปลง เอาแค่ key ออกมาใช้   
    BuiltIn.Set Global Variable    ${keys_group_data_label}


# Write data to excel
SET - DATA TO EXCEL 
    [Arguments]     ${excel_name}    ${sheet_name}    ${row}    ${column}    ${data}
    Excel_reader.SET DATA FROM EXCEL BY SHEET   file_name=${excel_file}[${excel_name}]   sheet_name=${sheet_name}    row=${row}    column=${column}    data=${data}


# Read data from excel
GET - DATA FROM EXCEL
    [Arguments]    ${excel_name}    ${sheet_name}
    Excel_reader.GET DATA FROM EXCEL BY SHEET    file_name=${excel_file}[${excel_name}]    sheet_name=${sheet_name}


# Verify label from excel
SET - VERIFY - TITLE 
    [Arguments]   ${excel_name}    ${sheet_name}    ${row}
    GET - DATA FROM EXCEL    excel_name=${excel_name}    sheet_name=${sheet_name}
    SET - FORMAT DATA EXCEL - SHEET TITLE TABLE FOR VERIFY    row=${row}    # get table label


# SET LOGIN
SET - LOGIN
    [Arguments]    ${excel_name}    ${sheet_name}    ${row}     
    GET - DATA FROM EXCEL    excel_name=${excel_name}    sheet_name=${sheet_name}
    SET - FORMAT DATA EXCEL- SHEET USER FOR LOGIN   row=${row}    # get user


GET ID CARD FROM EXCEL DATA STOCK

    ${last_index}    BuiltIn.Set Variable   ${count_row_excel_id_card}     
    BuiltIn.Convert To Integer    ${last_index}           
    ${last_index}    BuiltIn.Evaluate    ${last_index} - 1

    FOR  ${index}    IN RANGE    0    ${count_row_excel_id_card}  + 1  
        ${id_status}    BuiltIn.Set Variable    ${group_data_stock}[${index}][ID_CARD_USE/ERROR_MSG]
        IF  '${id_status}' == 'None'  
            BuiltIn.fail   !!!!!!!!!!!!!!!!!!!!!!!! FORGOT SET STATUS CARD IN EXCEL !!!!!!!!!!!!!!!!!!!!!!!!
        ELSE
      
            IF  '${id_status}' == 'none'
                ${group_data_stock_use}    BuiltIn.Set Variable    ${group_data_stock}[${index}]
                BuiltIn.Set Global Variable    ${group_data_stock_use}
                # BuiltIn.Log    GROUP_DATA_STOCK_USE>${group_data_stock_use}    WARN

                ${rows_id_card_data_stock}    BuiltIn.Evaluate     ${index} + 2
                BuiltIn.Set global variable    ${rows_id_card_data_stock}
            
                BuiltIn.Exit For Loop

            ELSE IF  ('${id_status}' == 'USE' or '${id_status}' == 'PENDING' or '${id_status}' == 'REJECT' or '${id_status}' == 'CANCEL') and '${index}' == '${last_index}' 
                BuiltIn.fail   !!!!!!!!!!!!!!!!!!!!!!!!ID_CARD OUT OF STOCK!!!!!!!!!!!!!!!!!!!!!!!!
            END
        END
    END


WRITE STATUS DATA STOCK ID CARD
    [Arguments]    ${yaml_location}    ${status}
    BuiltIn.Log    --------------------------------------    WARN 
    BuiltIn.Log    !!WRITE STATUS DATA STOCK ID CARD    WARN
    # BuiltIn.Log    !!rows_id_card_data_stock>${rows_id_card_data_stock}    WARN
    # BuiltIn.Log    !!RowStamp_by_case_idcard>${RowStamp_by_case_idcard}    WARN
    ${rows_id_card_data_stock}    BuiltIn.Set Variable If    '${rows_id_card_data_stock}' == 'none'   ${RowStamp_by_case_idcard}    ${rows_id_card_data_stock}
    SET - DATA TO EXCEL    excel_name=${yaml_location}    sheet_name=Data_id_card    row=${rows_id_card_data_stock}    column=10    data=${status}    # fix column 10 cuz status stamp at col 10



SET ACTUAL RESULT NAME
    [Arguments]     ${Type}

    IF  '${Type}' == '01_Waive_PNT'  
        BuiltIn.Log     01_Waive_PNT    WARN
        ${Excel_Actual_Result}    BuiltIn.Set Variable   Actual_result_type_01_yaml
    END

    BuiltIn.Set Global Variable   ${Excel_Actual_Result} 


SET DATA ACTUAL RESULT ON EXCEL INSERT ID NO
    [Arguments]     ${Sheetnames}    ${title_column}    ${data_from_web}

    Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel_file}[${Excel_Actual_Result}]    ${Sheetnames}

    IF  '${count_row_excel_data_actual_result}' == '0'
        ${last_index}    BuiltIn.Evaluate    2    
        BuiltIn.Log    !!Append data at row!!->${last_index}    WARN
        BuiltIn.Set Global Variable    ${last_index}
        WRITE DATA ACTUAL RESULT TO EXCEL    ${Sheetnames}    ${last_index}   ${yaml_title}[${title_column}]    ${data_from_web}    
    ELSE
        ${last_index}    BuiltIn.Set Variable   ${count_row_excel_data_actual_result}       
        BuiltIn.Convert To Integer    ${last_index}              
        ${last_index}    BuiltIn.Evaluate    ${last_index} + 2    
        BuiltIn.Log    !!Append data at row!!->${last_index}    WARN
        BuiltIn.Set Global Variable    ${last_index}
        WRITE DATA ACTUAL RESULT TO EXCEL    ${Sheetnames}    ${last_index}    ${yaml_title}[${title_column}]    ${data_from_web}
    END


SET DATA ACTUAL RESULT ON EXCEL UPDATE
    [Arguments]     ${Sheetnames}    ${title_column}    ${title_column_stamp}    ${data_from_web}
    BuiltIn.Log    last_index>${last_index}    WARN
    BuiltIn.Log    Now_row>${Now_row}    WARN
    ${last_index}    BuiltIn.Set Variable If    '${last_index}' == 'none'    ${Now_row}    ${last_index}
    BuiltIn.Log    last_index>${last_index}    WARN
    WRITE DATA ACTUAL RESULT TO EXCEL    ${Sheetnames}    ${last_index}    ${yaml_title}[${title_column_stamp}]    ${data_from_web}


WRITE DATA ACTUAL RESULT TO EXCEL
    [Arguments]    ${sheet_name}    ${rows}    ${column}    ${status}    
    Excel_reader.SET DATA FROM EXCEL BY SHEET   ${excel_file}[${Excel_Actual_Result}]   ${sheet_name}    ${rows}    ${column}    ${status}



GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE
    [Arguments]    ${yaml_location}     ${sheets}    ${status_case}    ${menu} 
     
    Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel_file}[${yaml_location}]    ${sheets}

    ${last_index}    BuiltIn.Set Variable   ${count_row_excel_data_actual_result}   
    BuiltIn.Convert To Integer    ${last_index}            
    ${last_index}    BuiltIn.Evaluate    ${last_index} - 1   
 
    FOR     ${index_data}    IN RANGE    0    ${count_row_excel_data_actual_result}   
      
        ${result_state}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][State]    

        IF  '${data_actual_result}[${index_data}][State]' == '${status_case}'
    
            ${Now_row}    BuiltIn.Evaluate    ${index_data} + 2
            BuiltIn.Set Global Variable    ${Now_row}
            BuiltIn.Log    >Now_row>${Now_row}    WARN
             
            IF  '${menu}' == '01_Waive_PNT'

                # ============================
                # Local Variables Zone
                # ============================
                ${Customer_ID}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Customer_ID]
                ${Contract_No}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Contract_No]
                ${Receipt_No}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Receipt_No]
                ${Receipt_Amount}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Receipt_Amount]
                ${Receipt_Date}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Receipt_Date]
                ${Customer_Name}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Customer_Name]
                ${Total_OS_Balance}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Total_OS_Balance]
                ${Total_Penalty}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Total_Penalty]
                ${Waive_Amount}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Waive_Amount]
                ${Request_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][RequestNo]
                ${State}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][State]

                # ============================
                # Global Variables Zone
                # ============================
                BuiltIn.Set Global Variable    ${Customer_ID}
                BuiltIn.Set Global Variable    ${Contract_No}
                BuiltIn.Set Global Variable    ${Receipt_No}
                BuiltIn.Set Global Variable    ${Receipt_Amount}
                BuiltIn.Set Global Variable    ${Receipt_Date}
                BuiltIn.Set Global Variable    ${Customer_Name}
                BuiltIn.Set Global Variable    ${Total_OS_Balance}
                BuiltIn.Set Global Variable    ${Total_Penalty}
                BuiltIn.Set Global Variable    ${Waive_Amount}        
                BuiltIn.Set Global Variable    ${Request_No}        
                BuiltIn.Set Global Variable    ${State}        
                
                # ============================
                # Global Variables Log Zone
                # ============================
                BuiltIn.Log    Global Customer ID > ${Customer_ID}    WARN
                BuiltIn.Log    Global Contract No > ${Contract_No}    WARN
                BuiltIn.Log    Global Receipt No. > ${Receipt_No}    WARN
                BuiltIn.Log    Global Receipt Amount > ${Receipt_Amount}    WARN
                BuiltIn.Log    Global Receipt Date > ${Receipt_Date}    WARN
                BuiltIn.Log    Global Customer Name > ${Customer_Name}    WARN
                BuiltIn.Log    Global Total O/S Balance > ${Total_OS_Balance}    WARN
                BuiltIn.Log    Global Total Penalty > ${Total_Penalty}    WARN
                BuiltIn.Log    Global Waive Amount > ${Waive_Amount}    WARN
                BuiltIn.Log    Global Request No > ${Request_No}    WARN
                BuiltIn.Log    Global State > ${State}    WARN

            ELSE
                BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!! NO DATA TO APPROVE !!!!!!!!!!!!!!!!!!!!!!!!
            END
            BuiltIn.Exit For Loop
            
        ELSE IF  '${result_state}' == '${status_case}' and '${index_data}' == '${last_index}' 
            BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!! CASE OUT OF STOCK ACTUAL FILE !!!!!!!!!!!!!!!!!!!!!!!!  
        END

    END
