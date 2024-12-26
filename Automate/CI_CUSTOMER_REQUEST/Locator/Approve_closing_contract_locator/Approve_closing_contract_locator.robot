*** Variables ***

# Approve Request
${lbl_menu_sidebar_approve_request_locator}          //li[@id='MenuHeader3']
${lbl_sup_menu_sidebar_approve_request_locator}      //ul[@class='nav child_menu']//a[text()='Approve Closing Contract']
${label_verify_header}                               //label[@id='lbl_HeaderName']
${label_verify_username}                             //label[@id='header_UserName']
${label_verify_branch}                               //label[@id='header_Brach']
${btn_search_locator}                                //button[@id='btnSearch']    
${btn_reset_locator}                                 //button[@id='btnReset']
${tbl_customer_data_locator}                         //table[@id='dgvCRTracking']//tbody//td
${txt_verify_no_data}                                //td[contains(.,'No data available in table')]
${txt_seq_locator}                                   //td[@class='sorting_1']

# input
${approve_page_txt_id_number_locator}                //input[@id='txtCustid']
${approve_page_txt_contract_no_locator}              //input[@id='txtContNo']
${approve_page_txt_date_from_locator}                //input[@id='txtDateFrom']
${approve_page_txt_date_to_locator}                  //input[@id='txtDateTo']

# verify
${approve_page_lbl_id_number_locator}                //label[contains(., 'ID Number :')]
${approve_page_lbl_contract_no_locator}              //label[contains(., 'Contract No :')]
${approve_page_lbl_date_from_locator}                //label[contains(., 'Date From :')]
${approve_page_lbl_date_to_locator}                  //label[contains(., 'Date To :')]

# select on table step 1
${btn_select_on_table}                               //a[contains(.,'Select')]

# title label
${approve_page_id_number_locator}            //label[contains(., 'ID Number :')]
${approve_page_result_date_locator}          //label[contains(., 'Result Date :')]
${approve_page_request_by_locator}           //label[contains(., 'Request By :')]
${approve_page_request_date_locator}         //label[contains(., 'Request Date :')]
${approve_page_customer_name_locator}        //label[contains(., 'Customer Name :')]
${approve_page_contract_no_locator}          //label[contains(., 'Contract No. :')]
${approve_page_status_locator}               //label[contains(., 'Status :')]
${approve_page_card_no_locator}              //label[contains(., 'Card No. :')]
${approve_page_due_date_locator}             //label[contains(., 'Due Date :')]
${approve_page_credit_limit_locator}         //label[contains(., 'Credit Limit :')]
${approve_page_credit_available_locator}     //label[contains(., 'Credite Available :')]
${approve_page_rl_limit_locator}             //label[contains(., 'RL Limit :')]
${approve_page_rl_available_locator}         //label[contains(., 'RL Available :')]
${approve_page_outstanding_bal_locator}      //label[contains(., 'Outstanding Bal. :')]
${approve_page_duty_bureau_locator}          //label[contains(., 'Duty + Bureau :')]
${approve_page_payment_fee_locator}          //label[contains(., 'Payment Fee :')]
${approve_page_re_issue_fee_locator}         //label[contains(., 'Re-issue Fee :')]
${approve_page_handling_fee_locator}         //label[contains(., 'Handling Fee :')]
${approve_page_transaction_fee_locator}      //label[contains(., 'Transaction Fee :')]
${approve_page_transaction_checkup_locator}  //label[contains(., 'Transaction Check up :')]
${approve_page_ar2_fee_locator}              //label[contains(., 'AR2 Fee :')]
${approve_page_closing_reason_locator}       //label[contains(., 'Closing Reason :')]

${input_txt_id_number_locator}            //input[@id='txtidNum']
${input_approve_txt_id_number_locator}            //input[@id='txtCustid']

# page approve
${btn_approve_id}           //button[@id='btnApprove']
${btn_reject_id}            //button[@id='btnReject']
${btn_cancel_id}            //button[@id='btnCancel']

# modal reject reason
${lbl_verify_rejct_reson_locator}                  //h4[contains(.,'Reject Reason')]
${lbl_sel_action_rejct_reson_locator}              //label[contains(., 'Action Code :')]
${sel_action_rejct_reson_locator}                  //div[@id='dd_action_code_chosen']
${txt_action_rejct_reson_locator}                  //div[@id='dd_action_code_chosen']//input

${lbl_sel_rejct_reson_locator}                     //label[contains(., 'Reason Code :')]
${sel_rejct_reson_locator}                         //div[@id='dd_reason_code_chosen']
${txt_rejct_reson_locator}                         //div[@id='dd_reason_code_chosen']//input
${txt_area_reson_locator}                          //textarea[@id='txtDesc']
${btn_reson_ok_locator}                            //button[@id='btnReasonOK']
${lbl_save_note_success_locator}                   //div[text()='Save Note Success']

# modal confirm Approve
${lbl_verify_approve_locator}                      //h4[contains(.,'Confirm Approve')]
${btn_approve_ok_locator}                          //button[@onclick="modalbtnConfirmApp('Y')"]
${btn_approve_cancel_locator}                      //button[@onclick="modalbtnConfirmApp('N')"]

# modal save complete
${lbl_verify_savecomplete_locator}                 //label[contains(.,'Save Complete')]
${lbl_verify_req_no_locator}                       //label[@id='txtResultMsg']    
${btn_save_complete_ok_locator}                    //button[@id='btnOK']
