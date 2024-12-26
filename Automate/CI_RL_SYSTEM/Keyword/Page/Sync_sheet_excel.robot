*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot

*** Variables ***
# User_RL
${data_user_rl}

${data_keyinstep1_virual}
${data_keyinstep1_umay}

${data_recheck_keyinstep1}
${data_keyinstep2}
${data_keyinstep_title_branch}
${data_keyinstep1_title_umaycard}
${data_keyinstep1_verify_menu}
${data_keyinstep1_verify_title_manage}
${data_keyinstep1_verify_virual}
${data_verify_recheck_keyinstep1}
${data_verify_popup_alllocate}
${data_verify_checkoffice_keyinstep2}
${data_verify_keyinstep2_main_title}
${data_verify_keyinstep2_title}
${data_verify_keyinstep2_title_orther}
${data_step_verify_viewcustomer}
${data_step_verify_call}
${data_step_verify_judment}
${data_Step_shouldbe_viewcustomer}
${data_step_shouldbe_ver_verifycall}
${data_verify_condition}

# sheet Auto rejcet 
${data_keyinstep1_virual_auto_reject}
${data_keyinstep1_umay_auto_reject}
${Virual_Card_error_message}
${Umay+_Card_error_message}

# Migrate Apply Process RL
${RL_migrate_apply_process_RL_F_0001}
${RL_migrate_apply_process_RL_F_0007}
${RL_migrate_apply_process_RL_F_0016}
${RL_migrate_apply_process_RL_F_0016_speed_time}
${RL_migrate_apply_process_RL_F_0021}
${RL_migrate_apply_process_RL_F_0025}
${RL_migrate_apply_process_RL_F_0037}

# sheet pending
${data_keyinstep1_virual_umay_card}
${data_keyinstep1_virual_premier_card}
${data_keyinstep1_umay_card}
${data_keyinstep1_premier_card}

# data stock
${RL_data_stock_id_card}
${count_row_excel_id_card}
${RL_data_stock_barcode}
${count_row_excel_barcode}
${RL_data_stock_card_Umay+}
${count_row_excel_card_Umay+}
${RL_data_stock_card_Umay+_Premire}
${count_row_excel_card_Umay+_Premire}

# data matrix
${data_matrix_test_case}

# data actual result
${excel_data_actual_result}         
${RL_excel_data_actual_result}   
${count_row_excel_data_actual_result}    
        
*** Keywords ***
GET USER LOGIN
    [Arguments]     ${excel}

    ${data_excel}    reader.Read and set value from excel new     ${share_drive}${excel}     USER_RL    
    ${data_user_rl}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable    ${data_user_rl}

GET USER GNO LOGIN
    [Arguments]     ${excel}

    ${data_excel}    reader.Read and set value from excel new     ${share_drive}${excel}     USER_RL_GNO    
    ${data_user_rl}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable    ${data_user_rl}

GET USER STEP BY STEP LOGIN
    [Arguments]     ${excel}

    ${data_excel}    reader.Read and set value from excel new     ${share_drive}${excel}     USER_RL_STEP
    ${data_user_rl}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable    ${data_user_rl}

GET ALL DATA FROM EXCEL
    [Arguments]     ${excel}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     KeyInStep1_Virtual_Card
    ${data_keyinstep1_virual}    BuiltIn.Set Variable      ${data_excel}[0]    
    BuiltIn.Set global Variable      ${data_keyinstep1_virual}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Keyinstep_1_Card
    ${data_keyinstep1_umay}    BuiltIn.Set Variable      ${data_excel}[0]     
    BuiltIn.Set global Variable      ${data_keyinstep1_umay}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Recheck_Key1
    ${data_recheck_keyinstep1}    BuiltIn.Set Variable      ${data_excel}[0] 
    BuiltIn.Set global Variable      ${data_recheck_keyinstep1}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Keyinstep_2
    ${data_keyinstep2}    BuiltIn.Set Variable      ${data_excel}[0] 
    BuiltIn.Set global Variable      ${data_keyinstep2}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     SelectBranch_Verify
    ${data_keyinstep_title_branch}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep_title_branch}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Key1_Verify
    ${data_keyinstep1_title_umaycard}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep1_title_umaycard}   

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Key1_Verify_Menu
    ${data_keyinstep1_verify_menu}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep1_verify_menu} 

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_ManageApp
    ${data_keyinstep1_verify_title_manage}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep1_verify_title_manage}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Virual
    ${data_keyinstep1_verify_virual}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep1_verify_virual}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Recheck
    ${data_verify_recheck_keyinstep1}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_recheck_keyinstep1}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Popup_Alllocate
    ${data_verify_popup_alllocate}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_popup_alllocate}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Check_Office
    ${data_verify_checkoffice_keyinstep2}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_checkoffice_keyinstep2}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Key2_Main
    ${data_verify_keyinstep2_main_title}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_keyinstep2_main_title}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Key2_Title
    ${data_verify_keyinstep2_title}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_keyinstep2_title}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Key2_Orther
    ${data_verify_keyinstep2_title_orther}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_keyinstep2_title_orther}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_ViewCustomer
    ${data_step_verify_viewcustomer}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_step_verify_viewcustomer}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Call
    ${data_step_verify_call}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_step_verify_call}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Judment
    ${data_step_verify_judment}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_step_verify_judment}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Ver_Viewcustomer
    ${data_Step_shouldbe_viewcustomer}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_Step_shouldbe_viewcustomer}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Ver_Verifycall
    ${data_step_shouldbe_ver_verifycall}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_step_shouldbe_ver_verifycall}


GET ALL DATA FROM EXCEL AUTO REJECT
    [Arguments]     ${excel}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Virual_Card
    ${data_keyinstep1_virual_auto_reject}    BuiltIn.Set Variable      ${data_excel}[0]   
    BuiltIn.Set global Variable      ${data_keyinstep1_virual_auto_reject}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Umay+_Card
    ${data_keyinstep1_umay_auto_reject}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep1_umay_auto_reject}
        

GET ALL DATA FROM EXCEL VALIDATE FIELD
    [Arguments]     ${excel}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Virual_Card_error_message
    ${Virual_Card_error_message}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${Virual_Card_error_message}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Umay+_Card_error_message
    ${Umay+_Card_error_message}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${Umay+_Card_error_message}


GET ALL DATA FROM EXCEL VERIFY CONDITION
    [Arguments]     ${excel}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     KeyInStep1_Virtual_Card
    ${data_keyinstep1_virual}    BuiltIn.Set Variable      ${data_excel}[0]    
    BuiltIn.Set global Variable      ${data_keyinstep1_virual}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Keyinstep_1_Card
    ${data_keyinstep1_umay}    BuiltIn.Set Variable      ${data_excel}[0]     
    BuiltIn.Set global Variable      ${data_keyinstep1_umay}
    
    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Recheck_Key1
    ${data_recheck_keyinstep1}    BuiltIn.Set Variable      ${data_excel}[0] 
    BuiltIn.Set global Variable      ${data_recheck_keyinstep1}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Keyinstep_2
    ${data_keyinstep2}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep2}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     SelectBranch_Verify
    ${data_keyinstep_title_branch}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep_title_branch}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Key1_Verify
    ${data_keyinstep1_title_umaycard}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep1_title_umaycard}   

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Virual
    ${data_keyinstep1_verify_virual}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep1_verify_virual}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Recheck
    ${data_verify_recheck_keyinstep1}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_recheck_keyinstep1}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Popup_Alllocate
    ${data_verify_popup_alllocate}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_popup_alllocate}
    
    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Check_Office
    ${data_verify_checkoffice_keyinstep2}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_checkoffice_keyinstep2}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Key2_Main
    ${data_verify_keyinstep2_main_title}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_keyinstep2_main_title}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Key2_Title
    ${data_verify_keyinstep2_title}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_keyinstep2_title}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Key2_Orther
    ${data_verify_keyinstep2_title_orther}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_keyinstep2_title_orther}
    
    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Call
    ${data_step_verify_call}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_step_verify_call}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_Judment
    ${data_step_verify_judment}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_step_verify_judment}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Ver_Viewcustomer
    ${data_Step_shouldbe_viewcustomer}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_Step_shouldbe_viewcustomer}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Ver_Verifycall
    ${data_step_shouldbe_ver_verifycall}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_step_shouldbe_ver_verifycall}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Verify_condition
    ${data_verify_condition}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_verify_condition}


GET ALL DATA FROM EXCEL MIGRATE APPLY PROCESS RL
    [Arguments]    ${excel}

    ${data_excel}    reader.Read and set value from excel new    ${share_drive}${excel}    F_0001
    ${RL_migrate_apply_process_RL_F_0001}    BuiltIn.Set Variable      ${data_excel}[0]     
    BuiltIn.Set global Variable      ${RL_migrate_apply_process_RL_F_0001}

    ${data_excel}    reader.Read and set value from excel new    ${share_drive}${excel}    F_0007
    ${RL_migrate_apply_process_RL_F_0007}    BuiltIn.Set Variable      ${data_excel}[0]   
    BuiltIn.Set global Variable      ${RL_migrate_apply_process_RL_F_0007}

    ${data_excel}    reader.Read and set value from excel new    ${share_drive}${excel}    F_0016   
    ${RL_migrate_apply_process_RL_F_0016}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${RL_migrate_apply_process_RL_F_0016}

    ${data_excel}    reader.Read and set value from excel new    ${share_drive}${excel}    F_0016_speed_time
    ${RL_migrate_apply_process_RL_F_0016_speed_time}    BuiltIn.Set Variable      ${data_excel}[0]   
    BuiltIn.Set global Variable      ${RL_migrate_apply_process_RL_F_0016_speed_time}

    ${data_excel}    reader.Read and set value from excel new    ${share_drive}${excel}    F_0021 
    ${RL_migrate_apply_process_RL_F_0021}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${RL_migrate_apply_process_RL_F_0021}

    ${data_excel}    reader.Read and set value from excel new    ${share_drive}${excel}    F_0025
    ${RL_migrate_apply_process_RL_F_0025}    BuiltIn.Set Variable      ${data_excel}[0]     
    BuiltIn.Set global Variable      ${RL_migrate_apply_process_RL_F_0025}
    
    ${data_excel}    reader.Read and set value from excel new    ${share_drive}${excel}    F_0037
    ${RL_migrate_apply_process_RL_F_0037}    BuiltIn.Set Variable      ${data_excel}[0]     
    BuiltIn.Set global Variable      ${RL_migrate_apply_process_RL_F_0037}


GET ALL DATA FROM EXCEL PENDING
    [Arguments]    ${excel}
    
    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Virual_Umay+_Card
    ${data_keyinstep1_virual_umay_card}    BuiltIn.Set Variable      ${data_excel}[0]   
    BuiltIn.Set global Variable      ${data_keyinstep1_virual_umay_card}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Virual_Premier_Card  
    ${data_keyinstep1_virual_premier_card}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep1_virual_premier_card}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Umay+_Card
    ${data_keyinstep1_umay_card}    BuiltIn.Set Variable      ${data_excel}[0]  
    BuiltIn.Set global Variable      ${data_keyinstep1_umay_card}

    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Premier_Card
    ${data_keyinstep1_premier_card}    BuiltIn.Set Variable      ${data_excel}[0]
    BuiltIn.Set global Variable      ${data_keyinstep1_premier_card}


GET DATA STOCK FROM EXCEL
    [Arguments]     ${excel}

    ${excel_data_stock_id_card}      reader.Read and set value from excel new     ${share_drive}${excel}     Data_id_card   
        ${RL_data_stock_id_card}    BuiltIn.Set Variable      ${excel_data_stock_id_card}[0]
        BuiltIn.Set global Variable    ${RL_data_stock_id_card}
        ${count_row_excel_id_card}    BuiltIn.Set Variable      ${excel_data_stock_id_card}[1]
        BuiltIn.Set global Variable    ${count_row_excel_id_card}

    ${excel_data_stock_barcode}      reader.Read and set value from excel new     ${share_drive}${excel}     Data_barcode   
        ${RL_data_stock_barcode}    BuiltIn.Set Variable      ${excel_data_stock_barcode}[0]
        BuiltIn.Set global Variable    ${RL_data_stock_barcode}
        ${count_row_excel_barcode}    BuiltIn.Set Variable      ${excel_data_stock_barcode}[1]
        BuiltIn.Set global Variable    ${count_row_excel_barcode}

    ${excel_data_stock_card_Umay+}      reader.Read and set value from excel new     ${share_drive}${excel}     Data_card_Umay+   
        ${RL_data_stock_card_Umay+}    BuiltIn.Set Variable      ${excel_data_stock_card_Umay+}[0]
        BuiltIn.Set global Variable    ${RL_data_stock_card_Umay+}
        ${count_row_excel_card_Umay+}    BuiltIn.Set Variable      ${excel_data_stock_card_Umay+}[1]
        BuiltIn.Set global Variable    ${count_row_excel_card_Umay+}

    ${excel_data_stock_card_Umay+_Premire}      reader.Read and set value from excel new     ${share_drive}${excel}     Data_card_Umay+_Premire  
        ${RL_data_stock_card_Umay+_Premire}    BuiltIn.Set Variable      ${excel_data_stock_card_Umay+_Premire}[0]
        BuiltIn.Set global Variable    ${RL_data_stock_card_Umay+_Premire}
        ${count_row_excel_card_Umay+_Premire}    BuiltIn.Set Variable      ${excel_data_stock_card_Umay+_Premire}[1]
        BuiltIn.Set global Variable    ${count_row_excel_card_Umay+_Premire}


GET DATA ACTUAL RESULT FROM EXCEL
    [Arguments]     ${excel}    ${case}

    ${excel_data_actual_result}      reader.Read and set value from excel new     ${share_drive}${excel}     ${case}

    IF  '${excel_data_actual_result}[1]' == '0'  
        ${RL_excel_data_actual_result}    BuiltIn.Set Variable      ${excel_data_actual_result}[0]
        BuiltIn.Set global Variable    ${RL_excel_data_actual_result}

        ${count_row_excel_data_actual_result}    BuiltIn.Set Variable    ${excel_data_actual_result}[1]
        BuiltIn.Set global Variable    ${count_row_excel_data_actual_result}

    ELSE
        
        ${RL_excel_data_actual_result}    BuiltIn.Set Variable      ${excel_data_actual_result}[0]
        BuiltIn.Set global Variable    ${RL_excel_data_actual_result}

        ${count_row_excel_data_actual_result}    BuiltIn.Set Variable    ${excel_data_actual_result}[1]
        BuiltIn.Set global Variable    ${count_row_excel_data_actual_result}
        
    END


GET ALL DATA FROM EXCEL MARTRIX
    [Arguments]    ${excel}
    
    ${data_excel}      reader.Read and set value from excel new     ${share_drive}${excel}     Matrix_test_case
    ${data_matrix_test_case}    BuiltIn.Set Variable      ${data_excel}[0]  
    BuiltIn.Set global Variable      ${data_matrix_test_case}  

