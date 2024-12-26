*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore


*** Keywords ***

SET - FORMAT DATA EXCEL - SHEET USER FOR LOGIN
    [Arguments]   ${row}

    ${result_excel_user}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]
    # BuiltIn.Log    ${result_excel_user}    WARN
   
    ${group_user}    BuiltIn.Set Variable   ${result_excel_user}[0]        # แปลง data 
    BuiltIn.Set Global Variable    ${group_user}

    ${keys_group_user}    Common_keyword.GET DATA JSON GET ONLY KEY    ${group_user}    # ส่ง data ไปแปลง เอาแค่ key ออกมาใช้   
    BuiltIn.Set Global Variable    ${keys_group_user}

            

SET - FORMAT DATA EXCEL - SHEET COMPONENT LABEL FOR VERIFY
    [Arguments]   ${row}
    ${result_excel_label}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]

    ${group_label}    BuiltIn.Set Variable   ${result_excel_label}[0]     # แปลง data 
    BuiltIn.Set Global Variable    ${group_label}

    ${keys_group_label}    Common_keyword.GET DATA JSON GET ONLY KEY    ${group_label}    # ส่ง data ไปแปลง เอาแค่ key ออกมาใช้   
    BuiltIn.Set Global Variable    ${keys_group_label}



SET - FORMAT DATA EXCEL - SHEET TITLE TABLE FOR VERIFY
    [Arguments]    ${row}
    ${result_excel_data_label}   JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]

    ${group_data_label}    BuiltIn.Set Variable   ${result_excel_data_label}[0]    # แปลง data
    BuiltIn.Set Global Variable    ${group_data_label}

    ${keys_group_data_label}    Common_keyword.GET DATA JSON GET ONLY KEY    ${group_data_label}    # ส่ง data ไปแปลง เอาแค่ key ออกมาใช้   
    BuiltIn.Set Global Variable    ${keys_group_data_label}


SET - DATA TO EXCEL 
    [Arguments]     ${excel_name}    ${sheet_name}    ${row}    ${column}    ${data}
    Excel_reader.SET DATA FROM EXCEL BY SHEET   file_name=${excel_file}[${excel_name}]   sheet_name=${sheet_name}    row=${row}    column=${column}    data=${data}



GET - DATA FROM EXCEL
    [Arguments]    ${excel_name}    ${sheet_name}
    Excel_reader.GET DATA FROM EXCEL BY SHEET    file_name=${excel_file}[${excel_name}]    sheet_name=${sheet_name}



SET - VERIFY - LABEL
    [Arguments]    ${excel_name}    ${sheet_name}    ${row}
    
    GET - DATA FROM EXCEL    excel_name=${excel_name}    sheet_name=${sheet_name}
    SET - FORMAT DATA EXCEL - SHEET COMPONENT LABEL FOR VERIFY    row=${row}    # get label



SET - VERIFY - TITLE TABLE LABEL 
    [Arguments]   ${excel_name}    ${sheet_name}    ${row}
    GET - DATA FROM EXCEL    excel_name=${excel_name}    sheet_name=${sheet_name}
    SET - FORMAT DATA EXCEL - SHEET TITLE TABLE FOR VERIFY    row=${row}    # get table label


SET - LOGIN
    [Arguments]    ${excel_name}    ${sheet_name}    ${row}   
    GET - DATA FROM EXCEL    excel_name=${excel_name}    sheet_name=${sheet_name}
    SET - FORMAT DATA EXCEL- SHEET USER FOR LOGIN   row=${row}    # get user


GET ID CARD FROM EXCEL DATA STOCK

    ${last_index}    BuiltIn.Set Variable   ${count_row_excel_id_card}       
    BuiltIn.Convert To Integer    ${last_index}           
    ${last_index}    BuiltIn.Evaluate    ${last_index} - 1

    FOR  ${index}    IN RANGE    0    ${count_row_excel_id_card}  + 1  
        ${id_status}    BuiltIn.Set Variable    ${data_stock_id_card}[${index}][ID_CARD_USE/ERROR_MSG]
        IF  '${id_status}' == 'None'  
            BuiltIn.fail   !!!!!!!!!!!!!!!!!!!!!!!! FORGOT SET STATUS CARD IN EXCEL !!!!!!!!!!!!!!!!!!!!!!!!
        ELSE

            IF  '${id_status}' == 'none'
                BuiltIn.Log    ID_CARD->${data_stock_id_card}[${index}][ID_CARD]    WARN
                ${ID_card}    BuiltIn.Set Variable    ${data_stock_id_card}[${index}][ID_CARD]
                ${rows_id_card_data_stock}    BuiltIn.Evaluate     ${index} + 2
                BuiltIn.Set global variable    ${rows_id_card_data_stock}
                BuiltIn.Set global variable    ${ID_card}
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
    BuiltIn.Log    !!rows_id_card_data_stock>${rows_id_card_data_stock}    WARN
    BuiltIn.Log    !!RowStamp_by_case_idcard>${RowStamp_by_case_idcard}    WARN
    ${rows_id_card_data_stock}    BuiltIn.Set Variable If    '${rows_id_card_data_stock}' == 'none'   ${RowStamp_by_case_idcard}    ${rows_id_card_data_stock}
    SET - DATA TO EXCEL    excel_name=${yaml_location}    sheet_name=Data_id_card    row=${rows_id_card_data_stock}    column=2    data=${status}    # fix column 2 cuz status stamp at col 2


GET CARD FROM EXCEL DATA STOCK

    ${last_index}    BuiltIn.Set Variable   ${count_row_excel_card}      
    BuiltIn.Convert To Integer    ${last_index}        
    ${last_index}    BuiltIn.Evaluate    ${last_index} - 1    
    
    FOR  ${index}    IN RANGE    0    ${count_row_excel_card} + 1
        ${card_status}    BuiltIn.Set Variable    ${data_stock_card}[${index}][CARD_USE/ERROR_MSG]    
        IF  '${card_status}' == 'None'  
            BuiltIn.fail   !!!!!!!!!!!!!!!!!!!!!!!! FORGOT SET STATUS CARD IN EXCEL !!!!!!!!!!!!!!!!!!!!!!!!
        ELSE
            IF  '${card_status}' == 'none'
                BuiltIn.Log    CARD_>${data_stock_card}[${index}][CARD]    WARN
                ${card_}    BuiltIn.Set Variable    ${data_stock_card}[${index}][CARD]
                ${card_data_stock}    String.Split String    ${card_}    -
                ${rows_card_data_stock}    BuiltIn.Evaluate     ${index} + 2
                BuiltIn.Set global variable    ${rows_card_data_stock}
                BuiltIn.Set global variable    ${card_data_stock}    # ['6273', '7729', '4500', '1980']
                BuiltIn.Set global variable    ${card_}    # 6273-7729-4500-1980
                BuiltIn.Exit For Loop

            ELSE IF  ('${card_status}' == 'USE' or '${card_status}' == 'PENDING' or '${card_status}' == 'REJECT' or '${card_status}' == 'CANCEL') and '${index}' == '${last_index}' 
                BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!!CARD UMAY+ OUT OF STOCK!!!!!!!!!!!!!!!!!!!!!!!!
            END
        END
    END  



WRITE STATUS DATA STOCK CARD
    [Arguments]    ${yaml_location}    ${status}
    BuiltIn.Log    --------------------------------------    WARN 
    BuiltIn.Log    !!WRITE STATUS DATA STOCK CARD    WARN
    BuiltIn.Log    !!rows_card_data_stock>${rows_card_data_stock}    WARN
    BuiltIn.Log    !!RowStamp_by_case_card>${RowStamp_by_case_card}    WARN

    ${rows_card_data_stock}    BuiltIn.Set Variable If    '${rows_card_data_stock}' == 'none'   ${RowStamp_by_case_card}    ${rows_card_data_stock}
    SET - DATA TO EXCEL    excel_name=${yaml_location}    sheet_name=Data_card    row=${rows_card_data_stock}    column=2    data=${status}    # fix column 2 cuz status stamp at col 2



SET DATA ACTUAL RESULT ON EXCEL INSERT ID NO
    [Arguments]    ${yaml_location}    ${yaml_title}    ${name_sheet}    ${title_column}    ${data_from_web}
    
    # check yaml in case return number column to stamp
    IF  '${yaml_title}' == 'yaml_title_closing'   
        BuiltIn.Log    >Column_stamp_insert>${yaml_title_closing}[${title_column}]    WARN
        ${column_stamp}    BuiltIn.Set Variable    ${yaml_title_closing}[${title_column}]    # insert not same update   
        BuiltIn.Set Global Variable    ${column_stamp}  

    ELSE IF  '${yaml_title}' == 'yaml_title_re_issue' 
        BuiltIn.Log    >Column_stamp_insert>${yaml_title_re_issue}[${title_column}]    WARN
        ${column_stamp}    BuiltIn.Set Variable    ${yaml_title_re_issue}[${title_column}]    # insert not same update   
        BuiltIn.Set Global Variable    ${column_stamp}  

    ELSE IF  '${yaml_title}' == 'yaml_title_update_salary' 
        BuiltIn.Log    >Column_stamp_insert>${yaml_title_update_salary}[${title_column}]    WARN
        ${column_stamp}    BuiltIn.Set Variable    ${yaml_title_update_salary}[${title_column}]    # insert not same update   
        BuiltIn.Set Global Variable    ${column_stamp}  
    END

    Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel_file}[${yaml_location}]    ${name_sheet}

    IF  '${count_row_excel_data_actual_result}' == '0'
        # ครั้ง 1 ชีทว่าง ไม่มี data ไม่มีแถวก่อนหน้าให้เริ่ม write แถวที่ 2 -> แถว 1 เป็นหัว title
        BuiltIn.Log    !!Emty data start write row 2!!    WARN
        ${last_index}    BuiltIn.Evaluate    2
        BuiltIn.Set Global Variable    ${last_index}    # กำหนดเริ่มที่ row 2 
        SET - DATA TO EXCEL    excel_name=${yaml_location}    sheet_name=${name_sheet}    row=${last_index}   column=${column_stamp}    data=${data_from_web}    # fix stat at index 2
        
    ELSE IF  '${count_row_excel_data_actual_result}' != '0'
        # ครั้ง 2 ชีทไม่ว่าง มี data แถวก่อนหน้าให้ write ต่อท้าย
        ${last_index}    BuiltIn.Set Variable   ${count_row_excel_data_actual_result}   
        BuiltIn.Convert To Integer    ${last_index}            
        ${last_index}    BuiltIn.Evaluate    ${last_index} + 2    # last index +2 เพิ่อต่อท้ายได้ถูกแถว
        BuiltIn.Log    !!Append data at row!!->${last_index}    WARN
        BuiltIn.Set Global Variable    ${last_index}    
        SET - DATA TO EXCEL    excel_name=${yaml_location}    sheet_name=${name_sheet}    row=${last_index}    column=${column_stamp}    data=${data_from_web}
    END



SET DATA ACTUAL RESULT ON EXCEL UPDATE
    [Arguments]    ${yaml_location}    ${yaml_title}    ${name_sheet}    ${TC}    ${title_column}    ${title_column_stamp}    ${data_from_web}
    
    # check yaml in case return number column to stamp
    IF  '${yaml_title}' == 'yaml_title_closing'   
        BuiltIn.Log    >Column_stamp_update>${yaml_title_closing}[${title_column_stamp}]    WARN
        ${column_stamp}    BuiltIn.Set Variable    ${yaml_title_closing}[${title_column_stamp}]    # update not same insert       
        BuiltIn.Set Global Variable    ${column_stamp}  

    ELSE IF  '${yaml_title}' == 'yaml_title_re_issue' 
        BuiltIn.Log    >Column_stamp_update>${yaml_title_re_issue}[${title_column_stamp}]    WARN
        ${column_stamp}    BuiltIn.Set Variable    ${yaml_title_re_issue}[${title_column_stamp}]    # update not same insert  
        BuiltIn.Set Global Variable    ${column_stamp}  

    ELSE IF  '${yaml_title}' == 'yaml_title_update_salary' 
        BuiltIn.Log    >Column_stamp_update>${yaml_title_update_salary}[${title_column_stamp}]    WARN
        ${column_stamp}    BuiltIn.Set Variable    ${yaml_title_update_salary}[${title_column_stamp}]    # update not same insert  
        BuiltIn.Set Global Variable    ${column_stamp}  
    END

    # เอาไว้ใช้สำหรับการ stamp success
    ${last_index}    BuiltIn.Set Variable If    '${last_index}' == 'none'   ${Now_row}    ${last_index}
    BuiltIn.Log    --------------------------------------    WARN
    BuiltIn.Log    >!! WRITE EXCEL !!<    WARN
    BuiltIn.Log    >last_index:${last_index}    WARN
    BuiltIn.Log    >Sheet_name:${name_sheet}    WARN
    BuiltIn.Log    >TC:${TC}    WARN
    BuiltIn.Log    >title_append:${title_column}    WARN
    BuiltIn.Log    >title_at_stamp:${title_column_stamp}    WARN
    BuiltIn.Log    >Data_stamp:${data_from_web}    WARN
    SET - DATA TO EXCEL    excel_name=${yaml_location}    sheet_name=${name_sheet}    row=${last_index}    column=${column_stamp}    data=${data_from_web}



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
             
            IF  '${menu}' == 're-issue'
                ${TC}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][TC]
                ${ID_Number}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][ID_Number]
                ${Customer_Name}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Customer_Name]
                ${Contract_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Contract_No]
                ${Status}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Status]
                ${Card_Type}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Card_Type]
                ${Card_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Card_No]
                ${Due_Date}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Due_Date]
                ${Printer_Name}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Printer_Name]
                ${Credit_Limit}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Credit_Limit]
                ${Credite_Available}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Credite_Available]
                ${RL_Limit}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][RL_Limit]
                ${RL_Available}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][RL_Available]
                ${Outstanding_Bal}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Outstanding_Bal]
                ${Slide_Card}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Slide_Card]
                ${Re_Entry_Crad_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Re_Entry_Crad_No]
                ${Request_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Request_No]
                ${Receive_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Receive_No]
                ${State}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][State]
                ${RowStamp_by_case_idcard}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Row_id_card]

                BuiltIn.Set global Variable    ${TC}                   
                BuiltIn.Set global Variable    ${ID_Number}            
                BuiltIn.Set global Variable    ${Customer_Name}        
                BuiltIn.Set global Variable    ${Contract_No}          
                BuiltIn.Set global Variable    ${Status}               
                BuiltIn.Set global Variable    ${Card_Type}            
                BuiltIn.Set global Variable    ${Card_No}              
                BuiltIn.Set global Variable    ${Due_Date}             
                BuiltIn.Set global Variable    ${Printer_Name}         
                BuiltIn.Set global Variable    ${Credit_Limit}         
                BuiltIn.Set global Variable    ${Credite_Available}    
                BuiltIn.Set global Variable    ${RL_Limit}             
                BuiltIn.Set global Variable    ${RL_Available}         
                BuiltIn.Set global Variable    ${Outstanding_Bal}      
                BuiltIn.Set global Variable    ${Slide_Card}           
                BuiltIn.Set global Variable    ${Re_Entry_Crad_No}     
                BuiltIn.Set global Variable    ${Request_No}           
                BuiltIn.Set global Variable    ${Receive_No}           
                BuiltIn.Set global Variable    ${State}             
                BuiltIn.Set global Variable    ${RowStamp_by_case_idcard}             
                BuiltIn.Set global Variable    ${RowStamp_by_case_card}             
                
                BuiltIn.Log    --------------------------------------    WARN   
                BuiltIn.Log    TC>${TC}    WARN   
                BuiltIn.Log    ID_Number>${ID_Number}    WARN   
                BuiltIn.Log    Customer_Name>${Customer_Name}    WARN   
                BuiltIn.Log    Contract_No>${Contract_No}    WARN   
                BuiltIn.Log    Status>${Status}    WARN   
                BuiltIn.Log    Card_Type>${Card_Type}    WARN   
                BuiltIn.Log    Card_No>${Card_No}    WARN   
                BuiltIn.Log    Due_Date>${Due_Date}    WARN   
                BuiltIn.Log    Printer_Name>${Printer_Name}    WARN   
                BuiltIn.Log    Credit_Limit>${Credit_Limit}    WARN   
                BuiltIn.Log    Credite_Available>${Credite_Available} WARN   
                BuiltIn.Log    RL_Limit>${RL_Limit}    WARN   
                BuiltIn.Log    RL_Available>${RL_Available}    WARN   
                BuiltIn.Log    Outstanding_Bal>${Outstanding_Bal}   WARN   
                BuiltIn.Log    Slide_Card>${Slide_Card}    WARN   
                BuiltIn.Log    Re_Entry_Crad_No>${Re_Entry_Crad_No}  WARN   
                BuiltIn.Log    Request_No>${Request_No}    WARN   
                BuiltIn.Log    Receive_No>${Receive_No}    WARN   
                BuiltIn.Log    State>${State}    WARN
                BuiltIn.Log    RowStamp_by_case_idcard>${RowStamp_by_case_idcard}    WARN
                BuiltIn.Log    RowStamp_by_case_idcard>${RowStamp_by_case_card}    WARN

            ELSE IF  '${menu}' == 'closing'

                ${TC}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][TC]
                ${ID_Number}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][ID_Number]
                ${Customer_Name}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Customer_Name]
                ${Contract_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Contract_No]
                ${Status}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Status]
                ${Card_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Card_No]
                ${Due_Date}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Due_Date]
                ${Credit_Limit}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Credit_Limit]
                ${Credite_Available}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Credite_Available]
                ${RL_Limit}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][RL_Limit]
                ${RL_Available}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][RL_Available]
                ${Outstanding_Bal}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Outstanding_Bal]
                ${Duty_Bureau}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Duty_Bureau]
                ${Payment_Fee}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Payment_Fee]
                ${Re_issue_Fee}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Re_issue_Fee]
                ${Handling_Fee}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Handling_Fee]
                ${Transaction_Fee}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Transaction_Fee]
                ${Transaction_Check_up}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Transaction_Check_up]
                ${AR2_Fee}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][AR2_Fee]
                ${Request_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Request_No]
                ${State}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][State]
                ${RowStamp_by_case_idcard}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Row_id_card]
                ${RowStamp_by_case_card}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Row_card]

                BuiltIn.Set global Variable    ${TC}                   
                BuiltIn.Set global Variable    ${ID_Number}            
                BuiltIn.Set global Variable    ${Customer_Name}        
                BuiltIn.Set global Variable    ${Contract_No}          
                BuiltIn.Set global Variable    ${Status}                         
                BuiltIn.Set global Variable    ${Card_No}              
                BuiltIn.Set global Variable    ${Due_Date}                   
                BuiltIn.Set global Variable    ${Credit_Limit}         
                BuiltIn.Set global Variable    ${Credite_Available}    
                BuiltIn.Set global Variable    ${RL_Limit}             
                BuiltIn.Set global Variable    ${RL_Available}         
                BuiltIn.Set global Variable    ${Outstanding_Bal}      
                BuiltIn.Set global Variable    ${Duty_Bureau}           
                BuiltIn.Set global Variable    ${Payment_Fee}     
                BuiltIn.Set global Variable    ${Re_issue_Fee}           
                BuiltIn.Set global Variable    ${Handling_Fee}           
                BuiltIn.Set global Variable    ${Transaction_Fee}           
                BuiltIn.Set global Variable    ${Transaction_Check_up}           
                BuiltIn.Set global Variable    ${AR2_Fee}           
                BuiltIn.Set global Variable    ${Request_No}           
                BuiltIn.Set global Variable    ${State}             
                BuiltIn.Set global Variable    ${RowStamp_by_case_idcard}             
                BuiltIn.Set global Variable    ${RowStamp_by_case_card}             
                
                BuiltIn.Log    --------------------------------------    WARN 
                BuiltIn.Log    TC>${TC}    WARN   
                BuiltIn.Log    ID_Number>${ID_Number}    WARN   
                BuiltIn.Log    Customer_Name>${Customer_Name}     WARN   
                BuiltIn.Log    Contract_No>${Contract_No}    WARN   
                BuiltIn.Log    Status>${Status}    WARN   
                BuiltIn.Log    Card_No>${Card_No}    WARN   
                BuiltIn.Log    Due_Date>${Due_Date}    WARN   
                BuiltIn.Log    Credit_Limit>${Credit_Limit}      WARN   
                BuiltIn.Log    Credite_Available>${Credite_Available} WARN   
                BuiltIn.Log    RL_Limit>${RL_Limit}    WARN   
                BuiltIn.Log    RL_Available>${RL_Available}      WARN   
                BuiltIn.Log    Outstanding_Bal>${Outstanding_Bal}   WARN   
                BuiltIn.Log    Duty_Bureau>${Duty_Bureau}        WARN   
                BuiltIn.Log    Payment_Fee>${Payment_Fee}  WARN   
                BuiltIn.Log    Re_issue_Fee>${Re_issue_Fee}    WARN   
                BuiltIn.Log    Handling_Fee>${Handling_Fee}    WARN   
                BuiltIn.Log    Transaction_Fee>${Transaction_Fee}    WARN   
                BuiltIn.Log    Transaction_Check_up>${Transaction_Check_up}    WARN   
                BuiltIn.Log    AR2_Fee>${AR2_Fee}    WARN   
                BuiltIn.Log    Request_No>${Request_No}    WARN   
                BuiltIn.Log    State>${State}    WARN
                BuiltIn.Log    RowStamp_by_case_idcard>${RowStamp_by_case_idcard}    WARN
                BuiltIn.Log    RowStamp_by_case_card>${RowStamp_by_case_card}    WARN
            
            ELSE IF  '${menu}' == 'update-salary'

                ${TC}    BuiltIn.Set Variable    ${data_actual_result}[${index_data}][TC]
                ${ID_Number}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][ID_Number]
                ${Customer_Name}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Customer_Name]
                ${Contract_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Contract_No]
                ${State}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][State]
                ${Request_No}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Request_No]
                ${RowStamp_by_case_idcard}   BuiltIn.Set Variable    ${data_actual_result}[${index_data}][Row_id_card]

                BuiltIn.Set global Variable    ${TC}                   
                BuiltIn.Set global Variable    ${ID_Number}            
                BuiltIn.Set global Variable    ${Customer_Name}        
                BuiltIn.Set global Variable    ${Contract_No}          
                BuiltIn.Set global Variable    ${State}                         
                BuiltIn.Set global Variable    ${Request_No}           
                BuiltIn.Set global Variable    ${RowStamp_by_case_idcard}             
                
                BuiltIn.Log    --------------------------------------    WARN 
                BuiltIn.Log    TC>${TC}    WARN   
                BuiltIn.Log    ID_Number>${ID_Number}    WARN   
                BuiltIn.Log    Customer_Name>${Customer_Name}     WARN   
                BuiltIn.Log    Contract_No>${Contract_No}    WARN   
                BuiltIn.Log    State>${State}    WARN   
                BuiltIn.Log    Request_No>${Request_No}    WARN   
                BuiltIn.Log    RowStamp_by_case_idcard>${RowStamp_by_case_idcard}    WARN
            
            ELSE
                BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!! NO DATA TO APPROVE !!!!!!!!!!!!!!!!!!!!!!!!
            END
            BuiltIn.Exit For Loop
            
        ELSE IF  '${result_state}' == '${status_case}' and '${index_data}' == '${last_index}' 
            BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!!CASE OUT OF STOCK ACTUAL FILE!!!!!!!!!!!!!!!!!!!!!!!!    
        END

    END
