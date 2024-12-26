*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

${rows}
${TC_no}    
${ID_no}    
${date_app}    	
${branch}    
${app_no}    	
${card}
${campaign}
${state}
${Excel_Actual_Result}
${Excel_Data_Stock_YAML}

*** Keywords ***

# KEY 1
GET ID CARD FROM EXCEL DATA STOCK

    ${last_index}    BuiltIn.Set Variable   ${count_row_excel_id_card}       
    BuiltIn.Convert To Integer    ${last_index}           
    ${last_index}    BuiltIn.Evaluate    ${last_index} - 1

    FOR  ${index}    IN RANGE    0    ${count_row_excel_id_card}  + 1  
        ${id_status}    BuiltIn.Set Variable    ${RL_data_stock_id_card}[${index}][ID_CARD_USE/ERROR_MSG]  

        IF  '${id_status}' == 'none'
            BuiltIn.Log    ID_CARD->${RL_data_stock_id_card}[${index}][ID_CARD]    WARN
            ${ID_no}    BuiltIn.Set Variable    ${RL_data_stock_id_card}[${index}][ID_CARD]
            ${rows_id_card_data_stock}    BuiltIn.Evaluate     ${index} + 2
            BuiltIn.Set global variable    ${rows_id_card_data_stock}
            BuiltIn.Set global variable    ${ID_no}
            BuiltIn.Exit For Loop

        ELSE IF  ('${id_status}' == 'USE' or '${id_status}' == 'PENDING' or '${id_status}' == 'REJECT' or '${id_status}' == 'CANCEL') and '${index}' == '${last_index}' 
            BuiltIn.fail   !!!!!!!!!!!!!!!!!!!!!!!!ID_CARD OUT OF STOCK!!!!!!!!!!!!!!!!!!!!!!!!
        END
    END


GET BARCODE FROM EXCEL DATA STOCK
    
    ${last_index}    BuiltIn.Set Variable   ${count_row_excel_barcode}        
    BuiltIn.Convert To Integer    ${last_index}            
    ${last_index}    BuiltIn.Evaluate    ${last_index} - 1    

    FOR  ${index}    IN RANGE    0    ${count_row_excel_barcode}  + 1 
        ${barcode_status}    BuiltIn.Set Variable    ${RL_data_stock_barcode}[${index}][BARCODE_USE/ERROR_MSG]    

        IF  '${barcode_status}' == 'none'
            BuiltIn.Log    BARCODE->${RL_data_stock_barcode}[${index}][BARCODE]    WARN
            ${barcode}    BuiltIn.Set Variable    ${RL_data_stock_barcode}[${index}][BARCODE]    
            ${rows_barcode_data_stock}    BuiltIn.Evaluate     ${index} + 2
            BuiltIn.Set global variable    ${rows_barcode_data_stock}
            BuiltIn.Exit For Loop
        ELSE IF  ('${barcode_status}' == 'USE' or '${barcode_status}' == 'PENDING' or '${barcode_status}' == 'REJECT' or '${barcode_status}' == 'CANCEL') and '${index}' == '${last_index}' 
            BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!!BARCODE OUT OF STOCK!!!!!!!!!!!!!!!!!!!!!!!!
        END
    END

    RETURN    ${barcode}


GET CARD UMAY+ FROM EXCEL DATA STOCK

    ${last_index}    BuiltIn.Set Variable   ${count_row_excel_card_Umay+}      
    BuiltIn.Convert To Integer    ${last_index}        
    ${last_index}    BuiltIn.Evaluate    ${last_index} - 1    
    
    FOR  ${index}    IN RANGE    0    ${count_row_excel_card_Umay+} + 1
        ${card_Umay_status}    BuiltIn.Set Variable    ${RL_data_stock_card_Umay+}[${index}][CARD_UMAY+_USE/ERROR_MSG]    
  
        IF  '${card_Umay_status}' == 'none'
            BuiltIn.Log    CARD_>${RL_data_stock_card_Umay+}[${index}][CARD_UMAY+]    WARN
            ${card_umay+}    BuiltIn.Set Variable    ${RL_data_stock_card_Umay+}[${index}][CARD_UMAY+]
            ${card_umay_data_stock}    String.Split String    ${card_Umay+}    -
            ${rows_card_umay+_data_stock}    BuiltIn.Evaluate     ${index} + 2
            BuiltIn.Set global variable    ${rows_card_umay+_data_stock}
            BuiltIn.Set global variable    ${card_umay_data_stock}    # ['6273', '7729', '4500', '1980']
            BuiltIn.Set global variable    ${card_umay+}    # 6273-7729-4500-1980
            BuiltIn.Exit For Loop

        ELSE IF  ('${card_Umay_status}' == 'USE' or '${card_Umay_status}' == 'PENDING' or '${card_Umay_status}' == 'REJECT' or '${card_Umay_status}' == 'CANCEL') and '${index}' == '${last_index}' 
            BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!!CARD UMAY+ OUT OF STOCK!!!!!!!!!!!!!!!!!!!!!!!!
        END
    END  


GET CARD UMAY+ PREMIRE FROM EXCEL DATA STOCK
    
    ${last_index}    BuiltIn.Set Variable   ${count_row_excel_card_Umay+_Premire}   
    BuiltIn.Convert To Integer    ${last_index}            
    ${last_index}    BuiltIn.Evaluate    ${last_index} - 1   

    FOR  ${index}    IN RANGE    0    ${count_row_excel_card_Umay+_Premire} + 1
        ${card_Umay_Premire_status}    BuiltIn.Set Variable    ${RL_data_stock_card_Umay+_Premire}[${index}][CARD_UMAY+_PREMIRE_USE/ERROR_MSG]    
    
        IF  '${card_Umay_Premire_status}' == 'none'

            BuiltIn.Log    CARD_>${RL_data_stock_card_Umay+_Premire}[${index}][CARD_UMAY+_PREMIRE]    WARN
            ${card_umay+_premire}    BuiltIn.Set Variable    ${RL_data_stock_card_Umay+_Premire}[${index}][CARD_UMAY+_PREMIRE]
            ${card_umay_data_stock}    String.Split String    ${card_umay+_premire}    -
            ${rows_card_umay+_premire_data_stock}    BuiltIn.Evaluate     ${index} + 2
            BuiltIn.Set global variable    ${rows_card_umay+_premire_data_stock}
            BuiltIn.Set global variable    ${card_umay_data_stock}    # ['6273', '7729', '4500', '1980']
            BuiltIn.Set global variable    ${card_umay+_premire}    # 6273-7729-4500-1980
            BuiltIn.Exit For Loop

        ELSE IF  ('${card_Umay_Premire_status}' == 'USE' or '${card_Umay_Premire_status}' == 'PENDING' or '${card_Umay_Premire_status}' == 'REJECT' or '${card_Umay_Premire_status}' == 'CANCEL') and '${index}' == '${last_index}' 
            BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!!CARD UMAY+ PREMIRE OUT OF STOCK!!!!!!!!!!!!!!!!!!!!!!!!    
        END
    END 


WRITE APPLICATION NUMBER TO DATA STOCK
    [Arguments]    ${app_no}
    
    WRITE STATUS DATA STOCK TO EXCEL    Data_id_card    ${rows_id_card_data_stock}    ${data_stock_yaml}[index_column_application_no]    ${app_no}


WRITE STATUS DATA STOCK ID NO AND CARD
    [Arguments]    ${card_type}    ${status}

    IF  '${card_type}' == 'umay_card'
        BuiltIn.Log    !!STAMP CARD AT>${card_type}>AND ROW>${rows_card_umay+_data_stock}>AND STATUS>${status}    WARN
        WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+    ${rows_card_umay+_data_stock}    2    ${status}
    END

    IF  '${card_type}' == 'premier_card'
        BuiltIn.Log    !!STAMP CARD AT>${card_type}>AND ROW>${rows_card_umay+_premire_data_stock}>AND STATUS> ${status}    WARN
        WRITE STATUS DATA STOCK TO EXCEL    Data_card_Umay+_Premire    ${rows_card_umay+_premire_data_stock}    2    ${status}
    END


WRITE STATUS DATA STOCK TO EXCEL
    [Arguments]    ${sheet_name}    ${rows}    ${column}    ${status}    
    
    SET DATA STOCK YAML NAME
    BuiltIn.Log    !!RUN OPTION->${run_option}    WARN
    IF  '${run_option}' == 'Normal'    
        Common_keyword.WRITE DATA TO EXCEL    ${excel}[${Excel_Data_Stock_YAML}]    ${sheet_name}    ${rows}    ${column}    ${status}
    ELSE IF  '${run_option}' == 'GNO'
        Common_keyword.WRITE DATA TO EXCEL    ${excel}[${Excel_Data_Stock_YAML}]    ${sheet_name}    ${rows}    ${column}    ${status}
    END


WRITE DATA ACTUAL RESULT TO EXCEL
    [Arguments]    ${sheet_name}    ${rows}    ${column}    ${status}    

    Common_keyword.WRITE DATA TO EXCEL    ${excel}[${Excel_Actual_Result}]    ${sheet_name}    ${rows}    ${column}    ${status}


SET TAGS TO STRING AND CONTAIN DATA
    [Arguments]     ${list_data}    ${contain_data}

    ${Data_string}    Evaluate    " ".join(${list_data}) if isinstance(${list_data}, list) else str(${list_data})
    ${Contains_target_status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Contain    ${Data_string}    ${contain_data}
    BuiltIn.Log    Contains: ${contain_data}, Target Status: ${contains_target_status}    WARN
    RETURN    ${Contains_target_status}


SET ACTUAL RESULT NAME
    [Arguments]     ${list_data}=${TEST TAGS}

    ${Tags_Rank}            BuiltIn.Set Variable   RANK
    ${Tags_Step}            BuiltIn.Set Variable   STEP
    ${Tags_GNO}             BuiltIn.Set Variable   GNO
    ${Excel_Actual_Rank}    BuiltIn.Set Variable   RL_Actual_result_rank_yaml
    ${Excel_Actual_Step}    BuiltIn.Set Variable   RL_Actual_result_step_yaml
    ${Excel_Actual_GNO}     BuiltIn.Set Variable   RL_Actual_result_gno_yaml

    # Contain
    ${Status_Rank}    SET TAGS TO STRING AND CONTAIN DATA    ${list_data}    ${Tags_Rank}   
    ${Status_Step}    SET TAGS TO STRING AND CONTAIN DATA    ${list_data}    ${Tags_Step}   
    ${Status_GNO}     SET TAGS TO STRING AND CONTAIN DATA    ${list_data}    ${Tags_GNO} 

    # Set global excel name
    BuiltIn.Run Keyword If    '${Status_Rank}' == 'True'    BuiltIn.Set Global Variable    ${Excel_Actual_Result}    ${Excel_Actual_Rank}   
    BuiltIn.Run Keyword If    '${Status_Step}' == 'True'    BuiltIn.Set Global Variable    ${Excel_Actual_Result}    ${Excel_Actual_Step}   
    BuiltIn.Run Keyword If    '${Status_GNO}' == 'True'     BuiltIn.Set Global Variable    ${Excel_Actual_Result}    ${Excel_Actual_GNO}   
    BuiltIn.Log    Excel: ${Excel_Actual_Result}    WARN


SET DATA STOCK YAML NAME
    [Arguments]     ${list_data}=${TEST TAGS}

    ${Tags_Data_Stock_Rank}     BuiltIn.Set Variable   RANK
    ${Tags_Data_Stock_Step}     BuiltIn.Set Variable   STEP
    ${Tags_Data_Stock_GNO}      BuiltIn.Set Variable   GNO

    ${Excel_Data_Stock_Rank}    BuiltIn.Set Variable   RL_data_stock_yaml
    ${Excel_Data_Stock_Step}    BuiltIn.Set Variable   RL_data_stock_step_yaml
    ${Excel_Data_Stock_GNO}     BuiltIn.Set Variable   RL_data_stock_gno_yaml

    # Contain 
    ${Status_Data_Stock_Rank}    SET TAGS TO STRING AND CONTAIN DATA    ${list_data}    ${Tags_Data_Stock_Rank}
    ${Status_Data_Stock_Step}    SET TAGS TO STRING AND CONTAIN DATA    ${list_data}    ${Tags_Data_Stock_Step}
    ${Status_Data_Stock_GNO}     SET TAGS TO STRING AND CONTAIN DATA    ${list_data}    ${Tags_Data_Stock_GNO}

    # Set global data stock name
    BuiltIn.Run Keyword If    '${Status_Data_Stock_Rank}' == 'True'    BuiltIn.Set Global Variable    ${Excel_Data_Stock_YAML}    ${Excel_Data_Stock_Rank}
    BuiltIn.Run Keyword If    '${Status_Data_Stock_Step}' == 'True'    BuiltIn.Set Global Variable    ${Excel_Data_Stock_YAML}    ${Excel_Data_Stock_Step}
    BuiltIn.Run Keyword If    '${Status_Data_Stock_GNO}' == 'True'     BuiltIn.Set Global Variable    ${Excel_Data_Stock_YAML}    ${Excel_Data_Stock_GNO}

    BuiltIn.Log    Data Stock: ${Excel_Data_Stock_YAML}    WARN


SET DATA ACTUAL RESULT ON EXCEL INSERT ID NO
    [Arguments]     ${test_case}    ${title_column}    ${data_from_web}
     
    SET ACTUAL RESULT NAME
    Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel}[${Excel_Actual_Result}]    ${test_case}
   
    IF  '${count_row_excel_data_actual_result}' == '0'
        # ครั้ง 1 ชีทว่าง ไม่มี data ไม่มีแถวก่อนหน้าให้เริ่ม write แถวที่ 2 -> แถว 1 เป็นหัว title
        BuiltIn.Log    !!Emty data start write row 2!!    WARN
        WRITE DATA ACTUAL RESULT TO EXCEL    sheet_name=${test_case}    rows=2   column=${yaml_title}[${title_column}]    status=${data_from_web}    # fix stat at index 2
    ELSE
        # ครั้ง 2 ชีทไม่ว่าง มี data แถวก่อนหน้าให้ write ต่อท้าย
        ${last_index}    BuiltIn.Set Variable   ${count_row_excel_data_actual_result}    # แถวเป็น string    
        BuiltIn.Convert To Integer    ${last_index}    # แถวเป็น แปลงเป็น int เพื่อเอาไป + ได้           
        ${last_index}    BuiltIn.Evaluate    ${last_index} + 2    # last index +2 เพิ่อต่อท้ายได้ถูกแถว
        BuiltIn.Log    !!Append data at row!!->${last_index}    WARN
        WRITE DATA ACTUAL RESULT TO EXCEL    sheet_name=${test_case}    rows=${last_index}    column=${yaml_title}[${title_column}]    status=${data_from_web}
    END


SET DATA ACTUAL RESULT ON EXCEL UPDATE
    [Arguments]     ${test_case}    ${ID_no}    ${title_column}    ${title_column_stamp}    ${data_from_web}
     
    SET ACTUAL RESULT NAME
    Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel}[${Excel_Actual_Result}]    ${test_case}
 
    # loop เอาค่ามาเช็คว่า สิ่งที่ส่งมา มีอยู่ใน excel และตรงกัน
    FOR     ${index_data}    IN RANGE    0    ${count_row_excel_data_actual_result}   
        # ทำเคสที่ตรงกับ สิ่งที่เราอัพเดจ โดยเช็คจาก ID_no นั้นเพิ่อที่จะคืนค่า row ออกมาว่าคือ row ไหนเพื่อที่จะใช้ write กลับได้ตรง
        IF  '${RL_excel_data_actual_result}[${index_data}][${title_column}]' == '${ID_no}'    
            ${rows}    BuiltIn.Evaluate    ${index_data} + 2    # เอาแถวที่ คืนออกมา + 2 
            WRITE DATA ACTUAL RESULT TO EXCEL    sheet_name=${test_case}    rows=${rows}    column=${yaml_title}[${title_column_stamp}]    status=${data_from_web}
        END

    END


GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE
    [Arguments]     ${test_case}    ${state_case}
     
    Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel}[${Excel_Actual_Result}]    ${test_case}

    ${last_index}    BuiltIn.Set Variable   ${count_row_excel_data_actual_result}   
    BuiltIn.Convert To Integer    ${last_index}            
    ${last_index}    BuiltIn.Evaluate    ${last_index} - 1   
 
    FOR     ${index_data}    IN RANGE    0    ${count_row_excel_data_actual_result}   
      
        ${result_state}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][State]    

        IF  '${result_state}' == '${state_case}'

            ${TC_no}       BuiltIn.Set Variable    ${test_case}
            ${state}       BuiltIn.Set Variable    ${result_state}
            ${ID_no}       BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][ID_no]	
            ${date_app}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][Date]	
            ${branch}      BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][Branch]	
            ${app_no}      BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][App_no]
            ${card}        BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][Card]
            ${campaign}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][Campaign]

            BuiltIn.Set global Variable    ${TC_no}    
            BuiltIn.Set global Variable    ${ID_no}    
            BuiltIn.Set global Variable    ${date_app}    	
            BuiltIn.Set global Variable    ${branch}    
            BuiltIn.Set global Variable    ${app_no}    	
            BuiltIn.Set global Variable    ${card}
            BuiltIn.Set global Variable    ${campaign}
            BuiltIn.Set global Variable    ${state}

            BuiltIn.Log    PASS_>${TC_no}    WARN    
            BuiltIn.Log    PASS_>${ID_no}    WARN        
            BuiltIn.Log    PASS_>${date_app}    WARN    	
            BuiltIn.Log    PASS_>${branch}    WARN    
            BuiltIn.Log    PASS_>${app_no}    WARN    	
            BuiltIn.Log    PASS_>${card}    WARN   
            BuiltIn.Log    PASS_>${campaign}    WARN   
            BuiltIn.Log    PASS_>${state}    WARN   
            BuiltIn.Log    ---------------------    WARN
            BuiltIn.Exit For Loop
            
        ELSE IF  '${result_state}' == '${state_case}' and '${index_data}' == '${last_index}' 
            BuiltIn.fail    !!!!!!!!!!!!!!!!!!!!!!!!CASE OUT OF STOCK ACTUAL FILE!!!!!!!!!!!!!!!!!!!!!!!!    
        END

    END