*** Variables ***

# Request closing contract
${lbl_menu_sidebar_closing_contract_locator}         //li[@id='MenuHeader2']
${lbl_sup_menu_sidebar_closing_contract_locator}     //ul[@class='nav child_menu']//a[text()='Closing Contract']
${input_txt_id_number_locator}                       //input[@id='txtidNum']

# Title label
${request_page_id_number_locator}                    //label[contains(., 'ID Number :')]
${request_page_customer_name_locator}                //label[contains(., 'Customer Name :')]
${request_page_contract_no_locator}                  //label[contains(., 'Contract No. :')]
${request_page_status_locator}                       //label[contains(., 'Status :')]
${request_page_card_no_locator}                      //label[contains(., 'Card No. :')]
${request_page_due_date_locator}                     //label[contains(., 'Due Date :')]
${request_page_credit_limit_locator}                 //label[contains(., 'Credit Limit :')]
${request_page_credit_available_locator}             //label[contains(., 'Credite Available :')]
${request_page_rl_limit_locator}                     //label[contains(., 'RL Limit :')]
${request_page_rl_available_locator}                 //label[contains(., 'RL Available :')]
${request_page_outstanding_bal_locator}              //label[contains(., 'Outstanding Bal. :')]
${request_page_duty_bureau_locator}                  //label[contains(., 'Duty + Bureau :')]
${request_page_payment_fee_locator}                  //label[contains(., 'Payment Fee :')]
${request_page_re_issue_fee_locator}                 //label[contains(., 'Re-issue Fee :')]
${request_page_handling_fee_locator}                 //label[contains(., 'Handling Fee :')]
${request_page_transaction_fee_locator}              //label[contains(., 'Transaction Fee :')]
${request_page_transaction_checkup_locator}          //label[contains(., 'Transaction Check up :')]
${request_page_ar2_fee_locator}                      //label[contains(., 'AR2 Fee :')]
${request_page_closing_reason_locator}               //label[contains(., 'Closing Reason :')]

# Button
${btn_search}                                        //button[@id='btnFindCust']
${btn_save_id}                                       //button[@id='btnSummit']
${btn_confirm_ok_id}                                 //button[@id='btnConfirmOK']
${btn_confirm_cancel_id}                             //button[@id='btnConfirmCC']

# Label
${sel_close_reason_locator}                          //div[@id='ddl_closeReason_chosen']
${lbl_close_reason_locator}                          //div[@id='ddl_closeReason_chosen']//li
${lbl_default_close_reason_locator}                  //div[@id='ddl_closeReason_chosen']//span
${txt_close_reason_locator}                          //div[@id='ddl_closeReason_chosen']//input

# Popup modal
${modal_verify_customer}                             //h4[@class='modal-title' and text()='Verify Customer']
${modal_table_chkbox}                                //input[@class='Chkboxtrue']
${modal_table_chkbox_replace}                        //input[@class='Chkboxtrue' and @id='***replace***']
${chkbox1_true_xpath}                                //input[@class='Chkboxtrue' and @id='chkquestiontrue1']
${chkbox1_false_disable_xpath}                       //input[@class='Chkboxfalse' and @id='chkquestionfalse1' and @disabled='disabled']
${chkbox2_true_xpath}                                //input[@class='Chkboxtrue' and @id='chkquestiontrue2']
${chkbox2_false_disable_xpath}                       //input[@class='Chkboxfalse' and @id='chkquestionfalse2' and @disabled='disabled']
${chkbox3_true_xpath}                                //input[@class='Chkboxtrue' and @id='chkquestiontrue3']
${chkbox3_false_disable_xpath}                       //input[@class='Chkboxfalse' and @id='chkquestionfalse3' and @disabled='disabled']
${chkbox1_false_xpath}                               //input[@class='Chkboxfalse' and @id='chkquestionfalse1']
${chkbox1_true_disable_xpath}                        //input[@class='Chkboxtrue' and @id='chkquestiontrue1' and @disabled='disabled']
${chkbox2_false_xpath}                               //input[@class='Chkboxfalse' and @id='chkquestionfalse2']
${chkbox2_true_disable_xpath}                        //input[@class='Chkboxtrue' and @id='chkquestiontrue2' and @disabled='disabled']

${lbl_verify_customer_locator}                       //h4[text()='Verify Customer']
${btn_close_question_popup_locator}                  //h4[text()='Verify Customer']/../button[@class='close']
${btn_clear_locator}                                 //button[@onclick='ClearOnClick()']
${btn_pass_question_popup_locator}                   //button[@id='btnPass']
${btn_not_pass_question_popup_locator}               //button[@id='btnNotPass']

# Popup KYC
${lbl_save_kyc_note_success_locator}                 //div[text()='Save KYC Note Success']
${lbl_save_kyc_save_locator}                         //div[@class='ui-pnotify-text' and contains(text(),'Save Complete')]

# Popup modal
${modal_verify_confirm_request}                      //h4[@class='modal-title' and text()='Confirm Request']
${modal_verify_save_complete}                        //label[@id='txtResultTitle' and text()='Save Complete']
${lbl_request_no_locator}                            //label[@id='txtResultMsg']
${btn_ok_request_no_locator}                         //button[@id='btnOK']


