*** Variables ***

${Mode_Process_Locator}    //select[@id="modeProcess"]
${Confirm_Locator}    id=btn-confirm
${Branch_Chosen_Locator}    //div[@id="ddl_Branch_chosen"]
${Ok_Branch_Locator}    //button[@onclick="OK_BranchOnClick()"]
${Icon_Menu_Change_Priority_Locator}    //a[contains(text(),'CHANGE PRIORITY')]
${txt_IDno_Locator}    id=txtPriorityIdNo
${Btn_Search_Locator}    //button[@onclick="SearchPriorityData()"]
${Btn_Hidepdpa}    //button[@id="btn_hideByPdpa"]
${btn_cancel_change_priority_locator}    //button[text()="Cancel"]
${btn_view_customer_verify_call_judgement}    //a[@onclick="MenuOnClick('VIEW CUSTOMER/VERIFY CALL/JUDGMENT (KESSAI)','200','/Inquiry/InquiryViewCust_INT')"]
${Locator_Relace_ID_Changepriority}    //td[contains(text(),'***replace***')]/preceding-sibling::td/button
${Locator_ChangePriority_Boten}    //div[@id="selPriorityBranch_chosen"]
${Locator_ChangePriority_Card}    //div[@id="selPrioritySection_chosen"]
${Locator_ChangePriority_Team}    //div[@id="selPriorityTeam_chosen"]
${Locator_ChangePriority_User}    //div[@id="selPriorityChangeTo_chosen"]

#Change_priority popup
# Dropdown
${Dropdown_Mode_Process}    //select[@id="modeProcess"]
${Dropdown_Branch_Loop}    //div[@id="ddl_Branch_chosen"]//li[contains(text(),'***replace***')][1]
${Dropdown_Changepriority_Boten}    //div[@id="selPriorityBranch_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Changepriority_Card}    //div[@id="selPrioritySection_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Changepriority_Team}    //div[@id="selPriorityTeam_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Changepriority_User}    //div[@id="selPriorityChangeTo_chosen"]//li[contains(text(),'***replace***')]
${follow_up_date}    //div[@id='txtFolloeDateTime']
${lbl_last_user_change_priority_locator}    //span[@id='txtLastUser']
${lbl_send_case_change_priority_locator}    //div[@class='box-body']//div[contains(text(),'Send Case')]//following-sibling::div

#table
${lbl_data_table_change_priority_locator}    //table[@id='tbChangePriority']//tbody//td
${txt_app_no}    //input[@id='txtPriorityAppNo']
${input_txt_app_no}    //input[@id='txtPriorityAppNo']
${app_no_btn_search}    //button[@onclick='SearchPriorityData()']
${select_seq_at_table}     //button[@class="btn btn-link"]
${sele_branch}    //*[@id="ddl_Branch_chosen"]/div/div/input
${modal_change_boten}    id=lblModal_ChangePriority
${popup_success_change_priority}    //div[@class="ui-pnotify-text" and contains(text(),'Save data success.')]