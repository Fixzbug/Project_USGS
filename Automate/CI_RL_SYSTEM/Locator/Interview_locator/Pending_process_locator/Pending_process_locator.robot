*** Variables ***

${txt_ID_no_pending_process_locator}    //input[@id='txt_s_ID']
${txt_app_no_pending_process_locator}    //input[@id='txt_s_appNo']
${txt_pending_user_pending_process_locator}    //input[@id='txt_user']
${txt_pending_date_pending_process_locator}    //input[@id='txt_pdDate']
${btn_search_pending_process_locator}    //button[@id='btn_srcPD']
${btn_clear_pending_process_locator}    //button[@id='btn_clear']
${btn_select_pending_process_locator}    //table[@id='tb_pending']//a[@class='btn_sel']
${btn_cancel_pending_process_locator}    //table[@id='tb_pending']//a[@class='btn_can']
${btn_reject_pending_process_locator}    //table[@id='tb_pending']//a[@class='btn_rej']
${btn_viewnote_pending_process_locator}    //table[@id='tb_pending']//a[@class='btn_viewnote']
${btn_viewDoc_pending_process_locator}    //table[@id='tb_pending']//a[@class='btn_viewDoc']
${btn_save_note_reject_pending_process_locator}    //button[@id='btn_addNote']

${dropdown_result_reject_pending_process_locator}    //div[@id='dd_result_chosen']
${for_replace_data_result_reject_pending_process_locator}    //div[@id='dd_result_chosen']//li[contains(text(),'***replace***')]

${txt_desciption_reject_pending_process_locator}    //textarea[@id='txt_noteD']
${btn_ok_send_sms_reject_pending_process_locator}    //button[@id='btn_OK']