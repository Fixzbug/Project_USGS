*** Variables ***
${menu_inquiry_application_locator}    //a[contains(@onclick,"INQUIRY APPLICATION'")]
${txt_id_no_inquiry_locator}    //input[@id='txt_s_ID']
${btn_search_inquiry_locator}    //button[@id='btn_srcPD']
${btn_select_locator}    //a[@class='btn_sel']
${lbl_app_no_inquiry_locator}    //tbody//tr//td[3]
${txt_name_inquiry_locator}    //input[@id='txt_fName']
${lbl_name_in_data_gid_inquiry_locator}    //td[@class='fullname'][contains(.,'***replace***')]
${txt_surname_inquiry_locator}    //input[@id='txt_lName']
${btn_clear_inquiry_locator}     //button[@id='btn_clear']
${lbl_cus_type_inquiry_locator}    //label[@id='lb_custType'][contains(.,'***replace***')]
${lbl_loan_type_inquiry_locator}    //label[@id='lb_LnTyp'][contains(.,'***replace***')]
${lbl_card_no_inquiry_locator}    //label[@id='lb_preCard'][contains(.,'***replace***')]
${lbl_application_detail_inquiry_locator}    //div[@class='x_content']//label[@id]
${lbl_please_input_data_before_search}    //div[contains(.,'Please input data before search')]/../h4[text()='warning']
${btn_speed_time_step_inquiry_locator}    //a[@data-toggle='tab'][contains(.,'Speed')]
${lbl_speed_time_step_key_in_step_1_2_inquiry_locator}    //table[@id='tab_KeyStep']//td
${lbl_speed_time_step_verify_call_inquiry_locator}    //table[@id='tab_Ver']//td
${lbl_speed_time_step_judment_inquiry_locator}    //table[@id='tab_Judg']//td