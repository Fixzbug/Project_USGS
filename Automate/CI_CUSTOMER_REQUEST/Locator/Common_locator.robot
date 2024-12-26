*** Variables ***

# Intranet
${url_intranet}                           http://intranet/siamac/www/default.aspx?Popup=Y
${btn_sso}                                //img[@src='../image/Header/icon_sso.png']
${verify_header_locator}                  //div[@class='card-header text-center']
${label_verify_header}                    //label[@id='lbl_HeaderName']
${label_verify_username}                  //label[@id='header_UserName']
${label_verify_branch}                    //label[@id='header_Brach']

# ${label_verrify_header}                   //label[@id='lbl_HeaderName']
# ${label_verrify_username}                 //label[@id='header_UserName']
# ${label_verrify_branch}                   //label[@id='header_Brach']

${Locator_SSO_Username}                   //input[@name="txtUsername"]
${Locator_SSO_Password}                   //input[@name="password"]
${btn_SubmitSSO}                          //button[@class="btn btn-primary"]
${link_menu_project_locator}              //span[@class="link-primary"][contains(text(), '***replace***')][1]


# Browser
${browser_chrome}                         chrome    
${browser_edge}                           edge  
${browser_headlesschrome}                 headlesschrome

# LOGIN User Authentication
${sso_username_text_area}                 id=txtUsername
${sso_password_text_area}                 //input[@name='password']
${btn_login_on_user_authentication}       //button[@type='submit']

# Portal
${link_receive_and_withdraw}                        //div[@class='row']//span[text()='Receive And Withdraw']
# ${link_customer_request_system}                     //div[@class='row']//span[text()='***replace***']
${lbl_welcome_customer_request_screen_locator}      //label[text()='Welcome Customer Request Screen']

# Your connection is not private
${btn_your_connection_is_not_private_advance}            id=details-button
${btn_your_connection_is_not_private_proceed_link}        id=proceed-link

# Page select branch 
${sel_branch_locator}                               //select[@id='ddl_Branch']//option
${sel_branch_1_silom_locator}                       //select[@id='ddl_Branch']//option[text()='1 : SILOM']
${sel_branch_for_click_locator}                     //select[@id='ddl_Branch']//following-sibling::div
${txt_sel_locator}                                  //div[@class='chosen-search']//input
${btn_ok_cus_request_page_locator}                  //button[@onclick='OK_BranchOnClick()']


# Portal
${link_system}                          //span[@class='link-primary' and contains(text(),'***replace***')]
${menu_locator}                         //a[contains(.,'***replace***')]
${sub_menu_locator}                     //a[contains(.,'***replace***')]

# txt replace
${txt_replace}                     //td[contains(.,'***replace***')]
${txt_replace_locator}             //td[@class='sorting_1']//center

# Verify table
${select_select_locator}           //a[contains(.,'Select')]
${seq_locator}                     //th[contains(.,'Seq.')]
${select_locator}                  //th[contains(.,'Select')]
${customer_locator}                //th[contains(.,'Customer')]
${contract_no_locator}             //th[contains(.,'Contract No.')]
${req_no_locator}                  //th[contains(.,'Req. No.')]
${req_full_no_locator}             //th[contains(.,'Request No.')]
${type_locator}                    //th[contains(.,'Type')]
${status_locator}                  //th[contains(.,'Status')]
${code_locator}                    //th[contains(.,'Code')]
${pending_code_locator}            //th[contains(.,'Pending Code')]
${req_date_time_locator}           //th[contains(.,'Req. Date-Time')]
${req_full_date_time_locator}      //th[contains(.,'Request Date-Time')]
${req_by_locator}                  //th[contains(.,'Req. By')]
${req_full_by_locator}             //th[contains(.,'Request By')]
${result_date_time_locator}        //th[contains(.,'Result Date-Time')]
${result_by_locator}               //th[contains(.,'Result By')]
${req_branch_locator}              //th[contains(.,'Req. Branch')]
${pending_day_locator}             //th[contains(.,'Pending Day')]
${result_by_interview_locator}     //th[contains(.,'Result By Interview')]
${result_by_kessai_locator}        //th[contains(.,'Result By Kessai')]
${old_rcl_locator}                 //th[contains(.,'Old RCL')]
${new_rcl_locator}                 //th[contains(.,'New RCL')]
${old_salary_locator}              //th[contains(.,'Old Salary')]
${new_salary_locator}              //th[contains(.,'New Salary')]

# text verify by id
${txt_id_number_locator}            //label[@id='txtidNum']
${txt_result_date_locator}          //label[@id='txtResultdate']
${txt_request_by_locator}           //label[@id='txtReqby']
${txt_page_request_date_locator}    //label[@id='txtReqdate']
${txt_customer_name_locator}        //label[@id='txtCusName']
${txt_contract_no_locator}          //label[@id='txtContNo']
${txt_status_locator}               //label[@id='txtStsCode']
${txt_card_type_locator}            //label[@id='txtCardType']
${txt_card_no_locator}              //label[@id='txtCardNo']
${txt_due_date_locator}             //label[@id='txtDueDate']
${txt_printer_locator}              //label[@id='txtPrinternme']
${txt_credit_limit_locator}         //label[@id='txtcrdLimit']
${txt_credit_available_locator}     //label[@id='txtcrdAvlible']
${txt_rl_limit_locator}             //label[@id='txtrlLimit']
${txt_rl_available_locator}         //label[@id='txtrlAvlible']
${txt_outstanding_bal_locator}      //label[@id='txtoutStand']
${txt_duty_bureau_locator}          //label[@id='txtDuty']
${txt_payment_fee_locator}          //label[@id='txtpayFee']
${txt_re_issue_fee_locator}         //label[@id='txtreissueFee']
${txt_handling_fee_locator}         //label[@id='txthandFee']
${txt_transaction_fee_locator}      //label[@id='txttranFee']
${txt_transaction_checkup_locator}  //label[@id='txttranChkup']
${txt_ar2_fee_locator}              //label[@id='txtarFee']
${txt_closing_reason_locator}       //div[@id='ddl_closeReason_chosen']//span
${select_closing_reason_locator}    //div[@id='ddl_closeReason_chosen']
${txt_slide_card}                   //label[@id='txtSlidCard']
${txt_re1_card}                     //label[@id='txtReCardNo']
${txt_re2_card}                     //label[@id='txtReCardNo2']
${txt_re3_card}                     //label[@id='txtReCardNo3']
${txt_re4_card}                     //label[@id='txtReCardNo4']

# input
${input_slide_card}                 //input[@id='txtSlidCard']
${input_re1_card}                   //input[@id='txtReCardNo']
${input_re2_card}                   //input[@id='txtReCardNo2']
${input_re3_card}                   //input[@id='txtReCardNo3']
${input_re4_card}                   //input[@id='txtReCardNo4']

# Verify popup error
${lbl_error_tc_002_locator}            //div[text()='Can not close contract due to exist other expense.']
${lbl_error_tc_003_locator}            //div[text()='ไม่สามารถ Create Request Change RCL ได้กรุณาตรวจสอบ Request Pending..!!']
${lbl_error_tc_004_locator}            //div[text()='ไม่สามารถ Create Request Closing RL1 Contract ได้กรุณาตรวจสอบยอดหนี้ที่ต้องชำระอีกครั้ง..!!']
${lbl_error_tc_006_locator}            //div[text()='Not Found Contract No.']
${lbl_error_data_not_found_locator}    //div[text()='Data Not Found']
